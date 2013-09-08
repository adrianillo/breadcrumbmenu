//requiere jquery, mootools-core.js y mootools-core.js
jQuery.extend({
    breadcrumb: function (selector, o) {
        this.s = o;
        mee=this;
        if (o.dinamic != null)
            this.dinamic = o.dinamic;
        else
            this.dinamic = false;
            
        if (o.classcrum != null)
            this.classcrum = o.classcrum;
        else
            this.classcrum = '';
            
        if (o.classbread != null)
            this.classbread = o.classbread;
        else
            this.classbread = '';            
            
        if (o.imgarrow != null)
            this.imgarrow = o.imgarrow;
        else
            this.imgarrow = '';
            
       if (o.classarrow != null)
            this.classarrow = o.classarrow;
        else
            this.classarrow = '';
            
       if (o.autocrum != null)
            this.autocrum = o.autocrum;
        else
            this.autocrum = false;            
            
          if(o.classcrum!= null)
            $(document.getElementById(selector)).addClass(o.classbread);
            
        listitembread = [];
        content = $("#" + selector);

        paintbreadcrumb = function () {
            $(content).html('');
            $(listitembread).each(function (i, oo) {
            
                var aa = new Element('a')
                .inject(document.getElementById(selector));
                
                if(o.classcrum!= null)
                    $(aa).addClass(o.classcrum); 
                    
                if(o.imgarrow!= null)
                {
                    $(aa).text(oo.textitem );
                     if(listitembread.length-1>i)
                     {                         
                         var im = new Element('img');
                         im.src=o.imgarrow;
                         if(o.classarrow!= null)
                              $(im).addClass(o.classarrow); 
                         im.inject(aa);
                     }
                  
                }                    
                else
                    $(aa).text(oo.textitem );
                 
                $(aa).bind('click', function () {
                   $.crumclick(o,aa,oo,i);
                });
                                
            });
        };
        this.addcrum = function (l) {
            listitembread.push(l);
            paintbreadcrumb();
        };
        this.removecrum = function () {
            listitembread.pop();
            paintbreadcrumb();
        };
        this.changecrum = function (l) {
            this.removecrumwithoutpaint();
            this.addcrum(l)
        };
        this.removecrumwithoutpaint = function () {
            listitembread.pop();
        };
        this.removeto=function (i)
        {
        var to=listitembread.length-i;
            for(var j=1;j<to;j++)
                this.removecrumwithoutpaint();
            paintbreadcrumb();
        }

    },
    itembread: function (textitem,functioncrum,args) {
        this.textitem = textitem;
        this.functioncrum = function (ooo,ele,oo,i) {};
        if(functioncrum!=null)
            this.functioncrum =functioncrum;
        this.args=args;
    },
    crumclick: function (ooo,ele,oo,i) {
        s = jQuery.extend({}, jQuery.ajaxSettings, ooo);
        
        if(ooo.autocrum)
            mee.removeto(i);
       
        if (s.crumclick)
            s.crumclick(oo,ele);
    }



});
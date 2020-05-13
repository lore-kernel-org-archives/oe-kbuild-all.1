Content-Type: multipart/mixed; boundary="===============8005354998718539735=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2] video: fbdev: ssd1307fb: Added support to Column offset
Date: Thu, 14 May 2020 04:58:01 +0800
Message-ID: <202005140438.oldRkjKj%lkp@intel.com>
In-Reply-To: <1589388975-15499-1-git-send-email-alencar.fmce@imbel.gov.br>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8005354998718539735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rodrigo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20200512]
[cannot apply to robh/for-next linus/master linux/master v5.7-rc5 v5.7-rc4 =
v5.7-rc3 v5.7-rc5]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Rodrigo-Rolim-Mendes-de-Al=
encar/video-fbdev-ssd1307fb-Added-support-to-Column-offset/20200514-010137
base:    e098d7762d602be640c53565ceca342f81e55ad2
config: parisc-randconfig-r022-20200513 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dparisc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

drivers/video/fbdev/ssd1307fb.c: In function 'ssd1307fb_probe':
>> drivers/video/fbdev/ssd1307fb.c:630:31: error: 'node' undeclared (first =
use in this function); did you mean 'inode'?
630 |  if (device_property_read_u32(node, "solomon,col-offset", &par->col_o=
ffset))
|                               ^~~~
|                               inode
drivers/video/fbdev/ssd1307fb.c:630:31: note: each undeclared identifier is=
 reported only once for each function it appears in

vim +630 drivers/video/fbdev/ssd1307fb.c

   579	=

   580	static int ssd1307fb_probe(struct i2c_client *client)
   581	{
   582		struct device *dev =3D &client->dev;
   583		struct backlight_device *bl;
   584		char bl_name[12];
   585		struct fb_info *info;
   586		struct fb_deferred_io *ssd1307fb_defio;
   587		u32 vmem_size;
   588		struct ssd1307fb_par *par;
   589		void *vmem;
   590		int ret;
   591	=

   592		info =3D framebuffer_alloc(sizeof(struct ssd1307fb_par), dev);
   593		if (!info)
   594			return -ENOMEM;
   595	=

   596		par =3D info->par;
   597		par->info =3D info;
   598		par->client =3D client;
   599	=

   600		par->device_info =3D device_get_match_data(dev);
   601	=

   602		par->reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
   603		if (IS_ERR(par->reset)) {
   604			dev_err(dev, "failed to get reset gpio: %ld\n",
   605				PTR_ERR(par->reset));
   606			ret =3D PTR_ERR(par->reset);
   607			goto fb_alloc_error;
   608		}
   609	=

   610		par->vbat_reg =3D devm_regulator_get_optional(dev, "vbat");
   611		if (IS_ERR(par->vbat_reg)) {
   612			ret =3D PTR_ERR(par->vbat_reg);
   613			if (ret =3D=3D -ENODEV) {
   614				par->vbat_reg =3D NULL;
   615			} else {
   616				dev_err(dev, "failed to get VBAT regulator: %d\n", ret);
   617				goto fb_alloc_error;
   618			}
   619		}
   620	=

   621		if (device_property_read_u32(dev, "solomon,width", &par->width))
   622			par->width =3D 96;
   623	=

   624		if (device_property_read_u32(dev, "solomon,height", &par->height))
   625			par->height =3D 16;
   626	=

   627		if (device_property_read_u32(dev, "solomon,page-offset", &par->page=
_offset))
   628			par->page_offset =3D 1;
   629	=

 > 630		if (device_property_read_u32(node, "solomon,col-offset", &par->col_=
offset))
   631			par->col_offset =3D 0;
   632	=

   633		if (device_property_read_u32(dev, "solomon,com-offset", &par->com_o=
ffset))
   634			par->com_offset =3D 0;
   635	=

   636		if (device_property_read_u32(dev, "solomon,prechargep1", &par->prec=
hargep1))
   637			par->prechargep1 =3D 2;
   638	=

   639		if (device_property_read_u32(dev, "solomon,prechargep2", &par->prec=
hargep2))
   640			par->prechargep2 =3D 2;
   641	=

   642		if (!device_property_read_u8_array(dev, "solomon,lookup-table",
   643						   par->lookup_table,
   644						   ARRAY_SIZE(par->lookup_table)))
   645			par->lookup_table_set =3D 1;
   646	=

   647		par->seg_remap =3D !device_property_read_bool(dev, "solomon,segment=
-no-remap");
   648		par->com_seq =3D device_property_read_bool(dev, "solomon,com-seq");
   649		par->com_lrremap =3D device_property_read_bool(dev, "solomon,com-lr=
remap");
   650		par->com_invdir =3D device_property_read_bool(dev, "solomon,com-inv=
dir");
   651		par->area_color_enable =3D
   652			device_property_read_bool(dev, "solomon,area-color-enable");
   653		par->low_power =3D device_property_read_bool(dev, "solomon,low-powe=
r");
   654	=

   655		par->contrast =3D 127;
   656		par->vcomh =3D par->device_info->default_vcomh;
   657	=

   658		/* Setup display timing */
   659		if (device_property_read_u32(dev, "solomon,dclk-div", &par->dclk_di=
v))
   660			par->dclk_div =3D par->device_info->default_dclk_div;
   661		if (device_property_read_u32(dev, "solomon,dclk-frq", &par->dclk_fr=
q))
   662			par->dclk_frq =3D par->device_info->default_dclk_frq;
   663	=

   664		vmem_size =3D DIV_ROUND_UP(par->width, 8) * par->height;
   665	=

   666		vmem =3D (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
   667						get_order(vmem_size));
   668		if (!vmem) {
   669			dev_err(dev, "Couldn't allocate graphical memory.\n");
   670			ret =3D -ENOMEM;
   671			goto fb_alloc_error;
   672		}
   673	=

   674		ssd1307fb_defio =3D devm_kzalloc(dev, sizeof(*ssd1307fb_defio),
   675					       GFP_KERNEL);
   676		if (!ssd1307fb_defio) {
   677			dev_err(dev, "Couldn't allocate deferred io.\n");
   678			ret =3D -ENOMEM;
   679			goto fb_alloc_error;
   680		}
   681	=

   682		ssd1307fb_defio->delay =3D HZ / refreshrate;
   683		ssd1307fb_defio->deferred_io =3D ssd1307fb_deferred_io;
   684	=

   685		info->fbops =3D &ssd1307fb_ops;
   686		info->fix =3D ssd1307fb_fix;
   687		info->fix.line_length =3D DIV_ROUND_UP(par->width, 8);
   688		info->fbdefio =3D ssd1307fb_defio;
   689	=

   690		info->var =3D ssd1307fb_var;
   691		info->var.xres =3D par->width;
   692		info->var.xres_virtual =3D par->width;
   693		info->var.yres =3D par->height;
   694		info->var.yres_virtual =3D par->height;
   695	=

   696		info->screen_buffer =3D vmem;
   697		info->fix.smem_start =3D __pa(vmem);
   698		info->fix.smem_len =3D vmem_size;
   699	=

   700		fb_deferred_io_init(info);
   701	=

   702		i2c_set_clientdata(client, info);
   703	=

   704		if (par->reset) {
   705			/* Reset the screen */
   706			gpiod_set_value_cansleep(par->reset, 1);
   707			udelay(4);
   708			gpiod_set_value_cansleep(par->reset, 0);
   709			udelay(4);
   710		}
   711	=

   712		if (par->vbat_reg) {
   713			ret =3D regulator_enable(par->vbat_reg);
   714			if (ret) {
   715				dev_err(dev, "failed to enable VBAT: %d\n", ret);
   716				goto reset_oled_error;
   717			}
   718		}
   719	=

   720		ret =3D ssd1307fb_init(par);
   721		if (ret)
   722			goto regulator_enable_error;
   723	=

   724		ret =3D register_framebuffer(info);
   725		if (ret) {
   726			dev_err(dev, "Couldn't register the framebuffer\n");
   727			goto panel_init_error;
   728		}
   729	=

   730		snprintf(bl_name, sizeof(bl_name), "ssd1307fb%d", info->node);
   731		bl =3D backlight_device_register(bl_name, dev, par, &ssd1307fb_bl_o=
ps,
   732					       NULL);
   733		if (IS_ERR(bl)) {
   734			ret =3D PTR_ERR(bl);
   735			dev_err(dev, "unable to register backlight device: %d\n", ret);
   736			goto bl_init_error;
   737		}
   738	=

   739		bl->props.brightness =3D par->contrast;
   740		bl->props.max_brightness =3D MAX_CONTRAST;
   741		info->bl_dev =3D bl;
   742	=

   743		dev_info(dev, "fb%d: %s framebuffer device registered, using %d byt=
es of video memory\n", info->node, info->fix.id, vmem_size);
   744	=

   745		return 0;
   746	=

   747	bl_init_error:
   748		unregister_framebuffer(info);
   749	panel_init_error:
   750		if (par->device_info->need_pwm) {
   751			pwm_disable(par->pwm);
   752			pwm_put(par->pwm);
   753		}
   754	regulator_enable_error:
   755		if (par->vbat_reg)
   756			regulator_disable(par->vbat_reg);
   757	reset_oled_error:
   758		fb_deferred_io_cleanup(info);
   759	fb_alloc_error:
   760		framebuffer_release(info);
   761		return ret;
   762	}
   763	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8005354998718539735==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
xBACAA==
--===============8005354998718539735==--


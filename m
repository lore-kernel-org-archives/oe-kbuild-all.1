Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D154037E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 00:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVi+rH1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699317076; x=1730853076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3/DsFQGkFiIfvmmLI3LzBOflTM1xasKMEtAuey4Fcdk=;
  b=MVi+rH1koaCIvv984LbftytB5rLNdn0+VO0KbGcadDoRDGlQdILnz0pX
   0kBTwEkzG+19c7Op7yqHud24KZ2pVaPz2GC50NTaI53OQzlqQm+9JUn5s
   9NC3i1nvJQhBt9z1m7uvGRWT90/RIGNVF0dK9D3HyaI1weH9JHSCpSITa
   sN0jA6rnGafg0oWlnUKpyJoaSpsxwUU9+ILmT9q+H3IHGMmNC2rgu3LR4
   lapsLTV8X6BrpHOs1zsn+jZaHjqEjwEUy4yq9dFZUYuyTFAgwJ7w5STJn
   xP+IDTqE3sp9oQdOqGjuwQcAbNZYxwswOWpToNu8lk6eh4aPsprzjHWCk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="374426346"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="374426346"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 16:31:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="906227416"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="906227416"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Nov 2023 16:31:11 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r09zp-0006qb-2i;
	Tue, 07 Nov 2023 00:31:09 +0000
Date: Tue, 7 Nov 2023 08:30:17 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Helge Deller <deller@gmx.de>
Subject: [linux-next:master 16381/16504]
 drivers/video/fbdev/via/viafbdev.c:577:37: error: implicit declaration of
 function 'memdup_array_user'; did you mean 'memdup_user'?
Message-ID: <202311070852.xNOGDnzc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ff7a5781ceee3befb9224d29cef6e6a4766c5fe
commit: 2db836ba4bc3ee8e07b77e9f75f09f18ed158b96 [16381/16504] fbdev: viafb: use new array-copying-wrapper
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231107/202311070852.xNOGDnzc-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311070852.xNOGDnzc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311070852.xNOGDnzc-lkp@intel.com/

Note: the linux-next/master HEAD 3ff7a5781ceee3befb9224d29cef6e6a4766c5fe builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/video/fbdev/via/viafbdev.c: In function 'viafb_ioctl':
>> drivers/video/fbdev/via/viafbdev.c:577:37: error: implicit declaration of function 'memdup_array_user'; did you mean 'memdup_user'? [-Werror=implicit-function-declaration]
     577 |                 viafb_gamma_table = memdup_array_user(argp, 256, sizeof(u32));
         |                                     ^~~~~~~~~~~~~~~~~
         |                                     memdup_user
   drivers/video/fbdev/via/viafbdev.c:577:35: warning: assignment to 'u32 *' {aka 'unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     577 |                 viafb_gamma_table = memdup_array_user(argp, 256, sizeof(u32));
         |                                   ^
   cc1: some warnings being treated as errors


vim +577 drivers/video/fbdev/via/viafbdev.c

   379	
   380	static int viafb_ioctl(struct fb_info *info, u_int cmd, u_long arg)
   381	{
   382		union {
   383			struct viafb_ioctl_mode viamode;
   384			struct viafb_ioctl_samm viasamm;
   385			struct viafb_driver_version driver_version;
   386			struct fb_var_screeninfo sec_var;
   387			struct _panel_size_pos_info panel_pos_size_para;
   388			struct viafb_ioctl_setting viafb_setting;
   389			struct device_t active_dev;
   390		} u;
   391		u32 state_info = 0;
   392		u32 *viafb_gamma_table;
   393		char driver_name[] = "viafb";
   394	
   395		u32 __user *argp = (u32 __user *) arg;
   396		u32 gpu32;
   397	
   398		DEBUG_MSG(KERN_INFO "viafb_ioctl: 0x%X !!\n", cmd);
   399		printk(KERN_WARNING "viafb_ioctl: Please avoid this interface as it is unstable and might change or vanish at any time!\n");
   400		memset(&u, 0, sizeof(u));
   401	
   402		switch (cmd) {
   403		case VIAFB_GET_CHIP_INFO:
   404			if (copy_to_user(argp, viaparinfo->chip_info,
   405					sizeof(struct chip_information)))
   406				return -EFAULT;
   407			break;
   408		case VIAFB_GET_INFO_SIZE:
   409			return put_user((u32)sizeof(struct viafb_ioctl_info), argp);
   410		case VIAFB_GET_INFO:
   411			return viafb_ioctl_get_viafb_info(arg);
   412		case VIAFB_HOTPLUG:
   413			return put_user(viafb_ioctl_hotplug(info->var.xres,
   414						      info->var.yres,
   415						      info->var.bits_per_pixel), argp);
   416		case VIAFB_SET_HOTPLUG_FLAG:
   417			if (copy_from_user(&gpu32, argp, sizeof(gpu32)))
   418				return -EFAULT;
   419			viafb_hotplug = (gpu32) ? 1 : 0;
   420			break;
   421		case VIAFB_GET_RESOLUTION:
   422			u.viamode.xres = (u32) viafb_hotplug_Xres;
   423			u.viamode.yres = (u32) viafb_hotplug_Yres;
   424			u.viamode.refresh = (u32) viafb_hotplug_refresh;
   425			u.viamode.bpp = (u32) viafb_hotplug_bpp;
   426			if (viafb_SAMM_ON == 1) {
   427				u.viamode.xres_sec = viafb_second_xres;
   428				u.viamode.yres_sec = viafb_second_yres;
   429				u.viamode.virtual_xres_sec = viafb_dual_fb ? viafbinfo1->var.xres_virtual : viafbinfo->var.xres_virtual;
   430				u.viamode.virtual_yres_sec = viafb_dual_fb ? viafbinfo1->var.yres_virtual : viafbinfo->var.yres_virtual;
   431				u.viamode.refresh_sec = viafb_refresh1;
   432				u.viamode.bpp_sec = viafb_bpp1;
   433			} else {
   434				u.viamode.xres_sec = 0;
   435				u.viamode.yres_sec = 0;
   436				u.viamode.virtual_xres_sec = 0;
   437				u.viamode.virtual_yres_sec = 0;
   438				u.viamode.refresh_sec = 0;
   439				u.viamode.bpp_sec = 0;
   440			}
   441			if (copy_to_user(argp, &u.viamode, sizeof(u.viamode)))
   442				return -EFAULT;
   443			break;
   444		case VIAFB_GET_SAMM_INFO:
   445			u.viasamm.samm_status = viafb_SAMM_ON;
   446	
   447			if (viafb_SAMM_ON == 1) {
   448				if (viafb_dual_fb) {
   449					u.viasamm.size_prim = viaparinfo->fbmem_free;
   450					u.viasamm.size_sec = viaparinfo1->fbmem_free;
   451				} else {
   452					if (viafb_second_size) {
   453						u.viasamm.size_prim =
   454						    viaparinfo->fbmem_free -
   455						    viafb_second_size * 1024 * 1024;
   456						u.viasamm.size_sec =
   457						    viafb_second_size * 1024 * 1024;
   458					} else {
   459						u.viasamm.size_prim =
   460						    viaparinfo->fbmem_free >> 1;
   461						u.viasamm.size_sec =
   462						    (viaparinfo->fbmem_free >> 1);
   463					}
   464				}
   465				u.viasamm.mem_base = viaparinfo->fbmem;
   466				u.viasamm.offset_sec = viafb_second_offset;
   467			} else {
   468				u.viasamm.size_prim =
   469				    viaparinfo->memsize - viaparinfo->fbmem_used;
   470				u.viasamm.size_sec = 0;
   471				u.viasamm.mem_base = viaparinfo->fbmem;
   472				u.viasamm.offset_sec = 0;
   473			}
   474	
   475			if (copy_to_user(argp, &u.viasamm, sizeof(u.viasamm)))
   476				return -EFAULT;
   477	
   478			break;
   479		case VIAFB_TURN_ON_OUTPUT_DEVICE:
   480			if (copy_from_user(&gpu32, argp, sizeof(gpu32)))
   481				return -EFAULT;
   482			if (gpu32 & CRT_Device)
   483				via_set_state(VIA_CRT, VIA_STATE_ON);
   484			if (gpu32 & DVI_Device)
   485				viafb_dvi_enable();
   486			if (gpu32 & LCD_Device)
   487				viafb_lcd_enable();
   488			break;
   489		case VIAFB_TURN_OFF_OUTPUT_DEVICE:
   490			if (copy_from_user(&gpu32, argp, sizeof(gpu32)))
   491				return -EFAULT;
   492			if (gpu32 & CRT_Device)
   493				via_set_state(VIA_CRT, VIA_STATE_OFF);
   494			if (gpu32 & DVI_Device)
   495				viafb_dvi_disable();
   496			if (gpu32 & LCD_Device)
   497				viafb_lcd_disable();
   498			break;
   499		case VIAFB_GET_DEVICE:
   500			u.active_dev.crt = viafb_CRT_ON;
   501			u.active_dev.dvi = viafb_DVI_ON;
   502			u.active_dev.lcd = viafb_LCD_ON;
   503			u.active_dev.samm = viafb_SAMM_ON;
   504			u.active_dev.primary_dev = viafb_primary_dev;
   505	
   506			u.active_dev.lcd_dsp_cent = viafb_lcd_dsp_method;
   507			u.active_dev.lcd_panel_id = viafb_lcd_panel_id;
   508			u.active_dev.lcd_mode = viafb_lcd_mode;
   509	
   510			u.active_dev.xres = viafb_hotplug_Xres;
   511			u.active_dev.yres = viafb_hotplug_Yres;
   512	
   513			u.active_dev.xres1 = viafb_second_xres;
   514			u.active_dev.yres1 = viafb_second_yres;
   515	
   516			u.active_dev.bpp = viafb_bpp;
   517			u.active_dev.bpp1 = viafb_bpp1;
   518			u.active_dev.refresh = viafb_refresh;
   519			u.active_dev.refresh1 = viafb_refresh1;
   520	
   521			u.active_dev.epia_dvi = viafb_platform_epia_dvi;
   522			u.active_dev.lcd_dual_edge = viafb_device_lcd_dualedge;
   523			u.active_dev.bus_width = viafb_bus_width;
   524	
   525			if (copy_to_user(argp, &u.active_dev, sizeof(u.active_dev)))
   526				return -EFAULT;
   527			break;
   528	
   529		case VIAFB_GET_DRIVER_VERSION:
   530			u.driver_version.iMajorNum = VERSION_MAJOR;
   531			u.driver_version.iKernelNum = VERSION_KERNEL;
   532			u.driver_version.iOSNum = VERSION_OS;
   533			u.driver_version.iMinorNum = VERSION_MINOR;
   534	
   535			if (copy_to_user(argp, &u.driver_version,
   536				sizeof(u.driver_version)))
   537				return -EFAULT;
   538	
   539			break;
   540	
   541		case VIAFB_GET_DEVICE_INFO:
   542	
   543			retrieve_device_setting(&u.viafb_setting);
   544	
   545			if (copy_to_user(argp, &u.viafb_setting,
   546					 sizeof(u.viafb_setting)))
   547				return -EFAULT;
   548	
   549			break;
   550	
   551		case VIAFB_GET_DEVICE_SUPPORT:
   552			viafb_get_device_support_state(&state_info);
   553			if (put_user(state_info, argp))
   554				return -EFAULT;
   555			break;
   556	
   557		case VIAFB_GET_DEVICE_CONNECT:
   558			viafb_get_device_connect_state(&state_info);
   559			if (put_user(state_info, argp))
   560				return -EFAULT;
   561			break;
   562	
   563		case VIAFB_GET_PANEL_SUPPORT_EXPAND:
   564			state_info =
   565			    viafb_lcd_get_support_expand_state(info->var.xres,
   566							 info->var.yres);
   567			if (put_user(state_info, argp))
   568				return -EFAULT;
   569			break;
   570	
   571		case VIAFB_GET_DRIVER_NAME:
   572			if (copy_to_user(argp, driver_name, sizeof(driver_name)))
   573				return -EFAULT;
   574			break;
   575	
   576		case VIAFB_SET_GAMMA_LUT:
 > 577			viafb_gamma_table = memdup_array_user(argp, 256, sizeof(u32));
   578			if (IS_ERR(viafb_gamma_table))
   579				return PTR_ERR(viafb_gamma_table);
   580			viafb_set_gamma_table(viafb_bpp, viafb_gamma_table);
   581			kfree(viafb_gamma_table);
   582			break;
   583	
   584		case VIAFB_GET_GAMMA_LUT:
   585			viafb_gamma_table = kmalloc_array(256, sizeof(u32),
   586							  GFP_KERNEL);
   587			if (!viafb_gamma_table)
   588				return -ENOMEM;
   589			viafb_get_gamma_table(viafb_gamma_table);
   590			if (copy_to_user(argp, viafb_gamma_table,
   591				256 * sizeof(u32))) {
   592				kfree(viafb_gamma_table);
   593				return -EFAULT;
   594			}
   595			kfree(viafb_gamma_table);
   596			break;
   597	
   598		case VIAFB_GET_GAMMA_SUPPORT_STATE:
   599			viafb_get_gamma_support_state(viafb_bpp, &state_info);
   600			if (put_user(state_info, argp))
   601				return -EFAULT;
   602			break;
   603		case VIAFB_SYNC_SURFACE:
   604			DEBUG_MSG(KERN_INFO "lobo VIAFB_SYNC_SURFACE\n");
   605			break;
   606		case VIAFB_GET_DRIVER_CAPS:
   607			break;
   608	
   609		case VIAFB_GET_PANEL_MAX_SIZE:
   610			if (copy_from_user(&u.panel_pos_size_para, argp,
   611					   sizeof(u.panel_pos_size_para)))
   612				return -EFAULT;
   613			u.panel_pos_size_para.x = u.panel_pos_size_para.y = 0;
   614			if (copy_to_user(argp, &u.panel_pos_size_para,
   615			     sizeof(u.panel_pos_size_para)))
   616				return -EFAULT;
   617			break;
   618		case VIAFB_GET_PANEL_MAX_POSITION:
   619			if (copy_from_user(&u.panel_pos_size_para, argp,
   620					   sizeof(u.panel_pos_size_para)))
   621				return -EFAULT;
   622			u.panel_pos_size_para.x = u.panel_pos_size_para.y = 0;
   623			if (copy_to_user(argp, &u.panel_pos_size_para,
   624					 sizeof(u.panel_pos_size_para)))
   625				return -EFAULT;
   626			break;
   627	
   628		case VIAFB_GET_PANEL_POSITION:
   629			if (copy_from_user(&u.panel_pos_size_para, argp,
   630					   sizeof(u.panel_pos_size_para)))
   631				return -EFAULT;
   632			u.panel_pos_size_para.x = u.panel_pos_size_para.y = 0;
   633			if (copy_to_user(argp, &u.panel_pos_size_para,
   634					 sizeof(u.panel_pos_size_para)))
   635				return -EFAULT;
   636			break;
   637		case VIAFB_GET_PANEL_SIZE:
   638			if (copy_from_user(&u.panel_pos_size_para, argp,
   639					   sizeof(u.panel_pos_size_para)))
   640				return -EFAULT;
   641			u.panel_pos_size_para.x = u.panel_pos_size_para.y = 0;
   642			if (copy_to_user(argp, &u.panel_pos_size_para,
   643					 sizeof(u.panel_pos_size_para)))
   644				return -EFAULT;
   645			break;
   646	
   647		case VIAFB_SET_PANEL_POSITION:
   648			if (copy_from_user(&u.panel_pos_size_para, argp,
   649					   sizeof(u.panel_pos_size_para)))
   650				return -EFAULT;
   651			break;
   652		case VIAFB_SET_PANEL_SIZE:
   653			if (copy_from_user(&u.panel_pos_size_para, argp,
   654					   sizeof(u.panel_pos_size_para)))
   655				return -EFAULT;
   656			break;
   657	
   658		default:
   659			return -EINVAL;
   660		}
   661	
   662		return 0;
   663	}
   664	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

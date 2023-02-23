Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F71184F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 04:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677127068; x=1708663068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HdYjeSiu/wwi2DU7RGlaBrChb9E6SksMy6k8sVHCTc8=;
  b=LWf/VL0LzWusRmiYisRHqugZ+3Dd5hWKcdCSBxZ4XhrCzbkClOi9mF4z
   NOM/95aY5T2dZrDhdfdVAzbzdQot51NUwdupE5Lh5idmEB7H66o/tHw1t
   KecwGvfAAcOU92WGP/sAe21dYqHVZKvRWeugfBgi2SoaIQ+dIFr7TM1WZ
   WkOjSuUc0+H4Q6ydUEBCg40M1efOHtmKCe7OvyEbvMfU9CDpFm6R5EQrP
   mviTg/AmJvJ7Coi7WYuvkVv14aFGSgnUVqXfbkx2Jw5DiPNhYShoZZY/s
   /eClkvXMun9kQXRoqDcs0YyJTB6ji3INpTItuTYvS+DRHSKlpGJBFeY2e
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="419338563"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="419338563"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 20:37:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="649811385"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="649811385"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Feb 2023 20:37:46 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV3MX-00011x-2G;
	Thu, 23 Feb 2023 04:37:45 +0000
Date: Thu, 23 Feb 2023 12:36:36 +0800
From: kernel test robot <lkp@intel.com>
To: LCPD Auto Merger <lcpd_integration@list.ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-android-linux-5.10.y 1/1]
 drivers/usb/host/xhci-mtk-sch.c:271:15: error: 'struct mu3h_sch_ep_info' has
 no member named 'speed'
Message-ID: <202302231216.5NgNh5cM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-android-linux-5.10.y
head:   7719cd0b7e86f706a1467a15a115cabb56f78d6e
commit: 839fcdf8509080be95f6f4be06704e5f22ee3aef [1/1] Merge remote-tracking branch 'ti-linux-5.10.y' into HEAD
config: ia64-randconfig-r016-20230222 (https://download.01.org/0day-ci/archive/20230223/202302231216.5NgNh5cM-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-android-linux-5.10.y
        git checkout 839fcdf8509080be95f6f4be06704e5f22ee3aef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302231216.5NgNh5cM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/ia64/include/asm/pgtable.h:154,
                    from include/linux/pgtable.h:6,
                    from arch/ia64/include/asm/uaccess.h:40,
                    from include/linux/uaccess.h:11,
                    from arch/ia64/include/asm/sections.h:11,
                    from include/linux/interrupt.h:20,
                    from include/linux/usb.h:16,
                    from drivers/usb/host/xhci.h:15,
                    from drivers/usb/host/xhci-mtk-sch.c:13:
   arch/ia64/include/asm/mmu_context.h: In function 'reload_context':
   arch/ia64/include/asm/mmu_context.h:137:48: warning: variable 'old_rr4' set but not used [-Wunused-but-set-variable]
     137 |         unsigned long rr0, rr1, rr2, rr3, rr4, old_rr4;
         |                                                ^~~~~~~
   drivers/usb/host/xhci-mtk-sch.c: In function 'create_sch_ep':
>> drivers/usb/host/xhci-mtk-sch.c:271:15: error: 'struct mu3h_sch_ep_info' has no member named 'speed'
     271 |         sch_ep->speed = udev->speed;
         |               ^~
   drivers/usb/host/xhci-mtk-sch.c: In function 'setup_sch_info':
   drivers/usb/host/xhci-mtk-sch.c:306:19: error: 'struct mu3h_sch_ep_info' has no member named 'speed'
     306 |         if (sch_ep->speed == USB_SPEED_HIGH) {
         |                   ^~
   drivers/usb/host/xhci-mtk-sch.c:324:26: error: 'struct mu3h_sch_ep_info' has no member named 'speed'
     324 |         } else if (sch_ep->speed >= USB_SPEED_SUPER) {
         |                          ^~
   drivers/usb/host/xhci-mtk-sch.c:366:38: error: 'struct mu3h_sch_ep_info' has no member named 'speed'
     366 |         } else if (is_fs_or_ls(sch_ep->speed)) {
         |                                      ^~
   drivers/usb/host/xhci-mtk-sch.c: In function 'check_sch_bw':
   drivers/usb/host/xhci-mtk-sch.c:636:45: error: 'struct mu3h_sch_ep_info' has no member named 'speed'
     636 |         bw_boundary = get_bw_boundary(sch_ep->speed);
         |                                             ^~
   drivers/usb/host/xhci-mtk-sch.c: At top level:
>> drivers/usb/host/xhci-mtk-sch.c:841:5: warning: no previous prototype for 'xhci_mtk_add_ep' [-Wmissing-prototypes]
     841 | int xhci_mtk_add_ep(struct usb_hcd *hcd, struct usb_device *udev,
         |     ^~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mtk-sch.c: In function 'xhci_mtk_add_ep':
>> drivers/usb/host/xhci-mtk-sch.c:846:15: error: implicit declaration of function 'xhci_add_endpoint' [-Werror=implicit-function-declaration]
     846 |         ret = xhci_add_endpoint(hcd, udev, ep);
         |               ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mtk-sch.c: At top level:
>> drivers/usb/host/xhci-mtk-sch.c:856:5: warning: no previous prototype for 'xhci_mtk_drop_ep' [-Wmissing-prototypes]
     856 | int xhci_mtk_drop_ep(struct usb_hcd *hcd, struct usb_device *udev,
         |     ^~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mtk-sch.c: In function 'xhci_mtk_drop_ep':
>> drivers/usb/host/xhci-mtk-sch.c:861:15: error: implicit declaration of function 'xhci_drop_endpoint'; did you mean 'xhci_queue_stop_endpoint'? [-Werror=implicit-function-declaration]
     861 |         ret = xhci_drop_endpoint(hcd, udev, ep);
         |               ^~~~~~~~~~~~~~~~~~
         |               xhci_queue_stop_endpoint
   cc1: some warnings being treated as errors


vim +271 drivers/usb/host/xhci-mtk-sch.c

08e469de87a253 Chunfeng Yun 2018-09-20  238  
95b516c18621d1 Chunfeng Yun 2018-09-20  239  static struct mu3h_sch_ep_info *create_sch_ep(struct usb_device *udev,
95b516c18621d1 Chunfeng Yun 2018-09-20  240  	struct usb_host_endpoint *ep, struct xhci_ep_ctx *ep_ctx)
95b516c18621d1 Chunfeng Yun 2018-09-20  241  {
95b516c18621d1 Chunfeng Yun 2018-09-20  242  	struct mu3h_sch_ep_info *sch_ep;
08e469de87a253 Chunfeng Yun 2018-09-20  243  	struct mu3h_sch_tt *tt = NULL;
95b516c18621d1 Chunfeng Yun 2018-09-20  244  	u32 len_bw_budget_table;
95b516c18621d1 Chunfeng Yun 2018-09-20  245  	size_t mem_size;
95b516c18621d1 Chunfeng Yun 2018-09-20  246  
95b516c18621d1 Chunfeng Yun 2018-09-20  247  	if (is_fs_or_ls(udev->speed))
95b516c18621d1 Chunfeng Yun 2018-09-20  248  		len_bw_budget_table = TT_MICROFRAMES_MAX;
e995dccadaf99e Chunfeng Yun 2018-09-20  249  	else if ((udev->speed >= USB_SPEED_SUPER)
95b516c18621d1 Chunfeng Yun 2018-09-20  250  			&& usb_endpoint_xfer_isoc(&ep->desc))
95b516c18621d1 Chunfeng Yun 2018-09-20  251  		len_bw_budget_table = get_esit(ep_ctx);
95b516c18621d1 Chunfeng Yun 2018-09-20  252  	else
95b516c18621d1 Chunfeng Yun 2018-09-20  253  		len_bw_budget_table = 1;
95b516c18621d1 Chunfeng Yun 2018-09-20  254  
95b516c18621d1 Chunfeng Yun 2018-09-20  255  	mem_size = sizeof(struct mu3h_sch_ep_info) +
95b516c18621d1 Chunfeng Yun 2018-09-20  256  			len_bw_budget_table * sizeof(u32);
95b516c18621d1 Chunfeng Yun 2018-09-20  257  	sch_ep = kzalloc(mem_size, GFP_KERNEL);
95b516c18621d1 Chunfeng Yun 2018-09-20  258  	if (!sch_ep)
95b516c18621d1 Chunfeng Yun 2018-09-20  259  		return ERR_PTR(-ENOMEM);
95b516c18621d1 Chunfeng Yun 2018-09-20  260  
08e469de87a253 Chunfeng Yun 2018-09-20  261  	if (is_fs_or_ls(udev->speed)) {
08e469de87a253 Chunfeng Yun 2018-09-20  262  		tt = find_tt(udev);
08e469de87a253 Chunfeng Yun 2018-09-20  263  		if (IS_ERR(tt)) {
08e469de87a253 Chunfeng Yun 2018-09-20  264  			kfree(sch_ep);
08e469de87a253 Chunfeng Yun 2018-09-20  265  			return ERR_PTR(-ENOMEM);
08e469de87a253 Chunfeng Yun 2018-09-20  266  		}
08e469de87a253 Chunfeng Yun 2018-09-20  267  	}
08e469de87a253 Chunfeng Yun 2018-09-20  268  
08e469de87a253 Chunfeng Yun 2018-09-20  269  	sch_ep->sch_tt = tt;
95b516c18621d1 Chunfeng Yun 2018-09-20  270  	sch_ep->ep = ep;
64606b69a27869 Chunfeng Yun 2021-03-08 @271  	sch_ep->speed = udev->speed;
610253401edd10 Chunfeng Yun 2021-02-01  272  	INIT_LIST_HEAD(&sch_ep->endpoint);
9ade88133d620c Ikjoon Jang  2021-01-13  273  	INIT_LIST_HEAD(&sch_ep->tt_endpoint);
95b516c18621d1 Chunfeng Yun 2018-09-20  274  
95b516c18621d1 Chunfeng Yun 2018-09-20  275  	return sch_ep;
95b516c18621d1 Chunfeng Yun 2018-09-20  276  }
95b516c18621d1 Chunfeng Yun 2018-09-20  277  
64606b69a27869 Chunfeng Yun 2021-03-08  278  static void setup_sch_info(struct xhci_ep_ctx *ep_ctx,
64606b69a27869 Chunfeng Yun 2021-03-08  279  			   struct mu3h_sch_ep_info *sch_ep)
0cbd4b34cda9df Chunfeng Yun 2015-11-24  280  {
0cbd4b34cda9df Chunfeng Yun 2015-11-24  281  	u32 ep_type;
95b516c18621d1 Chunfeng Yun 2018-09-20  282  	u32 maxpkt;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  283  	u32 max_burst;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  284  	u32 mult;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  285  	u32 esit_pkts;
7aae9990de2044 Chunfeng Yun 2018-09-20  286  	u32 max_esit_payload;
95b516c18621d1 Chunfeng Yun 2018-09-20  287  	u32 *bwb_table = sch_ep->bw_budget_table;
95b516c18621d1 Chunfeng Yun 2018-09-20  288  	int i;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  289  
0cbd4b34cda9df Chunfeng Yun 2015-11-24  290  	ep_type = CTX_TO_EP_TYPE(le32_to_cpu(ep_ctx->ep_info2));
95b516c18621d1 Chunfeng Yun 2018-09-20  291  	maxpkt = MAX_PACKET_DECODED(le32_to_cpu(ep_ctx->ep_info2));
0cbd4b34cda9df Chunfeng Yun 2015-11-24  292  	max_burst = CTX_TO_MAX_BURST(le32_to_cpu(ep_ctx->ep_info2));
0cbd4b34cda9df Chunfeng Yun 2015-11-24  293  	mult = CTX_TO_EP_MULT(le32_to_cpu(ep_ctx->ep_info));
7aae9990de2044 Chunfeng Yun 2018-09-20  294  	max_esit_payload =
7aae9990de2044 Chunfeng Yun 2018-09-20  295  		(CTX_TO_MAX_ESIT_PAYLOAD_HI(
7aae9990de2044 Chunfeng Yun 2018-09-20  296  			le32_to_cpu(ep_ctx->ep_info)) << 16) |
7aae9990de2044 Chunfeng Yun 2018-09-20  297  		 CTX_TO_MAX_ESIT_PAYLOAD(le32_to_cpu(ep_ctx->tx_info));
0cbd4b34cda9df Chunfeng Yun 2015-11-24  298  
95b516c18621d1 Chunfeng Yun 2018-09-20  299  	sch_ep->esit = get_esit(ep_ctx);
08e469de87a253 Chunfeng Yun 2018-09-20  300  	sch_ep->ep_type = ep_type;
08e469de87a253 Chunfeng Yun 2018-09-20  301  	sch_ep->maxpkt = maxpkt;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  302  	sch_ep->offset = 0;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  303  	sch_ep->burst_mode = 0;
95b516c18621d1 Chunfeng Yun 2018-09-20  304  	sch_ep->repeat = 0;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  305  
64606b69a27869 Chunfeng Yun 2021-03-08  306  	if (sch_ep->speed == USB_SPEED_HIGH) {
0cbd4b34cda9df Chunfeng Yun 2015-11-24  307  		sch_ep->cs_count = 0;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  308  
0cbd4b34cda9df Chunfeng Yun 2015-11-24  309  		/*
0cbd4b34cda9df Chunfeng Yun 2015-11-24  310  		 * usb_20 spec section5.9
0cbd4b34cda9df Chunfeng Yun 2015-11-24  311  		 * a single microframe is enough for HS synchromous endpoints
0cbd4b34cda9df Chunfeng Yun 2015-11-24  312  		 * in a interval
0cbd4b34cda9df Chunfeng Yun 2015-11-24  313  		 */
0cbd4b34cda9df Chunfeng Yun 2015-11-24  314  		sch_ep->num_budget_microframes = 1;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  315  
0cbd4b34cda9df Chunfeng Yun 2015-11-24  316  		/*
0cbd4b34cda9df Chunfeng Yun 2015-11-24  317  		 * xHCI spec section6.2.3.4
0cbd4b34cda9df Chunfeng Yun 2015-11-24  318  		 * @max_burst is the number of additional transactions
0cbd4b34cda9df Chunfeng Yun 2015-11-24  319  		 * opportunities per microframe
0cbd4b34cda9df Chunfeng Yun 2015-11-24  320  		 */
0cbd4b34cda9df Chunfeng Yun 2015-11-24  321  		sch_ep->pkts = max_burst + 1;
95b516c18621d1 Chunfeng Yun 2018-09-20  322  		sch_ep->bw_cost_per_microframe = maxpkt * sch_ep->pkts;
95b516c18621d1 Chunfeng Yun 2018-09-20  323  		bwb_table[0] = sch_ep->bw_cost_per_microframe;
64606b69a27869 Chunfeng Yun 2021-03-08  324  	} else if (sch_ep->speed >= USB_SPEED_SUPER) {
0cbd4b34cda9df Chunfeng Yun 2015-11-24  325  		/* usb3_r1 spec section4.4.7 & 4.4.8 */
0cbd4b34cda9df Chunfeng Yun 2015-11-24  326  		sch_ep->cs_count = 0;
95b516c18621d1 Chunfeng Yun 2018-09-20  327  		sch_ep->burst_mode = 1;
7aae9990de2044 Chunfeng Yun 2018-09-20  328  		/*
7aae9990de2044 Chunfeng Yun 2018-09-20  329  		 * some device's (d)wBytesPerInterval is set as 0,
7aae9990de2044 Chunfeng Yun 2018-09-20  330  		 * then max_esit_payload is 0, so evaluate esit_pkts from
7aae9990de2044 Chunfeng Yun 2018-09-20  331  		 * mult and burst
7aae9990de2044 Chunfeng Yun 2018-09-20  332  		 */
95b516c18621d1 Chunfeng Yun 2018-09-20  333  		esit_pkts = DIV_ROUND_UP(max_esit_payload, maxpkt);
7aae9990de2044 Chunfeng Yun 2018-09-20  334  		if (esit_pkts == 0)
0cbd4b34cda9df Chunfeng Yun 2015-11-24  335  			esit_pkts = (mult + 1) * (max_burst + 1);
7aae9990de2044 Chunfeng Yun 2018-09-20  336  
0cbd4b34cda9df Chunfeng Yun 2015-11-24  337  		if (ep_type == INT_IN_EP || ep_type == INT_OUT_EP) {
0cbd4b34cda9df Chunfeng Yun 2015-11-24  338  			sch_ep->pkts = esit_pkts;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  339  			sch_ep->num_budget_microframes = 1;
95b516c18621d1 Chunfeng Yun 2018-09-20  340  			bwb_table[0] = maxpkt * sch_ep->pkts;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  341  		}
0cbd4b34cda9df Chunfeng Yun 2015-11-24  342  
0cbd4b34cda9df Chunfeng Yun 2015-11-24  343  		if (ep_type == ISOC_IN_EP || ep_type == ISOC_OUT_EP) {
95b516c18621d1 Chunfeng Yun 2018-09-20  344  
87173acc0d8f09 Chunfeng Yun 2018-09-20  345  			if (sch_ep->esit == 1)
87173acc0d8f09 Chunfeng Yun 2018-09-20  346  				sch_ep->pkts = esit_pkts;
87173acc0d8f09 Chunfeng Yun 2018-09-20  347  			else if (esit_pkts <= sch_ep->esit)
0cbd4b34cda9df Chunfeng Yun 2015-11-24  348  				sch_ep->pkts = 1;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  349  			else
0cbd4b34cda9df Chunfeng Yun 2015-11-24  350  				sch_ep->pkts = roundup_pow_of_two(esit_pkts)
0cbd4b34cda9df Chunfeng Yun 2015-11-24  351  					/ sch_ep->esit;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  352  
0cbd4b34cda9df Chunfeng Yun 2015-11-24  353  			sch_ep->num_budget_microframes =
0cbd4b34cda9df Chunfeng Yun 2015-11-24  354  				DIV_ROUND_UP(esit_pkts, sch_ep->pkts);
0cbd4b34cda9df Chunfeng Yun 2015-11-24  355  
95b516c18621d1 Chunfeng Yun 2018-09-20  356  			sch_ep->repeat = !!(sch_ep->num_budget_microframes > 1);
95b516c18621d1 Chunfeng Yun 2018-09-20  357  			sch_ep->bw_cost_per_microframe = maxpkt * sch_ep->pkts;
95b516c18621d1 Chunfeng Yun 2018-09-20  358  
95b516c18621d1 Chunfeng Yun 2018-09-20  359  			for (i = 0; i < sch_ep->num_budget_microframes - 1; i++)
95b516c18621d1 Chunfeng Yun 2018-09-20  360  				bwb_table[i] = sch_ep->bw_cost_per_microframe;
95b516c18621d1 Chunfeng Yun 2018-09-20  361  
95b516c18621d1 Chunfeng Yun 2018-09-20  362  			/* last one <= bw_cost_per_microframe */
e8598a41eb44e1 Chunfeng Yun 2021-03-31  363  			bwb_table[i] = maxpkt * esit_pkts
e8598a41eb44e1 Chunfeng Yun 2021-03-31  364  				       - i * sch_ep->bw_cost_per_microframe;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  365  		}
64606b69a27869 Chunfeng Yun 2021-03-08 @366  	} else if (is_fs_or_ls(sch_ep->speed)) {
0cbd4b34cda9df Chunfeng Yun 2015-11-24  367  		sch_ep->pkts = 1; /* at most one packet for each microframe */
08e469de87a253 Chunfeng Yun 2018-09-20  368  
08e469de87a253 Chunfeng Yun 2018-09-20  369  		/*
08e469de87a253 Chunfeng Yun 2018-09-20  370  		 * num_budget_microframes and cs_count will be updated when
08e469de87a253 Chunfeng Yun 2018-09-20  371  		 * check TT for INT_OUT_EP, ISOC/INT_IN_EP type
08e469de87a253 Chunfeng Yun 2018-09-20  372  		 */
95b516c18621d1 Chunfeng Yun 2018-09-20  373  		sch_ep->cs_count = DIV_ROUND_UP(maxpkt, FS_PAYLOAD_MAX);
08e469de87a253 Chunfeng Yun 2018-09-20  374  		sch_ep->num_budget_microframes = sch_ep->cs_count;
95b516c18621d1 Chunfeng Yun 2018-09-20  375  		sch_ep->bw_cost_per_microframe =
95b516c18621d1 Chunfeng Yun 2018-09-20  376  			(maxpkt < FS_PAYLOAD_MAX) ? maxpkt : FS_PAYLOAD_MAX;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  377  
95b516c18621d1 Chunfeng Yun 2018-09-20  378  		/* init budget table */
95b516c18621d1 Chunfeng Yun 2018-09-20  379  		if (ep_type == ISOC_OUT_EP) {
95b516c18621d1 Chunfeng Yun 2018-09-20  380  			for (i = 0; i < sch_ep->num_budget_microframes; i++)
95b516c18621d1 Chunfeng Yun 2018-09-20  381  				bwb_table[i] =	sch_ep->bw_cost_per_microframe;
95b516c18621d1 Chunfeng Yun 2018-09-20  382  		} else if (ep_type == INT_OUT_EP) {
95b516c18621d1 Chunfeng Yun 2018-09-20  383  			/* only first one consumes bandwidth, others as zero */
95b516c18621d1 Chunfeng Yun 2018-09-20  384  			bwb_table[0] = sch_ep->bw_cost_per_microframe;
95b516c18621d1 Chunfeng Yun 2018-09-20  385  		} else { /* INT_IN_EP or ISOC_IN_EP */
95b516c18621d1 Chunfeng Yun 2018-09-20  386  			bwb_table[0] = 0; /* start split */
95b516c18621d1 Chunfeng Yun 2018-09-20  387  			bwb_table[1] = 0; /* idle */
08e469de87a253 Chunfeng Yun 2018-09-20  388  			/*
08e469de87a253 Chunfeng Yun 2018-09-20  389  			 * due to cs_count will be updated according to cs
08e469de87a253 Chunfeng Yun 2018-09-20  390  			 * position, assign all remainder budget array
08e469de87a253 Chunfeng Yun 2018-09-20  391  			 * elements as @bw_cost_per_microframe, but only first
08e469de87a253 Chunfeng Yun 2018-09-20  392  			 * @num_budget_microframes elements will be used later
08e469de87a253 Chunfeng Yun 2018-09-20  393  			 */
08e469de87a253 Chunfeng Yun 2018-09-20  394  			for (i = 2; i < TT_MICROFRAMES_MAX; i++)
95b516c18621d1 Chunfeng Yun 2018-09-20  395  				bwb_table[i] =	sch_ep->bw_cost_per_microframe;
0cbd4b34cda9df Chunfeng Yun 2015-11-24  396  		}
0cbd4b34cda9df Chunfeng Yun 2015-11-24  397  	}
0cbd4b34cda9df Chunfeng Yun 2015-11-24  398  }
0cbd4b34cda9df Chunfeng Yun 2015-11-24  399  

:::::: The code at line 271 was first introduced by commit
:::::: 64606b69a278697c776fd8e1222f8db01379ffd3 FROMGIT: usb: xhci-mtk: add a member @speed in mu3h_sch_ep_info struct

:::::: TO: Chunfeng Yun <chunfeng.yun@mediatek.com>
:::::: CC: Greg Kroah-Hartman <gregkh@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

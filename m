Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034D4537E9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 06:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737355048; cv=none; b=E6As6dME1ebWx0X4u8/pt2J8PsU/BpH+EsjN7WlixdfQVRNLYYFB2KMktsLQ8ir77i7zazukVM9hUAB3uHv9nsfaN3aBa56picFUCQwf9p+sgrdfNfBVteZMU5adexmSaZkZC/7n4gNydV/50YoC0fXv7tIcudhCwotZ/+ahOOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737355048; c=relaxed/simple;
	bh=vSztRtwUWnSvQTjpcykMVlMrL2u6IUPKJls8ht/zix4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OAW7S74v8dTmcALEooRk79jjK2lzXWS+0ZLVX1rJ+NC0n4tr1nef5LaU4fIAmxXzVs1cQ7HYQrfkLst+NNDLJUP1/fpez7Tgi95Slq4LqRXMoOHXi3a5Rqv9yv+argwekLHCqJn53KX+5Tuu2Mu9BiZzwS7PkFgsOMSIdIDx+oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQzy2nzq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQzy2nzq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737355046; x=1768891046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vSztRtwUWnSvQTjpcykMVlMrL2u6IUPKJls8ht/zix4=;
  b=AQzy2nzqBSLfEoxONO4VqpfJSgL703BnfZhHavbMdL18r9uOCZ6DKJ7o
   qrSVIrjAs2wnFLLwTjtd9gd8VeSJm/65ituXZNx+CxqU+EJDejgIbtHzz
   LlE/WSVkclgKMsxsEKZUtxdeignKpIMs9nNm0E+4KF6TVDsRbzGdGYcfp
   kPFUbacIyCxZRfVlwGmKyrcpUuD/aJE8kj8tNvnwFSpgSzlgJGxCIgv7E
   vvuNmDvysRlJ7q76kLSlwTzVF6Zzy+moojG+g9JtaKFnMt0MWAWC7iBn9
   pdNjXvFzTdSCnkCkAYGlwVty+AzTiOBswQKqHzXyaAGl5vmjI/dObsnjI
   Q==;
X-CSE-ConnectionGUID: PkvVj3a1T3OFn+ap4uLizg==
X-CSE-MsgGUID: pEwR3J5HSgG7VsSQZSBieA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41478142"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="41478142"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 22:37:26 -0800
X-CSE-ConnectionGUID: J42vvvFyTJaXjY2uTDEMXw==
X-CSE-MsgGUID: a2MbiuDaQzeLtPebVO/tGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111007774"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jan 2025 22:37:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZlPV-000WHX-1e;
	Mon, 20 Jan 2025 06:37:21 +0000
Date: Mon, 20 Jan 2025 14:36:36 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>
Subject: drivers/usb/gadget/udc/renesas_usb3.c:2638:73: warning: '%d'
 directive output may be truncated writing between 1 and 11 bytes into a
 region of size 6
Message-ID: <202501201409.BIQPtkeB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lad,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffd294d346d185b70e28b1a28abe367bbfe53c04
commit: 8292493c22c8e28b6e67a01e0f5c6db1cf231eb1 riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
date:   2 years, 2 months ago
config: riscv-randconfig-r042-20221215 (https://download.01.org/0day-ci/archive/20250120/202501201409.BIQPtkeB-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201409.BIQPtkeB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501201409.BIQPtkeB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/udc/renesas_usb3.c: In function 'renesas_usb3_probe':
>> drivers/usb/gadget/udc/renesas_usb3.c:2638:73: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 6 [-Wformat-truncation=]
    2638 |                 snprintf(usb3_ep->ep_name, sizeof(usb3_ep->ep_name), "ep%d", i);
         |                                                                         ^~
   In function 'renesas_usb3_init_ep',
       inlined from 'renesas_usb3_probe' at drivers/usb/gadget/udc/renesas_usb3.c:2828:8:
   drivers/usb/gadget/udc/renesas_usb3.c:2638:70: note: directive argument in the range [-2147483644, 2147483646]
    2638 |                 snprintf(usb3_ep->ep_name, sizeof(usb3_ep->ep_name), "ep%d", i);
         |                                                                      ^~~~~~
   drivers/usb/gadget/udc/renesas_usb3.c:2638:17: note: 'snprintf' output between 4 and 14 bytes into a destination of size 8
    2638 |                 snprintf(usb3_ep->ep_name, sizeof(usb3_ep->ep_name), "ep%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2638 drivers/usb/gadget/udc/renesas_usb3.c

746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2611  
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2612  static int renesas_usb3_init_ep(struct renesas_usb3 *usb3, struct device *dev,
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2613  				const struct renesas_usb3_priv *priv)
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2614  {
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2615  	struct renesas_usb3_ep *usb3_ep;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2616  	int i;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2617  
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2618  	/* calculate num_usb3_eps from renesas_usb3_priv */
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2619  	usb3->num_usb3_eps = priv->ramsize_per_ramif * priv->num_ramif * 2 /
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2620  			     priv->ramsize_per_pipe + 1;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2621  
b9f20cff54f76e Phil Edworthy     2022-08-04  2622  	if (usb3->num_usb3_eps > USB3_MAX_NUM_PIPES(usb3))
b9f20cff54f76e Phil Edworthy     2022-08-04  2623  		usb3->num_usb3_eps = USB3_MAX_NUM_PIPES(usb3);
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2624  
a86854d0c599b3 Kees Cook         2018-06-12  2625  	usb3->usb3_ep = devm_kcalloc(dev,
a86854d0c599b3 Kees Cook         2018-06-12  2626  				     usb3->num_usb3_eps, sizeof(*usb3_ep),
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2627  				     GFP_KERNEL);
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2628  	if (!usb3->usb3_ep)
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2629  		return -ENOMEM;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2630  
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2631  	dev_dbg(dev, "%s: num_usb3_eps = %d\n", __func__, usb3->num_usb3_eps);
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2632  	/*
4091fb95b5f8de Masahiro Yamada   2017-02-27  2633  	 * This driver prepares pipes as follows:
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2634  	 *  - odd pipes = IN pipe
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2635  	 *  - even pipes = OUT pipe (except pipe 0)
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2636  	 */
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2637  	usb3_for_each_ep(usb3_ep, usb3, i) {
746bfe63bba37a Yoshihiro Shimoda 2015-12-21 @2638  		snprintf(usb3_ep->ep_name, sizeof(usb3_ep->ep_name), "ep%d", i);
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2639  		usb3_ep->usb3 = usb3;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2640  		usb3_ep->num = i;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2641  		usb3_ep->ep.name = usb3_ep->ep_name;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2642  		usb3_ep->ep.ops = &renesas_usb3_ep_ops;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2643  		INIT_LIST_HEAD(&usb3_ep->queue);
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2644  		INIT_LIST_HEAD(&usb3_ep->ep.ep_list);
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2645  		if (!i) {
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2646  			/* for control pipe */
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2647  			usb3->gadget.ep0 = &usb3_ep->ep;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2648  			usb_ep_set_maxpacket_limit(&usb3_ep->ep,
dfe1a51d2a3664 Yoshihiro Shimoda 2018-08-03  2649  						USB3_EP0_SS_MAX_PACKET_SIZE);
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2650  			usb3_ep->ep.caps.type_control = true;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2651  			usb3_ep->ep.caps.dir_in = true;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2652  			usb3_ep->ep.caps.dir_out = true;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2653  			continue;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2654  		}
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2655  
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2656  		/* for bulk or interrupt pipe */
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2657  		usb_ep_set_maxpacket_limit(&usb3_ep->ep, ~0);
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2658  		list_add_tail(&usb3_ep->ep.ep_list, &usb3->gadget.ep_list);
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2659  		usb3_ep->ep.caps.type_bulk = true;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2660  		usb3_ep->ep.caps.type_int = true;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2661  		if (i & 1)
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2662  			usb3_ep->ep.caps.dir_in = true;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2663  		else
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2664  			usb3_ep->ep.caps.dir_out = true;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2665  	}
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2666  
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2667  	return 0;
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2668  }
746bfe63bba37a Yoshihiro Shimoda 2015-12-21  2669  

:::::: The code at line 2638 was first introduced by commit
:::::: 746bfe63bba37ad55956b7377c9af494e7e28929 usb: gadget: renesas_usb3: add support for Renesas USB3.0 peripheral controller

:::::: TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
:::::: CC: Felipe Balbi <balbi@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

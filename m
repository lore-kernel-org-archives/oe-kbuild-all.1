Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4342C366
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 00:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POmi++Bt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699575962; x=1731111962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lomnTx7H6owC/l/yhJve0BjwYQf6KNddh3ixHN8le78=;
  b=POmi++Bt/9pl6vnPZYjfxSmNCsdFKOdc7rFElSoUl3fVNwMYK0e4ou+6
   H1cBaT/BYhaEdSaFGy3GaDSv53mStjbZQ50COAeO/aVV5ItYtI3NZGioZ
   3AshgaixIKppdR6GjY7L99cYnhfMZr6XarjqJHawQLomot+b4BGpJoxw2
   5im+uXinf/3yZHjh5H+qMXL8cqiglPBeUolrvrudZ6N0Lagd4xa1rckVq
   tYS9gaTvVmrmNXKmmE+Yikfh3Tz1O+fPElYtG21I+ohWt19q3ZXOv15Mq
   zPK2RTW9YdvAyXb/MJ4d8jw++Bb53Ef6Am6WSuH9w+OfiVeW8z7hJI2e+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389911616"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="389911616"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 16:26:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="763596481"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="763596481"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Nov 2023 16:25:59 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1FLR-0009IE-1l;
	Fri, 10 Nov 2023 00:25:57 +0000
Date: Fri, 10 Nov 2023 08:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: drivers/usb/gadget/function/f_fs.c:2857:32: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202311100753.AFPzkLIa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bc986ab839c844e78a2333a02e55f02c9e57935
commit: bdcc03cef0fd8abc6eaeec6ac47e54ae8f8c625f usb: gadget: f_fs: preserve wMaxPacketSize across usb_ep_autoconfig() call
date:   4 years, 9 months ago
config: i386-randconfig-062-20230912 (https://download.01.org/0day-ci/archive/20231110/202311100753.AFPzkLIa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100753.AFPzkLIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100753.AFPzkLIa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/function/f_fs.c:2857:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] wMaxPacketSize @@     got restricted __le16 [usertype] wMaxPacketSize @@
   drivers/usb/gadget/function/f_fs.c:2857:32: sparse:     expected unsigned short [usertype] wMaxPacketSize
   drivers/usb/gadget/function/f_fs.c:2857:32: sparse:     got restricted __le16 [usertype] wMaxPacketSize
>> drivers/usb/gadget/function/f_fs.c:2882:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] wMaxPacketSize @@     got unsigned short [usertype] wMaxPacketSize @@
   drivers/usb/gadget/function/f_fs.c:2882:36: sparse:     expected restricted __le16 [usertype] wMaxPacketSize
   drivers/usb/gadget/function/f_fs.c:2882:36: sparse:     got unsigned short [usertype] wMaxPacketSize

vim +2857 drivers/usb/gadget/function/f_fs.c

  2788	
  2789	static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
  2790					    struct usb_descriptor_header *desc,
  2791					    void *priv)
  2792	{
  2793		struct usb_endpoint_descriptor *ds = (void *)desc;
  2794		struct ffs_function *func = priv;
  2795		struct ffs_ep *ffs_ep;
  2796		unsigned ep_desc_id;
  2797		int idx;
  2798		static const char *speed_names[] = { "full", "high", "super" };
  2799	
  2800		if (type != FFS_DESCRIPTOR)
  2801			return 0;
  2802	
  2803		/*
  2804		 * If ss_descriptors is not NULL, we are reading super speed
  2805		 * descriptors; if hs_descriptors is not NULL, we are reading high
  2806		 * speed descriptors; otherwise, we are reading full speed
  2807		 * descriptors.
  2808		 */
  2809		if (func->function.ss_descriptors) {
  2810			ep_desc_id = 2;
  2811			func->function.ss_descriptors[(long)valuep] = desc;
  2812		} else if (func->function.hs_descriptors) {
  2813			ep_desc_id = 1;
  2814			func->function.hs_descriptors[(long)valuep] = desc;
  2815		} else {
  2816			ep_desc_id = 0;
  2817			func->function.fs_descriptors[(long)valuep]    = desc;
  2818		}
  2819	
  2820		if (!desc || desc->bDescriptorType != USB_DT_ENDPOINT)
  2821			return 0;
  2822	
  2823		idx = ffs_ep_addr2idx(func->ffs, ds->bEndpointAddress) - 1;
  2824		if (idx < 0)
  2825			return idx;
  2826	
  2827		ffs_ep = func->eps + idx;
  2828	
  2829		if (unlikely(ffs_ep->descs[ep_desc_id])) {
  2830			pr_err("two %sspeed descriptors for EP %d\n",
  2831				  speed_names[ep_desc_id],
  2832				  ds->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK);
  2833			return -EINVAL;
  2834		}
  2835		ffs_ep->descs[ep_desc_id] = ds;
  2836	
  2837		ffs_dump_mem(": Original  ep desc", ds, ds->bLength);
  2838		if (ffs_ep->ep) {
  2839			ds->bEndpointAddress = ffs_ep->descs[0]->bEndpointAddress;
  2840			if (!ds->wMaxPacketSize)
  2841				ds->wMaxPacketSize = ffs_ep->descs[0]->wMaxPacketSize;
  2842		} else {
  2843			struct usb_request *req;
  2844			struct usb_ep *ep;
  2845			u8 bEndpointAddress;
  2846			u16 wMaxPacketSize;
  2847	
  2848			/*
  2849			 * We back up bEndpointAddress because autoconfig overwrites
  2850			 * it with physical endpoint address.
  2851			 */
  2852			bEndpointAddress = ds->bEndpointAddress;
  2853			/*
  2854			 * We back up wMaxPacketSize because autoconfig treats
  2855			 * endpoint descriptors as if they were full speed.
  2856			 */
> 2857			wMaxPacketSize = ds->wMaxPacketSize;
  2858			pr_vdebug("autoconfig\n");
  2859			ep = usb_ep_autoconfig(func->gadget, ds);
  2860			if (unlikely(!ep))
  2861				return -ENOTSUPP;
  2862			ep->driver_data = func->eps + idx;
  2863	
  2864			req = usb_ep_alloc_request(ep, GFP_KERNEL);
  2865			if (unlikely(!req))
  2866				return -ENOMEM;
  2867	
  2868			ffs_ep->ep  = ep;
  2869			ffs_ep->req = req;
  2870			func->eps_revmap[ds->bEndpointAddress &
  2871					 USB_ENDPOINT_NUMBER_MASK] = idx + 1;
  2872			/*
  2873			 * If we use virtual address mapping, we restore
  2874			 * original bEndpointAddress value.
  2875			 */
  2876			if (func->ffs->user_flags & FUNCTIONFS_VIRTUAL_ADDR)
  2877				ds->bEndpointAddress = bEndpointAddress;
  2878			/*
  2879			 * Restore wMaxPacketSize which was potentially
  2880			 * overwritten by autoconfig.
  2881			 */
> 2882			ds->wMaxPacketSize = wMaxPacketSize;
  2883		}
  2884		ffs_dump_mem(": Rewritten ep desc", ds, ds->bLength);
  2885	
  2886		return 0;
  2887	}
  2888	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

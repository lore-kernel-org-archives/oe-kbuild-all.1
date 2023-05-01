Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214B82F48
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 22:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682980338; x=1714516338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3udokf9BHxRERjyc4FxdF4APAc7RFOfAjkmCiwRPFgc=;
  b=B9+69k/yN1H9AnwwHVwt/JpQL+c8HgfluJ14BNGXXdX0NwNCEWa1VSh2
   2fojma9tzWXfaushlbntB96DsRLS0hgHcKqgPeuDx0TexoK+Z1wl/Mdyi
   fj7iUYXqUYw1xwkjMSaYrysAeCfRSPQSwhPBVe3zhU/+HkvWN/REjMX16
   cUM3VKllhDL4ITInWW0SNIKa0ngTSVm9CjFGRZh90PQrA3WgzrQLy4oAw
   CZ7khp3n+KPrj4vyvHZfsWljK9UI6UT/8Ywas31scAP67KOpspCj8Nmn/
   L+p/s1Z1dAcfUnYCpgqcvQ3ccdP+mni8YxCNBAJTBBAa3sY42nd/1Vdsa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="350331509"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="350331509"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 15:32:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="760843368"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="760843368"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 May 2023 15:32:16 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptc47-0000gL-32;
	Mon, 01 May 2023 22:32:15 +0000
Date: Tue, 2 May 2023 06:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 23100/23103]
 drivers/usb/gadget/udc/core.c:56: warning: expecting prototype for protects
 udc->vbus, udc->started, gadget->connect, gadget(). Prototype was for
 DEFINE_MUTEX() instead
Message-ID: <202305020655.sL8qZrDM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   9e9e157a6bb93a2c777670890905410c0b3a0768
commit: b142000da9e5bcdce59dbb5cf3fd78e05edebedd [23100/23103] BACKPORT: FROMGIT: usb: gadget: udc: core: Invoke usb_gadget_connect only when started
config: i386-randconfig-a002-20230501 (https://download.01.org/0day-ci/archive/20230502/202305020655.sL8qZrDM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-5.15
        git checkout b142000da9e5bcdce59dbb5cf3fd78e05edebedd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/usb/gadget/udc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305020655.sL8qZrDM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/udc/core.c:56: warning: Function parameter or member 'connect_lock' not described in 'DEFINE_MUTEX'
>> drivers/usb/gadget/udc/core.c:56: warning: expecting prototype for protects udc->vbus, udc->started, gadget->connect, gadget(). Prototype was for DEFINE_MUTEX() instead


vim +56 drivers/usb/gadget/udc/core.c

    45	
    46	static struct class *udc_class;
    47	static LIST_HEAD(udc_list);
    48	static LIST_HEAD(gadget_driver_pending_list);
    49	static DEFINE_MUTEX(udc_lock);
    50	/**
    51	 * protects udc->vbus, udc->started, gadget->connect, gadget->deactivate related
    52	 * functions. usb_gadget_connect_locked, usb_gadget_disconnect_locked,
    53	 * usb_udc_connect_control_locked, usb_gadget_udc_start_locked, usb_gadget_udc_stop_locked are
    54	 * called with this lock held.
    55	 */
  > 56	static DEFINE_MUTEX(connect_lock);
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D931B272
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 22:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g0cuwHfu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698879342; x=1730415342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9KhTujPOON700wlFZjZczdVSZQHt2ULf2ASkZk5yEbo=;
  b=g0cuwHfu0KfE9xzXdChjLojEx3Ep+9fJ80LtfDeI9MnDSQSUNriGO4f1
   W6sNXvbjabmfTr480Z7O/nf2Yy56SKspiq1bCGn/dynS9ROPXQK60U/Qw
   w80N9ANt+oF+W4YEaBx5lAai3eWEDR5Y5LJNrMcpU5imelxM9auifTTfH
   OKOeHs9FW2LwVCdZiLrJc+elLm3/lPUedLdkGHEY9XS1M+snZE+QaAcFZ
   aRynCCh3ScSnPtuWhab7WuFVZIxg6jlJgwFN1IkGu6TIkiHnoQqZ0xlrs
   EzjA4mfhfwL/I00QiHomHkbt1YFnuxQl/uNQfCTsWgBADFoLOjm4szcWG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="368803180"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="368803180"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 15:55:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="737554327"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="737554327"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Nov 2023 15:55:39 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyK7c-00010G-1U;
	Wed, 01 Nov 2023 22:55:36 +0000
Date: Thu, 2 Nov 2023 06:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2023-08 23119/23556]
 drivers/usb/gadget/udc/core.c:56: warning: expecting prototype for protects
 udc->vbus, udc->started, gadget->connect, gadget(). Prototype was for
 DEFINE_MUTEX() instead
Message-ID: <202311020604.9Nw1tiaU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Badhri,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15-2023-08
head:   25b9fcafaf92feb7efc21733601f6bb6a65e7060
commit: b142000da9e5bcdce59dbb5cf3fd78e05edebedd [23119/23556] BACKPORT: FROMGIT: usb: gadget: udc: core: Invoke usb_gadget_connect only when started
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231102/202311020604.9Nw1tiaU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311020604.9Nw1tiaU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311020604.9Nw1tiaU-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12892FE567
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 23:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765582722; cv=none; b=e/zPB1stURQQT8d/dLzC/zQTzHwccz8fCF1XV6XcdgnB5UBjyB3SIBiWq50ex2nFxEcIyn5P7K1jkfD04L0j9qMFgpW5GyaNqN74kJGcRCVyukkfR0NsVd/ittE87PRrLjo29AxU1/w63HSsgUnOewYydyELkhG2WO7not+fz4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765582722; c=relaxed/simple;
	bh=boqlRvabjip0H62KAz/Fub68L5bt/2e0GwyIzNzSf18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oIsrdA+vfWtBypPcKtT0iAlNMe0R+cs1zrFVQdkVNyUAOp4TVx/X2z3IL0cqLPyclC2UoaDLNAX/92+KW2lrIkd2QJKqWU4KGu9ykPWi5ZF1JvWzu1Ud5+qQEfD2uCYYSeaNVFHpsZ2Wik5gxYVG//4gEOb3kK6qtq7PmsD5VZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUODwoeD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUODwoeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765582721; x=1797118721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=boqlRvabjip0H62KAz/Fub68L5bt/2e0GwyIzNzSf18=;
  b=HUODwoeDqjoXhb7oDFtLYiQzVDsMpHYZrZr105bQsI5o0BHC5p+xgjl1
   5wmvcUqmLyUSlUP8TldzusCTZvnfovO64NNGyn1bGu0utZBK7Z0/8xLFj
   zxtXZ5bTfND/VE4jSR8GDBHfvwC0P6ROS0gbCyZ0imrxEiCClo6YkYTOq
   vhKIDW/crkxVysAq9hXuoFciSfnsh3A1qr5m3qu8gr2w+movaKUyKSUEd
   smVGjnKvkXaklsDcx+G0f2tLA7UR3FR8hDL6nq8+ICF9rj6efenSottjO
   iaOnfj5pAMGaJCiANspgRDcmtg734lur9OBzQH+nr8YkMaDH//H4hXzHC
   g==;
X-CSE-ConnectionGUID: qB1Wco81QJ2abGLaROXdcQ==
X-CSE-MsgGUID: tyvcxdoATm+7DsMbL3S/VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66762087"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="66762087"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 15:38:40 -0800
X-CSE-ConnectionGUID: ei5XJUf4QCqR4gP5YXMhIw==
X-CSE-MsgGUID: 9e72janTTJyGE6whqZtwRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="202136488"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 15:38:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUCib-000000006lz-1LBS;
	Fri, 12 Dec 2025 23:38:37 +0000
Date: Sat, 13 Dec 2025 07:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1]
 drivers/usb/gadget/udc/core.c:56: warning: Function parameter or member
 'connect_lock' not described in 'DEFINE_MUTEX'
Message-ID: <202512130726.DG8JhtMp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   65eb5a4a2e961a9252cefa9936c221b340ba0370
commit: b142000da9e5bcdce59dbb5cf3fd78e05edebedd [0/1] BACKPORT: FROMGIT: usb: gadget: udc: core: Invoke usb_gadget_connect only when started
config: i386-randconfig-053-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130726.DG8JhtMp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130726.DG8JhtMp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130726.DG8JhtMp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/udc/core.c:56: warning: Function parameter or member 'connect_lock' not described in 'DEFINE_MUTEX'
   drivers/usb/gadget/udc/core.c:56: warning: expecting prototype for protects udc->vbus, udc->started, gadget->connect, gadget(). Prototype was for DEFINE_MUTEX() instead


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

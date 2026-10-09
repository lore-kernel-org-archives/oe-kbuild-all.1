Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAB83BFADE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 23:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791587429; cv=none; b=WfellFrD3npFaia7bdamElh1yT9TCIFdymUG4LWSWAewivkvhAuSSpfb4Cr8eDaSKSSMZkLBKmk3SfIR+8CXzc+a555hNM3OvCcGNilblJNhpJU3l9nJHlCOrAAV31W1xdPoL8KZlTFuywzvJcSCM8xglA8SEiQYgy6DQd4kU5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791587429; c=relaxed/simple;
	bh=RCyTDOyBE7v77RBlt3+V5XW087r34HortVVWRin37eI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ruCzn6t926kNkBlWZ+dLfhd5LkrI2yxIasESmkuG6UxIwhaHS0hZNqAPjS9W6XYr3j7nGxlW6qzVvsiM5irDgbv4CYvTcy6AcHuY+dqQpU28ufns+yZ8esUoxtBuuPNrrswInH4YmXVZWAswEuL+rwq6mbQw5prMe/Xw+9Lu/RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rcjtj3WB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rcjtj3WB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791587428; x=1823123428;
  h=date:from:to:cc:subject:message-id;
  bh=RCyTDOyBE7v77RBlt3+V5XW087r34HortVVWRin37eI=;
  b=Rcjtj3WB/13bmHyhZ7kEDCeK9zQOlebQHavSsY2T7AGk5UujspaBeVxn
   a8yxOKqTmpf+8C1hAX9QX56QbRAOF7YFBvPz/8hyd3VKKMdWUt8CSI7m1
   8of51TamhO4tjZAcule417Lc4ri5RubcRrxTirIUX8hYr05njAoCl12Xa
   CDIpi6c7G00P+0O+MHqbVqOok7osd/aVshtkGmc2g3MsPy4rMhGo5DDbH
   CiM+oY081f1XUqlT0htL3CEs3lTo49bz72+LSRguTEbPzyX/BpHK3nry6
   rq519abgxQlr3QBiZ2FsIyhcktZbAod2EEJkzDSo2jOurePNffeJ4WkiC
   Q==;
X-CSE-ConnectionGUID: 7QakflCySleZb4dcjIyRFQ==
X-CSE-MsgGUID: 1oeUZGWeTYyPfvEFZGz7MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="394658"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="394658"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 16:10:28 -0700
X-CSE-ConnectionGUID: X9LKO0AQT3Oo0SYqCUqKHA==
X-CSE-MsgGUID: e0B1J3IOTaqZ7hB1HaxGwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="736897"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 09 Oct 2026 16:10:25 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFJjL-000000007NH-2cRd;
	Fri, 09 Oct 2026 23:10:23 +0000
Date: Sat, 10 Oct 2026 01:09:29 +0200
From: kernel test robot <lkp@intel.com>
To: Honglei Huang <honghuan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Matthew Brost <matthew.brost@intel.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 3138/15343] htmldocs:
 Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:70: WARNING:
 Lexing literal_block 'struct driver_range {\n        struct drm_gpusvm_range
 base;\n        unsigned int num_pages; // 1: inline_pages, >1: pages[]\n
        union {\n  ...
Message-ID: <202610100125.d4Kk60aL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Honglei,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aac26bee2287c88af5be5a5ff96d783b19a28790
commit: cc2a6cbd6823678fe70ba76f88623827a6e06a87 [3138/15343] drm/gpusvm: let drm_gpusvm_get_pages() map an array of pages
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261010/202610100125.d4Kk60aL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100125.d4Kk60aL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:621: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:621: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:621: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:630: ./include/uapi/linux/landlock.h:241: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:630: ./include/uapi/linux/landlock.h:264: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:70: WARNING: Lexing literal_block 'struct driver_range {\n        struct drm_gpusvm_range base;\n        unsigned int num_pages; // 1: inline_pages, >1: pages[]\n        union {\n                struct drm_gpusvm_pages inline_pages;\n                struct drm_gpusvm_pages *pages;\n        };\n};\n\nstatic struct drm_gpusvm_pages *\ndriver_pages(struct driver_range *drange)\n{\n        return drange->num_pages == 1 ? :c:type:`drange->inline_pages <drange>` :\n                                        drange->pages;\n}' as "c" resulted in an error at token: '`'. Retrying in relaxed mode. [misc.highlighting_failure]
>> Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:102: WARNING: Lexing literal_block '// GPU fault handler: one fault, one DMA mapping per device\nerr = drm_gpusvm_get_pages(gpusvm, driver_pages(drange),\n                           drange->num_pages, gpusvm->mm,\n                           :c:type:`range->notifier <range>`->notifier,\n                           drm_gpusvm_range_start(range),\n                           drm_gpusvm_range_end(range), :c:type:`ctx`);\n\n// Notifier callback: mark every instance unmapped in one call\ndrm_gpusvm_range_set_unmapped(range, driver_pages(drange),\n                              drange->num_pages, mmu_range);' as "c" resulted in an error at token: '`'. Retrying in relaxed mode. [misc.highlighting_failure]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD7430BB97
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777720129; cv=none; b=RvEqWZ1QkDAUD9XRu2dxeC/HaoUk3t+UrRmG1NJu0SEJu5ZXoPuUNArKDjzA14hB6GO+K1rJo4RWbCBQCtY2IQDbXTYpvdtW/INjnrW4PeC+MoZiG4bVOI2wdBAlzBTV5rQaZl/KIhJpx7eJvSqpuh2LiivPCcagthcMNL6Msxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777720129; c=relaxed/simple;
	bh=qCnQ+3NqyJe21hO2s3YmF+r3/PzncqV62eFGCmIE/mw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GTWTtfp4ehWj32UYDye0uoTIUzbjnjX/P6sNiIxFoajRcu+PtiglKkxZIoYFs5xpmfMJHSt/ikUt/NzZqJSi4LpWuqAPNP18DYGLT0U9bCqQAJwyL80x4EyNUCGB5ccIB+lba8+nwx0c6j81WisX1UZXwuwjHf4WpSOLglqUdTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwxMIW/k; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwxMIW/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777720128; x=1809256128;
  h=date:from:to:cc:subject:message-id;
  bh=qCnQ+3NqyJe21hO2s3YmF+r3/PzncqV62eFGCmIE/mw=;
  b=CwxMIW/k/u7WU/hvz+PzemTGuGD9Mwu3Qgj+A5Skv/cOe8JQ+B0gNF04
   75u2R5+jzpI41Z0vMPO/0+GtQ2FP80sqInkfdlziVRBBMDVk6MGg8dQa5
   YpG+lGr/cVsdwBRf9vSwuoAk3f0ye9m23s48ui6fXTiKtpKC3gfJCIBx1
   RSgrO0wHBRAnpxtIM1rb8r8DQ9FsFE9MikoNY6o7hWNm1jO7nU6UY6X4A
   qM7J5r0NRF9y4EeYzID4lhUmVOf9Ueuu3n8ceNMRHNzqPvDXZ/fWH+QZm
   eXFpNJ4KulNBMK80MlnoA6qiR5gwqf20DZbhB9DGYlZGIxu6T/sQbp/nn
   A==;
X-CSE-ConnectionGUID: SMi0XQLmSqu7799xR2kCCA==
X-CSE-MsgGUID: 8CbPIh2nTQq+GMAZYAxkmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78686702"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="78686702"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 04:08:45 -0700
X-CSE-ConnectionGUID: LuPGeO0ZTC22ruYF38QoSw==
X-CSE-MsgGUID: Va+qQIcnTBCWPHFO8KNEdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="273179981"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2026 04:08:44 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ8DB-000000001LL-1fpN;
	Sat, 02 May 2026 11:08:41 +0000
Date: Sat, 02 May 2026 19:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-08 1/1]
 include/linux/android_kabi.h:49:17: error: static assertion failed:
 "include/linux/dma-buf.h:540: u64 android_kabi_reserved1 is not aligned the
 same as atomic64_t nr_task_refs"
Message-ID: <202605021844.6VlvKbtW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-08
head:   8b8d5e2c3e3ff66074d9a36841a95442f30b565b
commit: 999934f97fbe42051117cef677a6dd5325cc28a7 [1/1] ANDROID: Use ABI reservations for dmabuf RSS / PSS accounting
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260502/202605021844.6VlvKbtW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021844.6VlvKbtW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605021844.6VlvKbtW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/android_vendor.h:18,
                    from include/linux/mutex.h:23,
                    from include/linux/seqlock.h:19,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from kernel/fork.c:16:
>> include/linux/android_kabi.h:49:17: error: static assertion failed: "include/linux/dma-buf.h:540: u64 android_kabi_reserved1 is not aligned the same as atomic64_t nr_task_refs"
      49 |                 _Static_assert(__alignof__(struct{_new;}) <= __alignof__(struct{_orig;}),       \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:68:17: note: in expansion of macro '__ANDROID_KABI_CHECK_SIZE_ALIGN'
      68 |                 __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new);   \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:113:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     113 |         _ANDROID_KABI_REPLACE(_ANDROID_KABI_RESERVE(number), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:540:9: note: in expansion of macro 'ANDROID_KABI_USE'
     540 |         ANDROID_KABI_USE(1, atomic64_t nr_task_refs);
         |         ^~~~~~~~~~~~~~~~


vim +49 include/linux/android_kabi.h

804873a198f8dc Greg Kroah-Hartman 2020-03-11  37  
804873a198f8dc Greg Kroah-Hartman 2020-03-11  38  /*
804873a198f8dc Greg Kroah-Hartman 2020-03-11  39   * Worker macros, don't use these, use the ones without a leading '_'
804873a198f8dc Greg Kroah-Hartman 2020-03-11  40   */
804873a198f8dc Greg Kroah-Hartman 2020-03-11  41  
804873a198f8dc Greg Kroah-Hartman 2020-03-11  42  #define __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new)				\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  43  	union {									\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  44  		_Static_assert(sizeof(struct{_new;}) <= sizeof(struct{_orig;}),	\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  45  			       __FILE__ ":" __stringify(__LINE__) ": "		\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  46  			       __stringify(_new)				\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  47  			       " is larger than "				\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  48  			       __stringify(_orig) );				\
804873a198f8dc Greg Kroah-Hartman 2020-03-11 @49  		_Static_assert(__alignof__(struct{_new;}) <= __alignof__(struct{_orig;}),	\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  50  			       __FILE__ ":" __stringify(__LINE__) ": "		\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  51  			       __stringify(_orig)				\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  52  			       " is not aligned the same as "			\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  53  			       __stringify(_new) );				\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  54  	}
804873a198f8dc Greg Kroah-Hartman 2020-03-11  55  

:::::: The code at line 49 was first introduced by commit
:::::: 804873a198f8dcb3f9c414ab5dcf40a1fd14b918 ANDROID: GKI: add android_kabi.h

:::::: TO: Greg Kroah-Hartman <gregkh@google.com>
:::::: CC: Jaskaran Singh <quic_jasksing@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

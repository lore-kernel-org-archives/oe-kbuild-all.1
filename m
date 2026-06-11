Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C0F2F1FEC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781181028; cv=none; b=fM7rdqdXSeTv+3ORU7R4pDceFG1FdHOIRXX3+flwfkW5+gF2o6vnUjudmUQ4EEZ+KkX9AGxM4yTV+4Q7oW1K4jFVnFH4GhbXQ0El4466StW+VBI3cj/LXnpo8PNIf7a/zWpa6RXisL5aTUskDoRSCWgSxclHrNPcuJ0FhEblRn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781181028; c=relaxed/simple;
	bh=bOhkO7cgNQ7yCdtKFNug9q8SOK+VLZt0FRsWw0o4Qgg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q75TXLV2FqWBJPo+BQxIs4VMduWdGJLeIWlBMNKsUhyTz0+mNazaXo+QZWtMNn3EYYgpm3EbtCfBULqXmKThH/43ymSl09KP4v/nzur0HxMXm45UK8nD7p8SuKYm0J3OW/m+vD1pF9OD5ajFSwJ6E5rDOz0OlduEbLAYL+QZK3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqayIfLE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqayIfLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781181027; x=1812717027;
  h=date:from:to:cc:subject:message-id;
  bh=bOhkO7cgNQ7yCdtKFNug9q8SOK+VLZt0FRsWw0o4Qgg=;
  b=cqayIfLEmuuQWFxzsrL2Cfe+x1EX/CSPkiKDcD1OUXbG500o0GsvAs5A
   k6iU40L8hp6fxldGnK7Yezz5XLoeUEAUO6j0EGEyanryDLWjkfEPvKpKo
   OHykjWZuxIE0AB5AGAuBPgCiBLhvOh3l7Cw9Q2lD0bok0sDOBuYZvPji7
   KnhcACPf2BGuh9NAgTWai86Q3S4SthV2wJwA0/werSnl8w5VITdRDPdGP
   PoWal2twtz9XXCn42PH91p8Q8Qg3FmRQTRwCaCI+Rvck2F9juq9BlxwkZ
   ROy0whma80bDzsbYAtQ3mHiONlt34ZTenj54C9X9IUpe1HLTYwdtALx/Z
   Q==;
X-CSE-ConnectionGUID: B26jbJIRQ86KWh+mwEGFMQ==
X-CSE-MsgGUID: GbsR0H+4T+aRwToT4YIHWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85830208"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="85830208"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:30:26 -0700
X-CSE-ConnectionGUID: NWiXbXvPRfyBpSVjqlzGPg==
X-CSE-MsgGUID: oi/f6OwiSKarNxaMHyXLGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="246491859"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2026 05:30:25 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXeYA-00000000Mxa-2J0s;
	Thu, 11 Jun 2026 12:30:22 +0000
Date: Thu, 11 Jun 2026 20:29:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-09 1/1]
 include/linux/android_kabi.h:49:17: error: static assertion failed:
 "include/linux/dma-buf.h:540: u64 android_kabi_reserved1 is not aligned the
 same as atomic64_t nr_task_refs"
Message-ID: <202606112037.jZ2DPXVm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mercier,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-09
head:   ecc3e0ec515e0f0ddd4ad755a477529a9597ad3d
commit: 4b2d8222ee51d3aac9c4b9c2b5b758ab17d639b8 [1/1] ANDROID: Use ABI reservations for dmabuf RSS / PSS accounting
config: i386-randconfig-014-20260611 (https://download.01.org/0day-ci/archive/20260611/202606112037.jZ2DPXVm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112037.jZ2DPXVm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112037.jZ2DPXVm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/android_vendor.h:18,
                    from include/linux/mutex.h:23,
                    from include/linux/rhashtable-types.h:14,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/tee/tee_shm_pool.c:5:
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

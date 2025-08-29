Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841DC28E7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 07:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756451854; cv=none; b=ZDDy/wNqYsidCg1KESsdJ4Xw4iwhuZquid86gbR6JEi22QT3DspSy5jEU5ah9uWpTsN70wuRG+Ov/elgjf2kTs6N5L+Gx2/VZGb6HqoV910IDzHcPwa7O/ZddSoIsAdESoycbhYvl4ugzjAHt23ULNL/wQj+ScSgMiwm0n12kFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756451854; c=relaxed/simple;
	bh=xPBTL0WmE5VsvbwEUMz8NNP4pAjFMFy3RkpGO4Xvmfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eDO02jNnNjk+QTGH/6xONVwnZ8uv4qWUllENet5HeLHxLP5g0BX7FSYj4vRMFYlocjslshVOnV3GqzV+T0Ki+YNz6N7H2SDOvGhsMFPMivFrChhSw9yjQlfLTGt17fwO5KYrEdwsD3xMdD+TAiDY3fUjQcNC/2wHjUd6ZXhf1Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HwvTUUgg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwvTUUgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756451853; x=1787987853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xPBTL0WmE5VsvbwEUMz8NNP4pAjFMFy3RkpGO4Xvmfc=;
  b=HwvTUUggljbdWIz/qWZ2NT6CP5Ai3Wr0iAy7B9biSZs0jw4d21I3mdYC
   jF/ql8HDCMNfEx5ziwZha1tCbLpkcaWmfGpBK2Enyec3VXwTRdC6hoFIq
   zYrDKMfZ5s1yV1YmMKvswcCcVSfvaiVo/U7GfH56bmkZBxIqEIEA5YLND
   d7Ka9TApL0v3kLckbL7LcRfv4OaGEWqGldTMBIykO6oSWeUppYEEAn5mT
   iV5iA9QtcY/fBTj2UeeSGLFEgrmf8/LdaJWRG6G3NGzU/qI20e5YoQJWG
   1qpRk3rUf7YiCbQJRbgsdaaexVJ39a/hSfVzvpKkjkkXpPze7Ptrb7vLD
   w==;
X-CSE-ConnectionGUID: XIuCaOdBQz+vI3dNwTafxg==
X-CSE-MsgGUID: D0otPRfDQqSp9miSxhitng==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58801624"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58801624"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 00:17:32 -0700
X-CSE-ConnectionGUID: RUhITWDVR4WnNFIEW7efkw==
X-CSE-MsgGUID: ArCaIqeNR/2QjSO6T79CZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="174490007"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Aug 2025 00:17:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urtMW-000UU7-2A;
	Fri, 29 Aug 2025 07:17:28 +0000
Date: Fri, 29 Aug 2025 15:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 480/480]
 include/linux/android_kabi.h:49:17: error: static assertion failed:
 "include/linux/dma-buf.h:540: u64 android_kabi_reserved1 is not aligned the
 same as atomic64_t nr_task_refs"
Message-ID: <202508291524.d0Ln2Jot-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   4e359eb2f39f6250f497b9e372f14a82fc9a5c8b
commit: 4b2d8222ee51d3aac9c4b9c2b5b758ab17d639b8 [480/480] ANDROID: Use ABI reservations for dmabuf RSS / PSS accounting
config: i386-buildonly-randconfig-001-20250829 (https://download.01.org/0day-ci/archive/20250829/202508291524.d0Ln2Jot-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250829/202508291524.d0Ln2Jot-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508291524.d0Ln2Jot-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/android_vendor.h:18,
                    from include/linux/mutex.h:23,
                    from include/linux/seqlock.h:19,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from mm/slab_common.c:7:
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
--
   In file included from include/linux/android_vendor.h:18,
                    from include/linux/mutex.h:23,
                    from include/linux/seqlock.h:19,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from mm/mmap.c:13:
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
   mm/mmap.c: In function 'do_mas_align_munmap':
   mm/mmap.c:2644:34: warning: variable 'e' set but not used [-Wunused-but-set-variable]
    2644 |                 unsigned long s, e;
         |                                  ^
   mm/mmap.c:2644:31: warning: variable 's' set but not used [-Wunused-but-set-variable]
    2644 |                 unsigned long s, e;
         |                               ^


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

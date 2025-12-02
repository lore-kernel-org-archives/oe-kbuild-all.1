Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC3018A6DB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 02:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764644035; cv=none; b=kL0r040eaaQfI2E9lOn8DjRxBkRhOh/DS08+iOH4shAExy9Ldj5XfnkNGvXKy83EZesEjAGuxS1/ldYNp55Kee1499RBh1Ic9DrQUGtcR7hi5V8MbXMmOxo/AnX7FCuUC4nz5nsQ+EXwZ82k4/i1dg9BUrKqee6YgVI7jOh26Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764644035; c=relaxed/simple;
	bh=2Xl3x4bVRa2lwyK3Wss1GEbRZFSuduU84A/XYHWpxw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RRnI3lxEii9R827r3qW80Sl86mRxK4vcE6Li5ZzYklrLDfPYhgtoKNDjFfGROjURQFuDTFfq1PjmCm1PbJuSRfDfac24P0caOBC8PTeDJyHzdlNoSKSWzORSZ1TcvnqXAtidVE/TMVouP4lf7HApjO71oFYJvuKjg7w3NdYFwe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6vBluyi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6vBluyi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764644034; x=1796180034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Xl3x4bVRa2lwyK3Wss1GEbRZFSuduU84A/XYHWpxw4=;
  b=N6vBluyiPzPlkn/qK3CYMeKxobu/N85safDdm4qry0a0RTvQbuyJxwOm
   VrWXWgzRpaw+s28Eq6kVV1LDveXJvzA9hHxSu24lpI6rxzhPqqimmmtaO
   no+TwP4wofb/BYvpH9zlnqmIPf0VrpJc/5WwTKEwCT12ypUrCNBlDJClW
   4FAr3yuo9+9sKzu8OJcyPH3R3F2Ze/5vUSDg+t8OTs/afVucZiwC79rqJ
   izNDaqRL3/QgsE8jwR6brEB3suD6dviFrYYXuudUMRZ4ZCGo1PaqtWwjV
   wB3UgiAD+h9pB2Ne9GfCTKRtArSA/+7UosH1BzhoUbHj3mj/ABCSZiB85
   Q==;
X-CSE-ConnectionGUID: E3716EJkSMy7GIq636Z7zQ==
X-CSE-MsgGUID: 2kt5rMpATQCxEKBZbPKNYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="92076876"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="92076876"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:53:53 -0800
X-CSE-ConnectionGUID: ZesCezZ/TVehn4VG1eeVWA==
X-CSE-MsgGUID: +yFE+ZGLR6yzz89sYWJENA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="199181297"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Dec 2025 18:53:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQGWT-000000009Lh-3dHh;
	Tue, 02 Dec 2025 02:53:49 +0000
Date: Tue, 2 Dec 2025 10:53:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-09 0/1]
 include/linux/android_kabi.h:49:17: error: static assertion failed:
 "include/linux/dma-buf.h:540: u64 android_kabi_reserved1 is not aligned the
 same as atomic64_t nr_task_refs"
Message-ID: <202512021027.tpCIKz1N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mercier,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-09
head:   678351714175f030fff4c29ab70870a1ace4d63a
commit: 4b2d8222ee51d3aac9c4b9c2b5b758ab17d639b8 [0/1] ANDROID: Use ABI reservations for dmabuf RSS / PSS accounting
config: i386-randconfig-002-20251202 (https://download.01.org/0day-ci/archive/20251202/202512021027.tpCIKz1N-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021027.tpCIKz1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021027.tpCIKz1N-lkp@intel.com/

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

804873a198f8dcb Greg Kroah-Hartman 2020-03-11  37  
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  38  /*
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  39   * Worker macros, don't use these, use the ones without a leading '_'
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  40   */
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  41  
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  42  #define __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new)				\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  43  	union {									\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  44  		_Static_assert(sizeof(struct{_new;}) <= sizeof(struct{_orig;}),	\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  45  			       __FILE__ ":" __stringify(__LINE__) ": "		\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  46  			       __stringify(_new)				\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  47  			       " is larger than "				\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  48  			       __stringify(_orig) );				\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11 @49  		_Static_assert(__alignof__(struct{_new;}) <= __alignof__(struct{_orig;}),	\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  50  			       __FILE__ ":" __stringify(__LINE__) ": "		\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  51  			       __stringify(_orig)				\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  52  			       " is not aligned the same as "			\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  53  			       __stringify(_new) );				\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  54  	}
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  55  

:::::: The code at line 49 was first introduced by commit
:::::: 804873a198f8dcb3f9c414ab5dcf40a1fd14b918 ANDROID: GKI: add android_kabi.h

:::::: TO: Greg Kroah-Hartman <gregkh@google.com>
:::::: CC: Jaskaran Singh <quic_jasksing@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

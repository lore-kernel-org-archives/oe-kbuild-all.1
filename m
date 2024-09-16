Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2CD15957D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 12:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488299; cv=none; b=Pru12xGrIRHpw9xdAiOVXMXM/VL8OBTex0qbdqhDMD6njvLFqVrm8eSotbPILMD4D9N6ylPwUZHluKK97FyouOice/aNJcncrDlAE2GdY31b7S/0uWUT337N3ZsweXuGfm2MPaCfMAsNvTZTwR6WO3uLufFY9CsqgB8kn75TXfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488299; c=relaxed/simple;
	bh=rEnkS6nk1khb/RVES5TMcINq0H8GA86az8LSA9u2DXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVJVZ3Uq55OwPU2UQaHX2YRgbbFcBzBTlCxanU7NfFwI4ygPxxqp2jGXZ7HLxGqliujz9SKlr82OCAGvy4DNgLJwHb2/32XFLdSjM3BJ/onAdoTlQe/DqS2AkAWq1aXmTPEyWAZ5zflX6W1XGkrC0YscTxgjjzwdYNe/6nJgkDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwArndoc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwArndoc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726488297; x=1758024297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rEnkS6nk1khb/RVES5TMcINq0H8GA86az8LSA9u2DXQ=;
  b=YwArndocYfa/wj3rKF7vQjdA6zMSReCnekOuOeRFmRSjMVKZTi62BjfD
   Vm0xOV716acKSJV4PSuZUd5MGTFK6cBIt5kbd2P1oXW+NE2OO6Ey7HEIl
   ZozuaipXUSKQnB0tpDcKstPv0UkFAflULwk+W/ZBIoyWL43lj90/6jmYp
   VvjDWIBr9v0w5rfDzmTA1VSqCkytABRcjZPTcxMeAJWZm9J05azembctD
   Kr1qt5SU8r9D1BobwJ/vnxxpu1sti7R6PY1SHYUjUJRXYPehshe2mg5p+
   /3AruBs7g/ThXgeeMquu7Zfd3hf000PYRrSp154LFcj0m4uAUBIU6j7Bu
   w==;
X-CSE-ConnectionGUID: MWn01tonTsekfQOFo7Yihg==
X-CSE-MsgGUID: 7ttwOAIeRDSZYvJ130lVFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="50725740"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="50725740"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:04:54 -0700
X-CSE-ConnectionGUID: 6uaKbpvzSVq815m0rC0G1g==
X-CSE-MsgGUID: jAFaUSOlSXqrpjEaH35G6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="99694803"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Sep 2024 05:04:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqATL-0009oo-18;
	Mon, 16 Sep 2024 12:04:51 +0000
Date: Mon, 16 Sep 2024 20:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/6] percpu-refcount: Extend managed mode to allow runtime
 switching
Message-ID: <202409161915.iIfJbiNy-lkp@intel.com>
References: <20240916050811.473556-4-Neeraj.Upadhyay@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916050811.473556-4-Neeraj.Upadhyay@amd.com>

Hi Neeraj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on linus/master dennis-percpu/for-next v6.11 next-20240916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Neeraj-Upadhyay/percpu-refcount-Add-managed-mode-for-RCU-released-objects/20240916-131210
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20240916050811.473556-4-Neeraj.Upadhyay%40amd.com
patch subject: [RFC 3/6] percpu-refcount: Extend managed mode to allow runtime switching
config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20240916/202409161915.iIfJbiNy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161915.iIfJbiNy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161915.iIfJbiNy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   lib/percpu-refcount.c: In function 'percpu_ref_test_flush_release_work':
>> lib/percpu-refcount.c:741:26: error: 'last_percpu_ref_node' undeclared (first use in this function); did you mean 'next_percpu_ref_node'?
     741 |         while (READ_ONCE(last_percpu_ref_node) != NULL && max_count--)
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:23: note: in definition of macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/percpu-refcount.c:741:16: note: in expansion of macro 'READ_ONCE'
     741 |         while (READ_ONCE(last_percpu_ref_node) != NULL && max_count--)
         |                ^~~~~~~~~
   lib/percpu-refcount.c:741:26: note: each undeclared identifier is reported only once for each function it appears in
     741 |         while (READ_ONCE(last_percpu_ref_node) != NULL && max_count--)
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:23: note: in definition of macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/percpu-refcount.c:741:16: note: in expansion of macro 'READ_ONCE'
     741 |         while (READ_ONCE(last_percpu_ref_node) != NULL && max_count--)
         |                ^~~~~~~~~


vim +741 lib/percpu-refcount.c

377193f4f16a1b Neeraj Upadhyay 2024-09-16  722  
377193f4f16a1b Neeraj Upadhyay 2024-09-16  723  void percpu_ref_test_flush_release_work(void)
377193f4f16a1b Neeraj Upadhyay 2024-09-16  724  {
377193f4f16a1b Neeraj Upadhyay 2024-09-16  725  	int max_flush = READ_ONCE(max_scan_count);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  726  	int max_count = 1000;
377193f4f16a1b Neeraj Upadhyay 2024-09-16  727  
377193f4f16a1b Neeraj Upadhyay 2024-09-16  728  	/* Complete any executing release work */
377193f4f16a1b Neeraj Upadhyay 2024-09-16  729  	flush_delayed_work(&percpu_ref_release_work);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  730  	/* Scan till the end of the llist */
377193f4f16a1b Neeraj Upadhyay 2024-09-16  731  	WRITE_ONCE(max_scan_count, INT_MAX);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  732  	/* max scan count update visible to release work */
377193f4f16a1b Neeraj Upadhyay 2024-09-16  733  	smp_mb();
377193f4f16a1b Neeraj Upadhyay 2024-09-16  734  	flush_delayed_work(&percpu_ref_release_work);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  735  	/* max scan count update visible to release work */
377193f4f16a1b Neeraj Upadhyay 2024-09-16  736  	smp_mb();
377193f4f16a1b Neeraj Upadhyay 2024-09-16  737  	WRITE_ONCE(max_scan_count, 1);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  738  	/* max scan count update visible to work */
377193f4f16a1b Neeraj Upadhyay 2024-09-16  739  	smp_mb();
377193f4f16a1b Neeraj Upadhyay 2024-09-16  740  	flush_delayed_work(&percpu_ref_release_work);
377193f4f16a1b Neeraj Upadhyay 2024-09-16 @741  	while (READ_ONCE(last_percpu_ref_node) != NULL && max_count--)
377193f4f16a1b Neeraj Upadhyay 2024-09-16  742  		flush_delayed_work(&percpu_ref_release_work);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  743  	/* max scan count update visible to work */
377193f4f16a1b Neeraj Upadhyay 2024-09-16  744  	smp_mb();
377193f4f16a1b Neeraj Upadhyay 2024-09-16  745  	WRITE_ONCE(max_scan_count, max_flush);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  746  }
377193f4f16a1b Neeraj Upadhyay 2024-09-16  747  EXPORT_SYMBOL_GPL(percpu_ref_test_flush_release_work);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  748  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

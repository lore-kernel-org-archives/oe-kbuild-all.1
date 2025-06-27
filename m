Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F792EBDE5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 20:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751055165; cv=none; b=IGoZvwMCN+YRABk07uPK4O6A18VdMWM9fBbrFycpAdF9LooyOppx2vPa9aq7NuF8tLsWz2IOH84lDdqjJvGJ5YDdkHOgptjkwsJ16awE0nby+Mk0Jsy0UZmBCcdc/F3zehXmHZ60L92Mw6HRRTZvVdeqttoTE5/6DrX5H/g3+MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751055165; c=relaxed/simple;
	bh=Q3KZT0Npr6synI5d8Qanys68ufCRfmcfjhC4Gu/eVLw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r5LYJJBGP82cGZegE8uvOs/CpjqAYkjiZwFdq9/nF+TtwUcQh2XSNjpz1MMWO0TzfWg/mYakdyy/j9XV61ExK6Xg1OgWpygDhKTL/BT7367MqptM+N8JvoLN7icyuLVUbvWyS2cDFp1gPpediiLSR/LiZ4W2fvN5V1Xhmsb2Pdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrRGrsUV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrRGrsUV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751055163; x=1782591163;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Q3KZT0Npr6synI5d8Qanys68ufCRfmcfjhC4Gu/eVLw=;
  b=nrRGrsUV30gvwUXZzCVSfBfrizkkvZZfzgXKt0sR5Hh0Wg1GY/+c+wmU
   5Whsy2D37bsyvHEbR3PbHZBFRxwQrO9ypCZfMo9ZPf2N2iZNZgWNYGm8t
   yaY+VbwLylkq95XKX3UfMh3AvzGgPWmLfrlG36IDdn4NSH47P+wTvL8NO
   La5TWipUNJmVEdvISb2BOljwf39N7ixnBijKyQorB6rSWWfAVS54r6pZQ
   yRGyZhiLsg1KwIg3AMvyL/iTlAzZhERUwrQDFoa+hPWiePtknBEuthgzU
   roKkgU/+PlNv0T6zgsEWsKqkytKsWcmuBkNKhOM5b8fK58cSj3mkJFbmq
   g==;
X-CSE-ConnectionGUID: W+TVnRs8SamnS3/MswC9WQ==
X-CSE-MsgGUID: gDm7Iv6NQzahZY13xcjcwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53501448"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53501448"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:12:42 -0700
X-CSE-ConnectionGUID: mjMPQIW8TNGj40dojRiVzw==
X-CSE-MsgGUID: S2FVB/9GRrSFbqCN5B1LrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="190075283"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Jun 2025 13:12:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVFR8-000WVm-0o;
	Fri, 27 Jun 2025 20:12:38 +0000
Date: Sat, 28 Jun 2025 04:12:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 5606/5998] kernel/bpf/helpers.c:3315:17: sparse:
 sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202506280434.kvMzVe89-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: 886178a33a30fe685e926d84f531243982fb3c70 [5606/5998] Merge git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf after rc3
config: riscv-randconfig-r123-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280434.kvMzVe89-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250628/202506280434.kvMzVe89-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280434.kvMzVe89-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c:1198:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long ( *[usertype] callback_fn )( ... ) @@     got void [noderef] __rcu * @@
   kernel/bpf/helpers.c:1198:21: sparse:     expected unsigned long long ( *[usertype] callback_fn )( ... )
   kernel/bpf/helpers.c:1198:21: sparse:     got void [noderef] __rcu *
   kernel/bpf/helpers.c:2472:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2502:18: sparse: sparse: symbol 'bpf_cgroup_release_dtor' was not declared. Should it be static?
>> kernel/bpf/helpers.c:3315:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   kernel/bpf/helpers.c:3315:17: sparse:     expected void const [noderef] __user *from
   kernel/bpf/helpers.c:3315:17: sparse:     got char *
   kernel/bpf/helpers.c:3316:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   kernel/bpf/helpers.c:3316:17: sparse:     expected void const [noderef] __user *from
   kernel/bpf/helpers.c:3316:17: sparse:     got char *
   kernel/bpf/helpers.c:3355:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   kernel/bpf/helpers.c:3355:17: sparse:     expected void const [noderef] __user *from
   kernel/bpf/helpers.c:3355:17: sparse:     got char *
   kernel/bpf/helpers.c:3409:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   kernel/bpf/helpers.c:3409:17: sparse:     expected void const [noderef] __user *from
   kernel/bpf/helpers.c:3409:17: sparse:     got char *
   kernel/bpf/helpers.c:3441:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   kernel/bpf/helpers.c:3441:17: sparse:     expected void const [noderef] __user *from
   kernel/bpf/helpers.c:3441:17: sparse:     got char *
   kernel/bpf/helpers.c:3474:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   kernel/bpf/helpers.c:3474:17: sparse:     expected void const [noderef] __user *from
   kernel/bpf/helpers.c:3474:17: sparse:     got char *
   kernel/bpf/helpers.c:3524:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   kernel/bpf/helpers.c:3524:17: sparse:     expected void const [noderef] __user *from
   kernel/bpf/helpers.c:3524:17: sparse:     got char *
   kernel/bpf/helpers.c:3528:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   kernel/bpf/helpers.c:3528:25: sparse:     expected void const [noderef] __user *from
   kernel/bpf/helpers.c:3528:25: sparse:     got char *
   kernel/bpf/helpers.c:3568:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   kernel/bpf/helpers.c:3568:17: sparse:     expected void const [noderef] __user *from
   kernel/bpf/helpers.c:3568:17: sparse:     got char *
   kernel/bpf/helpers.c:3572:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   kernel/bpf/helpers.c:3572:25: sparse:     expected void const [noderef] __user *from
   kernel/bpf/helpers.c:3572:25: sparse:     got char *
   kernel/bpf/helpers.c:3614:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   kernel/bpf/helpers.c:3614:25: sparse:     expected void const [noderef] __user *from
   kernel/bpf/helpers.c:3614:25: sparse:     got char *
   kernel/bpf/helpers.c:3617:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   kernel/bpf/helpers.c:3617:25: sparse:     expected void const [noderef] __user *from
   kernel/bpf/helpers.c:3617:25: sparse:     got char *
   kernel/bpf/helpers.c:2920:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c:2925:18: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +3315 kernel/bpf/helpers.c

f95695f2c46592 Yonghong Song 2025-05-23  3281  
e91370550f1fe6 Viktor Malik  2025-06-26  3282  /*
e91370550f1fe6 Viktor Malik  2025-06-26  3283   * Kfuncs for string operations.
e91370550f1fe6 Viktor Malik  2025-06-26  3284   *
e91370550f1fe6 Viktor Malik  2025-06-26  3285   * Since strings are not necessarily %NUL-terminated, we cannot directly call
e91370550f1fe6 Viktor Malik  2025-06-26  3286   * in-kernel implementations. Instead, we open-code the implementations using
e91370550f1fe6 Viktor Malik  2025-06-26  3287   * __get_kernel_nofault instead of plain dereference to make them safe.
e91370550f1fe6 Viktor Malik  2025-06-26  3288   */
e91370550f1fe6 Viktor Malik  2025-06-26  3289  
e91370550f1fe6 Viktor Malik  2025-06-26  3290  /**
e91370550f1fe6 Viktor Malik  2025-06-26  3291   * bpf_strcmp - Compare two strings
e91370550f1fe6 Viktor Malik  2025-06-26  3292   * @s1__ign: One string
e91370550f1fe6 Viktor Malik  2025-06-26  3293   * @s2__ign: Another string
e91370550f1fe6 Viktor Malik  2025-06-26  3294   *
e91370550f1fe6 Viktor Malik  2025-06-26  3295   * Return:
e91370550f1fe6 Viktor Malik  2025-06-26  3296   * * %0       - Strings are equal
e91370550f1fe6 Viktor Malik  2025-06-26  3297   * * %-1      - @s1__ign is smaller
e91370550f1fe6 Viktor Malik  2025-06-26  3298   * * %1       - @s2__ign is smaller
e91370550f1fe6 Viktor Malik  2025-06-26  3299   * * %-EFAULT - Cannot read one of the strings
e91370550f1fe6 Viktor Malik  2025-06-26  3300   * * %-E2BIG  - One of strings is too large
e91370550f1fe6 Viktor Malik  2025-06-26  3301   * * %-ERANGE - One of strings is outside of kernel address space
e91370550f1fe6 Viktor Malik  2025-06-26  3302   */
e91370550f1fe6 Viktor Malik  2025-06-26  3303  __bpf_kfunc int bpf_strcmp(const char *s1__ign, const char *s2__ign)
e91370550f1fe6 Viktor Malik  2025-06-26  3304  {
e91370550f1fe6 Viktor Malik  2025-06-26  3305  	char c1, c2;
e91370550f1fe6 Viktor Malik  2025-06-26  3306  	int i;
e91370550f1fe6 Viktor Malik  2025-06-26  3307  
e91370550f1fe6 Viktor Malik  2025-06-26  3308  	if (!copy_from_kernel_nofault_allowed(s1__ign, 1) ||
e91370550f1fe6 Viktor Malik  2025-06-26  3309  	    !copy_from_kernel_nofault_allowed(s2__ign, 1)) {
e91370550f1fe6 Viktor Malik  2025-06-26  3310  		return -ERANGE;
e91370550f1fe6 Viktor Malik  2025-06-26  3311  	}
e91370550f1fe6 Viktor Malik  2025-06-26  3312  
e91370550f1fe6 Viktor Malik  2025-06-26  3313  	guard(pagefault)();
e91370550f1fe6 Viktor Malik  2025-06-26  3314  	for (i = 0; i < XATTR_SIZE_MAX; i++) {
e91370550f1fe6 Viktor Malik  2025-06-26 @3315  		__get_kernel_nofault(&c1, s1__ign, char, err_out);
e91370550f1fe6 Viktor Malik  2025-06-26  3316  		__get_kernel_nofault(&c2, s2__ign, char, err_out);
e91370550f1fe6 Viktor Malik  2025-06-26  3317  		if (c1 != c2)
e91370550f1fe6 Viktor Malik  2025-06-26  3318  			return c1 < c2 ? -1 : 1;
e91370550f1fe6 Viktor Malik  2025-06-26  3319  		if (c1 == '\0')
e91370550f1fe6 Viktor Malik  2025-06-26  3320  			return 0;
e91370550f1fe6 Viktor Malik  2025-06-26  3321  		s1__ign++;
e91370550f1fe6 Viktor Malik  2025-06-26  3322  		s2__ign++;
e91370550f1fe6 Viktor Malik  2025-06-26  3323  	}
e91370550f1fe6 Viktor Malik  2025-06-26  3324  	return -E2BIG;
e91370550f1fe6 Viktor Malik  2025-06-26  3325  err_out:
e91370550f1fe6 Viktor Malik  2025-06-26  3326  	return -EFAULT;
e91370550f1fe6 Viktor Malik  2025-06-26  3327  }
e91370550f1fe6 Viktor Malik  2025-06-26  3328  

:::::: The code at line 3315 was first introduced by commit
:::::: e91370550f1fe6fa3b02e8bf9762e3dc0a02fcad bpf: Add kfuncs for read-only string operations

:::::: TO: Viktor Malik <vmalik@redhat.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

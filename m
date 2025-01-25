Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFA44A05
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 13:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737812165; cv=none; b=rymN4yon3Bcqn6IosQo91h8fpf9OsnRWH7IF35HIkgbzSYzVVEyJwnVbQ0vugiCUscnkSPljQSBKhKIeYqoDyKk9OCrifca2D2VRTRgXVeLPZTpfEs6uHKEN6Q7FSMvhjHw9tbwUgWeiqJOp0emGlT6Ig3zyVYW3l3bfLkNvO2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737812165; c=relaxed/simple;
	bh=32BZscNnlHl3Ybyz36JQoZA4vwMVgZU7hKltZtMiAzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pZkJRro1F+GeujLgImhJxRXMzviGci+4MBES7iz6sBehiHOuO6DWzj90Y80wQc8zqqrRBDAPJPhoePFUV17MJ+15E6ioQIx33jFILQphj7UhHKJgAZ88Jg7CVnGu30QmmLTzo0x/tvb7QaciDXb7UfULSeLi2+bp4TZEVU5L6pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMz2p4zV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMz2p4zV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737812164; x=1769348164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=32BZscNnlHl3Ybyz36JQoZA4vwMVgZU7hKltZtMiAzM=;
  b=UMz2p4zVKUnxuT8TLmS1u0oA7lMvQfMj7jZo9o2X4augLYVtqan3Yqv+
   /3fHXXcZndq8nNuylAsuggUS6EF8robEnFIB3ctSxClH8xVVfif3zbKHh
   6M/z38szr1KCUIXcNGIm/y7gaCFBl5IsBsjhVwIHjujt80ccdQH0j8zW2
   unDeOy2R0m1eVCQMdEJJJgE5j0iwV044I/m3IMNAn3ZkYWM4Qp8RBnMDp
   rvT5dtUv8aJj3LXkPYYzH11ap1onlJ/4lUGWykLGkm0nBw0BOaszrguec
   pwi6ueAgBH1hJhG2QRLfP4doyl/6V1vwVb5+NPt8beRRScy0sBNrRREzP
   w==;
X-CSE-ConnectionGUID: RRJnnMMnQGe8/vt4hECfIg==
X-CSE-MsgGUID: qP5BrOACRd+5EGFztIPvqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="49728985"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="49728985"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 05:36:03 -0800
X-CSE-ConnectionGUID: o92gnFBkT9aKvI9Xy2cVEw==
X-CSE-MsgGUID: K9yiy4e5SheuCZikoyv0hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131316569"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jan 2025 05:36:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbgKN-000dqR-2S;
	Sat, 25 Jan 2025 13:35:59 +0000
Date: Sat, 25 Jan 2025 21:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:compat_get_cpumask 8/8] kernel/compat.c:120:30: error:
 incompatible pointer types passing 'cpumask_var_t' (aka 'struct cpumask *')
 to parameter of type 'struct cpumask_t *'
Message-ID: <202501252135.IXnFKMG5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux compat_get_cpumask
head:   b7162e407638adc57cdf6d6f1acea90f9d84a638
commit: b7162e407638adc57cdf6d6f1acea90f9d84a638 [8/8] kernel/compat
config: x86_64-randconfig-005-20250125 (https://download.01.org/0day-ci/archive/20250125/202501252135.IXnFKMG5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501252135.IXnFKMG5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501252135.IXnFKMG5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/compat.c:12:
   include/linux/compat.h:955:32: warning: declaration of 'struct cpumask_t' will not be visible outside of this function [-Wvisibility]
     955 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                                ^
   In file included from kernel/compat.c:17:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/compat.c:120:30: error: incompatible pointer types passing 'cpumask_var_t' (aka 'struct cpumask *') to parameter of type 'struct cpumask_t *' [-Werror,-Wincompatible-pointer-types]
     120 |         retval = compat_get_cpumask(new_mask, user_mask_ptr, len);
         |                                     ^~~~~~~~
   include/linux/compat.h:955:43: note: passing argument to parameter 'cpumask' here
     955 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                                           ^
   kernel/compat.c:208:32: warning: declaration of 'struct cpumask_t' will not be visible outside of this function [-Wvisibility]
     208 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                                ^
   kernel/compat.c:208:6: error: conflicting types for 'compat_get_cpumask'
     208 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |      ^
   include/linux/compat.h:955:6: note: previous declaration is here
     955 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |      ^
   kernel/compat.c:214:26: error: incomplete definition of type 'struct cpumask_t'
     214 |         ret = compat_get_bitmap(cpumask_bits(cpumask), umask, ncpus);
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: note: expanded from macro 'cpumask_bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                              ~~~~~~~^
   kernel/compat.c:208:32: note: forward declaration of 'struct cpumask_t'
     208 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                                ^
   kernel/compat.c:216:22: error: incompatible pointer types passing 'struct cpumask_t *' to parameter of type 'struct cpumask *' [-Werror,-Wincompatible-pointer-types]
     216 |                 cpumask_clear_from(cpumask, ncpus);
         |                                    ^~~~~~~
   include/linux/cpumask.h:631:64: note: passing argument to parameter 'dstp' here
     631 | static __always_inline void cpumask_clear_from(struct cpumask *dstp, unsigned long cpu)
         |                                                                ^
   5 warnings and 4 errors generated.


vim +120 kernel/compat.c

   109	
   110	COMPAT_SYSCALL_DEFINE3(sched_setaffinity, compat_pid_t, pid,
   111			       unsigned int, len,
   112			       compat_ulong_t __user *, user_mask_ptr)
   113	{
   114		cpumask_var_t new_mask;
   115		int retval;
   116	
   117		if (!alloc_cpumask_var(&new_mask, GFP_KERNEL))
   118			return -ENOMEM;
   119	
 > 120		retval = compat_get_cpumask(new_mask, user_mask_ptr, len);
   121		if (retval)
   122			goto out;
   123	
   124		retval = sched_setaffinity(pid, new_mask);
   125	out:
   126		free_cpumask_var(new_mask);
   127		return retval;
   128	}
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

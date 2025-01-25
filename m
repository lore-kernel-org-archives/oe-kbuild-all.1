Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCD71E7C3A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 11:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737805857; cv=none; b=NDD9KCiA6LgblXsprnK2sjy7UPlxfpDKgeAX8jklSkbHXvs8Nhl4jg4PDCEK8eDLmTV/t1LX9SgARjWqbIOwhrADXcNDoYDhPxFiffUFc3SYrcPlMZoz1zpdd6IY4fjLX0VO8FIl2C29DUMgyYMYeM4A0eG9GWjfupMwf0pIt4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737805857; c=relaxed/simple;
	bh=KpeHWwhTJLvVk1HCVrZEf+eG7qi8ccOnsvyo3ypef/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=egFAYL1JgP5uXD7joI7GxRIggLA+0MlKj+nOvG/gZz0WtELorWygeHvocaWJQusKloxac6H+6ZcKBopPzueLR9zXgHbWHpdqdPiIdgYNYQUnG+eljsoavQSb6nHBnXORlIIguDFgGr4gN3MftNCVsSgtfJ0pLjazMRSecPW/y28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lghnKeal; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lghnKeal"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737805856; x=1769341856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KpeHWwhTJLvVk1HCVrZEf+eG7qi8ccOnsvyo3ypef/E=;
  b=lghnKealIrWmmObUUonVZRQNvDYsdDx+Q2rvVgyAsf+JhZ2xiVQ5cyOw
   QWwMe8d0LP/mNXzgjfm/kkSZm2IoV+fDG5cK5W00i9mm4zktNpfIhdewP
   gnJcFBnfHI7Eq68AUV/QietGuZsurreiRpbn1F8uQZhBdhLwCQMS2Rb80
   noNXg32gXLrSJ+fIsDX9TRGDjfK9xsc885aBEib0vqnR5Cp73oEfqsGwT
   kOwt93DCsnLFnK/xgAzu08CdIExGErYNX9MkXOLFOPLcvQBUMPSIdJux6
   0J2vJBwwfqOo3e3GwrWLCUFbzxX/ZOcCRnmr3/LlCU7haReKuf5hLEuxY
   A==;
X-CSE-ConnectionGUID: cDCBaTB8QYazxfkWKhO7AA==
X-CSE-MsgGUID: 1V+knlfHTla7+fHStCVf8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49748159"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49748159"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 03:50:54 -0800
X-CSE-ConnectionGUID: fnHMfTGVQbOPxKyl79lRaQ==
X-CSE-MsgGUID: 88Fe9u/bTiiGbnizHEosHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="108537797"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Jan 2025 03:50:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbegc-000dmV-1b;
	Sat, 25 Jan 2025 11:50:50 +0000
Date: Sat, 25 Jan 2025 19:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:compat_get_cpumask 7/8] io_uring/register.c:241:28: error:
 incompatible pointer types passing 'cpumask_var_t' (aka 'struct cpumask[1]')
 to parameter of type 'struct cpumask_t *'
Message-ID: <202501251940.IZypUF5Z-lkp@intel.com>
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
commit: bba742e7f4aab4b879cc1620c1b57be76607bff8 [7/8] io_uring/register.c: use compat_get_cpumask
config: x86_64-randconfig-008-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251940.IZypUF5Z-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251940.IZypUF5Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251940.IZypUF5Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/register.c:9:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:5:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   include/linux/compat.h:955:32: warning: declaration of 'struct cpumask_t' will not be visible outside of this function [-Wvisibility]
     955 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                                ^
   io_uring/register.c:114:24: warning: arithmetic between different enumeration types ('enum io_uring_register_restriction_op' and 'enum io_uring_register_op') [-Wenum-enum-conversion]
     114 |         if (!arg || nr_args > IORING_MAX_RESTRICTIONS)
         |                               ^~~~~~~~~~~~~~~~~~~~~~~
   io_uring/register.c:34:58: note: expanded from macro 'IORING_MAX_RESTRICTIONS'
      34 | #define IORING_MAX_RESTRICTIONS (IORING_RESTRICTION_LAST + \
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~ ^
      35 |                                  IORING_REGISTER_LAST + IORING_OP_LAST)
         |                                  ~~~~~~~~~~~~~~~~~~~~
>> io_uring/register.c:241:28: error: incompatible pointer types passing 'cpumask_var_t' (aka 'struct cpumask[1]') to parameter of type 'struct cpumask_t *' [-Werror,-Wincompatible-pointer-types]
     241 |                 ret = compat_get_cpumask(new_mask, (const compat_ulong_t __user *)arg, len);
         |                                          ^~~~~~~~
   include/linux/compat.h:955:43: note: passing argument to parameter 'cpumask' here
     955 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                                           ^
   2 warnings and 1 error generated.


vim +241 io_uring/register.c

   229	
   230	static __cold int io_register_iowq_aff(struct io_ring_ctx *ctx,
   231					       void __user *arg, unsigned len)
   232	{
   233		cpumask_var_t new_mask;
   234		int ret;
   235	
   236		if (!alloc_cpumask_var(&new_mask, GFP_KERNEL))
   237			return -ENOMEM;
   238	
   239	#ifdef CONFIG_COMPAT
   240		if (in_compat_syscall())
 > 241			ret = compat_get_cpumask(new_mask, (const compat_ulong_t __user *)arg, len);
   242		else
   243	#endif
   244			ret = copy_iowq_aff_cpus(new_mask, arg, len);
   245	
   246		if (ret) {
   247			free_cpumask_var(new_mask);
   248			return -EFAULT;
   249		}
   250	
   251		ret = __io_register_iowq_aff(ctx, new_mask);
   252		free_cpumask_var(new_mask);
   253		return ret;
   254	}
   255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

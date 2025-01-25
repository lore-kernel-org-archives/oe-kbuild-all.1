Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956F5200CB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737822143; cv=none; b=Z0IMB/XOTToitt4HwC6A2KKqXmAtWCRVSlE0FDbh8tdnCthG3sRf6ZuxrQLQf8+piGbpAm0uJwBbGL+QiT0FB4rrHJ81hDpDGanHNdtmih0ZpLISrsgp2NsdPtbgkM2kzRTRV/E0VnZ0Ofuh/LlNpRLS8bKmNJYKsryXfU3SuPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737822143; c=relaxed/simple;
	bh=twvfuCvVKEbB1ZPojjUzEKUTZUJu2Lpq7be4CYT5GXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mr4DGwKUdAhMEM33UkoR5QWlI4TPOR6XbEH9YHo3QP++T1vWlC1jz4aA+gc11p7chJmeyVCpRMpR3IT+i2sDUiSvuH59U7AfFukomFpmoLjPcVNr3wAPykFH8sWJ7MRGLNqR+uWX1l3n3l4wKmhprlgXJLqoAcDtwhgpHVVcRn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdsvE0qP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdsvE0qP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737822142; x=1769358142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=twvfuCvVKEbB1ZPojjUzEKUTZUJu2Lpq7be4CYT5GXo=;
  b=LdsvE0qPja1F7/fbIUmFlaTBXVb02beS7V7MNjUTFBvMZb3chQgLknhR
   AbKEYb6w+mhEKUjEmT+6MyuJUcNeKO5LO/wZGpYfhdkNQozQxMd9Zlvft
   0Iofb9d4Vk5HEx3VQk514XtggamrBFJubWDtkPS35Gn8CpzfthcDHrMxe
   zG50UW343qiMi7N3aplLJS+CxNU4mLAs6wuBq1wLzBNieHErM8ft+ppii
   6uV1I6u0pMb2ez/HYV/HBS0c11BgZRWblKkVuPFEX+F2OrgSmRPwYxTB8
   oxodwOpNeQCcyKaYvBMns7A5/dZBpngMmnrylzBteoqBYwu4dXKApM9cJ
   Q==;
X-CSE-ConnectionGUID: mylDIwLqT2OrTbOOz6qT7A==
X-CSE-MsgGUID: 1I1nA+4xTUW7rCpimr0Eyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="48843421"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="48843421"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 08:22:21 -0800
X-CSE-ConnectionGUID: kZUAtC+rSAaFOcCNv180rA==
X-CSE-MsgGUID: 99vMyKqhRCqr2s+EFwJGPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107891914"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Jan 2025 08:22:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbivJ-000e0v-2T;
	Sat, 25 Jan 2025 16:22:17 +0000
Date: Sun, 26 Jan 2025 00:21:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:compat_get_cpumask 7/8] io_uring/register.c:241:42: error:
 passing argument 1 of 'compat_get_cpumask' from incompatible pointer type
Message-ID: <202501260050.iJS9eGMt-lkp@intel.com>
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
config: x86_64-randconfig-004-20250125 (https://download.01.org/0day-ci/archive/20250126/202501260050.iJS9eGMt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501260050.iJS9eGMt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501260050.iJS9eGMt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/ia32.h:7,
                    from arch/x86/include/asm/elf.h:10,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:94,
                    from io_uring/register.c:9:
   include/linux/compat.h:955:32: warning: 'struct cpumask_t' declared inside parameter list will not be visible outside of this definition or declaration
     955 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                                ^~~~~~~~~
   io_uring/register.c: In function 'io_register_iowq_aff':
>> io_uring/register.c:241:42: error: passing argument 1 of 'compat_get_cpumask' from incompatible pointer type [-Werror=incompatible-pointer-types]
     241 |                 ret = compat_get_cpumask(new_mask, (const compat_ulong_t __user *)arg, len);
         |                                          ^~~~~~~~
         |                                          |
         |                                          struct cpumask *
   In file included from arch/x86/include/asm/ia32.h:7,
                    from arch/x86/include/asm/elf.h:10,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:94,
                    from io_uring/register.c:9:
   include/linux/compat.h:955:43: note: expected 'struct cpumask_t *' but argument is of type 'struct cpumask *'
     955 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                         ~~~~~~~~~~~~~~~~~~^~~~~~~
   cc1: some warnings being treated as errors


vim +/compat_get_cpumask +241 io_uring/register.c

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

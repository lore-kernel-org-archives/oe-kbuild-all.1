Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD180C154
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 13:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709471634; cv=none; b=q5ZeaCQ/moTqQTCrOIl51M9D7AmXx4WYR5p7nieikDqGiOnCa9yCfBx0dQvHr0Vvg5nQtqspO1zVOuGFPU1xzKIoZnk+oUUOeJN6ILvDGJ2LyaGufiAx5ts+QOtOueb+TbMDmCvNUNYjgPxLXVoYQXKSQO6FkPA3jVYhDR7pbJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709471634; c=relaxed/simple;
	bh=185kTR94VxP44dFqN6E1bvtpZ/MRd+mJYZ2MweI4/Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LcE/GlVtZs3TrozLDBOQpSfsMPzEfe0Getzw0XAidcQ1x80KPklIXWdqw+swUkbInbH6f90CHcOLzVZgPgiKCpDbs27yMtRWlHO2XruENgDMHphR7NKWh6kuC5JNYqTjxVFyuCL/iqw7OT3ZW6WX9Tm2BydBLX6aU+cA0q4NfoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNVZcbFV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNVZcbFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709471633; x=1741007633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=185kTR94VxP44dFqN6E1bvtpZ/MRd+mJYZ2MweI4/Ao=;
  b=jNVZcbFVay3iF4XOM3Hz0IQaYa5rxDr0mQn6YGsWgUYgqyIpT/va6+y9
   hSY4DUDNZoLXjToDpn2eRnHfdnYQ7WQugTioDvGjv816E++1NcTB0OkDt
   +C879LbBbe8SOr2QcODbYQ2+aTxAgoc7YhIMo2tMGsTZLE3xSYtO/8azs
   5jWrPOgW20mutY2Pj4PGwG574k15RZ+qqag5jVG/N05NdjBtjL4pLS/oR
   +WrF5yzeUJUje7NyWkEtckGmWDs+lz1JtDQ3CWe4Ts7p8iVv94HDK9Ww1
   R0UFRDgQmdYDMSHGS/mGxEsGkm4jTueU2Vjhvqqzq7Hx0RiOmp+tCIK8P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="14676190"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="14676190"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 05:13:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="8655247"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Mar 2024 05:13:48 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rglez-0001mW-38;
	Sun, 03 Mar 2024 13:13:45 +0000
Date: Sun, 3 Mar 2024 21:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Wagner <wagi@monom.org>
Subject: [cip:linux-4.19.y-cip-rt-rebase 25246/29558]
 include/asm-generic/percpu.h:151:9: error: implicit declaration of function
 'raw_local_irq_save'
Message-ID: <202403032119.OKB1owl6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   dce1701e767e33da39db64fe691cd4783ec7dbbf
commit: 2c16891623cc7e8c0c4144f8665d117c7fc94552 [25246/29558] Revert "percpu: include irqflags.h for raw_local_irq_save()"
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240303/202403032119.OKB1owl6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403032119.OKB1owl6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403032119.OKB1owl6-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   In file included from ./arch/um/include/generated/asm/percpu.h:1,
                    from include/linux/percpu.h:13,
                    from include/linux/bpf-cgroup.h:7,
                    from kernel/bpf/local_storage.c:2:
   include/linux/bpf-cgroup.h: In function 'bpf_cgroup_storage_set':
>> include/asm-generic/percpu.h:151:9: error: implicit declaration of function 'raw_local_irq_save' [-Werror=implicit-function-declaration]
     151 |         raw_local_irq_save(__flags);                                    \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:337:41: note: in expansion of macro 'this_cpu_generic_to_op'
     337 | #define this_cpu_write_1(pcp, val)      this_cpu_generic_to_op(pcp, val, =)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:378:25: note: in expansion of macro 'this_cpu_write_1'
     378 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:509:41: note: in expansion of macro '__pcpu_size_call'
     509 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/bpf-cgroup.h:112:9: note: in expansion of macro 'this_cpu_write'
     112 |         this_cpu_write(bpf_cgroup_storage, &buf->data[0]);
         |         ^~~~~~~~~~~~~~
>> include/asm-generic/percpu.h:153:9: error: implicit declaration of function 'raw_local_irq_restore' [-Werror=implicit-function-declaration]
     153 |         raw_local_irq_restore(__flags);                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:337:41: note: in expansion of macro 'this_cpu_generic_to_op'
     337 | #define this_cpu_write_1(pcp, val)      this_cpu_generic_to_op(pcp, val, =)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:378:25: note: in expansion of macro 'this_cpu_write_1'
     378 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:509:41: note: in expansion of macro '__pcpu_size_call'
     509 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/bpf-cgroup.h:112:9: note: in expansion of macro 'this_cpu_write'
     112 |         this_cpu_write(bpf_cgroup_storage, &buf->data[0]);
         |         ^~~~~~~~~~~~~~
   In file included from include/linux/uaccess.h:14,
                    from include/linux/compat.h:19,
                    from include/linux/filter.h:12,
                    from kernel/bpf/local_storage.c:5:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:36: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/jump_label.h:77,
                    from include/linux/bpf-cgroup.h:6:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:31:26: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:398:23: note: in definition of macro '__compiletime_assert'
     398 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:418:9: note: in expansion of macro '_compiletime_assert'
     418 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_assert'
      45 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:69:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      69 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:31:9: note: in expansion of macro 'BUILD_BUG_ON'
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/memremap.h:7,
                    from include/linux/mm.h:27,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/skbuff.h:34,
                    from include/linux/filter.h:13:
   include/linux/mm.h: In function 'pgtable_init':
   arch/um/include/asm/pgtable.h:35:33: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      35 | #define pgtable_cache_init() do ; while (0)
         |                                 ^
   include/linux/mm.h:1929:9: note: in expansion of macro 'pgtable_cache_init'
    1929 |         pgtable_cache_init();
         |         ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/raw_local_irq_save +151 include/asm-generic/percpu.h

e88d62cd4b2f0b1 Mark Rutland    2017-09-26  147  
eba117889ac444b Tejun Heo       2014-06-17  148  #define this_cpu_generic_to_op(pcp, val, op)				\
9c28278a24c01c0 Tejun Heo       2014-06-17  149  do {									\
eba117889ac444b Tejun Heo       2014-06-17  150  	unsigned long __flags;						\
eba117889ac444b Tejun Heo       2014-06-17 @151  	raw_local_irq_save(__flags);					\
1b5ca12127427c5 Nicholas Piggin 2016-09-22  152  	raw_cpu_generic_to_op(pcp, val, op);				\
eba117889ac444b Tejun Heo       2014-06-17 @153  	raw_local_irq_restore(__flags);					\
9c28278a24c01c0 Tejun Heo       2014-06-17  154  } while (0)
9c28278a24c01c0 Tejun Heo       2014-06-17  155  
1b5ca12127427c5 Nicholas Piggin 2016-09-22  156  

:::::: The code at line 151 was first introduced by commit
:::::: eba117889ac444bea6e8270049cbaeed48169889 percpu: preffity percpu header files

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

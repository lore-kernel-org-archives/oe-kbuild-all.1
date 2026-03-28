Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7453E3019C3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 06:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774680980; cv=none; b=MmFX5o2spGVrM2H5pUjS6ZC9HhUpYUoIyT8z3In7hDhE0P3sZqv8JqubCKjsS19QtHU4plEkyQo4PWVE4sr3pYvGCsCbvOE72EWC70DVgHV/dqgsJBE+ff3Okggf+murlf1wFiRGm2mKTqIh0ZTfqLWaj3RgeIXHC+ZjmyGGu9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774680980; c=relaxed/simple;
	bh=u4wh01rjv9wSOhiEKs4uTTb8LOmji09UEa5KScFeeow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbmE8wvedCFmwHo3FlnmEqLa4ovMDHN/yd28rg4poe2NMTuX+pwZ+JjhHSWN/+SZLYBL4xlHH4fJKpTWncasl1Xb2gtxi3341TG/QRGhU/uMIclJ4/uqtxrG9vXV2I/LK8MSWAGqIHr+75zcwCrQfEuteRzbGKUn3UA6yKqZcT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwNMHtmu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwNMHtmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774680979; x=1806216979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u4wh01rjv9wSOhiEKs4uTTb8LOmji09UEa5KScFeeow=;
  b=UwNMHtmuMcjvjRm43wuhnUvXgEYHrUmfCImMS0PwAEY7JH2WQ++tMymw
   /EGCFm/suUGDSK5wZoMgmhMkZdI72GmKUrbfmb/6QlJNHZDHDqvnmvMsz
   8Xtyuci7y0IjRwCXWhtOO3VFuvo4s8QLOGHlcB876mg7MLClpb4/8C6il
   hMvt0uMFzKq4yor5yOkbsUS93BlW5HSGmq5nimE337iqxkwmhnh4ZdvZQ
   1TAU7vkUOqVueydqdpTI08aSnaBqdGZ1EpjOWdHZdTIVFBnXKb0wfn3GQ
   mV32EfHLaGhKcmcAjgFYSHQ6ShiutGlMm1E8r/PG+4w7rHlRVKf3nWL0D
   Q==;
X-CSE-ConnectionGUID: 9vqk28chTwieEm23FfUxWA==
X-CSE-MsgGUID: bnIXzGZbTBS/83FP3Dl8yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75717469"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="75717469"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 23:56:18 -0700
X-CSE-ConnectionGUID: sgrDdqdVTjqkDWUWV/ve1g==
X-CSE-MsgGUID: 7Ay2PM5oQVmplgf7SpyrFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="225417354"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Mar 2026 23:56:14 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6NaJ-00000000B8r-1Yv7;
	Sat, 28 Mar 2026 06:55:51 +0000
Date: Sat, 28 Mar 2026 14:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, tglx@kernel.org,
	zhipeng.wang_1@nxp.com
Cc: oe-kbuild-all@lists.linux.dev, shawnguo@kernel.org, jstultz@google.com,
	linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH resend v1 1/7] clocksource/drivers/timer-probe: Create a
 platform_device before the framework is initialized
Message-ID: <202603281427.LUamgyCn-lkp@intel.com>
References: <20260327180600.8150-2-daniel.lezcano@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327180600.8150-2-daniel.lezcano@kernel.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on rockchip/for-next arnd-asm-generic/master linus/master v7.0-rc5 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/clocksource-drivers-timer-probe-Create-a-platform_device-before-the-framework-is-initialized/20260328-080154
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20260327180600.8150-2-daniel.lezcano%40kernel.org
patch subject: [PATCH resend v1 1/7] clocksource/drivers/timer-probe: Create a platform_device before the framework is initialized
config: x86_64-randconfig-013-20260328 (https://download.01.org/0day-ci/archive/20260328/202603281427.LUamgyCn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603281427.LUamgyCn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603281427.LUamgyCn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/current.h:11,
                    from arch/x86/include/asm/processor.h:17,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from arch/x86/entry/vdso/vdso32/../common/vclock_gettime.c:11,
                    from arch/x86/entry/vdso/vdso32/vclock_gettime.c:1:
   arch/x86/include/asm/tlbflush.h: In function 'cpu_tlbstate_update_lam':
>> arch/x86/include/asm/tlbflush.h:468:46: warning: right shift count >= width of type [-Wshift-count-overflow]
     468 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |                                              ^~
   arch/x86/include/asm/percpu.h:145:69: note: in definition of macro '__raw_cpu_write'
     145 |         *(qual __my_cpu_type(pcp) * __force)__my_cpu_ptr(&(pcp)) = (val);       \
         |                                                                     ^~~
   include/linux/percpu-defs.h:369:25: note: in expansion of macro 'this_cpu_write_1'
     369 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/tlbflush.h:468:9: note: in expansion of macro 'this_cpu_write'
     468 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |         ^~~~~~~~~~~~~~
>> arch/x86/include/asm/tlbflush.h:468:46: warning: right shift count >= width of type [-Wshift-count-overflow]
     468 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |                                              ^~
   arch/x86/include/asm/percpu.h:145:69: note: in definition of macro '__raw_cpu_write'
     145 |         *(qual __my_cpu_type(pcp) * __force)__my_cpu_ptr(&(pcp)) = (val);       \
         |                                                                     ^~~
   include/linux/percpu-defs.h:370:25: note: in expansion of macro 'this_cpu_write_2'
     370 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/tlbflush.h:468:9: note: in expansion of macro 'this_cpu_write'
     468 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |         ^~~~~~~~~~~~~~
>> arch/x86/include/asm/tlbflush.h:468:46: warning: right shift count >= width of type [-Wshift-count-overflow]
     468 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |                                              ^~
   arch/x86/include/asm/percpu.h:145:69: note: in definition of macro '__raw_cpu_write'
     145 |         *(qual __my_cpu_type(pcp) * __force)__my_cpu_ptr(&(pcp)) = (val);       \
         |                                                                     ^~~
   include/linux/percpu-defs.h:371:25: note: in expansion of macro 'this_cpu_write_4'
     371 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/tlbflush.h:468:9: note: in expansion of macro 'this_cpu_write'
     468 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |         ^~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/percpu.h:598:
>> arch/x86/include/asm/tlbflush.h:468:46: warning: right shift count >= width of type [-Wshift-count-overflow]
     468 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |                                              ^~
   include/asm-generic/percpu.h:87:33: note: in definition of macro 'raw_cpu_generic_to_op'
      87 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:412:41: note: in expansion of macro 'this_cpu_generic_to_op'
     412 | #define this_cpu_write_8(pcp, val)      this_cpu_generic_to_op(pcp, val, =)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:372:25: note: in expansion of macro 'this_cpu_write_8'
     372 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/tlbflush.h:468:9: note: in expansion of macro 'this_cpu_write'
     468 |         this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
         |         ^~~~~~~~~~~~~~
   In file included from include/linux/kasan.h:38,
                    from include/linux/slab.h:264,
                    from include/linux/fs.h:45,
                    from include/linux/compat.h:17,
                    from arch/x86/include/asm/ia32.h:7,
                    from arch/x86/include/asm/elf.h:10,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/platform_device.h:13,
                    from include/linux/clocksource.h:21,
                    from include/clocksource/hyperv_timer.h:16,
                    from arch/x86/include/asm/vdso/gettimeofday.h:20,
                    from include/vdso/datapage.h:196,
                    from arch/x86/include/uapi/../../../../lib/vdso/gettimeofday.c:6,
                    from arch/x86/entry/vdso/vdso32/../common/vclock_gettime.c:16:
   include/linux/pgtable.h: At top level:
   include/linux/pgtable.h:2204:2: error: #error Missing MAX_POSSIBLE_PHYSMEM_BITS definition
    2204 | #error Missing MAX_POSSIBLE_PHYSMEM_BITS definition
         |  ^~~~~
   arch/x86/include/asm/ia32.h:28:8: error: redefinition of 'struct stat64'
      28 | struct stat64 {
         |        ^~~~~~
   In file included from include/linux/stat.h:6,
                    from include/linux/sysfs.h:22,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:18,
                    from include/linux/clocksource.h:19:
   arch/x86/include/uapi/asm/stat.h:42:8: note: originally defined here
      42 | struct stat64 {
         |        ^~~~~~


vim +468 arch/x86/include/asm/tlbflush.h

82721d8b25d76c Kiryl Shutsemau 2023-03-12  465  
ec225f8c255fd0 Yosry Ahmed     2024-07-02  466  static inline void cpu_tlbstate_update_lam(unsigned long lam, u64 untag_mask)
82721d8b25d76c Kiryl Shutsemau 2023-03-12  467  {
ec225f8c255fd0 Yosry Ahmed     2024-07-02 @468  	this_cpu_write(cpu_tlbstate.lam, lam >> X86_CR3_LAM_U57_BIT);
ec225f8c255fd0 Yosry Ahmed     2024-07-02  469  	this_cpu_write(tlbstate_untag_mask, untag_mask);
82721d8b25d76c Kiryl Shutsemau 2023-03-12  470  }
82721d8b25d76c Kiryl Shutsemau 2023-03-12  471  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

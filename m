Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D89329E5A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 07:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774683602; cv=none; b=LBh4XT0ynmWY79uUlxLjq4OQARwGdG4nt/3hYbCBVcV6d4fkzzYqJKOUR04Mrx52Sejoj6mjiduBAkTs6vfvAtKpyU7Z0kGnmCTlfqEGNR/s8B89kjahtcCwWAXkasHH+xOnxgDN9oaV2HPbeB6a1zmIEhRNqTm3oeN91iiEPSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774683602; c=relaxed/simple;
	bh=xUsjCOBapIbvp0V/Xo4IQLUAZj6YlC3OqctsEc/RFrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQPmu/OVxJ9WPeEWR2dHir4XPfY7fSzTj4/AdRE8dLT+UmPkApCprObHoYeVMtTMyRKB73Nz2Nli+NANaNDbqebxTcVSS6iuioo8eMBjxmb19mXRkuoodEKgH7yjtMC46dEUgNGz6nhAyD7715H2OlHuVRt/RjhKNu/vHi7Wg3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcpohxAE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcpohxAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774683600; x=1806219600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xUsjCOBapIbvp0V/Xo4IQLUAZj6YlC3OqctsEc/RFrw=;
  b=LcpohxAE+jT3lrpv83c4whvxsGcouu0U0Fbg67uTvefJg+FpxJXhgZOs
   ZSgum5Lp25N+3ho6GQyUKt64DjbnFThKOI68XCqjwGmYisAtqSOqwUrAg
   9vSZApsoVjPzpeMo5oxM7u+q3UTW5kniTK3/tjsMh4ITV6K1suqHCqPli
   q43FMek2tWaBRiHYqy5OzFngCyeoOHY43bHs9xoquoIFaX3qIYmVuKmVe
   Ie/J+OCf4bp/T8R9MdphJCne2bsTzw8PS8ccEtz2m5HQdsZfasA4KbMA2
   apG3G2XgT0ny3ZgIHor8LVgLuiWes1cNnGSkkCm+C90ZUIC+uQTqx0T9m
   g==;
X-CSE-ConnectionGUID: otpMOvikTriujHeV4TaRjA==
X-CSE-MsgGUID: UIwuoBazQKev5qxnmC/AIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="74781182"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="74781182"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 00:40:00 -0700
X-CSE-ConnectionGUID: uLBYQSYbTsaW6KngClo+cg==
X-CSE-MsgGUID: 4QgXjyFkQiCsDACscdvbBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="220671755"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Mar 2026 00:39:56 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6OGv-00000000BBh-3Ity;
	Sat, 28 Mar 2026 07:39:53 +0000
Date: Sat, 28 Mar 2026 15:39:19 +0800
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
Message-ID: <202603281507.BshDOBFT-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/timers/core]
[also build test ERROR on rockchip/for-next arnd-asm-generic/master linus/master v7.0-rc5 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/clocksource-drivers-timer-probe-Create-a-platform_device-before-the-framework-is-initialized/20260328-080154
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20260327180600.8150-2-daniel.lezcano%40kernel.org
patch subject: [PATCH resend v1 1/7] clocksource/drivers/timer-probe: Create a platform_device before the framework is initialized
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260328/202603281507.BshDOBFT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603281507.BshDOBFT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603281507.BshDOBFT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/processor.h:21,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from arch/x86/entry/vdso/vdso32/../common/vclock_gettime.c:11,
                    from arch/x86/entry/vdso/vdso32/vclock_gettime.c:1:
   arch/x86/include/asm/pgtable.h: In function 'pte_flags_pkey':
>> arch/x86/include/asm/pgtable_types.h:69:43: warning: left shift count >= width of type [-Wshift-count-overflow]
      69 | #define _PAGE_PKEY_BIT0 (_AT(pteval_t, 1) << _PAGE_BIT_PKEY_BIT0)
         |                                           ^~
   arch/x86/include/asm/pgtable_types.h:80:26: note: in expansion of macro '_PAGE_PKEY_BIT0'
      80 | #define _PAGE_PKEY_MASK (_PAGE_PKEY_BIT0 | \
         |                          ^~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:1598:29: note: in expansion of macro '_PAGE_PKEY_MASK'
    1598 |         return (pte_flags & _PAGE_PKEY_MASK) >> _PAGE_BIT_PKEY_BIT0;
         |                             ^~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:70:43: warning: left shift count >= width of type [-Wshift-count-overflow]
      70 | #define _PAGE_PKEY_BIT1 (_AT(pteval_t, 1) << _PAGE_BIT_PKEY_BIT1)
         |                                           ^~
   arch/x86/include/asm/pgtable_types.h:81:26: note: in expansion of macro '_PAGE_PKEY_BIT1'
      81 |                          _PAGE_PKEY_BIT1 | \
         |                          ^~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:1598:29: note: in expansion of macro '_PAGE_PKEY_MASK'
    1598 |         return (pte_flags & _PAGE_PKEY_MASK) >> _PAGE_BIT_PKEY_BIT0;
         |                             ^~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:71:43: warning: left shift count >= width of type [-Wshift-count-overflow]
      71 | #define _PAGE_PKEY_BIT2 (_AT(pteval_t, 1) << _PAGE_BIT_PKEY_BIT2)
         |                                           ^~
   arch/x86/include/asm/pgtable_types.h:82:26: note: in expansion of macro '_PAGE_PKEY_BIT2'
      82 |                          _PAGE_PKEY_BIT2 | \
         |                          ^~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:1598:29: note: in expansion of macro '_PAGE_PKEY_MASK'
    1598 |         return (pte_flags & _PAGE_PKEY_MASK) >> _PAGE_BIT_PKEY_BIT0;
         |                             ^~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:72:43: warning: left shift count >= width of type [-Wshift-count-overflow]
      72 | #define _PAGE_PKEY_BIT3 (_AT(pteval_t, 1) << _PAGE_BIT_PKEY_BIT3)
         |                                           ^~
   arch/x86/include/asm/pgtable_types.h:83:26: note: in expansion of macro '_PAGE_PKEY_BIT3'
      83 |                          _PAGE_PKEY_BIT3)
         |                          ^~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:1598:29: note: in expansion of macro '_PAGE_PKEY_MASK'
    1598 |         return (pte_flags & _PAGE_PKEY_MASK) >> _PAGE_BIT_PKEY_BIT0;
         |                             ^~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/tlbflush.h:17,
                    from arch/x86/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:13,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs/super_types.h:13,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
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
>> arch/x86/include/asm/pgtable.h:1598:46: warning: right shift count >= width of type [-Wshift-count-overflow]
    1598 |         return (pte_flags & _PAGE_PKEY_MASK) >> _PAGE_BIT_PKEY_BIT0;
         |                                              ^~
   arch/x86/include/asm/tlbflush.h: In function 'pte_flags_need_flush':
>> arch/x86/include/asm/pgtable_types.h:69:43: warning: left shift count >= width of type [-Wshift-count-overflow]
      69 | #define _PAGE_PKEY_BIT0 (_AT(pteval_t, 1) << _PAGE_BIT_PKEY_BIT0)
         |                                           ^~
   arch/x86/include/asm/tlbflush.h:377:45: note: in expansion of macro '_PAGE_PKEY_BIT0'
     377 |                           _PAGE_PAT_LARGE | _PAGE_PKEY_BIT0 | _PAGE_PKEY_BIT1 |
         |                                             ^~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:70:43: warning: left shift count >= width of type [-Wshift-count-overflow]
      70 | #define _PAGE_PKEY_BIT1 (_AT(pteval_t, 1) << _PAGE_BIT_PKEY_BIT1)
         |                                           ^~
   arch/x86/include/asm/tlbflush.h:377:63: note: in expansion of macro '_PAGE_PKEY_BIT1'
     377 |                           _PAGE_PAT_LARGE | _PAGE_PKEY_BIT0 | _PAGE_PKEY_BIT1 |
         |                                                               ^~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:71:43: warning: left shift count >= width of type [-Wshift-count-overflow]
      71 | #define _PAGE_PKEY_BIT2 (_AT(pteval_t, 1) << _PAGE_BIT_PKEY_BIT2)
         |                                           ^~
   arch/x86/include/asm/tlbflush.h:378:27: note: in expansion of macro '_PAGE_PKEY_BIT2'
     378 |                           _PAGE_PKEY_BIT2 | _PAGE_PKEY_BIT3 | _PAGE_NX;
         |                           ^~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:72:43: warning: left shift count >= width of type [-Wshift-count-overflow]
      72 | #define _PAGE_PKEY_BIT3 (_AT(pteval_t, 1) << _PAGE_BIT_PKEY_BIT3)
         |                                           ^~
   arch/x86/include/asm/tlbflush.h:378:45: note: in expansion of macro '_PAGE_PKEY_BIT3'
     378 |                           _PAGE_PKEY_BIT2 | _PAGE_PKEY_BIT3 | _PAGE_NX;
         |                                             ^~~~~~~~~~~~~~~
   arch/x86/include/asm/ia32.h: At top level:
>> arch/x86/include/asm/ia32.h:28:8: error: redefinition of 'struct stat64'
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


vim +28 arch/x86/include/asm/ia32.h

^1da177e4c3f415 include/asm-x86_64/ia32.h Linus Torvalds 2005-04-16  24  
^1da177e4c3f415 include/asm-x86_64/ia32.h Linus Torvalds 2005-04-16  25  /* This matches struct stat64 in glibc2.2, hence the absolutely
^1da177e4c3f415 include/asm-x86_64/ia32.h Linus Torvalds 2005-04-16  26   * insane amounts of padding around dev_t's.
^1da177e4c3f415 include/asm-x86_64/ia32.h Linus Torvalds 2005-04-16  27   */
^1da177e4c3f415 include/asm-x86_64/ia32.h Linus Torvalds 2005-04-16 @28  struct stat64 {
^1da177e4c3f415 include/asm-x86_64/ia32.h Linus Torvalds 2005-04-16  29  	unsigned long long	st_dev;
^1da177e4c3f415 include/asm-x86_64/ia32.h Linus Torvalds 2005-04-16  30  	unsigned char		__pad0[4];
^1da177e4c3f415 include/asm-x86_64/ia32.h Linus Torvalds 2005-04-16  31  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

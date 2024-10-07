Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB3C42077
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 06:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728283177; cv=none; b=tup68alhyJ8kICVIdQfzS+/g/qIKIuEz/3K1+OP0ZHZS9Ube2pzCiR3O7wCbVwNmDQFF6SPVhNAwG+vbmFgiznQA0zCzhoNbP+xgF8rPBFuZJy2UQdOHxGnQcRYaJ+FY3kayimeFeG27dDnNzCoxxW675ZuW8W9w/0ketpJ/TWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728283177; c=relaxed/simple;
	bh=kOUC8SMjLh+dTQ/RavQKNZTkMdVm568YdAbTm9kGs4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LkgCu5hX06rSIpNslnhKO55TySb2ioalAQboC9o6rGygoFKRtG+upHjiKyvyJfOY4bSibE75UqTOYvcS3Hcv9o4rbGpFWrwWLOZbV4T3bqv7GVeJFZJJvQd4d/JcMfXQ0U7L1H7M322Yky0wpjLpfmWPG1ikSGcwMeX6epn3gas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bntQeNkx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bntQeNkx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728283176; x=1759819176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kOUC8SMjLh+dTQ/RavQKNZTkMdVm568YdAbTm9kGs4s=;
  b=bntQeNkxIT5Qw32kdQEXjKWi/laA7tpBFyF4SaS/eZD2M7Tz5S/3A2Kx
   2k1lkR0nvp1nhDWOI5OXzHUZ8AJoqijwVRrk/h7RpYxpi45aQx2pJ4gDA
   pyj6Irkk2spmRoA0lgx5qKRul5AYVgNGcMmcqk8exPstkyRkVwUdO15ik
   D+0zHMeBURLsT3D1KkQ0H4+USJtDd1a56ocbrcju9rVX4Jt1+26Yidcpv
   IfPZtJEM27zs/qgdMYBuGq7gWIU8AhwGJCDlx2AH1GFxtONk+QZqfJzK5
   yVtnYY1KGcs/ypqfhYBxWHqi5kc35BElseUoiCj8SVWiYMc3BbKsEeQzU
   A==;
X-CSE-ConnectionGUID: iAjBgHIbRXyrozRxhcVPyw==
X-CSE-MsgGUID: Kxi6OVNvQRSNqpVekLdeqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="31120213"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="31120213"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 23:39:35 -0700
X-CSE-ConnectionGUID: 7olVZ9SdSqC+gcjgJhdX9A==
X-CSE-MsgGUID: tdaW/f5tRY+vAdZ7nIHcJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="80326655"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Oct 2024 23:39:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxhP1-0004gG-0r;
	Mon, 07 Oct 2024 06:39:31 +0000
Date: Mon, 7 Oct 2024 14:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 8557/23811] lib/test_sort.o: warning:
 objtool: missing symbol for section .text.unlikely
Message-ID: <202410071411.kGlEzJT5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: 775947c125d5bd6e00e0dcf9d12c57fd5d44d07f [8557/23811] asm-generic: fix -Wtype-limits compiler warnings
config: x86_64-buildonly-randconfig-003-20240925 (https://download.01.org/0day-ci/archive/20241007/202410071411.kGlEzJT5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410071411.kGlEzJT5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410071411.kGlEzJT5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/test_sort.o: warning: objtool: missing symbol for section .text.unlikely
--
>> lib/test_list_sort.o: warning: objtool: missing symbol for section .text.unlikely
--
>> lib/test_printf.o: warning: objtool: missing symbol for section .text.unlikely
--
>> drivers/hwmon/coretemp.o: warning: objtool: missing symbol for section .text.unlikely
--
>> drivers/hsi/hsi_boardinfo.o: warning: objtool: missing symbol for section .text.unlikely
--
   drivers/mtd/nand/raw/diskonchip.c: In function 'DoC_Delay':
   drivers/mtd/nand/raw/diskonchip.c:220:23: warning: variable 'dummy' set but not used [-Wunused-but-set-variable]
     220 |         volatile char dummy;
         |                       ^~~~~
   drivers/mtd/nand/raw/diskonchip.c: In function 'doc200x_calculate_ecc':
   drivers/mtd/nand/raw/diskonchip.c:845:13: warning: variable 'emptymatch' set but not used [-Wunused-but-set-variable]
     845 |         int emptymatch = 1;
         |             ^~~~~~~~~~
   In file included from include/linux/kernel.h:14,
                    from drivers/mtd/nand/raw/diskonchip.c:18:
   drivers/mtd/nand/raw/diskonchip.c: In function 'doc_probe':
   include/linux/printk.h:348:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
     348 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/diskonchip.c:1497:25: note: in expansion of macro 'pr_err'
    1497 |                         pr_err("DiskOnChip Millennium Plus 32MB is not supported, ignoring.\n");
         |                         ^~~~~~
   drivers/mtd/nand/raw/diskonchip.c:1498:17: note: here
    1498 |                 default:
         |                 ^~~~~~~
>> drivers/mtd/nand/raw/diskonchip.o: warning: objtool: missing symbol for section .text.unlikely
--
   kernel/events/hw_breakpoint.c:84:12: warning: no previous prototype for 'hw_breakpoint_weight' [-Wmissing-prototypes]
      84 | __weak int hw_breakpoint_weight(struct perf_event *bp)
         |            ^~~~~~~~~~~~~~~~~~~~
   kernel/events/hw_breakpoint.c:232:13: warning: no previous prototype for 'arch_unregister_hw_breakpoint' [-Wmissing-prototypes]
     232 | __weak void arch_unregister_hw_breakpoint(struct perf_event *bp)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/hw_breakpoint.c:458: warning: Function parameter or member 'context' not described in 'register_user_hw_breakpoint'
   kernel/events/hw_breakpoint.c:557: warning: Function parameter or member 'context' not described in 'register_wide_hw_breakpoint'
>> kernel/events/hw_breakpoint.o: warning: objtool: missing symbol for section .text.unlikely
--
>> drivers/thermal/intel_powerclamp.o: warning: objtool: missing symbol for section .text.unlikely
--
>> drivers/clk/bcm/clk-iproc-asiu.o: warning: objtool: missing symbol for section .text.unlikely
--
>> drivers/clk/renesas/clk-div6.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08362248B3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828489; cv=none; b=puN9wIw457kzYbQgBYIqHRQAQln678A3LAvlIA0HY83NPU3mXGrcF2sQmIDQQhUwFKNvrbK1SfmBTaF87MjCbVZUEeMArHwL83eXsqrjERgu0F/B6uMD03UNMmOzoelrZGfiYxC6g52Ruj5maNr8WhlWi3mXEL4pwbNfPCKUC8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828489; c=relaxed/simple;
	bh=qrrN2mH3BxoXa8txPtd7pZtJ1gnffi+5mgvU1WcxZfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z76dS/c3rG+bcTFwR0ybLMPtiZ2uy5W5IEiMwYF+9VQExY0R4T0ZU7+4mN363jCfnzksvqOeVdpNSFjapjEzpGgHq0VFpsN411+bKT4q4HJgVXQAG7WMWJkf7RV+lWyip6kkf2hbxRkETvjuCk2ZOnWpF8urgJ03Gaeie8nk2L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JgDasrsh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgDasrsh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738828487; x=1770364487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qrrN2mH3BxoXa8txPtd7pZtJ1gnffi+5mgvU1WcxZfA=;
  b=JgDasrshFE+Ipmol/iT3o4ln9CmnAeTEyHWmfcr0ynbH4MjzDSFi+G42
   nT+UfMlPf2MEWmevhpbXlAgcOSCSe27VFG/hVxJXIf9XTViuUBg4O+kUM
   FQSfGYiZiBp0cHoI244KAbCATl2U6zXsM6uXdJkv/hEgOT5gxEN3ALXPf
   UsJcj6C81uyp6Bkk47t1ZA5PnRDWPd9BstuR7Jrf9PNjviN8vmWVDZLbK
   HTtyOWAmLsbpLIJ25eF1HWg/G9IkB3Zl0q5kiGhoRMJJqHLzM+mDMNAgz
   7Wk8zfjp3v2E4NgCIpylMMPS450Nws+iYfiOuNJrMctLw/lqUPlmQSaFt
   g==;
X-CSE-ConnectionGUID: /5tP/WNHSKO/j/ovBpJZzA==
X-CSE-MsgGUID: CREx6j62T0u9J5dTGdBZQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50407288"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="50407288"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 23:54:46 -0800
X-CSE-ConnectionGUID: XuuIOlRhQ6msiAFnQOUTGw==
X-CSE-MsgGUID: to1zffh0QjO8Kp8dvDgiTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111595163"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Feb 2025 23:54:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfwig-000wbB-27;
	Thu, 06 Feb 2025 07:54:42 +0000
Date: Thu, 6 Feb 2025 15:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.01.30a 71/73] include/linux/printk.h:319:13:
 warning: 'pr_flush' defined but not used
Message-ID: <202502061518.dcr0Ff3b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2025.01.30a
head:   a87cfdd8dfd5499a8b2e29a40ce4ad6ffca6eb56
commit: 1edbc527e3d6610b4781edba8e927ebca102eaf6 [71/73] fixup! printk: Flush console log from kernel_power_off()
config: xtensa-randconfig-002-20250206 (https://download.01.org/0day-ci/archive/20250206/202502061518.dcr0Ff3b-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061518.dcr0Ff3b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061518.dcr0Ff3b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from ./arch/xtensa/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
>> include/linux/printk.h:319:13: warning: 'pr_flush' defined but not used [-Wunused-function]
     319 | static bool pr_flush(int timeout_ms, bool reset_on_progress)
         |             ^~~~~~~~
--
   drivers/clk/clkdev.c: In function 'vclkdev_alloc':
   drivers/clk/clkdev.c:185:17: warning: function 'vclkdev_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     185 |                 res = vsnprintf(cla->dev_id, sizeof(cla->dev_id), dev_fmt, ap);
         |                 ^~~
   In file included from include/asm-generic/bug.h:22,
                    from ./arch/xtensa/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/xtensa/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/clk/clkdev.c:9:
   include/linux/printk.h: At top level:
>> include/linux/printk.h:319:13: warning: 'pr_flush' defined but not used [-Wunused-function]
     319 | static bool pr_flush(int timeout_ms, bool reset_on_progress)
         |             ^~~~~~~~
--
   In file included from include/asm-generic/bug.h:22,
                    from ./arch/xtensa/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
>> include/linux/printk.h:319:13: warning: 'pr_flush' defined but not used [-Wunused-function]
     319 | static bool pr_flush(int timeout_ms, bool reset_on_progress)
         |             ^~~~~~~~
   In file included from include/asm-generic/bug.h:22,
                    from ./arch/xtensa/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/xtensa/kernel/asm-offsets.c:20:
>> include/linux/printk.h:319:13: warning: 'pr_flush' defined but not used [-Wunused-function]
     319 | static bool pr_flush(int timeout_ms, bool reset_on_progress)
         |             ^~~~~~~~


vim +/pr_flush +319 include/linux/printk.h

   318	
 > 319	static bool pr_flush(int timeout_ms, bool reset_on_progress)
   320	{
   321		return true;
   322	}
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

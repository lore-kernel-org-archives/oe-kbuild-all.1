Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA242C182
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 19:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726861453; cv=none; b=ENx+v0rhbFR2i65hOVTnTLt1gdKlMADGapLocU3YpHs3rTA2nJpHAUHBVmL0MI/lCaAKKS0eMw23QMXvvu2knmf85itk3jJq+SFBziAHcsZVP73zFRQMkp4noQ9Z0jCaGbdzWBMEa+Vay+JgBfXZZWYtYpRbP8NGtV9V+1PgBP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726861453; c=relaxed/simple;
	bh=8qi0H08qffXf1iCDvtqbCKMEJ0oVA1OfL52U1OV9oQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NNByPO8gYuwHcgx3ihC6eTF7ryJajsqwWMlDD3gD4qs02yLaEGvsesAZXr/pXchzdlguCI9hko4LI9Xl5bIGBOg44hoGKtDoEB1BUqKP7Rkft3ovSzVl6q7k+A+Rwu1HV2YIgy0ngzrdbLDL1WFqnGC3Of/mBxaIOlhk21VeU0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehA4FwWp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehA4FwWp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726861451; x=1758397451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8qi0H08qffXf1iCDvtqbCKMEJ0oVA1OfL52U1OV9oQI=;
  b=ehA4FwWpLXeMKVzmYpAf5UQ1q88N1LbPg/b5cx/HhsKWZEbcgHY1mn7j
   0Wh4mZmfva13lruWR9Bum+MbsXE0UvDPaP4jdRlL3Uz/IRBTxeabM1e7O
   WGpqtlrt1pvVSLrtKcGZPWMdAAzNuNiEF8pBFQN+oYn5CeK5SV+Vx1S6C
   rIlmq4GCHCa63rp+zysNn3B8cDXcloxC/InBWFyxlJVbWca0Pcoz5D/7Q
   Y1fQDMGTf3y7CZ0zeimu5Tss/Orce35BBegA3d0snz871szlP+LFsJxqJ
   ofbkH425rw0CWTfe1/dp5n93VTOTEBK7j2j2FuMr+VbMsu9LaaKTSSiqb
   Q==;
X-CSE-ConnectionGUID: pWGXTL/6SiSgPb9JCu3I3A==
X-CSE-MsgGUID: e3RLTAmBSSermqbssKLUJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="36468034"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="36468034"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 12:44:10 -0700
X-CSE-ConnectionGUID: nzTRSFoGRdWA554Uieyhtw==
X-CSE-MsgGUID: QXCh3TK2R/Kpxf9nPp7bAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="70279535"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Sep 2024 12:44:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srjXz-000Eov-1E;
	Fri, 20 Sep 2024 19:44:07 +0000
Date: Sat, 21 Sep 2024 03:43:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:ftrace/stress-test 1/1] kernel/trace/fstress.c:28:27: error:
 'struct ftrace_ops' has no member named 'trampoline'
Message-ID: <202409210326.4nUrN5Fk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git ftrace/stress-test
head:   3c154bddff894d321f1e43f1eec711a477f44bf9
commit: 3c154bddff894d321f1e43f1eec711a477f44bf9 [1/1] HACK: ftrace stress test
config: xtensa-randconfig-r073-20240921 (https://download.01.org/0day-ci/archive/20240921/202409210326.4nUrN5Fk-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409210326.4nUrN5Fk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409210326.4nUrN5Fk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from ./arch/xtensa/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from kernel/trace/fstress.c:5:
   kernel/trace/fstress.c: In function 'dump_ftrace_ops':
>> kernel/trace/fstress.c:28:27: error: 'struct ftrace_ops' has no member named 'trampoline'
      28 |                 (void *)op->trampoline,
         |                           ^~
   include/linux/printk.h:437:33: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:518:9: note: in expansion of macro 'printk'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/trace/fstress.c:16:9: note: in expansion of macro 'pr_warn'
      16 |         pr_warn("%ps = {\n"
         |         ^~~~~~~
>> kernel/trace/fstress.c:29:19: error: 'struct ftrace_ops' has no member named 'ops_func'
      29 |                 op->ops_func,
         |                   ^~
   include/linux/printk.h:437:33: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:518:9: note: in expansion of macro 'printk'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/trace/fstress.c:16:9: note: in expansion of macro 'pr_warn'
      16 |         pr_warn("%ps = {\n"
         |         ^~~~~~~
>> kernel/trace/fstress.c:30:19: error: 'struct ftrace_ops' has no member named 'managed'
      30 |                 op->managed);
         |                   ^~
   include/linux/printk.h:437:33: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:518:9: note: in expansion of macro 'printk'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/trace/fstress.c:16:9: note: in expansion of macro 'pr_warn'
      16 |         pr_warn("%ps = {\n"
         |         ^~~~~~~


vim +28 kernel/trace/fstress.c

     4	
   > 5	#include <linux/bug.h>
     6	#include <linux/errno.h>
     7	#include <linux/ftrace.h>
     8	#include <linux/init.h>
     9	#include <linux/kthread.h>
    10	#include <linux/module.h>
    11	
    12	static atomic_t fstress_panic = ATOMIC_INIT(0);
    13	
    14	static void dump_ftrace_ops(struct ftrace_ops *op)
    15	{
  > 16		pr_warn("%ps = {\n"
    17			"  .func = %pS\n"
    18			"  .flags = 0x%lx\n"
    19			"  .saved_func = %pS\n"
    20			"  .trampoline = %pS\n"
    21			"  .ops_func = %pS\n"
    22			"  .managed = %pS\n"
    23			"}\n",
    24			op,
    25			op->func,
    26			op->flags,
    27			op->saved_func,
  > 28			(void *)op->trampoline,
  > 29			op->ops_func,
  > 30			op->managed);
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

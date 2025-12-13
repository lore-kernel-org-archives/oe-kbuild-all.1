Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090342749D2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 04:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765600924; cv=none; b=eImy0zms9YUDIkpdksTol4itnQm2VPqkvFpnzIECznpJ8CzNhIJwT3U6bPGKGSCDllRTI2HF6j5wS6uzn8uXHCaViEvZht7UTtj+VqzT5J1JAm/pucn8ed4+mIWUXJvyr4c4xIk6LkmjVJyFG+ZQYVHRPJ6hheetdW9TSGTITKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765600924; c=relaxed/simple;
	bh=UGHoGPwSF4IFW51PCjvExfQu0kvz7J3YLzM/tqa0tIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mmPm9yBIRkVlOUKagsYyD1+lC8kcUZAwAb2KTmOBx3pGM46HYT0Uf47AQ3ayK5BC0aKCRh0APmAtZCNmmpK0H1NXMeWVqEssas8iR1KYje0YiCV53Hy95KFON/SF4jJKF5DU6FfXtwPGA7TPN3dzEY4YIw8Jc4hGI1y9RstG6nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AoaHZl3y; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoaHZl3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765600923; x=1797136923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UGHoGPwSF4IFW51PCjvExfQu0kvz7J3YLzM/tqa0tIY=;
  b=AoaHZl3y/EaqFDJmF3FiCzpaUe++Rw60jZ40gkxkMUAoQGV4Cq1WpMfT
   qCvMYKIKO4v4N5evZmiGTNBmyXnLGqDXtsPiMEAoEERwAsemEnk2wiuiu
   BzDj1226h20ooNcU/iKl16PQkuPTMarseJ/GqdxXh+91NnhwNSeIqEKI4
   nyxOZpJUW/BJT6qUled0NiBNvhxjTGmtnFgSdDgUibpvor7O3Ql221su3
   ihnKbg/OQY1qUHfGmC0z3EUClUqlnMUCe84fsrvG5cSk9sr1dIM0x7IZy
   J4eWsxeQlFfYGyksisEuv1axFp/9aZu+3uPM64o7lmqyWEuK1NWHWsPj5
   Q==;
X-CSE-ConnectionGUID: 1AHIroDFSluyGt4PSLeE8w==
X-CSE-MsgGUID: klAwIlLYQB+3FLpcPgR5rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67558205"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67558205"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 20:42:00 -0800
X-CSE-ConnectionGUID: AgeCA7n8Q5GKtVcWgd3vwg==
X-CSE-MsgGUID: Ct3Ma0CATgyGUpGlNH54WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196537396"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Dec 2025 20:41:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUHS9-0000000073b-0Eid;
	Sat, 13 Dec 2025 04:41:57 +0000
Date: Sat, 13 Dec 2025 12:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:ftrace/stress-test 1/1] kernel/trace/fstress.c:28:27: error:
 'struct ftrace_ops' has no member named 'trampoline'
Message-ID: <202512131231.0VHBO57H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git ftrace/stress-test
head:   8c6897c95ef485f7c2459ca75d8993d2bdab4128
commit: 8c6897c95ef485f7c2459ca75d8993d2bdab4128 [1/1] HACK: ftrace stress test
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20251213/202512131231.0VHBO57H-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131231.0VHBO57H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131231.0VHBO57H-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from ./arch/xtensa/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from kernel/trace/fstress.c:5:
   kernel/trace/fstress.c: In function 'dump_ftrace_ops':
>> kernel/trace/fstress.c:28:27: error: 'struct ftrace_ops' has no member named 'trampoline'
      28 |                 (void *)op->trampoline,
         |                           ^~
   include/linux/printk.h:484:33: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:565:9: note: in expansion of macro 'printk'
     565 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/trace/fstress.c:16:9: note: in expansion of macro 'pr_warn'
      16 |         pr_warn("%ps = {\n"
         |         ^~~~~~~
>> kernel/trace/fstress.c:29:19: error: 'struct ftrace_ops' has no member named 'ops_func'
      29 |                 op->ops_func,
         |                   ^~
   include/linux/printk.h:484:33: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:565:9: note: in expansion of macro 'printk'
     565 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/trace/fstress.c:16:9: note: in expansion of macro 'pr_warn'
      16 |         pr_warn("%ps = {\n"
         |         ^~~~~~~
>> kernel/trace/fstress.c:30:19: error: 'struct ftrace_ops' has no member named 'managed'
      30 |                 op->managed);
         |                   ^~
   include/linux/printk.h:484:33: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:565:9: note: in expansion of macro 'printk'
     565 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/trace/fstress.c:16:9: note: in expansion of macro 'pr_warn'
      16 |         pr_warn("%ps = {\n"
         |         ^~~~~~~


vim +28 kernel/trace/fstress.c

    13	
    14	static void dump_ftrace_ops(struct ftrace_ops *op)
    15	{
    16		pr_warn("%ps = {\n"
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

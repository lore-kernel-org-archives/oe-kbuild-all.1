Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F5C191F8C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 10:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736592997; cv=none; b=giPB06pWGvU05N2eX5cUnNVzcR/qxU5BdK8a+NlZlXRqHSMMJANLT5IJEXKMDAxvS6w/OZ3QgI3wKuNGlh1fD7j52FAMd/CbBRADBPVPozP8gzKDy+2egeV9X6KT7DmqihzFjFGJJVQNZ9M6nWyXzfX8QawWSQOKxgcJ9gR8XYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736592997; c=relaxed/simple;
	bh=WKbUa1vAgEvnQ3+Vl6ZDQmifpWjdbZtnhZZ6KhrO1zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhhkPJHdix2RYFq1Nrq66JFBYtFGT4LsXRksTQzh0IRJj2Bf0ePIgQ83U9EK1BPd608F3dMZHQ8+xydd+yBlTGma8JWNZcWwOuu0wddOIPo7OhmBS2HLlj4+RAmfH88JMfeAlc7XdW2VBQy8F8Ty48giGUXVcKwOZ2MorxkMfp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtDYcnss; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtDYcnss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736592995; x=1768128995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WKbUa1vAgEvnQ3+Vl6ZDQmifpWjdbZtnhZZ6KhrO1zA=;
  b=EtDYcnssJ31wJydOXmf6glosb0BqDUeqMj+z++EeofGmCNS7M5WUfYwX
   rebqtTZaskfkvXIfed2+rWeEicL/jOrtuljtH3oWb2zyZ1oknOuVxGRgr
   yzozDuBe5QZBK6KjeDVh/gvAZT7t01fIbQSDCuPQsriTa6+RdDD780lLA
   9oHdCQ0r/VNCjWlshp0pkOBEKTT+VK3+LX6avyrT9ORBG2F791JKkRfH1
   q6voGTKoaSROCUATRLb/s3+z7T34BmmEsyU0lJCSpntU8HEVmHI37qO57
   nEbcey6R1DCBUdnnhCAQlnulhPbb+tNXFhgNhrcG/NkTG3wMbyHQJSq2J
   w==;
X-CSE-ConnectionGUID: zkzy7BuOT3OjLL8TfHyD4w==
X-CSE-MsgGUID: /ljat8n7RzCd2nprt8I2fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="62257747"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="62257747"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 02:56:35 -0800
X-CSE-ConnectionGUID: aUtWuB7HTy6z/KIoMDp2DQ==
X-CSE-MsgGUID: F4zPwhduSeKPAAZZBSn+4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="103775542"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jan 2025 02:56:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWZAN-000KVx-31;
	Sat, 11 Jan 2025 10:56:31 +0000
Date: Sat, 11 Jan 2025 18:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: Oxana Kharitonova <oxana@cloudflare.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH resend] hung_task: add task->flags, blocked by coredump
 to log
Message-ID: <202501111846.weNpjZRv-lkp@intel.com>
References: <20250110160328.64947-1-oxana@cloudflare.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110160328.64947-1-oxana@cloudflare.com>

Hi Oxana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on tip/sched/core brauner-vfs/vfs.all linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oxana-Kharitonova/hung_task-add-task-flags-blocked-by-coredump-to-log/20250111-000505
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250110160328.64947-1-oxana%40cloudflare.com
patch subject: [PATCH resend] hung_task: add task->flags, blocked by coredump to log
config: riscv-randconfig-002-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111846.weNpjZRv-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111846.weNpjZRv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111846.weNpjZRv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/cmpxchg.h:9,
                    from arch/riscv/include/asm/barrier.h:14,
                    from include/linux/list.h:11,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:10:
   kernel/sched/core.c: In function 'sched_show_task':
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:586:9: note: in expansion of macro 'printk'
     586 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:24:25: note: in expansion of macro 'KERN_SOH'
      24 | #define KERN_CONT       KERN_SOH "c"
         |                         ^~~~~~~~
   include/linux/printk.h:586:16: note: in expansion of macro 'KERN_CONT'
     586 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                ^~~~~~~~~
   kernel/sched/core.c:7704:9: note: in expansion of macro 'pr_cont'
    7704 |         pr_cont(" stack:%-5lu pid:%-5d tgid:%-5d ppid:%-6d task_flags:0x%08lx flags:0x%08lx\n",
         |         ^~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

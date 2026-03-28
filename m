Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA0A262FC0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 20:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774729199; cv=none; b=DKZegkTJkm5nIxbSMusm27bwI3beegk0cbZzZ4TYEfXP8cDka/vMBLceVkSgyKG6PkM4TdvY2XSJPqpZrWjRwdbPU/ySrXhGZJMQ8kjTVWWXm9NfFvXTekOnKu1vTT0Amq/GRwsIad58dloU0srRkEIkI9ClhgpWaj2gT9LRXXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774729199; c=relaxed/simple;
	bh=L4xBTiLZQsxljzI9kaVKxLJ1h5K+JSBlqKdS4NSNobI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oii1uYOHORNGyvu2Z6HG7xHN84Dg9MExoNxIqamHxxSSMpu+bI7UWBSDS7Erh0CmClvArEWvRgCnzxtHB13PxRzikJk1hGEMIlGdtP+tdFnMtc4p/C8vfa9kg5gyTU226ONNMIDVfccSrATNqyQy+7WNmAiCG3+KvB/gqwgKaF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/yYXeUA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/yYXeUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774729197; x=1806265197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L4xBTiLZQsxljzI9kaVKxLJ1h5K+JSBlqKdS4NSNobI=;
  b=B/yYXeUA4Zo8wGMK/PHQpoEK26F9AA0SDMcZEvvyBRU2CM4ts2LBExpd
   Cytkknwj1vUZzqJS3V7RZ5HtctC5wm5TGXGAlfHodQjOP1ckzUdMiarfF
   qtHyuGAyRQ2jZVNgHA3Rzz/mSDgkt3laWYPwy4fPSF0Wbk1pg1k7lYrp8
   T7l+Zkk1Wnm1mT34b0a4ExwDbN67W+ucbNJ9ZCz3ZU2ttDFNUJzTk/FPx
   4/YT4eHhkO4AWPp0wvUO1y2Hc4FGSBxBK9jmeL06ESfdHrE4Ee2wK1FBK
   1NxbBHieKHUcEqCWDpAwR5WupZPUnnvrrSdBZmmcNnLZpMHZnclO6tc4M
   A==;
X-CSE-ConnectionGUID: ApBHigvuSd6tnQozmSDnUQ==
X-CSE-MsgGUID: cD7T1CcJSj6q5ySvKR/k4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79675016"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="79675016"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 13:19:56 -0700
X-CSE-ConnectionGUID: YKEXdYsLTBGiztHuAWq8Ww==
X-CSE-MsgGUID: JHVTgDIkQNOm0TqipENvdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="225529313"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Mar 2026 13:19:56 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6a8O-00000000Bk5-2YKO;
	Sat, 28 Mar 2026 20:19:52 +0000
Date: Sun, 29 Mar 2026 04:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] btf: split core BTF parsing out of BPF subsystem into
 kernel/btf/
Message-ID: <202603290444.9kNP6afH-lkp@intel.com>
References: <20260325011853.657295-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325011853.657295-1-sashal@kernel.org>

Hi Sasha,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]
[also build test ERROR on bpf/master akpm-mm/mm-nonmm-unstable linus/master v7.0-rc5]
[cannot apply to bpf-next/net next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Levin/btf-split-core-BTF-parsing-out-of-BPF-subsystem-into-kernel-btf/20260327-005818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260325011853.657295-1-sashal%40kernel.org
patch subject: [RFC] btf: split core BTF parsing out of BPF subsystem into kernel/btf/
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260329/202603290444.9kNP6afH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290444.9kNP6afH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603290444.9kNP6afH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/btf_relocate.c:2:
   kernel/bpf/../../tools/lib/bpf/btf_relocate.c: In function 'btf_relocate_rewrite_strs':
>> kernel/bpf/../../tools/lib/bpf/btf_relocate.c:20:49: error: implicit declaration of function 'btf_str_by_offset'; did you mean 'btf__str_by_offset'? [-Wimplicit-function-declaration]
      20 | #define btf__str_by_offset                      btf_str_by_offset
         |                                                 ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:483:33: note: in expansion of macro 'btf__str_by_offset'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:511:26: note: in expansion of macro 'printk_index_wrap'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:564:9: note: in expansion of macro 'printk'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/bpf/../../tools/lib/bpf/btf_relocate.c:431:33: note: in expansion of macro 'pr_warn'
     431 |                                 pr_warn("string '%s' [offset %u] is not mapped to base BTF\n",
         |                                 ^~~~~~~
   In file included from include/asm-generic/bug.h:31,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from kernel/bpf/../../tools/lib/bpf/btf_relocate.c:9:
   include/linux/kern_levels.h:5:25: warning: format '%s' expects argument of type 'char *', but argument 2 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:564:9: note: in expansion of macro 'printk'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:564:16: note: in expansion of macro 'KERN_WARNING'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   kernel/bpf/../../tools/lib/bpf/btf_relocate.c:431:33: note: in expansion of macro 'pr_warn'
     431 |                                 pr_warn("string '%s' [offset %u] is not mapped to base BTF\n",
         |                                 ^~~~~~~


vim +20 kernel/bpf/../../tools/lib/bpf/btf_relocate.c

8646db238997df3 Alan Maguire 2024-06-20  15  
8646db238997df3 Alan Maguire 2024-06-20  16  #define btf_type_by_id				(struct btf_type *)btf_type_by_id
8646db238997df3 Alan Maguire 2024-06-20  17  #define btf__type_cnt				btf_nr_types
8646db238997df3 Alan Maguire 2024-06-20  18  #define btf__base_btf				btf_base_btf
8646db238997df3 Alan Maguire 2024-06-20  19  #define btf__name_by_offset			btf_name_by_offset
8646db238997df3 Alan Maguire 2024-06-20 @20  #define btf__str_by_offset			btf_str_by_offset
8646db238997df3 Alan Maguire 2024-06-20  21  #define btf_kflag				btf_type_kflag
8646db238997df3 Alan Maguire 2024-06-20  22  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

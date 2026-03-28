Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F26322B72
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 18:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774722171; cv=none; b=B2dYYCA4Z+CAkDl+CFY7cEYUn9sP8WXX6Acq/Z757U5GtgWKjB8aKcm74G3GqLaHwVHZkokmRlPJetK7F4kv3HNz4ipvTokohKkI5cDt4q9Gz+0f9980omaroKRFTxMHdFGccywjn0NciEM0Jrs3uOH7QiU2iXm+BBFLdd9Vqig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774722171; c=relaxed/simple;
	bh=CzuVNhJpwZAXJUUW/ZrCk96LHGUyXq2gPHBmqUCTI9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEZawVVKtbu13jukBCL0TIAKS5xX4U+InbbLfcI4BnA+zgqJEjghNscOiZ92Ts9oDhm/OMTkxdE6ircOOA/N5DErmX9JtAzX/DEbQYtbVyoJCjJYG7raTSMOkEm35dt5px3swenjLLGYu0ZFHU5bTodrcIQLVwPsSqxkxuUBUTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRAEGkmy; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRAEGkmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774722169; x=1806258169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CzuVNhJpwZAXJUUW/ZrCk96LHGUyXq2gPHBmqUCTI9A=;
  b=eRAEGkmy5rz0J0ipDWoW3skbQoCx3zSRneN4g02/NWskm8K0e8iKXVMa
   z4iHA2XM4jBqcDZO3R+OsmxEChgYZNXPtUsPLpuGjMAJie5JreolS0/tR
   vsFiI/RO/HU5RdCINTnxHduep0RNsVmwxDq+VjXKDkx0J8AHIi2Gzizj0
   WsNIUcMZqRNNUnI31McObDJPDsBZxtzPnwxlRStuLNYRCIMAb7Kp3q+GG
   Y5rHGlNx4M0oV++ZJFegq8YJBVCauOF/KN6XA93ISdiTa0ngJukUjby+p
   WWX12pPyGuRqmM506Vbrr93mh8nmZ3T3Ta/CbMPvyzzS63TFJI7a3K9bd
   g==;
X-CSE-ConnectionGUID: oF3eT80VQFC7AsTjsY8vIw==
X-CSE-MsgGUID: rXMTJLAOQ/iGSHN9JHiNOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86459786"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="86459786"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 11:22:48 -0700
X-CSE-ConnectionGUID: PHxrwSlSScKEM6Q2ETNRuQ==
X-CSE-MsgGUID: nowOBQ30TvKHmsiUaopqKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="227228984"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2026 11:22:47 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6YJ2-00000000Bf7-3mQK;
	Sat, 28 Mar 2026 18:22:44 +0000
Date: Sun, 29 Mar 2026 02:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] btf: split core BTF parsing out of BPF subsystem into
 kernel/btf/
Message-ID: <202603290251.bXJOBeBs-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master akpm-mm/mm-nonmm-unstable linus/master v7.0-rc5]
[cannot apply to bpf-next/net next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Levin/btf-split-core-BTF-parsing-out-of-BPF-subsystem-into-kernel-btf/20260327-005818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260325011853.657295-1-sashal%40kernel.org
patch subject: [RFC] btf: split core BTF parsing out of BPF subsystem into kernel/btf/
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260329/202603290251.bXJOBeBs-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290251.bXJOBeBs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603290251.bXJOBeBs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/core.c: In function 'bpf_prog_kallsyms_add':
   kernel/bpf/core.c:589:54: warning: '%s' directive argument is null [-Wformat-truncation=]
     589 |                 snprintf(sym, (size_t)(end - sym), "_%s", func_name);
         |                                                      ^~
   In file included from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from arch/parisc/include/asm/hardware.h:5,
                    from arch/parisc/include/asm/processor.h:18,
                    from arch/parisc/include/asm/spinlock.h:7,
                    from arch/parisc/include/asm/atomic.h:22,
                    from include/linux/atomic.h:7,
                    from include/linux/filter.h:8,
                    from kernel/bpf/core.c:21:
   In function 'kbasename',
       inlined from 'bpf_prog_get_file_line' at kernel/bpf/core.c:3352:11:
>> include/linux/string.h:381:28: warning: argument 1 null where non-null expected [-Wnonnull]
     381 |         const char *tail = strrchr(path, '/');
         |                            ^~~~~~~~~~~~~~~~~~
   include/linux/string.h: In function 'bpf_prog_get_file_line':
   include/linux/string.h:183:15: note: in a call to function 'strrchr' declared 'nonnull'
     183 | extern char * strrchr(const char *,int);
         |               ^~~~~~~
--
   kernel/bpf/log.c: In function 'verbose_linfo':
>> kernel/bpf/log.c:423:17: warning: argument 1 null where non-null expected [-Wnonnull]
     423 |         fname = strrchr(s, '/');
         |                 ^~~~~~~~~~~~~~~
   In file included from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from arch/parisc/include/asm/hardware.h:5,
                    from arch/parisc/include/asm/processor.h:18,
                    from arch/parisc/include/asm/spinlock.h:7,
                    from arch/parisc/include/asm/atomic.h:22,
                    from include/linux/atomic.h:7,
                    from arch/parisc/include/asm/bitops.h:13,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from kernel/bpf/log.c:7:
   include/linux/string.h:183:15: note: in a call to function 'strrchr' declared 'nonnull'
     183 | extern char * strrchr(const char *,int);
         |               ^~~~~~~
   kernel/bpf/log.c: In function 'print_reg_state':
   kernel/bpf/log.c:702:30: warning: '%s' directive argument is null [-Wformat-overflow=]
     702 |                 verbose(env, "%s", btf_type_name(reg->btf, reg->btf_id));
         |                              ^~~~
   kernel/bpf/log.c:14:64: note: in definition of macro 'verbose'
      14 | #define verbose(env, fmt, args...) bpf_verifier_log_write(env, fmt, ##args)
         |                                                                ^~~
   kernel/bpf/log.c:702:31: note: format string is defined here
     702 |                 verbose(env, "%s", btf_type_name(reg->btf, reg->btf_id));
         |                               ^~
--
   In file included from include/asm-generic/bug.h:31,
                    from arch/parisc/include/asm/bug.h:97,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from kernel/bpf/bpf_struct_ops.c:4:
   kernel/bpf/bpf_struct_ops.c: In function 'prepare_arg_info.constprop':
   include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
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
   kernel/bpf/bpf_struct_ops.c:210:17: note: in expansion of macro 'pr_warn'
     210 |                 pr_warn("the number of arguments of the stub function %s does not match the number of arguments of the member %s of struct %s\n",
         |                 ^~~~~~~
   include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
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
   kernel/bpf/bpf_struct_ops.c:191:17: note: in expansion of macro 'pr_warn'
     191 |                 pr_warn("Cannot find the stub function name for the %s in struct %s\n",
         |                 ^~~~~~~
   In function 'is_module_member',
       inlined from 'bpf_struct_ops_desc_init' at kernel/bpf/bpf_struct_ops.c:412:37:
>> kernel/bpf/bpf_struct_ops.c:321:17: warning: argument 1 null where non-null expected [-Wnonnull]
     321 |         return !strcmp(btf_name_by_offset(btf, t->name_off), "module");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from arch/parisc/include/asm/hardware.h:5,
                    from arch/parisc/include/asm/processor.h:18,
                    from arch/parisc/include/asm/spinlock.h:7,
                    from arch/parisc/include/asm/atomic.h:22,
                    from include/linux/atomic.h:7,
                    from arch/parisc/include/asm/bitops.h:13,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/parisc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:9,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11:
   include/linux/string.h: In function 'bpf_struct_ops_desc_init':
   include/linux/string.h:161:12: note: in a call to function 'strcmp' declared 'nonnull'
     161 | extern int strcmp(const char *,const char *);
         |            ^~~~~~
   include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
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
   kernel/bpf/bpf_struct_ops.c:406:25: note: in expansion of macro 'pr_warn'
     406 |                         pr_warn("bit field member %s in struct %s is not supported\n",
         |                         ^~~~~~~
   include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
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
   kernel/bpf/bpf_struct_ops.c:432:33: note: in expansion of macro 'pr_warn'
     432 |                                 pr_warn("func ptr %s in struct %s returns non-struct pointer, which is not supported\n",
         |                                 ^~~~~~~
   include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
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
   kernel/bpf/bpf_struct_ops.c:442:25: note: in expansion of macro 'pr_warn'
     442 |                         pr_warn("Error in parsing func ptr %s in struct %s\n",
         |                         ^~~~~~~
   kernel/bpf/bpf_struct_ops.c: In function 'bpf_struct_ops_map_update_elem':
>> kernel/bpf/bpf_struct_ops.c:647:51: warning: '%s' directive argument is null [-Wformat-truncation=]
     647 |         snprintf(ksym->name, KSYM_NAME_LEN, "bpf__%s_%s", tname, mname);
         |                                                   ^~


vim +381 include/linux/string.h

639b9e34f15e4b Akinobu Mita    2012-07-30  369  
b18888ab256f05 Andy Shevchenko 2012-12-17  370  /**
b18888ab256f05 Andy Shevchenko 2012-12-17  371   * kbasename - return the last part of a pathname.
b18888ab256f05 Andy Shevchenko 2012-12-17  372   *
b18888ab256f05 Andy Shevchenko 2012-12-17  373   * @path: path to extract the filename from.
645b9ad2dc6b2d Kriish Sharma   2025-11-18  374   *
645b9ad2dc6b2d Kriish Sharma   2025-11-18  375   * Returns:
645b9ad2dc6b2d Kriish Sharma   2025-11-18  376   * Pointer to the filename portion inside @path. If no '/' exists,
645b9ad2dc6b2d Kriish Sharma   2025-11-18  377   * returns @path unchanged.
b18888ab256f05 Andy Shevchenko 2012-12-17  378   */
b18888ab256f05 Andy Shevchenko 2012-12-17  379  static inline const char *kbasename(const char *path)
b18888ab256f05 Andy Shevchenko 2012-12-17  380  {
b18888ab256f05 Andy Shevchenko 2012-12-17 @381  	const char *tail = strrchr(path, '/');
b18888ab256f05 Andy Shevchenko 2012-12-17  382  	return tail ? tail + 1 : path;
b18888ab256f05 Andy Shevchenko 2012-12-17  383  }
b18888ab256f05 Andy Shevchenko 2012-12-17  384  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

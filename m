Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639F21D2E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 16:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692721792; x=1724257792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cSn9sR0IZPFa9LOOt0MrxXyDQVYIC72NpE9jehrRJQ4=;
  b=XM+fMvym4pqG9IslGYTqwPHzUUdtoWdDWFRItiyDW+HIQGyZd+6dvUwI
   dhlBuD+dAkuDm61UxAkN4IkhZSDgZ0tFknebWt7YiSdeks5i2UiFCdoNS
   ohykxcp4R8WkvIdovZxrCjW7VhkgPQFIMDyFrK0+ebbfWDp4KjtMtE5dp
   G6ea75ECx0ZYSPH8zzG6UdHiobUoZRJY1cDUpFzRuyz9iGLefo+xrccA0
   qGXP0zluUrv115/40lXIu6JSXLD3fWy7J4fgTNXGbSFvbHUJlEgq7UUB2
   +Xqcl0pq7bRSH0Xd6bM6bsAM++4Zfj+b9/xjNKhFaZUWq7NCpZgLdfxi7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377689056"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="377689056"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 09:29:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765811470"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="765811470"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 22 Aug 2023 09:29:08 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYUFU-0000L1-1f;
	Tue, 22 Aug 2023 16:28:59 +0000
Date: Wed, 23 Aug 2023 00:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 12676/29943]
 kernel/gcov/clang.c:85:6: warning: no previous declaration for
 'llvm_gcov_init'
Message-ID: <202308230020.TaM4gxXF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   6904826e1ac9739626b937fd85e37cf539fec91b
commit: c3f2a1bd3209bce8672f893845242f5c6aa6e393 [12676/29943] BACKPORT: gcov: clang support
config: i386-buildonly-randconfig-003-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230020.TaM4gxXF-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230020.TaM4gxXF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230020.TaM4gxXF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/gcov/clang.c:85:6: warning: no previous declaration for 'llvm_gcov_init' [-Wmissing-declarations]
    void llvm_gcov_init(llvm_gcov_callback writeout, llvm_gcov_callback flush)
         ^~~~~~~~~~~~~~
>> kernel/gcov/clang.c:108:6: warning: no previous declaration for 'llvm_gcda_start_file' [-Wmissing-declarations]
    void llvm_gcda_start_file(const char *orig_filename, const char version[4],
         ^~~~~~~~~~~~~~~~~~~~
>> kernel/gcov/clang.c:117:6: warning: no previous declaration for 'llvm_gcda_emit_function' [-Wmissing-declarations]
    void llvm_gcda_emit_function(u32 ident, const char *function_name,
         ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/gcov/clang.c:137:6: warning: no previous declaration for 'llvm_gcda_emit_arcs' [-Wmissing-declarations]
    void llvm_gcda_emit_arcs(u32 num_counters, u64 *counters)
         ^~~~~~~~~~~~~~~~~~~
>> kernel/gcov/clang.c:147:6: warning: no previous declaration for 'llvm_gcda_summary_info' [-Wmissing-declarations]
    void llvm_gcda_summary_info(void)
         ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/gcov/clang.c:152:6: warning: no previous declaration for 'llvm_gcda_end_file' [-Wmissing-declarations]
    void llvm_gcda_end_file(void)
         ^~~~~~~~~~~~~~~~~~


vim +/llvm_gcov_init +85 kernel/gcov/clang.c

    84	
  > 85	void llvm_gcov_init(llvm_gcov_callback writeout, llvm_gcov_callback flush)
    86	{
    87		struct gcov_info *info = kzalloc(sizeof(*info), GFP_KERNEL);
    88	
    89		if (!info)
    90			return;
    91	
    92		INIT_LIST_HEAD(&info->head);
    93		INIT_LIST_HEAD(&info->functions);
    94	
    95		mutex_lock(&gcov_lock);
    96	
    97		list_add_tail(&info->head, &clang_gcov_list);
    98		current_info = info;
    99		writeout();
   100		current_info = NULL;
   101		if (gcov_events_enabled)
   102			gcov_event(GCOV_ADD, info);
   103	
   104		mutex_unlock(&gcov_lock);
   105	}
   106	EXPORT_SYMBOL(llvm_gcov_init);
   107	
 > 108	void llvm_gcda_start_file(const char *orig_filename, const char version[4],
   109			u32 checksum)
   110	{
   111		current_info->filename = orig_filename;
   112		memcpy(&current_info->version, version, sizeof(current_info->version));
   113		current_info->checksum = checksum;
   114	}
   115	EXPORT_SYMBOL(llvm_gcda_start_file);
   116	
 > 117	void llvm_gcda_emit_function(u32 ident, const char *function_name,
   118			u32 func_checksum, u8 use_extra_checksum, u32 cfg_checksum)
   119	{
   120		struct gcov_fn_info *info = kzalloc(sizeof(*info), GFP_KERNEL);
   121	
   122		if (!info)
   123			return;
   124	
   125		INIT_LIST_HEAD(&info->head);
   126		info->ident = ident;
   127		info->checksum = func_checksum;
   128		info->use_extra_checksum = use_extra_checksum;
   129		info->cfg_checksum = cfg_checksum;
   130		if (function_name)
   131			info->function_name = kstrdup(function_name, GFP_KERNEL);
   132	
   133		list_add_tail(&info->head, &current_info->functions);
   134	}
   135	EXPORT_SYMBOL(llvm_gcda_emit_function);
   136	
 > 137	void llvm_gcda_emit_arcs(u32 num_counters, u64 *counters)
   138	{
   139		struct gcov_fn_info *info = list_last_entry(&current_info->functions,
   140				struct gcov_fn_info, head);
   141	
   142		info->num_counters = num_counters;
   143		info->counters = counters;
   144	}
   145	EXPORT_SYMBOL(llvm_gcda_emit_arcs);
   146	
 > 147	void llvm_gcda_summary_info(void)
   148	{
   149	}
   150	EXPORT_SYMBOL(llvm_gcda_summary_info);
   151	
 > 152	void llvm_gcda_end_file(void)
   153	{
   154	}
   155	EXPORT_SYMBOL(llvm_gcda_end_file);
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FECB1396
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 03:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711856898; cv=none; b=MQK2xt4cyfkWu02CyRAxacjjdUrxioyq+LYoXUcgkezmsXnFwEZV4VbYy+F8Ue0flp/uG7uSTJtu/w2J2I4/E40IfiQsmc+PUwSRrW/j2q9G2r87XN8ISQO4AclGhWfa1O1ABo1zOdhyStwTqRxkpuqhhs3CHS3fNTxR9uvki5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711856898; c=relaxed/simple;
	bh=XmZLA19HrA7qX5NgrPAP9s44uevF4uWTBuMvTZvlcGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OpYEyXo72bQ7u2CYfCGybzDO6+WW6daCP1HHBcxEuX7t3Gm7vwObtZ6FF0iF3g43LOY7ytNyPtUjvyFifimT3TrNo1ZaU3LxQ4uTdGuxMNKM+JAyFBTpWmpgnNpg9FDEUIM2b3QO8wHtHa862YnjRsNV2E+4cwm1eOReDYhzxwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJor2SmZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJor2SmZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711856896; x=1743392896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XmZLA19HrA7qX5NgrPAP9s44uevF4uWTBuMvTZvlcGQ=;
  b=dJor2SmZ1dCiMGA8VV1neWleEZueX/YSjiLtEWX9nolmoZt/R+MrbO/3
   5rZvOdGbbyzPiQP4e2MXL518A5f5SKTZxKSDhTeRafpA6VSQG30PsYtZS
   ar49T3OY6T/wTDQPvs4r+57WB1sB2OJpVXR20rE8wC1icskAsSQw5c4iv
   O5rsAopRTEtLhg45Qs6tMaQwbrIuXR7hAo/2xPXx6hZ0ntLFia9Nm+ohb
   eKG+e9gZ4wT4ps53BhM8ghQsz7MQverFkB+4Xg4oauunm1OLuDbmH36eZ
   Q9pwKg0bhe2WZGh5t+b8FgkDwIXD983/+hYKMxmkEC7KHI8yb56URzzZe
   g==;
X-CSE-ConnectionGUID: xtFmdLwFTZKL68KFtYEtCQ==
X-CSE-MsgGUID: XjYKOjSkQ9GFH022q6Bn2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="17625802"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="17625802"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 20:48:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="17399051"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Mar 2024 20:48:14 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqmB1-0000li-38;
	Sun, 31 Mar 2024 03:48:11 +0000
Date: Sun, 31 Mar 2024 11:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiongzhou4 <xiongzhou4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21262/30000] kernel/gcov/gcc_base.c:92:6:
 warning: no previous prototype for '__gcov_merge_topn'
Message-ID: <202403311107.WlS3rnFu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   737efe73dd2ca6ee503ba26e6fc3ee41bd8cf633
commit: 2872514ea26634954ebf05f31ee1691111502df5 [21262/30000] GCC: Add value profile support for kernel.
config: x86_64-randconfig-011-20240331 (https://download.01.org/0day-ci/archive/20240331/202403311107.WlS3rnFu-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403311107.WlS3rnFu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403311107.WlS3rnFu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/dvb-core/dvb_net.c: In function 'dvb_net_add_if':
>> drivers/media/dvb-core/dvb_net.c:1362:41: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 11 [-Wformat-truncation=]
    1362 |   snprintf(net->name, IFNAMSIZ, "dvb%d%u%d",
         |                                         ^~
   drivers/media/dvb-core/dvb_net.c:1362:33: note: directive argument in the range [0, 2147483647]
    1362 |   snprintf(net->name, IFNAMSIZ, "dvb%d%u%d",
         |                                 ^~~~~~~~~~~
   drivers/media/dvb-core/dvb_net.c:1362:3: note: 'snprintf' output between 7 and 35 bytes into a destination of size 16
    1362 |   snprintf(net->name, IFNAMSIZ, "dvb%d%u%d",
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1363 |     dvbnet->dvbdev->adapter->num, dvbnet->dvbdev->id, if_num);
         |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   kernel/gcov/gcc_base.c:12:6: warning: no previous prototype for '__gcov_init' [-Wmissing-prototypes]
      12 | void __gcov_init(struct gcov_info *info)
         |      ^~~~~~~~~~~
   kernel/gcov/gcc_base.c:40:6: warning: no previous prototype for '__gcov_flush' [-Wmissing-prototypes]
      40 | void __gcov_flush(void)
         |      ^~~~~~~~~~~~
   kernel/gcov/gcc_base.c:46:6: warning: no previous prototype for '__gcov_merge_add' [-Wmissing-prototypes]
      46 | void __gcov_merge_add(gcov_type *counters, unsigned int n_counters)
         |      ^~~~~~~~~~~~~~~~
   kernel/gcov/gcc_base.c:52:6: warning: no previous prototype for '__gcov_merge_single' [-Wmissing-prototypes]
      52 | void __gcov_merge_single(gcov_type *counters, unsigned int n_counters)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/gcov/gcc_base.c:58:6: warning: no previous prototype for '__gcov_merge_delta' [-Wmissing-prototypes]
      58 | void __gcov_merge_delta(gcov_type *counters, unsigned int n_counters)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/gcov/gcc_base.c:64:6: warning: no previous prototype for '__gcov_merge_ior' [-Wmissing-prototypes]
      64 | void __gcov_merge_ior(gcov_type *counters, unsigned int n_counters)
         |      ^~~~~~~~~~~~~~~~
   kernel/gcov/gcc_base.c:70:6: warning: no previous prototype for '__gcov_merge_time_profile' [-Wmissing-prototypes]
      70 | void __gcov_merge_time_profile(gcov_type *counters, unsigned int n_counters)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/gcov/gcc_base.c:76:6: warning: no previous prototype for '__gcov_merge_icall_topn' [-Wmissing-prototypes]
      76 | void __gcov_merge_icall_topn(gcov_type *counters, unsigned int n_counters)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/gcov/gcc_base.c:82:6: warning: no previous prototype for '__gcov_exit' [-Wmissing-prototypes]
      82 | void __gcov_exit(void)
         |      ^~~~~~~~~~~
>> kernel/gcov/gcc_base.c:92:6: warning: no previous prototype for '__gcov_merge_topn' [-Wmissing-prototypes]
      92 | void __gcov_merge_topn(gcov_type *counters, unsigned int n_counters)
         |      ^~~~~~~~~~~~~~~~~
>> kernel/gcov/gcc_base.c:146:6: warning: no previous prototype for '__gcov_topn_values_profiler' [-Wmissing-prototypes]
     146 | void __gcov_topn_values_profiler(gcov_type *counters, gcov_type value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/gcov/gcc_base.c:165:6: warning: no previous prototype for '__gcov_indirect_call_profiler_v4' [-Wmissing-prototypes]
     165 | void __gcov_indirect_call_profiler_v4(gcov_type value, void *cur_func)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/gcov/gcc_base.c:174:6: warning: no previous prototype for '__gcov_average_profiler' [-Wmissing-prototypes]
     174 | void __gcov_average_profiler(gcov_type *counters, gcov_type value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/gcov/gcc_base.c:181:6: warning: no previous prototype for '__gcov_ior_profiler' [-Wmissing-prototypes]
     181 | void __gcov_ior_profiler(gcov_type *counters, gcov_type value)
         |      ^~~~~~~~~~~~~~~~~~~
>> kernel/gcov/gcc_base.c:191:6: warning: no previous prototype for '__gcov_pow2_profiler' [-Wmissing-prototypes]
     191 | void __gcov_pow2_profiler(gcov_type *counters, gcov_type value)
         |      ^~~~~~~~~~~~~~~~~~~~
>> kernel/gcov/gcc_base.c:206:6: warning: no previous prototype for '__gcov_interval_profiler' [-Wmissing-prototypes]
     206 | void __gcov_interval_profiler(gcov_type *counters, gcov_type value,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/__gcov_merge_topn +92 kernel/gcov/gcc_base.c

    69	
  > 70	void __gcov_merge_time_profile(gcov_type *counters, unsigned int n_counters)
    71	{
    72		/* Unused. */
    73	}
    74	EXPORT_SYMBOL(__gcov_merge_time_profile);
    75	
  > 76	void __gcov_merge_icall_topn(gcov_type *counters, unsigned int n_counters)
    77	{
    78		/* Unused. */
    79	}
    80	EXPORT_SYMBOL(__gcov_merge_icall_topn);
    81	
  > 82	void __gcov_exit(void)
    83	{
    84		/* Unused. */
    85	}
    86	EXPORT_SYMBOL(__gcov_exit);
    87	
    88	#ifdef CONFIG_PGO_KERNEL
    89	/* Number of top N value histogram. */
    90	#define GCOV_TOPN_VALUES 4
    91	
  > 92	void __gcov_merge_topn(gcov_type *counters, unsigned int n_counters)
    93	{
    94		/* Unused. */
    95	}
    96	EXPORT_SYMBOL(__gcov_merge_topn);
    97	
    98	struct indirect_call_tuple {
    99		void *callee;
   100	
   101		gcov_type *counters;
   102	};
   103	
   104	/* Kernel does not support __thread keyword. */
   105	struct indirect_call_tuple __gcov_indirect_call;
   106	EXPORT_SYMBOL(__gcov_indirect_call);
   107	
   108	gcov_type __gcov_time_profiler_counter;
   109	EXPORT_SYMBOL(__gcov_time_profiler_counter);
   110	
   111	/*
   112	 * Tries to determine N most commons value among its inputs.
   113	 */
   114	static inline void __gcov_topn_values_profiler_body(gcov_type *counters,
   115			gcov_type value)
   116	{
   117		int empty_counter = -1;
   118		unsigned int i;
   119	
   120		counters[0]++;
   121		++counters;
   122	
   123		/* First try to find an existing value. */
   124		for (i = 0; i < GCOV_TOPN_VALUES; i++)
   125			if (value == counters[2 * i]) {
   126				counters[2 * i + 1] += GCOV_TOPN_VALUES;
   127				return;
   128			} else if (counters[2 * i + 1] <= 0)
   129				empty_counter = i;
   130	
   131		/* Find an empty slot for a new value. */
   132		if (empty_counter != -1) {
   133			counters[2 * empty_counter] = value;
   134			counters[2 * empty_counter + 1] = GCOV_TOPN_VALUES;
   135			return;
   136		}
   137	
   138		/*
   139		 * We haven't found an empty slot, then decrement all
   140		 * counter values by one.
   141		 */
   142		for (i = 0; i < GCOV_TOPN_VALUES; i++)
   143			counters[2 * i + 1]--;
   144	}
   145	
 > 146	void __gcov_topn_values_profiler(gcov_type *counters, gcov_type value)
   147	{
   148		__gcov_topn_values_profiler_body(counters, value);
   149	}
   150	EXPORT_SYMBOL(__gcov_topn_values_profiler);
   151	
   152	/*
   153	 * Tries to determine the most common value among its inputs.
   154	 */
   155	static inline void __gcov_indirect_call_profiler_body(gcov_type value,
   156			void *cur_func)
   157	{
   158		/* Removed the C++ virtual tables contents as kernel is written in C. */
   159		if (cur_func == __gcov_indirect_call.callee)
   160			__gcov_topn_values_profiler_body(__gcov_indirect_call.counters, value);
   161	
   162		__gcov_indirect_call.callee = NULL;
   163	}
   164	
 > 165	void __gcov_indirect_call_profiler_v4(gcov_type value, void *cur_func)
   166	{
   167		__gcov_indirect_call_profiler_body(value, cur_func);
   168	}
   169	EXPORT_SYMBOL(__gcov_indirect_call_profiler_v4);
   170	
   171	/*
   172	 * Increase corresponding COUNTER by VALUE.
   173	 */
 > 174	void __gcov_average_profiler(gcov_type *counters, gcov_type value)
   175	{
   176		counters[0] += value;
   177		counters[1]++;
   178	}
   179	EXPORT_SYMBOL(__gcov_average_profiler);
   180	
 > 181	void __gcov_ior_profiler(gcov_type *counters, gcov_type value)
   182	{
   183		*counters |= value;
   184	}
   185	EXPORT_SYMBOL(__gcov_ior_profiler);
   186	
   187	/*
   188	 * If VALUE is a power of two, COUNTERS[1] is incremented.	Otherwise
   189	 * COUNTERS[0] is incremented.
   190	 */
 > 191	void __gcov_pow2_profiler(gcov_type *counters, gcov_type value)
   192	{
   193		if (value == 0 || (value & (value - 1)))
   194			counters[0]++;
   195		else
   196			counters[1]++;
   197	}
   198	EXPORT_SYMBOL(__gcov_pow2_profiler);
   199	
   200	/*
   201	 * If VALUE is in interval <START, START + STEPS - 1>, then increases the
   202	 * corresponding counter in COUNTERS.	If the VALUE is above or below
   203	 * the interval, COUNTERS[STEPS] or COUNTERS[STEPS + 1] is increased
   204	 * instead.
   205	 */
 > 206	void __gcov_interval_profiler(gcov_type *counters, gcov_type value,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

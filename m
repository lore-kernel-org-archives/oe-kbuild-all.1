Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18F85FBB1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 22:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710888957; cv=none; b=sryeyCNfEdd+BtW39GLRHtBKnugH3O0cn0s+pe3bmHfWUI/VaMTa9sA5DIMQGaabudya6XqIzqlnloHCZutc//TSYQe6VX3AxGOAIhSU0lyweIWlVHZrZ35DOCztkX01/VEcYJa6bPz32PQKCuUHA0En4tIP8BoafCSsHA5cUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710888957; c=relaxed/simple;
	bh=HH2CuGWzDlyP7FOSkn9EHKE6GPRmrdL3lLAxQFli+7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IwYICOUQShTjs0S7Uz7iPZVl95Cudtw9+AKiBVgrK/t2ozYTeYj4nv0TDw6y4F3iLYLANm0/6A63hRoxLymTq+Bj512MefwdgfLpj6SqSI1bkYnUvH6EkDQeaSMqnwoH42EJkzlrG1ASEZ1qzk7S93jNVTehXMASXb8fdYW5LWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RvkOeIdY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RvkOeIdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710888956; x=1742424956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HH2CuGWzDlyP7FOSkn9EHKE6GPRmrdL3lLAxQFli+7E=;
  b=RvkOeIdY+TEj27Js0rRwdj8KMvV7VucQOjwba10p1jAYDkxz5xnbZ3VT
   y/5a8stkU5clWh74nbEmHkAD5stwPwXQ4ncJ9Nt0T8GOWLeZL5AjrQkFq
   zqaENrx/jRB3bk2Bks1GdcHshhSY0uqt85VoB0zCTx/StUyjHeHfe67fW
   ZCrS57l3pVPAdXgsth+zy9sI/ueSScQorRiUsRt2+aRasvdu/TP5QyEQV
   eDWp7UM5SdsG7qRsMXkap/rmzuCrVzmL6lo7K7b8zb4t0amSqMfgcB1kY
   spCakS7EgJIElEx7+6v4FqNb6gq7UD2h1BfTv9+A6313nr0uGRL9Orcbv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5630083"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="5630083"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 15:55:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="45049495"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Mar 2024 15:55:51 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmiN3-000I93-0S;
	Tue, 19 Mar 2024 22:55:49 +0000
Date: Wed, 20 Mar 2024 06:55:15 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 72/98] kernel/cgroup/cpuset.c:3268
 cpuset_cgroup_cpuinfo_show_comm() warn: always true condition
 '(c->x86_cache_size >= 0) => (0-u32max >= 0)'
Message-ID: <202403200655.2asxgxix-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   493adae63cfb3b164a91cb3742a1fb147bcfa5eb
commit: 660e8c3de3cf153cd61c86479a730a56b67da7fc [72/98] cgroupfs: refactor cgroup resource statistics for reuse
config: x86_64-randconfig-161-20240319 (https://download.01.org/0day-ci/archive/20240320/202403200655.2asxgxix-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403200655.2asxgxix-lkp@intel.com/

smatch warnings:
kernel/cgroup/cpuset.c:3268 cpuset_cgroup_cpuinfo_show_comm() warn: always true condition '(c->x86_cache_size >= 0) => (0-u32max >= 0)'

vim +3268 kernel/cgroup/cpuset.c

f02c35d2e66fb4 Kairui Song 2023-11-20  3220  
660e8c3de3cf15 caelli      2023-11-20  3221  static int cpuset_cgroup_cpuinfo_show_comm(struct seq_file *sf, void *v, struct cpuset *cs)
f02c35d2e66fb4 Kairui Song 2023-11-20  3222  {
8e794bd206f067 Kairui Song 2023-11-20  3223  	int i, j, k = 0;
f02c35d2e66fb4 Kairui Song 2023-11-20  3224  	struct cpuinfo_x86 *c;
f02c35d2e66fb4 Kairui Song 2023-11-20  3225  	unsigned int cpu;
8e794bd206f067 Kairui Song 2023-11-20  3226  	bool is_top_cgrp;
8e794bd206f067 Kairui Song 2023-11-20  3227  
660e8c3de3cf15 caelli      2023-11-20  3228  	if (!cs->css.parent)
8e794bd206f067 Kairui Song 2023-11-20  3229  		is_top_cgrp = true;
8e794bd206f067 Kairui Song 2023-11-20  3230  	else
8e794bd206f067 Kairui Song 2023-11-20  3231  		is_top_cgrp = false;
f02c35d2e66fb4 Kairui Song 2023-11-20  3232  
f02c35d2e66fb4 Kairui Song 2023-11-20  3233  	for_each_cpu(j, cs->cpus_allowed) {
f02c35d2e66fb4 Kairui Song 2023-11-20  3234  		c = &cpu_data(j);
8e794bd206f067 Kairui Song 2023-11-20  3235  		if (is_top_cgrp || cpuset_cpuinfo_show_realinfo)
f02c35d2e66fb4 Kairui Song 2023-11-20  3236  			cpu = c->cpu_index;
8e794bd206f067 Kairui Song 2023-11-20  3237  		else
8e794bd206f067 Kairui Song 2023-11-20  3238  			cpu = k;
8e794bd206f067 Kairui Song 2023-11-20  3239  		k++;
f02c35d2e66fb4 Kairui Song 2023-11-20  3240  		seq_printf(sf, "processor\t: %u\n"
f02c35d2e66fb4 Kairui Song 2023-11-20  3241  				"vendor_id\t: %s\n"
f02c35d2e66fb4 Kairui Song 2023-11-20  3242  				"cpu family\t: %d\n"
f02c35d2e66fb4 Kairui Song 2023-11-20  3243  				"model\t\t: %u\n"
f02c35d2e66fb4 Kairui Song 2023-11-20  3244  				"model name\t: %s\n",
f02c35d2e66fb4 Kairui Song 2023-11-20  3245  				cpu,
f02c35d2e66fb4 Kairui Song 2023-11-20  3246  				c->x86_vendor_id[0] ? c->x86_vendor_id : "unknown",
f02c35d2e66fb4 Kairui Song 2023-11-20  3247  				c->x86,
f02c35d2e66fb4 Kairui Song 2023-11-20  3248  				c->x86_model,
f02c35d2e66fb4 Kairui Song 2023-11-20  3249  				c->x86_model_id[0] ? c->x86_model_id : "unknown");
f02c35d2e66fb4 Kairui Song 2023-11-20  3250  
f02c35d2e66fb4 Kairui Song 2023-11-20  3251  		if (c->x86_stepping || c->cpuid_level >= 0)
f02c35d2e66fb4 Kairui Song 2023-11-20  3252  			seq_printf(sf, "stepping\t: %d\n", c->x86_stepping);
f02c35d2e66fb4 Kairui Song 2023-11-20  3253  		else
f02c35d2e66fb4 Kairui Song 2023-11-20  3254  			seq_printf(sf, "stepping\t: unknown\n");
f02c35d2e66fb4 Kairui Song 2023-11-20  3255  		if (c->microcode)
f02c35d2e66fb4 Kairui Song 2023-11-20  3256  			seq_printf(sf, "microcode\t: 0x%x\n", c->microcode);
f02c35d2e66fb4 Kairui Song 2023-11-20  3257  
f02c35d2e66fb4 Kairui Song 2023-11-20  3258  		if (cpu_has(c, X86_FEATURE_TSC)) {
f02c35d2e66fb4 Kairui Song 2023-11-20  3259  			unsigned int freq = cpufreq_quick_get(cpu);
f02c35d2e66fb4 Kairui Song 2023-11-20  3260  
f02c35d2e66fb4 Kairui Song 2023-11-20  3261  			if (!freq)
f02c35d2e66fb4 Kairui Song 2023-11-20  3262  				freq = cpu_khz;
f02c35d2e66fb4 Kairui Song 2023-11-20  3263  			seq_printf(sf, "cpu MHz\t\t: %u.%03u\n",
f02c35d2e66fb4 Kairui Song 2023-11-20  3264  					freq / 1000, (freq % 1000));
f02c35d2e66fb4 Kairui Song 2023-11-20  3265  		}
f02c35d2e66fb4 Kairui Song 2023-11-20  3266  
f02c35d2e66fb4 Kairui Song 2023-11-20  3267  		/* Cache size */
f02c35d2e66fb4 Kairui Song 2023-11-20 @3268  		if (c->x86_cache_size >= 0)
f02c35d2e66fb4 Kairui Song 2023-11-20  3269  			seq_printf(sf, "cache size\t: %d KB\n", c->x86_cache_size);
f02c35d2e66fb4 Kairui Song 2023-11-20  3270  
f02c35d2e66fb4 Kairui Song 2023-11-20  3271  		show_cpuinfo_core(sf, c, cpu);
f02c35d2e66fb4 Kairui Song 2023-11-20  3272  		show_cpuinfo_misc(sf, c);
f02c35d2e66fb4 Kairui Song 2023-11-20  3273  
f02c35d2e66fb4 Kairui Song 2023-11-20  3274  		seq_printf(sf, "flags\t\t:");
f02c35d2e66fb4 Kairui Song 2023-11-20  3275  		for (i = 0; i < 32*NCAPINTS; i++)
f02c35d2e66fb4 Kairui Song 2023-11-20  3276  			if (cpu_has(c, i) && x86_cap_flags[i] != NULL)
f02c35d2e66fb4 Kairui Song 2023-11-20  3277  				seq_printf(sf, " %s", x86_cap_flags[i]);
f02c35d2e66fb4 Kairui Song 2023-11-20  3278  
f02c35d2e66fb4 Kairui Song 2023-11-20  3279  		seq_puts(sf, "\nbugs\t\t:");
f02c35d2e66fb4 Kairui Song 2023-11-20  3280  		for (i = 0; i < 32*NBUGINTS; i++) {
f02c35d2e66fb4 Kairui Song 2023-11-20  3281  			unsigned int bug_bit = 32*NCAPINTS + i;
f02c35d2e66fb4 Kairui Song 2023-11-20  3282  
f02c35d2e66fb4 Kairui Song 2023-11-20  3283  			if (cpu_has_bug(c, bug_bit) && x86_bug_flags[i])
f02c35d2e66fb4 Kairui Song 2023-11-20  3284  				seq_printf(sf, " %s", x86_bug_flags[i]);
f02c35d2e66fb4 Kairui Song 2023-11-20  3285  		}
f02c35d2e66fb4 Kairui Song 2023-11-20  3286  
f02c35d2e66fb4 Kairui Song 2023-11-20  3287  		seq_printf(sf, "\nbogomips\t: %lu.%02lu\n",
f02c35d2e66fb4 Kairui Song 2023-11-20  3288  				c->loops_per_jiffy/(500000/HZ),
f02c35d2e66fb4 Kairui Song 2023-11-20  3289  				(c->loops_per_jiffy/(5000/HZ)) % 100);
f02c35d2e66fb4 Kairui Song 2023-11-20  3290  

:::::: The code at line 3268 was first introduced by commit
:::::: f02c35d2e66fb42ca03914d72b8e25ed8bf6e688 cpuset: add cpuinfo and stat show

:::::: TO: Kairui Song <kasong@tencent.com>
:::::: CC: Kairui Song <kasong@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

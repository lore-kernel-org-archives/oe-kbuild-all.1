Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F424657D8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 21:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774994273; cv=none; b=aaijqSXNCS46ihFIYwV4AyARo0Mmpva9FLzfLfSozT5yfr6J4BBLJ+UZmz8J2ojpHqKvX/MlJiKEIL8JlM+YrQx4jBxhMRCpsltxPYwcmCT3vjwJLj/bNJgb+bdLEFUgnAFQWqXyGw/QOfASUUINYu/syd2v5WyC/TBjlPnB6vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774994273; c=relaxed/simple;
	bh=vuyOC5xnxEDxOqPgLWuJiEh8H2WDoMFOeZXkkHovHAk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dzcNnv0hOplfgKkQHxlAczQkau9dK1UAgG7niN2FehGPBm3kCwrXRcPV8aeaLLimriXjgLrcW3bVeLXd4lVn6xScVtkclIidebWzJeypYr9AJTWoT5GdVelWI+A1wRlTKmeUpWqMjqnV6WeYY0BwXkKMQHY1/IfugCquC6r9fMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ea6zVD5Y; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ea6zVD5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774994271; x=1806530271;
  h=date:from:to:cc:subject:message-id;
  bh=vuyOC5xnxEDxOqPgLWuJiEh8H2WDoMFOeZXkkHovHAk=;
  b=ea6zVD5YWlCujLuV+9nEqWUfmkjIStLtsaFSAOgoqTKOuVZb93RBQIqi
   DbW+981n/uhr0H5uobvT1OHygBAzO8wXQoFuVgmxBl4tkeeubnJlDN8gr
   sB/fbyy25kJEnviA1qd1yvZ8lwipQY1WBsNEDcYYG9KPcxB4Z1jSEbGr9
   Fr0SZ8NRus9a0HgNjdAy1zKuzqbIdRfAZ8i/0+IDU+VXBFk0fXHQNNv3g
   7002u6YFWQSCFl3j62aruref/kOgVh236u6SpYenBChzNQjme4xTjv5rD
   Sfqv2Zv1TzWfGwc2mQ9MeN2m5/jSaNwuooUm9CmXSUHPTpWnIx58Iy9/m
   w==;
X-CSE-ConnectionGUID: 9aNoImPES5mBYgm+XyBZoQ==
X-CSE-MsgGUID: 4zW+37QNTBy64s5YvVlnlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75059277"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75059277"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 14:57:49 -0700
X-CSE-ConnectionGUID: kiXfjNJmSO2RTv1Avy16ZA==
X-CSE-MsgGUID: j1d5VKj9Qpu0TutVKpoXhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226478121"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Mar 2026 14:57:47 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7h5k-000000004Kp-3B1k;
	Tue, 31 Mar 2026 21:57:44 +0000
Date: Wed, 01 Apr 2026 05:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/kvm/hyp_trace.c:1001:52: warning: '%ld' directive output may be
 truncated writing between 1 and 20 bytes into a region of size 13
Message-ID: <202604010542.lj2xZHtS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi HONG,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   19c7b4b3480e0330addb0c3975aaf967070b2431
commit: f6a5c4e9dddbbccc6453e21f2889eef5a9e7a194 [1/1] ANDROID: KVM: arm64: IWYU for hyp-constants.c.
config: arm64-randconfig-002-20260401 (https://download.01.org/0day-ci/archive/20260401/202604010542.lj2xZHtS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010542.lj2xZHtS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010542.lj2xZHtS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp_trace.c:823:37: warning: 'hyp_trace_raw_fops' defined but not used [-Wunused-const-variable=]
    static const struct file_operations hyp_trace_raw_fops = {
                                        ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_trace.c: In function 'hyp_trace_init_tracefs':
>> arch/arm64/kvm/hyp_trace.c:1001:52: warning: '%ld' directive output may be truncated writing between 1 and 20 bytes into a region of size 13 [-Wformat-truncation=]
      snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
                                                       ^~~
   arch/arm64/kvm/hyp_trace.c:1001:48: note: directive argument in the range [-9223372036854775808, 4294967294]
      snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
                                                   ^~~~~~~~
   arch/arm64/kvm/hyp_trace.c:1001:3: note: 'snprintf' output between 5 and 24 bytes into a destination of size 16
      snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1001 arch/arm64/kvm/hyp_trace.c

f6b52c36625991 Vincent Donnefort 2024-10-02   961  
50ff494e384318 Vincent Donnefort 2023-06-13   962  int hyp_trace_init_tracefs(void)
50ff494e384318 Vincent Donnefort 2023-06-13   963  {
50ff494e384318 Vincent Donnefort 2023-06-13   964  	struct dentry *root, *per_cpu_root;
50ff494e384318 Vincent Donnefort 2023-06-13   965  	char per_cpu_name[16];
50ff494e384318 Vincent Donnefort 2023-06-13   966  	long cpu;
50ff494e384318 Vincent Donnefort 2023-06-13   967  
50ff494e384318 Vincent Donnefort 2023-06-13   968  	if (!is_protected_kvm_enabled())
50ff494e384318 Vincent Donnefort 2023-06-13   969  		return 0;
50ff494e384318 Vincent Donnefort 2023-06-13   970  
50ff494e384318 Vincent Donnefort 2023-06-13   971  	root = tracefs_create_dir(TRACEFS_DIR, NULL);
50ff494e384318 Vincent Donnefort 2023-06-13   972  	if (!root) {
50ff494e384318 Vincent Donnefort 2023-06-13   973  		pr_err("Failed to create tracefs "TRACEFS_DIR"/\n");
50ff494e384318 Vincent Donnefort 2023-06-13   974  		return -ENODEV;
50ff494e384318 Vincent Donnefort 2023-06-13   975  	}
50ff494e384318 Vincent Donnefort 2023-06-13   976  
50ff494e384318 Vincent Donnefort 2023-06-13   977  	tracefs_create_file("tracing_on", TRACEFS_MODE_WRITE, root, NULL,
50ff494e384318 Vincent Donnefort 2023-06-13   978  			    &hyp_tracing_on_fops);
50ff494e384318 Vincent Donnefort 2023-06-13   979  
50ff494e384318 Vincent Donnefort 2023-06-13   980  	tracefs_create_file("buffer_size_kb", TRACEFS_MODE_WRITE, root, NULL,
50ff494e384318 Vincent Donnefort 2023-06-13   981  			    &hyp_buffer_size_fops);
50ff494e384318 Vincent Donnefort 2023-06-13   982  
50ff494e384318 Vincent Donnefort 2023-06-13   983  	tracefs_create_file("trace_pipe", TRACEFS_MODE_WRITE, root,
50ff494e384318 Vincent Donnefort 2023-06-13   984  			    (void *)RING_BUFFER_ALL_CPUS, &hyp_trace_pipe_fops);
50ff494e384318 Vincent Donnefort 2023-06-13   985  
2bd2125499979f Vincent Donnefort 2024-09-09   986  	tracefs_create_file("trace", TRACEFS_MODE_WRITE, root,
2bd2125499979f Vincent Donnefort 2024-09-09   987  			    (void *)RING_BUFFER_ALL_CPUS, &hyp_trace_fops);
2bd2125499979f Vincent Donnefort 2024-09-09   988  
05c51d38e2b69f Vincent Donnefort 2024-09-05   989  	tracefs_create_file("trace_clock", TRACEFS_MODE_READ, root, NULL,
05c51d38e2b69f Vincent Donnefort 2024-09-05   990  			    &hyp_trace_clock_fops);
05c51d38e2b69f Vincent Donnefort 2024-09-05   991  
50ff494e384318 Vincent Donnefort 2023-06-13   992  	per_cpu_root = tracefs_create_dir("per_cpu", root);
50ff494e384318 Vincent Donnefort 2023-06-13   993  	if (!per_cpu_root) {
50ff494e384318 Vincent Donnefort 2023-06-13   994  		pr_err("Failed to create tracefs folder "TRACEFS_DIR"/per_cpu/\n");
50ff494e384318 Vincent Donnefort 2023-06-13   995  		return -ENODEV;
50ff494e384318 Vincent Donnefort 2023-06-13   996  	}
50ff494e384318 Vincent Donnefort 2023-06-13   997  
50ff494e384318 Vincent Donnefort 2023-06-13   998  	for_each_possible_cpu(cpu) {
50ff494e384318 Vincent Donnefort 2023-06-13   999  		struct dentry *per_cpu_dir;
50ff494e384318 Vincent Donnefort 2023-06-13  1000  
50ff494e384318 Vincent Donnefort 2023-06-13 @1001  		snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);

:::::: The code at line 1001 was first introduced by commit
:::::: 50ff494e3843188c222d9a65c18da8590cd6250e FROMLIST: KVM: arm64: Add hyp tracing to tracefs

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

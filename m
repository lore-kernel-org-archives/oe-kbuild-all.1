Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B972218845
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 14:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766241311; cv=none; b=hwTZ6z51mch8ZbDfEmQsT8mydH8bylyCAm+m+y7PVu3Rm/g28asO3iw/9wfYPNUexRmAqomfjc93zDteRLk8DGTijB0rga8CMbMD53QdA7YTAGPD+bgzdRLRnhi0w2Jfr8dR0FNStj8h/d5GMvEnckW4dCZMbFpqU5shMV0KBQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766241311; c=relaxed/simple;
	bh=MFgWbxrqaQADRRfHrwZEUaGfYRWztSKiThvB0Wdk7cc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Im4MPsyPuOWWxrnFgM8uduuLdPd4ButbRg8POIsia43FbAGoW5I9vWTLz6uwu0khQTW1S4yXVq6+ID74NNFI1Pm3LB4RpQvbD7dJUiJsP7X7xBXlIr/7VJdHubtsePl/4Pyxg9nCepq2vYqwcjXhXJ3fz03FN5lBZP4ul5qkwSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3rE/YYP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3rE/YYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241309; x=1797777309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MFgWbxrqaQADRRfHrwZEUaGfYRWztSKiThvB0Wdk7cc=;
  b=a3rE/YYPwMBFMI119SmFrgK//Uo1yFsanz0pfjBc2UwEbzJPXvCbDeMp
   KpI3gsLWML93/9q1Nb6CrCVSqePlql2MGI0OR5kZRZdyllVKtyAmcMEWP
   sDRNaZIvnkk4k1oZ9empy9wHMHR/M4ZPYn1xMdTOmLLyhFwQ1uvdiRnT5
   tcTXtP/ToTZD6jBy3NVuvEdkfqLkEn6jonO2IhxXZAxYN8BZdDTOlGeMI
   ie7+UsmFad6f+xTRuJWSmaPqtKVM5UUqp9cIzTTZqGxw/zDrI7GXV1zX0
   Wxtvzh9p7k6gUlMjbuUX5zBb3ZoTfzjwbZOpieSADTSdmxXrNnzwKoW96
   w==;
X-CSE-ConnectionGUID: JwlmgXgQRXOV2Z3AuNhPIg==
X-CSE-MsgGUID: xk3+mZriT8CmMsSCtCqDTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="93649991"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="93649991"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:35:08 -0800
X-CSE-ConnectionGUID: cgCkGmFSSb+Wz4p9KNBDWw==
X-CSE-MsgGUID: Ar32DUZ5R02Wtf7kHiYSKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199023549"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 06:35:07 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWy2z-000000004ej-29Dv;
	Sat, 20 Dec 2025 14:35:05 +0000
Date: Sat, 20 Dec 2025 22:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3547/3547] drivers/cpufreq/cppc_cpufreq.c:852:19:
 error: invalid use of undefined type 'struct fb_ctr_pair'
Message-ID: <202512202208.UvUcLQzT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zeng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 12f136b2134d4ded731c3ef23ac08c85b9c0b1fa [3547/3547] cpufreq: CPPC: Keep the target core awake when reading its cpufreq rate
config: arm64-randconfig-003-20251216 (https://download.01.org/0day-ci/archive/20251220/202512202208.UvUcLQzT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202208.UvUcLQzT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202208.UvUcLQzT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/cpufreq/cppc_cpufreq.c: In function 'cppc_get_perf_ctrs_pair':
>> drivers/cpufreq/cppc_cpufreq.c:852:19: error: invalid use of undefined type 'struct fb_ctr_pair'
     852 |  int cpu = fb_ctrs->cpu;
         |                   ^~
   drivers/cpufreq/cppc_cpufreq.c:855:40: error: invalid use of undefined type 'struct fb_ctr_pair'
     855 |  ret = cppc_get_perf_ctrs(cpu, &fb_ctrs->fb_ctrs_t0);
         |                                        ^~
   drivers/cpufreq/cppc_cpufreq.c:861:41: error: invalid use of undefined type 'struct fb_ctr_pair'
     861 |  return cppc_get_perf_ctrs(cpu, &fb_ctrs->fb_ctrs_t1);
         |                                         ^~
   drivers/cpufreq/cppc_cpufreq.c: In function 'cppc_cpufreq_get_rate':
>> drivers/cpufreq/cppc_cpufreq.c:866:9: error: variable 'fb_ctrs' has initializer but incomplete type
     866 |  struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
         |         ^~~~~~~~~~~
>> drivers/cpufreq/cppc_cpufreq.c:866:34: error: 'struct fb_ctr_pair' has no member named 'cpu'
     866 |  struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
         |                                  ^~~
>> drivers/cpufreq/cppc_cpufreq.c:866:40: warning: excess elements in struct initializer
     866 |  struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
         |                                        ^~~
   drivers/cpufreq/cppc_cpufreq.c:866:40: note: (near initialization for 'fb_ctrs')
   drivers/cpufreq/cppc_cpufreq.c:866:21: error: storage size of 'fb_ctrs' isn't known
     866 |  struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
         |                     ^~~~~~~
>> drivers/cpufreq/cppc_cpufreq.c:866:21: warning: unused variable 'fb_ctrs' [-Wunused-variable]


vim +852 drivers/cpufreq/cppc_cpufreq.c

   848	
   849	static int cppc_get_perf_ctrs_pair(void *val)
   850	{
   851		struct fb_ctr_pair *fb_ctrs = val;
 > 852		int cpu = fb_ctrs->cpu;
   853		int ret;
   854	
   855		ret = cppc_get_perf_ctrs(cpu, &fb_ctrs->fb_ctrs_t0);
   856		if (ret)
   857			return ret;
   858	
   859		udelay(2); /* 2usec delay between sampling */
   860	
   861		return cppc_get_perf_ctrs(cpu, &fb_ctrs->fb_ctrs_t1);
   862	}
   863	
   864	static unsigned int cppc_cpufreq_get_rate(unsigned int cpu)
   865	{
 > 866		struct fb_ctr_pair fb_ctrs = { .cpu = cpu, };
   867		struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
   868		struct cppc_cpudata *cpu_data = policy->driver_data;
   869		u64 delivered_perf;
   870		int ret;
   871	
   872		cpufreq_cpu_put(policy);
   873	
   874		if (cpu_has_amu_feat(cpu))
   875			ret = smp_call_on_cpu(cpu, cppc_get_perf_ctrs_pair,
   876					      &fb_ctrs, false);
   877		else
   878			ret = cppc_get_perf_ctrs_pair(&fb_ctrs);
   879	
   880		if (ret)
   881			return 0;
   882	
   883		delivered_perf = cppc_perf_from_fbctrs(cpu_data,
   884						      &fb_ctrs.fb_ctrs_t0,
   885						      &fb_ctrs.fb_ctrs_t1);
   886	
   887		return cppc_cpufreq_perf_to_khz(cpu_data, delivered_perf);
   888	}
   889	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

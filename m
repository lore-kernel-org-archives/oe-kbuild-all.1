Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E3D20DD4D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 07:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748417667; cv=none; b=Y+4LWo7W7ikCIr97iCrWt5RR4WBg6gnnr96AtFRENpo/UMzIHMRJGcH5/gDTfnCrKHvm7iX0vOuk9/WEUBuSTLmVt+tyk/4XzP0aaNGQJv0etu4qCHnX0ejSdAVUNtcP4ESEaFgAYe4itsPHeitAfBREyQqJzPeODE6XdXTBd54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748417667; c=relaxed/simple;
	bh=09tbC3e6wqa8GChJbWgLdl1O1M18l+2Kr0YfiIftqEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NSR2sXXDdMPuV3TPTX3lNfWavFOUD9EWGcaTAPEpW2JNdbDf2Dxx6H55YdyUuKo4ub+bJ2246T4jYUnkc5t4IBJu59D0c/QvO92zb9vt129RAivQ+lk865XIeh1Kd61Sce+1vxdr9QTjihzXjdxUFgzFirH/BwO+TrFn3GU2v0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Km+G31Qn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Km+G31Qn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748417665; x=1779953665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=09tbC3e6wqa8GChJbWgLdl1O1M18l+2Kr0YfiIftqEk=;
  b=Km+G31QnL6EN+1kZoGmFK9rxpgzPy0LT1UhLpoP7bkOougcfw+sqcNpv
   e4eKTW65VQ2nfay1bY/5MRW7/A6L2ge4gzPwazT3AAm7CX1Xa7ELPHbsP
   NbAZ2KHNk0vdpcFmGU7DlmgGh4XpFKDrfOMQycMiAGKTnFNWmf/d7rcqN
   ToucLh/du5Oo3iHoJz3P97BxJHteVFFeNNDyLkmzE5jrh/YANnrg96Inl
   a0E4hT6txlU2uxSBRW7ZeIJXMeJnE0l8016hg6qqQ6YsfM7cDTON6+Udn
   pQmj1Jgm4+IdZD9WisIM3IrGaRwQ0AHtBWktptaSMuyLCjC77VRnONkwM
   Q==;
X-CSE-ConnectionGUID: FkE8osStRDWWrrwQR5zDNQ==
X-CSE-MsgGUID: 9zJr/HRRSIKivRXd053WNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61833715"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="61833715"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 00:34:24 -0700
X-CSE-ConnectionGUID: DwPMqyOeQz6hKpnRGniPLA==
X-CSE-MsgGUID: +axgeQDjQM6IxyQYVCV0fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="143072184"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 May 2025 00:34:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKBIq-000VO4-1o;
	Wed, 28 May 2025 07:34:20 +0000
Date: Wed, 28 May 2025 15:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2320/2320] kernel/cgroup/cpuset.c:5211:28:
 warning: no previous prototype for 'bpf_cpuset_from_task'
Message-ID: <202505281528.FWgbJLUK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9a55d4a78730623072ee5a82518e7c094296b8b6
commit: 0999aa9df88739a011ba52243082a87402942223 [2320/2320] bpf: cpuset: Add bpf_cpuset_from_task() kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250528/202505281528.FWgbJLUK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505281528.FWgbJLUK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505281528.FWgbJLUK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cpuset.c:5211:28: warning: no previous prototype for 'bpf_cpuset_from_task' [-Wmissing-prototypes]
    5211 | __bpf_kfunc struct cpuset *bpf_cpuset_from_task(struct task_struct *task)
         |                            ^~~~~~~~~~~~~~~~~~~~


vim +/bpf_cpuset_from_task +5211 kernel/cgroup/cpuset.c

  5209	
  5210	#ifdef CONFIG_BPF_RVI
> 5211	__bpf_kfunc struct cpuset *bpf_cpuset_from_task(struct task_struct *task)
  5212	{
  5213		if (!task)
  5214			return NULL;
  5215		return task_cs(task);
  5216	}
  5217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

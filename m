Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD802EAB9D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755172532; cv=none; b=mI406KKVE+CW51WFIkipRRle4UYm9Kl/lBPCffOcyQV1Etk+9q8wATzrcqkyrc26BI3XEKIVK+hu7Jxq9leEow7q/WSdwRItd1MF+q+iMOxzMu2RUnNvQBWn6/DR5hCjYFKLtD36+aZeKSP7f6fbI5pojv7nTfd0GMJoCb+iRl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755172532; c=relaxed/simple;
	bh=yeNNIGTpunZE+yM3Fs1aziMeYp27BSieWBbzFzr86+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M/v/6jXgBOu8z5wx+y4qWpyuKyFF8WYv/Yq0lr97CtCSbPak5Sx8XGV9Zv6XhTW0NtOQkrxyP9a1cfOj2+yF9qEc2HLEsz7R/bM0BQcIrVhy6ezGf4xiqocBEN5kHki0yTeq21D8TrtYNrjI90iZq4YqZHpZOvpF6fyZDiL1WHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GLWQcOoA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GLWQcOoA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755172530; x=1786708530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yeNNIGTpunZE+yM3Fs1aziMeYp27BSieWBbzFzr86+k=;
  b=GLWQcOoAb2h8tR1Q96SviKmLaSGdUexADs3JwF9/RxyTifuVH3vAbbpB
   fvQhXMTj0LFxidWlaDeyy4ZhP3bqwwEKwebTtuDbstXzMD4v9yaH6gGqA
   CL+DGZtjxgF8ZI8GKZOGIG8seNcOki5aoLwvnH/mgRjhbxx+pNguWufwn
   yiaH9FrmTA2AO6vW866HNlMatuxpsWNcg61y+KYKxyxWgvcWFGkM9ehj4
   CzU2b7z5y1iUsu9Z7x+pNuOfQRXIV++UekAff1JR21nl7LiVFazD32eVr
   kqMEowHKhs481sKNptLclqgnuKCFwUEsbAZ/g5uCx1gHy3dRIi/05Pxd+
   Q==;
X-CSE-ConnectionGUID: vUE2hmj1Q6iFdU7AeL1Z0w==
X-CSE-MsgGUID: Mwmtex1BSYWsHda6tbS5bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57202410"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57202410"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 04:55:29 -0700
X-CSE-ConnectionGUID: Lku6tN56SVOdXP//tADfsA==
X-CSE-MsgGUID: 3JCG7jDvRNe7lSiwaTD2eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="197733656"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Aug 2025 04:55:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umWY8-000AvK-39;
	Thu, 14 Aug 2025 11:55:26 +0000
Date: Thu, 14 Aug 2025 19:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] fs/proc/stat.c:224:17: warning: no
 previous prototype for function 'bpf_get_idle_time'
Message-ID: <202508141929.x8zAFTUd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   43d8c124ec4624389b14d42595e5f0195e3e5a1d
commit: 70780f6924c9b58d5a745d4e20e08e9ace28e711 [2679/2679] bpf-rvi: proc: add bpf_get_{idle,iowait}_time kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250814/202508141929.x8zAFTUd-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141929.x8zAFTUd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141929.x8zAFTUd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/stat.c:224:17: warning: no previous prototype for function 'bpf_get_idle_time' [-Wmissing-prototypes]
     224 | __bpf_kfunc u64 bpf_get_idle_time(struct kernel_cpustat *kcs, int cpu)
         |                 ^
   fs/proc/stat.c:224:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     224 | __bpf_kfunc u64 bpf_get_idle_time(struct kernel_cpustat *kcs, int cpu)
         |             ^
         |             static 
>> fs/proc/stat.c:229:17: warning: no previous prototype for function 'bpf_get_iowait_time' [-Wmissing-prototypes]
     229 | __bpf_kfunc u64 bpf_get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         |                 ^
   fs/proc/stat.c:229:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     229 | __bpf_kfunc u64 bpf_get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         |             ^
         |             static 
   2 warnings generated.


vim +/bpf_get_idle_time +224 fs/proc/stat.c

   222	
   223	#ifdef CONFIG_BPF_RVI
 > 224	__bpf_kfunc u64 bpf_get_idle_time(struct kernel_cpustat *kcs, int cpu)
   225	{
   226		return get_idle_time(kcs, cpu);
   227	}
   228	
 > 229	__bpf_kfunc u64 bpf_get_iowait_time(struct kernel_cpustat *kcs, int cpu)
   230	{
   231		return get_iowait_time(kcs, cpu);
   232	}
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

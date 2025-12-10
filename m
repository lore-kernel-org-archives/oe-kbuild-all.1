Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02BC285C9F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 23:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765410612; cv=none; b=nDRHLVWQgTJ3WICohVE3842JJkIw6+cM0rpLe4oyI96T1xcyhY8vGrykozeT4fIRJVM6ng7tmlEOejsb4x3+qr3lcy/VSQmlMJ6CVrIIzDmMF+iUU6jC3JRaXyn9V45vBdY5vLIcWH1z1cJrfAseOoMdFH3sNLeyhd/qpjRIOC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765410612; c=relaxed/simple;
	bh=8VH1KNjlAhyOwyrRteenJsTixVhSQag1FdABvFPH6so=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bmmyWiy+sAByr0qwH0cQVhiuJtTrxngVLV9eEMTdc84o8qfWio/9NyVT0Xu0A2vekLnpbO/qqNH6lwui6BJPN6bUMPK7l8jP2w6Ia3Q5A8Lr/uWCzbWxovqIa1659t3ji4avaoR6PagLDw29Vj0egFPMUrDSAUmq9q3NaDBqHhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzFKLVXY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzFKLVXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765410609; x=1796946609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8VH1KNjlAhyOwyrRteenJsTixVhSQag1FdABvFPH6so=;
  b=VzFKLVXYWmTf5Pct3Jw1fkq7pGR5BDnL5uGHRS/1D0QbFiF9NQTo9wd1
   rKoZ90U94sTKseuIwqGFNCh3hoAOklWpBZUcoVXv4l2JAk+ZlTqqRxtqE
   EKJz44Swn70ekMpcUClGlANFfQJRpqECsaTyXvu8MW065yawzeIv3EiRC
   g/jToR0kH8WniPSM4fAAJcrlbjj0ckDxxpAshezxr4vjbH8UIXBAo2bWJ
   dsDHXvCCupLNs9cnvNcv6cix5z9yDwgjevvj38tAlyQ8acPqc+ZGoTRgF
   b/Hzncb/I9UMEd3aIkss6SNRrTQiMr3qNtGv2LV+PoprO2qJ5Mqxl9Hke
   w==;
X-CSE-ConnectionGUID: bNmc00NcTj+wAc1+SYnHWA==
X-CSE-MsgGUID: BFXQvzAaTKCHBN/2HsBIcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67560521"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67560521"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 15:50:09 -0800
X-CSE-ConnectionGUID: 3hKWucMrTYmrVXspnYB81A==
X-CSE-MsgGUID: hNBu6qQGQhOuhLC/k6xDIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="197449785"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Dec 2025 15:50:08 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTTwc-000000003sr-0oQx;
	Wed, 10 Dec 2025 23:50:06 +0000
Date: Thu, 11 Dec 2025 07:49:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3529/3529] fs/proc/stat.c:224:17: warning: no
 previous prototype for function 'bpf_get_idle_time'
Message-ID: <202512110700.3emRQ7Un-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi GONG,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d281438782e3c28a3df71a64513a3312d43dcf01
commit: 70780f6924c9b58d5a745d4e20e08e9ace28e711 [3529/3529] bpf-rvi: proc: add bpf_get_{idle,iowait}_time kfunc
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251211/202512110700.3emRQ7Un-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110700.3emRQ7Un-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110700.3emRQ7Un-lkp@intel.com/

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

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB91318133
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755167341; cv=none; b=r0lvxuKP4C9QUV3/cWaJdHFw+zkYMVYVyjsAgQSfUmnbCBRRnSokKu7eAUauNDaEbAS56rPt+E4VDHpHPFXM/kSf17MBuI8MnV4cupiUiAwKG6qrTmsCr8pKvgvi+Znh2qTr9zLVdS+JqvZPCNVf6Mq7Oij6aPfB0MTtWDW6Awc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755167341; c=relaxed/simple;
	bh=QDE+0mN9ydEXzm+WHR3fDzca6BrpknDe+vcuA16Hag0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eUYOXRjKpfFzyPIScjiZjL/IEZupwB7nIH2lJ7kj82jJGiSf3bwV4D/4b6U8OX2tr3GiB6gisZTZrrdhdxP843Qgndgdva6DNM2vEMqgI5vWH69sQVbH7f+3zhG/guBrdOslbv2+pAAbQiBnRWoBYP4/8loHuJS/oo0KXwOD6os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmZzrpSy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmZzrpSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755167340; x=1786703340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QDE+0mN9ydEXzm+WHR3fDzca6BrpknDe+vcuA16Hag0=;
  b=nmZzrpSyDn6dsBB+GyzhYdso8h9inPVAHN6uw8hA3vugEsCcXEXncFtf
   lzxfGaq/4qexKbhcIGvbNYCxybUk0QLTQfHelyMFUEegEM+6HJabhWY5l
   hh4AephBvqJ3pZNHIvF3jY05NYxf7IWHRQ+CgOdsXS+p8IY5Mr/+3CmiQ
   6hSQgzreAFPea5hgpdnK435Yxn0yx8vsljHiwzTLrzDpqVXUj2MDmCv12
   PgoF7USww/AO8M4D0rWvYKsBaza7pGCMbBw0CuRtPAXgu+XN9o+yDUoCd
   5WxyzOWBaZlFDL+Yw5XjFNiA/qNcqi1a9nF3f5AsE6WStmQpeGbqJJ77p
   Q==;
X-CSE-ConnectionGUID: hsv2rxCtRN2beUnN7HLsaQ==
X-CSE-MsgGUID: jpI7eHhfTMSW4LN/3vu/jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57196013"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57196013"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 03:28:58 -0700
X-CSE-ConnectionGUID: sS0cTtNHQe+8WgQDrJwiMQ==
X-CSE-MsgGUID: xyS5FSmLTra91ma9znowtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166363467"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 14 Aug 2025 03:28:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umVCY-000Aqu-1y;
	Thu, 14 Aug 2025 10:28:54 +0000
Date: Thu, 14 Aug 2025 18:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/bpf-rvi/common_kfuncs.c:12:32:
 warning: no previous prototype for function 'bpf_mem_cgroup_from_task'
Message-ID: <202508141840.Hfv7lhHI-lkp@intel.com>
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
commit: ebd40bbe89d81531c7df459a827d7608c3de57bc [2679/2679] bpf-rvi: Add bpf_mem_cgroup_from_task() kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250814/202508141840.Hfv7lhHI-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141840.Hfv7lhHI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141840.Hfv7lhHI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf-rvi/common_kfuncs.c:12:32: warning: no previous prototype for function 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      12 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^
   kernel/bpf-rvi/common_kfuncs.c:12:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      12 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |             ^
         |             static 
   1 warning generated.


vim +/bpf_mem_cgroup_from_task +12 kernel/bpf-rvi/common_kfuncs.c

     7	
     8	/*
     9	 * Common support kfuncs
    10	 */
    11	
  > 12	__bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
    13	{
    14		return mem_cgroup_from_task(p);
    15	}
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

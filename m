Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54297523C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711208527; cv=none; b=ajTH3nwEIRNeOXG8JorEO/ar6sd4qOGmGBDTsqO7VczkVVN99Wx7XSFnVod28ZVGss+MP/xZ2JooYtWr6mBgEczVtXDf2Ho9nnpVnTi3wzkv4OkBWO5k8xoQI20A3LARNw5+6cCebsegUAGJrKA2AsC03v38UDSErcrUhna1Gj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711208527; c=relaxed/simple;
	bh=8+96Zn1Nvp4HVPdhEytmNqyM0m4tw8fH9PnFe8pZ7X4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ko9FgJRah6dCheTybZDUYoI7GrTevlONTI32nzByraEl2OiJCU9iDMucSPEDqu1nvNMfZCm9jo1NyRzKIT5p3S+09590i7YaQwPHK/maTjidpgTvxpmpbG4SHDGNmrJZuXFnaBCPfYSD75rhuqndUFUQEE7qmTGtcgyt17dJQW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NETIqMnB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NETIqMnB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711208525; x=1742744525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8+96Zn1Nvp4HVPdhEytmNqyM0m4tw8fH9PnFe8pZ7X4=;
  b=NETIqMnBwj8UgBpv5uywSi4uaEqBJBoMAmMP8G2next4AfGIF2ZfIWDm
   Z32ByOdPiA7CKv3UZN0QiVLPRDr9MbCREQK2VLM9Fbh52h1aOZWvlnBY3
   vwEa9V0GOWzyV3fYCwZSpiRCXiQqfIoMvKbyfsWjTfRSm5NDbB0AG4OuG
   0mPYZkdS/46lKZrmLczN0JUqMnTUeO+cl9os6K/YSyCoNr70qn7VlmHlR
   jWneVsCt6hgkEjHWaMu0xtN6uVdF/NNkDaPNFfSA6gaxVOXJhFMGf8cc8
   D5wx/KimJs2OdMocmNBt1Izn3RN27UJlyuxbDsibokjY1oTvAPFtmEVRV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="17645497"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="17645497"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 08:42:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="15198431"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Mar 2024 08:42:03 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro3VQ-000LGl-1a;
	Sat, 23 Mar 2024 15:42:00 +0000
Date: Sat, 23 Mar 2024 23:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18399/30000] kernel/sched/bpf_sched.c:108:5:
 warning: "CONFIG_CGROUP_SCHED" is not defined, evaluates to 0
Message-ID: <202403232345.qUtlhdt3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b670dd901cbbf97745380d373b1d2607b3235590
commit: 7cdbdbf5b6c12b1bff2ffb6b4bf08910ecf1689a [18399/30000] sched: programmable: Add helpers to set tag of task or task_group
config: x86_64-randconfig-012-20240323 (https://download.01.org/0day-ci/archive/20240323/202403232345.qUtlhdt3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403232345.qUtlhdt3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403232345.qUtlhdt3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/bpf_sched.c: In function '____bpf_sched_set_tg_tag':
>> kernel/sched/bpf_sched.c:108:5: warning: "CONFIG_CGROUP_SCHED" is not defined, evaluates to 0 [-Wundef]
     108 | #if CONFIG_CGROUP_SCHED
         |     ^~~~~~~~~~~~~~~~~~~


vim +/CONFIG_CGROUP_SCHED +108 kernel/sched/bpf_sched.c

   105	
   106	BPF_CALL_2(bpf_sched_set_tg_tag, struct task_group *, tg, s64, tag)
   107	{
 > 108	#if CONFIG_CGROUP_SCHED
   109		if (tg == NULL || tg == &root_task_group)
   110			return -EINVAL;
   111	
   112		if (tg->tag == tag)
   113			return 0;
   114	
   115		rcu_read_lock();
   116		walk_tg_tree_from(tg, tg_change_tag, tg_nop, (void *)(&tag));
   117		rcu_read_unlock();
   118	
   119		return 0;
   120	#endif
   121		return -EPERM;
   122	}
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

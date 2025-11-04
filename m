Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86B713AA2D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 01:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762218152; cv=none; b=Ca0BYWHI2DymkPcOaNiXtBDfebVB/9tTvAKlFELclmNP+kiWjJSvBZ+JPFxuPyUmUFADeDx3m626Er4lRUZLjz3L6FAkq1sbDCX3+lB/0PNDkE6YMLuaLbsMN8/lo/Fw74U7NJN9WMHn8Z/glJO4ACGg3cqf/VShFC2PwNCyEQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762218152; c=relaxed/simple;
	bh=TASPINcCa1Xv3KFC9Y0DNNxb9sb+TnoivyRIR8vdya8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nAu69q3sCFMBd8kQOIIW4spMYql4ZjFzp4VPhavIBWZJxIk25k8m3B5LjJF2d9qTdhHyiS8M7pUYcCruvuYlAgZO2GjV5idiFPEdq/uV6yJaFlHy934jI3h5OToBKCL0SuqRXWYJ7A1tQ41APfxHRr5R+CvfYD7xsNYS4/7dLo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSXJLXv2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSXJLXv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762218151; x=1793754151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TASPINcCa1Xv3KFC9Y0DNNxb9sb+TnoivyRIR8vdya8=;
  b=cSXJLXv233oUJH4FDSPlkv91IDo5OcTgqRTpINiFUTMerDY7eofjGk/5
   nDNPcZogIauFRPelAARFALDwL6muD/NfvlVdqsm1RmXVsbnCici25Z+We
   TU6qSolsrzV2ac0RglHIyhcGRn9gNz++tA09VzSS13WHQ1Yppnn8IYN0K
   o++BJtJ4ceIWKzA3Kp+Wf0rOwH/eWBWUFAhEQIWQyJdEjH3MpbvU4d3zj
   Ps0IKRAQTZ5sipI3yGpTkNhLJVa2hG/fJLjwa3b1uFvZ0D3tMZduD0mrN
   DRTb9VZl1qjSJxAarP5jEBGJsoKq3987KN83orYcYkLb0+m9lx+Pp8OF2
   g==;
X-CSE-ConnectionGUID: PnwRly3mTQC9OmhEk70LnQ==
X-CSE-MsgGUID: tbeZpbMlSVChHMfVbRu5Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74908444"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="74908444"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 17:02:30 -0800
X-CSE-ConnectionGUID: dHQMHZ7sQKmPb06VsVuY5g==
X-CSE-MsgGUID: Iez3ykNUQcOZJgdbh0VwiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="191328924"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 03 Nov 2025 17:02:29 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG5QL-000Qhr-0k;
	Tue, 04 Nov 2025 01:01:45 +0000
Date: Tue, 4 Nov 2025 08:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] kernel/bpf-rvi/common_kfuncs.c:12:32:
 warning: no previous prototype for 'bpf_mem_cgroup_from_task'
Message-ID: <202511040801.Uk13PqHb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a29fc03bd0ddaf7388cf31604ef5bd9807585109
commit: ebd40bbe89d81531c7df459a827d7608c3de57bc [3098/3098] bpf-rvi: Add bpf_mem_cgroup_from_task() kfunc
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251104/202511040801.Uk13PqHb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040801.Uk13PqHb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040801.Uk13PqHb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf-rvi/common_kfuncs.c:12:32: warning: no previous prototype for 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      12 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~


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

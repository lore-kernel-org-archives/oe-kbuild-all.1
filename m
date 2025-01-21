Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B287C2F5B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 04:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737432325; cv=none; b=VC0VTIQxCDALAeHrOHzcBNv6cWmCJx7YdTCjHviSvT/pk5dXGyioj5Rdcfi2d6bZx6lmWCCY3adkiqxQUuzat874OouU0gajEDonwcJadBdHqL13E0XsI24jlOaOh2QG1Amui59x+k2qnLRUi2/R3ue2Q/Q9453b8Sl/Zv6mugo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737432325; c=relaxed/simple;
	bh=8elwdEdOspPVrZLaJLJkn862HLX9p9X7tW/l7jNjXYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1f4fEo1Eke7caalOpPzZVd/BkGzMaYFWB5ZzPgD273O9rwP/XwpHeunvn8oI0NudGUnM8jkfPBgHi4KeqjQwQq59tCJKVXc2306oS1Jyus/Vrweem+I8R42nmirdIY0ZDTUqOIz0O08qJuL2GFMWiIVpdeu8Rt9z76H0ez2gbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OrW456Jd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OrW456Jd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737432323; x=1768968323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8elwdEdOspPVrZLaJLJkn862HLX9p9X7tW/l7jNjXYg=;
  b=OrW456Jdm0wZN/NN/nd+hPecxMp/ImPBJjzaeZxsi+o1cBgPKwIAO/OA
   1HSJ3s/1lKiZCgPZDhC0lu3D2iSMCtq4cOf1jth4723xr8Kmz70WDSIfd
   jkA+ngG/V2KXho4bKEfdYGkILjoaPe1Mmii524HoNyRLJrT84Kw5h/c5n
   CELgRNtiI6g0DLcNxwUMmxK9tqxLh9zVhQ454jI9rBWVdQn+zYw0RdEbI
   yRNFqsGmhxPb1hGMnaT2GG9410LmlmXh9D+mIgvYY94i+ADlvxo9pwcNX
   RjvyrspwiWHusGhGbS3oCkvX70HNLYkXZ3K0wRulJeiWaJ8aswvm3N2wW
   w==;
X-CSE-ConnectionGUID: YqqMDONyRNWHeioRo6EBTw==
X-CSE-MsgGUID: aYdqnwwSRNuQg07EjEBdzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="55382748"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="55382748"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 20:05:23 -0800
X-CSE-ConnectionGUID: Je+ySO09TcaSnpkPnKIhbA==
X-CSE-MsgGUID: 01Wfo0yZTfeiRkY5KWIxqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="107230048"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jan 2025 20:05:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta5Vv-000Xax-2c;
	Tue, 21 Jan 2025 04:05:19 +0000
Date: Tue, 21 Jan 2025 12:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1833/1833] kernel/sched/bpf_sched.c:211:32:
 error: 'struct cfs_rq' has no member named 'tg'
Message-ID: <202501211149.c38cljuA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   88ee450e4bfbe03d27189e9a1a794f610ad57ae5
commit: 6f06e093b3708dcee5b7e4f0478e0206bc601da1 [1833/1833] sched/ebpf: Support task selection programmable
config: arm64-randconfig-r061-20250121 (https://download.01.org/0day-ci/archive/20250121/202501211149.c38cljuA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211149.c38cljuA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211149.c38cljuA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:113:
   kernel/sched/bpf_sched.c:187:17: warning: no previous prototype for 'bpf_sched_entity_is_task' [-Wmissing-prototypes]
     187 | __bpf_kfunc int bpf_sched_entity_is_task(struct sched_entity *se)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/bpf_sched.c:195:33: warning: no previous prototype for 'bpf_sched_entity_to_task' [-Wmissing-prototypes]
     195 | __bpf_kfunc struct task_struct *bpf_sched_entity_to_task(struct sched_entity *se)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/bpf_sched.c:203:18: warning: no previous prototype for 'bpf_sched_tag_of_entity' [-Wmissing-prototypes]
     203 | __bpf_kfunc long bpf_sched_tag_of_entity(struct sched_entity *se)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/bpf_sched.c: In function 'bpf_sched_tag_of_entity':
>> kernel/sched/bpf_sched.c:211:32: error: 'struct cfs_rq' has no member named 'tg'
     211 |         return group_cfs_rq(se)->tg->tag;
         |                                ^~


vim +211 kernel/sched/bpf_sched.c

   202	
   203	__bpf_kfunc long bpf_sched_tag_of_entity(struct sched_entity *se)
   204	{
   205		if (!se)
   206			return -EINVAL;
   207	
   208		if (entity_is_task(se))
   209			return task_of(se)->tag;
   210	
 > 211		return group_cfs_rq(se)->tg->tag;
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

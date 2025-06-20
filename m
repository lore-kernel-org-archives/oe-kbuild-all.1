Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3996D3987D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 02:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750385897; cv=none; b=EGrZy/Yv9fq1upU5C0Yh7KkNmQJX4O4FZarbzzppXkHvkov2cd9csICq+RjUl1qGm10xe51kHHLPOu8jXWcy20iS+JG/fGJVrf0AgmiQ/HILBYAVzJGRPiyntvbh84tGv9tC2qWh4p/zyHok0CM4rPDko3aoFxy4oEAPjHNc7Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750385897; c=relaxed/simple;
	bh=krpBn5PZF88W9XMR62Rois5iMEVRDpprwab8ExXXzrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i6WD7eXt6xvRDNjpDwbORpft1tVUfmOg3tLs2xt+IFQnvEbjqRdC2iAsWsK+UQPuTGAbNrUzlo3GDrHVZbuipv7xcUeAVNPm3SdVmfsXRRX/jgREvUnwSz57hVMUYJAy2xM+FWTzEFGH4LNTxXFtX39yHBjBabxaFkiqgsEu6/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTorr2Rp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTorr2Rp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750385894; x=1781921894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=krpBn5PZF88W9XMR62Rois5iMEVRDpprwab8ExXXzrs=;
  b=UTorr2RpcQpjf4vL4j4vmcHTjr5iiwVRslIePG+LJZqlDdfYldqXG/9F
   DzwcChpVo9M+1thLzLYqIKuCdVKW1XdG6Uf8P3lZeZHaPu9Rtq1OCxpZj
   BXzJb6BburWZNgdh0J64u9+jcXPdU3fsLanLWNj1ZT2J9kRLLEzExmUOp
   kv/M3/hY5VnA9iPwBAaPxCa2xolC1mvLbzcQTxNs9yBC06Pj6LmQ38Zbx
   LNDiRmvte9MauS7rorZ7D1TQUGQrFlSEyU+Mc5XfqkNMLnOu5yy/oaFu3
   jpJbZGiflc1ShO9LoEz1FsMwzcAbbuErpSnn7EjB1ghlvWboG+uxlmfGG
   g==;
X-CSE-ConnectionGUID: R6+45m/CQtq9tipuIvYfKA==
X-CSE-MsgGUID: HXvWiLhdRRuMPBgmvkVdoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63331294"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="63331294"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 19:18:14 -0700
X-CSE-ConnectionGUID: y4j7ceREToqMsrUESlCwgQ==
X-CSE-MsgGUID: JaRzhj/2S8iXQKUJ9OwJcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="151094703"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Jun 2025 19:18:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSRKV-000LIO-2B;
	Fri, 20 Jun 2025 02:18:11 +0000
Date: Fri, 20 Jun 2025 10:18:01 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.3 16/16] kernel/sched/bpf_psi.c:126:10: warning:
 assignment makes pointer from integer without a cast
Message-ID: <202506201042.HMpLuzD9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.3
head:   2ad0d39d05d59bc3930ed54991a90d397fd498a8
commit: 2ad0d39d05d59bc3930ed54991a90d397fd498a8 [16/16] sched: psi: introduce BPF_PSI struct ops
config: sparc64-randconfig-002-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201042.HMpLuzD9-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201042.HMpLuzD9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201042.HMpLuzD9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:97:0:
   kernel/sched/bpf_psi.c: In function 'bpf_psi_ops_reg':
   kernel/sched/bpf_psi.c:126:12: error: implicit declaration of function 'cgroup_get_from_id'; did you mean 'cgroup_id_from_mm'? [-Werror=implicit-function-declaration]
      cgroup = cgroup_get_from_id(ops->cgroup_id);
               ^~~~~~~~~~~~~~~~~~
               cgroup_id_from_mm
>> kernel/sched/bpf_psi.c:126:10: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      cgroup = cgroup_get_from_id(ops->cgroup_id);
             ^
   kernel/sched/bpf_psi.c:130:11: error: implicit declaration of function 'cgroup_psi'; did you mean 'cgroup_init'? [-Werror=implicit-function-declaration]
      group = cgroup_psi(cgroup);
              ^~~~~~~~~~
              cgroup_init
   kernel/sched/bpf_psi.c:130:9: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      group = cgroup_psi(cgroup);
            ^
   kernel/sched/bpf_psi.c:158:3: error: implicit declaration of function 'cgroup_put'; did you mean 'cgroup_init'? [-Werror=implicit-function-declaration]
      cgroup_put(cgroup);
      ^~~~~~~~~~
      cgroup_init
   kernel/sched/build_utility.c: At top level:
   cc1: warning: unrecognized command line option '-Wno-unterminated-string-initialization'
   cc1: some warnings being treated as errors


vim +126 kernel/sched/bpf_psi.c

   114	
   115	static int bpf_psi_ops_reg(void *kdata, struct bpf_link *link)
   116	{
   117		struct bpf_psi_ops *ops = kdata;
   118		struct cgroup *cgroup = NULL;
   119		struct psi_group *group;
   120		struct bpf_psi *bpf_psi;
   121		struct psi_trigger *t;
   122		struct psi_trigger_params params;
   123		int ret;
   124	
   125		if (ops->cgroup_id) {
 > 126			cgroup = cgroup_get_from_id(ops->cgroup_id);
   127			if (IS_ERR_OR_NULL(cgroup))
   128				return PTR_ERR(cgroup);
   129	
   130			group = cgroup_psi(cgroup);
   131		} else {
   132			group = &psi_system;
   133		}
   134	
   135		bpf_psi = bpf_psi_create(ops, ops->cgroup_id);
   136		if (!bpf_psi) {
   137			ret = -ENOMEM;
   138			goto exit;
   139		}
   140	
   141		params.type = PSI_BPF;
   142		params.res = PSI_MEM;
   143		params.privileged = true;
   144		params.bpf_psi = bpf_psi;
   145		params.threshold_us = 100000;
   146		params.window_us = 1000000;
   147	
   148		t = psi_trigger_create(group, &params);
   149		if (IS_ERR_OR_NULL(t)) {
   150			bpf_psi_free(bpf_psi);
   151			ret = PTR_ERR(t);
   152			goto exit;
   153		}
   154	
   155		ops->bpf_psi = bpf_psi;
   156	exit:
   157		if (cgroup)
   158			cgroup_put(cgroup);
   159		return ret;
   160	}
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C691924BD03
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 07:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760770940; cv=none; b=Figfd7+KTP1BraSx+vlC+1f5q+fghTrIAw5VJ/jFnipvCZwhNGCWt0dZjZW6w9Jxtbs45FgWZoGFcF2ayXoupPrDsCkQ8HmUolFm94BNlaK7LnmVAuLy1UipdIBGQ9KqeCmCBbgaWzlabWSRjO5JnD7bJxU1AA8tmnOargeLvJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760770940; c=relaxed/simple;
	bh=czB3fwSvhnwzvL1RZv/Bpgpb6bbu25bOjCjSEy7+gfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IWLSSQHBK8ujrBM2wKF2oQR6sFLafQMkHuJJS+ELnbYB3D6cTe8PYTLhmPn3MeymVfw7+cLMgFwRYMIFTKR3Q3fmGl13y6gadhZLKD4KkDcKz4BLsLB5md6sUKjYi7cYQJiT68MJfmAiP5qnEaEZVd8K8M4HheY/aIMKWPyqiM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOuJxGUA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOuJxGUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760770939; x=1792306939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=czB3fwSvhnwzvL1RZv/Bpgpb6bbu25bOjCjSEy7+gfM=;
  b=iOuJxGUAtDlKmQeOMJ/ZHcEgr1AIKvZ3ZxHU9OAweR5zYlvBFcvlFB4Y
   OK/qtjRPhhDEbLE5WuJ37ZjhisKDS+1pS8jT1YrZkiKmpL0u359B1DLa5
   zqxOuLk7SJ0B2mBhcdE8q+80BcmAb81eeAc3yHN5LvEq3qRbheYDR/vpf
   9wY6oJtdvvQDWeKPB575r9m6gpOGk6EkCN3AnynwiD6PS83Q2VfvYSnr8
   LhrzBdTShht4IMnKgK0tOWoiN9WQ6N76OPdlMAa5fZgeImYr2jJ0gYcaU
   TxCx1fG7frpmRKLRDHodUdOoRrmJBqA7Fs6anQs9kfyH7ut2j7HR62ExZ
   Q==;
X-CSE-ConnectionGUID: 3KIYg35VTCiMrfz803jqZw==
X-CSE-MsgGUID: UtjAow69SRqk96XjbhoESQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62682598"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="62682598"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 00:02:18 -0700
X-CSE-ConnectionGUID: 5qhnhEAmQt2XRg4vhoHLDg==
X-CSE-MsgGUID: CkG2o5wySOCMFxKKvD8ilw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="206622601"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2025 00:02:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA0xB-000883-2D;
	Sat, 18 Oct 2025 07:02:13 +0000
Date: Sat, 18 Oct 2025 15:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2.6 7/21] mm/bpf_oom.c:174:18: warning: variable
 'ret' set but not used
Message-ID: <202510181418.rUGQTmjY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.2.6
head:   3f3d45da5408178ed67987b86fa78d5706771389
commit: b85abf2b8f53a5a54b8d13de4310b18bcd71067e [7/21] mm: introduce bpf struct ops for OOM handling
config: x86_64-buildonly-randconfig-002-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181418.rUGQTmjY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181418.rUGQTmjY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181418.rUGQTmjY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/bpf_oom.c: In function 'bpf_oom_memcg_offline':
>> mm/bpf_oom.c:174:18: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     174 |         int idx, ret;
         |                  ^~~


vim +/ret +174 mm/bpf_oom.c

   168	
   169	void bpf_oom_memcg_offline(struct mem_cgroup *memcg)
   170	{
   171		struct bpf_oom_ops *bpf_oom_ops;
   172		struct bpf_oom_ctx exec_ctx;
   173		u64 cgrp_id;
 > 174		int idx, ret;
   175	
   176		/* All bpf_oom_ops structures are protected using bpf_oom_srcu */
   177		idx = srcu_read_lock(&bpf_oom_srcu);
   178	
   179		bpf_oom_ops = READ_ONCE(memcg->bpf_oom);
   180		WRITE_ONCE(memcg->bpf_oom, NULL);
   181	
   182		if (bpf_oom_ops && bpf_oom_ops->handle_cgroup_offline) {
   183			cgrp_id = cgroup_id(memcg->css.cgroup);
   184			exec_ctx.cgroup_id = cgrp_id;
   185			ret = bpf_oom_ops->handle_cgroup_offline(cgrp_id, &exec_ctx);
   186		}
   187	
   188		srcu_read_unlock(&bpf_oom_srcu, idx);
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834A22E3715
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 04:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752640304; cv=none; b=EZPf8pqCtnZwoiXjb69Yzz85TTKgmLT8M+rNs5IrOpXDXzu9pTc/sHUtq19k+0gr1lhPz0TFXwQBra5n969hHu8zD9VHtd+asVp1zMWhdNMZYw5y36uddHzhB4zQZoGD+5CENhZ62deg9VBpaq1jjeqzZt+iGCj5rBC3lC0rmsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752640304; c=relaxed/simple;
	bh=ZILo68TCoX36VKDaD0YvxUoxoJK0c1y9L5xdmAK+7AE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rq8UtRMPEEbtGGCWyaDH4AmhKoqM+PXUwIW+IOWRXc4X+KhZ9JDKk2nAsJdjUUeD9ZeLH+/Neid5UwqFYOYM1PXLGJUtW+xl+jIt7n4Ywn2cHfryseanKLCjF1saiTHbKrG8X3ronV7coBJ7lZczZm2HEE3ZoaBXyi0Mw6DSqjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRpslTJy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRpslTJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752640303; x=1784176303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZILo68TCoX36VKDaD0YvxUoxoJK0c1y9L5xdmAK+7AE=;
  b=dRpslTJyPMsoRDRHkvMF2qeJsmsXDfHmUNBCF5qV7Bwj5vBfF5v5IvfQ
   Rj9VeOr7DEMS/Y0h+4CCCFM47muDH8IJsk8RN+N1ToZz5oX7VHzl4MrNb
   Ujt9e3STr6TO8Jy6lHfAWSGquPj0Hf6ZbFHBNPWUzKIcNJcDQVQTAHOhY
   nwmENuN8f+qb8APppEWbD+ZLfLb4krWmNrNEpOzy9jeUxscmvaIQptyVa
   dCOXM6jHcdkVlfHwwE4SWBekbtc/YqIDqkK8B7/YZgN4AS3p3MtmBjhzZ
   Qeu7lZjRA0G2B0+2OS0Pqk8jAEmpxU6iyRhH4KMXVO5NGg2MPIdzQTqDQ
   A==;
X-CSE-ConnectionGUID: mxSqzi7gSVuZ3BjVq2sYhA==
X-CSE-MsgGUID: GkNk6FwPQ4i4zhWgDtjVMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54730212"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="54730212"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 21:31:20 -0700
X-CSE-ConnectionGUID: NfSTbNkpRWOtaMfyVnFStg==
X-CSE-MsgGUID: 4p+EZOnuQ0KzF7jgqQA3Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="161423007"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jul 2025 21:31:19 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubtnZ-000Bsn-00;
	Wed, 16 Jul 2025 04:31:17 +0000
Date: Wed, 16 Jul 2025 12:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.3 16/16] kernel/sched/bpf_psi.c:80:35: error:
 invalid use of undefined type 'struct cgroup'
Message-ID: <202507161212.6BTWpjsy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.3
head:   f6d7d74251a82ec19e7d4e92627a6faf008dca8d
commit: f6d7d74251a82ec19e7d4e92627a6faf008dca8d [16/16] sched: psi: introduce BPF_PSI struct ops
config: powerpc64-randconfig-001-20250716 (https://download.01.org/0day-ci/archive/20250716/202507161212.6BTWpjsy-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161212.6BTWpjsy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507161212.6BTWpjsy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:97:
   kernel/sched/bpf_psi.c: In function 'bpf_psi_cgroup_free':
>> kernel/sched/bpf_psi.c:80:35: error: invalid use of undefined type 'struct cgroup'
      80 |  struct psi_group * group = cgroup->psi;
         |                                   ^~
   kernel/sched/bpf_psi.c: In function 'bpf_psi_ops_reg':
   kernel/sched/bpf_psi.c:154:12: error: implicit declaration of function 'cgroup_get_from_id'; did you mean 'cgroup_id_from_mm'? [-Werror=implicit-function-declaration]
     154 |   cgroup = cgroup_get_from_id(ops->cgroup_id);
         |            ^~~~~~~~~~~~~~~~~~
         |            cgroup_id_from_mm
   kernel/sched/bpf_psi.c:154:10: warning: assignment to 'struct cgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |   cgroup = cgroup_get_from_id(ops->cgroup_id);
         |          ^
   kernel/sched/bpf_psi.c:158:11: error: implicit declaration of function 'cgroup_psi'; did you mean 'cgroup_init'? [-Werror=implicit-function-declaration]
     158 |   group = cgroup_psi(cgroup);
         |           ^~~~~~~~~~
         |           cgroup_init
   kernel/sched/bpf_psi.c:158:9: warning: assignment to 'struct psi_group *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     158 |   group = cgroup_psi(cgroup);
         |         ^
   kernel/sched/bpf_psi.c:187:3: error: implicit declaration of function 'cgroup_put'; did you mean 'cgroup_init'? [-Werror=implicit-function-declaration]
     187 |   cgroup_put(cgroup);
         |   ^~~~~~~~~~
         |   cgroup_init
   cc1: some warnings being treated as errors


vim +80 kernel/sched/bpf_psi.c

    77	
    78	void bpf_psi_cgroup_free(struct cgroup *cgroup)
    79	{
  > 80		struct psi_group * group = cgroup->psi;
    81		static LIST_HEAD(to_destroy);
    82		struct psi_trigger *t, *p;
    83	
    84		mutex_lock(&group->bpf_trigger_lock);
    85		list_for_each_entry_safe(t, p, &group->bpf_triggers, bpf_node) {
    86			mutex_lock(&t->bpf_psi->lock);
    87			if (t->bpf_psi->trigger) {
    88				t->bpf_psi->trigger = NULL;
    89				list_move(&t->bpf_node, &to_destroy);
    90			}
    91			mutex_unlock(&t->bpf_psi->lock);
    92		}
    93		mutex_unlock(&group->bpf_trigger_lock);
    94	
    95		list_for_each_entry_safe(t, p, &to_destroy, bpf_node) {
    96			bpf_psi_cgroup_free_handle(t, cgroup);
    97			psi_trigger_destroy(t);
    98		}
    99	}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4BA2AE94
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 16:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733070868; cv=none; b=DKoaypBHHIP1hscb+n4mUWXJwwOVWM9RMP5slF+7IRvD4S0RLNMBSjMilmSlK9Mg5QqVTgDp54/yokynXagpxr60PGOugDjreHKT2LnD36a0QFJCPi5QSk7vZPuD8xrgJVMpOf95QACpRbaydJZBo1Zv5rSSJ+M7yV9h7jZpNNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733070868; c=relaxed/simple;
	bh=jJXuOpPj+ne8na3iaeD4xL9q+lDWO8xJHF7IYa9FNNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=otCHWvWn6EGUx2UaQGsFA6hp6toblXmjwyAAtSI1KC9iCDJzKnFOTTSs8vPuFY5gkjkn1nK799PN570ShqnYyZnRMYCQOAbU/gd0wLx5eOM5wDwFWBLfHh7fn7fGdcMDZMLpozjWkekS8Fc4p5PFNVeUYsl8kEeC+8srZsl8fQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1lg2xtG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1lg2xtG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733070867; x=1764606867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jJXuOpPj+ne8na3iaeD4xL9q+lDWO8xJHF7IYa9FNNs=;
  b=c1lg2xtGKp/wE7u9TpsJ7mgrnVK6bJQMLPQ9I+MaFiBPYwJORolMrFlz
   kFYpeX+lqnOB0K2GS8NCjcXTypOvuFJF4h/V3bnDeAhKdxEdgjOVG+Is9
   Jk1NV448vAybavzvbczOQY9mzC4lOJVKc+SW+hE7rBegh8eJQQrmo9uC+
   uqn1QvGgP44lyYQZf/Fcli8+ooLrjB9FOVH+2bM5iiIdQR3fTMoqr4AIp
   RPsAMXzK2LzSf+5ljrmFS2ycVxvApMq6ru7lT7QkAdHV6BLmb8B6EHhFV
   jyG3tkXFtNigIxIsP+I6ync9Tv3/eEUDD4C9db1go5WSTITfkehJVL8KU
   Q==;
X-CSE-ConnectionGUID: nv+sme9aTvOYjtQW1H4+gw==
X-CSE-MsgGUID: 2rnZU2tsR8StRwBSi6k/3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="44619793"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="44619793"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 08:34:26 -0800
X-CSE-ConnectionGUID: yW5lafW9S4KOWDvu+7KAtw==
X-CSE-MsgGUID: kHFjNjGAQ7+1FafNbE3Z0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="92808979"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2024 08:34:26 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHmtq-0001g5-2U;
	Sun, 01 Dec 2024 16:34:22 +0000
Date: Mon, 2 Dec 2024 00:34:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuan Can <yuancan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1459/1459] mm/memcontrol.c:3147:6: warning: no
 previous prototype for 'hisi_oom_recover'
Message-ID: <202412020047.bA4x90tl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Weilong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: b498d9f1bacd40d583c0970cab02ad522127a7e7 [1459/1459] arm64/ascend: Add new enable_oom_killer interface for oom contrl
config: arm64-randconfig-003-20241113 (https://download.01.org/0day-ci/archive/20241202/202412020047.bA4x90tl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020047.bA4x90tl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020047.bA4x90tl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:3147:6: warning: no previous prototype for 'hisi_oom_recover' [-Wmissing-prototypes]
    3147 | void hisi_oom_recover(struct obj_cgroup *objcg)
         |      ^~~~~~~~~~~~~~~~


vim +/hisi_oom_recover +3147 mm/memcontrol.c

  3145	
  3146	#ifdef CONFIG_ASCEND_OOM
> 3147	void hisi_oom_recover(struct obj_cgroup *objcg)
  3148	{
  3149		struct mem_cgroup *memcg;
  3150	
  3151		memcg = get_mem_cgroup_from_objcg(objcg);
  3152		if (!mem_cgroup_is_root(memcg))
  3153			memcg_oom_recover(memcg);
  3154		css_put(&memcg->css);
  3155	}
  3156	#else
  3157	static inline void hisi_oom_recover(struct obj_cgroup *objcg) { }
  3158	#endif
  3159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

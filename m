Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB071F94A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766239259; cv=none; b=RJ8E6UMO+ykUd0IpJZV1NLo2k148l0e+6C1NqZryzVRw61zP1Nri18ADTCLIpwmHjONpGiKPUVC0EChFLoaCb2DhmAI7wDY4XfPluCnG4ZGm/mpeH451So98Qpj/G7LxXyQvua7Ij8OQaQn1LPuNjv+Le7YdomWMOoyeJNF+qNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766239259; c=relaxed/simple;
	bh=zar8llpB67yDAwCnM4bxHRtkkwSz2ipn+8pD9L0CPFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pOJIWtm10S4MwEIoSqrWjvL2HJQpj+1LOY0krJlEGWxSjbA3iC9J3zQvXMAjcr4iVOcln5ngYOwDyiztFpUmsckBRYyzNr5G+H2VSkHiGqY1pre3u//EFio3jGR+undexHXxz/vAhA+QmD8AWjclvqaUgBwuu8Gq8Knc3pL3Dd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVtOosaq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVtOosaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766239258; x=1797775258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zar8llpB67yDAwCnM4bxHRtkkwSz2ipn+8pD9L0CPFE=;
  b=mVtOosaqxMi/+kbYDlvR/mjbqKGno4snFA9FExNQn0aub9xccG1n3Rer
   vmhEb9kv87WlkqjSDZlmJasMlkmu96mtTpUMUvmh0Ze6RpemyGYTnkhX/
   wFtZAot3IfbJiuDiGo26ooTDBuPyB/UHchB9P11RqCGWr38Fu5pIH0QQB
   vxu/G3dAb1gFrzhmKzh1pPmQeABWsD64tfjpnqz0dS7n73bVfxGlvOVXd
   AGclVEizRdvqpkyqSEYMaOZYWXZpuu3YdwE7YvT9JM0Kr9oZKZHJkVv6D
   wum1G/9k0e7dF3Ku2k7+FvXqpJCHxwPSvLYao0hoZP9iQfC0mwLHHBTZZ
   w==;
X-CSE-ConnectionGUID: AUNR1YLKR3+3RaNlqmm4Uw==
X-CSE-MsgGUID: xtfFlC6ASNuYTt3RaMvqPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85590749"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85590749"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:00:58 -0800
X-CSE-ConnectionGUID: Bc2lby3XSn2pOrIkwvJsOA==
X-CSE-MsgGUID: QaZ6acGJToaOewS5wx6yLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199344204"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2025 06:00:56 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxVu-000000004bW-1tUg;
	Sat, 20 Dec 2025 14:00:54 +0000
Date: Sat, 20 Dec 2025 22:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Qiao <zhangqiao22@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3201/3201] kernel/sched/soft_domain.c:186:10:
 error: implicit declaration of function 'cpu_util_cfs'
Message-ID: <202512202153.mHQVnY6o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: dd6655291bf7230ef984e1d283a5ec05821f996f [3201/3201] sched: Attach task group to soft domain
config: x86_64-buildonly-randconfig-002-20250909 (https://download.01.org/0day-ci/archive/20251220/202512202153.mHQVnY6o-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202153.mHQVnY6o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202153.mHQVnY6o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/soft_domain.c:186:10: error: implicit declaration of function 'cpu_util_cfs' [-Werror,-Wimplicit-function-declaration]
     186 |                 sum += cpu_util_cfs(cpu_rq(cpu));
         |                        ^
   kernel/sched/soft_domain.c:186:10: note: did you mean 'cpu_util_irq'?
   kernel/sched/sched.h:3118:29: note: 'cpu_util_irq' declared here
    3118 | static inline unsigned long cpu_util_irq(struct rq *rq)
         |                             ^
   kernel/sched/soft_domain.c:269:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
     269 |         int cpu;
         |             ^
   1 warning and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/cpu_util_cfs +186 kernel/sched/soft_domain.c

   179	
   180	static unsigned long sum_util(struct cpumask *mask)
   181	{
   182		unsigned long sum = 0;
   183		int cpu;
   184	
   185		for_each_cpu(cpu, mask)
 > 186			sum += cpu_util_cfs(cpu_rq(cpu));
   187	
   188		return sum;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

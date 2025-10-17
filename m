Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9F92741A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 03:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760756803; cv=none; b=XZBnG3BFBkVirDIgzqGcvjhY915NGgE0zAUaLkMnCOpOwoufBnYnsxFP/ygxensQOhVBJlpb2IMlpcqNYbp+Lxer94i8KF5dijEpDQPy+MbRp956Zt1xksPsME33iFeBQCKIq7krSN6nGk6p5wS5mxDuFFdJZQckYdV+/KLcFVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760756803; c=relaxed/simple;
	bh=w5GDNu5ychOmh8Zh3RazTCx5Mzw5xlUMXPpK7Yb//KI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cTk2YTIhlJjYXVPcgUzkI9XCtl1aDsMIm2Bh1Fvc6PjLqw4F4ao4supaCfoOomLLuMn8y2xZPOt6cOypH91lNGgRDbFR3atETo8tZOeMbXajmleKXAoyowle0hUuNIpiblFNpfexA9BB6vKyN6agShi2ui+PhI9LMX7/bNTrM4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpAnTx7u; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpAnTx7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760756801; x=1792292801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w5GDNu5ychOmh8Zh3RazTCx5Mzw5xlUMXPpK7Yb//KI=;
  b=YpAnTx7ui9QI34HH7kqfQ6jv5ISInDUonXegfJjqIrcHtMZBbVkgXXyp
   XKL8BKW0VfZhFiBlbCQpNVxiInQsc88rl19KZZLk6NbtvchzwtkkLjoav
   3nT32tRw3J+yirkJqkUOLeobDSUtxNXOylVYCC9ukg7aiLM2eIiZ3NnDS
   KDRIoDVp9m/fChewp9jpyL55vDWmhIFV1FcZSK/CKr/oNSABC/pUoRwm3
   WGQLxW+BFhYAIEBFtKXuAvDUsh3+gzdQrQ+EZnECmxxI1MkBOZAyMze7Y
   EKxyApan0lcQXHAaThfE5d4Z4q8ov8QuRUhxSOu1wSSTmvu3qq1GwwA/F
   w==;
X-CSE-ConnectionGUID: G6FNkal/QnyTZ2D97M0vgA==
X-CSE-MsgGUID: rzUxBMlxSZqg52j6JHuR3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="73648671"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="73648671"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 20:06:41 -0700
X-CSE-ConnectionGUID: ioe0dwWoRPiAq5Uaw48kZQ==
X-CSE-MsgGUID: +/OcDUswSzGtFJkscSC1kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="183299308"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Oct 2025 13:56:43 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9rVB-0007lP-1V;
	Fri, 17 Oct 2025 20:56:41 +0000
Date: Sat, 18 Oct 2025 04:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Qiao <zhangqiao22@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3201/3201] kernel/sched/soft_domain.c:186:10:
 error: implicit declaration of function 'cpu_util_cfs'
Message-ID: <202510180419.loPaVsWm-lkp@intel.com>
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
head:   8d2412bb9958a209d2d0344ea1b88dd633699677
commit: dd6655291bf7230ef984e1d283a5ec05821f996f [3201/3201] sched: Attach task group to soft domain
config: x86_64-buildonly-randconfig-002-20250909 (https://download.01.org/0day-ci/archive/20251018/202510180419.loPaVsWm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510180419.loPaVsWm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510180419.loPaVsWm-lkp@intel.com/

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

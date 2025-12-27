Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DA37E0FF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 08:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766822894; cv=none; b=qitRiE5vudITQp0IV6EHYstvP6lVI4EiGqQCx6mS+AfWP/1usMSpw37SdGbwIECFLkMDkeIeX/GiPbsgoXus71NFkpQlwkmsPETECVVcYCKkU7/yCuaAqHvMFmNRIs3ogjbKX+lbjEr5dqpGk3g5R4xO2nxLbJzWUV/s2fD15+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766822894; c=relaxed/simple;
	bh=fXSYwH2Cq1BULMrQTmreK00pRJ4KvZQ6T6Q3/o9qiH0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MvQzqADJiX8Q5hnHtrDY8EBkkSKvc0jdixkpKklQmmTLmSymYLtwqp3ys/ngvQpAnRlyV5P9UDYtXOKh0X5+p8UQxwR27HckdDKXm3YFGvgxD0VN9YXEN2ml10x2XAHK6gdeUyloqBuCemLV6NDPRNZzLbNfRsKgH+1PzruzlL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qmni1130; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qmni1130"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766822893; x=1798358893;
  h=date:from:to:cc:subject:message-id;
  bh=fXSYwH2Cq1BULMrQTmreK00pRJ4KvZQ6T6Q3/o9qiH0=;
  b=Qmni1130Bm6oa0CYEt5uR09EOnLxtck05FoAXEIOAfoNBrKNnm11CUBs
   2sSdok6EUVDg7qU2v/rSnrbRZrI8QoYY8r8240v0/TwKj0LKOZhyNNFaf
   856m2QLVlQCaDNUXNzauz+IRQroGf0Q9V8UXi+Y0Lzr5ecxOYr/79kTGU
   2kVMQY49I77LthnJjripk6ZRFd+XHf00k0nUBODOIEwKPhnG/1vOAVc1F
   hQ+lSdFZO0lLY8yqi+Uo07SlR2nc1zzh14el90s5ZhOjH7RWy01gY0ADQ
   Fjfgxa2dVA6yrhxw508uQIRf9k7qIpwz6snrGEi8JsOuS1I5IUfCldpvo
   A==;
X-CSE-ConnectionGUID: obyu9vwQSeqGhal0sDNlzg==
X-CSE-MsgGUID: +8Qg1nhiQECBXd1HWfQD+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68611755"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68611755"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 00:08:12 -0800
X-CSE-ConnectionGUID: dI50A9QgQR+yT0Nj4V9hdg==
X-CSE-MsgGUID: 4yP9G+atTfSTmplhrwORKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200535293"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Dec 2025 00:08:10 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZPLM-000000005ec-2Ef8;
	Sat, 27 Dec 2025 08:08:08 +0000
Date: Sat, 27 Dec 2025 16:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/lock_trace 1/11] fs/f2fs/checkpoint.c:35:18:
 error: storage size of 'rf' isn't known
Message-ID: <202512271647.4YqNkpx5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   76d9d8ea13699c3b05f129b7bff8b8be75a3ceac
commit: ea81438a866d420bd5126cbd29052bf9dd57511c [1/11] f2fs: add lock elapsed time trace facility for f2fs rwsemphore
config: parisc-randconfig-001-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271647.4YqNkpx5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271647.4YqNkpx5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271647.4YqNkpx5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/f2fs/checkpoint.c: In function 'get_sum_exec_runtime':
>> fs/f2fs/checkpoint.c:35:18: error: storage size of 'rf' isn't known
     struct rq_flags rf;
                     ^~
>> fs/f2fs/checkpoint.c:38:7: error: implicit declaration of function 'task_rq_lock'; did you mean 'task_unlock'? [-Werror=implicit-function-declaration]
     rq = task_rq_lock(t, &rf);
          ^~~~~~~~~~~~
          task_unlock
>> fs/f2fs/checkpoint.c:40:2: error: implicit declaration of function 'task_rq_unlock'; did you mean 'tasklet_unlock'? [-Werror=implicit-function-declaration]
     task_rq_unlock(rq, t, &rf);
     ^~~~~~~~~~~~~~
     tasklet_unlock
>> fs/f2fs/checkpoint.c:35:18: warning: unused variable 'rf' [-Wunused-variable]
     struct rq_flags rf;
                     ^~
   cc1: some warnings being treated as errors


vim +35 fs/f2fs/checkpoint.c

    25	
    26	#ifdef CONFIG_64BIT
    27	static inline u64 get_sum_exec_runtime(struct task_struct *t)
    28	{
    29		return t->se.sum_exec_runtime;
    30	}
    31	#else /* !CONFIG_64BIT: */
    32	static u64 get_sum_exec_runtime(struct task_struct *t)
    33	{
    34		u64 ns;
  > 35		struct rq_flags rf;
    36		struct rq *rq;
    37	
  > 38		rq = task_rq_lock(t, &rf);
    39		ns = t->se.sum_exec_runtime;
  > 40		task_rq_unlock(rq, t, &rf);
    41	
    42		return ns;
    43	}
    44	#endif /* !CONFIG_64BIT */
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

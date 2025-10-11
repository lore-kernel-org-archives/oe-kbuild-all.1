Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286281B7F4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 00:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760143191; cv=none; b=ZghSabhnmDH/Uwj5biRRqErqKOQIn6tcgfBJcJ1CreoTQcpo7mLOJKKllOExjevOo7ROTEN75V7kPsGJ6Sw2m8rHEMVrK9ShLUhH4sE9bNn8Tya7uDovB2rlrc9dig2xXTOab10MWbDDUinfzK4l3uuXptW3WNfkgfvfxYfwYb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760143191; c=relaxed/simple;
	bh=P7n6u/oDgFRrpAoU5Iwfns1vBNguh4lSO9C69LvQUBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJY91+CvqibNmTYUmgInyxe910YLswEdaEW3CsrwZVcZWSijF9qU0J3/FzuP626LWLTLUyGcVG4iOkwsDNfrPbDX/NI/l/UHeO9HZkdZSPikhxpPvs7HP+D6AP4hqEMza95EyNkptG22KMz2pirgMgGfhBIhQUiorI0FHUau5vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKpumXcg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKpumXcg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760143189; x=1791679189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P7n6u/oDgFRrpAoU5Iwfns1vBNguh4lSO9C69LvQUBI=;
  b=PKpumXcgMBdV6KsKIl7mIWkZwj0YquW9Pttx8F30dUsZf86amP0z8zDV
   tgKTdgr9AVCVtJbgvOdX7/bXDW5ry3bs/+bpoVEXmm10htcT6Nj7T1drb
   8+7Ps73zQslp3WrwgrFCitz5yR1hq1Zxqe1uoh4jV1n4RiXRQmzmu2lfI
   ejnOJHfavq7AcSbBQwzfeHjypAi5w/gzy40Irw3FovQFnoyXuHz/JFldO
   J+7/cn/b71gYruk8U1zPD3Ewffmpqo5/aixRu6QHFno4zaAwfYWjgEDKa
   b+kyPLRLwjTomWA5A1TpzU7G4HHfJogPAtb3d64bIXwd6nxGlKEe7TjGh
   g==;
X-CSE-ConnectionGUID: 50LL4+BsRMuwfTHHqoCrEw==
X-CSE-MsgGUID: Ke0JUucDRRaBFkqj1xtyiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62067000"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="62067000"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 17:39:47 -0700
X-CSE-ConnectionGUID: aNrhtVMPQVyCsvJrGIOt7g==
X-CSE-MsgGUID: 5cXq4ajkTCSRqMtM2DiUbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="180791565"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Oct 2025 17:39:46 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7NeB-0003Kt-2s;
	Sat, 11 Oct 2025 00:39:43 +0000
Date: Sat, 11 Oct 2025 08:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_hybrid_automata 20/22]
 kernel/trace/rv/monitors/deadline/deadline.h:110:9: error: call to
 undeclared function 'copy_struct_from_user'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202510110805.3B7A0liO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_hybrid_automata
head:   2d8872c2feb1ae4836bc44a6661138d1eb450a57
commit: 2ec33f6cdd8c562cca30a7293704d962c2069ac3 [20/22] rv: Add deadline monitors
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251011/202510110805.3B7A0liO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110805.3B7A0liO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110805.3B7A0liO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/rv/monitors/deadline/deadline.c:9:
>> kernel/trace/rv/monitors/deadline/deadline.h:110:9: error: call to undeclared function 'copy_struct_from_user'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     110 |                 ret = copy_struct_from_user(&attr, size, uattr, size);
         |                       ^
   1 error generated.


vim +/copy_struct_from_user +110 kernel/trace/rv/monitors/deadline/deadline.h

    88	
    89	static inline int extract_params(struct pt_regs *regs, long id, struct task_struct **p)
    90	{
    91		size_t size = offsetof(struct sched_attr, sched_nice);
    92		struct sched_attr __user *uattr, attr;
    93		int new_policy = -1, ret;
    94		unsigned long args[6];
    95		pid_t pid;
    96	
    97		switch (id) {
    98		case __NR_sched_setscheduler:
    99			syscall_get_arguments(current, regs, args);
   100			pid = args[0];
   101			new_policy = args[1];
   102			break;
   103		case __NR_sched_setattr:
   104			syscall_get_arguments(current, regs, args);
   105			pid = args[0];
   106			uattr = (void *)args[1];
   107			/*
   108			 * Just copy up to sched_flags, we are not interested after that
   109			 */
 > 110			ret = copy_struct_from_user(&attr, size, uattr, size);
   111			if (ret)
   112				return ret;
   113			if (attr.sched_flags & SCHED_FLAG_KEEP_POLICY)
   114				return -EINVAL;
   115			new_policy = attr.sched_policy;
   116			break;
   117		default:
   118			return -EINVAL;
   119		}
   120		if (!pid)
   121			*p = current;
   122		else {
   123			/*
   124			 * Required for find_task_by_vpid, make sure the caller doesn't
   125			 * need to get_task_struct().
   126			 */
   127			guard(rcu)();
   128			*p = find_task_by_vpid(pid);
   129			if (unlikely(!p))
   130				return -EINVAL;
   131		}
   132	
   133		return new_policy;
   134	}
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

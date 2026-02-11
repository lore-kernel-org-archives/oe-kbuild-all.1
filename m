Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A8E190664
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 08:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770797003; cv=none; b=aCsbQY2lJeeKY6PKJnJrwI82J1FEiKWZbFNmGxVGJ+T1PlQUFL5b1XEokVVDgNWqRQVtXq6VYRSYq9Td6t116f7+gi6mzn87E4o1K5Pi4LYULseqDNDxkmsscP9gAtMrrGcws5vtHzeoJgGml3Pi8Gr86ViVnXJXQl3IInme/5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770797003; c=relaxed/simple;
	bh=l8cY/bmK1dMN8k+fjDCB4bkSP2YbtRgUHzhPeIw17Hs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=urwlsxks0mArM49YEoA673H0+NQSSOQHyE7KEw/VG9aCPI8p042Uuz/6IVRAG9MfvIcYFDXlfcPQJlwvpE7Pfg1aKtxQKR2soKsPmbLWQdhDe0x5COlv8KNQaB94F2LJU0oeSAgVfs9vx63zj7mi2JZRIVK4/7ZPnQ+stPDXtVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3SbFhDU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3SbFhDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770797002; x=1802333002;
  h=date:from:to:cc:subject:message-id;
  bh=l8cY/bmK1dMN8k+fjDCB4bkSP2YbtRgUHzhPeIw17Hs=;
  b=Z3SbFhDU93PxhphsBvGOW7z17YG4WbRwXp2KHjdYHRobvh716ESoM+0X
   NW8buClqP5ibJ+P8bTI322XYTL4HGyLAwDZO/a19bvbOOm5fobyjXhxxB
   FLh6U6Vmw1wyYvs3Nlysu1NLyS6qx4rPFtcO24JJ51Z4OkowrT6rzGv68
   +zTfOBnSLd0ymcQyrokgqEp3WJyvHpFZDjt+z+XaEVGQLPsSkMlCY6ml2
   2t5R3mppKGRJj20PAnCcgY+gGnbKI+p1uVh0G8JNs9dzkTUegYGwGKItR
   mkWuOPVu98YJMra6AvBgWD0Vtvp4icFZUq2NqmFKJRovKREHPKsxHADXs
   g==;
X-CSE-ConnectionGUID: pKKtZ8+wS9qFqPyfBqEJ/Q==
X-CSE-MsgGUID: mtkGb686Rr6ZOoCcKiI0Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="59504918"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="59504918"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 00:03:21 -0800
X-CSE-ConnectionGUID: jJtxuCQYRwO4uwmofxvyeg==
X-CSE-MsgGUID: AS9JCxgxTVCRINodnODixw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216698680"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Feb 2026 00:03:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq5Bt-00000000poC-309t;
	Wed, 11 Feb 2026 08:03:17 +0000
Date: Wed, 11 Feb 2026 16:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 10/14] fs/proc/root.c:340:55: error:
 invalid use of undefined type 'struct container'
Message-ID: <202602111521.wWno9Yvw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   ac4ec62cd4decf787406c1407f18ade110d80c5a
commit: eae87346ef7094984596a12c9096148d3989c983 [10/14] containers: Make fsopen() able to create a superblock in a container
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260211/202602111521.wWno9Yvw-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111521.wWno9Yvw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111521.wWno9Yvw-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/proc/root.c: In function 'proc_init_fs_context':
>> fs/proc/root.c:340:55: error: invalid use of undefined type 'struct container'
     340 |                 ctx->pid_ns = get_pid_ns(fc->container->pid_ns);
         |                                                       ^~


vim +340 fs/proc/root.c

   330	
   331	static int proc_init_fs_context(struct fs_context *fc)
   332	{
   333		struct proc_fs_context *ctx;
   334	
   335		ctx = kzalloc(sizeof(struct proc_fs_context), GFP_KERNEL);
   336		if (!ctx)
   337			return -ENOMEM;
   338	
   339		if (fc->container)
 > 340			ctx->pid_ns = get_pid_ns(fc->container->pid_ns);
   341		else
   342			ctx->pid_ns = get_pid_ns(task_active_pid_ns(current));
   343	
   344		put_user_ns(fc->user_ns);
   345		fc->user_ns = get_user_ns(ctx->pid_ns->user_ns);
   346		fc->fs_private = ctx;
   347		fc->ops = &proc_fs_context_ops;
   348		return 0;
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

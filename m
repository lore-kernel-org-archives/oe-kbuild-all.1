Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC024F55CC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 21:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370819; cv=none; b=UuLkx54ZerBHfovAnyE67nbMr2xFXpXdIz42ALRMS7hfrIh4n7wXRjww6egoEHXihFsKZS05fgvmbPKwFnI5TlK2CM8mX6cjn5BySNcgWwUWRJAdIZLYXkEXbYTvoX/l9zuZFjBICY2Ohr+aP7nQovZQaJQYVuiaygnw1uRmDAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370819; c=relaxed/simple;
	bh=qLISDYf31U1SYvckrLhVV2fKnJANBdj0ZIHXfulJE38=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MNJ1M7wga3sdImnb4Cdb4ZTEAWoing6Kr4I5CPAU46oVUN4khD/dHxWCGNsUM8bpWhCwySW9nDaAOIu1F2qE62gCoH3w8MxdWqCQ0fkJZsVMXxTFhoQ91E+370srNJiAZ21BOcoD+XTW1/F1Y5hM9STprwXZma9uSbTVveX3ErY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvb/YKmu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvb/YKmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790370817; x=1821906817;
  h=date:from:to:cc:subject:message-id;
  bh=qLISDYf31U1SYvckrLhVV2fKnJANBdj0ZIHXfulJE38=;
  b=lvb/YKmunuxxvhPnavyqTgZYPR0vUnG5bI4Nqh400Nzz/6VWfNe7CWpL
   dqVW4iQNrJKRkQeD8fCILaC/+YkHV6yyFM49BFC/1tTOEucqPk/zB05Zk
   El+xGGHO6d36/s7+e8fHCVroAQ22hywUo/n4nXvSrIMGe1IiXf4v/aDQ0
   jBvTci0xbhquU2rt6QWbMwiUE6OLpJm1u0ToKwmpVCREI3IhjNytmVXcx
   etS4i02Olgvlf9lj7oFTan266mFV5JsMFFjR2mTQqhcPh49g4vTrcSoRz
   SbSu46QSAP4gN6NSxMdHYL5EUrh7UHjoAWylqINM/cidQ3UTnaWCXa5i3
   w==;
X-CSE-ConnectionGUID: Io10JToKSlSF7Id9HIqcFg==
X-CSE-MsgGUID: hyC/2jA9T0aWt0PKmg7F6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="116693336"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="116693336"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 14:13:37 -0700
X-CSE-ConnectionGUID: MQ3lpcJNSVCAsZr+IsqPPw==
X-CSE-MsgGUID: p/ehr/xRSmiPlfo56Cxu5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="279164230"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Sep 2026 14:13:35 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xADEa-00000000LDB-3kov;
	Fri, 25 Sep 2026 21:13:32 +0000
Date: Sat, 26 Sep 2026 05:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/core 13/14]
 kernel/sched/ext/ext.c:1087:6: error: conflicting types for
 'scx_proxy_reenqueue_retry'; have 'void(struct rq *)'
Message-ID: <202609260541.AeDtvnCV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Andrea,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   25fcc43b82e5d7681fca67b580bc2a52e81c690e
commit: 8c9f7ad6c2d56de3da9664881eb3e72a5afae2bf [13/14] sched: Add sched_ext hooks for proxy execution
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260926/202609260541.AeDtvnCV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260541.AeDtvnCV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260541.AeDtvnCV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:71:
>> kernel/sched/ext/ext.c:1087:6: error: conflicting types for 'scx_proxy_reenqueue_retry'; have 'void(struct rq *)'
    1087 | void scx_proxy_reenqueue_retry(struct rq *rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/sched.h:4295,
                    from kernel/sched/build_policy.c:41:
   kernel/sched/ext/ext.h:25:6: note: previous declaration of 'scx_proxy_reenqueue_retry' with type 'void(struct rq *, struct task_struct *)'
      25 | void scx_proxy_reenqueue_retry(struct rq *rq, struct task_struct *next);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +1087 kernel/sched/ext/ext.c

  1086	
> 1087	void scx_proxy_reenqueue_retry(struct rq *rq)
  1088	{
  1089	}
  1090	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

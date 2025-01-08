Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199E94A11
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 00:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736295476; cv=none; b=FJcVJWQO5dfMMPtYkER0fTOUEcwgCc2CaBi8WJ2svWUwg3PbLzOaLzobilL/GCnTuRLzvMUxAdJQ3D5roW4BeWRHy3axCf/i4oOv3MLlA8SG8jr0yUp9u6VSFCIQhaWY6knZX316ytkFH1RR0CG8cAiXc/E/aPT2gpzMnjuBtpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736295476; c=relaxed/simple;
	bh=p4ACsn51arnKAec9FQUaGRUHYCkLYPD39BUiktRiOv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4+n+ClsHK51Dmj6h3cLqgoWtY5kpXxnRlnxp+4htPlqCE1dsgU5NdLc4aU/J/NdzJ6wUgBCxAUwt9/5E0Lq9XhTUDMnuRMawoS2Y24k+i5VcIkL8PVAMgwja61yLTaHgz8aZvuRTkKri8YTWXfmbAid9/nF3YtiAXZ2FHq+z2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3G2K1Vd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3G2K1Vd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736295475; x=1767831475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p4ACsn51arnKAec9FQUaGRUHYCkLYPD39BUiktRiOv0=;
  b=i3G2K1VdRzSwBsyMCZNOmc4wg98ASPdKATNHm3Sn+H7LXNcaDga77t0Z
   TJqy0a7fOuuAMIoedLWh/2sVz4AS7TdatkPIcgU5JKy3tGowi0CNJyX5a
   Wx0iS+Axz0lg8mES7ByLGMl+50+aSZDqflwzhFZoWOHn9SYwuZGGGxUki
   BDDHQpNquWxcxxZbD0I3c8B/uLJ1pQOn1DvjapSLX/AZUhWg+x3kgXqbO
   wmsfmNxYvN/zJDLo54cTAwKkeHGup1d4ActjQ1OFLaykmya0piqMGJD7E
   gIMKY6jeXvUiQxMRIQtekVPJBS26yGGMhAu0fxBl0c5+7NQ4bR/5p3//x
   w==;
X-CSE-ConnectionGUID: lkB93ELSSda4D2qGL6UgdA==
X-CSE-MsgGUID: aHMfHbVHTQKGu1vaL2FT4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="58970692"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="58970692"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 16:17:54 -0800
X-CSE-ConnectionGUID: T80PHyecSE66Wf+x8bTbVQ==
X-CSE-MsgGUID: 3RxXJfzVQVy8ImNVX7VUzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="103415901"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Jan 2025 16:17:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVJld-000FON-2Q;
	Wed, 08 Jan 2025 00:17:49 +0000
Date: Wed, 8 Jan 2025 08:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Righi <arighi@nvidia.com>, Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Refresh idle state when kicking CPUs
Message-ID: <202501080743.HLPZzVsv-lkp@intel.com>
References: <20250101182449.21517-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250101182449.21517-1-arighi@nvidia.com>

Hi Andrea,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master v6.13-rc6 next-20250107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-Righi/sched_ext-Refresh-idle-state-when-kicking-CPUs/20250102-022650
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250101182449.21517-1-arighi%40nvidia.com
patch subject: [PATCH] sched_ext: Refresh idle state when kicking CPUs
config: x86_64-buildonly-randconfig-005-20250108 (https://download.01.org/0day-ci/archive/20250108/202501080743.HLPZzVsv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080743.HLPZzVsv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080743.HLPZzVsv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:63:
   kernel/sched/ext.c: In function 'refresh_idle_state_on_kick':
>> kernel/sched/ext.c:6031:17: error: implicit declaration of function '__scx_update_idle'; did you mean 'scx_update_idle'? [-Werror=implicit-function-declaration]
    6031 |                 __scx_update_idle(rq, true);
         |                 ^~~~~~~~~~~~~~~~~
         |                 scx_update_idle
   cc1: some warnings being treated as errors


vim +6031 kernel/sched/ext.c

  6020	
  6021	static void refresh_idle_state_on_kick(struct rq *rq)
  6022	{
  6023		lockdep_assert_rq_held(rq);
  6024	
  6025		/*
  6026		 * If the CPU is idle and the local DSQ has no queued tasks, update
  6027		 * its idle state to prevent the CPU from staying busy even if it
  6028		 * returns back to idle without executing any task.
  6029		 */
  6030		if (is_idle_task(rq->curr) && !rq->scx.local_dsq.nr)
> 6031			__scx_update_idle(rq, true);
  6032	}
  6033	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

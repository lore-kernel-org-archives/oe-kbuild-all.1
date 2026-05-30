Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A12D233944
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 00:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101005; cv=none; b=lqY5mS13As3yaVXJTor2yYyYbGbEtkzU1hQPbrlc1yrfE7/2OGNHjS7S7wNjTyrmK3IFQuoeta0C4zCvFmeOI10cg69jxF0jIxP03N86wVDmNfvjJaoCm5jeK9vNWyEuDjRefiC0PeCSxqowVLl+9x05uklH+f7QwNSz9keMSm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101005; c=relaxed/simple;
	bh=bBqolNpq53DgsmUQ2BFuzaYnhW/rcPsQ7MDFtL03gnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W72Ldd1lrAAe2EKRsfqcCUo5k5UImZTKu0I+lHZ/It55eif0vqiQR1Fn+nLuRQhRCklJJEMgHv4Mar6wx0o6a2btbmsJSDCPAK/oFj/5Y4sGW6ql/auLcCwRE+caFIiii699h27egNwRu+x8sZ1OiRbXHBWIOVF7VKZNq5RHoYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPI95q+7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPI95q+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780101004; x=1811637004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bBqolNpq53DgsmUQ2BFuzaYnhW/rcPsQ7MDFtL03gnE=;
  b=MPI95q+7FpIanWvEb5D1bMZxUqAjzsqxcew2IYUnSMvecVUtoRHio2md
   n6vLDNExdeRV3ilah3d9Ij3vNNUQvkVPHHOjyTp2+wsXbsdv4nCH5OujA
   5Bw5X7BXHA44Z7Wkf7RkH3vzHtBWa+BDGRRV84oHgbpMNcCJsXPHPYIRw
   D0k2F4BqBujFbZT3z3OI/QliCoCIc7xYeXz1ZYM8jtHsdp9TjDs04EGpP
   YChlttmqRgor2Piu1kuI/FyAMMLPUI2nL728HehazvHtKXRZuyBqOlkVk
   7NBPcesxgC0XBKr2xWpwECbIlRJmVUiSoxJgIYCMFwrUyThkY3SBTqDPU
   w==;
X-CSE-ConnectionGUID: ++MwII9rTkmxSFHzuVWzqQ==
X-CSE-MsgGUID: a6ZHv8ZzQtyhQS9AdFbKzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="92072722"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="92072722"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 17:30:03 -0700
X-CSE-ConnectionGUID: h+J0CmLOTIq5pQA996kJEQ==
X-CSE-MsgGUID: ctXeWKB0SiiuGA9gwsYHqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="248090916"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 May 2026 17:30:00 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT7aP-000000007pW-1IUB;
	Sat, 30 May 2026 00:29:57 +0000
Date: Sat, 30 May 2026 08:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: Fernand Sieber <sieberf@amazon.com>, Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com,
	Fahad Mubeen <fmubeen@amazon.de>,
	Hendrik Borghorst <hborghor@amazon.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Fernand Sieber <sieberf@amazon.com>
Subject: Re: [PATCH] sched/ext: add scx_bpf_cgroup_report_throttled kfunc
Message-ID: <202605300827.2IdN367O-lkp@intel.com>
References: <20260525192432.20487-1-sieberf@amazon.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525192432.20487-1-sieberf@amazon.com>

Hi Fernand,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master v7.1-rc5 next-20260528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fernand-Sieber/sched-ext-add-scx_bpf_cgroup_report_throttled-kfunc/20260526-032545
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20260525192432.20487-1-sieberf%40amazon.com
patch subject: [PATCH] sched/ext: add scx_bpf_cgroup_report_throttled kfunc
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260530/202605300827.2IdN367O-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300827.2IdN367O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300827.2IdN367O-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `__BTF_ID__set8__scx_kfunc_ids_any':
>> build_policy.c:(.BTF_ids+0x1cc): undefined reference to `KF_TRUSTED_ARGS'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

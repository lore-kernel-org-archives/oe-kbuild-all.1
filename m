Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF01352034
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779965068; cv=none; b=F8KVG3zVmsRrz2cjAbJMCZIqf/mWOirY+s+nfjCivur1oaHUGiezLqNWzWGVVVzGgsVEE4+SLmuTaCdobpsSf2CT2ncVn/HwA8aMCOXX//L1Y6tewigVzzM4Yg3b1jmqLekPwQ5DlL7pZSSQfWAHLRGiMarABcgDPjL61wC7kG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779965068; c=relaxed/simple;
	bh=SSAZQndNCq1dNfcJq22rwfyamCnQ5gY6tk/E8CShnj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iy/Igii6Aj2fXTzyoPgGmxWbDnuTtNiEkjSERTKkn3TRcI8VY20NGwBUmEnD5iJ8ofMyP3kY13OAB0eng2rpjg5z31XhtdO5vEZ03IS7ADc4SdBITTg/ac5IRKWykEixlrXplOjMbI/QDcVYCHd/ZIrzKPhyQKTpRHaW9EFbdeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KswQOrbm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KswQOrbm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779965060; x=1811501060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SSAZQndNCq1dNfcJq22rwfyamCnQ5gY6tk/E8CShnj8=;
  b=KswQOrbmpLFx/7MF2Ry90NmNNRu34SMU6fgwj4lmZoaeIfouptqJ2BEd
   VLho9itVhWn4Na/Lk7F/xZtsLJdawJgIPX4KUl/85w3EIbZTfpbNBuHj5
   RjmOj8bCPKoOdNWdW95Z7DYI80ANWyCaVP1Y23IRnhGTbQA46TM8AXUHb
   nd+lzqwp0zqe1bu4R4K8QP6ZfXQACC6OOE+mxjM6mIgsIlyftNcYKZTZ4
   ajtWxqMKCeBBje8AIQGsIZFYntAs6k4g843UqoQf8E2mCNtz1FAnRktzy
   SatlxUrNMym+VPneAfD29V9IUlgK1Fp9rKOfDuJuzDDvK5u3WTek/2NIn
   Q==;
X-CSE-ConnectionGUID: pzb/ie7uT9ygJ+lN076c1w==
X-CSE-MsgGUID: Tvk1i/ykSgWdwBw3gsO8/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80705808"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80705808"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 03:44:13 -0700
X-CSE-ConnectionGUID: x/+PTx41TwqUqqi9I1xWsQ==
X-CSE-MsgGUID: KQ9Tsk7+Q4mJYjzd0tE9Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="241483857"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 28 May 2026 03:44:10 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSYDf-000000000KD-36tx;
	Thu, 28 May 2026 10:44:07 +0000
Date: Thu, 28 May 2026 12:43:57 +0200
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
Message-ID: <202605281242.Y7eMHdOU-lkp@intel.com>
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
[also build test ERROR on next-20260527]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fernand-Sieber/sched-ext-add-scx_bpf_cgroup_report_throttled-kfunc/20260526-032545
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20260525192432.20487-1-sieberf%40amazon.com
patch subject: [PATCH] sched/ext: add scx_bpf_cgroup_report_throttled kfunc
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260528/202605281242.Y7eMHdOU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281242.Y7eMHdOU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605281242.Y7eMHdOU-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `__BTF_ID__set8__scx_kfunc_ids_any':
>> build_policy.c:(.BTF_ids+0x1cc): undefined reference to `KF_TRUSTED_ARGS'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

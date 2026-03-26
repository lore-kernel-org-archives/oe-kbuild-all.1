Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A6F401A36
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 15:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540065; cv=none; b=QugwvFlAPcdiJdwy481JPSdiigBujWnBK6hYXoJpGD3BxN8AzYKvkNR568/J8I/who/YQi6FDmGPJHXtcX1xsFcbws1CH3fuNqpZkVUrKt84PjN1Wt/qQ6rT1+ZuX+0TkqDxOVWmVysCJAN2wScNaKUrzNZAvfM8VqVukHGNkyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540065; c=relaxed/simple;
	bh=Dbu8dk+JFi2aMAdLIFf8VEPwv+Opdc9eC7rNCMq8LTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAMssjBpkiBqIwqUqT5vK1D5K0ZLXadqFMohid5IUJdb3o5qxVc7RftI0Hqtx05Ur2IKYaywLAv0r59Ka+TdoZiUXetHqSDT/C5Du5tsCT2vmWu1SjsdZuyh3yx9GwV4SkynCYjT1ZTtVtKWalQZIEpVohYh9NuDrHjjffAUiLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+gXHVg/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+gXHVg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774540064; x=1806076064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dbu8dk+JFi2aMAdLIFf8VEPwv+Opdc9eC7rNCMq8LTk=;
  b=e+gXHVg/CJUIzCYYaaUZxXl/CwGSEifheDD7ZHDJn7Ct7me76MLpieCl
   TL8lt6kBSwHmb47aM7Wj+Yyh9I72RW/3m6nvtYAQu5yTSPY2NH7skf1Ip
   ur4tlObIFDVO20Y+oIsypaVCdAWeNAIVpc7nqgOlq/XZBlflkVnbrlJCd
   nVCb5i+Z1JPBcmlWDHKSv/ZF10AycPYXPzyIR62o+v5ibdE1R3qxJD4/Z
   bA/rsA0XJehfVg951uaP7O3VYNWChg9l1VefKMkXpOklfF7OGjWG+Nphv
   61kRXOmz9+3fPO6AQsQoKmdchoh0m5unnpsf/+ONcrhrUXQ/psMZNzAMw
   w==;
X-CSE-ConnectionGUID: su+jzvuUQ4uZsVMfyqsmIA==
X-CSE-MsgGUID: vnNBcJ7aS3u+QJNR9vyXGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75670673"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75670673"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 08:47:41 -0700
X-CSE-ConnectionGUID: D6uPCxcTRKmBe6f25v5q0A==
X-CSE-MsgGUID: QAYXVE3YTXeMGiNbMZ6vRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="224965420"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Mar 2026 08:47:37 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5mvl-000000008yR-3BXK;
	Thu, 26 Mar 2026 15:47:33 +0000
Date: Thu, 26 Mar 2026 23:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Loehle <christian.loehle@arm.com>, arighi@nvidia.com
Cc: oe-kbuild-all@lists.linux.dev, peterz@infradead.org,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	valentin.schneider@arm.com, mingo@redhat.com, rostedt@goodmis.org,
	segall@google.com, mgorman@suse.de, catalin.marinas@arm.com,
	will@kernel.org, sudeep.holla@arm.com, rafael@kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	juri.lelli@redhat.com, kobak@nvidia.com, fabecassis@nvidia.com,
	Christian Loehle <christian.loehle@arm.com>
Subject: Re: [PATCH 3/3] arm64/sched: Enable CPPC-based asympacking
Message-ID: <202603262307.63Wed8OI-lkp@intel.com>
References: <20260325181314.3875909-4-christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325181314.3875909-4-christian.loehle@arm.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on arm64/for-next/core driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus peterz-queue/sched/core linus/master v7.0-rc5 next-20260325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Loehle/sched-topology-Introduce-arch-hooks-for-asympacking/20260326-145644
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20260325181314.3875909-4-christian.loehle%40arm.com
patch subject: [PATCH 3/3] arm64/sched: Enable CPPC-based asympacking
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20260326/202603262307.63Wed8OI-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603262307.63Wed8OI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603262307.63Wed8OI-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/sched/build_utility.o: in function `sd_init.constprop.0':
>> (.text+0x17b8): undefined reference to `arch_sched_asym_flags'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

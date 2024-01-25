Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5E85FBBE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706191014; cv=none; b=NpSVkflO+RcOGby0l4KC+bmgNZsIAzag4076q2RjuHzGjn5l7jHtPntD9Rpaf93Sa5MciZqHEhLyr3K5yBOFMPlm0UC4qB98LD2HS6VmrWx6Of8nVWvnMbvic54WeslGrNTGO+5kR0yUWnVtAz09+2UY6E4OZ8UNzHzo3FIsO7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706191014; c=relaxed/simple;
	bh=kpetP8qrvu92A8ErhwqgfxYiKxOlHpDyFZ/98vnxOOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qBcPuUmOtsV72hwJ0orGiZeJUBhEJIiBL8rp8k0c7AqgAixDR8cKaKuJWJX2V5SLB0hQKUjmPGBaQ4d3RZtRFnSKWeampRx5JcSZ+Yepf+W7eYGm5LdRTc0Sp2PIg61UjgJK4LEY96Z3FpRMHRG45hHV/n6qUdU7ftem/Xl6TlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fq0DT+vv; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fq0DT+vv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706191012; x=1737727012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kpetP8qrvu92A8ErhwqgfxYiKxOlHpDyFZ/98vnxOOo=;
  b=fq0DT+vvryQVU+RdA4MLBobOLVDc6Pvomq/aBcC2QJ2RhaP8B4ZQxLDo
   2iYyaDIIi0ACRR6NPx1kShlMRiCVZBv8sgYG8jyEr2jt+Fa1PQ4WHeyjw
   2qLZYyF5ZpS8gNqxwE+TwfDfzDaAcwQNomYqEToulwQNSc7mk93SgvPjp
   9ioXpZN2IsRGJRWtOuYabTtfNB2H5dpcIPW9R6eBGK5mQXezFGad5EojR
   QB8zLIx4w8NZQW6ety/n+lM7qcblcO/y4Ea5jb9k39XEGp0cgyrYnScjd
   NNkbfqFQrgQcnamDN0QesHCnksEYd4OK2Ka16RFGeJodpkGMsObwaGDOn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401815209"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="401815209"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 05:56:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2252813"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jan 2024 05:56:51 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT0Do-00002s-2b;
	Thu, 25 Jan 2024 13:56:48 +0000
Date: Thu, 25 Jan 2024 21:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Shi <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:schedtest2 11/12] kernel/sched/fair.c:9744:12: warning:
 statement with no effect
Message-ID: <202401252112.pKE1STUN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git schedtest2
head:   326c08b860db40ad088d64cbca38afdccc196410
commit: 0436efe9a058218c483c6d296083253e871a391e [11/12] sched/fair: pack SD_ASYM_PACKING into sched_use_asym_prio
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240125/202401252112.pKE1STUN-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401252112.pKE1STUN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401252112.pKE1STUN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'sched_use_asym_prio':
   kernel/sched/fair.c:9744:12: error: expected '(' before '!' token
    9744 |         if !(sd->flags & SD_ASYM_PACKING)
         |            ^
         |            (
>> kernel/sched/fair.c:9744:12: warning: statement with no effect [-Wunused-value]
    9744 |         if !(sd->flags & SD_ASYM_PACKING)
         |            ^~~~~~~~~~~~~
   kernel/sched/fair.c:9744:42: error: expected ';' before 'return'
    9744 |         if !(sd->flags & SD_ASYM_PACKING)
         |                                          ^
         |                                          ;
    9745 |                 return false;
         |                 ~~~~~~                    


vim +9744 kernel/sched/fair.c

  9730	
  9731	/**
  9732	 * sched_use_asym_prio - Check whether asym_packing priority must be used
  9733	 * @sd:		The scheduling domain of the load balancing
  9734	 * @cpu:	A CPU
  9735	 *
  9736	 * Always use CPU priority when balancing load between SMT siblings. When
  9737	 * balancing load between cores, it is not sufficient that @cpu is idle. Only
  9738	 * use CPU priority if the whole core is idle.
  9739	 *
  9740	 * Returns: True if the priority of @cpu must be followed. False otherwise.
  9741	 */
  9742	static bool sched_use_asym_prio(struct sched_domain *sd, int cpu)
  9743	{
> 9744		if !(sd->flags & SD_ASYM_PACKING)
  9745			return false;
  9746	
  9747		return (!sched_smt_active()) ||
  9748			(sd->flags & SD_SHARE_CPUCAPACITY) || is_core_idle(cpu);
  9749	}
  9750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

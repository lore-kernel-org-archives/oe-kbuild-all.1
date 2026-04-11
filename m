Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF02833E34E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775903666; cv=none; b=Ez9SesRUPSzI67Ulhx985RZEcVbbFegzSSB1XcUPJUL3wvasbOIlaYXrqimSWqry9yAE+43IhcpYfi+oWKkMR4O5b0JtYdZBwcwjSLrT9jlsbq2O1c1IhZNBV1MZyicKuUx6dvDartiJIot6QnsQcVTYeBMjkhS7ZcsUZmjiI6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775903666; c=relaxed/simple;
	bh=m5XmxqXJ66qVQmeGINtfVWwDdfovdoiv8v618XHKpII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEtZDbPGgx5bwLSO1HeqVIjnRyufw2Xey5KgY+QsmNJWcKwem+qXwF/Nsl3c0ojfNyvEzfslVb1F/YZbd7obiR8Sz3sy4046B7QOHHf6sE8uAvP8Nl8YfNeCFIkMr9nTEdE4OZGpXYyNcLt1UVJkXqNxyKY0OSQeOx7hPpIeJLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHcLUsh0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHcLUsh0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775903666; x=1807439666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m5XmxqXJ66qVQmeGINtfVWwDdfovdoiv8v618XHKpII=;
  b=gHcLUsh0S5MJLZPWL5IvjS0l+ndPr9CY5ESNoswtI2XC7nfvtD/1ZIMF
   eFbsDtNMy466Vlp46ayOcA/vArfsxCrAIfbSpBP8zR9qJoGEDyq2XI8QS
   C3mk6Cnq90GTOeYKueZTEjGH9mu1BurVX83ao/t2nbmu40yUlANjyzLB7
   sPHVGXRYEvH1ILMNANZj0pCsqpLqSg4S0+EqFxtYBIi0XHN+MZyKPmDIK
   bUWpPIky0AzhVPpa6ueaBMf1s1mqTp7+gMQPrCj3fu15xh0mot7R0RrTf
   t7MptDgIN40uH/ef1PCuesYbYOs+D1G+pbMmA4cvJipILrasUfUNodWzI
   Q==;
X-CSE-ConnectionGUID: xnivTVRlQE6Ufi2kTK0iuQ==
X-CSE-MsgGUID: TXscgvbFR/KYko5whT6Oqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76869298"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="76869298"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 03:34:24 -0700
X-CSE-ConnectionGUID: LtQqSnvjQ3+RQSqj3Z41mA==
X-CSE-MsgGUID: kQVFAggJQX2G8dJF+hS+Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="229589670"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Apr 2026 03:34:21 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBVfO-0000000014b-1MJu;
	Sat, 11 Apr 2026 10:34:18 +0000
Date: Sat, 11 Apr 2026 18:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Cao Ruichuang <create0818@163.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
	Cao Ruichuang <create0818@163.com>
Subject: Re: [PATCH] mm/vmstat: reject invalid stat_interval values
Message-ID: <202604111811.THSgZ1ry-lkp@intel.com>
References: <20260410112554.23165-1-create0818@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410112554.23165-1-create0818@163.com>

Hi Cao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Cao-Ruichuang/mm-vmstat-reject-invalid-stat_interval-values/20260411-085547
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260410112554.23165-1-create0818%40163.com
patch subject: [PATCH] mm/vmstat: reject invalid stat_interval values
config: s390-randconfig-001-20260411 (https://download.01.org/0day-ci/archive/20260411/202604111811.THSgZ1ry-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111811.THSgZ1ry-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111811.THSgZ1ry-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmstat.c:1968:18: warning: 'sysctl_stat_interval_max' defined but not used [-Wunused-const-variable=]
    static const int sysctl_stat_interval_max = INT_MAX / HZ;
                     ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [y]:
   - REGULATOR_RT5133 [=y] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y] && OF [=y]


vim +/sysctl_stat_interval_max +1968 mm/vmstat.c

  1964	
  1965	#ifdef CONFIG_SMP
  1966	static DEFINE_PER_CPU(struct delayed_work, vmstat_work);
  1967	static int sysctl_stat_interval __read_mostly = HZ;
> 1968	static const int sysctl_stat_interval_max = INT_MAX / HZ;
  1969	static int vmstat_late_init_done;
  1970	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

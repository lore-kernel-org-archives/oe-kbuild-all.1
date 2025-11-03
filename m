Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD353148D8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762189243; cv=none; b=CX7iW6Fzis1ciExiRdhWxEWDQ5Yl/SqTpQykT0TOjk/jk9cmPD00qSA9ukXOrIe1yvpb4YQp6+JpH0wCvD13JlKENTNrCrevc8z+TrR73WkOCW6Gr8RpdQyWQHY2i13reBWlkuNtDs/XPLPmo0047e684MNlfVf+c6MhXosOE9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762189243; c=relaxed/simple;
	bh=QrOfsXXs9/YwwOJBrK7u9D+FRcI1OHlVtxffhXpyz0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p6gKIiO4A691ZiEjvY+yu/PeM8PbaN8qlos+lHVo84KorFH3JCXrZiMyiOpshJmL90Pp77s6ZLEEVD8sgMqD1dK//YnArK/TpgJW6FgzImNmeH2jyWAmBEtPbDQbLDPYwQvACGAGa28uqBYAFeKO+DKxK2aXwCiqrJoPf5x6DqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IzUgS01d; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IzUgS01d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762189241; x=1793725241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QrOfsXXs9/YwwOJBrK7u9D+FRcI1OHlVtxffhXpyz0c=;
  b=IzUgS01dVC0TV0Q7YIcI6ZGQgCXFsco/pUgO6L7UrnLqG+eawkpiIW5B
   YI2YsRQKpyPjQFuDkSVbfaWAUwN31xBkg6iNYrEszRKltLz/7mt/pN50I
   AlvPqCRcs+f3ezOMRSp+lT1fLwe7Sy4xQ1gKqdXgPYrL4qFbzHg1Hydpb
   jFp0kkhc2kSQtYkokfY34H+QlWO6eymvrWUNNqVLTaxMeuJgxK9RzngW0
   huAzU7bjrdrxBrsDdRImoDUhwYFfjH/ZWAdclLBbIh8bbtH0DbdARDUoP
   5ivGoLNoNkqGNdCziimcndbFPLhZNhvwjXTw/k1wNxeKKXWePVYML4VWf
   Q==;
X-CSE-ConnectionGUID: YiS3Ce+JSB+jhz8NwxAp5g==
X-CSE-MsgGUID: TiG5jA6gTpu5BUNEPRAIyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="68130421"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="68130421"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 09:00:41 -0800
X-CSE-ConnectionGUID: wD7YxxKdReOxFXvO2mNu/w==
X-CSE-MsgGUID: 0PIyi6P5Q7y8L955idwaew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="186206536"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 03 Nov 2025 09:00:38 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFxuq-000QNm-1M;
	Mon, 03 Nov 2025 17:00:30 +0000
Date: Tue, 4 Nov 2025 00:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lei Gong <gonglei25@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] include/linux/iommu.h:2001:40:
 warning: 'struct iommu_plb_gather' declared inside parameter list will not
 be visible outside of this definition or declaration
Message-ID: <202511040032.5Xz72vRE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a29fc03bd0ddaf7388cf31604ef5bd9807585109
commit: d46a4bd5bdfd7f1d6e2fa159398df4c54345070c [3098/3098] iommu/ummu-core: introduce iommu sva permission operation
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251104/202511040032.5Xz72vRE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040032.5Xz72vRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040032.5Xz72vRE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:101:
>> include/linux/iommu.h:2001:40: warning: 'struct iommu_plb_gather' declared inside parameter list will not be visible outside of this definition or declaration
    2001 |                                 struct iommu_plb_gather *plb_gather) {}
         |                                        ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA
   Depends on [n]: CGROUPS [=n]
   Selected by [y]:
   - ARM64 [=y]
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +2001 include/linux/iommu.h

  1993	
  1994	static inline int iommu_sva_ungrant(struct iommu_sva *sva, void *va,
  1995					    size_t size, void *cookie)
  1996	{
  1997		return -EOPNOTSUPP;
  1998	}
  1999	static inline void iommu_plb_sync_all(struct iommu_domain *domain) {}
  2000	static inline void iommu_plb_sync(struct iommu_domain *domain,
> 2001					struct iommu_plb_gather *plb_gather) {}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

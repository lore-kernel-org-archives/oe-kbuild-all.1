Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766FA241667
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 08:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751013701; cv=none; b=dbBPeR9mIP0G+6lUs36aKveIA9XHp4S4wt0Im2FiS4YEVZD8vb61LLtDOFDfIKdzj+b0Dm78IikQcqfqjhIQJfzDgGnt3LdBy/Ht1ffii0dhgxE/hkLCcuT2NKwu9vBOAm02pg84vXj1TI5YX4SmihhBL2umg/vy2w0werPCcEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751013701; c=relaxed/simple;
	bh=+tgVWPFjq3dOEapaqCYUwjdg4Nu1t4jk7GEQjeWm2kg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GIbU/lzsZ04Xjvz8RN+JL3EW+P1QCSQY8KLKoePdIMRVmUut83cuTP77DzBNRIDC8y46srQU7wmTrUjunrKmzrkjo2MdPOJab1G41ykT4c2jBDAJrzzwE4aql+2q3j4pKzfs53a9Oj8BQavPbBHbkaxawrQAMBdsPfNpXstN5JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4OhWyfH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4OhWyfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751013700; x=1782549700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+tgVWPFjq3dOEapaqCYUwjdg4Nu1t4jk7GEQjeWm2kg=;
  b=Y4OhWyfHHErd+iwH61/EzOL522mHs5FMJnGnB6gnyinnUa7sSXv+hhv/
   wOxEkxBhAw2zW8M6E6GgUOTpPQ5JXs8Ddx+Qn99hV/FEhH7yMsNiW6iO/
   +PQs6Rdc+1z6iY7vOXrrgXaeqjKegxJ4GvFKkvmNocADBOeBSb2XyLGHq
   b4tkNCOjZ9FVz40UMoOCwOP/QRELu9erQD8tDNqYzN9s9L4xOL4t08xS8
   Zs5URKNS/A+1qXSeZ+QcTJWn2x8Q4E1cWLMdfaFa8CxL+dfl1atALL5p7
   OmlSlET6mHDP7IAsCjOwhFg+EpmFV/Hw+qElF5bUdXRHYjhLKpPuKTzxv
   Q==;
X-CSE-ConnectionGUID: NuozIkIDSgycFwak3TdQIA==
X-CSE-MsgGUID: SCYVeViUSLaV6oWyXIXSEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="75869003"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="75869003"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 01:41:36 -0700
X-CSE-ConnectionGUID: mxya/GrXT8aVxaBGfomBxw==
X-CSE-MsgGUID: j+x5FDVCQFWlooAcQlq5RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153269900"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jun 2025 01:41:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV4eJ-000Vz8-2c;
	Fri, 27 Jun 2025 08:41:31 +0000
Date: Fri, 27 Jun 2025 16:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5320/5590] mm/damon/sysfs-schemes.c:1622:32:
 sparse: sparse: symbol 'damos_sysfs_action_names' was not declared. Should
 it be static?
Message-ID: <202506271655.b8yfEZIT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ecb259c4f70dd5c83907809f45bf4dc6869961d7
commit: 98c5783c468ce5630a0604c69694d04ccc078c02 [5320/5590] mm/damon/sysfs-schemes: decouple from damos_action
config: hexagon-randconfig-r122-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271655.b8yfEZIT-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce: (https://download.01.org/0day-ci/archive/20250627/202506271655.b8yfEZIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271655.b8yfEZIT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/damon/sysfs-schemes.c:1622:32: sparse: sparse: symbol 'damos_sysfs_action_names' was not declared. Should it be static?

vim +/damos_sysfs_action_names +1622 mm/damon/sysfs-schemes.c

  1621	
> 1622	struct damos_sysfs_action_name damos_sysfs_action_names[] = {
  1623		{
  1624			.action = DAMOS_WILLNEED,
  1625			.name = "willneed",
  1626		},
  1627		{
  1628			.action = DAMOS_COLD,
  1629			.name = "cold",
  1630		},
  1631		{
  1632			.action = DAMOS_PAGEOUT,
  1633			.name = "pageout",
  1634		},
  1635		{
  1636			.action = DAMOS_HUGEPAGE,
  1637			.name = "hugepage",
  1638		},
  1639		{
  1640			.action = DAMOS_NOHUGEPAGE,
  1641			.name = "nohugepage",
  1642		},
  1643		{
  1644			.action = DAMOS_LRU_PRIO,
  1645			.name = "lru_prio",
  1646		},
  1647		{
  1648			.action = DAMOS_LRU_DEPRIO,
  1649			.name = "lru_deprio",
  1650		},
  1651		{
  1652			.action = DAMOS_MIGRATE_HOT,
  1653			.name = "migrate_hot",
  1654		},
  1655		{
  1656			.action = DAMOS_MIGRATE_COLD,
  1657			.name = "migrate_cold",
  1658		},
  1659		{
  1660			.action = DAMOS_STAT,
  1661			.name = "stat",
  1662		},
  1663	};
  1664	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

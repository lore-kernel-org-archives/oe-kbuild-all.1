Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A842D3EEB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 04:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785471370; cv=none; b=tlbLlcTg8RNWhcFiRRiRGNDGinnlo0lJgbT53KUyUh9FH6FojuqmkgegmQ8z2KozrQ5LNW89+22APqf5ozFtLHXBxSTSp5edOgMP5rhHkGNK4O+InF+BqLMa8eLT2d5Nbgej+FieWp3C8WPtkeVEQ6DAiohCnUKAkkA/gc2/urM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785471370; c=relaxed/simple;
	bh=LsxkVPRtkZTaPU/USRjB/LRcV1a719dtaCqmcGV7r4o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rK+QthfglxuVo9SaL2Uag9Dn9wRDIEsmp2hTH8Y+bCTo+6VEMLbrJse76CUMCzcPZgKsGgk3IcdSkKlcMxo5bkrogxC8is6kNFLia5g9m+bnoPPi2/S8LSfxbIhsgYXmQyl4Ac0bRxpN5fu+DnkrAQywzygfRSwtDDzn7OxvUYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgIxc/eS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgIxc/eS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785471362; x=1817007362;
  h=date:from:to:cc:subject:message-id;
  bh=LsxkVPRtkZTaPU/USRjB/LRcV1a719dtaCqmcGV7r4o=;
  b=fgIxc/eS0VK+HxJh5xN8XsoQr6wUcPhwB2yMAW67lwtxNQHJFknj5GAq
   kNF1ukOg/A0hTb73pqyE6F0v0ZvMiuCExavTq/dxyEdChbH9nbZxfutQx
   d6Q4bvR+FbLbt9aMF1XfSQg+C9HPD+Kovx8ARgAtqARO6gsABIFMe6faQ
   Z0ku7IrZdULj+3XBkVbzSx/KCZq2gg2yjCFvEjOm+s1LnZs2fuW5CAk/Z
   lzYC2hlj2oBU2+7EMzdTssjjDRI/hywj04VPwtilRlaR4VwQsz2acr+fu
   dLkffAjTHp4U0u7SU91QQ2nqDuiDYeLJO3CAQNWglDUThOkzPtq3jwg7E
   A==;
X-CSE-ConnectionGUID: iFVEo5zMTuOUHsOpGEilWQ==
X-CSE-MsgGUID: EDZ/FeVdQa6Zrx9pmPToIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96682889"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="96682889"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 21:15:57 -0700
X-CSE-ConnectionGUID: 4IFtjd3TRUyV/XhB4MblRA==
X-CSE-MsgGUID: BqP3YaHTSNCrq5O4amOblQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="265542220"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jul 2026 21:15:56 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpef2-000000002Vu-3PCt;
	Fri, 31 Jul 2026 04:15:52 +0000
Date: Fri, 31 Jul 2026 06:15:36 +0200
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [mcgrof:blk-iobuf-pool-v5-premap 13/14] htmldocs:
 Documentation/block/iobuf-premapped.rst:3: WARNING: Title overline too short.
Message-ID: <202607310621.ad6YfVnw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v5-premap
head:   798d9d9ed550e23049025d753032582e1f289d78
commit: 53c4f015ffc5b28880d0b68c36d99a86f9814743 [13/14] Documentation: block: describe the premapped pool-buffer design
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260731/202607310621.ad6YfVnw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310621.ad6YfVnw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ============  ===========================================
   1             automatic adjustment of input current limit
   0             no adjustment of input current limit. This
   helps for more unusual power sources like
   solar modules. [docutils]
>> Documentation/block/iobuf-premapped.rst:3: WARNING: Title overline too short.


vim +3 Documentation/block/iobuf-premapped.rst

     2	
   > 3	==================================================
     4	Premapped pool buffers and the NVMe command ceiling
     5	==================================================
     6	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

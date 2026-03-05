Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55FF28CF76
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700345; cv=none; b=aMm7Hd5EWk1Enm9SBVh1Kn2e/NWu8nlc7NwxldXIvl4eNRqJs+ZrOP2C/Qk3frDM5741TrhM84WwkrjLdMM7/W57xQ0soiyqJxGdQxy9chfVf775L+z12DAfFpbQ9bLgnYA7mhuQwCsIH41/fSnJgNd4LM7M6dPijs+zLU53jlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700345; c=relaxed/simple;
	bh=rDUTtB1Y8xxMrJtGuXFmtlJQ2IOZSANCcrULOuO11JU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NEf4enWQmYwRysfDEFRPWHjWOKD1WQYUTk7rftBxwceVqEeyL5KqCmerviRwfIkdvi0+usUTMIBgdQX6mOjc+KR6De2vmMVnEyp7nklztRInwn9/CLj1ioG1ygL+JZU7Izmy68UEFj6Qb3tFb7GDDD/FBxG2wW9aDmzpRYudr3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXWalD7I; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXWalD7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772700344; x=1804236344;
  h=date:from:to:cc:subject:message-id;
  bh=rDUTtB1Y8xxMrJtGuXFmtlJQ2IOZSANCcrULOuO11JU=;
  b=fXWalD7IFwTQRiBTCJwFvv6piDfR0N+aSdFAVVXb4wifE00EVIeW/NkY
   8L0ZPuFHTV74GOAMr6b7IMFCU4F5iPueMaun/Sq9CFXzJ17WmF2JT+6z9
   jtmocbpmersgOIelbfWh9pwYnYhm4ZyAj7itdXMEbqOQS+DBuBMmZah7Y
   LD5RzhtsjHnMa8M0RQG1xEZgb7d4OtO/LdFHmeRqxgkbPGTBddNaNi4mL
   dQ8tJTHBp7ptG/qXORiU+n+q6x5LVPXlrDaNiqldFkQvgPQSep1pmFcUR
   Alg+qLLyE2RbpKuFuIEjtewcOyIVzfhS5H2BF8YF0J8DMsrWT9OBo3FMC
   A==;
X-CSE-ConnectionGUID: o1NbHVsyQTijitB6fbkjMQ==
X-CSE-MsgGUID: 9Aww6LupR4yh8GI9f+KTFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77650824"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="77650824"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 00:45:43 -0800
X-CSE-ConnectionGUID: f7wxgIrST1OfTr44LW3rMw==
X-CSE-MsgGUID: IG65Y3CUTRqnLRcBBdUV1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="218749213"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Mar 2026 00:45:41 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy4Kw-000000000MW-2t7U;
	Thu, 05 Mar 2026 08:45:38 +0000
Date: Thu, 05 Mar 2026 16:45:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal:dedup-lsb128 1/11] lineinfo: warning: 1 entries
 skipped (offset > 4 GiB from _text)
Message-ID: <202603051609.NmliT9an-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git dedup-lsb128
head:   925cdd8d45fb4adec025cfe8e42abfa0dafa9a46
commit: 340fcb4bf8938a649242cde84aa7bafe17dd5325 [1/11] kallsyms: embed source file:line info in kernel stack traces
config: arm-randconfig-r133-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051609.NmliT9an-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051609.NmliT9an-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051609.NmliT9an-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lineinfo: warning: 1 entries skipped (offset > 4 GiB from _text)
   lineinfo: 2258558 entries, 5114 files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

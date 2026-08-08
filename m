Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97071175A88
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786190229; cv=none; b=c2OAR8FP9Y3EOH0sGzgGw+48bcgM3mqr3b8pIL+NSMA8hTGCBjM5dc4mnzCFC88qeKT4iwGwYf/XaNK0c7+S8RVeEVVMx8uLmcSSP7Pf7DNHr5kyC3rRNFP4onNdf9uKo2e4OlTHXe9R/mJo39s/56KpbVcyukfz+rc+3Mc1sok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786190229; c=relaxed/simple;
	bh=f6Cv0ncsugJQ16oqTo3XelwMlEg/nNz2tco/+1Xc4lk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IV68uNVoz4VNtoGBgPmPttXvEQIm4Qz7UT27kM4jCTEpqcB4HKkKtIjRmruekP3jlKZjdKlpB2lmwGDbhwsKZ90Skol6/DtxkcD7fzzfB9CiVCVJ7PlwQ/gOpTWNZHB+Ve4CuOBpk7lDykwy4LijhhgXAYqe5wQK4QZ5eJyXkV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUHYeMCG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUHYeMCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786190228; x=1817726228;
  h=date:from:to:cc:subject:message-id;
  bh=f6Cv0ncsugJQ16oqTo3XelwMlEg/nNz2tco/+1Xc4lk=;
  b=bUHYeMCGbvht0Bed0PQ+s1JeCHXRYu4Mqb4/jVWky3kD0PbuccnseUzA
   T22F2YcjPgk7802q8SW7sV9y2zyZjNb2JxfPimKv7V/m/kr5s4cl1Jpbu
   WYQAACFFKbLnvSIEq8SqL4KfNjL87q+ZCvOGrRK0Cd8haJplqes9THb4g
   8cHRwKoqws+vt8StgkaFSC2jkuZk5baXh7+boSpXpWIdy6oiGm9VMpd70
   W2ce+RV3LYurkBO5aDUMZX+SQB+LA8Lb/PfWuiLDZ4tvH1F49N2FBye1/
   j0JYDqzrBlq9PEJUCBkcRZREz9hYB1BmJoqgcgXF9LtS4z+/okL9ksSJw
   w==;
X-CSE-ConnectionGUID: sfQh68RqRVmd9VSTWrJUIQ==
X-CSE-MsgGUID: mUKXmwUmTTa5mI40LtoAbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86857291"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="86857291"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 04:57:07 -0700
X-CSE-ConnectionGUID: hnHqUnHCQKSDSOztw7y90A==
X-CSE-MsgGUID: KiJhTtTvQfWSelyCbKEyOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="261325752"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 Aug 2026 04:57:06 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsffj-0000000054k-2TzI;
	Sat, 08 Aug 2026 11:57:03 +0000
Date: Sat, 08 Aug 2026 13:56:05 +0200
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/hmx 27/114] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202608081333.EpObIYVg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/hmx
head:   d18cfcbc89df32524d340991739f2a7695263a90
commit: dd704380d0dd31e4d36b2c27f3b8207e62596867 [27/114] hexagon: add SM8150 platform support
reproduce: (https://download.01.org/0day-ci/archive/20260808/202608081333.EpObIYVg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#164: FILE: arch/hexagon/boot/dts/sm8150.dts:126:
+ * each time we hit a key.
+*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

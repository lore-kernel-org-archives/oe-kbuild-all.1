Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED92E3B9DAE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607680; cv=none; b=FuWHVA4neuItq6BWmg2iuHIQytFZPbHNqKH0/aU9NtRNe1WzICeFLMoIAenee2xL/nP7bQeJ0Kq1Oq3+icFh8zLTNLC/4Q5XJXOIEID1f3mO1pWyLAwGm4L4FhKXp0e+47UHJtjIIzmXr5Xzc99OCIELUi2SJl7IOAnl1pA8Qc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607680; c=relaxed/simple;
	bh=sjeNnglHxhBKbl9SI42T0aVb2KisvWi8BErro7WCGnA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z2d/JLeliRkxkPIf/8yuzcTL8POPu1Igsm3M+qsmE530es13OctuTeZQ1Uj/pcuCja3ZwsA2t6ELMeC/yG/0nOCi5LmG6PBXW9V7zjWPtl93AT2N6EItUsciQJ7a/M33Tp6Sx3AVMt9+dADQIetsB7XY3AkAKJXi3FryF2bEkpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jiSt62gu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jiSt62gu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781607679; x=1813143679;
  h=date:from:to:cc:subject:message-id;
  bh=sjeNnglHxhBKbl9SI42T0aVb2KisvWi8BErro7WCGnA=;
  b=jiSt62guyBBvcZ3HyLlJvorQhksw1WlPsfUfTxiUbwtvKDM5XExpOv4x
   njK2Y8zrJMsa7bgDbclegvj2SeYvZ3L48mF0l0L794hnKUc9O1wKjx3eN
   TxbYACx9WMd/+XdC7Dz+AZxmJudfi0BqR20oBmT0MZ39Q6lFBqqrfBSzD
   JIxEcx9tjves4LcbY5ztYGbsH7fzEQ2Sc3MbfC7+axOKRikys0ezDDP4/
   6HVgjGLVBIbEnAj8XLtLKk/crx1Nf8QtWpV/PHvXa03wEs6bISbAHaW/H
   yrF57Sq79FwV2FlACQLSWVf1kBujxCsA3d+4ZCGOEvfCuJUKmYHR3IkoF
   A==;
X-CSE-ConnectionGUID: 0IfLK73TTRexwJr/7S5bmw==
X-CSE-MsgGUID: LephN1WOQKmFVI+IHPFotA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86007316"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="86007316"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:01:14 -0700
X-CSE-ConnectionGUID: 0KtlHIPRTvGbkIwvEr/vzA==
X-CSE-MsgGUID: IPVGi8E5THSm7YdmELT+bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="249635390"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jun 2026 04:01:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZRXZ-00000000T4i-2aZB;
	Tue, 16 Jun 2026 11:01:09 +0000
Date: Tue, 16 Jun 2026 19:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc5 25/53]
 Warning: mm/page_alloc.c:5692 function parameter 'candidates' not described
 in 'find_next_best_node_in'
Message-ID: <202606161847.JkBZegBn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc5
head:   ec58256348d910505a29906a728e2319da305799
commit: 94246bd721cff6fa7635396bde16316535c58b7a [25/53] mm: isolate private nodes via a dedicated zonelist
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260616/202606161847.JkBZegBn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161847.JkBZegBn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161847.JkBZegBn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/page_alloc.c:5692 function parameter 'candidates' not described in 'find_next_best_node_in'
>> Warning: mm/page_alloc.c:5692 expecting prototype for find_next_best_node(). Prototype was for find_next_best_node_in() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

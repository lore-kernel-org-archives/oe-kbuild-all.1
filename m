Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2DB3CB91C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649366; cv=none; b=oQYa0Hq44FTVS6FMPIqJvj4bOc0VgUrMUFklQy7QfCrgsy9ebp4SN/AyTW4raqCCT0lGzZzANGmh1YwCZdydIW7jfW19+U7/E7H/CCXUc1Pd8TKuqK3u2yoM4Kze/E799nKsV4zaQAe1R0O5qWur13QlkBek26OWyTC8zJrSm54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649366; c=relaxed/simple;
	bh=f3ik4gGAGZJiwZ0/HDNewPhraDplV9LnU8wQlrg/esA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WNHQPJRVZcXJ/hK1yMQUAetXYZCck60NpauEwuyvyJr7Q9DbnffLztMmoGx3BC00/JsAo4UaP6W+6Ik/CNYfNUsULaREe9rpKETkt5jv4FpauEQoMVXaFe3nuC1DeDarrmlIY+pOWeRB7bQcDXtXgohwDk8W9UQOeWhd1/bFb2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1vKZyzQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1vKZyzQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780649364; x=1812185364;
  h=date:from:to:cc:subject:message-id;
  bh=f3ik4gGAGZJiwZ0/HDNewPhraDplV9LnU8wQlrg/esA=;
  b=R1vKZyzQRoN3hqqPLqAJPRgi7uGKn0mlQ0/VcdbK+Biso6QxjW7T4JfV
   irszKs0tvkMnDYQW4iN4sTkrd+KtKm1lwZzPNC9gM8g6aCqSHHCB28lo5
   OYL+9sNPNFSQSIwGswrlY6WprEPYgwR11xKqUSQi/PjKfNuWqTTy2YRII
   hFZScvHUmErqwvt4yugSNX9+MbUho5sJuj7Ei+KGoS+R5bT4mmfQ8hIA0
   ROQGmYOYlzAMHAAS7A4XVYTLxVZl1qK78HLHf/jFH+tqxZQFAynBY5/Ho
   xuDB8opJH037GovVWpTqEKJFzy88p5IDwjpUuE+o05nBtcF9mKyPqAEjm
   A==;
X-CSE-ConnectionGUID: feadbii9TvaO+TiL+nXsZA==
X-CSE-MsgGUID: JX8LfOcHQjuEuxH53mvsmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92968288"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="92968288"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 01:49:14 -0700
X-CSE-ConnectionGUID: fNUaIkgfSL+y7CKS9YR4Zw==
X-CSE-MsgGUID: rhIEe3moTbefUOQf15Ln/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="242303449"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 01:49:12 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVQEo-000000002XJ-2VbB;
	Fri, 05 Jun 2026 08:49:10 +0000
Date: Fri, 05 Jun 2026 10:48:30 +0200
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [agd5f:drm-next 181/275] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202606051004.KLfbV5gu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   56ae73c92e200e630c2bdf1e98c88b86c8483b37
commit: cbb8e2044b9e936dfa66f1d4a2f835316c741a67 [181/275] drm/amd/display: Add DC link support for FRL
reproduce: (https://download.01.org/0day-ci/archive/20260605/202606051004.KLfbV5gu-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1144: FILE: drivers/gpu/drm/amd/display/dc/link/link_validation.c:620:
+	 * HDMI 2.1a specification requires that all 422 format be disabled (7.7.1)
+	*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

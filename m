Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082AE284674
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 12:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766750606; cv=none; b=EBnrumzMe5JPyPgpuP2wl2fKWhuhhxniWR/xz9jNR/2cm/HRB8wzyOPSUGvFNM4xvDDweKBvKSoaiYRdQqielDH+MFCVCqSXV/u7XL7bTc/M92mC5VkYZBpwbx+ACoBnQvK058v+y+zd5OF+we0uoC/psLBd4zW91HBRKKStrTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766750606; c=relaxed/simple;
	bh=vHunlvmukqxNcLg1AKttbuvmdR6WNAohauZhB/yPjEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hXS4EwGuqFFX83tjjcAJx1MG5nIB2IvDdvE5Y3e1jswObzvRc8j83dUsLJ1dht4sRYJLGdDxuHabralhUAiJctcSISTd/K3nm/cAwTdunJWihumjQdbS2+nPEeQbuZQlbDR542nUnysG+MuVmn9KJ6iLDWHmPAp/HYA1yLsokA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9K1oaYh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9K1oaYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766750605; x=1798286605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vHunlvmukqxNcLg1AKttbuvmdR6WNAohauZhB/yPjEo=;
  b=C9K1oaYh1Bps8eX5GWb0/APVGPUEzKvTHQ9fuwXH7xOoRHM8FYWoNCFZ
   OkbWqszk8gfTyTCnMIs1RZKlLLXjbfOR4Z7tBc+83zlJojhShNcG9R5Sn
   BNLPI1tzb9cQNPWfXLcAeSWdRm2EU6fI8ybuD50fLp3aOmN3hWqxlQZd7
   wQc+tCXdC5vM1RJGi9dnCymxosksapqG1HeuqsPHVDzJtkTIJEqX4VrD7
   Q2ftyQ5UqnLMcDaFc1LkNodyTWhnpWnajOpRQFoXDIKSCTl0U0FC5ryx6
   xaQ3hv1185ajY2mKV0E6c0lqyQtM9NUGoj0/AgkkTYmdHFwYJg5npIdzW
   g==;
X-CSE-ConnectionGUID: VjkTrn9yQRimYd2ryawNXg==
X-CSE-MsgGUID: JS2Yk1jXSvK1W8RnY1PQrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79956627"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="79956627"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 04:03:25 -0800
X-CSE-ConnectionGUID: 4kzBdwJyQLCY/t/Xssi/kg==
X-CSE-MsgGUID: TeVIqIAVQFypWu/8wA03jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="201304487"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 26 Dec 2025 04:03:24 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ6XR-000000006sC-2eej;
	Fri, 26 Dec 2025 12:03:21 +0000
Date: Fri, 26 Dec 2025 13:03:09 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal:spec 111/131] htmldocs: Documentation/driver-api/basics:75:
 ./kernel/signal.c:5448: WARNING: Definition list ends without a blank line;
 unexpected unindent. [docutils]
Message-ID: <202512261340.vl5w1fvo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: 56df6f6c1c97a778da82fad64b7e60be5cce2a9d [111/131] kernel/api: add API specification for sys_sigaltstack
reproduce: (https://download.01.org/0day-ci/archive/20251226/202512261340.vl5w1fvo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512261340.vl5w1fvo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/driver-api/basics:75: ./kernel/signal.c:5018: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5025: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5028: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5032: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5033: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/driver-api/basics:75: ./kernel/signal.c:5448: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5456: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5448: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5489: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5500: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5506: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F2319CC28
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 20:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263130; cv=none; b=MfRtobo0m6LtmCq0A90wrqHa+IkhLR34ehR1TSEolj3L1ZqChy0aaTaMpeO3pC8yu2LGlZrcAHH19d8SJz+jxZhlxDAMIttMWYBRMBLEB83BThWfY/T9ciC3Sz6zGxNPDUvshbYxUrcKU5oswY/u1fO8hCuGLamxLyc9WEoE8tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263130; c=relaxed/simple;
	bh=Bq+vbD7cUUILxHNIUlIRyFpe5q4NhtHql7ols1ipoIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ch2hHHtOWDOuAaEUmOPFqz0OciG5DAIvIvEuEBG7wZLipnedXDsD+OGra7Dbe5SskoQzlWlFE+7pcg7bRJjrrZvr4QEF19K6mlIv394ki0Ms0CgExKPd+sPEtYexV7hclsBMDzx2gYNwcrwJmCus8FTULsWOmHArsq6jWhm8VTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvD4Vf/X; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvD4Vf/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766263129; x=1797799129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bq+vbD7cUUILxHNIUlIRyFpe5q4NhtHql7ols1ipoIs=;
  b=MvD4Vf/X1iMw7M+iL8GAlGmSe8ZDdTQKQ7ovazu4YsZm9B8EMQon94BW
   IAhpCg3tecw7c0lO70EVOi7diTOhWSKV0TNKQ+QdGRS/WvqOpUJRT1a4S
   46X5pbCLsWEShStIxGiWmFetfBfAN/Q8zFlZd5fwK1azhmvidnEFZPAmp
   KTi8EDiKlwDMoIl0mjh0qgOimhy15z8ZQfQWK5YGTm2CGaHTIROlW9lHp
   A8NE+fC6lEB0ikQydJJ/GdeyU+KExLLBY6GZf22rDz9FvBnUPfvbBE3rd
   WBSanbctGbzrNmTiBent3sO2TTJaRczWYkK6CGxhkQyXQOTL/x+xeQz3r
   w==;
X-CSE-ConnectionGUID: yBmT0O42RUycoLG0zScgGw==
X-CSE-MsgGUID: qWWFI2ZJQGunTUb+pFjhEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="93659419"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="93659419"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 12:38:48 -0800
X-CSE-ConnectionGUID: bNTRLEleRX+3ZMkykwSCGw==
X-CSE-MsgGUID: hBf6O94KR22WDIZiBEsCxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199078027"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 12:38:47 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX3iv-000000004mO-0bf7;
	Sat, 20 Dec 2025 20:38:45 +0000
Date: Sat, 20 Dec 2025 21:38:30 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal:spec 74/131] Warning: fs/sync.c:1374 expecting prototype for
 sys_sync_file_range(). Prototype was for ksys_sync_file_range() instead
Message-ID: <202512202103.PyU442mU-lkp@intel.com>
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
commit: 30a926a5b094a325518d8faedaafebc50bf9ab84 [74/131] kernel/api: add API specification for sys_sync_file_range
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251220/202512202103.PyU442mU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202103.PyU442mU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202103.PyU442mU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/sync.c:1374 expecting prototype for sys_sync_file_range(). Prototype was for ksys_sync_file_range() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

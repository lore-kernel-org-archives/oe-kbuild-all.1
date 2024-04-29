Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CE07F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 02:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714356738; cv=none; b=fwCojefbPi6dy6kApfwJqNCczDVo6hL8Z2OdZn20acJku1xp0w7Qb4A1cN8TXlnJdiiePNQYnsnzKR9N59wwIUBp/+41PiAle7zLMrqkdq9GcDszjNZKT9Lkr24mW0YSsW9bu1h8h0u+rZYQc2lAZiymg1YtIozol6DMMlqXQf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714356738; c=relaxed/simple;
	bh=1uBmSCNnfseWrvl5qm8LRxlOsH6UKNbMrdbiMo4Ekkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ai3GBSVnEDimp3iLxu8t1i7Fy85W9a/q+WaroOuR3VHps+vToMCt6v5J5LPyXaUyxREkpGQ+aAnnNTxvvEfdUrP1enmTtkaykt6fBxd12GFkkbJfz45peDYF85SQCdOsnnM0ka1zZlOQLXJJ1xrCOtkRUS6ehUPcLRrEQkM36g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=juRhBnqm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="juRhBnqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714356736; x=1745892736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1uBmSCNnfseWrvl5qm8LRxlOsH6UKNbMrdbiMo4Ekkg=;
  b=juRhBnqm2uyLAFsbjlmJrZcmWjdYDk3aSG5R9IE+WlPkr4EF4ANjUU68
   d9kpvfjRmRWQ0jrlCm+S6vpa5wNnTt882Yg9A89DfdHNN010lTCZfNKpr
   Gy+zkwOi/cKm0WyjGuU2Ji0Qoh5TJnLVhH4ZLBkbCIV5vm9TBc7oVKvPQ
   9MfZu1kO8BnEFIyz758mObQEEht8Ql0TKgKoDUKwndozSFwit4hGQE4rh
   60fu1u6Z74xVpnl7teOS52fZIj+mTXAydv94l20ecd6XDyx+gzXx807oL
   PVSDhBy5N70GVkRXXLxy/MgMCerf1mu2nkHEurngBrqvhfq028Zd1+sEN
   g==;
X-CSE-ConnectionGUID: 92Wy3+LPRhe4SvynjDJifw==
X-CSE-MsgGUID: gMEFr7LQRnKt+tuy3fmICQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10166641"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="10166641"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 19:12:15 -0700
X-CSE-ConnectionGUID: 1EzGU6YNTk26gQX+W8+IsA==
X-CSE-MsgGUID: utDn9v1zT4GWtEqu2lqabA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="26038814"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Apr 2024 19:12:14 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1GV2-0006ra-1S;
	Mon, 29 Apr 2024 02:12:12 +0000
Date: Mon, 29 Apr 2024 10:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 4707/11728] /tmp/cczJwAG5.s:451:
 Error: selected processor does not support `dmb st' in ARM mode
Message-ID: <202404291037.ynSynRZF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: ccf1286e5735692c232f20949f8e32d45885c5bb [4707/11728] fsl_qbman: fix alignment issues in packed structures
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240429/202404291037.ynSynRZF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291037.ynSynRZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291037.ynSynRZF-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/cczJwAG5.s: Assembler messages:
>> /tmp/cczJwAG5.s:451: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/cczJwAG5.s:2417: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/cczJwAG5.s:2749: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/cczJwAG5.s:3110: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/cczJwAG5.s:4105: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/cczJwAG5.s:4415: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/cczJwAG5.s:5398: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/cczJwAG5.s:5704: Error: selected processor does not support `dmb st' in ARM mode
   /tmp/cczJwAG5.s:5750: Error: selected processor does not support `dmb st' in ARM mode

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

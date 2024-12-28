Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA3435974
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735397514; cv=none; b=K1HQ423bDzHP8mw8DZJsOqBtz+3CQKktgRjlC/Q3Nq2GwKzBMaY5OjIC16jkGG/Y+J+m08dnzztFpXllPsg3TSa+Q6ONJRGcvnvLj6NIF5x63I4zxf29Pts5cQEArYnfUKgSSxj+SIa6iFYW5EsKhAZvFm7H1dPUHybGFUgIilI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735397514; c=relaxed/simple;
	bh=WCGzYB2D5+7DhnywxUK8y289EqzzjZ0OtU8xZNnPa2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GznYj3blNpZC5NifshwEGWSCDlPdiRD7/iNenUHjhwwtnbraO7BTWhDMpOdW+BpD1IomRNlmhpTk+h5HY6sPvRpFz4TjI2O4OTJRMrmNvdhH2wgi6+lUv+vnOKHtn1YlZf1WFZs0yI2FsDhp1iEeIciCvv8IELG9Ah0VtuAHANY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHObC2tj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHObC2tj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735397512; x=1766933512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WCGzYB2D5+7DhnywxUK8y289EqzzjZ0OtU8xZNnPa2o=;
  b=FHObC2tjk2FhBk1rW6jCMn0ztaXgLQiqA7cbE/+vVGt5x39WwFHUkEnG
   UuIn6pC7edhkSdVJugNQOeh3Sqelf4V8hbbUhoJT93nrrI4y1MpqI9lXw
   RvkQMmt0z50WGMEd/ulIDqB57QEwTVzF1bN3gjUBJW5Iy7hT2NIdd1l3t
   tY20yQHaj0W1Jp43nFb0MWBQPSEFOR+y9j37szZW2b7R/IAa0v9uTGxtT
   FpoTozp+9tW28bgXKoHoTvpohbFnl7cmznczAMj/MDZhFMotBHuOW52/Q
   1NT3/6N0WCVd2hbysc8yCH64LMXLBge5blf1ruD1Ss72wOzpuh9iosghQ
   Q==;
X-CSE-ConnectionGUID: ONyX8vbnTLSpvnTJ14xh2w==
X-CSE-MsgGUID: +6g9fN/mRL+2RfWAbllDHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35471592"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="35471592"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 06:51:52 -0800
X-CSE-ConnectionGUID: NDFRqpy7SJ+nS/ow7jGkYQ==
X-CSE-MsgGUID: 36S1KnEOS6CziTbEeVG3NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101229404"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Dec 2024 06:51:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRYAP-00047L-0M;
	Sat, 28 Dec 2024 14:51:49 +0000
Date: Sat, 28 Dec 2024 22:50:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2589/2589] kernel/futex/core.o: warning:
 objtool: futex_lock_pi()+0x6ec: unreachable instruction
Message-ID: <202412282222.K2wXdQAA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4848f81edc2027721953fee5ded81f909a833e26
commit: f552f518f86f4489577e296625e624271e2f76b2 [2589/2589] futex: Move to kernel/futex/
config: x86_64-buildonly-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241228/202412282222.K2wXdQAA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412282222.K2wXdQAA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412282222.K2wXdQAA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/futex/core.o: warning: objtool: futex_lock_pi()+0x6ec: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

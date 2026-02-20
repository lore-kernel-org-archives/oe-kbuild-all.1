Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD681684A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 01:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771551898; cv=none; b=rt8pStVT9mST4UabfbDRHOOHPFWaDEzsBN61fBvW/rT7bws0xIRuWroZgJAD07IDDVpgtX/PJ6mPFyojAcSEUe4yoMGSangCeDT2iXjaOdOFql47x9kmCxwTLhVqgZ9ubCukka0Qks5PtQyS9m5HMzDRDin93uJufd6ADtj7LHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771551898; c=relaxed/simple;
	bh=C48efmCJn0rQaq76QGOZy+BsOA2Smgpc+6pFPeu0UzA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BQ5yKaxGv3rtdUjDyZpstAXwZ6ZJ6wAtd1RFAz03QGDotrrrf+CwR5yyFd5/+jRRfChPlTzq1cr/leVRpN2HeEkSEKP3966sobBsU7PuMJ1bSsqV9s3eOB6rCfsSqcLDIuWcSQzpDahIun3rP0Orv85h6TriZrBag35Zw5fKffw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WeFDvX9E; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WeFDvX9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771551896; x=1803087896;
  h=date:from:to:cc:subject:message-id;
  bh=C48efmCJn0rQaq76QGOZy+BsOA2Smgpc+6pFPeu0UzA=;
  b=WeFDvX9EwEeg5jNXnBU7oHjifDuNM+q7fqy/RQAm+rkGoQbfGsi6ZhUn
   iEqGXazn5x0tAY/UloUjqft713UdWPBkw1HrGkjJEFpblCe+0UuE3WrM0
   VxEbVMWXigHipq/ylxOk/7rlf3amNYkk7nII38lIhNF6PwIgH6jQW5z/l
   /RIdues61pCOEQ8neQAKGSohRj8jsP5kg361T7IYvBOWh1OxJuUtm3EyQ
   VR1sQGa91zy1QHfyppKxJIcPvZPdt0zTt95S1CViE+BBbH0p5BIp28BXM
   h2u8b8vLTfk5Lv9pqaZggN+xktKrcw+uxiy5IJKJ1uhH9Y1YFmL48HVT4
   A==;
X-CSE-ConnectionGUID: Tae3JYLyTEawgcKukECIQA==
X-CSE-MsgGUID: zJAS6Fk4SLC/a9j4KzfFvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="95271156"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="95271156"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 17:44:56 -0800
X-CSE-ConnectionGUID: qZ0V8t+0SAKeaLLS1anXlw==
X-CSE-MsgGUID: hk50HBT3SVu1/w4c5fZiIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="212885698"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Feb 2026 17:44:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtFZc-000000013hw-1OpT;
	Fri, 20 Feb 2026 01:44:52 +0000
Date: Fri, 20 Feb 2026 09:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 8/18] <stdin>:1630:2: warning: #warning
 syscall rootns_wait not implemented
Message-ID: <202602200954.hNfGAgsZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   bbfe3fc31c861befc0d2aa15a02e672b2e248cd6
commit: 200438b6dc1097f11abc6f81f4136432eb8a59b6 [8/18] rootns: Implement rootns_wait()
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260220/202602200954.hNfGAgsZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200954.hNfGAgsZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200954.hNfGAgsZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1627:2: warning: #warning syscall rootns_create not implemented [-Wcpp]
>> <stdin>:1630:2: warning: #warning syscall rootns_wait not implemented [-Wcpp]
--
   <stdin>:1627:2: warning: #warning syscall rootns_create not implemented [-Wcpp]
>> <stdin>:1630:2: warning: #warning syscall rootns_wait not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

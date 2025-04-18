Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237618836
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Apr 2025 00:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744937856; cv=none; b=XlEYvk3veL1cyk05Y8mG1WldfHgotrAQN3IUJ+se+dkPO63frb7PFfT/HqEWgmtKbe7H7icp/YFBIjBOFanXiTRJYo60icEin979f9K+x5CUeexC6tl1e3+zS63eZElqINOb1pPKUCEYCGi9EOJBEdoJpdQzppagayzvrxSY7sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744937856; c=relaxed/simple;
	bh=66phpB7E37vbMzTyI3u5BXQrn/4XLevYsZ6Vpj3ZsMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mXQwNMrBMVZXvOCEnyXKUeptwfFzu/GA539K48iKVTx4sPJe9yMWyeQGfy0w3rjpsbfiQiQOxGJd3tPKXV2SKV72XrWF7XQCF3TC9o4QzBegFT1EUmmr6SOz9acpPmdKPeZwv89E9dWRSklWIDGjCqxX/X6m82Ak9JbO/VQnGcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bP0nLSP6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bP0nLSP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744937855; x=1776473855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=66phpB7E37vbMzTyI3u5BXQrn/4XLevYsZ6Vpj3ZsMM=;
  b=bP0nLSP6jEzJxTj/c9O4hmgCQJo0X423KHg9q++a1RsqHrE5ArXPhrpd
   7tCmNHbijLA6iJ1ca5wmiLaHvODmt++eYHzMsGkuIZO+H9bIFY1n/sqig
   e/MenhQ48qD5OzGZ1bNCKYPpLYeYFChmf7oItKeP/PxE6TWbjrcPnRu2w
   dyfzJe74owbmX/Sqo+5hlYq3v13cQy4IHbBupwEyQ1Kgc9efdYW9xLvZ/
   mhBDHsGkDD56MMOIW73tlTTpPOeeGRh+t0tNp0sCinIV1kqRYH2l8oU0K
   d/0E9JHCr0EIpGx4rnlf2l7v8zk8MjF6yUckbf9FAcZvRTmjHywOWpxaS
   A==;
X-CSE-ConnectionGUID: pVYUhbSWRbiqg4Mco7XnJw==
X-CSE-MsgGUID: FH7e/EtEQHuhmVRrSruG2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="50235674"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="50235674"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 17:57:34 -0700
X-CSE-ConnectionGUID: /VQrZwYKSbWsl8Qw+GiZXw==
X-CSE-MsgGUID: 2IUkU6QrT1mfZBYgT8UL6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="130742636"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Apr 2025 17:57:33 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5a2s-0002Dr-1p;
	Fri, 18 Apr 2025 00:57:30 +0000
Date: Fri, 18 Apr 2025 08:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9]
 samples/ftrace/ftrace-direct-multi.o: warning: objtool: my_tramp()+0x10:
 'naked' return found in RETHUNK build
Message-ID: <202504180827.2dSFNI7D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiri,

First bad commit (maybe != root cause):

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e93dbf3bd481cf9c55d08073d8b0865cf274707c
commit: 1aee445c6ec7528034ea511522c55b9627c88a7f [9/9] ftrace/samples: Add multi direct interface test module
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250418/202504180827.2dSFNI7D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504180827.2dSFNI7D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180827.2dSFNI7D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/ftrace/ftrace-direct-multi.o: warning: objtool: my_tramp()+0x10: 'naked' return found in RETHUNK build
>> samples/ftrace/ftrace-direct-multi.o: warning: objtool: my_tramp()+0x10: missing int3 after ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

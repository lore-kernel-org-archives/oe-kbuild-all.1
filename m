Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1582C2500D5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 08:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732521678; cv=none; b=lel5b5ulU2PwNzTYgoc9jVNuO3ErM16FQ/qqLwNquz2NmMc/JQIx/y6hR73wFzMZi5b2bN0nhYfHoXI4RjpfY9L6CVi3m6Kc2QJ95L1BbVdt1Nwas6hDfIDYG/2EdtRjgdixEA6z/JfPj53CrV6EfLP2DxbL4njsUEojZGkklTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732521678; c=relaxed/simple;
	bh=USpGQfLmoWmhJMUlpA5FfNfEQwASPcuD5R4V/2+zHmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MFNfnCxGVvRwtyWT2C8H6xNJwhyGt6cv91LvW41dLWCSAvibxg2XFLBXqNgQcAOfiPJYzPC7wnEBrX1sgzWVpVboHJ40UtZkKG9NxnAlmTLS9s+benCeIwZWj1/TZ/P/65Pa3FE24gOBqF76Q00QL83IO+gscQSY22Anh7dTChU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/K7ZLYh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/K7ZLYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732521677; x=1764057677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=USpGQfLmoWmhJMUlpA5FfNfEQwASPcuD5R4V/2+zHmU=;
  b=V/K7ZLYhai+8In8xwVFMRSsh31T0QYFwPUeqIBdemBZMV0C7kDOo0Lyc
   /Vq+vj5gtugUXfzFJQT3mp1Zo1ErHP8AcmryMNfA0fDySt/q9z/7zyF+A
   QRLDffaGabtstUunf7mHff12cwuh89Nek8E/iLxvImjOeWnwF0knnr8+l
   MHcXM5rgoAp3hoETg+VeILOsRNzs3C1nLi/CEQCPg6LSE/aHW8fav8drG
   E5SGhO2Z/gSohVEIhYoVjy23xzIhtz2GFt8tQTJcKwoQE6cQg0hzzVkNc
   +ZQNzyI4ASILJdOeN4354bGwub+Eoyz/Rd26QjPpuia6UGlO/Bf8tvpKq
   Q==;
X-CSE-ConnectionGUID: r3y8rlP1SJu7IdmCa9/WXA==
X-CSE-MsgGUID: UMqCkEcEQsGoYyLn3VW4BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="20204225"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="20204225"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 00:01:10 -0800
X-CSE-ConnectionGUID: y715sqwZR7q5z/PjNzNPXQ==
X-CSE-MsgGUID: roYPS9KKQyyqLxNnGhQOFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="96112007"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Nov 2024 00:01:09 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFU1q-00063j-1J;
	Mon, 25 Nov 2024 08:01:06 +0000
Date: Mon, 25 Nov 2024 16:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1517/1517] drivers/mtd/nand/raw/nand.o: warning:
 objtool: hynix_nand_init+0x119f: unreachable instruction
Message-ID: <202411251538.z0jr4NG7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c9048e254addf0bdb1d8bb42407f462b06c5498c
commit: 107e8e2d48f2014216a818314d4e1af591b39aed [1517/1517] cpu: Re-enable CPU mitigations by default for !X86 architectures
config: x86_64-buildonly-randconfig-001-20241125 (https://download.01.org/0day-ci/archive/20241125/202411251538.z0jr4NG7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251538.z0jr4NG7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251538.z0jr4NG7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/nand.o: warning: objtool: hynix_nand_init+0x119f: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

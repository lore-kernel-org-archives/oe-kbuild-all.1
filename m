Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0D1485CDD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 17:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828246; cv=none; b=DxopFHifnO4t5VYIZ3Fd5YIdoPiVHtE3HeNdXeaGPHG/bslRCfq8Q5oDdCSRIOkYdJ2v+1MJZKsPG3xA2kqi6mutlUzZW21VPQG4M5EKzFfCYFhWqQzGjNuLi0jZf88hExw8ApImtA2U1HliZINJ/X22ULb3a8hs0qHTtfPBcyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828246; c=relaxed/simple;
	bh=HS/5R1qLB/4G7pjTW/spJABkKzMXaARU/Sdiuc/mbn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Zf6U0S3iXX2XI3nrXtPjnR5b0Iu7fsmkL7KrzW9HDneTTC07/ikDQWT3Na2TbmaX4i2La5F1UwGPoP7VICGe1acipgtcoEhuNJ0QRZcVi4PHuXJmMw0l2qFeZb64Xqv+8brF3EEZm201gqy7qtwCRst6Bfu8HxHEFOVsHZUI+oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mIHMPtJv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mIHMPtJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784828237; x=1816364237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HS/5R1qLB/4G7pjTW/spJABkKzMXaARU/Sdiuc/mbn8=;
  b=mIHMPtJv3KTlhXdUJAiUAV1X6IuVmYBilPnHLO339XuZgxKQopOp2ZpM
   uTNugrZQmfrLWGvgQNV7Ot9k8SFTMy7mJiSE4YtUaRSuDYfUYE2HtVUGe
   FiFRKgQYzpmPO4w8wMyP9qDRQ6oy68a5Z7nZoiy4o8D8/AP/bqjr/Pfiz
   Y0jPBVgUd/Hgt1PwS4AQQINKoXq+TehN8CStMZG2I6aWGqg6NWkWsvm2H
   GMXHofFvBMo/EodFBfPB4lvGxlTS3DTpWXS7mBhGuyUtk/oNG0lEKplEp
   +O2i/NfPakyYSnw282VEQ78B88+y6khqiGE7pCe7HPm0fkGAujyvKy7XH
   g==;
X-CSE-ConnectionGUID: NZpPH28wT1uxWYcXvlumKw==
X-CSE-MsgGUID: ypsrRqbKRm+81xBmTVIlDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="95845811"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="95845811"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 10:37:11 -0700
X-CSE-ConnectionGUID: aAVXbxJ2QRyWTdl32HWvXw==
X-CSE-MsgGUID: CPVqhI6UQgaitU7rAfy48Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="258544208"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Jul 2026 10:37:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmxM3-00000000Zwy-3JxZ;
	Thu, 23 Jul 2026 17:37:07 +0000
Date: Fri, 24 Jul 2026 01:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Maxime =?utf-8?Q?B=C3=A9lair"?= <maxime.belair@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 John Johansen <john.johansen@canonical.com>
Subject: [linux-next:master 1239/8209] Warning:
 security/apparmor/apparmorfs.c:501 function parameter 'compressed_data' not
 described in 'aa_get_data_from_compressed'
Message-ID: <202607240144.4iqulDF1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   290aaf24a551d5a0dce037e3fab30820f9113a10
commit: 17b5758bf35c7a113363cd7a350b7e6a251b80f4 [1239/8209] apparmor: Initial support for compressed policies
config: xtensa-randconfig-r121-20260723 (https://download.01.org/0day-ci/archive/20260724/202607240144.4iqulDF1-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260724/202607240144.4iqulDF1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607240144.4iqulDF1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/apparmor/apparmorfs.c:501 function parameter 'compressed_data' not described in 'aa_get_data_from_compressed'
>> Warning: security/apparmor/apparmorfs.c:501 function parameter 'compressed_data' not described in 'aa_get_data_from_compressed'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

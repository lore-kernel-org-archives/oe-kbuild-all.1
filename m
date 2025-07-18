Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F991F95C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 08:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752826601; cv=none; b=h2mKF1gqqY8I0H46BPAu2ukkBJFtcaB35Mb6nU6bY6+V1eET+4+dpcwP6vMHgIPN4Fkqoeg/ADkgfORm9ZBKDDOm9RSLiU/MgeGVPU3g4wkdt57IYI2QFLoOZundkDvbqhQ2XBtk0PTjzJGT4qm11Xikxb61IEoghtHoXIRIBpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752826601; c=relaxed/simple;
	bh=VGnxuha50bWCynMZYAcRaaFMbPgXcGKOkTPV2nYZuh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EcJKEo7M6uFhINz4uReF3jXA10M6MMo43Df3HO+VZTzCIiIKVa2zKM+DiDRpUWB5tCzzbACa3J9GPBUws2GXHp/xC9LWs6951rvaBhA/crQ2jl9U2uTHCF3YTzx+LkOL4nIgKDDiM6hXfMqkoUCrdWpxKyFiYpk+TY9BnvU6Q2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LA1Z5yCY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LA1Z5yCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752826599; x=1784362599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VGnxuha50bWCynMZYAcRaaFMbPgXcGKOkTPV2nYZuh4=;
  b=LA1Z5yCYlVjHmOV9LuzCpDous27u22lSDDMkwOS6CfUJIF2gUdTzRbz4
   RZjb3QMZbypuMgMV78n1kWbSO9Cy4qV6aioPj/oLIG+vPyArere142mVb
   LLhLOHY/uAS3yAmR1eHpo/R35ogVMC+zTV1pFqwTUDE/SqCEBGnXxPbPv
   oJdB5U5UUDdkI1jM58hRTZiNTo0RbeF24sUDepORjk7ct2IZLxBlm6vUZ
   xJoDNvxFLBRG4Q/S3ItyfKIfSYq9L8yIj8wcHr9vhBCIRaboDc0kWDPsE
   edPr+PN+u5CPi8huZSbvvCCfcttYarrW6Swee2RdNGhk0VX1NMUA785xh
   A==;
X-CSE-ConnectionGUID: 7slSV3yRRvmU5aRXNT1v7Q==
X-CSE-MsgGUID: PBtDH2VzQZy4ygqmK5so2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="65374576"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="65374576"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 01:16:39 -0700
X-CSE-ConnectionGUID: 0No9Qm3BRvWRUPgsB1LhBw==
X-CSE-MsgGUID: TZw4cJhHT4+ylYkgvJ/p5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="157817530"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jul 2025 01:16:37 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucgGh-000EQt-0R;
	Fri, 18 Jul 2025 08:16:35 +0000
Date: Fri, 18 Jul 2025 16:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1732/1732]
 drivers/i2c/busses/i2c-phytium-common.o: warning: objtool: missing symbol
 for section .text
Message-ID: <202507181640.hu6zFNEJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   700db19c02e9c8dcf291aa7a6a29337c97ea1805
commit: 777b12afb6187fc712f365df57982275e9ef244f [1732/1732] i2c: add Phytium i2c driver
config: x86_64-buildonly-randconfig-005-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181640.hu6zFNEJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181640.hu6zFNEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181640.hu6zFNEJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-phytium-common.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

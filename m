Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493E11C8629
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 04:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752814342; cv=none; b=pokCjZEqozbpGtPFFB4Vj+P1whfarvZ/+mY3PbERzMw0v/zZO4brthtrjTdDtWppJdG5FVbt5r4HqwH6emOJYlopVDXmw659krYAMThnpewzdQN7rBYrAILdDm4wy3fzI1K4miy0x/QnJYOe7Jiv/HQAsDW1PmbKyt3qwuZMPNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752814342; c=relaxed/simple;
	bh=DC3pmuwI/sRd38b5oFPM4r/eu/sQh6njInphdE/dbPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mc7h+RpFLwtjgUpz3kBqYf/EMNKE9viR2WGgUGz1PPfiafVmQKqZnVZFTGpgUzhPOk6WFhYBo9n6vl5fddrO6Z6uhX4Ak8Euz0REX0MCGBHq5Q+d3Pr86Km77aQaSud+S/8EBQwc6huBWbxO9WQ4ucB+I48G6G4usNQO6xaFf2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QimoBoIG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QimoBoIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752814340; x=1784350340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DC3pmuwI/sRd38b5oFPM4r/eu/sQh6njInphdE/dbPw=;
  b=QimoBoIGO/mubhiFrzIwbGb1egg0AJtxZ+C8iyVHPiLgCvLPDHKLMuPi
   6/zRrjfIrqtttNcHbjgDw2ntFMVP6VTwdySXGA6chz8Anx/AOI12JhjIX
   kP35l29rsiFSxYNovjoI0iwsmquNPSTR1M3yME/qBtPpV5LwWL+Rg5Wj8
   DlirkLJLZurTrLP1vQdlh+E9ecbvUm+etK0OZVZwN08cfrxg5rRnzduTv
   X38n9/Jk1U4+l6yv6FC99x4EuubrrBWE+h7fGmgK53rTn0sqm16BpeY8C
   etUXpGCvItuiKwrQoRZM+UZwDSYy/iZt6cQLoTTsjZS14RktKXU9GoVWs
   w==;
X-CSE-ConnectionGUID: 1/Y3k0XpTJSPbWmxm7Pw4A==
X-CSE-MsgGUID: PUYtO8VTQrSZTWly+2kd+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="58915126"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="58915126"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 21:52:20 -0700
X-CSE-ConnectionGUID: if5pTyzTQlm6rL8KzoNkPQ==
X-CSE-MsgGUID: 42fegokrRre9kleC9kAP+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="158443866"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Jul 2025 21:52:18 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucd4y-000EJ3-18;
	Fri, 18 Jul 2025 04:52:16 +0000
Date: Fri, 18 Jul 2025 12:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1732/1732]
 drivers/spi/spi-phytium-plat.c:192:36: warning: unused variable
 'phytium_spi_acpi_match'
Message-ID: <202507181227.NuhHHBmE-lkp@intel.com>
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
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [1732/1732] spi: add phytium spi support
config: x86_64-buildonly-randconfig-001-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181227.NuhHHBmE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181227.NuhHHBmE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181227.NuhHHBmE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-phytium-plat.c:192:36: warning: unused variable 'phytium_spi_acpi_match' [-Wunused-const-variable]
     192 | static const struct acpi_device_id phytium_spi_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/phytium_spi_acpi_match +192 drivers/spi/spi-phytium-plat.c

   191	
 > 192	static const struct acpi_device_id phytium_spi_acpi_match[] = {
   193		{"PHYT000E", 0},
   194		{}
   195	};
   196	MODULE_DEVICE_TABLE(acpi, phytium_spi_acpi_match);
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

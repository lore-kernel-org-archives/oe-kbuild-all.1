Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5081AF0A4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739002226; cv=none; b=R+LYY236oilqLXfm3E8x7KT6jadcxCcnAVmvUbj6fRY2CZMMJvBRkhMC6oU7NMLJOsMGLbeX5TT1IFfCyLPDji1kzGu+oVe2gpETDHt83mIDKtPbiZlE6prpKxP6wX5brBDroSVpi+iucPCwRz6cLIAd8J+/T1X9u+Qo/qK38Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739002226; c=relaxed/simple;
	bh=agzz82I2p6W1tm0yKSoeIa2535N9/HM1XVMp0yRIyEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B+2GyI2wGV625o15R8ItM0Z3LAjd1G1Ikq/9Hk31DBhhPdCWsABriGEU+zjl8KWYE1Ssjw9tVMvYhTaJ9ULUbxJOw0GAfI1lW5zTXR8G6mKv0/iEJ7gJPidzcE0zuQOfbQm78gQZZS7Wj10lQqiqPut0w8yqkAr0mM7U+vvjBsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0dBCD6Q; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0dBCD6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739002225; x=1770538225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=agzz82I2p6W1tm0yKSoeIa2535N9/HM1XVMp0yRIyEo=;
  b=H0dBCD6QAA7MZrHJtse3Kary3KSjqgcdssPW08DhwV+CzGtSWzh99vDJ
   G1r0Wn8rTI9uINttduSzhXDY7JSSYKPSiTSwyPukNlVSLC9KcGdRwSmTP
   xm2VEkM5SgPAvpl8dEmj0nONxW2hmQuiq/OyJyz2y0ns6BWY6V4E3kySK
   ywJoPqTSq+4znheP9Uyv1lW/iyRPsqjSvjtFA6bXhzbGs+E2vDPauVI2i
   N7mGdc37cpzhb6jEfXddO5ZHRA6IPjcWH21k1TiAv/oC16fXH/OBWHY69
   Jj3u3VcmxwkrUt3YftbCPvT9B531RlgVdsKzrmKSn4xo+zLK6nS+Fqf6f
   Q==;
X-CSE-ConnectionGUID: X934A/QlTO2+qKZUelow4Q==
X-CSE-MsgGUID: JebFXeBKQheMumj45Uc6WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39514700"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="39514700"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 00:10:24 -0800
X-CSE-ConnectionGUID: MsiHmmTYQIW0IOJmG2ceYQ==
X-CSE-MsgGUID: 30lSdCYiSciVc9qFyNHP1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112166325"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Feb 2025 00:10:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgfuu-000zjP-2F;
	Sat, 08 Feb 2025 08:10:20 +0000
Date: Sat, 8 Feb 2025 16:09:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v3 28/57]
 drivers/mailbox/riscv-sbi-mpxy-mbox.c:1005:36: warning:
 'mpxy_mbox_acpi_match' defined but not used
Message-ID: <202502081628.bYgIWGAH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v3
head:   89fd1a54d40f5fbd0a1c7fb10f51829f13385a9a
commit: 13851aef320d7e43e85b08933a00593dd1322653 [28/57] mailbox/riscv-sbi-mpxy: Add ACPI support
config: riscv-randconfig-001-20250207 (https://download.01.org/0day-ci/archive/20250208/202502081628.bYgIWGAH-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081628.bYgIWGAH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081628.bYgIWGAH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/riscv-sbi-mpxy-mbox.c:1005:36: warning: 'mpxy_mbox_acpi_match' defined but not used [-Wunused-const-variable=]
    1005 | static const struct acpi_device_id mpxy_mbox_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~


vim +/mpxy_mbox_acpi_match +1005 drivers/mailbox/riscv-sbi-mpxy-mbox.c

  1004	
> 1005	static const struct acpi_device_id mpxy_mbox_acpi_match[] = {
  1006		{ "RSCV0005" },
  1007		{}
  1008	};
  1009	MODULE_DEVICE_TABLE(acpi, mpxy_mbox_acpi_match);
  1010	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

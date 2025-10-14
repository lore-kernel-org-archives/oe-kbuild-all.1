Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12151D5174
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760445216; cv=none; b=pimDifPTblx4Mw4d2ys6aNwMXQSAkn9YX03Bg+b5f5FugBOfX16XrSBkhdvpCKGc1D4qyX/JOMav1U4XJ5nob9u/V+HMCsKmv5qmo8ynhKlMApnFPP899TFsjyYke8fTTPbNk4RoyAz83TnZgmv2b9mW5nOncXWfJNqCbn5Mcic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760445216; c=relaxed/simple;
	bh=thZubc+rYKfx8NFLImmRjeRIeu/Hn9lKZgFnWbFk0Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Na4nijnNq7quhwgpksKGk3RMKeNPdGm7KcI4eJ0f/DlPXFp+Bo5HtNcyzzF2hOMMNxbefHZ6gbmjxbqCOSJ9WAYKUIvNrxMV2I6lTbG8mugUzjH1wAvUMBZ0B28n5Lyi/homrOCU3t5+amHzo+4pzrPtEsnTKEXAxPVqmhC0wUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hVXlcSTt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVXlcSTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760445215; x=1791981215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=thZubc+rYKfx8NFLImmRjeRIeu/Hn9lKZgFnWbFk0Sk=;
  b=hVXlcSTttXXEQwdJnsQB0WSIlVK0x0etlwARsvZpqsIV0x+iMRVJ0Kp5
   /WE4JIwFMDE9Tr3/CrFT2GnY3mdSrijBLV4RoO7wpTDQmP4xuA/2REsPt
   F38wamBnXvNNNg4+mF3rRurlxZM+OINU237fi3z9OIUXzT5WDIj5nUH2g
   S82eZYOHsn2TMO7BzYCdQ/DxZ61A0SiiQu/m20GzponZaH8u+4Tt6NrKQ
   kRcEEsuP7r8LNon/pE1LBnKGIIcWJ+wsGkbAEw55H+zj/ISqZRTgLtBbX
   BNbGywuFPa2xrowIKfU4kBsiC0a3sxS9akkAE5puTpGwCsIgS3Jozc2db
   Q==;
X-CSE-ConnectionGUID: A1JuuAIXQB2iw73BKyQtDg==
X-CSE-MsgGUID: 6gJ8g4mTS9+L1bm2dfO7Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73944431"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="73944431"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 05:33:34 -0700
X-CSE-ConnectionGUID: 43o5bnMmQcWZjCZnpSnGbA==
X-CSE-MsgGUID: vlRI8ETsRq+69MltjTkfiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="212487498"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Oct 2025 05:33:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8eDa-0002nj-2O;
	Tue, 14 Oct 2025 12:33:30 +0000
Date: Tue, 14 Oct 2025 20:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/gicv5-fixes 3/4] ERROR: modpost: "of_msi_xlate"
 [drivers/pci/controller/pcie-iproc.ko] undefined!
Message-ID: <202510142006.Xzng7XoV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/gicv5-fixes
head:   d326a1131fe5883f610e786c2dc252810c434a61
commit: 62cb54092a9580f961c58ca1eb7254f2c23b8c85 [3/4] PCI: iproc: Implement MSI controller node detection with of_msi_xlate()
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251014/202510142006.Xzng7XoV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510142006.Xzng7XoV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510142006.Xzng7XoV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
>> ERROR: modpost: "of_msi_xlate" [drivers/pci/controller/pcie-iproc.ko] undefined!
ERROR: modpost: "__ffsdi2" [drivers/spi/spi-amlogic-spifc-a4.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

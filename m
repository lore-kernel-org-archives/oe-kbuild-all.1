Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A927C31E11D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761728356; cv=none; b=u8Bpj0oRoNR/RQrs8RJBuhSrlIlRu2LSoFNuXf2UfE8zPgI0NufLLsBog+F+F6Sth4/Tt5wua3EKRSwlWY5gZAH0uOMO1DHXgkjLPg45weBabZgEO3zZ2Vaj7rGs1yg8HB9ix50P9in/ckgh+iYGUNHHg1E7bVvJcD0An6dPKgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761728356; c=relaxed/simple;
	bh=lq+qSUL530AU0PnYY/atCUH/pexieectNcH4Bfi77Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qPUKsNKVM/Q3zV2AixKKW5qFy6o6UzC1XGAFw24REHvCmDvK4AeB1dLK64OS+5BRSNwjgwoq5v5BbxBTCDm6o+LgBJXxrltmcj6NeMjQFcjIRBywGvvyjnwVSNO7Dgsl/DwcV08F1/OHQXXySxKxjftzW5YMmH8oNgaSa9y4VN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ck9Cvep0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ck9Cvep0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761728355; x=1793264355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lq+qSUL530AU0PnYY/atCUH/pexieectNcH4Bfi77Xo=;
  b=ck9Cvep0JVD6zjPTVgMGmcnGOTSDTCoSZ5s2l5LJNqF0rn9abvHVWUZW
   esCgI3ceIb/yNFdoXH1L3vNoY0zhXho89mvZT16SVADilO1wJNgc9is4B
   M6OjCfrYkU/cPasWpgET696G4SHvFElV5aW7TOXRPNXaZMHFoL0TKcnSN
   2YkyJjmNxrrz0OFOzZ7rMugtfWyTGZ4sNGzV0RC5u1YLmkIhsfciklBFE
   C5BEdlZ/BQBBKh/fbxhIAbmnpTAhbZ4HgqbmV99J7CSTANyGPzJa4f2Eq
   PmmkcFrB/Gst+7bDfL40uEBg+RXve7rzyKHwcJBdu5kZg80NDgOfiwlz4
   g==;
X-CSE-ConnectionGUID: CZkkZriKSbGYWpLgRJObSQ==
X-CSE-MsgGUID: TgeD2sYnRAiab43jecPfeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63750858"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="63750858"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 01:59:12 -0700
X-CSE-ConnectionGUID: AcipwiWDTyC0d6xAW1nOlg==
X-CSE-MsgGUID: FSPb4CgiTwibuZgr27SeQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="186057396"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2025 01:59:11 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vE21N-000000000u8-2pYk;
	Wed, 29 Oct 2025 08:59:09 +0000
Date: Wed, 29 Oct 2025 09:58:34 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/8] htmldocs: Warning:
 mm/cleancache.c references a file that doesn't exist:
 Documentation/vm/cleancache.rst
Message-ID: <202510290918.dcLuwmfS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1d41448356d1c81a6fd029244469dff414abb233
commit: 3318ae18bbe039615a077378e3736623852d5757 [0/8] ANDROID: Revert "mm: remove cleancache"
reproduce: (https://download.01.org/0day-ci/archive/20251029/202510290918.dcLuwmfS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290918.dcLuwmfS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst
>> Warning: mm/cleancache.c references a file that doesn't exist: Documentation/vm/cleancache.rst
   Warning: net/netfilter/Kconfig references a file that doesn't exist: file:Documentation/kbuild/modules.txt
   Using alabaster theme
   Error: Cannot open file ./include/linux/pci.h
   Error: Cannot open file ./include/linux/mod_devicetable.h
   Error: Cannot open file ./include/linux/bootconfig.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

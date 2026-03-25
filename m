Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A202DEA86
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 23:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774481265; cv=none; b=JuzjwdvzWKGdUXknsrFkDB3ZR9nIVQVEocXusIK0U4qLfDVdt+P2vAgqdtA4OAOT563HFVHPufmByO2cVTrL62v392hab/mH3hKS4Mkma2X9/NPEFCoyfiIGQwVxbUfy+kSOlRJ4SC8M7mSAXjvaZL4nQkGRLglRzO9gzUxo52E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774481265; c=relaxed/simple;
	bh=P3vPwwzKWBP6wOJu0EzCr9y0UvTzq5ARTeDNB9IO0XE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HtgUofTPokz5OJImD4HVqHcGEndf5na3g0NefuzeDE/hO13dwmjhi4sr7HCX7uKavCcY4lZRoBCktu2uZ6/UcAoDkfBqwSf5/5P/YwlSN2zpqENG5UaOgoAnDS0ds/07BlXntw+vLKhN3lE9VlIMAmEdKohkOpI5/D6ZrXXabhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mvt2WgHG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mvt2WgHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774481264; x=1806017264;
  h=date:from:to:cc:subject:message-id;
  bh=P3vPwwzKWBP6wOJu0EzCr9y0UvTzq5ARTeDNB9IO0XE=;
  b=Mvt2WgHGe2hDnCDM0cBHYy2c8rvye23cJezkRQSfemhsV6653LCGBp+p
   XQX2sQpVVhCEOiezBKTBj16fCo1RPXEligAdaxPwCp/twgQHUGHWUwAE4
   X8MEqaOUo6W5PEud1v253yt9w+mbxVzTUB8sepLpnERCjkUdiFO4uQoA3
   uxx9pOiHFcDmiNQFODdRaiRHMnkS2vrwcw1vTkC3dpMv+arjDac2VDbuH
   CR+iIMX9PTqYDeoKnyS69skl8SEvFDLp+MyAEkjfXP2BHXlEQ8BdZPCPT
   JgtUhzbD/rXKb+5aP+xIvTFz293FLRKog3biPklsvUNWOtHUJbXoM3YbH
   g==;
X-CSE-ConnectionGUID: JjNPSuBVQtaVdE3b5FzzsQ==
X-CSE-MsgGUID: ed81b3DsTrixtBrj1fhJrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86224114"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="86224114"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 16:27:43 -0700
X-CSE-ConnectionGUID: 0VcsDSQuTqCDHcM7mmZ7Ew==
X-CSE-MsgGUID: cwtm52CuSYm1mFBz4fmNLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="262747683"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Mar 2026 16:27:41 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5XdS-000000007r7-3N1r;
	Wed, 25 Mar 2026 23:27:38 +0000
Date: Thu, 26 Mar 2026 07:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 strcpy.isra.0+0x14 (section: .text.unlikely) -> initcall_level_names
 (section: .init.data)
Message-ID: <202603260744.keGJn3BZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Peter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2a43e7f89da55d6f0f96aaadaa243f35557291e
commit: 323d93f0432edb5415c79bd35e15e5754a76e486 cleanup: Always inline everything
date:   5 months ago
config: xtensa-randconfig-r062-20260325 (https://download.01.org/0day-ci/archive/20260326/202603260744.keGJn3BZ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260744.keGJn3BZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260744.keGJn3BZ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: strcpy.isra.0+0x14 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x14 (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x30 (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x4c (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x68 (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x84 (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0xa0 (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0xbc (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x14 (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x30 (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x4c (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x68 (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x84 (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0xa0 (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0xbc (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0xd8 (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x14 (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x30 (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x4c (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x68 (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x84 (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0xa0 (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0xbc (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

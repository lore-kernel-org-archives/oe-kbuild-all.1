Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABE61C695
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 02:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754878709; cv=none; b=BsEI/srZeb+jKA1DHlFHP70tPxNfex8Zf91XhClFFEhGc3N91+inn6lkwf/d/+xldLz9dqj4yhppqJGz/4f+wIL7SbPPYB5k9dVTlNfihd8WdWMD33SLEepZyYtXeMAwlumw8GaQ8VGJVw2/gWGr9Dj8k3woxVk4M68iuLmUbJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754878709; c=relaxed/simple;
	bh=HMcKDAPdQnpwOfItO6w+O/7f5pR1IGDgkJ5OfmaOqGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VBLhM2HMqXZonSPO9uErV+gQNI5UpznodBOI34rsmdcYRAmJzqILFZcm37AOwfUvIuyj7XlK/v1jjZbZ4aJDzeh65oPhKOb+GnT3biqSo3OlKLF0F5UNixAjmiDHIiC23qbgdIaREruxGVnsAqRGAlRxsIblc6PTvq1/PuLSQx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAh67qcU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAh67qcU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754878708; x=1786414708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HMcKDAPdQnpwOfItO6w+O/7f5pR1IGDgkJ5OfmaOqGo=;
  b=bAh67qcUiSEu8ak+hjQMG7bCcTFYF/phbQ2bTIK7X9l6lbMcOO90UwdM
   lElk/x7YmBnC46QbfOdzDp18LC8+vD0T6Wm+GreWSzC2msY+8fkOrXxGw
   rR4FuJgc+6pxDW9ZC8BQiTrL/hyMKp5zyFjjcwjpKmolsd79uWUUnpdp0
   rRNyY/spjEGh6dbjUFC7YThylpU3ur3p+xlxfmHtMDzf8uLUWNS/tsB3E
   3uBOe5/16g89MeOPDj26O0Zom04SmPumB2GdLKz7KGt2IBIGF7HRQQyz7
   aAYlzpWWuPd9VeYa05PQuDaiS/I4HiykIGE+mRRG4KkszChelgiwmaU2Z
   Q==;
X-CSE-ConnectionGUID: syaQPm9GRDSPzW9AVWuopQ==
X-CSE-MsgGUID: xoXLEUcRSXaLMnGYUp0VMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="59738443"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="59738443"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 19:18:27 -0700
X-CSE-ConnectionGUID: 7n6WlUVKQm6Xyt1r6rvQGw==
X-CSE-MsgGUID: qpdZ+bWPQWS+VITwlEh9ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166156584"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 10 Aug 2025 19:18:26 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulI7E-000303-0o;
	Mon, 11 Aug 2025 02:18:24 +0000
Date: Mon, 11 Aug 2025 04:18:11 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 160/160]
 drivers/mtd/nand/raw/nand_hynix.o: warning: objtool:
 hynix_nand_init()+0x170f: unreachable instruction
Message-ID: <202508110451.VmgLf8YE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   bedb6d18b52181103d994f64bb72e010c793db29
commit: eda496b71ba25af137e1c3a28a89c6c77eb30397 [160/160] ANDROID: Reapply changes from previously skipped merge 'android12-5.10.223_r00'
config: x86_64-randconfig-2005-20250810 (https://download.01.org/0day-ci/archive/20250811/202508110451.VmgLf8YE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508110451.VmgLf8YE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508110451.VmgLf8YE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/nand_hynix.o: warning: objtool: hynix_nand_init()+0x170f: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

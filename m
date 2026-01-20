Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237F43E8C60
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768948562; cv=none; b=TVL5L3S7c4+vMKFYKyrSfnDY1/YnKueYScWyhZPdWeSwf5/MkxB8kpe0RMAabEbnbiRq3W3qaSbgWkTd4bOjPYDe+Pw3gJZK7ujkNano9ElHuhKkTk6t1ld5Qb0rcwztagZ5oieru+nEcDFYE2CexAXM9m6Q1KDXPHyNc1GZ2Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768948562; c=relaxed/simple;
	bh=bL6vkMploPYq382vNw+bkQishI+Ah873aw2UBNiZPVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KpSUTxLma+2MF6GCbhsch+cX2CG+sp2Uaao/uTd6kaipcaTHKJHZBtlFLkqczI7Z+Vw57Alr5yaWMaGVMZE47oQ/MtEZt5YdTEDhnd0FWoqe75KRLefyy7wAhi1tCPvjsPzY1bKeB/B5jqdsSdO68jSd09CFe76wQioDOYGay2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pqt4M84o; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pqt4M84o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768948561; x=1800484561;
  h=date:from:to:cc:subject:message-id;
  bh=bL6vkMploPYq382vNw+bkQishI+Ah873aw2UBNiZPVM=;
  b=Pqt4M84oSpsbeXqh3nOHridcIGyI0zJTIdd69ZzaZe+8Cnz10tenIDDW
   YIoHCnRMkE97cIHUwygGiT5AbFzV7hP7EgLAhvBEDpHZq6PDZdRFBADK8
   jTwOHwQqxL6eUeoZeevfGhpu8YWDJYw5DqWwoWr2Gj5NK/mQ0JWR4Pwko
   WFydqIuqvuwNBuabmm78dw8of8pmVDsPHKwocu+UlyyTLg4TsBEcjZeSg
   dw7vrIJPE68g1MyoHcH5G1ZphI6jpK7lAc7qpK/omGPftzz07KGq4wRxd
   x1xycvsgPCDVc4Xvm1Ty/pjkBaZM1nLzCqyYOxMplwWO1sBPMXQd9ZPNs
   g==;
X-CSE-ConnectionGUID: jzXLNe7sTcS3Vqww8HKtgw==
X-CSE-MsgGUID: K41LnmDVSji9tEehEw4A1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70072112"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70072112"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 14:35:59 -0800
X-CSE-ConnectionGUID: Say5P49dTwCtGw5odWb43A==
X-CSE-MsgGUID: h+dWhRrMTuOFY+2NUhSmig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="206673396"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jan 2026 14:35:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viKKJ-00000000Pdj-3iux;
	Tue, 20 Jan 2026 22:35:55 +0000
Date: Wed, 21 Jan 2026 06:35:49 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mikulas Patocka <mpatocka@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>
Subject: [linux-next:master 7328/8302] WARNING: modpost:
 drivers/md/dm-verity: section mismatch in reference: dm_verity_init+0x30
 (section: .init.text) -> dm_verity_verify_sig_exit (section: .exit.text)
Message-ID: <202601210645.11u5Myme-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   053966c344dbd346e71305f530e91ea77916189f
commit: 033724b1c627885aed049f775e4b10583d895af6 [7328/8302] dm-verity: add dm-verity keyring
config: sparc64-randconfig-002-20260121 (https://download.01.org/0day-ci/archive/20260121/202601210645.11u5Myme-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210645.11u5Myme-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210645.11u5Myme-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/md/dm-verity: section mismatch in reference: dm_verity_init+0x30 (section: .init.text) -> dm_verity_verify_sig_exit (section: .exit.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

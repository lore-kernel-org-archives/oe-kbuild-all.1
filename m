Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE48436351
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607678; cv=none; b=I1Hw7BFthGdlcNig7XrmAwzjSEXMpj1U8pAMBNOkM0mRQeDbpIqdbC3cpfjLrGgTDAr6lNCdiOI/V7ynHHDSCEdImPZLDQVZ+e4aWVXJuKQXzS8eWjzYBaUH/jDRyszyqhmHTIIAZ5zEg5Ad/g+FAKFFjqx+V/k0fOMddwdLzX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607678; c=relaxed/simple;
	bh=+0LAfOIhScKu3dGyWVLjrLnFlEwNv5E15Fzus1VIdBs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LIrYUlga1Bs2NAenS4F8mm0OFNuGBwmety/BD+lG7AufIhrC4/9v+sqCy8aGnqXDlJFy3XtYTb+0M6RKDEZ7p91R32Vh9lmNgKQmmgVgHbhFRPp2F1qpPO8c2GgpWvVEqWG6jkEuIEn0ahIeJLkijbEaRhXx2yikjRLITaeUrg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOZKd5JM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOZKd5JM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781607678; x=1813143678;
  h=date:from:to:cc:subject:message-id;
  bh=+0LAfOIhScKu3dGyWVLjrLnFlEwNv5E15Fzus1VIdBs=;
  b=gOZKd5JM4Dc03xMYe8fIBtFIrT0Ve0upQyYOz/I/Y2ehBIJ+FPIOEnQw
   WQnZU4/3+HY5cNPOQ0NrByqKCOt76skedqTze8k8KeLcSIBBjVgHaA5QS
   /X25g8lrc24LvKrINqx+Ghq5CIUFM9XDhB+hPM4S8mYiE2APeAcsfN8g+
   xPTHsO70mhSgt5n6UGe64ykmyqCQNBDrL08+TIdUAAegmeW0JZmeeV3/E
   0Dy/5jV5RUMsxU94+Se8pM+lr+BXjqVeUo/4OZUH14/fzmE/ZaAIw7rDp
   Q9OcjWf8eZ8Q4s8gQJa369oyoXtCD+FdUid4/T+4XOLsXEFTN5di1bmn8
   g==;
X-CSE-ConnectionGUID: fogVenETR26m2H7pkc0iWg==
X-CSE-MsgGUID: DS5cnUuuQRCluqN9OfjwPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86007314"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="86007314"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:01:14 -0700
X-CSE-ConnectionGUID: mhhyBZ9oTD+IG7powFi2dQ==
X-CSE-MsgGUID: DEZ2JjTUQ8CUi/R/kjO2Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="249635388"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jun 2026 04:01:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZRXZ-00000000T4g-2UDO;
	Tue, 16 Jun 2026 11:01:09 +0000
Date: Tue, 16 Jun 2026 19:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-main 162/162]
 utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202606161810.xxDMCDVA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-main
head:   5c1d29f589046df832c7a303b9df3afd038366df
commit: cf51e779d127f836cdea7b713dab5df2af4544d1 [162/162] firmware: add r3mini phy firmware
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260616/202606161810.xxDMCDVA-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161810.xxDMCDVA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161810.xxDMCDVA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C999013AA2A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 06:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720162562; cv=none; b=Xvc3r3Z+4cS8Bku3dil/QiSo4N28us8M5wltSWTn/KLY88QM8rlRMBcdhSlavE5mmLSB5VXhujQUEDuZkdbjtpFLqmjJRM4zGW/xlpvF3ZUCV7KAQt4F4Q+dlLiCrVPFZkOEEwPHoC/Jw+S/VtZljjKvUNusZJi7NgEkGub7tS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720162562; c=relaxed/simple;
	bh=p6OlIpCkEU2HE+XUOMWm0l0t1pKKxBTzcT5dMzT32cE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kv2iEKjMS6qqacPY+Zru/3tcL9O0vgK3TnA454BzlrcF/ux3c5zBC7eTYxDFgxJesc5C49nkktHdB7JV/bRDeQGNY8REz3FNxhPvGpdN6zq0TzqtDnxCU9CAXjr2Yhh/kcNOLu8oXraaLJ/pO6rzFtoZ6YSseoY+UGNqfrYi93Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PpGYncCV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PpGYncCV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720162560; x=1751698560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p6OlIpCkEU2HE+XUOMWm0l0t1pKKxBTzcT5dMzT32cE=;
  b=PpGYncCV0Sz+ZvLT7OZDuTWLTbQnnxRQys0QQmpWxKdalxL6J0aD4PQR
   uCbaK6EfJD7PD6DG9GZ4jK+fYIokmkV0ulyW5RohMeOoMSHAdJV02d2JP
   fonWjcPWED6Yfd1W6uiw1px4Lb61GEOcHDKwd1IvtXaX2ycuGOxGuwu4i
   sOQmYhw6wsAaI54NfNsjwLeSt72+hsQuWdasHx/TAXtL/p5Slacdh/NRd
   QTz8WSvFgAHpWiS1MnCnj4FNkHVaElW9Hjue5lLnoNNbdmCTfQGqvnnsM
   4LbpNWdkO4Z+IHRHWgDldRW02h/792EZbZM4YVhjomN1KIWzFi7ZFaR5D
   A==;
X-CSE-ConnectionGUID: Gbux7Jz+SIyOvelfGDH1Bw==
X-CSE-MsgGUID: SafDU5xHTMiQDunGTbGWnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17656851"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="17656851"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 23:56:00 -0700
X-CSE-ConnectionGUID: VRsrOe6MQAy3H/NlyADk7g==
X-CSE-MsgGUID: RWT+cnn8RSqZ3ygKoqovWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="47222262"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Jul 2024 23:55:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPcrN-000S3I-07;
	Fri, 05 Jul 2024 06:55:57 +0000
Date: Fri, 5 Jul 2024 14:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.10-rc 35/35]
 firmware/mediatek/mt7996/mt7996_dsp.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202407051433.wZ4Db75V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.10-rc
head:   16e22ff9e6052ffcab043b33e1ed0de08cdd2c64
commit: 16e22ff9e6052ffcab043b33e1ed0de08cdd2c64 [35/35] firmware: mt76: add testing firmware for mt7996 2-3-3 variant
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240705/202407051433.wZ4Db75V-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051433.wZ4Db75V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051433.wZ4Db75V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> firmware/mediatek/mt7996/mt7996_dsp.bin: warning: ignored by one of the .gitignore files
>> firmware/mediatek/mt7996/mt7996_eeprom_233.bin: warning: ignored by one of the .gitignore files
>> firmware/mediatek/mt7996/mt7996_rom_patch_233.bin: warning: ignored by one of the .gitignore files
>> firmware/mediatek/mt7996/mt7996_wa_233.bin: warning: ignored by one of the .gitignore files
>> firmware/mediatek/mt7996/mt7996_wm_233.bin: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

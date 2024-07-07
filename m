Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A748DD2FA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 12:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720353653; cv=none; b=rIt6027DIwZFc2A7FLUzRFxtltfmricEiwrQw270sBlCXYH0EexzWvBZIA30YeTLWfoqKlKbU8GrrwTzTBRN7yvvTHOuIDcs1obLVr3AmLT/+z7OVEi3wgMRn6mytIruVhjO9REJXsTchNcVdXhQ41LU8Ix/JUIO6SwVXZpLgz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720353653; c=relaxed/simple;
	bh=CLB8ct6SllSkTSnnL5TwvhKh+rGg341Hen1haQWs86o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l3RFIh5vK/oH87BpWTIxoO8EVPzbHU00QonaU1UmtyYryxmE/JVTgrcJjWrEoC6lMsayGL9Xk/b25LEGfGRVcwW5q1h+kgMS503Mgc0PlVHkLSyKRycuR1aDOs1NcQXw+QNEf/O8yG4sw5+wro3G9iIB+ZioJp9FajEso2SqzrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8prhKaj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8prhKaj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720353651; x=1751889651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CLB8ct6SllSkTSnnL5TwvhKh+rGg341Hen1haQWs86o=;
  b=V8prhKaj+jawkDvuCC2CwcEK+6L7CvGDdvSR9WTWTPvde9xRywYY06h1
   X3t3IeEv1I8K2tSIgbLHbJix0V/X+uL9hOY33cDn+JrTKCfsKQFNt4HlP
   a3j+gWFPYT1GoeimnPN1zHWuUYJ56WNP7GLjmhDgdNQ72QCLgg9qUTtU4
   SxOZvmKk53y317czscTDaXFLWuYQUDYiuqOhzhC9on/vTpJ3p9gP+xq0j
   Y+ouneebaIRHj2vTV1KfMfIgv/8//9yuNIqM5KIB4EseimwWbb1G1tVw6
   gpQFAiH9wm028GReY6ht5cMBSi7YcBrv6V4eR3eDq/y03rw/+bN3lufV5
   A==;
X-CSE-ConnectionGUID: 8d4jbWEJQQOekKd88LUieQ==
X-CSE-MsgGUID: 6nGgJksJRVaZZUicp7/dbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17698596"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="17698596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 05:00:50 -0700
X-CSE-ConnectionGUID: xw6uLJ66StKKkJrZIEsEjQ==
X-CSE-MsgGUID: TQdVzHPLTA6tEcACn3svvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="47023386"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Jul 2024 05:00:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQQZU-000Uv0-0H;
	Sun, 07 Jul 2024 12:00:48 +0000
Date: Sun, 7 Jul 2024 20:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.10-rc 35/35]
 utils/firmware/mediatek/mt7996/mt7996_eeprom_233.bin: warning: ignored by
 one of the .gitignore files
Message-ID: <202407071933.nUk3kAIG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.10-rc
head:   d334437ceedbc3fadc64c14269ec3c777e06e29e
commit: d334437ceedbc3fadc64c14269ec3c777e06e29e [35/35] firmware: mt76: add testing firmware for mt7996 2-3-3 variant
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240707/202407071933.nUk3kAIG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071933.nUk3kAIG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407071933.nUk3kAIG-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   utils/firmware/mediatek/mt7996/mt7996_dsp.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7996/mt7996_eeprom_233.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7996/mt7996_rom_patch_233.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7996/mt7996_wa_233.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7996/mt7996_wm_233.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0986378F39
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 19:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737918371; cv=none; b=rD/+ujsnRneQ7mhUxlftWLO10hlmBx0Yk4RGxB3fbH8M30aZrviBmL6mSWIHyb57Evos8EiUzVwptCbQ5OrIRwT8YA/CF19+HtkVjyMVWDGYUO/qfuPBMmx5tcEnV2GUWTQqQ2H1YaQB4/lG25H62V5oKp4g+ymmUnRRvR5n/4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737918371; c=relaxed/simple;
	bh=WNi8Hl0wOnEAsqhUc+4zYmpylCzFuw+VH0maHtFJc2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SSdk37jXaXNAjzAIgZ9GwaeWWdcMINIpNeRItBZYzeIK8NrOPUGg3+x5VDoupDJmc7Ukc5yXfCAddPzSmrTDCW1sDEYtdg10lHEP2fpsCBFbQIt7oduZMIPKCQ0rPBCVwyRSdN4VncYdWTfZ1wD9QBgShT+BZPGHw3JaVudGUAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwfubZo5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwfubZo5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737918369; x=1769454369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WNi8Hl0wOnEAsqhUc+4zYmpylCzFuw+VH0maHtFJc2E=;
  b=nwfubZo52QCqAK+tv1zGWhrWciuci0fIUID/+9wUGcbB3s17A9ZuMIiJ
   hl7L+fBcFWomS1SCxjcRkltA1O/n/HkOQetzWrD8Wo5gCRRok4qIuGPLw
   h7rlK4ALN1vSq8E7RoqWpRWi6KwRj8rDXzl2ge/wSeFJa0hsoA8HTQSbE
   I6oo9JOGYEVrPKSYZ3DcSGHvrYfbCsj9LLbDPPJZS5owlR3d1eIpN20rA
   oSkW9TnUwKZDWYwXa5GdrA+3cwSH5PAzfbo63yCl7XWTSD2O6N1zFjb5o
   ucBVABkuXkKdCsCYR/7CnucoWY66wtqS5dx6z3l11QxmxcglRh87VV4uX
   g==;
X-CSE-ConnectionGUID: s5onLvc4TjmFYbI4d2F82A==
X-CSE-MsgGUID: PtLcyO24R+GukdX8Lnnj4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="48887970"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="48887970"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 11:06:08 -0800
X-CSE-ConnectionGUID: EGVfgSj+Q5mhTIQ9fpuspA==
X-CSE-MsgGUID: hXNPewCFQD+XOw6VIP6EKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139105947"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jan 2025 11:06:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tc7xN-000ffJ-0q;
	Sun, 26 Jan 2025 19:06:05 +0000
Date: Mon, 27 Jan 2025 03:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-rc 84/84]
 utils/firmware/zjy-ips130-v20.bin: warning: ignored by one of the .gitignore
 files
Message-ID: <202501270309.HZ930VOd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-rc
head:   3b2fa67fead93cfb923848e5ee91ae08ba6e292c
commit: 3b2fa67fead93cfb923848e5ee91ae08ba6e292c [84/84] firmware: add daniels firmware for spi-display
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250127/202501270309.HZ930VOd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501270309.HZ930VOd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501270309.HZ930VOd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .github/workflows/build.yml: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files
   utils/firmware/mediatek/mt7996/mt7996_dsp.bin: warning: ignored by one of the .gitignore files
   utils/firmware/mediatek/mt7996/mt7996_eeprom_233.bin: warning: ignored by one of the .gitignore files
   utils/firmware/mediatek/mt7996/mt7996_rom_patch_233.bin: warning: ignored by one of the .gitignore files
   utils/firmware/mediatek/mt7996/mt7996_wa_233.bin: warning: ignored by one of the .gitignore files
   utils/firmware/mediatek/mt7996/mt7996_wm_233.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/zjy-ips130-v20.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

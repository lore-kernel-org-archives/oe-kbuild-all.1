Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BEB51FCDA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 19:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809282; cv=none; b=MIkA2+DoOsRJoC5Zf7RtM8ztcN/gArSquep//4GX2xkgliE56sWA4UUfw0PiDNOQMgh1B1AdyOAPYXAFKP5k4+XqjTG3JgAFtFtuSPayq2pvhsELEPlAF8VzV4OiKOQwfQogUlU48KAYNF71MpXhZnH3I9fKhLL/u6NHvmHxmFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809282; c=relaxed/simple;
	bh=kcy0McB0HYQo2AdovmFRDpqoIdaGSCV7N+3h27bAi28=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WjInjh4fTztk8Vu+zFTYPDn7fWuG/I774JhPgB4vS//Dr0SXHn2/as8+q3aeeMx2CGbh16+sPPcSC1+CLm1IrF/GXut59hybkMCQTEcuuTa3v4cpHCutpHWCCIqwNJ1JWIp3iG1716PybnzthU+vf+gnLCqyYPYTaMMWCYw+fP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QP0zJXgh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QP0zJXgh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788809280; x=1820345280;
  h=date:from:to:cc:subject:message-id;
  bh=kcy0McB0HYQo2AdovmFRDpqoIdaGSCV7N+3h27bAi28=;
  b=QP0zJXghMwkTsBATM7S9JGGEXUb3R150de9i7QzAuFdNlczmbvXmhy+w
   F6da/4W6jG1L+0V/c6mS7awLo1hRWAZ/oe+lcfatVrB0Ks3PPkJamLpo4
   IMo2HiPAPzVb+1KdwieZtPvi8IEbTflK/+3MfJ4fjbUsu+C6IWWCTSEfq
   Wi3Bdb8zx5I4AHM8uzv9v6aKaJldiEk6Ap04yoTYJSR2JUXpUhY75dyZE
   ILIsYOjbTnLtmWZiRFI+6iKSnhl/wP0NVeT+42h5t8JbYJiwHtQGvpMGJ
   l9OcmkAbodJD+RjtI2FxKlYmwh+aQUp2KN4oKb+Qxvsqcq8Yv12lMtuM3
   Q==;
X-CSE-ConnectionGUID: 1BP/91V0RySnI1xPxGmwfQ==
X-CSE-MsgGUID: UIJcKAH7SPCwIh9FrVo6NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89230524"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="89230524"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 12:28:00 -0700
X-CSE-ConnectionGUID: VxxFFP/HTDm0jWHspii5gg==
X-CSE-MsgGUID: LO53nIeKSfi3USF0A5EIng==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Sep 2026 12:27:59 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3f0W-000000001HT-33KR;
	Mon, 07 Sep 2026 19:27:56 +0000
Date: Tue, 08 Sep 2026 03:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-libstub-native-utf16 7/9]
 drivers/firmware/efi/libstub/vsprintf.c:251:5: warning: no previous prototype
 for 'efi_vsnprintf'
Message-ID: <202609080354.G5E92knX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-libstub-native-utf16
head:   c23f326a96b5293512720f389c597f967132c334
commit: b556b4a52f0a9b57d906dbb3bd63cebe6159e3e7 [7/9] efi/libstub: Output UTF-16 directly from vsnprintf()
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260908/202609080354.G5E92knX-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080354.G5E92knX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080354.G5E92knX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/vsprintf.c:251:5: warning: no previous prototype for 'efi_vsnprintf' [-Wmissing-prototypes]
     251 | int efi_vsnprintf(efi_char16_t *buf, size_t size, const char *fmt, va_list ap,
         |     ^~~~~~~~~~~~~


vim +/efi_vsnprintf +251 drivers/firmware/efi/libstub/vsprintf.c

   250	
 > 251	int efi_vsnprintf(efi_char16_t *buf, size_t size, const char *fmt, va_list ap,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

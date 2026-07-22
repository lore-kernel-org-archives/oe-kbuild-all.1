Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E3036197A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 16:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736618; cv=none; b=sjcFVQxDQiHYjZqIqHvmP6diLcBtQvYbGGDnUHlYuzhEg4hmMKUmBQ4PUyx9Lc99zrCswFdf2tRjPBNQHThYBb9AORFJWA74SeeTZWyMSTrO+qXhoG89rzc4irxqubViX/gSrFAkSOU5gAn0HRZUqecnmk3VZFEUt8vz2SOKdNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736618; c=relaxed/simple;
	bh=fA+flFmVgry8HkgquauoM01B7765G41yPPdSa0rN5U8=;
	h=Date:From:Cc:Subject:Message-ID; b=F9jlS5+Iw7wLgEp9wqOHrhdp0dVQgeTV6IUf0ATzBXe0iKLns4NByYtZhP3OE7FoxSmbXvz8JNWWur8+Gt5wPWiMR+x/+LNwzSK2NRJSMe8o0yOcF+8JZYL5HWow9akSl6bHsCgkyt9Cn8mPfrBYj3rj6WY83KBoyxBZ5UDdo0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WiiVcYKV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WiiVcYKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784736616; x=1816272616;
  h=date:from:cc:subject:message-id;
  bh=fA+flFmVgry8HkgquauoM01B7765G41yPPdSa0rN5U8=;
  b=WiiVcYKVaUQywGrBBMLypePPFV9QjJg4X9hI43tkwDO+DAY/6RNUHzZ9
   W1m0Sa7fIxKQ441092+JURtll5YCzzEc1dzYUiwJb8CwOkqlcL/nDwbKt
   F55rehzq0DMEqbSjkCwr5EG6dbKiMpjCM4SjeGdAE7RucL7YJv1UfkndN
   E+25QyGTH3pWFm2//usdzfhZI3UZ5Xiy8mtscDRRE43udLKKDu0tzvvH5
   4Wqk9tQFEZaH4w2pba9mmNsQpwtL+3jEuxma/dvkqDFdZLkHPEZxTGv8C
   dNT7h9dmC56bDWrgDoqgvCknoc7xWDRiTzTUje7T95tis6y7dWyvdpZ7j
   A==;
X-CSE-ConnectionGUID: MPzymgOPTmqewOIhXf2CbQ==
X-CSE-MsgGUID: fLgsUdl0T5Wr+TDKqGJ4Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96892452"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="96892452"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 09:10:11 -0700
X-CSE-ConnectionGUID: bpXjl+HdTy+X7gUuSKgPIg==
X-CSE-MsgGUID: SBhivl1PRiiwnnghdPqtsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="254219161"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jul 2026 09:10:10 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmZWJ-000000000Vm-3mby;
	Wed, 22 Jul 2026 16:10:07 +0000
Date: Wed, 22 Jul 2026 18:09:24 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.18/linux 1/1] kismet: WARNING: unmet direct
 dependencies detected for I2C_K1 when selected by MFD_SPACEMIT_P1
Message-ID: <202607221801.IKZQx6Rp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   af406d75818b912a1b72efa75a20f8bf3e9a3f01
commit: 6fc5d415c10e98ac1b31dd1d5653443e691cdcff [1/1] mfd: simple-mfd-i2c: Add SpacemiT P1 support
config: sh-kismet-CONFIG_I2C_K1-CONFIG_MFD_SPACEMIT_P1-0-0 (https://download.01.org/0day-ci/archive/20260722/202607221801.IKZQx6Rp-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260722/202607221801.IKZQx6Rp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6fc5d415c10e ("mfd: simple-mfd-i2c: Add SpacemiT P1 support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607221801.IKZQx6Rp-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_K1 when selected by MFD_SPACEMIT_P1
   WARNING: unmet direct dependencies detected for I2C_K1
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
     Selected by [y]:
     - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

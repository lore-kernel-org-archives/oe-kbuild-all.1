Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7B41F0991
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763218818; cv=none; b=D1jpd9A8LrcL9x2lGAec8iOwHqobaJZlK9OR/MFlMxw9e5Uj/PVCXPyoP6nkZhW7ubW4FoEWqAEQIN22197Vhv/pSbtzi8I2g+1GFWuMTtP8IL0Bfu9KT/BlKNIWGaAtuYP5FeHCVvcF99cV9+iCz5FdTN8MIxbWlv9QA87q5Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763218818; c=relaxed/simple;
	bh=MBg9N4vBZEHV9pMf0hrBYliOZvCnhucEwn0pzoyuAvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OwbD/OcYmw7GS4vhHv+gIaPdPS92JN8yJsb+uwojtKJFymR3Yzr1P5vzuN/4GW7rjppp9DbQM7Q9wbfw4pe2SBOP/e9k5VnFgYMcvE3CEr1BBj08k/n6L6+NqopuKEr8GJZNxC4JZ1dwtsxmfAusx9K9WAl+pC6e4EN5lOp4c+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/1HPc9N; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/1HPc9N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763218816; x=1794754816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MBg9N4vBZEHV9pMf0hrBYliOZvCnhucEwn0pzoyuAvI=;
  b=j/1HPc9Ni4ll9nK+XgygZ1FFTKzxllC5dItjTjgpGc1WoU6Ws5ZlF2WX
   TCaEk6sZC6zOgLwjEeXP0/ArQmgfSN8rAWUZXkI4vKGdkfzIqv+v04zc9
   KuSR6bZFxUAcMbQwQ5k0HJ7lDOszhU7BdhIvT5oRXcs/T6l40X9tmSDeF
   6rG0c33UhtElMWiTGrbCeMp6JbzQRQ9eCLvlCAkfuPcHBUTXy/PTdEXLO
   +3q6Hk2sY9DYu93zkDwZoA+TQacdVcm4pd4lNq4jsUyo9AjIiyYZU1gsA
   tPa5MSyUThuG7B4NpswC1iseJcg5/QLNiB+KTaFOkJhebUEgpJEQ/A3/P
   Q==;
X-CSE-ConnectionGUID: D4E2jO6bRMaD8YTDKGPFHg==
X-CSE-MsgGUID: mefo8nflQkC2Q/YG3jU+Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="82916809"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="82916809"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 07:00:15 -0800
X-CSE-ConnectionGUID: YQv/PkTiR/aWASLLrGILkA==
X-CSE-MsgGUID: 9AhSyvYRT1eiJMuB2ilszg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Nov 2025 07:00:14 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKHl6-00082s-20;
	Sat, 15 Nov 2025 15:00:12 +0000
Date: Sat, 15 Nov 2025 22:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-crypto 130/132]
 utils/firmware/inside-secure/eip197_minifw/ifpp.bin: warning: ignored by one
 of the .gitignore files
Message-ID: <202511152219.nlYKClcx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-crypto
head:   38c2790e1ccd2fce1448106477bd91ff9fe4206d
commit: 00882be8fc8285ee9b1b7f71788166bf7b798fb5 [130/132] add eip minifw
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251115/202511152219.nlYKClcx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511152219.nlYKClcx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511152219.nlYKClcx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .github/workflows/build.yml: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/inside-secure/eip197_minifw/ifpp.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/inside-secure/eip197_minifw/ipue.bin: warning: ignored by one of the .gitignore files
   utils/firmware/mediatek/mt7987/i2p5ge-phy-DSPBitTb.bin: warning: ignored by one of the .gitignore files
   utils/firmware/mediatek/mt7987/i2p5ge-phy-pmb.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

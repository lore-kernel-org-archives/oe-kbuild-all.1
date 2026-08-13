Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C693C5526
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 12:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623091; cv=none; b=iSnt/1COg4hB/U3p1xB0sWaYZSDwXjcQs8f+2xbEZR09dBcidjj6mSGMV7VHZuIZiH3WJt+fiC8jRfunoAe1tXmy8eRx1MIEAcIggBaXDj5d8E4+nB8MFvUf49CK14E7y4reO7ZRpbUzAd1piYtejUzo+davAhxFIXss/D4YI4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623091; c=relaxed/simple;
	bh=EZogI6MQTh71DInDiCzmynGycRn3ETSVNt97Pk97kS8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ncOvAFpZvcO7S67xD3eYtV2yoM9AlKNxNe/WdVtkQUq/guCcqKovC3B3EUIdtuKSI/bN/+ShHxULDm8p9OGzOredLAL4AeG0ZtE06UI2q/3u3YhN/2Kg1++CQpJNh5AocTmHUScipCxz5WhDR6HDor5Hb26p/ZVQjrrMEOhkTgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICYYE28A; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICYYE28A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786623090; x=1818159090;
  h=date:from:to:cc:subject:message-id;
  bh=EZogI6MQTh71DInDiCzmynGycRn3ETSVNt97Pk97kS8=;
  b=ICYYE28AyltzqvFkr6HDwe/DHRBvMk18P3V5cStLN5QHaIYRnOgvzn+A
   w4ZK5+CWnly/S34FtMZ3ocW0k1xcfoB3XaWk+r27mkePGRSz8KgcJU4LZ
   rFPUuodSHlct65RhEn0il0lPepGnSke8ZqLYUBgbJgIX3WiOUTEvrFNRz
   lzqr+AV2Fr6IdA9Eu7j0HHJZ5O3Bj9BhWybiXcYOZUrJypXf+vTwNi0vM
   DceepzZEoLXhGeYGWUkF9gtZp/K3xXF0pdDe9tJvbnDrX2zqwtUw7oVTv
   i3FpKSkd9JRUWpvCuoFgCXDN79yZ//Y9Rvj1AZtwuvUhfxGDxjR0YO3LI
   Q==;
X-CSE-ConnectionGUID: sjtK5I6tQr+xJLMcIbxmAQ==
X-CSE-MsgGUID: sOouox7MRfe6MNNgvTFuTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87216605"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87216605"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 05:11:27 -0700
X-CSE-ConnectionGUID: n9OvJ6F3R2alV5hsmYl58Q==
X-CSE-MsgGUID: ZJYD9o+ESaCpnc1H2gHvlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="259681781"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Aug 2026 05:11:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuUHK-00000000U0Q-3aVi;
	Thu, 13 Aug 2026 12:11:22 +0000
Date: Thu, 13 Aug 2026 20:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 194/194]
 utils/firmware/aeonsemi/as21x1x_fw_1.8.5.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202608132058.UKCol4Eh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   39718c30214036e7ff44593d4273e5e5ee612efc
commit: 2f88714a2643dd354725ff32585ad8591f53ee0c [194/194] firmware: add aeonsemi firmware
config: sh-defconfig (https://download.01.org/0day-ci/archive/20260813/202608132058.UKCol4Eh-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608132058.UKCol4Eh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608132058.UKCol4Eh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/aeonsemi/as21x1x_fw_1.8.5.bin: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw_1.9.1.bin: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw_1.9.2.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

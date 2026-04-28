Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636784418D8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 14:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777385705; cv=none; b=V/zvjHjwO5TpIznIl9nDUoftEWxHgl8Z+FBUCf7tQ1jGcMAN4YCSjGmxK+5UCY1hA1wN9yWFOicXUovF7NGgaNmkN7GpJ8u9pcCO9g8Or4lDvax90dUUDsigUE8zo5e25dFisNLOrY7upLRp2slSgVifzPUjFsn2dIRphi7AcZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777385705; c=relaxed/simple;
	bh=ySMpTu1mxVmpMfaFQkXy/rDuiy6zpmxZSc7V4TobLXc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z33gbYKEZLqSGWD5K18fGGCnYlpZLYFFPxLhJjP1YpLKzAltQ7azARBKh7fnzLztcEt53H2j7d0tAWdDugPnoCIYIaV3IlyJlSjke4jjowuzgdTBjiYqU7VcSqZK2psqk3zbrnlFE8F3EWphdTX08PGHVyvBc+wlewTd31ayOgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQih+GPf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQih+GPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777385703; x=1808921703;
  h=date:from:to:cc:subject:message-id;
  bh=ySMpTu1mxVmpMfaFQkXy/rDuiy6zpmxZSc7V4TobLXc=;
  b=RQih+GPf2N+kbXf5BvxpZ86rFCcpzs7X0MQJeHxQbsPhPynxCOfbgD9V
   jUJB0rLO2svH14vS3NogOqF8HO7bSdVNNoeZW6562Drzy8Vf4qEOcaBrE
   KzG6ZtPMR5MWLvjk9Tbk70OcJwHj8gQz+FleIzo1VY7krHD8l4Z2k7DCE
   dN81ozmRi0rby1b5nu7n0pHWG15GZhWzaYwT6GYotLBnK4/bd/0UE+E7Z
   aEhrmrOPIAmmnO0u6dfqavXBppWNfVj35tEIF3d2BAbU2jUkQs2nH6q0e
   dXyF9cm+rUWsbkmrLfnVBagVjhfn6go1szLc+z2EuCz4IqGNaduQNgAey
   Q==;
X-CSE-ConnectionGUID: H3kRWOHRReaLuTrmBBqSQA==
X-CSE-MsgGUID: 1V/YLTQzSCGIi44SafPbHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78278766"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="78278766"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 07:15:01 -0700
X-CSE-ConnectionGUID: oK0qB4LKRGi5H3xd63jNdw==
X-CSE-MsgGUID: Dy9R9YaVRkilf67CkEUSJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="229394487"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Apr 2026 07:15:00 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHjDF-000000009sK-2zUy;
	Tue, 28 Apr 2026 14:14:57 +0000
Date: Tue, 28 Apr 2026 22:14:28 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-main 154/154]
 utils/firmware/aeonsemi/as21x1x_fw_1.8.5.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202604282257.7Qkv8NCj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-main
head:   da4f80ab98a0c1de0156e36bd738490a98e81d8e
commit: cc03d72bf93392f09e7f68dc26ecd80c4712b903 [154/154] firmware: as21: add different firmware-files for easier access
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260428/202604282257.7Qkv8NCj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604282257.7Qkv8NCj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604282257.7Qkv8NCj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .github/workflows/build.yml: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/aeonsemi/as21x1x_fw_1.8.5.bin: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw_1.9.1.bin: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw_1.9.2.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files
   utils/firmware/mediatek/mt7987/i2p5ge-phy-DSPBitTb.bin: warning: ignored by one of the .gitignore files
   utils/firmware/mediatek/mt7987/i2p5ge-phy-pmb.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

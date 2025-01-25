Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0AB1DFF7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 03:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737774068; cv=none; b=c0N3PSRQ4vZIAo84vOSnr4Ee7jaY8N23HC7q/UtvJO98IPivzLA4D3Pt4W1KEusg9Je77J9ouwsQxOZ8G6jepvpoSUwzSLRmRGnbufqEdvWdTsnNAp1uayStXAT8qojdZI5GIM4xtDeIalKm0gFkwxA0ZvEEj4QUVUTkHqon92k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737774068; c=relaxed/simple;
	bh=Bazbx0lPfK08Cy+TcG0zBZJJtMEnJXh2O2qIm54R1PE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pUvl+zXsLK3SFxq9l37dz1mEY2MPAWr62Ow4SyTjpvhMy3VBVrNfD0yA797OWALgqTFyEFM/C7L8lLka6xcXCNw2ucNljPZo6k6bDHF7gZSEi3xeLUdfYdB/PvxjVCFOtnayjHVtlX4DI90cvKrP+H4f/mbU2oZDs63Ck3j2cus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMiufgNO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMiufgNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737774067; x=1769310067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bazbx0lPfK08Cy+TcG0zBZJJtMEnJXh2O2qIm54R1PE=;
  b=ZMiufgNO2fiN/c61hSnFsQ6meO4rjK9qQGSLLgwEb7Xbv0sYLXnKOALE
   IZkTWe6iKGX7bi3+zd2A3spvL/XE1Q6A5+b46aWdyNI14fYlLfx7aLKaB
   aaNx/vBkL0D2Aft588wTReiyZ6rpKdHTL4leFKwHw1Nrdga5JCs2HN5xl
   SQ3hbcV37P4+abWWfgypqYEbEliL4ahh8ZtdNUxPkZ5kq+Yl7lQH+4XAr
   DuaIyQY0p/OFDPtbUafyIh1RdTHb/BnD2D/wOAv4RzzerkXdicyvHzGDr
   Lb84RUvuXNl6nGohNvwWUCauGPlXhR+4wvZtf667IHjrrBen5oPjpsxMU
   Q==;
X-CSE-ConnectionGUID: y6QUBF3dSNiWPZwLKFcb4g==
X-CSE-MsgGUID: aUnIa8/GRRmzdhuTWRMOfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38486941"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="38486941"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 19:01:06 -0800
X-CSE-ConnectionGUID: XFcRL63/TISB/GowEhfpJA==
X-CSE-MsgGUID: nLFYgCTvRMitKDngFB/nVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="108052378"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Jan 2025 19:01:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbWPv-000dPr-17;
	Sat, 25 Jan 2025 03:01:03 +0000
Date: Sat, 25 Jan 2025 11:01:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1414/1414] kismet: WARNING: unmet
 direct dependencies detected for SPI_PHYTIUM when selected by
 SPI_PHYTIUM_PLAT
Message-ID: <202501251001.ng3yamJ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   da51139d17e9d53d61a9877d9042e43b85d71ee1
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [1414/1414] spi: add phytium spi support
config: x86_64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PLAT-0-0 (https://download.01.org/0day-ci/archive/20250125/202501251001.ng3yamJ9-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250125/202501251001.ng3yamJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251001.ng3yamJ9-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PLAT
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PLAT [=y] && SPI [=y] && SPI_MASTER [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

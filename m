Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1061E5716
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 01:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737767940; cv=none; b=aqFFyLAKbOdNXNWcXGCoRY2Zj+Kc2KkzVqiJmXsqCCPQvPX2AvsZaEkFZK/cv3p63nl2uTn/lMAhe9iDwJCoIs0UD4bd8lM5PiWfrfl2aIIu02gtBXlJCu2sdChcBVuZon3COpiVudF5LBYelxoHYoI0tANMO6GzWg7YdyfTlX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737767940; c=relaxed/simple;
	bh=I/rSaoP3GOcaUx1CvLpGGHikEnjez1vIS2VZmWLos1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CGk7xvsOLeoHH1hm89gqEHJ/DfnCCIwA4pCFCwKLx5Gt6OnzKYgfO8rlCvCV9SUTmyvqvc6MtiKhzi6/fNXNVOYsMIjP29hXY/fOuFIkSIWlxo1AuDMSUmjnByY6IfesZjjGcjE1RV+TAA2vj87fwxUoxdmL2jnxQ7wdgS7625A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCk9kVkA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCk9kVkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737767938; x=1769303938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I/rSaoP3GOcaUx1CvLpGGHikEnjez1vIS2VZmWLos1c=;
  b=NCk9kVkAeNNMveSm+4BO6U3P5TW1KTRSlIwwbcxXmgyY2pnFHTC/Qs89
   s/XD+rGutko/k4+E6XJo/oUoI3StPw2rsYb46zmdZlyy6/MnczNEkVGqh
   GDGJOpxwWtXIK1eB1F8yKdoEon2TmgdAGL4/wRcgRquKyOYpKaCV39O1C
   0WPY/Oo3UlV3UYgRhsnBPu2tlmQidxw8TVZn8p4c5D1PdPmQgg4Y9Eqc8
   8cc/io8UQk0qBDcwanNkZA/u/Lsqho7oC24JEOhABS9RAzl3ieudZWXHw
   C/M4/Q4AovFwJxRjL1HTZEMMJXa/jLI78yt89bOZFPQci/1ZvdakwfqYd
   w==;
X-CSE-ConnectionGUID: nlxcJhx/SIaIbUA6OJX05w==
X-CSE-MsgGUID: kxsjAYnVQaiiGG0thwPPBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38483510"
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="38483510"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 17:18:57 -0800
X-CSE-ConnectionGUID: Pp9SEMDNQHakHaNglODSyw==
X-CSE-MsgGUID: HTNM5G7fRfGDIR9ugFXE6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="112940268"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Jan 2025 17:18:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbUp3-000dLP-36;
	Sat, 25 Jan 2025 01:18:53 +0000
Date: Sat, 25 Jan 2025 09:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1414/1414] kismet: WARNING: unmet
 direct dependencies detected for SPI_PHYTIUM when selected by
 SPI_PHYTIUM_PCI
Message-ID: <202501250926.0Py02eTR-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PCI-0-0 (https://download.01.org/0day-ci/archive/20250125/202501250926.0Py02eTR-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250125/202501250926.0Py02eTR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501250926.0Py02eTR-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PCI
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PCI [=y] && SPI [=y] && SPI_MASTER [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

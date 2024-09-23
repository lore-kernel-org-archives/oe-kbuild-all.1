Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B8ABE49
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 14:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727102792; cv=none; b=ThgRIyPafvYM5BuFDCy5HHJuD/0uXqe1tsa9pPeCQHdcel5ei3TI5bkzK0hmE0Ouk6x8vAXEbjHHO9HaknYeBc/TnVa2mkrUlJRqcamH2UGcsKi9GALy+wJbYyHaJWosG6YOcJ6XBcOZXMMY/oSYAmmZ4ZjK+PcrCu3BwEPJ5Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727102792; c=relaxed/simple;
	bh=3Ji5AEhHM9oHgJM5t/g+R7fN3F0matsIBolhtg/HuhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q6ZwhcIGsSNIWC/g+N+pH+xNFm2l/4gX1Yxe4+gipKmdolGbM9XI0qyDWeXJcEoVUj9ecucswJL/+0UjNDA8yF2LiMjNuv0AfCP2CNN5bwBRwlGxFBGsP0L/SKQbYSmyRI2W3h/Swqhj5C4IvoBqMvmQYuYYWQHIOdVQ4lfMYBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmWuwZbn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmWuwZbn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727102791; x=1758638791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Ji5AEhHM9oHgJM5t/g+R7fN3F0matsIBolhtg/HuhI=;
  b=kmWuwZbn0X4cMJtsNLKdZkWFMryA1tZdzWaGMg+pr15XJt1iEI7k+roH
   NQ6pZoF0eLiVV5tw120qdGICfIFmeEofRatuqKKshdLICh49GzPUAt5QL
   Q1PlTb9/Yq51JoTAmYH6yp0JOxdKeZu/nZAcemkFadVSmcnSySSyy8bGS
   3IcyF1v0967jQBTnzrjKjjdHKaQbqikOT6xHMa4Q/gKfAZtquQ7CJSiQe
   wUf+RSH7ULnJ+IFZaUUV81v6uDt/fkhQDa7wbnhRz39hO4wJTaS1ryGjP
   t2ah9jTzucfwwqH4JrxHINF4vesjjx3zYqFIzVC9oDiBBsNiFu4tTRS6O
   Q==;
X-CSE-ConnectionGUID: vfkmvsVXRdavEmIUdNuLig==
X-CSE-MsgGUID: pD5FKpUNR92cNKnAPqQ1Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26005668"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="26005668"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 07:46:30 -0700
X-CSE-ConnectionGUID: +xGsPk7FSg+Ri872P4TTow==
X-CSE-MsgGUID: U7ub65ceQpCKcSCaHaNMFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="101824957"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Sep 2024 07:46:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sskKY-000HIA-0l;
	Mon, 23 Sep 2024 14:46:26 +0000
Date: Mon, 23 Sep 2024 22:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 114/120] kismet: WARNING: unmet direct
 dependencies detected for REGULATOR_FIXED_VOLTAGE when selected by
 SND_SOC_APPLE_MACAUDIO
Message-ID: <202409232215.4WR2QE9g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   79e5f455d8c4ad8e5ba25ab4ec5945bdce3d1a91
commit: 0602b407fa37a6fad397b3e1868bbb08181e0601 [114/120] macaudio: Fix missing kconfig requirement
config: arm64-kismet-CONFIG_REGULATOR_FIXED_VOLTAGE-CONFIG_SND_SOC_APPLE_MACAUDIO-0-0 (https://download.01.org/0day-ci/archive/20240923/202409232215.4WR2QE9g-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240923/202409232215.4WR2QE9g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409232215.4WR2QE9g-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for REGULATOR_FIXED_VOLTAGE when selected by SND_SOC_APPLE_MACAUDIO
   WARNING: unmet direct dependencies detected for APPLE_ADMAC
     Depends on [n]: DMADEVICES [=n] && (ARCH_APPLE [=n] || COMPILE_TEST [=y])
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE [=n] || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for REGULATOR_FIXED_VOLTAGE
     Depends on [n]: REGULATOR [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

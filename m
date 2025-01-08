Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09493D81
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736339536; cv=none; b=On4IvZ4ztM02plbOi3MVwqTpodwgfOWu4pcPAu6RlVp0aPD95lM4cWSGkcZ7+3+JTVroz95MXs4JJauTfK4Rsezx/nnIJP7TjES3jl47JRggmlsgIfwCZLmsR2Pz8Nzh52XMLME5AbYocmX2dEXqhVJzNcLT9T2+IF3hPDEuhF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736339536; c=relaxed/simple;
	bh=YnpHV0vAYknHF9JIxwXVIdUTvJfihasvUwZTdfw8PEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KtrJe0d7NPg3Osx3uLzuzvrtlVC5Wv13VGqP4slleOluQl3gGZnTGzfBmWGcb7Zr7oyLKhAouEvNLu/XYdZVkZpOxWVdXvACFzGbdlot9vLBfDT6j6IMTj7Qolt8T7HtCQ1BhGIm9rBQOX/R1OSKPhemM5qDQMjefNq7JPUWLI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1EckGB0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1EckGB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736339533; x=1767875533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YnpHV0vAYknHF9JIxwXVIdUTvJfihasvUwZTdfw8PEk=;
  b=M1EckGB0sYdVgphSCUwAYPPvzPSjAKUAwBwFQ0be4rlo+2HgsYCa+e2K
   AUK3915lOWL2x347F9lLuRAiEgl3ABJnjcwndjEFzg6yCBJsfbr5InQv4
   nVCq5Lxnp/j5C8cHmYGkVeVTKlL8brUSQkt5lNrT8AtYQ1cyfSDxKPIHv
   /Qm+/9kar58b3C6xzckZZ0Zy+poSa9jFXwnjGkiZRKJoO5EP2WEtEt47x
   bUg00gZeJVo/XPG7iUCXrwBInwO2alCGmHc1eyFejTtERllJ+6K+xIie9
   XkUSNmbZygmnCe6FxuBEaDGxUCGEUdIbXevFhmKhRakySuKTGzoXMgKbB
   A==;
X-CSE-ConnectionGUID: oichQT9XTMGze2vdGSd0/w==
X-CSE-MsgGUID: R0oyknY7QCGXMzDA3T2AMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36723221"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36723221"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 04:32:13 -0800
X-CSE-ConnectionGUID: D6NAdOW2ReKDhILLobL37g==
X-CSE-MsgGUID: cFHuBH40SvSU9RufvQ3YKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103587297"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Jan 2025 04:32:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVVEG-000G3t-1T;
	Wed, 08 Jan 2025 12:32:08 +0000
Date: Wed, 8 Jan 2025 20:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-next 11/12] kismet: WARNING: unmet direct
 dependencies detected for MFD_WM8994 when selected by
 SND_SOC_SAMSUNG_ARIES_WM8994
Message-ID: <202501082020.2bpGGVTW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   e777dbe830ea81df4c14da863174b245ff9ada7a
commit: fd55c6065bec5268740e944a1800e6fad00974d9 [11/12] ASoC: samsung: Add missing selects for MFD_WM8994
config: alpha-kismet-CONFIG_MFD_WM8994-CONFIG_SND_SOC_SAMSUNG_ARIES_WM8994-0-0 (https://download.01.org/0day-ci/archive/20250108/202501082020.2bpGGVTW-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250108/202501082020.2bpGGVTW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501082020.2bpGGVTW-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_WM8994 when selected by SND_SOC_SAMSUNG_ARIES_WM8994
   WARNING: unmet direct dependencies detected for MFD_WM8994
     Depends on [n]: HAS_IOMEM [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_SAMSUNG_ARIES_WM8994 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SAMSUNG [=y] && IIO [=y] && EXTCON [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

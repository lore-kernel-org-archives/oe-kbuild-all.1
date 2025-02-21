Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E1E1FBC92
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 19:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740167910; cv=none; b=OyB/0vYpegT8pqfegbHo0+UsS9FTUdruOXsklJ08LeBoxulL16ycTmSJqPJFGrmSRkp5K4+ylqED6B2wr6aMmr4dppUC53UKHCq/NRJQX09fvvGvGbStJQjVwV/Nm1uZ1uv7brLkhaEzAld+WsKayr8Wwa7G4tURFAiravbCxnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740167910; c=relaxed/simple;
	bh=i9L1JfTGl0V/PDWiJ53AAH5QwE7SN7Q52AxX8ozpZhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WP8GuKGMDbtKBbXoc2IMYIIJ4R8mtOKwdS7PsMTxvaeNWjTpOaEwRC8fM1EOIE0kKwl72KET+A0//ibdT78pe+3vNvcUidsXYTa52jL1EQ97g1pPt8a6x5aaEeBUV5vAqaXshCi0KFq2OnyNT1USol8IaM9YILLyCdvEq3HktlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGEUGKoj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGEUGKoj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740167909; x=1771703909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i9L1JfTGl0V/PDWiJ53AAH5QwE7SN7Q52AxX8ozpZhM=;
  b=QGEUGKojxywwCBWoHMiofvxak4LX/RBe1NLhhWHNBiQkIsBZTrhce/gR
   mEJrRpxVzgZDV9ioBrj30/MX8ryKkvrRLo0gsLlInGR+tXPkPx9KMOVdY
   bf4fH1db3Ma7zsRQjhyE9BGTUtpFRxKj+LPdRgXdW/Thga2imrIkVpxKa
   MjFc8MmjTACUoHZeNrF5J9dtkunYUSF4N7Y31HWKp2C7fOqE9npvyNyGY
   ooW7jZfyIB2JvKfo612qFGts3aJLStlgra1NlvIiCIcf7IfT6Qucf2yZZ
   lp4leUwWRaOQDiS/5TUw+HkZm+3fMEnFtn8bjsUB1NUEPgE5IuXyQ9DKL
   Q==;
X-CSE-ConnectionGUID: 16HqtKPxTVKayi5h5xaj4g==
X-CSE-MsgGUID: Eee1IR2pTT6J8joXF9OLwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40708802"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="40708802"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 11:58:28 -0800
X-CSE-ConnectionGUID: r6c0hhVRTFqXYX6JGCNJvA==
X-CSE-MsgGUID: Wp9axkc4Thq0mrwubMUk0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119580670"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Feb 2025 11:58:27 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlZAG-0005wl-1p;
	Fri, 21 Feb 2025 19:58:24 +0000
Date: Sat, 22 Feb 2025 03:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 4334/5524] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_SOF_AMD_COMMON when selected by
 SND_SOC_SOF_AMD_REMBRANDT
Message-ID: <202502220334.A8evfNbs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
commit: f120cf33d2325fd95d063eccbff2e86ffc7f493a [4334/5524] ASoC: SOF: amd: Use AMD_NODE
config: um-kismet-CONFIG_SND_SOC_SOF_AMD_COMMON-CONFIG_SND_SOC_SOF_AMD_REMBRANDT-0-0 (https://download.01.org/0day-ci/archive/20250222/202502220334.A8evfNbs-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250222/202502220334.A8evfNbs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502220334.A8evfNbs-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_SOF_AMD_COMMON when selected by SND_SOC_SOF_AMD_REMBRANDT
   WARNING: unmet direct dependencies detected for SND_SOC_SOF_AMD_COMMON
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && AMD_NODE
     Selected by [y]:
     - SND_SOC_SOF_AMD_REMBRANDT [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && SND_SOC_SOF_PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

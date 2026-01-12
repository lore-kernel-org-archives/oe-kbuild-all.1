Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80AD30F55E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 06:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768199256; cv=none; b=lhiGaEQjNHBfobCPUwNOeQE9DsQsfJRaR1NJzcUFK4+enPS8+kd4ap8Y+PTB/KJSfxLAzcZmkSGG7H6oV15Kbbqs1hspdSCr+L1X+rQZw/QSeK5LU4XRiMFU8kVKBADB3+acUjV36vHHeo7iDWQtk0zvsYRFe+QQaE8oVudzhD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768199256; c=relaxed/simple;
	bh=/QdY1qnkO1eLlPtifN5OPMD155nUGk8ISv81U6oVFiM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jWlI366O90qiIp1pUnCtxxEn7bHv8t5TV3iUouBJs029EGh4zRlVQD2ZwD4/h9Tr0LtzfbHvu/bDmNoCpQCbhIX90griSzZ2F1OcYH4cdDDemZtxbI5JyactFR+Hg/PpGzXxz4VJGY2Mh8uuEk1D/TSjAbu6VVR9TdgPcJ81raQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmXLj+z9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmXLj+z9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768199254; x=1799735254;
  h=date:from:to:cc:subject:message-id;
  bh=/QdY1qnkO1eLlPtifN5OPMD155nUGk8ISv81U6oVFiM=;
  b=CmXLj+z9LEdJmJx41dajYOgxH0OJRBEWfzYeUl4FRDB6P8FKwVCg33/D
   1ZzZmYpmweusZhi+Gx/68pwgcJ777dLAqOdrVau+i5UK9Yhuz5UhU0jgW
   5xw8NH5x1TqEaonsKo7vn56Vqm0mHYaEwzKA9eDPzsmDGoEC4cxCdEG5O
   0pq+H0UklPb4lkmzfJDxTfC96zoGxOSRSl8kt6Jfe78nw4eSSqmVpoGVV
   wsLkBLPcJ2Tmo7VSowQxx7ypTJgqvEhBzrq1TLe4JUUY2jsmihGnb/pqn
   WmJ180UZpfvYlDtgZkhHZHKXl52GPNpGLA5X4KF2bEsIQAcJFqkKTGMFy
   Q==;
X-CSE-ConnectionGUID: wkWy43OJRXW/+DaLw/v+eA==
X-CSE-MsgGUID: c6s3lRlLSvW4rnpx8zDTuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69204780"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69204780"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 22:27:33 -0800
X-CSE-ConnectionGUID: XZmS1wK1SNOIKeAJGS3UCA==
X-CSE-MsgGUID: SXwxmE7/Qf63Nnte/QsbDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234708639"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 11 Jan 2026 22:27:32 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfBOj-000000000nB-0VT3;
	Mon, 12 Jan 2026 06:27:29 +0000
Date: Mon, 12 Jan 2026 07:26:52 +0100
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_STAC9766 when selected by SND_MPC52xx_SOC_EFIKA
Message-ID: <202601120737.Jn4xEIRJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f61b1860cc3f52aef9036d7235ed1f017632193
commit: d8dd3f92a6ba11f9046df48765e6f12ad70a3946 ASoC: Fix SND_SOC_ALL_CODECS imply misc fallout
date:   6 years ago
config: powerpc-kismet-CONFIG_SND_SOC_STAC9766-CONFIG_SND_MPC52xx_SOC_EFIKA-0-0 (https://download.01.org/0day-ci/archive/20260112/202601120737.Jn4xEIRJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260112/202601120737.Jn4xEIRJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120737.Jn4xEIRJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_STAC9766 when selected by SND_MPC52xx_SOC_EFIKA
   WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
     Selected by [y]:
     - SND_MPC52xx_SOC_EFIKA [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_EFIKA [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_STAC9766
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AC97_BUS [=n]
     Selected by [y]:
     - SND_MPC52xx_SOC_EFIKA [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_EFIKA [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

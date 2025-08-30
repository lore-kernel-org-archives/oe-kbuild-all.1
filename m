Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A75274668
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 17:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756575459; cv=none; b=BQbvKsEwqoiqNIRnCByfVunaWeMluCEHivje92tnOXO92U+wW7jO9CVvZHqQ1PirA/OhzETgH2mGa5Y84hgcqeiqtHesHS2LaJ8TyNvqq2ev8Ngf18iezi0ADmdxfW0IHgDmcjZp7lSFwNsDKY0+1lUj4MhV50o+V03GXi5QV2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756575459; c=relaxed/simple;
	bh=Qk3iV0oB+UQE0VbUkfVew/kJblTyOLesydL/fPhetPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mjwH5l6zbCGAuhpGK38aBSbCoHl7caKEpb2i6vgxRgU7U6HGFJ3LInjnvqXJzhT/uSguXm/rMBmxEe75dB8bA9FE65NFG4rRCRpBbJJgEhF6/sI/DNPYgzohHO6axt+56JH8W119Zn3nB/CHFhTmUt5kd4hgEyryKms0N0mDu+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgH/gaHn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgH/gaHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756575458; x=1788111458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qk3iV0oB+UQE0VbUkfVew/kJblTyOLesydL/fPhetPc=;
  b=PgH/gaHnhTKuIry3yEpPwJ7iOQgKtNLI35FwH+gQnBJQ9kXL9j20FopL
   Donro/N2Kwzktk50TXlkyUYVgIBSdRW02UXOwifsXtilH118u6lhoNRnU
   FjCbzKj9yNShtu7h87RgMqfB2kIwtVNBrLweUNLHycXZaPoV7q2UUDo3I
   xN4wiSqo1U5BLJ7HHgNMLokCHlvESVmQj3lJXsMNehYclOEDAocu0TIP8
   rt066jsX1VqFGmkHX84HSMXhIfdOH4CEAEjSUKttuddkf4sdEX1zK1ccz
   rZ/NF9EHtZ1t2M+yRASDhms6Zz9eSFN9HP+3gbiH9xXhvGuaPaASYl9Iq
   w==;
X-CSE-ConnectionGUID: NuZZDYV8Rdmdk9pKEoCusA==
X-CSE-MsgGUID: fccB8wtLQ0+Vbtzj124cvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58543837"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58543837"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 10:37:37 -0700
X-CSE-ConnectionGUID: 1WYBmAv/RAO6NGuOs1VhyA==
X-CSE-MsgGUID: 0QRbWw2HQ+WBImpu5Lm2fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="201563492"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Aug 2025 10:37:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usPW8-000Vae-2j;
	Sat, 30 Aug 2025 17:37:32 +0000
Date: Sun, 31 Aug 2025 01:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Abel Vesa <abel.vesa@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [sre-misc:thinkpad-t14s-x1e 57/95] kismet: WARNING: unmet direct
 dependencies detected for PHY_QCOM_MIPI_CSI2 when selected by
 VIDEO_QCOM_CAMSS
Message-ID: <202508310129.wYRnUe9k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   0e21f1dbce44bad4bb05c2541344ff3fb9643230
commit: 298f529d0c46850b0d6d48f29d085aab13509929 [57/95] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
config: alpha-kismet-CONFIG_PHY_QCOM_MIPI_CSI2-CONFIG_VIDEO_QCOM_CAMSS-0-0 (https://download.01.org/0day-ci/archive/20250831/202508310129.wYRnUe9k-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250831/202508310129.wYRnUe9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508310129.wYRnUe9k-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PHY_QCOM_MIPI_CSI2 when selected by VIDEO_QCOM_CAMSS
   WARNING: unmet direct dependencies detected for PHY_QCOM_MIPI_CSI2
     Depends on [n]: (ARCH_QCOM || COMPILE_TEST [=y]) && OF [=y] && COMMON_CLK [=n]
     Selected by [y]:
     - VIDEO_QCOM_CAMSS [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && VIDEO_DEV [=y] && (ARCH_QCOM && IOMMU_DMA [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

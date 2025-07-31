Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDD723E25B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 07:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753945427; cv=none; b=YqOOGtdLVF/pXlaF4cuVxh5c6zM92rrTfrO4IiaRVHpQZhRFifMbGGZflcBQC8lDOUKx5vqEICpML3sEvlQDKhbKDdHpzPIoPtdhpdtXO6QGQRGDWYoJ53REGkqXPJfYxL3M5Z1CrlcC6isqlcST8IkKXwtwc5cL2aF9tvq0PKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753945427; c=relaxed/simple;
	bh=CXzVxwTdB/SNNsSbQvexNowg0uk3C5YQ17L4jcVD2Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fb+0DcROlSQmNd/uyCHWDf8m2ix/Hsdv9VdLaB56b1H/ZoV/TqQ0mgLptyITbLxSWz4s76r76J0uRbl6QRk9EsOkI15iFfqkXI0FF1Htxy33ELs/en0JJX94oBKScf7mjIEH7CuJ7FJxZlrZUHt9lCNCda/i2XsyvurrqK854+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6WNpyV1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6WNpyV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753945425; x=1785481425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CXzVxwTdB/SNNsSbQvexNowg0uk3C5YQ17L4jcVD2Nk=;
  b=V6WNpyV1M9U7vxeOyGLA33lNG4l7D6/Tcl1TAlTKp1j5VifjS6BlMGHw
   Gjy/0QtthDipErhRzWvx4FgGfqb39t3zzz86WoSP3e2etgyJTpem6TLQU
   RBgoEC+nwc+d2z6Lj6ogPADIv3kwEtQ19LiW7K9yTqQ+URLXQjEpqmjRP
   Sx7XNkxKmkGRhbCB0bUAyI2Hjff+Q65u7DsFEJ+/UmKnJslrmPIQl31BA
   L88WFPuf4GONwp5VmO3T6EtQanNR1vGZhK21yvOM/FiY+HgxdG8DdCJkB
   zFTlC0XSQ0G8Is9k9U2TVLNQLgvHnRSDBFM2GojiiFsxkCwFbbE52Go35
   g==;
X-CSE-ConnectionGUID: KmF59BSqSKStOzrqRLz0Kg==
X-CSE-MsgGUID: o8vDsOvbRtqwMh7PKR7/EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56223120"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="56223120"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 00:03:16 -0700
X-CSE-ConnectionGUID: Or7C1xtbR2Wis/RZOYKRTA==
X-CSE-MsgGUID: ktuZm740QVqaO3QI7lYWEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="168462836"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jul 2025 00:03:11 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhNJl-0003VQ-0e;
	Thu, 31 Jul 2025 07:03:09 +0000
Date: Thu, 31 Jul 2025 15:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	sboyd@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org, srini@kernel.org, vkoul@kernel.org,
	kishon@kernel.org, sre@kernel.org, krzysztof.kozlowski@linaro.org,
	u.kleine-koenig@baylibre.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pm@vger.kernel.org, kernel@collabora.com, wenst@chromium.org,
	casey.connolly@linaro.org
Subject: Re: [PATCH v3 5/7] misc: qcom-coincell: Migrate to
 devm_spmi_subdevice_alloc_and_add()
Message-ID: <202507311446.eqv2ucNm-lkp@intel.com>
References: <20250730112645.542179-6-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730112645.542179-6-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250730]
[cannot apply to jic23-iio/togreg sre-power-supply/for-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.16 v6.16-rc7 v6.16-rc6 v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/spmi-Implement-spmi_subdevice_alloc_and_add-and-devm-variant/20250730-193217
base:   next-20250730
patch link:    https://lore.kernel.org/r/20250730112645.542179-6-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v3 5/7] misc: qcom-coincell: Migrate to devm_spmi_subdevice_alloc_and_add()
config: arm64-randconfig-002-20250731 (https://download.01.org/0day-ci/archive/20250731/202507311446.eqv2ucNm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507311446.eqv2ucNm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507311446.eqv2ucNm-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/phy/qualcomm/phy-qcom-eusb2-repeater.o: in function `eusb2_repeater_probe':
   drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c:228:(.text+0x5a8): undefined reference to `devm_spmi_subdevice_alloc_and_add'
   aarch64-linux-ld: drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c:236:(.text+0x61c): undefined reference to `__devm_regmap_init_spmi_ext'
   aarch64-linux-ld: drivers/misc/qcom-coincell.o: in function `qcom_coincell_probe':
   drivers/misc/qcom-coincell.c:109:(.text+0x10c): undefined reference to `devm_spmi_subdevice_alloc_and_add'
>> aarch64-linux-ld: drivers/misc/qcom-coincell.c:113:(.text+0x14c): undefined reference to `__devm_regmap_init_spmi_ext'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

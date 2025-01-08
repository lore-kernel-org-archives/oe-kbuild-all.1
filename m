Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11D81F37A7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 19:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736364991; cv=none; b=TvmTLW49QmKJRmVX5NP8x1p5Zo2l7Tdpeiqhhq+4foKj+wOfbR7DGTwit4kOKkrpcLgQJTI9BDU3fRkRxv8JDUDZDHbqKkMusJZvoTq0V+4yAJYeIb8uWeuUruzWqNC5TZs6SWFNk+pLoczmIx+ZpzIKnt9YPm8ARVImCRXxD9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736364991; c=relaxed/simple;
	bh=fxIY9S0yVXYzmqyWFRVBF6eFEG2DqGCT99GsNrZTA9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b+IJg37y5lliKZUNT8RYu4DyeDB1ir2/0R6RbJZtAhEQQsOFtM9+pQmKzIKO7XapmR11GO/ZEn2giqnkiaW/XZEnzGKoWOpV4VdNI7VLsZaEjW4MxA+mBShDZFaK8iJhBJUzqkHgAhouJQS8ZMGZEWnvJCeI27vXKUT1lwVFuJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VaLttcj6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VaLttcj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736364990; x=1767900990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fxIY9S0yVXYzmqyWFRVBF6eFEG2DqGCT99GsNrZTA9k=;
  b=VaLttcj6FYtDmwiB5NcE77oQDKcnQDCkX0rBktAqeqKs4jaMzqigJAyY
   4ekuDdu/ls10YEtjDNke7gbTotYBVEB10c3MNYVqTTcbJkizmQ1d4PNhf
   3Tn26fSfHadmfqMSCCFqkBTh2M+pt/jvp5JHybHPD/Z/aOoLkw397Jwyn
   4ucY6mxW55dghJdCnRPvSUfloB+5PkHGqMce1MsEpFw9Ov5hg3v7xmCKb
   JNPBht8kunzMxALIOZuM9Sea3tCPeUxSIuip8g4EoeQtdqoz0v1Oo3aiQ
   k1+aJo4lN+Nakmrj+NYNeehRhsaSRRE+/DV/Szia1FuYUXwgGb+1LBBis
   w==;
X-CSE-ConnectionGUID: E3EgKvsJS2er1Fy1V/ltEw==
X-CSE-MsgGUID: mC8G9jTMTbeulzYRCoCeIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36491449"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="36491449"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 11:36:29 -0800
X-CSE-ConnectionGUID: diFlYzF8SOGYX4eqmYqMxw==
X-CSE-MsgGUID: BlDuXBZNSuqkinwUIjLnow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="102995904"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jan 2025 11:36:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVbqr-000Gcj-0N;
	Wed, 08 Jan 2025 19:36:25 +0000
Date: Thu, 9 Jan 2025 03:35:46 +0800
From: kernel test robot <lkp@intel.com>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: sound/soc/amd/yc/acp6x-mach.c:573:15: error: implicit declaration of
 function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'?
Message-ID: <202501090345.pBIDRTym-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Venkata,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   09a0fa92e5b45e99cf435b2fbf5ebcf889cf8780
commit: 4095cf872084ecfdfdb0e681f3e9ff9745acfa75 ASoC: amd: yc: Fix for enabling DMIC on acp6x via _DSD entry
date:   6 weeks ago
config: x86_64-buildonly-randconfig-006-20250109 (https://download.01.org/0day-ci/archive/20250109/202501090345.pBIDRTym-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090345.pBIDRTym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501090345.pBIDRTym-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/amd/yc/acp6x-mach.c: In function 'acp6x_probe':
>> sound/soc/amd/yc/acp6x-mach.c:573:15: error: implicit declaration of function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=implicit-function-declaration]
     573 |         ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
         |               ^~~~~~~~~~~~~~~~~~~~~
         |               acpi_evaluate_object
   cc1: some warnings being treated as errors


vim +573 sound/soc/amd/yc/acp6x-mach.c

   547	
   548	static int acp6x_probe(struct platform_device *pdev)
   549	{
   550		const struct dmi_system_id *dmi_id;
   551		struct acp6x_pdm *machine = NULL;
   552		struct snd_soc_card *card;
   553		struct acpi_device *adev;
   554		acpi_handle handle;
   555		acpi_integer dmic_status;
   556		int ret;
   557		bool is_dmic_enable, wov_en;
   558	
   559		/* IF WOV entry not found, enable dmic based on AcpDmicConnected entry*/
   560		is_dmic_enable = false;
   561		wov_en = true;
   562		/* check the parent device's firmware node has _DSD or not */
   563		adev = ACPI_COMPANION(pdev->dev.parent);
   564		if (adev) {
   565			const union acpi_object *obj;
   566	
   567			if (!acpi_dev_get_property(adev, "AcpDmicConnected", ACPI_TYPE_INTEGER, &obj) &&
   568			    obj->integer.value == 1)
   569				is_dmic_enable = true;
   570		}
   571	
   572		handle = ACPI_HANDLE(pdev->dev.parent);
 > 573		ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
   574		if (!ACPI_FAILURE(ret))
   575			wov_en = dmic_status;
   576	
   577		if (is_dmic_enable && wov_en)
   578			platform_set_drvdata(pdev, &acp6x_card);
   579		else
   580			return 0;
   581	
   582		/* check for any DMI overrides */
   583		dmi_id = dmi_first_match(yc_acp_quirk_table);
   584		if (dmi_id)
   585			platform_set_drvdata(pdev, dmi_id->driver_data);
   586	
   587		card = platform_get_drvdata(pdev);
   588		if (!card)
   589			return -ENODEV;
   590		dev_info(&pdev->dev, "Enabling ACP DMIC support via %s", dmi_id ? "DMI" : "ACPI");
   591		acp6x_card.dev = &pdev->dev;
   592	
   593		snd_soc_card_set_drvdata(card, machine);
   594		ret = devm_snd_soc_register_card(&pdev->dev, card);
   595		if (ret) {
   596			return dev_err_probe(&pdev->dev, ret,
   597					"snd_soc_register_card(%s) failed\n",
   598					card->name);
   599		}
   600		return 0;
   601	}
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

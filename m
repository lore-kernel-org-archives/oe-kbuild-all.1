Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2329683A17
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 19:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732735124; cv=none; b=gV0MayVC2HkR+U59tR5Llg9LcO1dm02IGdNT5cCz93a9TatFKmvionpAilHzTozY7nJM4BKRj4ldK0enUOTit6x5lp6Dj6jjdQF1GMLPNgTwMR/V4rztxXa7ByhSERfSVf8iBOyDRZSL9USLddbt8CFZjVFkDGRA6JhxEQmEr1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732735124; c=relaxed/simple;
	bh=A+60lUfFyliEtCUfCnJ52sqLzvCJ32Ffwr2ciTNKIfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LJsQ1P9plt3TRjC3xwerLf6gct9OLCrzL7HX4t0Uh7TvLDQvesVHJO6wZn0l7fyv9KvwuMALz9+8cuR/rRhAkib0E5qQFz/8lBioXSHDLc9kqhF1JZiFBWZa80wyHgBoWUN80ecDivz2SNZ5StUUtTAf4C4icTgERL7fcIMahog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEeNmrx/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEeNmrx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732735123; x=1764271123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A+60lUfFyliEtCUfCnJ52sqLzvCJ32Ffwr2ciTNKIfQ=;
  b=jEeNmrx/6P04gBoI7U37bdxzwgXvA3MQgIhwsivFQk4eh8Lln6PxmiCb
   n5ofr5dNamrufN0iwzI9HLqAvvBNx5iE4TZAX1lElqthhqpR1Na4eLduz
   gs8JxjM00l9QQGikr+nunzciHTXCX8796ZL2s6qgVI0IEvmzfqECigmfp
   XjJ7QqOfsnx4G300oJhWsZtTx0MYgiDWAkDWYRgmjfgez9p1p2bTQI8Ds
   cRWzyASihr/Te5AyMZNhIGd7iViMqugPmXkrX3gjlQgdiiul1aVj7/5ar
   7aeEQ1++zVy/9zoK/ANJpqmVr8VpbEL84vR2s4kP5miDfJPHC/ImNhaey
   w==;
X-CSE-ConnectionGUID: XJbF8WtCR6GMP1nwO9btXw==
X-CSE-MsgGUID: 1gtemczBQ3u/IruBiqNcBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="44333419"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="44333419"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 11:18:43 -0800
X-CSE-ConnectionGUID: wg6b7l0VT3KbKNKgR2OiOA==
X-CSE-MsgGUID: 39wgeAyqSM+cUaEbZBv61w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="91957431"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Nov 2024 11:18:42 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGNYd-0008IF-1G;
	Wed, 27 Nov 2024 19:18:39 +0000
Date: Thu, 28 Nov 2024 03:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-next 16/19] sound/soc/amd/yc/acp6x-mach.c:573:15:
 error: implicit declaration of function 'acpi_evaluate_integer'; did you
 mean 'acpi_evaluate_object'?
Message-ID: <202411280324.yLp8HRE2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   b682aa788e5f9f1ddacdfbb453e49fd3f4e83721
commit: 4095cf872084ecfdfdb0e681f3e9ff9745acfa75 [16/19] ASoC: amd: yc: Fix for enabling DMIC on acp6x via _DSD entry
config: i386-buildonly-randconfig-006-20241128 (https://download.01.org/0day-ci/archive/20241128/202411280324.yLp8HRE2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280324.yLp8HRE2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280324.yLp8HRE2-lkp@intel.com/

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

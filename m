Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1D718EA3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QO6wgreb"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a28b0207c1dso6590066b.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 03 Jan 2024 03:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704280670; x=1704885470; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pdXPeVKaMQoJg3n6aF4pRNFY2N3PJISug/fLetqIk2E=;
        b=QO6wgrebwQCyUM7vLXVMMrJ9evpkc2U7chaR+ETlnqHG0Nkw/+VKZ+zSwFFkmlkDeY
         uE69kA+JZMhP7nyDg4A/YOf7L3ps08kjMWpKqB+nLiyZP59turpICcD3TjKBQzR38dHP
         MMUsQ6QaGEr/Q4krKD2oitE4D2/bJL1RJDDy1apeNAgkoVZS2yBujQSBnMGW4dKE1lhr
         C6j0X+nfPvRYrhc5V5s67kirkzD77Z6wasyD+ybE7mMOlcjzOqjdmGJ0kSZSpPIpgju/
         3oOYtH+GxQ72VO3bQkE2pN6x5bOvvWSPjMGnoMqfajMjvgZ7c7dh/h8uxOnYIGNznPNp
         bV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704280670; x=1704885470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pdXPeVKaMQoJg3n6aF4pRNFY2N3PJISug/fLetqIk2E=;
        b=d0+uRBooJpBUbxD1Fx8Hm8CBqQ5rsTchlQPoYFV7p17d1zW0FGCkLhqX/8qWhl4ma4
         TE5y2zXQgrESp02tDlzniLYVul4oycjKMM5PAruJjpOpgWXzW51SvYhoHn1kXq4kpnWR
         vnhvPyvkgLpjQV0rblCJ15zVPlhpnFDzMBidjkhZpw6WE/7UDPLIlng8SyD7TF/4SXBK
         JJgMi/hQYPI6p/ecK/fCoscWk3lEfR0iDVuREG02jkeNOt6CRmsyBVFu3iPBExTyC4fT
         ZkWSb53nUHcS2LKo/QQBK8vd0bJd7KerKwQTIityJyDS9fDxkox3ndz3FChkOOUG1Nit
         7Www==
X-Gm-Message-State: AOJu0YxGSMkapgy6Z14c1OLYhir6fekFpysPBcdfix66t3I1lm9c5l4i
	ENAezllnEZycIs/92ZwJVVt24OmtoVsHpQ==
X-Google-Smtp-Source: AGHT+IG7qErQ/ubr0/gy6V7SUV7nU8F0Gb/OW8KxZPdAgA/H4p0uGEnpjnbycHTjMrKnrptbERVhhA==
X-Received: by 2002:a17:906:a1cc:b0:a24:20f:de83 with SMTP id bx12-20020a170906a1cc00b00a24020fde83mr8946968ejb.62.1704280669827;
        Wed, 03 Jan 2024 03:17:49 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id ff15-20020a1709069c0f00b00a2801041a15sm2798138ejc.149.2024.01.03.03.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 03:17:49 -0800 (PST)
Date: Wed, 3 Jan 2024 14:17:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal.kopec@3mdeb.com>,
	linux-usb@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	=?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Subject: Re: [PATCH] platform/x86: serial-multi-instantiate: allow single
 GpioInt IRQ for INT3515
Message-ID: <00192cbf-d651-437d-8072-8c6593503e6f@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212103823.546118-2-michal.kopec@3mdeb.com>

Hi Michał,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Kope/platform-x86-serial-multi-instantiate-allow-single-GpioInt-IRQ-for-INT3515/20231212-184116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20231212103823.546118-2-michal.kopec%403mdeb.com
patch subject: [PATCH] platform/x86: serial-multi-instantiate: allow single GpioInt IRQ for INT3515
config: x86_64-randconfig-161-20231219 (https://download.01.org/0day-ci/archive/20231220/202312200538.fJidUMf0-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312200538.fJidUMf0-lkp@intel.com/

smatch warnings:
drivers/platform/x86/serial-multi-instantiate.c:79 smi_get_irq() warn: add some parenthesis here?
drivers/platform/x86/serial-multi-instantiate.c:79 smi_get_irq() warn: maybe use && instead of &

vim +79 drivers/platform/x86/serial-multi-instantiate.c

35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  52  static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  53  		       const struct smi_instance *inst)
e64e84987de5486 drivers/platform/x86/i2c-multi-instantiate.c    Hans de Goede   2018-08-09  54  {
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  55  	int ret;
e64e84987de5486 drivers/platform/x86/i2c-multi-instantiate.c    Hans de Goede   2018-08-09  56  
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  57  	switch (inst->flags & IRQ_RESOURCE_TYPE) {
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  58  	case IRQ_RESOURCE_AUTO:
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  59  		ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  60  		if (ret > 0) {
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  61  			dev_dbg(&pdev->dev, "Using gpio irq\n");
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  62  			break;
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  63  		}
fef1688e82fe3ee drivers/platform/x86/serial-multi-instantiate.c Michał Kopeć    2023-12-12  64  		ret = platform_get_irq_optional(pdev, inst->irq_idx);
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  65  		if (ret > 0) {
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  66  			dev_dbg(&pdev->dev, "Using platform irq\n");
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  67  			break;
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  68  		}
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  69  		break;
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  70  	case IRQ_RESOURCE_GPIO:
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  71  		ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  72  		break;
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  73  	case IRQ_RESOURCE_APIC:
fef1688e82fe3ee drivers/platform/x86/serial-multi-instantiate.c Michał Kopeć    2023-12-12  74  		ret = platform_get_irq_optional(pdev, inst->irq_idx);
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  75  		break;
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  76  	default:
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  77  		return 0;
e64e84987de5486 drivers/platform/x86/i2c-multi-instantiate.c    Hans de Goede   2018-08-09  78  	}
fef1688e82fe3ee drivers/platform/x86/serial-multi-instantiate.c Michał Kopeć    2023-12-12 @79  	if (ret < 0 && !inst->flags & IRQ_OPTIONAL)

Precedence bug.  This should be:

	if (ret < 0 && !(inst->flags & IRQ_OPTIONAL))

14a9aa99aca6c28 drivers/platform/x86/serial-multi-instantiate.c Andy Shevchenko 2022-07-10  80  		return dev_err_probe(&pdev->dev, ret, "Error requesting irq at index %d\n",
14a9aa99aca6c28 drivers/platform/x86/serial-multi-instantiate.c Andy Shevchenko 2022-07-10  81  				     inst->irq_idx);
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  82  
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  83  	return ret;
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  84  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10D71E507
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 10:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735986215; cv=none; b=tnsRGEZnrLGtVfFZPcUYlhsCR4UKpCNzs5pUqtVdCo4PiSvgki5gQE7nZxkroXLd3AenWo2ag9L3ATU4BLNbX8Iyfx6ACXuIa8xL1dMXhRvM63U3O+vM8yPjSL7HtawaB84Z9pi9sGstiAEAa6JvdPTutRnW6juUwRmQ5qzhxL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735986215; c=relaxed/simple;
	bh=Fdf1rjpjA6sxjXaV2e0oeC/d7EbPbdaM3pY/SSgVVFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwOsukl0DGjV9WmNjXoAUPjyGxOvWFKWvKfNnPFbKsOOHablzgqMQrmuEbMdFs/Ny/SiHD4+rNQDzRwPHy3dG/t4rzy5VcAC9hxjxZUwrHAKfsBGhoXR4jNrvUWaN4ThCq4eGbWH/5/SbkDTeR8NsHBweC+w9fF/DP/nu/tg+kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8rhXnUq; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8rhXnUq"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21644aca3a0so109343145ad.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 04 Jan 2025 02:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735986213; x=1736591013; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d7WWzM81eH7w8ivFPUo0nbOJxsERMoQeN/4oy/OiqOM=;
        b=B8rhXnUqhuKmIuHx+bwsHldLInzFA9ISWqt+EzYU+Ia+4bbZzsEwnCsYQiGAhrsC9Q
         z0fapQXodNAZgBS3kNej01ja4LPiP3bDyYu0UoEwG69coLRR6DeP+VI24YuHkKJjzMKP
         uuvprGjSj1m7XX0eLhHRTIqW39lHoYn3h+T/kImEHK39eVq1HiVZX7Us2lgV/snPM6oG
         6Of2Eb99V3WS1/5XIWHCOfoEsQY1gAzM2Celqf7YGb3VcDCKuayhCPE2nFU9Ky0OJZbH
         kL42O6QjSy2pckuGmCmXFqu8zRplWxYyalxu/vAyVsY6lZreeSDG0xQ6yNgrl324AmFj
         azMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735986213; x=1736591013;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7WWzM81eH7w8ivFPUo0nbOJxsERMoQeN/4oy/OiqOM=;
        b=kZvb49me2fAo4fTomDWLiHioHGrsrF7iMsSlHCV+rznybbfY1C8ug0unYGLJaQdncL
         aBun0dG8olqVL/Bg3kVu1MkrttXVXJffBq4mLY0OBQRRWeKRV0JcSv1HRbaEm8lBx9ry
         trXBd+uA4AH841FJkEyAiWzho2hecCNvo/wmB4RwxAas6Pv6KozpLwOKX4Wo35T3amr4
         DpySMWqEzrRqgRQKLQ47UjjbKxbbJaxwySSP6Rh352LUg6hs47ZoHXQV9ylbNplZcQsV
         As/zfJ2qjttIKTcd9xe/SVWL5K3ZplZNpBPupQc+zpW+F0+3JL/eppQESbU8yX7dRtAA
         fMoA==
X-Forwarded-Encrypted: i=1; AJvYcCVVtLB2QsfFsS3aHy9jMC5hYK0Dkpwq84EGLrXbihjkCYiV8nfTcDAi3bSA5PfXcU/ZdrgJ7zkEUdkuJrNK@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg4d9N4sZVdYUN6pCFBcFU7Zu2zvwV2UXeepn4aPgnrfswlSD0
	h/JF2x8yJRdF4TSs4lTu1anPhrpHxSQVgjEGQKYqaknf/879L1tw9lw3lNDvNw==
X-Gm-Gg: ASbGnctObhB5Ob5mZaBZswNK5XDe0hdY+FZct34ppgtwA9CX4s0ukFjVoEhN27oiyv1
	NXt42e5nszBCJMCKDoAstqMekRHDNMcsi4ZJi4ibMytwAu7G2Hr1wJIzU06eZyrNGLnic1i/6Kw
	3WtqNQg22IHduaTlZSOLBDNWlMIye3o6L165bNbyVFnoRULg8HdecYeown7Hg0uRgHUr/7YaaSm
	9tkgZU7tfN3OgIy12ohGtvlzWyjYPPXoSyyDDdu3sjH0/oFo4Z9QtHvn50P6u/d1VE=
X-Google-Smtp-Source: AGHT+IGcYitKOORgbvygOZzt0NgzHQbBY9dbcSLI15yYAQJ/pt0tykyK+M3h+WkGeOApZbx9WoujYg==
X-Received: by 2002:a17:903:320a:b0:216:6901:d599 with SMTP id d9443c01a7336-219e6e9e86emr788176895ad.13.1735986213063;
        Sat, 04 Jan 2025 02:23:33 -0800 (PST)
Received: from thinkpad ([36.255.17.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962bfasm258736595ad.2.2025.01.04.02.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 02:23:32 -0800 (PST)
Date: Sat, 4 Jan 2025 15:53:27 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Qiang Yu <quic_qianyu@quicinc.com>
Subject: Re: [PATCH v2 6/6] PCI/pwrctrl: Add pwrctrl driver for PCI Slots
Message-ID: <20250104102327.fxswvs3dvsixbsh3@thinkpad>
References: <20241231-pci-pwrctrl-slot-v2-6-6a15088ba541@linaro.org>
 <202501020407.HmQQQKa0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202501020407.HmQQQKa0-lkp@intel.com>

On Thu, Jan 02, 2025 at 04:56:44AM +0800, kernel test robot wrote:
> Hi Manivannan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 40384c840ea1944d7c5a392e8975ed088ecf0b37]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam-via-B4-Relay/regulator-Guard-of_regulator_bulk_get_all-with-CONFIG_OF/20241231-174751
> base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
> patch link:    https://lore.kernel.org/r/20241231-pci-pwrctrl-slot-v2-6-6a15088ba541%40linaro.org
> patch subject: [PATCH v2 6/6] PCI/pwrctrl: Add pwrctrl driver for PCI Slots
> config: x86_64-randconfig-074-20250102 (https://download.01.org/0day-ci/archive/20250102/202501020407.HmQQQKa0-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501020407.HmQQQKa0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501020407.HmQQQKa0-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/pci/pwrctrl/slot.c: In function 'pci_pwrctrl_slot_probe':
> >> drivers/pci/pwrctrl/slot.c:39:15: error: implicit declaration of function 'of_regulator_bulk_get_all'; did you mean 'regulator_bulk_get'? [-Werror=implicit-function-declaration]
>       39 |         ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
>          |               ^~~~~~~~~~~~~~~~~~~~~~~~~
>          |               regulator_bulk_get

Sigh! The driver was built with !CONFIG_REGULATOR. This requires fixing
'include/linux/regulator/consumer.h'. Will add it in next iteration.

- Mani

>    cc1: some warnings being treated as errors
> 
> 
> vim +39 drivers/pci/pwrctrl/slot.c
> 
>     28	
>     29	static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
>     30	{
>     31		struct pci_pwrctrl_slot_data *slot;
>     32		struct device *dev = &pdev->dev;
>     33		int ret;
>     34	
>     35		slot = devm_kzalloc(dev, sizeof(*slot), GFP_KERNEL);
>     36		if (!slot)
>     37			return -ENOMEM;
>     38	
>   > 39		ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
>     40						&slot->supplies);
>     41		if (ret < 0) {
>     42			dev_err_probe(dev, ret, "Failed to get slot regulators\n");
>     43			return ret;
>     44		}
>     45	
>     46		slot->num_supplies = ret;
>     47		ret = regulator_bulk_enable(slot->num_supplies, slot->supplies);
>     48		if (ret < 0) {
>     49			dev_err_probe(dev, ret, "Failed to enable slot regulators\n");
>     50			goto err_regulator_free;
>     51		}
>     52	
>     53		ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_power_off,
>     54					       slot);
>     55		if (ret)
>     56			goto err_regulator_disable;
>     57	
>     58		pci_pwrctrl_init(&slot->ctx, dev);
>     59	
>     60		ret = devm_pci_pwrctrl_device_set_ready(dev, &slot->ctx);
>     61		if (ret)
>     62			return dev_err_probe(dev, ret, "Failed to register pwrctrl driver\n");
>     63	
>     64		return 0;
>     65	
>     66	err_regulator_disable:
>     67		regulator_bulk_disable(slot->num_supplies, slot->supplies);
>     68	err_regulator_free:
>     69		regulator_bulk_free(slot->num_supplies, slot->supplies);
>     70	
>     71		return ret;
>     72	}
>     73	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
மணிவண்ணன் சதாசிவம்

Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC1D3D62
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 08:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707725869; cv=none; b=qhZ+pHVh4pcfvC4Rhk7ddSJhDytzcRRwT/KF1xkECrHyiSNhVn0DSzmwMXCOeOePbnPdlQhOagWUS73AhJCh2/m/0wkB+yaXhIzJvSj1fSEMnvnLLB4g01znhvyxRcWAhXj1sgwiZs1634UpE9EmrRH1fQ2gMCJKTnGwAPoi2Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707725869; c=relaxed/simple;
	bh=tOIPNw4dNbIPeVbG3nByvllBJfybEKyRu13UE5L0Cd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=EIrarYrnyAdi5q5cbfi5QYFIWvurCiEWMw0eC39z5LEswawr3zSiYZ3BMAY04CYly2WYDtmoPPqpuE/cD2mySP/+p9AXraZnL93K5RbisfvLqleaS5Z2cqxPLJdIaY/drK+ldKABVX5a/Wv0xo78TwoEP2NTvlBU9D5SAS9hyRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aqFMaDc9; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aqFMaDc9"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55f279dca99so4166297a12.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 00:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707725866; x=1708330666; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IgRlFVad8LwIhP5jpZKETMsb6daw55MtLMHfKSOgg7c=;
        b=aqFMaDc9yqdp5kuXdc+shxVgI7z32vxE6hpaX9Ar8JH4ssqD3k8fMToWIudGEpNmuo
         kzAcHCtw2l1ohu/u2rR7THjIZBqlACM0Qt562CUUHJjjl5hK/3lcRTy6jAUMP+oAoFL5
         CnDu4ZWu759X9aAcVoxTQAxvG7NaLV48gvm0RLIZjO+lhlPKgp1SlCjVVZgbSWAainqZ
         0FY/jPN6hH/SVLEnarA5Q4PupUbIZN16DwUbfdeyofuqZFLmyhGWkc1qJkKcBBXaDdNR
         32VJ4hN8Gj0yemj5r3PJAtTcJ5Qq92GI4rs/nXNYDWiY1tVCprGwFs7x42UO/cFNXpL0
         KJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707725866; x=1708330666;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgRlFVad8LwIhP5jpZKETMsb6daw55MtLMHfKSOgg7c=;
        b=UWV+XdGTZaWOKaHYKSMt3bbVEXOCnndaCA9Bw2j7l1fJHVX91EreYFumea9E7r6jLB
         8lgTrks0xlp9EJC+jxKT+jLzh7MpGo5qur+VFSyCHS3bFJCgLX8cjMa3dmFMPN+cr0q1
         O14HYBgeJuM+RajQAOkMiFAYfEfwGbIES7lJU+lJEI9mKuZUyxufep9+ybnREQa+we6c
         IUZCfY4URi25s0D0v2Bf3FtVZymuxyIowWyEli5yK8JTvNnq9EBngGtVRdlpxOHHJkTn
         oakM724W04U1UbFFcNSe31jzAcvAvJw+1VYOopdZ1cft1tuGxpZwL9lm85JVSoPY9b3y
         CndA==
X-Gm-Message-State: AOJu0YzQ4moF3V0YgClrNVVPiKNTQMRQjM8RUyi6a3GQ70Q8ri7tzB2J
	8+JxRM3oxcglcaNYdv0ELFQRLRgot4P6qfs/FYU1DqJSpOYDLmTpIZtHcCaJick=
X-Google-Smtp-Source: AGHT+IFhzNR3hgdBD/mnCMKuG1BgHLbkCR5vTiQsXZ5H3Eb0NydIX8xbWHz53/LNTiM3sGYggui9Ew==
X-Received: by 2002:aa7:c71a:0:b0:560:ea74:a679 with SMTP id i26-20020aa7c71a000000b00560ea74a679mr3582158edq.5.1707725866330;
        Mon, 12 Feb 2024 00:17:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+bdymo+XkURNN2y3EbZ/jsCpvOyKu/b7kSnFBkbqgd7diDwNr5qp9P5vNBX2LMK4ZJxeBPVMy6jadExOWHhSaEMNXh03eSHvJCDXk+sIfrWkaodtMXIVcNSnJ6JlqUUkbXSeb8pYt1PWjqBuK7OLWdjD76SiFm9cRxF2f
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id b6-20020aa7c906000000b00560ba66587csm2462955edt.13.2024.02.12.00.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 00:17:46 -0800 (PST)
Date: Mon, 12 Feb 2024 11:17:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Eric Woudstra <ericwouds@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 2/2] net: phy: air_en8811h: Add the Airoha
 EN8811H PHY driver
Message-ID: <20977ba9-0cdd-4f5d-a203-64b01af2acfb@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206194751.1901802-3-ericwouds@gmail.com>

Hi Eric,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Woudstra/dt-bindings-net-airoha-en8811h-Add-en8811h-serdes-polarity/20240207-035021
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240206194751.1901802-3-ericwouds%40gmail.com
patch subject: [PATCH net-next 2/2] net: phy: air_en8811h: Add the Airoha EN8811H PHY driver
config: sh-randconfig-r081-20240211 (https://download.01.org/0day-ci/archive/20240211/202402110805.r1KRiKtL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402110805.r1KRiKtL-lkp@intel.com/

smatch warnings:
drivers/net/phy/air_en8811h.c:560 air_led_hw_control_set() error: testing array offset 'index' after use.

vim +/index +560 drivers/net/phy/air_en8811h.c

3fe47bc0b949e7 Eric Woudstra 2024-02-06  551  static int air_led_hw_control_set(struct phy_device *phydev, u8 index,
3fe47bc0b949e7 Eric Woudstra 2024-02-06  552  				  unsigned long rules)
3fe47bc0b949e7 Eric Woudstra 2024-02-06  553  {
3fe47bc0b949e7 Eric Woudstra 2024-02-06  554  	struct en8811h_priv *priv = phydev->priv;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  555  	u16 on = 0, blink = 0;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  556  	int ret;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  557  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  558  	priv->led[index].rules = rules;
                                                         ^^^^^^
out of bounds

3fe47bc0b949e7 Eric Woudstra 2024-02-06  559  
3fe47bc0b949e7 Eric Woudstra 2024-02-06 @560  	if (index >= EN8811H_LED_COUNT)
                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^

Too late.  priv->led[] has EN8811H_LED_COUNT elements.

3fe47bc0b949e7 Eric Woudstra 2024-02-06  561  		return -EINVAL;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  562  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  563  	if (rules & (BIT(TRIGGER_NETDEV_LINK_10)   | BIT(TRIGGER_NETDEV_LINK))) {
3fe47bc0b949e7 Eric Woudstra 2024-02-06  564  		on |= AIR_PHY_LED_ON_LINK10;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  565  		if (rules & BIT(TRIGGER_NETDEV_RX))
3fe47bc0b949e7 Eric Woudstra 2024-02-06  566  			blink |= AIR_PHY_LED_BLINK_10RX;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


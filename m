Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD8320127E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 21:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719955637; cv=none; b=uGGugXeSGMpfGuCDeS/JvBBswvQpFpaGrzNf8myPS1dL8E0GdXQ/j43PYd/EZyGq8c+Llo/3EvQZT3bcR1zBl8B3uAiuvHLcZxpgL5B7dToAj9NcOtYd00hVKOEiZkCUBmdYPz9yuaetUL7rvXILNN5CbkPUnWUcTgle+WkJRSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719955637; c=relaxed/simple;
	bh=O+o3Ib11ciLZU7Bvqliq2+mbTCErwHIwUfXdIcVPsOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=GLvXlfwqJqIJT6OaNScp74XwlFVRLe++2PWSsgpJwVwO5fR33P7ynq8CEJ0ILnrqx+ObdgdGhM6OGg8TVSyLPw0Meo7G5m3qo4iTUoeqz5ltOMlZKubE+5HLRKnIhGrlMbXmoqMOED2ecREoH73oy+e9Dy3vPN3Jn6CCjPBtrLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gfueg6SP; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gfueg6SP"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-250c0555a63so2325527fac.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Jul 2024 14:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719955635; x=1720560435; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nTzF53NuroztRgrbHB394lFrc7XZKur8WQZSwEHeFpA=;
        b=gfueg6SP76kEUnci6ky0CPtBHVLOhfgTguxmvRQKMhuyddFLeRHjhX2chNLb22utSI
         Z6NnjB18+0s0Bj10JSMM2TGTJOs8WGP/i6AQS/4fNDKQ0akTWKUm2iVeb/WeLZ0FMGSu
         WRGJ1CcQlhDQohiiPBdqD4Ra5fIokH9lHUAAtMEJ+2USCmRLOO0CM1wMb69tccqUhNTM
         LQYLcfH5cV8jiLFmljRkD7jm3UYXtnTjhd/r45ZYg0qO6qT7uXB5sGnoD20zHjaBF8ey
         X/88TjxZE/PDG75t0S8C2hDMJr1tpHE7po9xBmIOk0bzpyiiqouA7uVqLYrH/rGykbD9
         44CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719955635; x=1720560435;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTzF53NuroztRgrbHB394lFrc7XZKur8WQZSwEHeFpA=;
        b=JWms2T+AQvg21akDfGISl1L2MMEDB0l6oC4HVaiidOZQmxq3dZ9kRSAy2cKVVRL8CG
         slRN5cYvWc3l7Nh8dxbCDsYULheAHzpZGEO7IKvEvtBHopGVmu00mDydlI9WFVIkvsFO
         jA6d9ZXvNPjOtONavihIZfL89ZAsHImtpH5Mfl81MX/vF9uPQjgGgc/w8lTyR1Fq+lTo
         Mdqs7AlfscafR2RvP3zcdF1He9v7NgtwOw1PQo7l7saIl18KJNZcOrxi95sluPinXY2K
         R3NmVVn1WhfX4TJZxKDOTy8xZ1ae3D+xh9lLtcD5E81KRxpz41GsHIIkr/NPRdQiwuQZ
         kRGA==
X-Forwarded-Encrypted: i=1; AJvYcCWiM6chmCMuk8DKPTjpG3/cXagQOhe0n7Bf6MCWY9ZbWWuK70aa3ZjxP+JoKRoC5VKc3oDEfsB0STpd9aEi1BzYteRZ06kFnoJbA7BHMg==
X-Gm-Message-State: AOJu0YxUHq9wRG3Ba/3QF13NP8lmZ6KJHmTgwxvwU2D8k3NXbbeBnyif
	0PjuR2Tmc1tLyMJIaYKoUivWNLXE+qYDIQzxevu/yLRPWD2T+SgoK3fJBOJtOVo=
X-Google-Smtp-Source: AGHT+IEXkSehpzi4dO+e44Mjuzyc/L9KJG1nFcAOno11tON/+OnVJMgXU857jRLULOgie6mk2dtQcQ==
X-Received: by 2002:a05:6871:b09:b0:254:c41a:2b34 with SMTP id 586e51a60fabf-25db33f824emr8393430fac.22.1719955635025;
        Tue, 02 Jul 2024 14:27:15 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a6f1:b7be:4c8c:bf62])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25d8e37ee64sm2386570fac.47.2024.07.02.14.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 14:27:14 -0700 (PDT)
Date: Tue, 2 Jul 2024 23:27:12 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, iansdannapel@gmail.com,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Andre Przywara <andre.przywara@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-fpga@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ian Dannapel <iansdannapel@gmail.com>
Subject: Re: [PATCH v2 1/3] fpga: Add Efinix Trion & Titanium serial SPI
 programming driver
Message-ID: <6286e61c-6822-40d4-a43e-617a4ce257ca@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628152348.61133-2-iansdannapel@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/iansdannapel-gmail-com/fpga-Add-Efinix-Trion-Titanium-serial-SPI-programming-driver/20240630-044745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240628152348.61133-2-iansdannapel%40gmail.com
patch subject: [PATCH v2 1/3] fpga: Add Efinix Trion & Titanium serial SPI programming driver
config: powerpc-randconfig-r081-20240701 (https://download.01.org/0day-ci/archive/20240703/202407030525.VHF3He6K-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407030525.VHF3He6K-lkp@intel.com/

smatch warnings:
drivers/fpga/efinix-trion-spi-passive.c:174 efinix_spi_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +174 drivers/fpga/efinix-trion-spi-passive.c

4c272ecc14b70f Ian Dannapel 2024-06-28  152  static int efinix_spi_probe(struct spi_device *spi)
4c272ecc14b70f Ian Dannapel 2024-06-28  153  {
4c272ecc14b70f Ian Dannapel 2024-06-28  154  	struct efinix_spi_conf *conf;
4c272ecc14b70f Ian Dannapel 2024-06-28  155  	struct fpga_manager *mgr;
4c272ecc14b70f Ian Dannapel 2024-06-28  156  
4c272ecc14b70f Ian Dannapel 2024-06-28  157  	conf = devm_kzalloc(&spi->dev, sizeof(*conf), GFP_KERNEL);
4c272ecc14b70f Ian Dannapel 2024-06-28  158  	if (!conf)
4c272ecc14b70f Ian Dannapel 2024-06-28  159  		return -ENOMEM;
4c272ecc14b70f Ian Dannapel 2024-06-28  160  
4c272ecc14b70f Ian Dannapel 2024-06-28  161  	conf->spi = spi;
4c272ecc14b70f Ian Dannapel 2024-06-28  162  
4c272ecc14b70f Ian Dannapel 2024-06-28  163  	conf->creset = devm_gpiod_get(&spi->dev, "creset", GPIOD_OUT_HIGH);
4c272ecc14b70f Ian Dannapel 2024-06-28  164  	if (IS_ERR(conf->creset))
4c272ecc14b70f Ian Dannapel 2024-06-28  165  		return dev_err_probe(&spi->dev, PTR_ERR(conf->creset),
4c272ecc14b70f Ian Dannapel 2024-06-28  166  				"Failed to get RESET gpio\n");
4c272ecc14b70f Ian Dannapel 2024-06-28  167  
4c272ecc14b70f Ian Dannapel 2024-06-28  168  	conf->cs = devm_gpiod_get(&spi->dev, "cs", GPIOD_OUT_HIGH);
4c272ecc14b70f Ian Dannapel 2024-06-28  169  	if (IS_ERR(conf->cs))
4c272ecc14b70f Ian Dannapel 2024-06-28  170  		return dev_err_probe(&spi->dev, PTR_ERR(conf->cs),
4c272ecc14b70f Ian Dannapel 2024-06-28  171  				"Failed to get CHIP_SELECT gpio\n");
4c272ecc14b70f Ian Dannapel 2024-06-28  172  
4c272ecc14b70f Ian Dannapel 2024-06-28  173  	if (!(spi->mode & SPI_CPHA) || !(spi->mode & SPI_CPOL))
4c272ecc14b70f Ian Dannapel 2024-06-28 @174  		return dev_err_probe(&spi->dev, PTR_ERR(conf->cs),

s/conf->cs/-EINVAL/

4c272ecc14b70f Ian Dannapel 2024-06-28  175  				"Unsupported SPI mode, set CPHA and CPOL\n");
4c272ecc14b70f Ian Dannapel 2024-06-28  176  
4c272ecc14b70f Ian Dannapel 2024-06-28  177  	conf->cdone = devm_gpiod_get_optional(&spi->dev, "cdone", GPIOD_IN);
4c272ecc14b70f Ian Dannapel 2024-06-28  178  	if (IS_ERR(conf->cdone))
4c272ecc14b70f Ian Dannapel 2024-06-28  179  		return dev_err_probe(&spi->dev, PTR_ERR(conf->cdone),
4c272ecc14b70f Ian Dannapel 2024-06-28  180  				"Failed to get CDONE gpio\n");
4c272ecc14b70f Ian Dannapel 2024-06-28  181  
4c272ecc14b70f Ian Dannapel 2024-06-28  182  	mgr = devm_fpga_mgr_register(&spi->dev,
4c272ecc14b70f Ian Dannapel 2024-06-28  183  				"Efinix SPI Passive Programming FPGA Manager",
4c272ecc14b70f Ian Dannapel 2024-06-28  184  					&efinix_spi_ops, conf);
4c272ecc14b70f Ian Dannapel 2024-06-28  185  
4c272ecc14b70f Ian Dannapel 2024-06-28  186  	return PTR_ERR_OR_ZERO(mgr);
4c272ecc14b70f Ian Dannapel 2024-06-28  187  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


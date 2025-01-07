Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA1C1DDC06
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 07:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736233845; cv=none; b=SWLWmF8m6ecHdzRYRwyXic/XpHvjNgISz82iARFmsdMTXNF3h0XtdJW0w5CmWLE413PSJPG4kc/+qPaSm2o43Ou6sLcDrGLMYpoqsC8IdVEUcn+T5GtLGpkEdag6MIi1DU/TPcUkLuDymj1AtHMu1JIogl8bPDwkfPsBIcXvZUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736233845; c=relaxed/simple;
	bh=knmlkzZmomk2UGvcFIon1Q9Wd0GhVKMpQAKMHPp8gtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=d+JmLulAodGsHSWw60RPAcqRFn8sIzHzF4Df8j9RwOZ+05lnKjZ0zQeTnUBd/yBjqSs9EKnXNwf+kSf+7hv/+VvkurZ9c6o0Jenjv13HSW2raGNLMqYSzeVQI/fKWVfbNnVVBG4Kjyeuh/6qtL8fjRTIbslvRwvyFnV5sjl/QAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vlPH96pF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlPH96pF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso11514520f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 23:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736233839; x=1736838639; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LxC2QvRLaa9fhyMEEmnqLTIucuZnpaiOnMycBsmrjig=;
        b=vlPH96pFlVWzprGxsw7Gpknbr2VwQt581IbBghkcy4DMBVtD04VZrCjaLAvbXaMlXR
         5IGVvgvfvTHB2/C0i/+jl0EdcXS4NblJOKxXDoGNIUGUAnEYslNeaZaGAt2/Z+DfJny3
         GWIXR5UJAsjU46awSKCJH9h5TG9o6RFpEOhLLay/oeLT0b/gq/D5v9QGHeOwmQSRjTb6
         tXYU8hwyFiwFXiV2viH+t0RtCZWgiUeUtgRifkSM8wfvvlykODG2H1p/wV3NYawuzOIc
         EK0JbOVHzayyxHyoyR1/FAFUluIvS2weoJS+gwHgiVTju5b7lVBvbGQWpV+6M4YLoY7L
         HPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736233839; x=1736838639;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxC2QvRLaa9fhyMEEmnqLTIucuZnpaiOnMycBsmrjig=;
        b=VeyT9f2wTR7xMoaH3i6wYd8Aea3WiTvRjXFOTbJL2Msm1oYfY06uQDlEPoExdzPQxk
         +3Tw0eYgbk71/SqX4f77Rb/XwcpXXty/dD4eWy3YF9CRrnl6lvC+Z/Inel0rTTArW1fn
         +iX+TDMCZ+DpoU0qapY/lndtNAuhu3KMb64Q+Qec/pRnP4RTk6RW9BmeqS03GIEC4Wj7
         bph0CwwNvEMB4uM16J2+oZP4JowyXQsxwtzY+x/FQqXlsb0IPED7YmxdMp++gZ2GurGF
         7QxsbVyzHDxa5cEt7xrBEvYBnaZe9c2VWX8cc2qcOd/BDWtZ3tk9EJv6uwukwLAbJGUq
         Un0g==
X-Forwarded-Encrypted: i=1; AJvYcCU95gyl91m7XcTizsVCCJEcEqKNUFk5mHdG2ctqavDTCenUUyqwvichiAVSycCVEaCL9Hp15MsTHPmtih//@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs6oLTZ2JG7kkV9KrXVPwQid84DhqTtiPoFxXwvSpneoPUim2O
	67tQ0FdPrL5bobhasw1tJVqKiZnlA9I2CHx7o3OijQJS6DRTasKgms9WkS/p/1g=
X-Gm-Gg: ASbGncu2oscNLESCNMlCcXpxb55JcIWKoHFvI00QnuTJRh/8aAQqS2rEhgfNnN3X3VO
	CkRc8RknAqs1f8eISm5pR10v06b0q7aEh534in/vOcKerGl+AT5IaTaPfWnZWXlr3/gH/H+8aTl
	Cn2tYNOP9K3x6fEkxL0uMX+vBzH4d91yQFSXtjZ2yHbcpulYYA/4qIjI/UieeQtu9ovEWV37TUs
	rtNIntPI8Az99t/4bq8dFAH9xdDxi7o40HzCWpmJ1tPRslchYJqMECukAN1kw==
X-Google-Smtp-Source: AGHT+IFIR4835eW6e7ZZ8gI1DpDQcwGI8R4kehDIZa6LnIgHnu7A7jNtqUCLWF6+KIJF30TnCX1P0g==
X-Received: by 2002:adf:a445:0:b0:38a:2b39:9205 with SMTP id ffacd0b85a97d-38a2b3993dfmr39812671f8f.33.1736233838547;
        Mon, 06 Jan 2025 23:10:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c829235sm48855108f8f.15.2025.01.06.23.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 23:10:38 -0800 (PST)
Date: Tue, 7 Jan 2025 10:10:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Divya Koppera <divya.koppera@microchip.com>,
	andrew@lunn.ch, arun.ramadoss@microchip.com,
	UNGLinuxDriver@microchip.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, richardcochran@gmail.com,
	vadim.fedorenko@linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 3/3] net: phy: microchip_rds_ptp : Add PEROUT
 feature library for RDS PTP supported phys
Message-ID: <f65330e7-825b-46ff-8e95-c046a2359705@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103090731.1355-4-divya.koppera@microchip.com>

Hi Divya,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Divya-Koppera/net-phy-microchip_rds_ptp-Header-file-library-changes-for-PEROUT/20250103-171126
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250103090731.1355-4-divya.koppera%40microchip.com
patch subject: [PATCH net-next 3/3] net: phy: microchip_rds_ptp : Add PEROUT feature library for RDS PTP supported phys
config: arm64-randconfig-r072-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071428.F9gIQY3T-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501071428.F9gIQY3T-lkp@intel.com/

smatch warnings:
drivers/net/phy/microchip_rds_ptp.c:247 mchp_rds_ptp_perout_off() error: uninitialized symbol 'event'.

vim +/event +247 drivers/net/phy/microchip_rds_ptp.c

568c86a861124f Divya Koppera 2025-01-03  228  static int mchp_rds_ptp_perout_off(struct mchp_rds_ptp_clock *clock,
568c86a861124f Divya Koppera 2025-01-03  229  				   s8 gpio_pin)
568c86a861124f Divya Koppera 2025-01-03  230  {
568c86a861124f Divya Koppera 2025-01-03  231  	u16 general_config;
568c86a861124f Divya Koppera 2025-01-03  232  	int event;
568c86a861124f Divya Koppera 2025-01-03  233  	int rc;
568c86a861124f Divya Koppera 2025-01-03  234  
568c86a861124f Divya Koppera 2025-01-03  235  	if (clock->mchp_rds_ptp_event_a == gpio_pin)
568c86a861124f Divya Koppera 2025-01-03  236  		event = MCHP_RDS_PTP_EVT_A;
568c86a861124f Divya Koppera 2025-01-03  237  	else if (clock->mchp_rds_ptp_event_b == gpio_pin)
568c86a861124f Divya Koppera 2025-01-03  238  		event = MCHP_RDS_PTP_EVT_B;

What about: else return -EINVAL;?

568c86a861124f Divya Koppera 2025-01-03  239  
568c86a861124f Divya Koppera 2025-01-03  240  	/* Set target to too far in the future, effectively disabling it */
568c86a861124f Divya Koppera 2025-01-03  241  	rc = mchp_set_clock_target(clock, gpio_pin, 0xFFFFFFFF, 0);
568c86a861124f Divya Koppera 2025-01-03  242  	if (rc < 0)
568c86a861124f Divya Koppera 2025-01-03  243  		return rc;
568c86a861124f Divya Koppera 2025-01-03  244  
568c86a861124f Divya Koppera 2025-01-03  245  	general_config = mchp_rds_phy_read_mmd(clock, MCHP_RDS_PTP_GEN_CFG,
568c86a861124f Divya Koppera 2025-01-03  246  					       MCHP_RDS_PTP_CLOCK);
568c86a861124f Divya Koppera 2025-01-03 @247  	general_config |= MCHP_RDS_PTP_GEN_CFG_RELOAD_ADD_X_(event);
568c86a861124f Divya Koppera 2025-01-03  248  	rc = mchp_rds_phy_write_mmd(clock, MCHP_RDS_PTP_GEN_CFG,
568c86a861124f Divya Koppera 2025-01-03  249  				    MCHP_RDS_PTP_CLOCK, general_config);
568c86a861124f Divya Koppera 2025-01-03  250  	if (rc < 0)
568c86a861124f Divya Koppera 2025-01-03  251  		return rc;
568c86a861124f Divya Koppera 2025-01-03  252  
568c86a861124f Divya Koppera 2025-01-03  253  	if (event == MCHP_RDS_PTP_EVT_A)
568c86a861124f Divya Koppera 2025-01-03  254  		clock->mchp_rds_ptp_event_a = -1;
568c86a861124f Divya Koppera 2025-01-03  255  
568c86a861124f Divya Koppera 2025-01-03  256  	if (event == MCHP_RDS_PTP_EVT_B)
568c86a861124f Divya Koppera 2025-01-03  257  		clock->mchp_rds_ptp_event_b = -1;
568c86a861124f Divya Koppera 2025-01-03  258  
568c86a861124f Divya Koppera 2025-01-03  259  	return 0;
568c86a861124f Divya Koppera 2025-01-03  260  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


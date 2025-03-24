Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BC013B58C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 05:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742795829; cv=none; b=W6LYcwyRwnvn5iS/waj0HIK4yKKCFjVLArP27wUErYqprPt9HuHLHfQdtW5dnX87Ty67eSmmIKxVKlQv4HuQF0fT7eivdWQNhdszWxP3kWpZp1yquGT82r1j+AFMPiF51pAmPOSBrLGRrQW9x6iBpZ18mCsNlpQMojj6r5aG2Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742795829; c=relaxed/simple;
	bh=yK22GbG4xDR5tpJ2L7cDLmbCpPJ7gOPjq7MbY8FTLKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=pVHl0Dmcx3Li4dSpQW7Zyiiv0UD3fnDcNn1nvob++ajAe+asMcnAq3PfgUI1wryVTEQStBFv12Xk2iw6GgQBaLIkiClFC8fERbLYafnhj3fwYwT8wdGxR51WW+kiiE6t6f54MXuVAWMB93fIyN2kolRhtFlMJZ5c9KrM5hA3eIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=prZ8FgCd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="prZ8FgCd"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso24269005e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 22:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742795826; x=1743400626; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4+3RaTrlVAiLgCSwUy9QyVIrIBEVE7upW1lWNHsX+C0=;
        b=prZ8FgCdZzIfvZWGvGfOu/ehD+aWJfOkOaaFqxUtnoyjGiQmlCKFGctPO7WJxiR9Gd
         Em6tYILDyJOzjHDiOJy6C6H8J6cbfgu+hJiFh5vjinZPqLtbmNI2JxwOlHa3COYQXlRk
         sEzd37uho283jd5YTJrTfBfeGALsmeWi2Zx1yBB6TzRNICTL5vZVywa33hxDgrvjYEDp
         uE6gOYjX+dkTnDHzfaQHDje2vQp2Ns1tnSYvgOcopo931YfY42NHfJOcF39pf9zMdWdM
         gdhA+ReLJbcglPVi6WPzxi4AZp20gx0kuXCR2o1NTN22tyQVbunszRnM6iIF4wpccpEG
         RTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742795826; x=1743400626;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+3RaTrlVAiLgCSwUy9QyVIrIBEVE7upW1lWNHsX+C0=;
        b=Bn/3nbD1c4+nCBJO5m48AHHUTxHGXd4lB/BSZwnpkHyuwA0I2y4pgHlHjM3bzE/LXl
         vHdiYKKvcVg8GrwY7Y3w45o1rAWH0d8JY+jOcVX2CgCHZIWcNbi17LbpJ0RAQkpr2fOX
         S65To3aEQvSe/+LSD3gUVOuMY6mYITaDq+aFlz0qeIa59xrv4ukoNOWKv/OAWHflWTKz
         MeObDp6xMVOKR4dEAOTbOVmRBvuOEYxnKFR79ww+EoEaeOMOvXejGrhpgVH2xTDOkzX3
         NuxiNqjomUYsS+ShD1oOMlih255/nI+wUfpKT/3tWl4QwDh7JVGHwvjTtYwJ0BnrFxyD
         +qhw==
X-Forwarded-Encrypted: i=1; AJvYcCW0+gE+4PwFokv7qPFpmBvUBTz2IBIxjSEA8EwCqmwKWXNMOHvXu+m4NKWpGDVlb8ag+pndcf8e9s94k3pC@lists.linux.dev
X-Gm-Message-State: AOJu0YykG9rMF6Zji9ebqh81/pnYH2p1X1IoZXytN1TVMI5gcy8ao5Jh
	9y3aJXCVYIGMha/F74OSrzoVd71Gac878+9TxL8E0j0JQjlbo/YjziOpnLumU/M=
X-Gm-Gg: ASbGncsdRsO7DqczbGJ7orAVzTgcfwIR9GrZpuuX3jhPKgKFl2LIvP7zVozQ9Adgx5i
	5uHT4cG3Y8A1Xq3/KzXceTRVPUjwFmnWNaoVTvGtbDZ6YxzxavLkVX/MolPnm/OdWkWhnsbyZXm
	SFmkex+MimMbAWjTO6kxRqdO148FBwlgNQoCCCEmVDxciS3M/kWBdNaD5NNujWmyUCrM2Z2QJdi
	XyyienmjhYw+zHNxUH02n7HekH4xkle3vCwXoNyh72A2KkYRqseLL/vJdFgC54h0hO8PWqhs1Do
	8FK1Ldyo6shG/ukHVsYAW0XcT/7qn4lsToHIwosjVa3kR+pK3g==
X-Google-Smtp-Source: AGHT+IGBJk2IE9p/N0M4OVRPHgVaFd0YOSBb6gH60ACjOhn7ZLP7HV/wA45D9o3sKG+RfqW3dLbOVQ==
X-Received: by 2002:a05:600c:5488:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-43d50a31981mr77702895e9.21.1742795825560;
        Sun, 23 Mar 2025 22:57:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9b3c2csm9704140f8f.46.2025.03.23.22.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 22:57:05 -0700 (PDT)
Date: Mon, 24 Mar 2025 08:57:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, marius.cristea@microchip.com,
	jic23@kernel.org, lars@metafoo.de, robh@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, krzk+dt@kernel.org,
	conor+dt@kernel.org, oskar.andero@gmail.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, marius.cristea@microchip.com
Subject: Re: [PATCH v2 2/2] iio: adc: adding support for PAC194X
Message-ID: <167bb94a-4c9d-4499-aa7a-cc38428d7297@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317090803.30003-3-marius.cristea@microchip.com>

Hi,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/marius-cristea-microchip-com/dt-bindings-iio-adc-adding-support-for-PAC194X/20250317-171150
base:   577a66e2e634f712384c57a98f504c44ea4b47da
patch link:    https://lore.kernel.org/r/20250317090803.30003-3-marius.cristea%40microchip.com
patch subject: [PATCH v2 2/2] iio: adc: adding support for PAC194X
config: arm64-randconfig-r071-20250322 (https://download.01.org/0day-ci/archive/20250323/202503230315.DVkVt7Ag-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503230315.DVkVt7Ag-lkp@intel.com/

smatch warnings:
drivers/iio/adc/pac1944.c:1707 pac1944_retrieve_data() error: uninitialized symbol 'ret'.
drivers/iio/adc/pac1944.c:2463 pac1944_write_thresh() warn: inconsistent indenting

vim +/ret +1707 drivers/iio/adc/pac1944.c

e227d6e5b38646 Marius Cristea 2025-03-17  1681  static int pac1944_retrieve_data(struct pac1944_chip_info *info, u32 wait_time)
e227d6e5b38646 Marius Cristea 2025-03-17  1682  {
e227d6e5b38646 Marius Cristea 2025-03-17  1683  	int ret;
e227d6e5b38646 Marius Cristea 2025-03-17  1684  
e227d6e5b38646 Marius Cristea 2025-03-17  1685  	/*
e227d6e5b38646 Marius Cristea 2025-03-17  1686  	 * Check if the minimal elapsed time has passed and if so,
e227d6e5b38646 Marius Cristea 2025-03-17  1687  	 * re-read the chip, otherwise the cached info is just fine
e227d6e5b38646 Marius Cristea 2025-03-17  1688  	 */
e227d6e5b38646 Marius Cristea 2025-03-17  1689  	if (time_after(jiffies, info->chip_reg_data.jiffies_tstamp +
e227d6e5b38646 Marius Cristea 2025-03-17  1690  		       msecs_to_jiffies(PAC1944_MIN_POLLING_TIME_MS))) {
e227d6e5b38646 Marius Cristea 2025-03-17  1691  		/*
e227d6e5b38646 Marius Cristea 2025-03-17  1692  		 * We need to re-read the chip values
e227d6e5b38646 Marius Cristea 2025-03-17  1693  		 * call the pac1944_reg_snapshot
e227d6e5b38646 Marius Cristea 2025-03-17  1694  		 */
e227d6e5b38646 Marius Cristea 2025-03-17  1695  		ret = pac1944_reg_snapshot(info, true,
e227d6e5b38646 Marius Cristea 2025-03-17  1696  					   PAC1944_REFRESH_REG_ADDR,
e227d6e5b38646 Marius Cristea 2025-03-17  1697  					   wait_time);
e227d6e5b38646 Marius Cristea 2025-03-17  1698  		/*
e227d6e5b38646 Marius Cristea 2025-03-17  1699  		 * Re-schedule the work for the read registers timeout
e227d6e5b38646 Marius Cristea 2025-03-17  1700  		 * (to prevent chip regs saturation)
e227d6e5b38646 Marius Cristea 2025-03-17  1701  		 */
e227d6e5b38646 Marius Cristea 2025-03-17  1702  		cancel_delayed_work_sync(&info->work_chip_rfsh);
e227d6e5b38646 Marius Cristea 2025-03-17  1703  		schedule_delayed_work(&info->work_chip_rfsh,
e227d6e5b38646 Marius Cristea 2025-03-17  1704  				      msecs_to_jiffies(PAC1944_MAX_RFSH_LIMIT_MS));
e227d6e5b38646 Marius Cristea 2025-03-17  1705  	}

ret isn't initialized on else path.

e227d6e5b38646 Marius Cristea 2025-03-17  1706  
e227d6e5b38646 Marius Cristea 2025-03-17 @1707  	return ret;
e227d6e5b38646 Marius Cristea 2025-03-17  1708  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


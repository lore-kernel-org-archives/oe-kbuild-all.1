Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25F3143860
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jun 2024 09:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717492690; cv=none; b=s9aKET1tnPzSy3BrW92W49kvNJquYAMVbIJSUL2viYEVB3biTIKGEhopB/PttglsabfbkJW1/BfOaPsC2TlV3xtp/9InCRgmdpiynZ33YZlqmm9iq1TWziL8IeHN8PHONlqqWmljHlPlLE5+yW65TeHgPjzaCB7aOkAUHc4+UCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717492690; c=relaxed/simple;
	bh=coll5pd39ElrkIZGCeZy/pf/qfLIkxiTf6UAfa/GybI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JeSUG1eGc2yOKUC/hQZCfs3xfOGa9Ju1UyoMN6lFz5tDwVZY70nY0nE8wSzLRFpzGRt+SLHwSpwa6Z2npNATqtIMCllgEGtOWGjX7ZeVfgEuNrjm2FTY88PtLKAxoiMkeFp+j0nfxk8l4UNIX8OZLYX9blI5aLBOcEGUtHFFpuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IHsJ60c2; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IHsJ60c2"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57a32b0211aso851268a12.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Jun 2024 02:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717492686; x=1718097486; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z/B9hwk8gme+G1CpVjbJqCaQW7S8fDB15IbyupvMh58=;
        b=IHsJ60c25EtNQ7WQr9kmjFuHhBD1btPK194RRIw9wLlKd92lYi+8SP55TgUQZe48MO
         9x9ObwUDuwyJAiVEB8Yr+2x0cUxqH11dJ6byqLopqmH60tzRLT8O3JCjCYrW02Rs+Jfx
         Zs1F4e/8rgMHaIOiqjhWW96mV6HhvkrBvZIX1opf9ij827eEdBaTe+h6HAyFiZSk03P1
         aMVMnIWgVPyf1/0BuhBdS9j4XzhoDdFSOWqQDz72xyTaf5wQSym4i8ffSG8zRLIgXDX/
         UCjw1w+ONvciYfsYKCG24S+FfednPQEFQxmn0zKaCPd0HCxoVfhe4dShu5U3p7z27msT
         vaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717492686; x=1718097486;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/B9hwk8gme+G1CpVjbJqCaQW7S8fDB15IbyupvMh58=;
        b=i/4iPOtDrq3D0ADsKeMkpj6/wKrsTB591zUjbKlYZ5Udd9mhnGSbQaTCbZ3op4EJWd
         wEFh2LxnxF0S4ul05PEatdKkRa5TfOCo7UPKp5sdGRbKA6x5DlkOCB/WdmLRNaKWjtbd
         497CMkRnAcOyshC6KEOZoCMeK4OSupXI9eIE+bYzTKyUahxCi1oBiSwckBqCs3GM7MQy
         F+AJ5ZXyUVysCi/QPk+1ZYjLL2ROVPbcFpCWe/U7d7LUZpe9X3sKSfE21EbmFkFYOp2b
         Xm93cSCqxUH8Hdi78ceToanJ2G6QrdUAg5Ravwrxv6RqKu/QsBU2RECsjCT4iw/eiP2s
         foOA==
X-Forwarded-Encrypted: i=1; AJvYcCVyCgDib0YOMKdGusM/vX6ojcEIAJmmUuP3eDQSCU984rxzCtIDcb6Sc9+ZsLYVAO6WJ6nvyeF4gmqCxaHG1ZS+HRlPsYtZ2HYfEeMVnA==
X-Gm-Message-State: AOJu0YxGlKimE6A39BOlP1+14fGSprjf5ijbXfyERcFIvhdT+OA1aruc
	igitM716Nn7Y2EFRlgZF33EzY+GyJh9u0ccmIW4r5gQwd+BFn4fEkxyLpGGMgq4=
X-Google-Smtp-Source: AGHT+IHEb5DiOO5gXZ9H1Ufkt1t62HwrfDA2yw2cSAn0vW+aBPYLP1aSIIvZX9eNb33mn7HSALAQ9g==
X-Received: by 2002:a50:c191:0:b0:57a:588:747c with SMTP id 4fb4d7f45d1cf-57a36540a89mr7537984a12.32.1717492686096;
        Tue, 04 Jun 2024 02:18:06 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31b991b1sm6951182a12.5.2024.06.04.02.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:18:05 -0700 (PDT)
Date: Tue, 4 Jun 2024 12:18:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Witold Sadowski <wsadowski@marvell.com>,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, broonie@kernel.org,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, pthombar@cadence.com,
	Witold Sadowski <wsadowski@marvell.com>
Subject: Re: [PATCH v7 2/4] spi: cadence: Add Marvell xSPI IP overlay changes
Message-ID: <8428babf-5504-4710-9138-a2b6e5fc2a84@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529220026.1644986-3-wsadowski@marvell.com>

Hi Witold,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Witold-Sadowski/spi-dt-bindings-cadence-Add-Marvell-overlay-bindings-documentation-for-Cadence-XSPI/20240530-060250
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20240529220026.1644986-3-wsadowski%40marvell.com
patch subject: [PATCH v7 2/4] spi: cadence: Add Marvell xSPI IP overlay changes
config: powerpc64-randconfig-r071-20240531 (https://download.01.org/0day-ci/archive/20240601/202406012002.gdwS19Yi-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406012002.gdwS19Yi-lkp@intel.com/

smatch warnings:
drivers/spi/spi-cadence-xspi.c:314 cdns_xspi_reset_dll() warn: signedness bug returning '(-110)'

vim +314 drivers/spi/spi-cadence-xspi.c

5828a861b01b62 Witold Sadowski 2024-05-29  302  static bool cdns_xspi_reset_dll(struct cdns_xspi_dev *cdns_xspi)
5828a861b01b62 Witold Sadowski 2024-05-29  303  {
5828a861b01b62 Witold Sadowski 2024-05-29  304  	u32 dll_cntrl = readl(cdns_xspi->iobase +
5828a861b01b62 Witold Sadowski 2024-05-29  305  			      CDNS_XSPI_RF_MINICTRL_REGS_DLL_PHY_CTRL);
5828a861b01b62 Witold Sadowski 2024-05-29  306  	u32 dll_lock;
5828a861b01b62 Witold Sadowski 2024-05-29  307  
5828a861b01b62 Witold Sadowski 2024-05-29  308  	/* Reset DLL */
5828a861b01b62 Witold Sadowski 2024-05-29  309  	dll_cntrl |= CDNS_XSPI_DLL_RST_N;
5828a861b01b62 Witold Sadowski 2024-05-29  310  	writel(dll_cntrl, cdns_xspi->iobase +
5828a861b01b62 Witold Sadowski 2024-05-29  311  			  CDNS_XSPI_RF_MINICTRL_REGS_DLL_PHY_CTRL);
5828a861b01b62 Witold Sadowski 2024-05-29  312  
5828a861b01b62 Witold Sadowski 2024-05-29  313  	/* Wait for DLL lock */
5828a861b01b62 Witold Sadowski 2024-05-29 @314  	return readl_relaxed_poll_timeout(cdns_xspi->iobase +
5828a861b01b62 Witold Sadowski 2024-05-29  315  		CDNS_XSPI_INTR_STATUS_REG,
5828a861b01b62 Witold Sadowski 2024-05-29  316  		dll_lock, ((dll_lock & CDNS_XSPI_DLL_LOCK) == 1), 10, 10000);

Functions which return true/false should have names which say what the
return means.  Like access_ok() or is_something().  Returning true for
failure and false for success is a backwards anti-pattern.  This error
return value gets propagated back until it is eventually ignored so it
doesn't affect runtime.

5828a861b01b62 Witold Sadowski 2024-05-29  317  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


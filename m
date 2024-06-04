Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070461411F2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jun 2024 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717492913; cv=none; b=E7mw0xt+c4skJS3ntSFUwsAku9gW9JH/yoob4g1Dwqt2KEbfU/XHu7Tb37g8G8zWvv1jMDxEzaPT8haJlf1vGHlFSvO3AM7oaewIpcvwB0qpW806cl1jRDRPM+3Kgyg6KfxW8uo1ViqgZRj8fqkIAgsuUc03USUgVs4vuFTC2k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717492913; c=relaxed/simple;
	bh=WsyvWG2yV+idBf9tbl4bFm3p4pGciThaH/I+ZywwKHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SxX2S2YE5Bc7oIvOSuL4FdnD5JEntb5l5De3GxH8pSuYpOjrRkXjoKYEb6IzC/cbIWnJZDY8QSkDO+u928qLSgpJ/YgDtyPnliZmGg0qNxOQC5MSsbvfzMgf2qNB/jha+c0hmaC6GMi+2DsZcnmn2eZjMecRkfBTrg2xASgiCgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A1ejFuD4; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A1ejFuD4"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57a30dbdb7fso1061754a12.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Jun 2024 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717492910; x=1718097710; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h5T+9FltYwCRJsWCrzY8gXQ3PI2wIWCw8VRf/aXR0eE=;
        b=A1ejFuD4io32zHQxTMKj3rMCtGMEy2DuDSWWo70DdwPoRWC5MIe59Q8c1Xtxjy/H1D
         LujZyG7N1w17XGBCBvsaOGk3cfdK+AQcAcS4yyI/5v1GY+sBM0WmgauQyRbknLXnKjH/
         kg2m85AxXoXxGJg75pzfVVzGKzBR+gKzul+xSWyLEvzOZbLNQvk5bYL/6tkIq6NVqENb
         EpMRWuhUzmnzu0jsZacpplGAK2rJELVYsouqoliNUopNjoWvP6B5dyT1K7iohje5d1jr
         S7Ahi6hYBaOn5wmxjwnBFrUOeL4ZWvTz4Ao+FMuqhf9TkhvP8B/TvklvoTg9RnOgHShI
         a7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717492910; x=1718097710;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5T+9FltYwCRJsWCrzY8gXQ3PI2wIWCw8VRf/aXR0eE=;
        b=LYfSto5+Th8+IcApTbnRnW+xspOT6cWs+uYr5u/+TI1rs/7Lqyy2lDeu2ek3VNmXbt
         OSUablRD+8mJgeJ/W6gyOHXkC3KyUsL/Duj8EqDKuLanhY69Y49kRRzHxrIwAKiJG8fk
         dD9H6NdYqteNysTgvbC5bz7JpkR8VTZAmI0BMUDxt3nJ/Le8EGS59min5HchaDFJ8B7b
         le/RMT+M4bC2PIwnyTK/xNEfOV3rn8+RThrhLA7ILLey86C4GKeb5hsLz8TI0TTpxOY2
         BeG1RrbsetvBF0HqL3DEnaV2IK8GSEKtU39hHfISh1NL4vrPCO2/PYacMTMBtsEWApMX
         4n2g==
X-Forwarded-Encrypted: i=1; AJvYcCVMjlawEsVc2GmYP6bHkVbLu/nA4ZNNIo1dmVKaziA8djGyMkKgOe7GIfMMRjV5SbHgd75vXDk9tZ5BWflKCVvUMDbe+1v58GDpBaVMjw==
X-Gm-Message-State: AOJu0YyWxJop8upfR/E6rB26HKo4GpEBpHDee2yG68PIRRltF3KtDVdq
	Je3G9/UDJTnYcKf3MAohK/q1gQp7QIQowiZQHbJ7aCp/v76lg6zkaHe9w2F0XKYyNj8A8Ly1Zl6
	S
X-Google-Smtp-Source: AGHT+IF/1rFz/j9iytXx8jWDqKGDaJxuS30o8xQOuHWmR4YJnzerTlbRW7XMfrBEdC7TOHEGQb2AaQ==
X-Received: by 2002:a17:907:26ca:b0:a65:7643:3849 with SMTP id a640c23a62f3a-a68224493ffmr947305166b.73.1717492909385;
        Tue, 04 Jun 2024 02:21:49 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6911e3676dsm245378766b.88.2024.06.04.02.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:21:49 -0700 (PDT)
Date: Tue, 4 Jun 2024 12:21:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Witold Sadowski <wsadowski@marvell.com>,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, broonie@kernel.org,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, pthombar@cadence.com,
	Witold Sadowski <wsadowski@marvell.com>
Subject: Re: [PATCH v7 4/4] spi: cadence: Add MRVL overlay xfer operation
 support
Message-ID: <096b0aa3-47b1-48f8-a0ed-89458506b7b7@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529220026.1644986-5-wsadowski@marvell.com>

Hi Witold,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Witold-Sadowski/spi-dt-bindings-cadence-Add-Marvell-overlay-bindings-documentation-for-Cadence-XSPI/20240530-060250
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20240529220026.1644986-5-wsadowski%40marvell.com
patch subject: [PATCH v7 4/4] spi: cadence: Add MRVL overlay xfer operation support
config: powerpc64-randconfig-r071-20240531 (https://download.01.org/0day-ci/archive/20240602/202406020007.yDo5EI4r-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406020007.yDo5EI4r-lkp@intel.com/

New smatch warnings:
drivers/spi/spi-cadence-xspi.c:955 cdns_xspi_stig_ready() warn: signedness bug returning '(-110)'
drivers/spi/spi-cadence-xspi.c:967 cdns_xspi_sdma_ready() warn: signedness bug returning '(-110)'

vim +955 drivers/spi/spi-cadence-xspi.c

66e19aa5a2e022b Witold Sadowski 2024-05-29  951  static bool cdns_xspi_stig_ready(struct cdns_xspi_dev *cdns_xspi, bool sleep)
66e19aa5a2e022b Witold Sadowski 2024-05-29  952  {
66e19aa5a2e022b Witold Sadowski 2024-05-29  953  	u32 ctrl_stat;
66e19aa5a2e022b Witold Sadowski 2024-05-29  954  
66e19aa5a2e022b Witold Sadowski 2024-05-29 @955  	return readl_relaxed_poll_timeout
66e19aa5a2e022b Witold Sadowski 2024-05-29  956  		(cdns_xspi->iobase + CDNS_XSPI_CTRL_STATUS_REG,
66e19aa5a2e022b Witold Sadowski 2024-05-29  957  		ctrl_stat,
66e19aa5a2e022b Witold Sadowski 2024-05-29  958  		((ctrl_stat & BIT(3)) == 0),
66e19aa5a2e022b Witold Sadowski 2024-05-29  959  		sleep ? MRVL_XSPI_POLL_DELAY_US : 0,
66e19aa5a2e022b Witold Sadowski 2024-05-29  960  		sleep ? MRVL_XSPI_POLL_TIMEOUT_US : 0);

This works but from the name you would expect it to return true when
it's ready and false when it's not.

66e19aa5a2e022b Witold Sadowski 2024-05-29  961  }
66e19aa5a2e022b Witold Sadowski 2024-05-29  962  
66e19aa5a2e022b Witold Sadowski 2024-05-29  963  static bool cdns_xspi_sdma_ready(struct cdns_xspi_dev *cdns_xspi, bool sleep)
66e19aa5a2e022b Witold Sadowski 2024-05-29  964  {
66e19aa5a2e022b Witold Sadowski 2024-05-29  965  	u32 ctrl_stat;
66e19aa5a2e022b Witold Sadowski 2024-05-29  966  
66e19aa5a2e022b Witold Sadowski 2024-05-29 @967  	return readl_relaxed_poll_timeout
66e19aa5a2e022b Witold Sadowski 2024-05-29  968  		(cdns_xspi->iobase + CDNS_XSPI_INTR_STATUS_REG,
66e19aa5a2e022b Witold Sadowski 2024-05-29  969  		ctrl_stat,
66e19aa5a2e022b Witold Sadowski 2024-05-29  970  		(ctrl_stat & CDNS_XSPI_SDMA_TRIGGER),
66e19aa5a2e022b Witold Sadowski 2024-05-29  971  		sleep ? MRVL_XSPI_POLL_DELAY_US : 0,
66e19aa5a2e022b Witold Sadowski 2024-05-29  972  		sleep ? MRVL_XSPI_POLL_TIMEOUT_US : 0);
66e19aa5a2e022b Witold Sadowski 2024-05-29  973  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


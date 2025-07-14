Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0C0212FB6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 19:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752521401; cv=none; b=tPOX9bhc/qSt0pncfrVkje3woNWNJdphDoKEuTY066GtZ/edarC6/fsMMVNFt4lER6bHvYJo87SJAh74AOXaMNgvqdNlUiT/w4AAD6mL+pswIW6uBqV52ilZ2Iu0F1ZVTTMWNdqfMcKzOG5MSrOfgC0r80/B6Bkfigg4GS19z20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752521401; c=relaxed/simple;
	bh=jRi6LsgXjfGrStwjvyAYC40sGkRXOQX53qEE8jtC5IY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JuSnezb2kPfnNY0lleRCY4rE+riBuStOhNPuRTwGkeV0+zc2W906pY+r1dm0UeRtf3rifATKmtVqp5tpfDYGYhxnWtWxLShWfaZ2HnwaWWw6Y2bT9kjc1yLC599aQ6v8tyL4jyeVgO46H/n6aho3veIAQfpz7cqge3M1iI+ElEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gjR3Mc4o; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gjR3Mc4o"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2eb5cbe41e1so2719528fac.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 12:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752521399; x=1753126199; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Q+m9wicpIeBCH++LBohVYCNSQtrcgHGVb/S1A0eRqg=;
        b=gjR3Mc4ouOTiaTOpSmGxe4g4AONCEgmFqOvbxNsqYWq1DSMPvYBhkNjVTq7fXmSAmk
         xYay0JYPbXUdJA/2az7BRNcuNat5AOQ6iE4Msf3ky6PP1QbxD3w0i73pVfH2dckiC2F6
         exHeZE/Y5o3RkULDUdL+qEibVjirVlzfVG7C1YPPPztdFmqGqH8nCdDCIVxyzScq8ToW
         Xs6mK/D8YrrSI2Hfo2ibJ09TsAwdqEFTtKthr93DALJgsSCatA57E0h7pHzOe7A8+FmN
         o62ddfs1T/OHJsE05Xj4Ni/Bmoj46sfj03QOQqSmvnH8Ygb+th4/lyEt7oG+UEht/fTS
         4zNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752521399; x=1753126199;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Q+m9wicpIeBCH++LBohVYCNSQtrcgHGVb/S1A0eRqg=;
        b=TOUQO8t4/F7FA6fjqO0TwKW7dbzn+PxSUyEB8ZS9no3K4pujVOgcVCJr+3pzt4zEDK
         VakFacSD6I2cEeKf6iOPXQlWW8sK41OA5BskzlWGd/nal+f0urvNpYN7OyXIWF3AgplR
         aSiMvKDCZP0g+kLy63W9Zg3gmvByKTfzH+fdoOcSDcCVy4qWpXt9pFU42LaAVMJZv82d
         lzzUIytDU9KxNfN72j63AU8XbUV/th0J8lWmA6w9/ywmOIwFjRe/hkdE18PTJ/EQkzMx
         tO7IDC8IoO1x3r6UF0yim7qPutCuSfqwtDxm32FWJSIsVGcUAkkxshBm4tnMRO2TLoBw
         6n7w==
X-Forwarded-Encrypted: i=1; AJvYcCU2anf6iQEcgSkuXn+vPpHYeU7iBGKBdRYD+H/4si2qLVOPZY64D/RWdyAnZywphpZwA+46195C3fUjR5X9@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0luZFQo+R8KYonQUcd7vLVM9TFs8TGOo3rxYyM6pNuUy/ec55
	/DVxGrA6nFBnoRtOJtIf8bjQmFqujE4KuOhlgJ3XElSN0TbU72OA2arlHz5xmSnh3H4=
X-Gm-Gg: ASbGncsRUt3fdKhJgb4KhQfOJMhV9H83qqxye/VZ1dERk6P9IjghLaBT87I6JYscfQg
	CV1Sv6m6QfC94yTg1TSwa9JGjL61i3ELqH6ESmxGLSKImhLvT//YH0L3DcqMkkmL6HQ+LccefD0
	kIzwlCyj0hrPKdLjXinE1oW/nVckeZmqpDcYXJYJHOualdh4RSbL/LLW+EzszV1OfQVqUWkBfrR
	+zA0wqtfXrnNuax7DWbRNxYhFoomHaS5JcM/+kXhw+cjVLQZbqPU3wJw5TORtebRvKU8o6REZZ1
	BkCbBnoWDxGFItox09fjL2SIcByjlaj5e126GXHVJkmCO+iDk1NDfiZOcuCm2xGFCilF0aTwhYK
	SwndikuIUWr/yUZW9S2dHHonU4Lfc235xZs618NLU
X-Google-Smtp-Source: AGHT+IGcqvFf04VyN5VwO5vDsILubomPqyNpRQlsi0uJ6i+fQzutbyHm2vZrUuvCt3pRKpj82Fk+9g==
X-Received: by 2002:a05:6871:d804:20b0:2ef:eddd:690d with SMTP id 586e51a60fabf-2ff26913aa7mr6688707fac.24.1752521398832;
        Mon, 14 Jul 2025 12:29:58 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff11686ad2sm1991198fac.28.2025.07.14.12.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:29:58 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:29:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, khairul.anuar.romli@altera.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Matthew Gerlach <matthew.gerlach@altera.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] mtd: spi-nor: core: Prevent oops during driver
 removal with active read or write operations
Message-ID: <2bf9baaa-e66a-40ba-96b3-44b2e5e78550@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e439e6b85e650a91607a1d02d5d432d096363315.1752024352.git.khairul.anuar.romli@altera.com>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/khairul-anuar-romli-altera-com/mtd-spi-nor-core-Prevent-oops-during-driver-removal-with-active-read-or-write-operations/20250709-103107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
patch link:    https://lore.kernel.org/r/e439e6b85e650a91607a1d02d5d432d096363315.1752024352.git.khairul.anuar.romli%40altera.com
patch subject: [PATCH 1/1] mtd: spi-nor: core: Prevent oops during driver removal with active read or write operations
config: i386-randconfig-141-20250711 (https://download.01.org/0day-ci/archive/20250711/202507110922.btkgvYrn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507110922.btkgvYrn-lkp@intel.com/

smatch warnings:
drivers/mtd/spi-nor/core.c:3216 spi_nor_get_device() warn: variable dereferenced before check 'dev' (see line 3213)
drivers/mtd/spi-nor/core.c:3216 spi_nor_get_device() warn: variable dereferenced before check 'dev->driver' (see line 3213)

vim +/dev +3216 drivers/mtd/spi-nor/core.c

be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3202  static int spi_nor_get_device(struct mtd_info *mtd)
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3203  {
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3204  	struct mtd_info *master = mtd_get_master(mtd);
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3205  	struct spi_nor *nor = mtd_to_spi_nor(master);
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3206  	struct device *dev;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3207  
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3208  	if (nor->spimem)
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3209  		dev = nor->spimem->spi->controller->dev.parent;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3210  	else
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3211  		dev = nor->dev;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3212  
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01 @3213  	if (!try_module_get(dev->driver->owner))
                                                                                                    ^^^^^^^^^^^^^^^^^^
Dereference

be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3214  		return -ENODEV;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3215  
240522762fc4bc drivers/mtd/spi-nor/core.c    kromli     2025-07-09 @3216  	if (!dev && !dev->driver && !dev->driver->owner)
                                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
These checks are done too late.  Also missing module put.


240522762fc4bc drivers/mtd/spi-nor/core.c    kromli     2025-07-09  3217  		return -EINVAL;
240522762fc4bc drivers/mtd/spi-nor/core.c    kromli     2025-07-09  3218  
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3219  	return 0;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3220  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


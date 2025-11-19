Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59C231ED73
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552368; cv=none; b=Ta6keD9BtABtVk1meqIPokW1X6tu0CsdjYSM3EtnRfi6bLlXdRFdSiNNdgBVnsvQ9fc8ZZf9S28L2UCEJvaDrOmX34EmxKRMpK3XtbnM3cO7wT2pHsM54nzCGL95jYfgL6cNsafHTkbyjLatTmNPMgStUzPbCdAL9/TozdQ6pPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552368; c=relaxed/simple;
	bh=UM9INyxyuJVSYVO3rVZYPCdEeNlMNoNnBRz+IvQdnpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=oZ298F0r4Uul9ycC8JIcUF7Vw5WTSnnYnWMoym4+yuacArNZnzCV9y/b2sTVynqwQcASRXxXUGtuL6gnLkOv4fCRCjI6dzE70yJklE02FyDJOb88zKr4Pb5PjMaotu8QuSGwUFhLajH+cdKWGGnzpBCWU4XGUfLXPnHmNZXk8UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AW79drbR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AW79drbR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b32a5494dso3956288f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 03:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763552364; x=1764157164; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gwJG9GJDfyq4+RD2BDGOinZg52cTnz6+3CySEDanXDg=;
        b=AW79drbRIoyaL6KpYgW4Iq42LRLD/x5yop1ILC4yznZ7GDNg2EhP79vFwQOX9o/ydX
         +V8nIGlnADvuinjiNqM1PbNMsl/YGJp0AathaaBHkFTBR2v+Cjavu5Gs9mlF3w2ptFWM
         rMB7RFaPmHCv5hduBykoWywvq2YY8hsfXw0mAGng81/CeKyh25ThFh5WUg4F8xDUQvND
         q8iNZPricHHXpEpJ1JRo+vOhJYKAXnRcWwAR+xxVG5DzsSG8P4RC/sHLIljGc5awPvhX
         4obbXL06xXIISiYTGX+x9ANONi0jnLWWCmeZCqsgyJoxxxz7Q215lc9SumIduD5htNTy
         EuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763552364; x=1764157164;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwJG9GJDfyq4+RD2BDGOinZg52cTnz6+3CySEDanXDg=;
        b=F2ByvyQvbJHi56LsjoBX1Z72xl6KhyEirgPDTN/tfjrdAj0h+LbqY/6pkZA2lIjQKW
         uwQCSvqcVKqA27RneOsDg+xPOTdZgLLRl3EI+qfKA6r2FVHRJimmKo12wm6cvXnr+GRP
         b8gyBLVNt5KVSVjwnSlmvKLqXhO6wahXVQhjirU5O5n1RuzeuSgmgXXOY3TJy0gLy7bg
         dPmTWmaxlgIfL9R5vi+ln0FuLoVC4XssOONAlQPf8WTsnShFDFjGKK50ZP9cNUY8KSl+
         D1c+xD/20zerxY1BPqLeXVzrZmTPN4ACW16yKw565FErc8IzPuQSL01ghwriCclntuVR
         t8CA==
X-Forwarded-Encrypted: i=1; AJvYcCUNpUIrgNp+OPu2/JJlMaG11zFAhRzLUzYCeMIHTkFwExB8DOhjTICjcasbmjOmL1E06Zt+e7Xy+Vbc+yrd@lists.linux.dev
X-Gm-Message-State: AOJu0YzGMiSJeO+t4p9osnxXgLg+nATSBXcHiRkfvL9Zw+EzXBEZnyev
	sB1NEuiWapYkeJ2aeq1Ohf74cll+iqcM+xSxSznIma/cDgXme9ROTn/mU+2s95jYw3s=
X-Gm-Gg: ASbGncsslfhWdvRrvHFujzLKt/4u+DNyBG9XSsT0hte3OyqxY0GgBoc7+G6viHmcZjT
	oN2X9Ep59BLVMGXJf00d2WQwKI0CP9FTMdLxneJjZ+vcZcyCDiAyrZ87+H0ivSphz7CxZHDpOmx
	P2aYM9DVsvXJhSJiPuraMckJcuT9r10rDn8nxJ9lVwcJL0WDojlIpjKQK504SVwOEthQQSmWjvz
	DfjUluXaxlHaNf1bDJ0zHsXd/QazAq5MwOHgRZyQ4le7iPbtwgCXeh5/fTyBAMA7GCsn1b3rAGZ
	TlZCMy8UVIDlfN2P/1Olll6ur9bVWyZ4dSncFbNSNSNwC19JyCQwswfvOY8cGbbHLdNk+dXjd6j
	Biy7HDYz/PutCPYZwZ2roQlzM3i+eW7qY0C3kDfJAjcYjQJmq1dwJbVf4fYT7hXzbp1eVdqtnWO
	6eRz3vaCWKT1YvX0Ch
X-Google-Smtp-Source: AGHT+IG0+nc2u44sOAgm3B9nfVuClMzbG47n0TMuwtBie7ZMDQ8A+R83vkbvW2yFaDixREsq5GJsjA==
X-Received: by 2002:a05:6000:2310:b0:42b:3661:305c with SMTP id ffacd0b85a97d-42cb1fc8f6cmr2298825f8f.55.1763552364075;
        Wed, 19 Nov 2025 03:39:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42b53e85627sm39489729f8f.16.2025.11.19.03.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:39:23 -0800 (PST)
Date: Wed, 19 Nov 2025 14:39:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Haotian Zhang <vulab@iscas.ac.cn>,
	herbert@gondor.apana.org.au, davem@davemloft.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] crypto: sa2ul: Add error handling for DMA metadata
 retrieval
Message-ID: <202511191706.iBCITtX2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117023117.90-1-vulab@iscas.ac.cn>

Hi Haotian,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haotian-Zhang/crypto-sa2ul-Add-error-handling-for-DMA-metadata-retrieval/20251117-103258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20251117023117.90-1-vulab%40iscas.ac.cn
patch subject: [PATCH v2] crypto: sa2ul: Add error handling for DMA metadata retrieval
config: m68k-randconfig-r073-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191706.iBCITtX2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511191706.iBCITtX2-lkp@intel.com/

smatch warnings:
drivers/crypto/sa2ul.c:1064 sa_aes_dma_in_callback() warn: 'mdptr' can also be NULL
drivers/crypto/sa2ul.c:1394 sa_sha_dma_in_callback() warn: 'mdptr' can also be NULL
drivers/crypto/sa2ul.c:1709 sa_aead_dma_in_callback() warn: 'mdptr' can also be NULL

vim +/mdptr +1064 drivers/crypto/sa2ul.c

7694b6ca649fea Keerthy        2020-07-13  1039  static void sa_aes_dma_in_callback(void *data)
7694b6ca649fea Keerthy        2020-07-13  1040  {
aedf818b1f1965 Yu Zhe         2023-03-17  1041  	struct sa_rx_data *rxd = data;
7694b6ca649fea Keerthy        2020-07-13  1042  	struct skcipher_request *req;
7694b6ca649fea Keerthy        2020-07-13  1043  	u32 *result;
7694b6ca649fea Keerthy        2020-07-13  1044  	__be32 *mdptr;
7694b6ca649fea Keerthy        2020-07-13  1045  	size_t ml, pl;
7694b6ca649fea Keerthy        2020-07-13  1046  	int i;
7694b6ca649fea Keerthy        2020-07-13  1047  
00c9211f60db2d Peter Ujfalusi 2020-09-23  1048  	sa_sync_from_device(rxd);
7694b6ca649fea Keerthy        2020-07-13  1049  	req = container_of(rxd->req, struct skcipher_request, base);
7694b6ca649fea Keerthy        2020-07-13  1050  
7694b6ca649fea Keerthy        2020-07-13  1051  	if (req->iv) {
7694b6ca649fea Keerthy        2020-07-13  1052  		mdptr = (__be32 *)dmaengine_desc_get_metadata_ptr(rxd->tx_in, &pl,
7694b6ca649fea Keerthy        2020-07-13  1053  							       &ml);


The Kconfig file should probably enforce that CONFIG_DMA_ENGINE
is set.  Otherwise dmaengine_desc_get_metadata_ptr() returns NULL.

90d79e983588a8 Haotian Zhang  2025-11-17  1054  		if (IS_ERR(mdptr)) {
90d79e983588a8 Haotian Zhang  2025-11-17  1055  			dev_err(rxd->ddev, "Failed to get AES RX metadata pointer: %ld\n",
90d79e983588a8 Haotian Zhang  2025-11-17  1056  				PTR_ERR(mdptr));
90d79e983588a8 Haotian Zhang  2025-11-17  1057  			sa_free_sa_rx_data(rxd);
90d79e983588a8 Haotian Zhang  2025-11-17  1058  			skcipher_request_complete(req, PTR_ERR(mdptr));
90d79e983588a8 Haotian Zhang  2025-11-17  1059  			return;
90d79e983588a8 Haotian Zhang  2025-11-17  1060  		}
7694b6ca649fea Keerthy        2020-07-13  1061  		result = (u32 *)req->iv;
7694b6ca649fea Keerthy        2020-07-13  1062  
7694b6ca649fea Keerthy        2020-07-13  1063  		for (i = 0; i < (rxd->enc_iv_size / 4); i++)
7694b6ca649fea Keerthy        2020-07-13 @1064  			result[i] = be32_to_cpu(mdptr[i + rxd->iv_idx]);
7694b6ca649fea Keerthy        2020-07-13  1065  	}
7694b6ca649fea Keerthy        2020-07-13  1066  
00c9211f60db2d Peter Ujfalusi 2020-09-23  1067  	sa_free_sa_rx_data(rxd);
7694b6ca649fea Keerthy        2020-07-13  1068  
7694b6ca649fea Keerthy        2020-07-13  1069  	skcipher_request_complete(req, 0);
7694b6ca649fea Keerthy        2020-07-13  1070  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


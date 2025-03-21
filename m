Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC28B1D5174
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742569043; cv=none; b=t9isqaAQWljHwkXmweEScCf/u0dH+9W6+1UVqnDS2MMuyV9wJmbPGbbPvhU1ilGKfyf4EVYjg5lzhn44ohL5xqx8VzQOmej/dCHb3uIJ8x7RJ6lKoKgrfPO9SSOFugCL/1DDIsWhIl0RvS0m7wMtV8+5ejo6vIT5JDznU/RG4rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742569043; c=relaxed/simple;
	bh=d2f3oi3MmO1YYqKjtahZR6ldRtLwx+gUGvQpzNg7T5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Nu6+sFecms7IKHVqmCmDdybyZ9KUs4L1G5ah2TKcgPHyis02+B9is1LO266xrqBNzue22PUq4BlOlO1bQUlBxZ589Cz1zGBnux1CG5+CaXy7mG7RYPnQmkSj1rj4UIwAvpE5CB1G+q2piVC7KHt3sDhxECniSUsS62dpODmbPHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RrBG4T5q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RrBG4T5q"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0618746bso14588965e9.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 07:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742569039; x=1743173839; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YVU+8wyEyR4gvjUtR5JGAcHvI0H2gDW7w5hm4UuGxrM=;
        b=RrBG4T5qewqBER+x3mvO4riNauzAyfDeVXGGesm2CAuH4xZlD32D4HcR2v4E2MskaX
         PwXhnNN4IXTW2vSRDHqyE2rU7A7lKYc/5eRN4Ft5Lm85YZ3qUeENoi369U03+6Js8RZt
         SaH80rugLtLH98ww0LLLGTbgO3/pk22MSxALAdebneNuP/kpiJdt/0CuielRN3kA9Hxo
         XfYvdKFx5mle2e3ejbrjH+IOtsMUsf8xxrTz4/Y1RlHetyiic9IvFC+2PeAJtDoArOiH
         GPavfZ1wEVJMtvyZF6ewno/MhkEAQ8g2DPClEBoI+wWqsfsKxRa7oENyw7kovBhbElYl
         c1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742569039; x=1743173839;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVU+8wyEyR4gvjUtR5JGAcHvI0H2gDW7w5hm4UuGxrM=;
        b=MZYU07CvjvG/qqcIguFLdB1eBVRs6n9WC7YUqFst1VMwEcvL8aVhkrIFbhhj7ytyp2
         9zqNFsZURp3Hkvnem4RNwNioP6LrcizoG3N8xr7GTlgpwrh0+yU6/MFwJXLpzN28cDan
         kqdrhGp9mu1tEurHcSs+veY/U1Q7WfuPtXur2bE9UD+8XRi5WvwDApajJveaNBrAb4xu
         hg5L0ZG75BLR1zkK4KktXlTs9cvcahROsbGVrsFrq3e2Wgj5UP7kw9iuPHBAJgwnGi3q
         XZ1xn1+8Qr7wC9JNExwSTyxVspbBjZnv4Y/revKxUT3vsySJu+LbaPAyKoBivcyaIW+h
         VIKA==
X-Forwarded-Encrypted: i=1; AJvYcCXRvCUaGhxB4vNP/i3xBSxBuZhkEUt3aYeoVTILK1Og+E1hLHRRBwWEncrYWN7PLakvffamcUTA6BqTBd3e@lists.linux.dev
X-Gm-Message-State: AOJu0YyLFwHGu/x9OGNv5Zl8zUq2O9DHHEMoUSQWq7Cbc3xf8yYTm2Eu
	V7o7q3ok9QsBGuEDBArTixfuO2VZY9vrtDnfae8u4X9kgolojJ+QgRq9gL/D3dk=
X-Gm-Gg: ASbGncs8cXroR1Pdp3CX3ZKFEkJYoXVdzAuYJxdGUbZp7JXY+PcqIY2tRmevN+fJnGn
	GYg0ZusVTcVAqJCKuLtRntMc15riVuX1ctJdUk2hVnZKtlrCW9XHPcUbj3g1cOENZQ7wp4OTnXs
	woGukE+PF9q6RbWHoyn40odZPpZ//OrN+T4dtry4Qt+95VXnteoV4a22QkzmDODaZlIgXAmVQsf
	MWQhBvypHH806FbLCvUUBNchmRcGbchalcV5Z/9XFC+97X7+gNP6K94yQak3ENUgg8bWHR40ot/
	t+gSOyHcli6hyMd0XnxqDS5eEk5RCqfFuwrDq52TxbRWz5V9Og==
X-Google-Smtp-Source: AGHT+IHJnXSty5OUVaj93k/po/+f0ESsH2vo/jE/7l6uYic0nkIZH0rmmfKo6umCpM51cQsx5Lb7Mw==
X-Received: by 2002:a5d:598c:0:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3997f9595f6mr3549853f8f.52.1742569038919;
        Fri, 21 Mar 2025 07:57:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9ef155sm2517974f8f.89.2025.03.21.07.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:57:18 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:57:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] dmaengine: pxa: Enable compile test
Message-ID: <171f0c41-b88e-4e27-8819-4195417136fa@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114191316.857154-1-krzysztof.kozlowski@linaro.org>

[ Ancient email got eaten by msmtp. Resending.  -dan ]

Hi Krzysztof,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/dmaengine-pxa-Enable-compile-test/20250115-031547
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250114191316.857154-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH v2 2/2] dmaengine: pxa: Enable compile test
config: parisc-randconfig-r072-20250124 (https://download.01.org/0day-ci/archive/20250125/202501252153.wCMpgWlF-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501252153.wCMpgWlF-lkp@intel.com/

New smatch warnings:
drivers/dma/pxa_dma.c:595 clear_chan_irq() warn: variable dereferenced before check 'phy->vchan' (see line 593)

vim +595 drivers/dma/pxa_dma.c

a57e16cf03339c Robert Jarzmik 2015-05-25  584  static unsigned int clear_chan_irq(struct pxad_phy *phy)
a57e16cf03339c Robert Jarzmik 2015-05-25  585  {
a57e16cf03339c Robert Jarzmik 2015-05-25  586  	u32 dcsr;
a57e16cf03339c Robert Jarzmik 2015-05-25  587  	u32 dint = readl(phy->base + DINT);
a57e16cf03339c Robert Jarzmik 2015-05-25  588  
a57e16cf03339c Robert Jarzmik 2015-05-25  589  	if (!(dint & BIT(phy->idx)))
a57e16cf03339c Robert Jarzmik 2015-05-25  590  		return PXA_DCSR_RUN;
a57e16cf03339c Robert Jarzmik 2015-05-25  591  
a57e16cf03339c Robert Jarzmik 2015-05-25  592  	/* clear irq */
a57e16cf03339c Robert Jarzmik 2015-05-25 @593  	dcsr = phy_readl_relaxed(phy, DCSR);
                                                                         ^^^
if phy->vchan is NULL this will crash

a57e16cf03339c Robert Jarzmik 2015-05-25  594  	phy_writel(phy, dcsr, DCSR);
a57e16cf03339c Robert Jarzmik 2015-05-25 @595  	if ((dcsr & PXA_DCSR_BUSERR) && (phy->vchan))
                                                                                 ^^^^^^^^^^
Checked too late.

a57e16cf03339c Robert Jarzmik 2015-05-25  596  		dev_warn(&phy->vchan->vc.chan.dev->device,
a57e16cf03339c Robert Jarzmik 2015-05-25  597  			 "%s(chan=%p): PXA_DCSR_BUSERR\n",
a57e16cf03339c Robert Jarzmik 2015-05-25  598  			 __func__, &phy->vchan);
a57e16cf03339c Robert Jarzmik 2015-05-25  599  
a57e16cf03339c Robert Jarzmik 2015-05-25  600  	return dcsr & ~PXA_DCSR_RUN;
a57e16cf03339c Robert Jarzmik 2015-05-25  601  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


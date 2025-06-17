Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89972EA153
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 15:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175718; cv=none; b=SxgKhPnYjL2SCYVPZ18/NcKcp7ylKLlSiJ86xqzhIfi5rjB6u71ruoVB/1zhTjXjRKNJQFzXb4ajirUY7vO1txSi9Vv/xibCfhlnDdnj8eYTVHHa2sjnX6lbbPUDBBe3pIjB1zpoMHoWo5msrVWzwPsQqG/3qhoQ/RQm9rlrwYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175718; c=relaxed/simple;
	bh=55IiHynz00pYy+b7hGuuDjrL2Y//CLig++XAkelZNU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEeX0Nqx1rJ6CBXULcHOaljArerOTI4zAOEuxWimldmttKXx9KcG3SS9ynG1iFvvO2ShbcSgLOJkRO2UkrjLTmuVuwq+Me6LGM47dzSEPYC51FRPC7BPC4Og4/a3pFsLQLpJybHPWPIbsAPbA0uYqPTD9nZA8jpz12JbkACLsKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=CDuDVdhB; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="CDuDVdhB"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a58ba6c945so108907681cf.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 08:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750175715; x=1750780515; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wx304DZ0NE2g+OOJjBg61lF2TCxnm7rjurAO1hRurAk=;
        b=CDuDVdhBPrg77wkAGH67hrRI7GUITy8ivrCBKiYd9/c/K5Ge1bU7g3wVecGCTSzwFr
         ztFPMm2xh6wbdcnWiKijx2xpzfLM5B9cSJvyZZ6LsO0Q8Ye0yk7MPCqLMcGN8YL423ij
         sKe2Jh8XNLkQ5UPG9pjg5GAh2Nc/f+if7bpFWv5AzlwnB56twlD5+dVx2SC3CqbBUMyQ
         IT28wlmLbZM75+0kZt8tFLGMqHHvnOXaqmWQ2TL0ZkDxeUJk82wFbELoWNyHZ2O1m/0Q
         0J+KhsUXB8mYKzEulNxdWNB1H0Gp2RDs+eqP4F0zSr5R+SjGfX5bI6LQBzYIZSJCQ88q
         EZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175715; x=1750780515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wx304DZ0NE2g+OOJjBg61lF2TCxnm7rjurAO1hRurAk=;
        b=e0mgqyT/oPyOG9feJNHvm5IiY2hWyBymKqOvxCQpDa4ahec99ZTKt/frz+HYJYZdm4
         wa2UbwO69eoJAbQDxe6SToJhyLE0b73rnCgzOahswMuoYn3Brs2lWabpFXrOfsuZiMuD
         T92lDJBkWLsDlie50IMUueck1CHsWPg/aoxa3WftDE77Jn2HTaMK/y/4D/+gak57bI/h
         DFIq6L0pBDb6LmTv396FrpnyFF3av44vounq+P3SwrwUucT0ahUufGQ8x8q9wX6EnImy
         kF9Cyx8qL9u4Fj+nR8QUUD8PLg7oQPWSE4jjQxDIh3xn+OkTGA9C5vEWey8+grPCkEhm
         oAqg==
X-Forwarded-Encrypted: i=1; AJvYcCWUSyTkyohdN4YcGmc6f4ikWn1x+VWBStPm34uQ1z6J8Mhe4rzm8EGOqmsWY9E3DvkreN+kXtnDScXolOHm@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3v9c4SVY81xD4qKRx/Tldo77ZhYPTPd9sBLY61dnPWrNtiE6E
	F3AX1jzUlo1hGlVwL9O6tzcKoLQG8oCxNSLdIgQzfDy2To3128MvjyvzhCSEl7U+GYY=
X-Gm-Gg: ASbGncvnXhPNT7MgHllQWYVmsen06859ZCretrOvuVjO+WYyWWeuV3DDoTPM/X9yCg7
	5YZtvv54Oqvhgrtm/4w12DpaSU03IZo7RHB6KYrVtXglUo1+H6ib/x4DZmlFWG7THOj8gzoww4+
	VtRW74hku1jhRKxXBjZKQ5D3rJynpxg4toqrJJjgrptuY7lzVwmDWbBDBFDbZclBxWlUo0Tk6YW
	nItvcYB6j85PyjcdANiWkVRv2poiAWejj8kk7++HY1cw7VaNy7cw8gOc1fSzuLEbBZMJ/Vaj9XO
	QWdIYc3xIIm1MJpUfl3viKRoxlyc9dzQdC0LUA1zW+9KFAZK9pzLme6H+BaONN2jBbh1oafrM38
	vk69cRNTxb1AHiSDVCpaxpqvkjPdZE25yGlDxKw==
X-Google-Smtp-Source: AGHT+IFXnZTcKPgzMT86nxmrlf7kz4ru5nOzoSNqyGX+eUmWwxWkQ7vtqqAzKrLwaYYroH6Qyc+UTQ==
X-Received: by 2002:a05:6214:2682:b0:6fa:c634:dc01 with SMTP id 6a1803df08f44-6fb47786d90mr220187206d6.16.1750175715483;
        Tue, 17 Jun 2025 08:55:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b20abasm63746496d6.1.2025.06.17.08.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:55:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRYeY-00000006WS6-1OTF;
	Tue, 17 Jun 2025 12:55:14 -0300
Date: Tue, 17 Jun 2025 12:55:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>, James Clark <james.clark@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>, oe-kbuild-all@lists.linux.dev,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Frank Li <Frank.li@nxp.com>, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev
Subject: Re: [PATCH] dma-mapping: Stub out dma_{alloc,free,map}_pages() API
Message-ID: <20250617155514.GC1376515@ziepe.ca>
References: <7cfcf919-3c7d-4f0c-911f-697ea3141080@linaro.org>
 <20250616131346.GB29838@lst.de>
 <83855c1a-c128-4762-9d6b-e17f2c4c8820@linaro.org>
 <d16bdc40-20d6-49db-bf41-18bb9b8e01fd@linaro.org>
 <20250616131944.GA30260@lst.de>
 <f723d490-c228-42d5-9f9f-158df54a092d@linaro.org>
 <9788991a-ac37-4fde-81db-c55035d00f27@app.fastmail.com>
 <20250617044833.GE1824@lst.de>
 <5de445aa-048b-4f60-9045-df5d45341436@app.fastmail.com>
 <76a8c896-d7ea-4471-99a2-34b3a7ac9804@app.fastmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76a8c896-d7ea-4471-99a2-34b3a7ac9804@app.fastmail.com>

On Tue, Jun 17, 2025 at 10:26:51AM +0200, Arnd Bergmann wrote:
> On Tue, Jun 17, 2025, at 09:53, Arnd Bergmann wrote:
> 
> > Between SH72xx/SH76xx, SUN3 and M68328, I believe the
> > supported machines are all limited to between 1MB and 32MB in
> > the maximum configuration, which is obviously extremely
> > tight.
> 
> I checked the exact numbers we're talking about here: enabling
> CONFIG_HAS_DMA on rsk7269_defconfig adds 10KB of extra vmlinux
> size, which doesn't seem too bad:
> 
>    text	   data	    bss	    dec	    hex	filename
> 3295084	1111396	 112264	4518744	 44f358	vmlinux-before
> 3302836	1113652	 112264	4528752	 451a70	vmlinux-after

Long ago I ran some numbers for an ancient PPC system:

https://lore.kernel.org/all/20121119214922.GA5636@obsidianresearch.com/

The base smallest kernel was growing .text and a stripped down initrd
at a rate of 1MB evey 6 years.

Somehow I doubt that system (with 16MB ram I think it was) would even
fit a v6.x kernel. v3.6 was already challenging.

Even back then Greg was incredulous that an embedded system would run
a 6 year newer kernel. Here we are contemplating a 20 year newer
kernel?

I think you have the right direction, we just removed !SMP support,
removing !DMA also seems logical to me.

Jason

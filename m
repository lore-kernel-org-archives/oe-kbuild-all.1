Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C8E29B76F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768806821; cv=none; b=Es5YGwPFdMEW9dMTeBcONsiEKwoLBxaZF3FJ0FX4xZkdDTfbODC2Pzo7LSL5bB44p21W5bXa5uronpt9nvCVXrcJj4eX6nxSPKx/FwGuHgrKuMtiLS/3gHWWVo0d7h0rK5enWBf4QYUUolG60lafoNzHO2mazVWQkHzJSekzQbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768806821; c=relaxed/simple;
	bh=bTQYx/YLz4/cPcL1/rIaL2o0qtYeIR3c5ybdyq+Kx7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTLHUTO298bpUgGQM6j8qKz3ytZR6EsTXJ9aW7aot4AtTllNR0UusWHdnfKfzeOk9AoZZDiplC6flJHNC+nrck5oIeGHqTM+Jjcnm8tc2454knC3OzMG8hLdBbAta00gk6hVWqdTZn0uP31MNaowsk65Vsc0uWCSgChT4TDtqOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mJW/c0o3; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mJW/c0o3"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4801bbbdb4aso18341065e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 23:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768806819; x=1769411619; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yeU3kWotHcVXlbxuhjSFGqJhq2cBlR26t3CTzB1ukaY=;
        b=mJW/c0o3fe/0SQ912JO1Z98iafmOPocAR92BSDVTKdUU8Pz02l8pVOrwFtpc6Tz1pz
         GIHDFC+kHHmKJpSVeAqSubSAE6CH05BzzozwqoJxX9YWEEUtWxcnKeCbKUQgnjacZyst
         X4mNoNPNfFfq5183RZwNAVmEE7DitkelaCQxe2OZ4s1TwqYzSMjYnkc/zNfq4q316nQn
         43iVaSy5trqwAUltI5ciEHFAW6EPV4aBPQ9GKVupKUdeQUCNM84X/hVZHP5NIcNvwZHc
         it27IJxR514T1/tJgs6cXTUZzb0y6+adqyznH9z+4yhg4FiANrF5ToN5845Z2v4EWecs
         hV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768806819; x=1769411619;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yeU3kWotHcVXlbxuhjSFGqJhq2cBlR26t3CTzB1ukaY=;
        b=cvlopEynzqY8Lt5xpzM6i2NwLhsqbC47cR2Sqz3478HsGUlNcyOuO5rVEVjDLt0Y6z
         bzuVS4bAo/fNMdpmuNurIG6cQ0IxAO3H0Mi5RLSRzLS1w1fO14T52J8sYexZYi6hHV7K
         0iQkvzCSp9VM+jl05+W5ZmiK6n7XMNThSOkryT7/85tFAJRbsc3hKFDZAZY8KJmiDA8J
         zwGtkKb+yG5NjI5BGYG2mTUfSKNDiA/X7QXl+bqCvvRdXh3zkwcsyz55lVZhNpW1+Vz9
         81T9lHjMDueWWGJJhOBpez+6PELCvvO4ZCkSEXzltcS4RtVOlR/le6r56Ty/NuNrMbce
         rFPA==
X-Forwarded-Encrypted: i=1; AJvYcCWXnSHu6dYYzOE/KGkKL4uF4SMb7PuZTNOf0MFIHsDYgvxKRMni4PgZMPN4qo7lzlPKeiW0II61WZuoqSVm@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+868ofQvdbACnARXPpO1kBUs7jApSbcyLTwVjBZFT6K+vRhYj
	aOq2tewNKdjnNqzV0EbMn8bl0g5Gi7PO7yQUd7WWyDaScHYTpCKNtDwX/hLTYI+pxI0=
X-Gm-Gg: AY/fxX5E+q5v7v81CT7abMRad5rK/9hErvvqfQ9bzIU7PkvXUKuarnRkDta2nPZaXh8
	2Uy4UPedpLhjbxngxfsv1tR8mAXHhULgpWJed3+tNKincvYbH5vH5RcThPGiM34AAPKz2wcibgi
	tcbWaljJ3wxUi7L7z5Hh4kYnYNtxzotB9LzwrnoHgRuNcXFFBLWkruwsR8dRtGABnsG7ojhW8S/
	1VHAi26/hzz+jeV2OXq+Y0d/mAcC8RejJaTKiBH+IoJH3nLfvSvIsJamVNGS2AkysMG6PdvvwH7
	qMOJ5IZd5pueaBVi2nNDhvPvhy9AP2JBGBuJP0xIkkCLl7rkqesS2HNeeHvcq4H/ccETL7NeaAW
	ToMH6NFkx+mGqGBtSZhLQ2dbo9ly3lzqT60ouVH6EjHqJQDoTyTvGQLsaA0z26rG8JQAprCn2nJ
	fEr6cbeosAnyjgiHOa
X-Received: by 2002:a05:600c:60f:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-47f4289abb5mr108103085e9.1.1768806818802;
        Sun, 18 Jan 2026 23:13:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e9fb193sm74818505e9.6.2026.01.18.23.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:13:38 -0800 (PST)
Date: Mon, 19 Jan 2026 10:13:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: yaxing guo <guoyaxing@bosc.ac.cn>
Cc: Greg KH <gregkh@linuxfoundation.org>, oe-kbuild@lists.linux.dev,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4] uio: Add SVA support for PCI devices via
 uio_pci_generic_sva.c
Message-ID: <aW3Znz51bTVj3oxJ@stanley.mountain>
References: <20251223045409.15700-1-guoyaxing@bosc.ac.cn>
 <2026011643-coastline-playtime-0ac5@gregkh>
 <2026011603-dorsal-unblessed-cdb2@gregkh>
 <5483bb2f-04a7-468c-923f-0a62b94fc0e6@bosc.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5483bb2f-04a7-468c-923f-0a62b94fc0e6@bosc.ac.cn>

On Mon, Jan 19, 2026 at 02:16:21PM +0800, yaxing guo wrote:
> 
> 
> 在 2026/1/16 23:16, Greg KH 写道:
> > 
> > Wait, I already took this a while ago, why was this resent?
> > 
> After the v3 patch submission, I received error reports from Dan Carpenter
> dan.carpenter@linaro.org and the kernel test robot lkp@intel.com (see:
> https://lore.kernel.org/r/202511280815.WV9iCJZb-lkp@intel.com/).
> In response, I’ve submitted a new version (v4) of the same patch, which
> primarily addresses the issues highlighted in that report (as described in
> the "changes in v4" section of the cover letter).
> If there’s anything improper in this process—such as resubmitting instead of
> replying with fixes or other procedural concerns—please let me know, and
> I’ll be happy to correct it accordingly.

Since it's already merged then you will need to send the fixes as a separate
patch based on Greg's latest devel tree.  Send two patches, one that fixes
that && vs || bugs and one that fixes the devm_ double free.  Add Reported-by
tags and the Fixes tags.

regards,
dan carpenter

Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B291118C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 03:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710301740; cv=none; b=WOvpHk5clGouxEN+ytH2re83peyZX+gTxNwp0ow9xWXHJwt1sf4ikbN3IWL8e9YNmJgqRHdp8kyWepZto6SUHGGP12NZA/xt+xHyjsDAWbnygrWhRD+bQa42S4fWTD0+p9K5WNYx2queQ00WvESIBhKoKws9vhFh2aaft4LZ1aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710301740; c=relaxed/simple;
	bh=BnZqErZaukdqhX6UOBHN7sRssp5Q+uP4sfEErjevM4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2OL8YGqB52eNaerskFww99xcmstswa1G4dOwWK7KjYTcIBl5fh6Qy6HYntE46l/xsEsQDFD0nmZse1mwlcJQAjx6XNZBLQVO4xokKPZT0g+tAgDnWcsZw2OF78YPfrbA0v+G366UmaASpUCm2Ear7JIJ5g2mHLufd6Kuq2dJ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UJ5ad2zh; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UJ5ad2zh"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-221a9e5484aso3060827fac.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 20:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710301737; x=1710906537; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eQ1FdbULiwAVH/CqclvTvotOG/fR3ySlmhV/YQ5BTPc=;
        b=UJ5ad2zhuwqTeMyVfnjRXfK5+hhO2qaUP4KA0oACSeweVj0tkNnJQNh4hgp0hISy7i
         ywzV39VbPmPxB5+KWN4WyKQFKEnJxnb6dZQjjXSW+Fe0Q76yA6fG/rqZke6ixdejicBu
         fuOAV3KlwjHisxoIorxIPckcpo1j8zpW3TMCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710301737; x=1710906537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQ1FdbULiwAVH/CqclvTvotOG/fR3ySlmhV/YQ5BTPc=;
        b=L9//R1xUrHvR5NBduYjF3kkWr6lA0X+yb1kTE3M9e+RuMC2w2CbORK8/rYGktsrz7P
         EojPohAVvSzhNmi1mx3ogCcfRcpLXU/joaasS6iV8IsVtaguWiIRqqTBIGHDZ8KPBbnW
         k/ZszHlv1i1eSeJSLiLQPD9fUEUKx9qoXNi3cDyfJ9ShBuYvW38dJoWMRlKpQFDMbmbY
         pIMk5Xtr84T3ch08g0Gqp2IkDh2TgShmHIKzqDmcSHasuXk9OQlhG5/F/tMA6YBorMEb
         kVFU6rek8nLBmn6VCJq9PNVtjMN6W0v7EAQveXBv8k+H9poTq8T+FE5gOpKbKxBNMoXi
         2tVQ==
X-Gm-Message-State: AOJu0YwJWrrPaOCfIC+SeqQlKjvc1U5HGL6Hn0wYGUYoyhDf0jRgwsl0
	kIii3XcYMkQVZaW6cvFmJ7izV91qsLNMoa6/s9Ab4k2YGa9p2ukPWzI0hIfp+KOFK5oYYMx4DB8
	=
X-Google-Smtp-Source: AGHT+IEGmytpnS/yVB6WOLdM3jd/Y+5BIFMcVEht+HxH9oGxW9+UZJapuzigQxme9g4RK8uLw92B2w==
X-Received: by 2002:a05:6871:2785:b0:21e:6e02:2794 with SMTP id zd5-20020a056871278500b0021e6e022794mr1307456oab.40.1710301737582;
        Tue, 12 Mar 2024 20:48:57 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p7-20020a625b07000000b006e62dfd60b8sm7144633pfb.45.2024.03.12.20.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 20:48:57 -0700 (PDT)
Date: Tue, 12 Mar 2024 20:48:56 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [kees:for-next/hardening 28/42] include/linux/refcount.h:141:1:
 warning: 'no_sanitize' attribute directive ignored
Message-ID: <202403122048.7D5B1BC@keescook>
References: <202403110643.27JXEVCI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202403110643.27JXEVCI-lkp@intel.com>

On Mon, Mar 11, 2024 at 06:30:13AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
> head:   6c069c8d3cfc30c5a399166b6ce63aa42a7d1dac
> commit: e697572c09d21678e2e8cc1256af165106fccb7f [28/42] refcount: Annotated intentional signed integer wrap-around
> config: um-randconfig-r053-20240310 (https://download.01.org/0day-ci/archive/20240311/202403110643.27JXEVCI-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110643.27JXEVCI-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403110643.27JXEVCI-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/crypto.h:16:0,
>                     from arch/x86/um/shared/sysdep/kernel-offsets.h:5,
>                     from arch/um/kernel/asm-offsets.c:1:
> >> include/linux/refcount.h:141:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]

Oh, hm, it seems GCC 8 is needed for the "no_sanitize" attribute. I will
send a patch...

-- 
Kees Cook

Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0F21A9FAE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 11:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760182339; cv=none; b=tjl5YnNSdmtywsxV9CqAXYc4cUSl7gLRCoFbbtpPvqT8hblI+A8q+nc6Q3Tjts1joXy0wxErRNb0IvK9lgkPSlA67qK+8u2cOgALops9yYU9a+p3W2jTiIoqXKHmOFavWE/7dw/87w2irc3nj7+zvnNtIeGmi3BZD8IqDo5v1iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760182339; c=relaxed/simple;
	bh=ZpdfRoBap7LNXkf5zLdbDNb3gQIfNj+XPTaqjYigr+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLRXv/MpBkbgLI51rMZmBPp+PL/fvCsvybmeaEj7Iak0QscllWnaF4mEctCagIH5guQOL5IzAHiGFbMqVWSIB2E6g112VqhCe2oyYI+gW9xeM6g6PecBngtgUqlQCIUFP6A7yrnD5hCAWGqBjsUYYiEPqtXqXeNIpVLFtMAPyI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWZTIZVe; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWZTIZVe"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so2471427f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 04:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760182333; x=1760787133; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/WhtfIdoyiawysQgDo2chqo5YvMHlXM3yb3ox9uDzOo=;
        b=FWZTIZVeu3ridndIKBdZ92Ig96qjj7oHhHswWCr7yJ0V19t6/sE4fd4tMNthNVXm1o
         4dL1WP8EiZtyDoszI1KtgOd9V4tfjxgIZUUaukgwSJIkK0eCl6HsdmECverOBYnK3++s
         aZtZT3jNCt4pgEltNi7X7tpj1ITk2mIoUkO/FgKw3kzXJRvAj4UWwRZXZSDFEe35xTBt
         Or4+H4mtdKIZ9xdAvIn9RlXG1s+wR4EXgsqKeUIdMYPqGHZWjuxvzzwrUrN261zZZBiV
         GXFxAJbgSWZ33xBLLSABz8Akbd6T0593PpknDX2mbdsc4nfI1o7ysT1uHcw4lEedUqEf
         BwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760182333; x=1760787133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/WhtfIdoyiawysQgDo2chqo5YvMHlXM3yb3ox9uDzOo=;
        b=XtEaNF/pvrZyG0VvMEl54zaV/uxaJLHJFipREIVJNpTNTipzpkHfwZGlZCHcfZsKDK
         ZDeds1mcV5h8b30tDhHWpcYQ6qwFim5c/gQTyNAO7FK26d10OZzNFgx/xn4Zjtt1J5q7
         m9VSZ+CZn57aOkERKb+JlGitm4sIWtpFrfFo6bVSfajIlYzYQ65AGMS4e8JbS1zwS7po
         LO3LuoULczYMTX6nvasBs8mQYTHDrMu3QHLNLJcIRkIzK5zB90hlPLZY9h/LHpj9MyuN
         fkYBWEm1kA/aSOT/0BL19gild20umnktWUidVp8LauPyxk9UESsNOc/pDTb5mx2flyRK
         dYUg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Eo+MnBX38Gr4he6mwtunevagnyfc6UtB5WyutpbE9rM4db333dUpUJr5r0wntcGa4YUhRP+X2nSubrNx@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnruu9py/KSisy6SXkcYBC8wBOtWcWTaWlAi3bDQ1cV/ldZIcO
	UhYzzgT6hwqdZ6zrzuvd2gbeVNxKlYmZohcgN1taHUcl/crlwLmjNEwj
X-Gm-Gg: ASbGnctNtSyg+YySrnGQ1vFYBbCxyeafnF1HkT6fgFE4Kvo5S+9Co6z6wbqkhRPHbtv
	xYWZyaxHONHSkGGOkSmvwwQzRQh0re0Et5wDWtvy1BdXt3VQhOQGz3HdlQNhfnBLusp+kcFIlcp
	9dS5eZsl3YkmCoSvmGrz6+H51ZoScixN3VGmdCqdOyT20gYjGOakyFl+VbrBkS9aloghljU7MsO
	LQDqBhpn5VESNGsL2Qvx2H1rugZUoXWh8QmzEoR83i3Mvf8By26gfXPlnJ6sT62alj7fVy0Fp/B
	PVPcLnd+O+dLp3aeL3B4CXtaX4RKYvAS+3Mdzxq0AbfCDjl7dXc0mA1XLfvbxN/xP4oFcFxY05o
	fwJWhyVFcoyVRyoMrDWxK7PHcl8XmnjB1yxOa/kZZP6MJgpdcfwUI
X-Google-Smtp-Source: AGHT+IF7DO50xv43OfmrBovVOqHhm6Smo19LkroOnjaPG77MXlD2olVAe7mIm+QWfvK5CGw0ung3Eg==
X-Received: by 2002:a5d:588b:0:b0:425:86c2:7b4a with SMTP id ffacd0b85a97d-4266d0da0a8mr8912169f8f.24.1760182332662;
        Sat, 11 Oct 2025 04:32:12 -0700 (PDT)
Received: from gmail.com ([51.154.250.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce582a9csm8676910f8f.12.2025.10.11.04.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 04:32:12 -0700 (PDT)
Date: Sat, 11 Oct 2025 11:32:11 +0000
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Michael =?utf-8?B?QsO8c2No?= <mb@bues.ch>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Bjorn Helgaas <helgaas@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
Message-ID: <aOpAO7j0Uyo6FPcu@gmail.com>
References: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
 <202510110924.dUQeeRV6-lkp@intel.com>
 <20251011122612.4fa7c97a@barney>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251011122612.4fa7c97a@barney>

On Sat, Oct 11, 2025 at 12:26:12PM +0200, Michael Büsch wrote:
> On Sat, 11 Oct 2025 09:43:54 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Vaibhav,
> > 
> > kernel test robot noticed the following build errors:
> 
> >    drivers/gpio/gpio-bt8xx.c: In function 'bt8xxgpio_suspend':
> > >> drivers/gpio/gpio-bt8xx.c:233:19: error: 'struct bt8xxgpio' has no member named 'saved_outen'  
> >      233 |                 bg->saved_outen = bgread(BT848_GPIO_OUT_EN);
> >          |                   ^~
> 
> 
> It looks like the
> #ifdef CONFIG_PM
> must be removed from struct bt8xxgpio definition.
> 
> -- 
> Michael Büsch
> https://bues.ch/

Hello Michael,

Ah yes, this macro somehow got overlooked by me. I will send a v2.
Thanks for the review!

Regards,
Vaibhav

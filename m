Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C73A1B969
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 11:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727956166; cv=none; b=kTI3ww5a9NUEusUSnxo+rniViBKQYGU6/mvsujSfW8equKROmKx6ucqNtF1grODjQUauCC+It9FZhZCUfNsR0YclEIQeId5S0Hd3g6RetiVXCW63WC28554UdW55WyBs5PvTmk8QZrwKSRFldumFeTCZcOn/kbuMRV8lCpV0O48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727956166; c=relaxed/simple;
	bh=fZgYWpqR7tQQQjR1f/FLeybwKAQDcLLRZNpCb1FQuoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FouP6pI49gWGEBcPUQImgGPbLVFI1hWsJsEJC5VFy3/wI8+yvfbTgX973jxTBP5JbHPC2Ju57SaQLe4FH1QZOSVFQUndro4fAa0DQxYGNK3t73xqM16nR5nyqwfKvtQJ/lyTTOR5H42UuCzPHID4jK228YmtPWQZHgtF+lfSH+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhFDxsEi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhFDxsEi"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20b93887decso6681065ad.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 03 Oct 2024 04:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727956165; x=1728560965; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6rEnXND8D97qQAygLMCqp6WRiokIgEMKSJrNjep6zuk=;
        b=IhFDxsEi9dH8juv5uzlZEPUHrjcnrwAI4htmY5gFWx0l8EbMKIMCV69JEpubRVGcsg
         EyFssFpucRuo/XM5jWi2Kqrc1s7/rFiAv2Mv9v4Tt1pljeI8J51f73qwy23EJaaXuxz7
         BIroiPZDIfN1JBsRO7+EC6joovhLJNNcjF2amqWNHm102ZPJJAKSMe0QGNxXJOtk05YQ
         pT84z9Cf5A/G1WapKYLLektNchztmLISb6UZU2J59u9z4ZH1+pFzhn9xBS6KikYJ6ep3
         bzhXGDnUXjW+qB89X0BzRwqWgHD7W5pMR+8Bpa6iwwXBKEplTtuxfhO+TviLBRZzHgBp
         BJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727956165; x=1728560965;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6rEnXND8D97qQAygLMCqp6WRiokIgEMKSJrNjep6zuk=;
        b=gDrQczUGoL0f1tga3bNJhDKIW8zSzgpDxuGx/zt8IV5bvlD7YVo8OVtgphfhnn8wd2
         tf9TI8BNvGbHb5vsrR1jIDJkzhSBDwyQtDXY9sK9rp4kT55umOQYQMYt5d3b8bF9cbXF
         DHzVB4OFZW/7YYFVYp5WtY5y1H8x1GZUdKOUxKYWL/cuIpNNnWXjc/SEWtUm9y0djMz1
         sNt9nDE0qA9cCgpVtY3bb/U/pEiSqZkzzt2yEo6xlZ8A/RR8idjgigu5pkpq+b+sLHcb
         c/nZUWWPn/ahtGq1SSF9xKPNXcLx3aiAp2DreWsbPln149OI37dxK+PlOjoFVtf3pSwq
         GZ2A==
X-Forwarded-Encrypted: i=1; AJvYcCVRoLmOT2YbFBGbY+9J5GQSbkBPTqp1MOcOHgidvxE1hBvi6oN/FhijyG/dhhiFT4h1MWp9j+I+sksmnLC0@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj1ZLwplY2XLkeDJwtOK+tWOLNYWWNQOyKhm8cRjs7Y/wyFVSj
	V3uY4wlTFlbdrz9m9WXsqAO61mEKPgvjB9OIzgo3/PZvx1eNX7KH
X-Google-Smtp-Source: AGHT+IGvyYVk0lkfChMHakpBDtAvaCgEqSNCXnagTHFwINDsj6dSccNJTfMNT2IWCe3wGc4CFWey1Q==
X-Received: by 2002:a17:903:2451:b0:20b:983c:f0a0 with SMTP id d9443c01a7336-20bc59fc2f7mr84061655ad.31.1727956164829;
        Thu, 03 Oct 2024 04:49:24 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fba0:f631:4ed6:4411])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beef8eac1sm7543125ad.154.2024.10.03.04.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 04:49:24 -0700 (PDT)
Date: Thu, 3 Oct 2024 04:49:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: drivers/input/touchscreen/cyttsp_i2c.c:47:18: error: implicit
 declaration of function 'i2c_transfer'
Message-ID: <Zv6EwdDybm_I0QSh@google.com>
References: <202410020735.aBI61ZYn-lkp@intel.com>
 <Zv0S3wXOzgmyFP3x@google.com>
 <CACRpkdZmKfNWF7ciHJMi4JU+_JnxjWD_kMhfxFOeydQ11Vyc4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZmKfNWF7ciHJMi4JU+_JnxjWD_kMhfxFOeydQ11Vyc4Q@mail.gmail.com>

On Wed, Oct 02, 2024 at 03:37:56PM +0200, Linus Walleij wrote:
> On Wed, Oct 2, 2024 at 11:31 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > >    drivers/input/touchscreen/cyttsp_i2c.c:118:26: warning: 'cyttsp_i2c_driver' defined but not used [-Wunused-variable]
> > >      118 | static struct i2c_driver cyttsp_i2c_driver = {
> > >          |                          ^~~~~~~~~~~~~~~~~
> > >    cc1: some warnings being treated as errors
> > >
> >
> > This is really weird: cyttsp_i2c.h includes linux/i2c.h, it has
> > dependency in Kconfig on I2C and CONFIG_I2C is present in the .config
> > referenced above, so all the declarations should be there.
> 
> I usually ask Arnd about all kind of Kconfig business when
> things get weird.
> 
> But could it be one of these awful things:
> 
> config TOUCHSCREEN_CYTTSP_I2C
>         tristate "support I2C bus connection"
> -        depends on TOUCHSCREEN_CYTTSP_CORE && I2C
> +       depends on TOUCHSCREEN_CYTTSP_CORE && (I2C=y ||
> I2C=TOUCHSCREEN_CYTTSP_CORE)
> 
> Since I2C is tristate it could be a module and then this touchscreen
> has to be a module too.

"depends" should handle this and force touchscreen be a module if I2C is
a module. Also in the provided config I2C is built-in...

Thanks.

-- 
Dmitry

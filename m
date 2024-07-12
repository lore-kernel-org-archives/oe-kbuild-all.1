Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E662010F9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 05:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720762315; cv=none; b=LqP9X2gBbAl86cOldK2BdVDj+dRnqDhApu17Ox6vOI/DEVCtLec322NCj8fakEAaHMThxzYSs7cR+bJyzdcrVPYmOzVlTpO2EYg+Y5cKbChHoLtNaMhp8t9m6abpfbAeL1HCUCJ/XQM4+F/bVkLjn4zFXKu9zWmssA36ATNCBic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720762315; c=relaxed/simple;
	bh=x2JOE/uacKMukO6DCIjF1M7rRkfHpBMegk9c54hKBGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEcvk035cmPFrpnADTTAcEozkOz80et0CNAhCgdI5QN6SQUvd1QvPhTHfTguxyRs4F+oipbOaLP5ZOBseMYIRe4Voc1825k9Wooh5ZGWqsjCxioz5Qrck9p+2CGR0gtsqr7IxxHa//jxzCcqfsRIahgCwgbaNXRnpG4TJWDEwVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fF3O6TKl; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fF3O6TKl"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70b03ffbb3aso1371844b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 22:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720762313; x=1721367113; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SeQtQzD+TY/s/klR7RJ4kIYjtc2hGiXPqKcrH4XsHsE=;
        b=fF3O6TKljcOTvl++5PJezFYmYiQKG9NJYNWX2cKnLErRmNaa3bdGYxJxZWgPk8MrNs
         iXCmMpvvpG2NjYLF7w8TRZRKvlnud226GyPGzeAUfQ/4Hlq9gx94APBcPNImwq2q50X0
         m++cjedSExvnifYRO3d6sM8oUDGLGjdXw+Wvvm8X2A5YaiOa/h+QJPb+WDPXrK3b4cm7
         JD/5lHtJCkjhmPhe78BRMaEYIAmJ0PP4AZDYLj3n9CQwdsYPwkg6kIwSJ1g1ZONTUgCe
         6Y+SY1aBMcr0gxJH++8F/Lr5xEB9M8Xqe+GtoijGTyGUG1nf4gsltKwGlfNoUXOmKsbk
         mRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720762313; x=1721367113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeQtQzD+TY/s/klR7RJ4kIYjtc2hGiXPqKcrH4XsHsE=;
        b=oDHawNxo9Y9a89GJn/ta34XWL02hXMHdAyNBEvaJGo+s9bfn4fXllQH7dbRlWTf8T5
         IKyz0sXApdqGMzCfc4z9+DKBAJA5dmUyFi26YcIbCYcdJbXXUzWloD1tp4ue8LGut0zd
         yyEIiusOrudqRtSuUDOA2md6JQJYFN7Qrqm9XowpRwm+6LlWNWomMtSdBmcFQgCKc1mM
         ebO6ckME+Q/DY1lcshu/EHzq0Q6gWKm6dBAPQu2gNaNp3Ix7vWpCmhHMuJuVN/ccsM7E
         gyMtBV4lFKDLzKdGobBySXd8FNLv7QseEqsEtVULecQRwj4MuydeKI0wRcxV0UazwidD
         0i5Q==
X-Gm-Message-State: AOJu0Yw+mAI9mixIKaI5U5esSloLOo0IACZaIxXr7ZaC4Hf6zeJignIW
	ij4iF8v/ssVmZhdXvAKav3wocLmqj4hg1qafxxeKJh2N7xadlz3kWVyPIQ==
X-Google-Smtp-Source: AGHT+IGdaKY0AIbjwG8LXoYxvlUUmEwWy/AA2wakjj9WqtAkEKgjhBNAomLkbI3bq4pOhm/vO7HWVw==
X-Received: by 2002:a05:6a00:1388:b0:705:c30d:d6c3 with SMTP id d2e1a72fcca58-70b4353c1b9mr12412533b3a.11.1720762312999;
        Thu, 11 Jul 2024 22:31:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:acda:de52:5c83:f72d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439e9583sm6562582b3a.208.2024.07.11.22.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 22:31:52 -0700 (PDT)
Date: Thu, 11 Jul 2024 22:31:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master 11606/12643] arm-linux-gnueabi-ld:
 arch/arm/mach-pxa/devices.o:undefined reference to `gpio_set_wake'
Message-ID: <ZpC_xsx0t9KFgCCh@google.com>
References: <202407112039.cyyIQ3Js-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202407112039.cyyIQ3Js-lkp@intel.com>

Hi Arnd,

On Thu, Jul 11, 2024 at 09:02:07PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
> commit: 917195d6f8293c35fcf9ed4bfe18f52cc1c9d2e6 [11606/12643] ARM: pxa: consolidate GPIO chip platform data
> config: arm-pxa3xx_defconfig (https://download.01.org/0day-ci/archive/20240711/202407112039.cyyIQ3Js-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112039.cyyIQ3Js-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407112039.cyyIQ3Js-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arm-linux-gnueabi-ld: arch/arm/mach-pxa/devices.o:(.data+0x167c): undefined reference to `gpio_set_wake'

Sorry about this. I think the easiest way of fixing this is:

diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
index d050a4c78f97..7695cfce01a1 100644
--- a/arch/arm/mach-pxa/devices.c
+++ b/arch/arm/mach-pxa/devices.c
@@ -633,6 +633,7 @@ struct platform_device pxa27x_device_pwm1 = {
 };
 #endif /* CONFIG_PXA27x || CONFIG_PXA3xx */
 
+#if defined(CONFIG_PXA25x) || defined(CONFIG_PXA27x)
 const struct software_node pxa2xx_gpiochip_node = {
 	.name	= "gpio-pxa",
 };
@@ -684,6 +685,7 @@ struct platform_device pxa27x_device_gpio = {
 		.platform_data	= &pxa2xx_gpio_info,
 	},
 };
+#endif /* CONFIG_PXA25x || CONFIG_PXA27x */
 
 static struct resource pxa_dma_resource[] = {
 	[0] = {

If you are OK with this I'll submit proper patch.

Thanks!

-- 
Dmitry

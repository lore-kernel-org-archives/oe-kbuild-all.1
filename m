Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DFA28A727
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 08:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747298086; cv=none; b=D8XuhDjCuD2uO63Dej9AYHknOzwpY+Tj75W1Lm6Ps9FnG3DNy/sr8UFHniFf4GKo6/Fg8VwVxXs/XU7Qk/9iiXhBsjB3QnVu/JXQTy/9f7Gt1toyj39aLGH0iuvn76fFKph82S1+y/MlDUecLMtnNd8GUbkUsKpcF9gFlMFXTns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747298086; c=relaxed/simple;
	bh=5Cb6EQdZSJNvGfptwnny4AQlzpNOIDRdpBW0ds+Z9XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9+qSCGcgXTL8NDRTi5wUTMv+DWSTK6eBG6LgaWphUgU+KuwyoNW45RrCtRCGB1J51rAzvcAR7YIrlIWPdk/oZA4tRCg9X3I6tw0iZu6QntfridcdPgL5mgyKiH8ou9pRk0t1bEw0+hHsmoMX+38k2mqNRC+1MXoYrVjrnBDE0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pux8bHZS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pux8bHZS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so13539855e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 01:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747298082; x=1747902882; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NTNydlf5rwZIjCPw7zUm7fKdllwCFJguNUgD96Q4Uu8=;
        b=Pux8bHZS+ia20oBDnswCc5NDuUb2yEPjg7In0Z3JV/SqxO0qq6ziIHk8KFoCY2f/kj
         ZPEcJZ05xIAoS8tiQVjLlN3R9LfJ1KZsbZ0qd0NEtQT1JQIejccmwlVvNfa7tWLeCOWO
         lzzdU5c8sCS9RTr0QATQr1eDamEeYpPVtn5PsgyCNjr2K22orZ5n5OvXShyKteD6H6C1
         RnnPUNStVy19Pf7jBhbhKGz8Y027G02Mu3+ECrenrQ2Fddq66YQ61lV3Xt3VCQUyTj6Y
         tU8JBPHkBqKBYu7iQx4J+v0jI+HBbFdxA4BigFO+a7LePHwc5Ein8ZAjdNf469Fu9ngK
         FMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747298082; x=1747902882;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTNydlf5rwZIjCPw7zUm7fKdllwCFJguNUgD96Q4Uu8=;
        b=biiLZWsLWC8Wjx0az9M8bG3Q1Vf7KJ0zh1Wapvsdq6sHfiX4p/a8PpkrUX/aha5aYG
         mf5bHM7XGAnoNzAoph5w0q0oLUXslJRFvM7jCaguWU4Cik1d04gQkm7XpxxunhEKFj5e
         3GDzAs6aFPFwnK1jjoMmjgTOKLdn3OxEbPNwqwR0UUxxL0ELS4z6Bo1PkNhMzZEBG9wD
         q/or5w8Ivrka76VFu2o924Jld3yXgievnSYeMRH/sHgLX1jXASKNDuKdC3ERmOkzgo4Z
         9Z7A5KJqwrJprp1XaxGA1RBrmWa6UpeH5s+bxMTrTmNZVFGsXkiebfOWQw1yw9yncIDD
         l3Hg==
X-Forwarded-Encrypted: i=1; AJvYcCV/qjXi5yLBek2aqgkx4WJX94iFL6H/MWgk7QMDNUzMtAcKuTR3+/epNBIDaw/ShPdkBRPSuCEEVMsl01VW@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0nd6w/JUrKfZVBxatzuOcWbtH2zdfqhSwd8k+Hvv0hxnLGZA2
	hp+i1NK4DEEr0vJ3ypTo22tyNuNHeSMzfALz8NwwTW288r6+pK7xcy2Ld8TZMOmDH6A=
X-Gm-Gg: ASbGncsOMfTmmfQleDa//oqe1OOiHAnjpotChwLzPqFGPn4If1dKmDBx07kgiKCgFAX
	V48CL8qSRJsNBZAbjwCT+3J8J2JILSG9+JHh56WcQe/iNQ/Xo3qpS1UfSGex5LLcaxreB+adZ02
	elgb+YzMba4L8OkahO4i/8n2R7rCCTcNucSsW2afgx/hrTAmUvgRXHn1L0SauP2ZqBZZ1i+TmUc
	mOHySjzYMQaJye+EytDLXXSIk9LCcKAtAZh324raySgRnIpac0vgvsh4RSJM1chn43ayB0ySnf+
	xnJD1cLmiWiUjR6ot2CcaE16zF+bxJRsK0U3tAfp+OBbiwXR0488zfGadPob2OTFX84FDZxqZKL
	U4wA+xxadh6Z0TQ==
X-Google-Smtp-Source: AGHT+IG2bIbDRbPIb0zDXbKIFTjTwG3dmfj81Y0Pa+mphZgCx6Es+dFTY7SfBNrnVwGtvcAMyRjyQA==
X-Received: by 2002:a05:600c:3d0d:b0:442:ea3b:9d72 with SMTP id 5b1f17b1804b1-442f84ca3ecmr23841765e9.5.1747298082371;
        Thu, 15 May 2025 01:34:42 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39794cdsm61538495e9.38.2025.05.15.01.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:34:41 -0700 (PDT)
Date: Thu, 15 May 2025 10:34:40 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert marvell,armada-370-timer to
 DT schema
Message-ID: <aCWnIBAPBVqBHGHJ@mai.linaro.org>
References: <20250506022301.2588282-1-robh@kernel.org>
 <202505082358.dnIeqrs0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202505082358.dnIeqrs0-lkp@intel.com>

On Thu, May 08, 2025 at 11:42:26PM +0800, kernel test robot wrote:

Hi Rob,

> Hi Rob,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on tip/timers/core]
> [also build test WARNING on linus/master v6.15-rc5 next-20250508]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-timer-Convert-marvell-armada-370-timer-to-DT-schema/20250506-144131
> base:   tip/timers/core
> patch link:    https://lore.kernel.org/r/20250506022301.2588282-1-robh%40kernel.org
> patch subject: [PATCH] dt-bindings: timer: Convert marvell,armada-370-timer to DT schema
> reproduce: (https://download.01.org/0day-ci/archive/20250508/202505082358.dnIeqrs0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505082358.dnIeqrs0-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
>    Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>    Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
>    Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>    Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
> >> Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt

Will you send a separate to fix the reference in the driver ?

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

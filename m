Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6C5524F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735391120; cv=none; b=BAZeWEJacZHyM2XpIlOStLo5zzR3SKqGXHDYBCvN3Rq1uxyNBnOS20ySw+R8c8Qtm8FiGBVOR5sojaxpbFKT9G7S7zbuM1SXBnfoARtByTQjfseQGVqvv7MYH2H78Z8eftlPWl/3C/mgesvj4wnnvVmxQf9qRnr+KpeI3x0sHE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735391120; c=relaxed/simple;
	bh=tLI00AdoqUX3ManMczGAXIItQYoANNYhRX/hnbOxpIw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FQ/hoMrRzXDvDG35jXdn69uzupt7D7mRD98/epGSH8VmZuVzDdXD+qsClQLldsQ5ndYtPQOXBRVYMwcrDghxlLt0VkZVznwV9k7/TYdPHgBRbvX4UcSWxUv2foK5RMDP6BWuObyyCENM+qAT73CKgJDZR6CISlB0u6+08gsTwfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXIql1LD; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXIql1LD"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385de59c1a0so4770880f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 05:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735391117; x=1735995917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROvqpR6bRBvuV+u1dc5rm4nTWqVWC2mi+p9zbxlzMAQ=;
        b=VXIql1LD7vO3bo9L0Aq3Mx7OuosSO6WSS8dFnhQUpxBcAxnQj/5CqCWDAYD3ZpKq8S
         zvyWiKkogANTa/An/kr0csOTF9pc0wNTZEjtE+gmTx8oJlm9OyrtaQgEd6NaX7V98g8n
         mG3x0RK8ElLQ+SVzMelKBn0AJdr0+Daz2extgvtZYMMgo2LRZUnzGdCbN9dRRXxjzBgB
         SCaTLFhFLgVT+zhpb/47BP9K7G0NUbiLY28PWgXzynPzCFJq06M/CG4QZBDInpUet5gl
         dOdJPw13mHTA642VWCEKa9Ke81TOH1jOkyaaS5GGRN1LF2KKilxK7FqJYo+LTDgr/RAh
         XH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735391117; x=1735995917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROvqpR6bRBvuV+u1dc5rm4nTWqVWC2mi+p9zbxlzMAQ=;
        b=UzQpuTUjqUI1PcWXQ/9ET27riMFuDCEynssjTlDhfshesixrRX4c9CfbPlkRTJwJcC
         iK9eFPmGoSUut43CtZhUV8Ig7vufLnXacWlbE5j63SgWqSGuugNTBQmTo9sjyDKYFH5A
         GJah2RbOAux9dznVamPO3TIgogpmCzlzM+uOZoMS3WIiMVey/fcowavwgN+SwqNcPIhD
         1etrZv+iVxtaMIZo0Qu+pm1BLoBXiwULgVP6DWDRylqAeTdc5FBpCfUkYcczk+8tjVhH
         I+eGkmx6ZNAHj0UvVdZxd4F9aV4dm7AU1/BA+9XRqvEu8G9RmM57V2e4SPQ6mZGvVRqn
         VRjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7F9Ushxis/v2AsHUKkK5x5QpgOUdfiei9NRUnbdGPqURULaWll7TAfbRSaJ7IdD89iQmeZfJ/Tq1LysR/@lists.linux.dev
X-Gm-Message-State: AOJu0YxRkW6Gh/N1re0yWp0DFGCafLllSz8lmUDzNO1cdpy+PzZ6Y6fM
	1pSZoV+a9h9jpX3MGzQoXpXncz4xJ683KyUHxfYSFMNLMjOzdyrx
X-Gm-Gg: ASbGncsiNHUt+MXqMG/tf9g4OWT1HEf4GBbOgOkLP2ZYdQQUXThpdLvAnu20ousi5+S
	gqALTvMfrOOds0gjYk3JiDxRaK5EyaavnbnQGxf5Y3x+GGefiRtiw9C6Tz/gBPbukutbr+P1+Fm
	PwO/sEs61s/bBiK8RJfnktFMLTo1vO8MDFLo1fd1upxo9NwANtNlJqtX92x37Mu2wmMliWZALWr
	LnHMs5UAknUY2Av/2pYIIObqjWjd5tpg7VNxBpVLvOogDmvc6JDEQ8TpquY1RDG8qi1ao5OQwnX
	YMbVKlfNYaS1JmtIE6XasgA=
X-Google-Smtp-Source: AGHT+IF02h27GIavoHO6IxGF3wymaG8RDR3o1DZKasrgYTqwinNNbojeBvaQ66pRgz9pMtW1B2w6/g==
X-Received: by 2002:a5d:64c8:0:b0:385:ec8d:8ca9 with SMTP id ffacd0b85a97d-38a223f5c0dmr23111977f8f.42.1735391117288;
        Sat, 28 Dec 2024 05:05:17 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea423sm300398355e9.2.2024.12.28.05.05.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2024 05:05:16 -0800 (PST)
Date: Sat, 28 Dec 2024 13:05:15 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, yury.norov@gmail.com
Subject: Re: drivers/platform/mellanox/mlxreg-hotplug.c:87:61: warning: '%d'
 directive output may be truncated writing 1 byte into a region of size
 between 0 and 31
Message-ID: <20241228130313.4457f873@dsl-u17-10>
In-Reply-To: <202412281022.emy8ZDNh-lkp@intel.com>
References: <202412281022.emy8ZDNh-lkp@intel.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 28 Dec 2024 10:23:25 +0800
kernel test robot <lkp@intel.com> wrote:

(resend with fixed email address)

> Hi Vadim,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
> commit: 92d020f97966b1724cfcac93e89176d0eb3aca61 platform/mellanox: mlxreg-hotplug: Add environmental data to uevent
> date:   4 years, 5 months ago
> config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241228/202412281022.emy8ZDNh-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281022.emy8ZDNh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412281022.emy8ZDNh-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/bits.h:23,
>                     from include/linux/bitops.h:5,
>                     from drivers/platform/mellanox/mlxreg-hotplug.c:8:
>    drivers/platform/mellanox/mlxreg-hotplug.c: In function 'mlxreg_hotplug_attr_init':
>    include/linux/bits.h:26:42: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
>       26 |                 __builtin_constant_p((l) > (h)), (l) > (h), 0)))
>          |                                          ^
>    include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON_ZERO'
>       16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
>          |                                                              ^
>    include/linux/bits.h:39:10: note: in expansion of macro 'GENMASK_INPUT_CHECK'
>       39 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))

This pretty much always gives a warning when -Wtype-limits is enabled.
I'm sure someone said it was being removed from 'W=1' builds.
But changing the defines to (say):
	__builtin_constant_p((hi) - (lo), __GENMASK((hi) - (lo), 0) <<
(lo), __GENMASK(hi, lo)) will remove the type-limits warning and give a
'negative shift' error if (lo) > (hi).

...
>    drivers/platform/mellanox/mlxreg-hotplug.c: In function 'mlxreg_hotplug_udev_event_send.isra':
> >> drivers/platform/mellanox/mlxreg-hotplug.c:87:61: warning: '%d' directive output may be truncated writing 1 byte into a region of size between 0 and 31 [-Wformat-truncation=]  
>       87 |         snprintf(event_str, MLXREG_CORE_LABEL_MAX_SIZE, "%s=%d", label, !!action);
>          |                                                             ^~
>    drivers/platform/mellanox/mlxreg-hotplug.c:87:57: note: directive argument in the range [0, 1]
>       87 |         snprintf(event_str, MLXREG_CORE_LABEL_MAX_SIZE, "%s=%d", label, !!action);
>          |                                                         ^~~~~~~
>    drivers/platform/mellanox/mlxreg-hotplug.c:87:9: note: 'snprintf' output between 3 and 34 bytes into a destination of size 32
>       87 |         snprintf(event_str, MLXREG_CORE_LABEL_MAX_SIZE, "%s=%d", label, !!action);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
...

The compiler is failing to note that ! returns 0 or 1!
But maybe 'action != 0' will be ok.

	David

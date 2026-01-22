Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C155B428852
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769084276; cv=none; b=j6U4kCP7NTj3fINnUWg/KyiUu3T2JDaiMPM3wXYBxjBSVNoltWsxp26119B/2S4VavtM7tPr7QXHsD5AgV2zKBkt6Ts+EyjyNGUSFcPOpobPInEU7K17HE+Wjg4I2JzQeJwewOaRhMq98bCArOTeoO6E3gbhUjXmT59Qz0Sbesc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769084276; c=relaxed/simple;
	bh=o1a0s6yqxdzNssBJ8GLz4MYX+xieOSENOccN8XZK4Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fsy/YvnUJ/yYyRe0+kXsPyFsk8CN00g3LVEucI4NAqDh1ZsMsPx5E1xGgpTQSqODDcOVZqZsLOBgi/8ZBvNspDhUOEVAc7HCNbfe0qqVu4WGpWTziPUV9pxvMgivpiczL5ztrrS5IoA9NYk/F9yLgWfFdbPCfGgQ+zLx8Ii3rdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJqiRyCB; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJqiRyCB"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65813e3bdaaso628893a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 04:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769084273; x=1769689073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvVMyc7Izyekg4erNbUiI7MR1H3oQdShyZ4b768kWrQ=;
        b=AJqiRyCBUuVfSPBfr9aMQOYeBWITEgceWh6J6rffcbOEjz2fbjj1ct+HwFVZ3rmStT
         ZMRkWjc22uZRQZI8b2lFT35AHgGlLM9ye7jIdNUDU/eWYqNICFZHH+6XmysvXzWKgBpP
         OvTxiLrpWNeFOLN4ATu98QvkF6Y9uHYqCC0PvwOyOAivM8jCEXrHgXzhfHyW4wpQG2Ex
         6C0DTz/ef1e00iKPRFLj+o9RKwy3LX86Pr8YoVdn0KmPgM2lWGmAoMtmBAfNkSF8dsE0
         HSTy7dHQKtQw4p5GDS/eVpp9GwHUFHSVDPtBhs8hieQNAk8KGPG65ogj1pjLg82GimzI
         W6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769084273; x=1769689073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UvVMyc7Izyekg4erNbUiI7MR1H3oQdShyZ4b768kWrQ=;
        b=cfMFgGuq7qAU/T5Aez5Lwixn0u/l3OF+rJw/WEPj0Hyk41gw/fTYHlTrOMCeRgOu3q
         m79IXhFr0eDUHkTtV29TZuY7ZElshLWGfY4t9L0nbpf26IcodEYLoxSrx8eWQA2BoQpd
         JoaTKa8NgLvGmWpYislmR5z+ZzM2cG09AlE9EiqqF5Ekivi4jUSVkR35ynKwuMJw4wRg
         yZV848s5qMC1OdGLpvKZ+QWy3XbJsC7K3mImCzpy5cuddu+Cbus21tfaMqZYdLXO2t/f
         //enp6nt41dtA0cLdZQOMtS28+jT8wkUg+drRarTdzXrvYEakSWU662MmZSIOG7p4hJA
         0YkA==
X-Forwarded-Encrypted: i=1; AJvYcCWf4uwXXXSHy50OeYkTmf5LUXTiWt8wPX/4EK5fJk4HLoO1SmeTuRuOcoKlzqDpajlzsY45VvYkydc5EbhA@lists.linux.dev
X-Gm-Message-State: AOJu0YxaqIMBdN5bJ8dyVDNQZp37/dTihPuv3HUlq70NhQdgPMcq8iiV
	ZvFPb1d8MtozrULgDIyNFzvsmMwLTdGfuKEvvRQNu6HtGe0ITJgJhiHUZ/8wBw==
X-Gm-Gg: AZuq6aL2iOY/iZ9vuewqScRWqvOhyv5EjCBrNeCDWtlTY/upL8g/SsocUSKu5+Xofvb
	rTBFak+qFJycDxU2LcaENWwD0u+LgdRhBvQENDJMdXKYy6smZofVcQKO36wIOL8/WePmWR5/j9b
	+okn91a4YEP0ZwKTBxLYzA5xcXZIJ+aezrdPuU5krnJGai6WPYolQDs9V6b2/hkbAhHhzUV2u89
	t8TeGGfrYPIf/K3byjjYt19dIin7OgODdy294mNwHNKzW9IhG2hjIpAsrZMmkfGMapnXDQ8DLQp
	7bpD0tauFxcPbkUJ3MeA8qUd03efg+syaqxyz3+ngpOLq2R15iSSUSe411YmpryoPLhWUP/4d06
	j4vWwbR8DG5LgGlJLac353Kb0/PFVJENjk8O1GnyDXYFBPSBCj//UIJOHVjfkgzzyloL9Icl4Ne
	WpG8C9wWJPzG/1Z1malZoXUZT4/avSOotZ+qD3n2KHl1PvbfNxctkK
X-Received: by 2002:a05:6000:40c9:b0:3ea:6680:8fb9 with SMTP id ffacd0b85a97d-435a5f4da63mr4516285f8f.3.1769078019504;
        Thu, 22 Jan 2026 02:33:39 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6dasm45262285f8f.32.2026.01.22.02.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:33:39 -0800 (PST)
Date: Thu, 22 Jan 2026 10:33:37 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Yury Norov
 <yury.norov@gmail.com>, Jani Nikula <jani.nikula@intel.com>, Vincent
 Mailhol <mailhol.vincent@wanadoo.fr>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH next 11/14] bit: Strengthen compile-time tests in
 GENMASK() and BIT()
Message-ID: <20260122103337.26473d1c@pumpkin>
In-Reply-To: <202601221237.soiAkwkN-lkp@intel.com>
References: <20260121145731.3623-12-david.laight.linux@gmail.com>
	<202601221237.soiAkwkN-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Jan 2026 12:41:22 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on next-20260120]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/overflow-Reduce-expansion-of-__type_max/20260122-013456
> base:   next-20260120
> patch link:    https://lore.kernel.org/r/20260121145731.3623-12-david.laight.linux%40gmail.com
> patch subject: [PATCH next 11/14] bit: Strengthen compile-time tests in GENMASK() and BIT()
> config: mips-randconfig-r132-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221237.soiAkwkN-lkp@intel.com/config)
> compiler: mips64-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221237.soiAkwkN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601221237.soiAkwkN-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    kernel/kthread.c: note: in included file (through include/linux/bitmap.h, include/linux/cpumask.h, arch/mips/include/asm/processor.h, ...):
> >> include/linux/find.h:209:45: sparse: sparse: Variable length array is used.  

Can we stop sparse complaining about sizeof(VLA) ?

	David

Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D19233B6D5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 06:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481750; cv=none; b=GDMIayGbIC2Z/OE72fUts42Pj/CakYT8zb0yDYU5lOnYXJoekaMyecz7Dw0B6F71785jWujPWwg7JY9Drwsttmh6P2HtCWmgCXC/DSvdb3jrgoCpZlXqOvRHQdLkhnWIvbZ7lV4AaMtoD0ovFntt/SGVYqC/nBTnxiy1lr6jBqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481750; c=relaxed/simple;
	bh=ESqdwpO1PaZzMNYLF3fxyPf6qP7RM49WGjHDzTkKeUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LEaY3qDl/NYaASv+iD6jhmW4LTAir2EcEIAoPnoNfZQRXlAovJ9XDs2x9zWCdsqsN+NOAwnxyMtnmo6PMWQC/RgYjyhY9WBDF9YgYUVF2g8aB3vTaPPwR180YwLLM40rVEkZ16HbZJ0rqGatF3MYKcjPMpucAZKAY1rd3aZGBLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9568159ee07so2501608241.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 23:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481748; x=1779086548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmM7uPcTxOtt/CXqxfbtSzgj1ys1bMpqCcKcPX8L8Aw=;
        b=hP/bdxudi3prlhg64MsdYZEpw5Nuo+7qK1o55wnhdbGSEVY6eldo/NgFQrGejpyTue
         XPlaHCOE+bloNYZUQg3IBYybf3MUptNGdtC9OlxoQPPK+yHQUI5eWeLiXnpzCU61W7d1
         U6o7+XvxyCCl5+piTSz1GzxGvMmrHcIuNLEXxWFo6QCHfG2JjnURTC9t7cpGbvfZYU+C
         sL+RKzlogZ1ITkwROHr/XeUm3PKdIkTWUlHs0Jm85CbdsBt9/ZwhJkKZwoAJscRMh/xj
         r3Ytbod/2ki2uQEUhXPH++r8RaHwC2dUJXymIPmNGQhsvXfZ8pN+yPg3IaqNCnKFic82
         z8FQ==
X-Forwarded-Encrypted: i=1; AFNElJ88h/ljHh1/kzjyjN9TOXkcn10Rms5jMFNSdpfvv51JNDgKkfd6Pv9yWgQ+Y1Z7Rm/ThlzUBwscMpqV6OWs@lists.linux.dev
X-Gm-Message-State: AOJu0YweeMXv1lpr6UXPZhGBNzTMURQdQI5ywX/ezN1/oDxBWkKwEINi
	cBwT/hRaXdCXKsDG7tBtPGdh33PWwYsDvwmUgcWVVVp/FRktdszVOCNwT3+M/s0j
X-Gm-Gg: Acq92OH83alKU6Dp8P6xfhSwoeIVJUlOS1azS8gw2MhtV7EdYsN/qSP181EUXmScxOC
	R/X99bWcm/4qoGybVv9fksyUNohzmTTzVb0Q3eyPdzLJJmhVBw1r5VGxyadkTQ9SRTFVYvyxQCI
	XFpGQOdiaGknKDaamKcopMjGndc17gTTUHLO99FUS2AKZMOdoouDjQdt8Ev13D93oJ3h7hBayMQ
	sm+OwsbDhEa4CpT6pMfm0J90KOkzdvattF2AQWYTRpe2y2TgC1BWWlFGx1fE67HIV011hU6WCFI
	xXy72Jcrx3hBTh7lw/RbZGZqhcgV47vjwDCPfqhzMnIvRGnKUGOT+ss8LacWcQH07DvgYfGljUm
	pmQT7ilvngL3aV8XkIRgARNkfZfmHRlJBatJX3RLUzdiNUfbUAXma6Mtgvp5iE0hXT7P0qF8yRE
	lVLgprOPr21rau63CsRSoU6Q9AEcnhmu2i4Tjc1Uqyi3C9q5FhFBZpyYBRTR6F
X-Received: by 2002:a05:6102:3a0f:b0:633:78f9:10a2 with SMTP id ada2fe7eead31-63378f92104mr1732444137.20.1778481747892;
        Sun, 10 May 2026 23:42:27 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6313ffe8ab3sm5396411137.2.2026.05.10.23.42.27
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 23:42:27 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6312970d9e3so2414973137.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 23:42:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/VuclRpqJvPdGYbgdXAcbJJPwe0pUode43AjJGyisJhxc4bZTlxyKv81c0o38G3RAXhkf8Xxt8nu2hvhLc@lists.linux.dev
X-Received: by 2002:a05:6102:2ac7:b0:633:c6c4:b32c with SMTP id
 ada2fe7eead31-633c6c4b990mr1428757137.15.1778481746411; Sun, 10 May 2026
 23:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605100125.l4JVHppO-lkp@intel.com>
In-Reply-To: <202605100125.l4JVHppO-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2026 08:42:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPeUnjN__PvY+HQg+cSxKe-RLnyT-A5KGe=4cmjnUNbg@mail.gmail.com>
X-Gm-Features: AVHnY4LhC2w7Nls0eAOnAROXGmHfJhM8ihUdL8l1JwrVFRMxvNzDPSpVspNG9hQ
Message-ID: <CAMuHMdXPeUnjN__PvY+HQg+cSxKe-RLnyT-A5KGe=4cmjnUNbg@mail.gmail.com>
Subject: Re: crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes is
 larger than 1024 bytes
To: kernel test robot <lkp@intel.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 May 2026 at 19:07, kernel test robot <lkp@intel.com> wrote:
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   ec89572766744e844df24c27d31c97b4c00f4e07
> commit: 9d9b193ed73a65ec47cf1fd39925b09da8216461 crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)
> date:   9 months ago
> config: mips-eyeq5_defconfig (https://download.01.org/0day-ci/archive/20260510/202605100125.l4JVHppO-lkp@intel.com/config)
> compiler: mips64-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100125.l4JVHppO-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 9d9b193ed73a ("crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605100125.l4JVHppO-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    crypto/ahash.c: In function 'crypto_hash_digest':
> >> crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>     1073 | }
>          | ^

This is one of the few defconfigs that still use CONFIG_FRAME_WARN=1024.
The default value for 32-bit systems was lifted from 1024 to 1280 in
commit 32115734c0ed8b46 ("Increase the default 32-bit build frame size
warning limit to 1280 bytes") in v6.18, so perhaps the downgrade to
1024 should be dropped from the following defconfigs:

$ git grep CONFIG_FRAME_WARN=1024
arch/mips/configs/eyeq5_defconfig:CONFIG_FRAME_WARN=1024
arch/mips/configs/eyeq6_defconfig:CONFIG_FRAME_WARN=1024
arch/mips/configs/eyeq6lplus_defconfig:CONFIG_FRAME_WARN=1024
arch/mips/configs/lemote2f_defconfig:CONFIG_FRAME_WARN=1024
arch/mips/configs/loongson2k_defconfig:CONFIG_FRAME_WARN=1024
arch/powerpc/configs/fsl-emb-nonhw.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/arm.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/armeb.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/i686.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/m68k.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/mips.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/mipsel.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/powerpc.config:CONFIG_FRAME_WARN=1024

I am not sure about the wireguard selftests: they might use the lower
value deliberately for testing?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

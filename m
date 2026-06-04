Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C44397E92
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 07:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780557391; cv=none; b=p/lBRk5mCkk86URbCkrGhLtkW53QLCwbinNlIlIksdo9alM6l90dnsVwcFsZSbUe7lxAQ1xU8FMFKhf+LvmLVOtoBoHWZVihDxO2M97LT+bRG9Fd5RQBztHUczNfR5qe/Wjf0cGs2k7VuQiInQni0IQ2QMAuzQMVXZSZEB5u7/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780557391; c=relaxed/simple;
	bh=ipxFRwOMI9FnrFLgYfOuqOLFuYrkxm4d5w3ALRd0Xlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tWTKFINJVNN7+SbmhTYdv0BANZjNj2sYdIG3rU6nfwz4VDcJq8mqmC0LnSNr40UIZvVrVQjN5r57NbpTo5CABvdkp+evg9XIC31VVMLGl7iLLs8DwfFT8ScZ2+aicchGWqUEFgmP+H48s0EHOSyNHzp3npheDoxi/pxJLY89F0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68d2342c5e6so504745a12.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Jun 2026 00:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780557388; x=1781162188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmuhf90GQCmtgd5+s3OkmfdSZyPGskYbQsHr9VlNV2M=;
        b=i4wT0xeVCqhNvZxRGKMR4MdkALPx2EfCincfJY340Ib7x9XuArUBNL7Y0Jhfq7rKo2
         gazKiM/Gxgq3mdZ7Vjrzk/moJhlJTHtcRyEow96tr9kQvWOIoMt0yY4Y93Cio+cXxVUk
         2dlLT5LoP4bvYKT+kYYf3B+6iJ1TZT4ZtjBQgxyNF/WGZNj15ihk4fonYj4qvQc20d10
         SnR/CAcKR9W0P+Tjp7kvBZmDIVcMtN5zByH+zBlDm3GJYZF5NLPy6EmAuy29m38Ztxvq
         /DhGReklHWSoiCuF4GMgFWAcTt61pbKdD6ftJrHVqoVRFX9zUv7g0xp5MSCaM+rkedT7
         B6dQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ylZFLXWuu/zgqpkph0TC8QrwqtsthUv9EMmbW2RW3UJtxyueLuVBVoD0901ksTu0KXr3VbmjHxjHTrGxo@lists.linux.dev
X-Gm-Message-State: AOJu0YzyuRBJWjLv9FrWR/ib5NgsMPXBGlPpv1FzK5tMIByx/EEAYGkx
	2nxJvn15VPZ0azTzN6UOULA6PmIbxPficd8przUExSq8L57RWpT/g9mZaHUe5yz//Ok=
X-Gm-Gg: Acq92OE87wqLQ5r6d6fpHFHZnFTjTcQoLysNO1StAWkNfy+kX+RuLXd5yF93DzMpT1e
	KJY3eTACgPFg6GSVFot80C3TqMX2st9yLWh0r8KSgwZbttOBp+6JWaDL/OUglzJgvhedq0Vju1W
	Wp9BhLu1IQ8+OirnClAM6Td2EaSOye4BkJh0v9undBe93bNOk2BM1qJ8ARejbdKpPkHhDsuDqvF
	l0ExznEHHswwcKxDz5uyyijcq4laHnziypX0bJSZbE/vqfM3V/C3h406uQIqjzaiiV8QveU+vTJ
	mRCcnSPbZW1ojV+cEGzjaycZnmikSWIijQnbapHuF9+xQW+uYBmcJ4g2GCwHdblEVErQh0HFqHU
	sdJ0hDaOOTLEX5mWVseRIQgqJjQ/iyGJoQgp6CS5jRYEkmUoulio0HJArdVXtljxDtmy9t53hd2
	Azifv/yx63alSSRwVzfViplrMs1tFpvbukUt0AvNT2/gewITplEe2GAGL1GL3KS/LKnShKD5g=
X-Received: by 2002:a05:6402:5290:b0:680:ccda:55b9 with SMTP id 4fb4d7f45d1cf-68e714dc524mr3037970a12.16.1780557388241;
        Thu, 04 Jun 2026 00:16:28 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65029381sm2107589a12.13.2026.06.04.00.16.26
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 00:16:27 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68d232ed3f9so514140a12.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Jun 2026 00:16:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+MSMr2N8aX1GLJCxV39n5hemGlmUBuf+rpjAgsc1fFLjoyorHHjq3Tl3m3UBZYeIp6WT4GL6hFndIt2yC0@lists.linux.dev
X-Received: by 2002:a05:6402:3805:b0:68a:f749:608d with SMTP id
 4fb4d7f45d1cf-68e72932655mr3390437a12.21.1780557386130; Thu, 04 Jun 2026
 00:16:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606040245.XfmRpBhA-lkp@intel.com>
In-Reply-To: <202606040245.XfmRpBhA-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 09:16:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqo5C9epmE1idc15x9nByhVZP5Hdb5OKtOLSMakb+sfA@mail.gmail.com>
X-Gm-Features: AVHnY4JPWQVIpu2upPgjp37FxY__BC8JhXLs9bmbyscm7sasgK8RSPuLMSmE61A
Message-ID: <CAMuHMdUqo5C9epmE1idc15x9nByhVZP5Hdb5OKtOLSMakb+sfA@mail.gmail.com>
Subject: Re: drivers/iio/common/scmi_sensors/scmi_iio.c:247:1-7: WARNING:
 do_div() does a 64-by-32 division, please consider using div64_u64 instead.
To: kernel test robot <lkp@intel.com>
Cc: Tiwei Bie <tiwei.btw@antgroup.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>, 
	Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

CC IIO/SCMI

On Wed, 3 Jun 2026 at 20:36, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
> commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
> date:   1 year, 1 month ago
> config: um-randconfig-r052-20260603 (https://download.01.org/0day-ci/archive/20260604/202606040245.XfmRpBhA-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: a0e2cb6a9063 ("um: Add VFIO-based virtual PCI driver")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606040245.XfmRpBhA-lkp@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
> >> drivers/iio/common/scmi_sensors/scmi_iio.c:247:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
>    drivers/iio/common/scmi_sensors/scmi_iio.c:507:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
>    drivers/iio/common/scmi_sensors/scmi_iio.c:273:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
>    drivers/iio/common/scmi_sensors/scmi_iio.c:166:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
>
> vim +247 drivers/iio/common/scmi_sensors/scmi_iio.c
>
> f774117c96f94c Jyoti Bhayana 2021-03-09  238
> f774117c96f94c Jyoti Bhayana 2021-03-09  239  static void convert_ns_to_freq(u64 interval_ns, u64 *hz, u64 *uhz)
> f774117c96f94c Jyoti Bhayana 2021-03-09  240  {
> f774117c96f94c Jyoti Bhayana 2021-03-09  241    u64 rem, freq;
> f774117c96f94c Jyoti Bhayana 2021-03-09  242
> f774117c96f94c Jyoti Bhayana 2021-03-09  243    freq = NSEC_PER_SEC;
> f774117c96f94c Jyoti Bhayana 2021-03-09  244    rem = do_div(freq, interval_ns);
> f774117c96f94c Jyoti Bhayana 2021-03-09  245    *hz = freq;
> f774117c96f94c Jyoti Bhayana 2021-03-09  246    *uhz = rem * 1000000UL;
> f774117c96f94c Jyoti Bhayana 2021-03-09 @247    do_div(*uhz, interval_ns);

Indeed, most do_div() use in that driver is broken on 32-bit.

> f774117c96f94c Jyoti Bhayana 2021-03-09  248  }
> f774117c96f94c Jyoti Bhayana 2021-03-09  249
>
> :::::: The code at line 247 was first introduced by commit
> :::::: f774117c96f94c7c4d2f076e4cacc80218b0df48 iio/scmi: Adding support for IIO SCMI Based Sensors
>
> :::::: TO: Jyoti Bhayana <jbhayana@google.com>
> :::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

So why was this sent to different people instead?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825A4386436
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 07:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776754813; cv=none; b=eRxTd/aj9ZxTjU1DJ2bLAgx/0SjCaob0+gUBdgSDp4pxR0sM9g63a6l67XcneuphDdhEbwww5SGIJaZveLau/HAFlcxW+1U9cXjpbzY+92p2eMdUhB3rU/V6lg70uTORJF53g6ltu4rHP5M88JXlaFwHwT7xwdhuEloZ9c8lBCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776754813; c=relaxed/simple;
	bh=1/O74o0agOZD+4hpb8h0rQWw3qbxlmotRhJ13TyHKG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B40jEprP0axLPflcHFellh5CxUtyKBlrlpm1QT6xNHAwmqFS6v8C+Mio/58+Fn1VaV9b5rT0SDTaBytXNm/QgHayYvRYeHLBya/w2YKpvu2wdCa5IdNebD63vLyNihQiGZRiQ7LRHlJhYHhRSnZfEmryDMsb1jYU9h/S9mhfQ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56d93355337so2535480e0c.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 00:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776754810; x=1777359610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWkvsym62U8lJmbYpv+7ktMu3yLAPyzeW67g+8v+om0=;
        b=YYJ6shWZw7MGDpl/9Nu1tkK4rLDoN10yy61pT5uCZ2O6B2pd0LuCc5cP2q3jniUcpg
         /cosWzFfGIZGHiH59fSb9IUX+3Mti2+Uotx4HWh1nsq3mHFUgl4gKDadIzC2IFVGotG0
         3t0lMrcfcZphRyXyNuLM427gmTYLBrUUQrzJ90LaQd2T7NOE6Clmt2NDAQ+lcEV8CpVK
         2ah3aGPjoYrifq/YD7iyHMPUFDWXYVyew2XJCGwDs4U7yqwoNcY9KHdynZv4MzUckftO
         AuOezXKFf+NLf0/yg33bKtuSohnolBqJpTRL555YwI3jLjClJ/MYK5mWT651XjXu9hyS
         QvCA==
X-Forwarded-Encrypted: i=1; AFNElJ8WResP+00mdFM4o6DPbY6iDDuU+lnsQ6ZOHfaZ4ZS/S0DHVA4mPr5oH3nZqPRIB16qcSwY7oZxItFKDjdd@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6J6cJOVQjhdcMWhSbV1xX8L8kpvJHeTT9kuHrCrIaS4M0+g90
	EZbmUs6eWe8mw0oCC0idxQZ2oyp2ZT1IXlnPpKeCXkyEkCy14BrshSZ3AzvZb912XwI=
X-Gm-Gg: AeBDieudPPwNzbP6F06Ww4qRVZqm0orrLmyzU44dL6qZrLVxYnnhEtun7Hr2VKL30Mk
	TFe0v/4zz4g8DsG65zGyxDDTuhAtxpOAmNLaCIhh1PlYkBWZDX1jmwmHH91whYckwmbD7mMhItu
	HN8EFuSYxMpQbwmBXzz2S0A98zA27utodcj8XYq38ftm70RGRxxlmp/AWVj13ooicJ/PxGXZKpK
	QEDpxs5oDkCDhdUEYaMqcoYOxr7bY7rKAPRti0CdOT6YUxKqYogXKp9epADL4vvh12IFZ30iDBX
	iqgt3dtNVHSxyynlYP+jLDK0SRqdeOmV/9YWe4Xxe8EsRbGPVtfkK7c1TQKGwvHHvyMjMwAGSUc
	5EUQXmIXdE6qibbWg56ECktR71gXGDy3MLLlJRwaCQtxqpH088qZ/BqS5q6gTccDnsOJuyCl7eJ
	mi4tTaWDTRqmIs2spXmxkcAfoqLX1vINHsFG5bKsFYN6fnKRq8bMbcXt5He8ScXpL8RQGAuC0=
X-Received: by 2002:a05:6122:6610:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-56fa5929467mr8071308e0c.7.1776754809697;
        Tue, 21 Apr 2026 00:00:09 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93253aesm7335027e0c.14.2026.04.21.00.00.07
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 00:00:07 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso2390453241.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 00:00:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/C95jRV23EsJMoWa2Wb5Nu8+BkM5RgR/ZRnrJLVZYZiKwp8YbB/X2+4PmniBPIyPJ0CA+Kh7DNeTBVMef3@lists.linux.dev
X-Received: by 2002:a05:6102:109e:b0:61c:5310:e9d3 with SMTP id
 ada2fe7eead31-61c5310ec4emr1090336137.24.1776754807426; Tue, 21 Apr 2026
 00:00:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604191731.10nxGZ92-lkp@intel.com>
In-Reply-To: <202604191731.10nxGZ92-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Apr 2026 08:59:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx80Eh8w5-OioH-Uyahea0ZRQHUVg9MBfQ4uEjaxM5Lg@mail.gmail.com>
X-Gm-Features: AQROBzCdIXJeu8RCHK15c27iLmMPUXSsQO3fgypn-K8DrqGK9QZMPMp_Wx2X6QU
Message-ID: <CAMuHMdVx80Eh8w5-OioH-Uyahea0ZRQHUVg9MBfQ4uEjaxM5Lg@mail.gmail.com>
Subject: Re: drivers/media/test-drivers/vimc/vimc-sensor.c:107:1-7: WARNING:
 do_div() does a 64-by-32 division, please consider using div64_u64 instead.
To: kernel test robot <lkp@intel.com>
Cc: Faizel K B <faizel.kb@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Apr 2026 at 19:29, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   faeab166167f5787719eb8683661fd41a3bb1514
> commit: ec1e620b245495121535bf5c046c6885c7e409cb media: vimc: sensor: Add pixel_rate,vblank and hblank configuration
> date:   5 weeks ago
> config: sparc64-randconfig-r064-20260419
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: ec1e620b2454 ("media: vimc: sensor: Add pixel_rate,vblank and hblank configuration")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604191731.10nxGZ92-lkp@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
> >> drivers/media/test-drivers/vimc/vimc-sensor.c:107:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
>
> vim +107 drivers/media/test-drivers/vimc/vimc-sensor.c
>
>     94
>     95  static int vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
>     96                                             u32 width, u32 height)
>     97  {
>     98          struct vimc_sensor_device *vsensor =
>     99                  container_of(sd, struct vimc_sensor_device, sd);
>    100          u64 pixel_rate = vsensor->pixel_rate->val;

v4l2_ctrl.val is s32, not u64.

>    101          u32 hts = width + vsensor->hblank->val;
>    102          u32 vts = height + vsensor->vblank->val;
>    103          u64 total_pixels = (u64)hts * vts;

mul_u32_u32()

>    104          u64 frame_interval_ns;
>    105
>    106          frame_interval_ns = total_pixels * NSEC_PER_SEC;
>  > 107          do_div(frame_interval_ns, pixel_rate);
>    108          vsensor->hw.fps_jiffies = nsecs_to_jiffies(frame_interval_ns);
>    109          if (vsensor->hw.fps_jiffies == 0)
>    110                  vsensor->hw.fps_jiffies = 1;
>    111
>    112          return 0;
>    113  }
>    114

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

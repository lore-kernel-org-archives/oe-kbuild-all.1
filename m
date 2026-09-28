Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255DE45A2AA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 07:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580572; cv=none; b=cqNquPi7oUkdrflkZCY8cuKcPOOVh1BpxdQEQ1wMecYSJtN62VcnJYmUld/0ignn3wUX6cFPg3vQihSPJb6lFUuCdBgMOlqA5JccNZuLUWunJD1Es6mhhIQMXBGXAZPhhfH5iStUo1roO7gpqEXz4/A0UyHOA3236uLm1TJ1kB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580572; c=relaxed/simple;
	bh=P4Xi33ISSULvvc4TWPQfm7ROH+BXhOvA/iY15feT/Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ky87hIDQCMG+BFXNURG8YYzHb/KSg6+tU8Ftk0mrXHXZrXcSqsnG9oMIn1yTPSDLp+tuDikFe3SiQVjYnqmVhtbi+JN14Ia+Itziv23vGP630gFqdNc0XdaNz4uYdQoLfQp/DUE5B5uB5fj4nj0yvqOBw++2AVuKSajxK/zRNgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b451f1e66fso745923137.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 00:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790580563; x=1791185363;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y7yImRbjSbKZKfeMDjh8M2QpHpEyIKnEvCQ1p8pd0U8=;
        b=JOmJbs1/vQOJKEeWa0l3QbThloru4R6fUsXF3AV8DZrpoWGTmhrPEOp8XoKLvzEW0s
         PxlD7y4TSTDEPmrzuHy/gwS3jXp0ZasmKUyWIN/3NcQlhVF8RGwfICMTzvuzgqSix8uv
         Pmz3Zjn176E7k64gV8/cHeNqID9QoMcRfJlr47EflEPQHXvFmebrj+gPhHUxsaQoCtiq
         He6ZDflHnWT66IyZzUyv3Qj+YwEr8FjOPod1n4PH5bWDLEol4UPeGyVNRDmCsjBQu+Od
         BelePorzZafKe9LsNUikNejCt/457m0kRPsnUi91najQ3btW82wOhcu9RORiU5t6qy5l
         Jd0Q==
X-Forwarded-Encrypted: i=1; AKwUvByM+ny9J0fJoPdXD3JGEirgDDyHoQHUeWC22FllUwuK9Dna990Kyg6TbaA3qnsrBfRv69F52C69XsbiUBIQ@lists.linux.dev
X-Gm-Message-State: AFq9FYL8WIerv7KXE96AqJpneuMyW8K5LN3R/I4aN864cRwwzPbtO7aY
	aExbjWTFzjOuuQ123CJVlIgyJsRuT0dwZU+9cuAN/DUzwvfNXs95s8mlAe4oZtVS
X-Gm-Gg: AYBFou2IeJ2yWNhoS377U3RA1rdhqhIpBcrTqkG+fonLsANPBoQjm1HUmTKNDodl+UG
	4/Du6e8yDkUFTFQEIxd+NrqyCXQTxWSKievBoDuHaG2FW8XU14VSTjZLgorFZpK1OyfWoNzt/VS
	z8i266aeTt1QfegsXUycKa73Mdo/qmKXEz0M6B84zbLT+bvFB7rbzerUEe6uVOwb2kPQ9YS0/WE
	lOcZWlauQCjEnF1MYBmvT3d/ks9QbSAzOgpIdJ6spOvHrCLg3ZbNh+2ddVRol6jpo/9hW/U6D9e
	UAEMRp+Vzske9rKdfIAiyrq7rv7V4rTQ8UT6Xh5SN6KGFtyevsvDMCqphGx51utY0d3DIyCq+0A
	28P66YF+QRj7lC4FbCcN92X2nALJD/N6xSs9WzYAZIhJo7Ud5/vcrZV50lRyHkuJHJ8v8eYBFSf
	WhSQ4iHvzI2aytGLZz7Oh/44wOL3ZQHm4AJ8DsibpCex1GtepOTtr1PiGBliQPhxROd4CR2yohx
	eKPyBD176W51X9jbWXVEJrZxpC2sCNJpmBY
X-Received: by 2002:a05:6102:3f8b:b0:7a6:bc69:5a32 with SMTP id ada2fe7eead31-7af1e6f3640mr4628779137.23.1790580563137;
        Mon, 28 Sep 2026 00:29:23 -0700 (PDT)
Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com. [74.125.227.38])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-988a5453f79sm3131719241.12.2026.09.28.00.29.22
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 00:29:22 -0700 (PDT)
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b3a6aa1050so769956137.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 00:29:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwvx23feQE0dtvFTcJ4zj2Yy9tbV+GZlF32XzyjHpCCjJeL6vbEUiak+vyI6zVk+2VMPuMzqskSyS0PvKhB@lists.linux.dev
X-Received: by 2002:a05:6102:6888:b0:7a1:f7e2:aadf with SMTP id
 ada2fe7eead31-7af1e6f3a39mr4407480137.17.1790580562466; Mon, 28 Sep 2026
 00:29:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609260721.RtG4LmP9-lkp@intel.com>
In-Reply-To: <202609260721.RtG4LmP9-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 09:29:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWb3JD8ChhOiPtqro_0mSitX7ugVVr=3rtOJX4PxqskXw@mail.gmail.com>
X-Gm-Features: AclHuK_EPiW4jzLvh9qvD-BBmPRGFZVGYxSF_u7JIPpnyuulRpnYNxnFkQ3n9Do
Message-ID: <CAMuHMdWb3JD8ChhOiPtqro_0mSitX7ugVVr=3rtOJX4PxqskXw@mail.gmail.com>
Subject: Re: [linux-next:master 9478/10910] arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb:
 adc@90014000 (renesas,r9a09g087-adc): interrupt-names: ['adi', 'gbadi',
 'gcadi', 'cmpai', 'cmpbi'] is too short
To: kernel test robot <lkp@intel.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, oe-kbuild-all@lists.linux.dev, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Sept 2026 at 07:39, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
> commit: 84cfe37c261eef10ea4030ae75bc038e04ae26a1 [9478/10910] arm64: dts: renesas: r9a09g087: Drop unwired ADC interrupts
> config: arm64-randconfig-2400-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260721.RtG4LmP9-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 8.5.0
> dtschema: 2026.10.dev2+g840a01d41
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260721.RtG4LmP9-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609260721.RtG4LmP9-lkp@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@90014000 (renesas,r9a09g087-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
> >> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@90014000 (renesas,r9a09g087-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai', 'cmpbi'] is too short
>         from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
> >> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@90014000 (renesas,r9a09g087-adc): interrupts: [[0, 698, 1], [0, 699, 1], [0, 700, 1], [0, 701, 4], [0, 702, 4]] is too short
>         from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml

Will be gone once "[PATCH 1/3] dt-bindings: iio: adc:
renesas,r9a09g077-adc: Drop unwired interrupts"
https://lore.kernel.org/20260921110144.44425-2-prabhakar.mahadev-lad.rj@bp.renesas.com/
made it in.

Oh, that is now commit 2976721806e427ce ("dt-bindings: iio: adc:
renesas,r9a09g077-adc: Drop unwired interrupts") in iio/togreg.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

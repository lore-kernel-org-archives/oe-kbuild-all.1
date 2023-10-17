Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E43405E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JM532I5f"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d9beb863816so2082738276.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 02:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697536609; x=1698141409; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RsQBUaCDWRXo1NEiM2ZUMXn+uKhmAj4ciIck7rXNGwM=;
        b=JM532I5fFMC41wUfL+t96hNxxaU6QOPkBlnexkg0vqoFU7X6E/c4tYWjtR9jEVT7fC
         Jm5FOYqcB6D5BCVukOAgqQKneYWWlRcdiawSE1obnvK6EknZFiX/xCyPlbAdzMFv/j4H
         JjbeihrqqQz/ArbH+r8udIAZn2BbjERyqbja0ijk1MjqWNMi4/AdImaxr77PFkR4JJqT
         zTvs4bMNcs+fDPs9L5bKslppIDnJsNbTkpWDWwTsgonBWXYyP2TWP2EQRHZzZezVUY/C
         mUebDZ0+qYFCg0HObwOsPaTd1qmt4c3AnlfzPzW6INeTqtAjM3HUg0WJVSAD6FN4/M3/
         Sf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697536609; x=1698141409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsQBUaCDWRXo1NEiM2ZUMXn+uKhmAj4ciIck7rXNGwM=;
        b=GJJ+ZElPV8roLQ+p0Hzr9/c1UYO1LItAAcoLmCNMZeb0tmzJ0fJCQSerj+KW1rpGme
         fWOHFWAPV9ScEyI+CGsMJJ1hD5uTfn/6yRYmXc1byrI/hHONqD0XQg8VYow1ALnWkc3n
         3PZ/+DNZr6RpUw7RY6WuAfrOYqBuVCoXfhlWhV84nWMSJbMDp8xrks4f5gK/7OD+IgSy
         HSOYjwJKQcL6S9tIbXUiq0zLWOkRS8FVYgy7lZQMGzrLW6LdLTbdIme2U7UxAJmfa9YZ
         iZzN8YFoxk42uahxp9N10+NM2LynPt6Z1HnrV4K1bdQZcpPlP2tc9fpz7rKlWhYjcr8Y
         1imA==
X-Gm-Message-State: AOJu0Yyq5Pa49Zlux75Z+VkvdcuHSeB3eq0HeYGS15JzY6w3IImlkyyY
	XH88DdHblV4xtoXP0WOBPJ1kObrycTQVtTutAh59KQ==
X-Google-Smtp-Source: AGHT+IFNreO6zkjnJw2v1dMl2E4mYaK6Wcrz6mzJdv8q/8Q7dxAa2rrH4gBMyEHRMisY1f9m2eAp4OLXJYAdhHPL9vc=
X-Received: by 2002:a25:8c8a:0:b0:d9b:76c3:4143 with SMTP id
 m10-20020a258c8a000000b00d9b76c34143mr1554893ybl.6.1697536609481; Tue, 17 Oct
 2023 02:56:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310162249.WBktvf2B-lkp@intel.com> <b318ff5f-7fbb-42d7-b871-dd0bbaaaa63a@baylibre.com>
In-Reply-To: <b318ff5f-7fbb-42d7-b871-dd0bbaaaa63a@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 17 Oct 2023 11:56:13 +0200
Message-ID: <CAPDyKFpJ6apLwabXS++Jd9CB_Y=y1EDokpcY1TQZ1j12RY2SyA@mail.gmail.com>
Subject: Re: [matthias-bgg:v6.6-next/dts64.2 7/19] arch/arm64/boot/dts/mediatek/mt8365.dtsi:12:10:
 fatal error: dt-bindings/power/mediatek,mt8365-power.h: No such file or directory
To: Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: kernel test robot <lkp@intel.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Matthias, Alexandre

On Mon, 16 Oct 2023 at 17:29, Alexandre Mergnat <amergnat@baylibre.com> wrote:
>
> Hi,
>
> The missing file has been applied into the Ulf Hansson next branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git/commit/?h=next&id=5a19210db6dc40ede6a12b62cad773640807745e
>
> How should we proceed ?

I am sharing an immutable branch with DT doc/files updates for the
pmdomain subsystem, which is available for soc maintainers to pull in
to address issues like this.

For some reason I forgot to share the needed commit pointed out above,
so I have taken care of that and fixed that now.

Mattias - please pull in
git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git genpd_dt to
your tree/branch to resolve this.

Kind regards
Uffe

>
> On 16/10/2023 16:15, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git v6.6-next/dts64.2
> > head:   976868a021ee654f4cf6eb6a2f40f95c78c04093
> > commit: 39da9a394be05ea5ab1e08131916354e176ddd7d [7/19] arm64: dts: mediatek: add power domain support for mt8365 SoC
> > config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231016/202310162249.WBktvf2B-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310162249.WBktvf2B-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202310162249.WBktvf2B-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >     In file included from arch/arm64/boot/dts/mediatek/mt8365-evk.dts:14:
> >>> arch/arm64/boot/dts/mediatek/mt8365.dtsi:12:10: fatal error: dt-bindings/power/mediatek,mt8365-power.h: No such file or directory
> >        12 | #include <dt-bindings/power/mediatek,mt8365-power.h>
> >           |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >     compilation terminated.
> >
> >
> > vim +12 arch/arm64/boot/dts/mediatek/mt8365.dtsi
> >
> >    > 12       #include <dt-bindings/power/mediatek,mt8365-power.h>
> >      13
> >
>
> --
> Regards,
> Alexandre

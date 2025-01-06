Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756E11DF26F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 20:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736195085; cv=none; b=mIwGM2c+1ks5HwXnUCYd8Zo3OCRgj7RhWv/h4Nqu57aW4KarmyxelMcMHNBpWY6F4lswUJOJ9tlVvNgy4San/rJ/YaD1ixMqsy5ZuFz0Vw98nPQUq7Sb/lXp6vCK4iksvso4dJ64k/4n+yG1NFrbl2XaY+Q5qqKNi72yGhKBM5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736195085; c=relaxed/simple;
	bh=GbDnOeV1hVwo672CoCyWd3qVKQ+X93NyezNNPZoCkOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SvKp4PMne+DODCBRUL5JutAkLX1OR01Mnvzdjcl1pw8vhyCUz/9sK8Ov/Weqw6dRJK35jazg6DcYyTAGqzWwgzOMCzLQOWbJuwAloLV/9biNyd8c+F12s+ZBkVrdoE4htAEsxu4PsSOdYh0YfvqRJM03wPPFYrYlQH19e5oPTqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLTc+sNJ; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLTc+sNJ"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51882748165so5037363e0c.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 12:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736195082; x=1736799882; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBvFGKLQ+3Mx2W8DaDMuz7zf+1Q+8Q3d42tdhLaH9yA=;
        b=eLTc+sNJtk4YEOnmkdMWCLDRN5slspHK3JDV1ZhtrrFrRSKQscRQsRhI4BSttMJE6p
         wpA/CjV+/q1cQe0CIkmYchCiCGX/N2XRYMTFrmuJrx3OHggpqWJ1MKUg5di9gYdpUWCa
         Wy/vPpvmmAFuwoQnnLhk/PTHMdjaeERYCeMBj1TsI/Vu5/hiDPaQr8ljoz9fVvaQM8Bl
         FCx+Geu80A/IYS/dl/E0VToweymNsBhsI32goyE38Hn1zkUZa1nXAGDdIQlco6X882Zr
         qxMLu4DMBOh3VE3q8U8K1cVbDUY+5CM7DIQKKZTAN0BPRYTfCB2Wjdg1G56HYOONLTgM
         4/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736195082; x=1736799882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBvFGKLQ+3Mx2W8DaDMuz7zf+1Q+8Q3d42tdhLaH9yA=;
        b=jqB5tfM43UEJEc4gqfd13C9iMuDutIW46pEHv0SRfpKoUhG7460zbzoxiTt6FHlJxq
         gniAvPS5ZO3FuWuwduyf25d9wfAgJ/vRdoS1n0OMfzd0OoQ0W43SuKiG9EvmDOFhtdJm
         JfrDbOVSl2ycIuo+SiDi+weDSd9bRb9oE29dNL81V8xt9vN2+4jAxRogi0/Pl6fwKf5J
         ssJuqoq7bY6FqXDf5MZB8HU5w6A+rNkj9NeQ+yC8tWg0utdPdOVt15A0WgGUe0E9jNeZ
         MPIeXCbMWY8Fv7YrU0V+ew/U9yAknG06YGSL04XfEZf3dlFb1jWw3n/9Ae94cf0gJ2bL
         SJ1g==
X-Forwarded-Encrypted: i=1; AJvYcCW2sjtoslELvJmcVOq02SUVgDeFVL3D+51qp1Zw1myeXSk7NUziSne22wo6gtYNki5OeoXUQnNtvZ9ZS3kY@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe81CkJaxxmvtnjRP9rDmRAPbfXl2QgcDM4QuwwzbO2OlloMvC
	XRHaO4nhZpf7XwhPrXNvwBlfvui4HAmJbbd8b2JpT0cM760WUls7XEGj0rPyoKkYO2NLnibHUTg
	3ikX4SCyTasCF8pYeCA+kbZ8rnb/Yc/l8sl4=
X-Gm-Gg: ASbGncuj55DgHnyGnuO2kjfRHDds3sK3CqbKbd7Qoxx0lydXDmibZVlatIJ9iNAsegr
	1iCatHsf23diI8epUfQtiwLI8n8wC7+0LBny5pqk=
X-Google-Smtp-Source: AGHT+IH1yiuOpU5pEW6akY5iVdCxCjAh9URCh0h/9jVWcXuhF9lj+aGcCksb5NeTZkADviugLxX3HFy/u7RFt6gn50Y=
X-Received: by 2002:a05:6122:270b:b0:518:7ab7:afbb with SMTP id
 71dfb90a1353d-51b75d3134dmr46260808e0c.8.1736195082143; Mon, 06 Jan 2025
 12:24:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250104175346.656352-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <202501061001.6iClUTxN-lkp@intel.com>
In-Reply-To: <202501061001.6iClUTxN-lkp@intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 6 Jan 2025 20:24:16 +0000
X-Gm-Features: AbW1kvYQ64lqXt0W7fYkP0Qt5wLKSoL_IQ1o051C3begc80IQMGykBNFk93Rm4k
Message-ID: <CA+V-a8tFnLMzUiou8DDrA8qauyCZef7H3Za5NABPOwWkptQMtg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a07g044: Add clock and reset entry for DRP-AI
To: kernel test robot <lkp@intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for the report.

On Mon, Jan 6, 2025 at 3:11=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Prabhakar,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on geert-renesas-drivers/renesas-clk]
> [also build test WARNING on clk/clk-next linus/master v6.13-rc6 next-2024=
1220]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/clk-rene=
sas-r9a07g044-Add-clock-and-reset-entry-for-DRP-AI/20250105-015708
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git renesas-clk
> patch link:    https://lore.kernel.org/r/20250104175346.656352-1-prabhaka=
r.mahadev-lad.rj%40bp.renesas.com
> patch subject: [PATCH] clk: renesas: r9a07g044: Add clock and reset entry=
 for DRP-AI
> config: nios2-randconfig-r052-20250106 (https://download.01.org/0day-ci/a=
rchive/20250106/202501061001.6iClUTxN-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250106/202501061001.6iClUTxN-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501061001.6iClUTxN-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/clk/renesas/r9a07g044-cpg.c:97:35: warning: 'dtable_4_32' defi=
ned but not used [-Wunused-const-variable=3D]
>       97 | static const struct clk_div_table dtable_4_32[] =3D {
>          |                                   ^~~~~~~~~~~
>
>
> vim +/dtable_4_32 +97 drivers/clk/renesas/r9a07g044-cpg.c
>
>     96
>   > 97  static const struct clk_div_table dtable_4_32[] =3D {
>     98          {3, 4},
>     99          {4, 5},
>    100          {5, 6},
>    101          {6, 7},
>    102          {7, 8},
>    103          {8, 9},
>    104          {9, 10},
>    105          {10, 11},
>    106          {11, 12},
>    107          {12, 13},
>    108          {13, 14},
>    109          {14, 15},
>    110          {15, 16},
>    111          {16, 17},
>    112          {17, 18},
>    113          {18, 19},
>    114          {19, 20},
>    115          {20, 21},
>    116          {21, 22},
>    117          {22, 23},
>    118          {23, 24},
>    119          {24, 25},
>    120          {25, 26},
>    121          {26, 27},
>    122          {27, 28},
>    123          {28, 29},
>    124          {29, 30},
>    125          {30, 31},
>    126          {31, 32},
>    127          {0, 0},
>    128  };
>    129
>
I'll guard the above with #ifdef CONFIG_CLK_R9A07G054.

Cheers,
Prabhakar

Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B79D59B71
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 10:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735898621; cv=none; b=hE0Cy3cB+5yoiksMjvYf0etp95JT8Kwq27gO4jjnAXzba43xE1QyQc2YtFCdzGgPLaGB6GBaezd7LiPAgsrypOmK+gB57fQclQyiPaqms2I+f8r67TLtJgYa42XZOHoMhLz/LjdOzc62tsOJyfkcAN1r94K5n4m8ZbeDnKCE4r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735898621; c=relaxed/simple;
	bh=9p+fuJyh+8lDrTelnrBVizZrTlsqzwcanUzp/k+KzjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+hr2mFJsMgY9jLvgM2xsBj3syeqxUc3ckw5h5vs24SOYo/trPvdGTy7+XTVZiOOJI1XEX8nwz7RrWPRhZFtipFTOWQRsazgv/rMaR0S0b/mFLESXezhWP26pVPPaSHDNJT4LDQgA31T+KFMI7psuk7+QT7YnV4eVSqjMw9AzKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XM4khG+/; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XM4khG+/"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afdf8520c2so3696655137.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 03 Jan 2025 02:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735898618; x=1736503418; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/w4OZBRhdq1N8KRhLU+J7Hu5Wj+bKlBjyl4XzSkh3ys=;
        b=XM4khG+/q0KVT8DXIjB/mvCH9lLiY1SnAchK0q3Pcb3OMH3pNDgwT2ovzJ/ieV8cSG
         ZTEn9N4U2Sh4DrnL7BtVh+a2U0hSiit+g9qq1q+3PSnKPfRl/fcSpihmVT2FLX+PXh4o
         bgdRvRVbwODXrVmqH8JNgHg7cEwOq3nNqB0i2TM+4jEOOU7rP/6kpkttlcyboYStS0zE
         SH/gQYn1o1bI4D8VewAiPRv29XwGQh2vmpx6MoYHO3Voev7MDedYHGDex24pVUA6QcJq
         DjbZefQzKavR8Z/cvnFKzhCKOHBuQZtECK897BMBPSPRzfWQyMAkL9qQj8uzhBpttJsm
         PAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735898618; x=1736503418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/w4OZBRhdq1N8KRhLU+J7Hu5Wj+bKlBjyl4XzSkh3ys=;
        b=treuaqTtfX3W2+hoWCwvBOFhyd47SoYKDjHVTYVJ7tFRJ6UZdjRRrB6vXt/8CCTuDN
         bjUuXBQD32hp6o52iCQC2+l9EZnVnA5CREZo6XwgwDQsmWfcwdeM4a2CqOUNgk2YSpPP
         jpyhiwb8Qb0wtifcUzaj7SnHZj4J+1Q3oPwbt7eHPLB5BUrNgV0OfhkMcyhmLxB686ZQ
         hWEZTtTe2HB+0Cta1JxJlbPZ+wpHe9q+XhT6rF9C+pQTfXNA6IV4sLmyG9Gg83iHG01Q
         1VR7p8KeNQZxWA5Cwybs1btPX2GtBmM8NJMNLB6wGVjos81BDtJaVe9cQKWZUbr1Jh3C
         sc6w==
X-Forwarded-Encrypted: i=1; AJvYcCVYnSRo+pypEBI2k2Tm2Eg1TJtSCBF5cFbpgEoTIuMqQ8VXW3EttYqB0gxbuNgIFJtzXqgAgrw0jI5+j+2d@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7ACBAKS86pae6J+J4AiSVS0VL7m+wL3zd58CHbsm+YK6C/RMx
	5UUCWnyb5+99Z1RluXd0RhtPrsg1Ud7b03iL5TxQmcZHnf3XK1TNrV4EMR0LRkgsAS6/AXVoM/v
	a8pGwu0w6q5tB28AxioVSCxBTeE4NU3rBCFs=
X-Gm-Gg: ASbGncurOuu5ZKNsBq6hiCIcCjS8BHJugtYZZ21SwXCGSxNgtCjJmEme/sY4rGYdaon
	lLZQ5R+i1QQhEeyKtxK85MAYr1Lm5+WYCbzIkl2U=
X-Google-Smtp-Source: AGHT+IH+uMdf97Vf46rUu8PPWG67SCW1TsMA6VcnAG0M1CAf12xBs18o3gTQf+xHGipuxiesIPSEOLp4gEMTtLrK9Zw=
X-Received: by 2002:a05:6102:50a1:b0:4af:d487:45f3 with SMTP id
 ada2fe7eead31-4b2cc49a842mr37692670137.23.1735898618410; Fri, 03 Jan 2025
 02:03:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250102181839.352599-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <202501030941.vDjx439p-lkp@intel.com>
In-Reply-To: <202501030941.vDjx439p-lkp@intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 3 Jan 2025 10:03:12 +0000
Message-ID: <CA+V-a8sHgCKbTHEJzvZuRQbuZCtpMkrtRSWxWzVcC3BeeZM-2A@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] clk: renesas: rzv2h: Simplify BUS_MSTOP macros and
 field extraction
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

On Fri, Jan 3, 2025 at 2:21=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Prabhakar,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on geert-renesas-drivers/renesas-clk]
> [also build test ERROR on next-20241220]
> [cannot apply to linus/master v6.13-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/clk-rene=
sas-rzv2h-Fix-use-after-free-in-MSTOP-refcount-handling/20250103-022238
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git renesas-clk
> patch link:    https://lore.kernel.org/r/20250102181839.352599-4-prabhaka=
r.mahadev-lad.rj%40bp.renesas.com
> patch subject: [PATCH v3 3/6] clk: renesas: rzv2h: Simplify BUS_MSTOP mac=
ros and field extraction
> config: sparc-randconfig-002-20250103 (https://download.01.org/0day-ci/ar=
chive/20250103/202501030941.vDjx439p-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250103/202501030941.vDjx439p-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501030941.vDjx439p-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from drivers/clk/renesas/r9a09g057-cpg.c:15:
> >> drivers/clk/renesas/rzv2h-cpg.h:51:34: error: implicit declaration of =
function 'FIELD_PREP_CONST' [-Wimplicit-function-declaration]
>
Thank you for the report, I'll include the required header `#include
<linux/bitfield.h>` to fix this issue and send a new version.

Cheers,
Prabhakar

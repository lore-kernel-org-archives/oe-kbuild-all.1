Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C9C4F5E0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 09:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034446; cv=none; b=lt+I3SGc09HEZp4ir+rdNmPTHzsdQNIPn96w9Q9jg/O7o/TBennT6u2D/I/2sRMVZoToCqWH8Uq4McyD88T2dddfB0VefoQOQqVQq/F3AhEGaIFyb5X3CFZ41JTZwReEKBuMH9M6cTGFP7apubLnunC5vs7L1XSvMZXgf3V5MGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034446; c=relaxed/simple;
	bh=jLrwZ0H6EDox7tYTT9Hlh5qjk9jfzHEkcMIbXTPR3Jg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RG+FLImPN/kYyTlteY0bSqv5KUyY+7fTHMR9ambVbGnnWoL5TZsZlFvIePrBPHNAYgWFdKC0ptQT+w1FM/DPby/V7lHjUttZN6XGLchHM5uSJ3YposPgLzEKotSqOELHdWeExumBxcYOrEa9xj3gII2xAEZQWrlq6wcuMWlH6EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uEXqEKdP; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uEXqEKdP"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d02a71526so1608309f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 01 Apr 2026 02:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1775034439; x=1775639239; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KSmljXxbIIh3E8YTid/rWv4O03g03kKsqGTmNdPYVfw=;
        b=uEXqEKdPahDzkocPQbAS2hkHm+n8hapv0eTkN0CF8PQav6zO4AjyBtR7vMTEHcrSBC
         X599x/x9WWMScE85tIOOVkvAJEDimmHcwss0G2DSAZ1Z8ijiPRFLcDUDrk45lPYwKlS2
         alHhuwuBu9WIlF3/4sKhXQGdjz4Es3vnVnclif1D2vRAT+aApnq69+DMLs+qMbXFlWX4
         qHEVt4SmG7IV2mEhch5XT+UKdR/xHpnq51Omvmm1Q5srhwcNV5/9gVL6pYwPcMxUmKTd
         oJPawrnp1vOBI1vJpu6rg8ehbfrkDU2cwjkTT+srmNGZcRZd4FysEQ56LS9JYIVrpAf7
         buew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034439; x=1775639239;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSmljXxbIIh3E8YTid/rWv4O03g03kKsqGTmNdPYVfw=;
        b=nHZKubPKRDexprdDmX35K2+K6UXNEKlHR6BFfBWRZrFMZFsI2ue1sWo0WbAyfhG+Kl
         jkGklRa7DQOxjF/hR1wv4Yr9ZiLXmeEx2iWklSKS6bPhWDH3uwcId8QW9sZIGiagyyIR
         gHZY9jcySBCioZGEUlCjtDfa/bpsv6cM3wMr4vAioVzsFoIju2VkhUwrzI8cLMubkJzb
         3bZf6pePTHWgPr4iotvKZI6vJcFf3BZ+WriVpL8dvhBLOhX4R48e733hQde2duquWCrZ
         qiSrnY1dzFpnUOOyDilXybdeDVp2NIR6JhCVXYprSUOHr0er2MH2ufh775JvDO+ZiNn+
         elUw==
X-Gm-Message-State: AOJu0YxGwauUIz+cJBljEw+rQQaKAE2t3AHEvKBDKKT5TFN2k1LU3ruF
	ROh9q8to3LI1pqtgDk1slVI5Khzh7PbbKnAYEsmAo3hjlR8ZL42u2HNPXvOCmtS4/9Y=
X-Gm-Gg: ATEYQzx2yd/f+xQqBaOokm42KmK9I+Qch1OkE9jDePWSk5riqmuh9RkU90D366/vCF5
	h9DNL99KDCgaD7KFYjL7ZKEelTgODTxJwWhcLCt/pBCW8ugJFJGO5BxDAYF62s0c2utXY8ugnI3
	npd1a2QAmtFFiqVNs+WuIyUVCvqKXwopxmJH7aMg4DBFwXtm1IeK4Ur66dPXAUONYyj4NMjQKdx
	CZdzKSs+467/5BCqiGaW/inFTwrBKDmCk72+fbrd4b6PxucRo45IqMGKNnrvFEDdP1a6eyJdOof
	VOsO8eNVscDe/V70a7TA1Be6RjXzBGKL951rDDn/5gYOVn1oX3WDGACgu/vxgfA52PzZRm6VS+v
	paw0wsfkWoWJWL8UmpFDl6r3cGicx6xrbSMi8NCB7MZfhYOojf2tFNLir8kdkiXGMgGAoYfcKn6
	32CSRRDViolIhQDlQuwhSgRUMuXHA=
X-Received: by 2002:a5d:664d:0:b0:43d:1c39:5937 with SMTP id ffacd0b85a97d-43d1c3959d4mr419402f8f.48.1775034437806;
        Wed, 01 Apr 2026 02:07:17 -0700 (PDT)
Received: from localhost ([195.52.184.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf24739easm35014159f8f.30.2026.04.01.02.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=527c42294a9cb8106f9a64c8f84904f29a70e311775a8b2aa51239650a65;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 01 Apr 2026 11:07:08 +0200
Message-Id: <DHHP6V9C14ER.26CDJCZDF3CRG@baylibre.com>
Cc: <oe-kbuild-all@lists.linux.dev>, "Mathieu Poirier"
 <mathieu.poirier@linaro.org>
Subject: Re: [linux-next:master 9886/10705]
 arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: r5fss@78000000
 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "kernel test robot" <lkp@intel.com>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <202604011046.wVV6RFKA-lkp@intel.com>
In-Reply-To: <202604011046.wVV6RFKA-lkp@intel.com>

--527c42294a9cb8106f9a64c8f84904f29a70e311775a8b2aa51239650a65
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Apr 1, 2026 at 10:46 AM CEST, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   36ece9697e89016181e5ae87510e40fb31d86f2b
> commit: 479ba9d293f5fa32cfd2a14a502690eca769e5ee [9886/10705] dt-bindings=
: remoteproc: k3-r5f: Add memory-region-names
> config: arm64-randconfig-2054-20260331 (https://download.01.org/0day-ci/a=
rchive/20260401/202604011046.wVV6RFKA-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f=
43d6834093b19baf79beda8c0337ab020ac5f17)
> dtschema: 2025.13.dev9+g4cd3cdfac
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260401/202604011046.wVV6RFKA-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604011046.wVV6RFKA-lkp=
@intel.com/

These warnings are expected. It was discussed in v2 of the series:

  Personally, I don't think that transient warnings that won't appear in
  linux-next (just in the individual trees) are worth splitting for, when
  the split is artificial and goes counter to explaining the motivation.

https://lore.kernel.org/r/20260315-rebel-catapult-fab5d4e77349@spud

However this is in linux-next now as only the bindings were picked up
until now.

Best
Markus

>
> dtcheck warnings: (new ones prefixed by >>)
>>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: r5fss@78000000 (=
ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: r5fss@78000000 (ti,am62-r5fss):=
 r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: r5fss@780000=
00 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: r5fss@78000000 =
(ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dtb: r5fss@78000000 =
(ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: r5fss@780000=
00 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: r5fss@7800000=
0 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: r5fss@78000000 =
(ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: r5fss@78000000 (ti=
,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dtb: r5fss@78000000 (ti=
,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: r5fss@78000000 =
(ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: r5fss@78000000 (=
ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: r5fss@78000000 (ti,am62-r5fss=
): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dtb: r5fss@78000000 (ti,am=
62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am6254atl-sk.dtb: r5fss@78000000 (ti,am62-r5f=
ss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: r5fss@79000000 (ti,am62-r5fss)=
: r5f@79000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: r5fss@78000000 (ti,am62-r5fss=
): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: r5fss@79000000 =
(ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb: r5fss@78000000=
 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62d2-evm.dtb: r5fss@79000000 (ti,am62-r5fss=
): r5f@79000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62d2-evm.dtb: r5fss@78000000 (ti,am62-r5fs=
s): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: r5fss@79000000 (ti,am62-r5fss)=
: r5f@79000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: r5fss@78000000 (ti,am62-r5fss=
): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dtb: r5fss@79000000 (=
ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dtb: r5fss@78000000 =
(ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dahlia.dtb: r5fss@79000=
000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required prop=
erty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dahlia.dtb: r5fss@7800=
0000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required pro=
perty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dev.dtb: r5fss@79000000=
 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dev.dtb: r5fss@7800000=
0 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-ivy.dtb: r5fss@79000000=
 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-ivy.dtb: r5fss@7800000=
0 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-mallow.dtb: r5fss@79000=
000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required prop=
erty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-mallow.dtb: r5fss@7800=
0000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required pro=
perty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-yavia.dtb: r5fss@790000=
00 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-yavia.dtb: r5fss@78000=
000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required prop=
erty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dahlia.dtb: r5fss@79000000=
 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dahlia.dtb: r5fss@7800000=
0 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dev.dtb: r5fss@79000000 (t=
i,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dev.dtb: r5fss@78000000 (=
ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dtb: r5fss@79000000 (t=
i,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dtb: r5fss@78000000 (=
ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-mallow.dtb: r5fss@79000000=
 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-mallow.dtb: r5fss@7800000=
0 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-yavia.dtb: r5fss@79000000 =
(ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-yavia.dtb: r5fss@78000000=
 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-evm.dtb: r5fss@78000000 (ti,am64-r5fss)=
: r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-evm.dtb: r5fss@78000000 (ti,am64-r5fss=
): r5f@78200000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-evm.dtb: r5fss@78400000 (ti,am64-r5fss=
): r5f@78400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-evm.dtb: r5fss@78400000 (ti,am64-r5fss=
): r5f@78600000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t.dtb: r5fss@78000000 (ti,=
am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-hummingboard-t.dtb: r5fss@78000000 (ti=
,am64-r5fss): r5f@78200000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-hummingboard-t.dtb: r5fss@78400000 (ti=
,am64-r5fss): r5f@78400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-hummingboard-t.dtb: r5fss@78400000 (ti=
,am64-r5fss): r5f@78600000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtb: r5fss@78000000=
 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtb: r5fss@7800000=
0 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtb: r5fss@7840000=
0 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtb: r5fss@7840000=
0 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtb: r5fss@78000000=
 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtb: r5fss@7800000=
0 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtb: r5fss@7840000=
0 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtb: r5fss@7840000=
0 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: r5fss@7800000=
0 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: r5fss@780000=
00 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: r5fss@784000=
00 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: r5fss@784000=
00 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-sk.dtb: r5fss@78000000 (ti,am64-r5fss):=
 r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-sk.dtb: r5fss@78000000 (ti,am64-r5fss)=
: r5f@78200000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-sk.dtb: r5fss@78400000 (ti,am64-r5fss)=
: r5f@78400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-sk.dtb: r5fss@78400000 (ti,am64-r5fss)=
: r5f@78600000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: r5fss@78000000 =
(ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: r5fss@78000000=
 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: r5fss@78400000=
 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: r5fss@78400000=
 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: r5fss@41000000 (ti,=
am654-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: r5fss@41000000 (ti=
,am654-r5fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: r5fss@41000000 =
(ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: r5fss@41000000=
 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: r5fss@41000000 (=
ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: r5fss@41000000 =
(ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: r5fss@4100000=
0 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: r5fss@410000=
00 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required prop=
erty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: r5fss@410000=
00 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required prop=
erty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: r5fss@41000=
000 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required pro=
perty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dtb: r5fss@4100000=
0 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dtb: r5fss@410000=
00 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a required prop=
erty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: r5fss@41000000 (ti,am65=
4-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: r5fss@41000000 (ti,am6=
54-r5fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: r5fss@41000000 (=
ti,j7200-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: r5fss@41000000 =
(ti,j7200-r5fss): r5f@41400000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: r5fss@5c00000 (t=
i,j7200-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: r5fss@5c00000 (t=
i,j7200-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: r5fss@41000000 (ti,=
j721e-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: r5fss@41000000 (ti=
,j721e-r5fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: r5fss@5c00000 (ti,j=
721e-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: r5fss@5c00000 (ti,j=
721e-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: r5fss@5e00000 (ti,j=
721e-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dtb: r5fss@5e00000 (ti,j=
721e-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: r5fss@41000000 (=
ti,j721e-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: r5fss@41000000 =
(ti,j721e-r5fss): r5f@41400000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: r5fss@5c00000 (t=
i,j721e-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: r5fss@5c00000 (t=
i,j721e-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: r5fss@5e00000 (t=
i,j721e-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: r5fss@5e00000 (t=
i,j721e-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: r5fss@41000000 (ti,j721e-r5fss)=
: r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: r5fss@41000000 (ti,j721e-r5fss=
): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: r5fss@5c00000 (ti,j721e-r5fss):=
 r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: r5fss@5c00000 (ti,j721e-r5fss):=
 r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: r5fss@5e00000 (ti,j721e-r5fss):=
 r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-sk.dtb: r5fss@5e00000 (ti,j721e-r5fss):=
 r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: r5fss@41000000 (ti,j7=
21s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: r5fss@41000000 (ti,j=
721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: r5fss@5c00000 (ti,j72=
1s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: r5fss@5c00000 (ti,j72=
1s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: r5fss@5e00000 (ti,j72=
1s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: r5fss@5e00000 (ti,j72=
1s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: r5fss@41000000 (ti,j7=
21s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: r5fss@41000000 (ti,j=
721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: r5fss@5c00000 (ti,j72=
1s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: r5fss@5c00000 (ti,j72=
1s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: r5fss@5e00000 (ti,j72=
1s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: r5fss@5e00000 (ti,j72=
1s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: r5fss@41000000 =
(ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: r5fss@41000000=
 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: r5fss@5c00000 (=
ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: r5fss@5c00000 (=
ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: r5fss@5e00000 (=
ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: r5fss@5e00000 (=
ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dtb: r5fss@79000000 (ti,am62=
-r5fss): r5f@79000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dtb: r5fss@78000000 (ti,am6=
2-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dtb: r5fss@78400000 (ti,am6=
2-r5fss): r5f@78400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: r5fss@79000000 (ti,am62-r5fss)=
: r5f@79000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: r5fss@78000000 (ti,am62-r5fss=
): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: r5fss@78400000 (ti,am62-r5fss=
): r5f@78400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@41000000 (ti,j7=
21s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@41000000 (ti,j=
721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@5c00000 (ti,j72=
1s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@5c00000 (ti,j72=
1s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@5e00000 (ti,j72=
1s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@5e00000 (ti,j72=
1s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@5900000 (ti,j7=
21s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dtb: r5fss@5900000 (ti,j72=
1s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@41000000 (ti,j721s=
2-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@41000000 (ti,j721=
s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@5c00000 (ti,j721s2=
-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@5c00000 (ti,j721s2=
-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@5e00000 (ti,j721s2=
-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@5e00000 (ti,j721s2=
-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@5900000 (ti,j721s=
2-r5fss): r5f@5900000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dtb: r5fss@5900000 (ti,j721s2=
-r5fss): r5f@5a00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@41000000 (ti,j721s2-r5fss)=
: r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@41000000 (ti,j721s2-r5fss=
): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@5c00000 (ti,j721s2-r5fss):=
 r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@5c00000 (ti,j721s2-r5fss):=
 r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@5e00000 (ti,j721s2-r5fss):=
 r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@5e00000 (ti,j721s2-r5fss):=
 r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@5900000 (ti,j721s2-r5fss)=
: r5f@5900000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: r5fss@5900000 (ti,j721s2-r5fss):=
 r5f@5a00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@41000000 (ti,j721s2-r5f=
ss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@41000000 (ti,j721s2-r5=
fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@5c00000 (ti,j721s2-r5fs=
s): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@5c00000 (ti,j721s2-r5fs=
s): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@5e00000 (ti,j721s2-r5fs=
s): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@5e00000 (ti,j721s2-r5fs=
s): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@5900000 (ti,j721s2-r5f=
ss): r5f@5900000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: r5fss@5900000 (ti,j721s2-r5fs=
s): r5f@5a00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@41000000 (ti,j721s2-r5f=
ss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@41000000 (ti,j721s2-r5=
fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@5c00000 (ti,j721s2-r5fs=
s): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@5c00000 (ti,j721s2-r5fs=
s): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@5e00000 (ti,j721s2-r5fs=
s): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@5e00000 (ti,j721s2-r5fs=
s): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@5900000 (ti,j721s2-r5f=
ss): r5f@5900000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j742s2-evm.dtb: r5fss@5900000 (ti,j721s2-r5fs=
s): r5f@5a00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-disable-eth-phy.dtb: r5fs=
s@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a requir=
ed property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-disable-rtc.dtb: r5fss@78=
000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required p=
roperty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-disable-spi-nor.dtb: r5fs=
s@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a requir=
ed property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-gpio-fan.dtb: r5fss@78000=
000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required prop=
erty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-qspi-nor.dtb: r5fss@78000=
000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required prop=
erty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: r5fss@78000000 (ti,=
am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: r5fss@78000000 (ti,=
am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: r5fss@78000000=
 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: r5fss@78000000 (ti,a=
m62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: r5fss@78000000 (ti=
,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtb: r5fss@78000000 (ti,am62-=
r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-disable-eth-phy.dtb: r5f=
ss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a requi=
red property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-disable-eth-phy.dtb: r5=
fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a requ=
ired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-disable-rtc.dtb: r5fss@7=
9000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required =
property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-disable-rtc.dtb: r5fss@=
78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required=
 property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-disable-spi-nor.dtb: r5f=
ss@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a requi=
red property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-disable-spi-nor.dtb: r5=
fss@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a requ=
ired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-gpio-fan.dtb: r5fss@7900=
0000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required pro=
perty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-gpio-fan.dtb: r5fss@780=
00000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required pr=
operty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-qspi-nor.dtb: r5fss@7900=
0000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required pro=
perty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-qspi-nor.dtb: r5fss@780=
00000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required pr=
operty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: r5fss@79000000 (ti=
,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-imx219.dtb: r5fss@78000000 (t=
i,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: r5fss@79000000 (ti=
,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62a7-sk-csi2-ov5640.dtb: r5fss@78000000 (t=
i,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62a7-sk-hdmi-audio.dtb: r5fss@79000000 (ti,=
am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62a7-sk-hdmi-audio.dtb: r5fss@78000000 (ti=
,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: r5fss@79000000 (ti=
,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: r5fss@78000000 (t=
i,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: r5fss@79000000 (ti=
,am62-r5fss): r5f@79000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: r5fss@78000000 (t=
i,am62-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: r5fss@7900000=
0 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: r5fss@780000=
00 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac.dtb: r5fss@78000000=
 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac.dtb: r5fss@7800000=
0 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac.dtb: r5fss@7840000=
0 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac.dtb: r5fss@7840000=
0 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac-mii.dtb: r5fss@7800=
0000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required pro=
perty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac-mii.dtb: r5fss@780=
00000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required pr=
operty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac-mii.dtb: r5fss@784=
00000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required pr=
operty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac-mii.dtb: r5fss@784=
00000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required pr=
operty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtb: r5fss@78000000 (ti,am=
64-r5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtb: r5fss@78000000 (ti,a=
m64-r5fss): r5f@78200000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtb: r5fss@78400000 (ti,a=
m64-r5fss): r5f@78400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtb: r5fss@78400000 (ti,a=
m64-r5fss): r5f@78600000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-eth-phy.dtb: r=
5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a req=
uired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-eth-phy.dtb: =
r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a re=
quired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-eth-phy.dtb: =
r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a re=
quired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-eth-phy.dtb: =
r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a re=
quired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-rtc.dtb: r5fss=
@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a require=
d property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-rtc.dtb: r5fs=
s@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a requir=
ed property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-rtc.dtb: r5fs=
s@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a requir=
ed property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-rtc.dtb: r5fs=
s@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a requir=
ed property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-spi-nor.dtb: r=
5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a req=
uired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-spi-nor.dtb: =
r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a re=
quired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-spi-nor.dtb: =
r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a re=
quired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-spi-nor.dtb: =
r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a re=
quired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-gpio-fan.dtb: r5fss@78=
000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required p=
roperty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-gpio-fan.dtb: r5fss@7=
8000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required =
property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-gpio-fan.dtb: r5fss@7=
8400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required =
property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-gpio-fan.dtb: r5fss@7=
8400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required =
property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-pcie-usb2.dtb: r5fss@7=
8000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required =
property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-pcie-usb2.dtb: r5fss@=
78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required=
 property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-pcie-usb2.dtb: r5fss@=
78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required=
 property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-pcie-usb2.dtb: r5fss@=
78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required=
 property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtb: r5fss@7=
8000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required =
property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtb: r5fss@=
78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required=
 property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtb: r5fss@=
78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required=
 property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtb: r5fss@=
78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required=
 property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.d=
tb: r5fss@78000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is =
a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.=
dtb: r5fss@78000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is=
 a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.=
dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is=
 a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.=
dtb: r5fss@78400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is=
 a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb: r5fss@78=
000000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required p=
roperty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb: r5fss@7=
8000000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required =
property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb: r5fss@7=
8400000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required =
property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb: r5fss@7=
8400000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required =
property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-wlan.dtb: r5fss@7800=
0000 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a required pro=
perty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-wlan.dtb: r5fss@780=
00000 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a required pr=
operty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-wlan.dtb: r5fss@784=
00000 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a required pr=
operty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-wlan.dtb: r5fss@784=
00000 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a required pr=
operty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-csi2-dual-imx219.dtb: r5fs=
s@41000000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a requ=
ired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am68-sk-base-board-csi2-dual-imx219.dtb: r5f=
ss@41000000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a req=
uired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-csi2-dual-imx219.dtb: r5fs=
s@5c00000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a requir=
ed property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-csi2-dual-imx219.dtb: r5fs=
s@5c00000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a requir=
ed property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-csi2-dual-imx219.dtb: r5fs=
s@5e00000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a requir=
ed property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-csi2-dual-imx219.dtb: r5fs=
s@5e00000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a requir=
ed property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtb: r5fss@410000=
00 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required pro=
perty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtb: r5fss@41000=
000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required pr=
operty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtb: r5fss@5c0000=
0 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtb: r5fss@5c0000=
0 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtb: r5fss@5e0000=
0 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtb: r5fss@5e0000=
0 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@41000000 =
(ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@41000000=
 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@5c00000 (=
ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@5c00000 (=
ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@5e00000 (=
ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@5e00000 (=
ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@5900000 =
(ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-sk-csi2-dual-imx219.dtb: r5fss@5900000 (=
ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@41000000 (ti,j721=
s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@41000000 (ti,j72=
1s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@5c00000 (ti,j721s=
2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@5c00000 (ti,j721s=
2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@5e00000 (ti,j721s=
2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@5e00000 (ti,j721s=
2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@5900000 (ti,j721=
s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtb: r5fss@5900000 (ti,j721s=
2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtb: r5fss@41000000 (ti,j7=
200-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtb: r5fss@41000000 (ti,j=
7200-r5fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtb: r5fss@5c00000 (ti,j72=
00-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtb: r5fss@5c00000 (ti,j72=
00-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: r5f=
ss@41000000 (ti,j721e-r5fss): r5f@41000000: 'memory-region-names' is a requ=
ired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: r5=
fss@41000000 (ti,j721e-r5fss): r5f@41400000: 'memory-region-names' is a req=
uired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: r5f=
ss@5c00000 (ti,j721e-r5fss): r5f@5c00000: 'memory-region-names' is a requir=
ed property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: r5f=
ss@5c00000 (ti,j721e-r5fss): r5f@5d00000: 'memory-region-names' is a requir=
ed property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: r5f=
ss@5e00000 (ti,j721e-r5fss): r5f@5e00000: 'memory-region-names' is a requir=
ed property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtb: r5f=
ss@5e00000 (ti,j721e-r5fss): r5f@5f00000: 'memory-region-names' is a requir=
ed property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtb: r5fss@41000000 (ti,j7=
21e-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtb: r5fss@41000000 (ti,j=
721e-r5fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtb: r5fss@5c00000 (ti,j72=
1e-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtb: r5fss@5c00000 (ti,j72=
1e-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtb: r5fss@5e00000 (ti,j72=
1e-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtb: r5fss@5e00000 (ti,j72=
1e-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtb: r5fss@41000000 (ti,j7=
21e-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtb: r5fss@41000000 (ti,j=
721e-r5fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtb: r5fss@5c00000 (ti,j72=
1e-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtb: r5fss@5c00000 (ti,j72=
1e-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtb: r5fss@5e00000 (ti,j72=
1e-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtb: r5fss@5e00000 (ti,j72=
1e-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: r5fss@41000000=
 (ti,j721e-r5fss): r5f@41000000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: r5fss@4100000=
0 (ti,j721e-r5fss): r5f@41400000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: r5fss@5c00000 =
(ti,j721e-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: r5fss@5c00000 =
(ti,j721e-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: r5fss@5e00000 =
(ti,j721e-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtb: r5fss@5e00000 =
(ti,j721e-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtb: r5fss@41000000 (ti,j=
721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtb: r5fss@41000000 (ti,=
j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtb: r5fss@5c00000 (ti,j7=
21s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtb: r5fss@5c00000 (ti,j7=
21s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtb: r5fss@5e00000 (ti,j7=
21s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtb: r5fss@5e00000 (ti,j7=
21s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtb: r5fss@41000000 (t=
i,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtb: r5fss@41000000 (=
ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtb: r5fss@5c00000 (ti=
,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtb: r5fss@5c00000 (ti=
,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtb: r5fss@5e00000 (ti=
,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtb: r5fss@5e00000 (ti=
,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: r5fss=
@79000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a require=
d property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: r5fs=
s@78000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a requir=
ed property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb: r5fs=
s@78400000 (ti,am62-r5fss): r5f@78400000: 'memory-region-names' is a requir=
ed property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: r5fss@79=
000000 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a required p=
roperty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: r5fss@7=
8000000 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a required =
property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtb: r5fss@7=
8400000 (ti,am62-r5fss): r5f@78400000: 'memory-region-names' is a required =
property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@41000000 (t=
i,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@41000000 (=
ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@5c00000 (ti=
,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@5c00000 (ti=
,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@5e00000 (ti=
,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@5e00000 (ti=
,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@5900000 (t=
i,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j742s2-evm-usb0-type-a.dtb: r5fss@5900000 (ti=
,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@41000000=
 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required prope=
rty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@4100000=
0 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required prop=
erty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@5c00000 =
(ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@5c00000 =
(ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@5e00000 =
(ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@5e00000 =
(ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@5900000=
 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required proper=
ty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtb: r5fss@5900000 =
(ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@4100=
0000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required p=
roperty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@410=
00000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required =
property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@5c00=
000 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required pro=
perty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@5c00=
000 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required pro=
perty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@5e00=
000 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required pro=
perty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@5e00=
000 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required pro=
perty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@590=
0000 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required pr=
operty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-quad-port-eth-exp1.dtb: r5fss@5900=
000 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required pro=
perty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@41000000 (t=
i,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@41000000 (=
ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required propert=
y
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@5c00000 (ti=
,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@5c00000 (ti=
,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@5e00000 (ti=
,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@5e00000 (ti=
,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@5900000 (t=
i,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usb0-type-a.dtb: r5fss@5900000 (ti=
,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@41000=
000 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a required pr=
operty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@4100=
0000 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a required p=
roperty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@5c000=
00 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a required prop=
erty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@5c000=
00 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a required prop=
erty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@5e000=
00 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a required prop=
erty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@5e000=
00 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a required prop=
erty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@5900=
000 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a required pro=
perty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb: r5fss@59000=
00 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a required prop=
erty
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: r5fss@78000000 (ti,am64-r=
5fss): r5f@78000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: r5fss@78000000 (ti,am64-=
r5fss): r5f@78200000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: r5fss@78400000 (ti,am64-=
r5fss): r5f@78400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: r5fss@78400000 (ti,am64-=
r5fss): r5f@78600000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2-bkey-ekey-pcie.dtb=
: r5fss@41000000 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a=
 required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2-bkey-ekey-pcie.dt=
b: r5fss@41000000 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is =
a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2-bkey-usb3.dtb: r5f=
ss@41000000 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a requ=
ired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2-bkey-usb3.dtb: r5=
fss@41000000 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a req=
uired property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am654-gp-evm.dtb: r5fss@41000000 (ti,am654-r5=
fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am654-gp-evm.dtb: r5fss@41000000 (ti,am654-r=
5fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am654-evm.dtb: r5fss@41000000 (ti,am654-r5fss=
): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am654-evm.dtb: r5fss@41000000 (ti,am654-r5fs=
s): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j7200-evm.dtb: r5fss@41000000 (ti,j7200-r5fss=
): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j7200-evm.dtb: r5fss@41000000 (ti,j7200-r5fs=
s): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j7200-evm.dtb: r5fss@5c00000 (ti,j7200-r5fss)=
: r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j7200-evm.dtb: r5fss@5c00000 (ti,j7200-r5fss)=
: r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: r5fss@41000000 (ti,j721e-r5fss=
): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: r5fss@41000000 (ti,j721e-r5fs=
s): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: r5fss@5c00000 (ti,j721e-r5fss)=
: r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: r5fss@5c00000 (ti,j721e-r5fss)=
: r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: r5fss@5e00000 (ti,j721e-r5fss)=
: r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm.dtb: r5fss@5e00000 (ti,j721e-r5fss)=
: r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-gesi.dtb: r5fss@41000000 (ti,j721e-=
r5fss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j721e-evm-gesi.dtb: r5fss@41000000 (ti,j721e=
-r5fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-gesi.dtb: r5fss@5c00000 (ti,j721e-r=
5fss): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-gesi.dtb: r5fss@5c00000 (ti,j721e-r=
5fss): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-gesi.dtb: r5fss@5e00000 (ti,j721e-r=
5fss): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-gesi.dtb: r5fss@5e00000 (ti,j721e-r=
5fss): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb: r5fss@41000000 (ti,j721s2-r5f=
ss): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb: r5fss@41000000 (ti,j721s2-r5=
fss): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb: r5fss@5c00000 (ti,j721s2-r5fs=
s): r5f@5c00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb: r5fss@5c00000 (ti,j721s2-r5fs=
s): r5f@5d00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb: r5fss@5e00000 (ti,j721s2-r5fs=
s): r5f@5e00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>>> arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb: r5fss@5e00000 (ti,j721s2-r5fs=
s): r5f@5f00000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
> --
>>> arch/arm64/boot/dts/ti/k3-am654-idk.dtb: r5fss@41000000 (ti,am654-r5fss=
): r5f@41000000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml
>    arch/arm64/boot/dts/ti/k3-am654-idk.dtb: r5fss@41000000 (ti,am654-r5fs=
s): r5f@41400000: 'memory-region-names' is a required property
>    	from schema $id: http://devicetree.org/schemas/remoteproc/ti,k3-r5f-r=
proc.yaml


--527c42294a9cb8106f9a64c8f84904f29a70e311775a8b2aa51239650a65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaczgPRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNk
oAD/SDhi8TFpBUCEIlFskJgCPSSDQwArUM3Ie19vzMNb9hsA/2VhQT0FphFAsRif
YnpUXXtPbm1B7zhCLI3OKE9/TrwK
=9p/s
-----END PGP SIGNATURE-----

--527c42294a9cb8106f9a64c8f84904f29a70e311775a8b2aa51239650a65--

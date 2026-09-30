Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC0A3AEF57
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761717; cv=none; b=cWQLTfuGIrl07YZw7XebeegfTPSKviwzmFRVsnuJnLhCw1AfYT5ycJLNseDfVuaxcuNr05aomhBYpp85zHibpz6zQNPVaXxSKZbFah8Bl3iMoomzahQGuF9bUFwdPaCj2QrN4Dj1u6zLLbh6xLEIdjFOhrwXZT7OM8rVHnvXfWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761717; c=relaxed/simple;
	bh=YOUz5b1CkIMr9QtAvurImq+H55K+bjDWxbC7Osn3V0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2URfPx/yPiiiG0d6f2QtJxKnQ0/IFuPj9O6szIyUj1MZ09EExA0I84GY/jrBtlHfDFAANf703b/v/C2axUZjsgmRCXN2+MfRhP4iCXIVSecbzY8cdlTi29Y8xSkuWJR2wEWGNTElufxNcovWCgPwy3296AH/RTMAGC0FwnoHKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lq+oJIoM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lq+oJIoM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34D81F000FF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 09:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790761716;
	bh=YOUz5b1CkIMr9QtAvurImq+H55K+bjDWxbC7Osn3V0o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Lq+oJIoMECyfxr9gmgr5lqLg9WuDhMzXcw7sxtmu3as99IYf+sA42deGfzuqcloHg
	 /ZKYl3AXjkrNMJK+j6hxXIbn+yZQuIsMGf4DxjH8aOQP25SqeRE5q2GiH5lk2FVciW
	 /R8kOHlwN4yL8GIYicJqVnQDjeeEHKDUc9LhJvVGaHOm7oUPAxTpIGobgAnTq4DiL6
	 QGR4XYmrJtbAOgd3oE4PBITGNscLI8Dz3IWrfPtg71UgebBalUyDjo1y8JW7hFPPY2
	 PuU5MJE349gNV+lNrndRqhrSeCTwGWDbHXOtX9hT2I2FRxfFWotDDNbgaEzDgHfDIn
	 o7ym4g9bbyGFg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba34653aefso1326002e87.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 02:48:35 -0700 (PDT)
X-Gm-Message-State: AFq9FYLjXdtJssHbOOQyO2bVTMkDnFxdGKirF1G9yiH6l5ZVZMXlFegT
	UvmAB5Ex0HGXyiXcDik6Z+IAXAnDvO4J0uk09A5Z9UeIPpNfqDJRW9ZMFuuGwTBxmMac4XJYBeW
	SlJsspEKVcHrzm2joVGuxgLL2n19oY7w=
X-Received: by 2002:a05:6512:3f1:b0:5b8:f457:fe6e with SMTP id
 2adb3069b0e04-5ba405ea5b1mr353935e87.17.1790761714741; Wed, 30 Sep 2026
 02:48:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609301056.m1VNxu3Z-lkp@intel.com>
In-Reply-To: <202609301056.m1VNxu3Z-lkp@intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 11:48:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLnqJ62g1=jqGPOJPZNmRukzArgNNMJdh4wsAeRe--U+XQ@mail.gmail.com>
X-Gm-Features: AclHuK97tghX-e4divH7nQf-gH3daRxRor9ccORWFAMrqd-kVEKCif_m4ehUI_Q
Message-ID: <CAD++jLnqJ62g1=jqGPOJPZNmRukzArgNNMJdh4wsAeRe--U+XQ@mail.gmail.com>
Subject: Re: [linux-next:master 8900/11456] arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb:
 prcmu@80157000 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is
 a required property
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>, 
	"Rob Herring (Arm)" <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 10:31=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:

> dtcheck warnings: (new ones prefixed by >>)

I'm not happy about how this bot keeps hammering despite I say this will be
merged in an orthogonal tree and just isn't applied to linux.next there yet=
.

Should I go and just merge my own pull request into the SoC tree just
to shut this up...

Linus Walleij

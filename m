Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE835209695
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729084702; cv=none; b=snl4spWGdlZ7pKKQ2l9B02z5sqzi0OabuGIY3irZ8i0ysJr09xoxw23SOiPCI5Bi2B7Xldvxz3g6+mBS2JOG2+yGUnovFIjzl2WFbNzQUv4zQ2kTz5nAbRg8CacKYp/14y+BLvVZn8Fo9CWGXhWjssBhm0iVbe8kwgNtWuB06Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729084702; c=relaxed/simple;
	bh=iCKFA9P31jMjsM9CsHd+hC3tJHQodEybnSNQhsoOyUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jG7b7Vx6CMh1Gor9wQku04625plTrl1BQ+VbqelkodAMjHHQ5qJFiXYa2s2xhzrJOzSQg1PNTM0EOpTmIHve3TXhz8A9h9Vtk09VnDZuRs2A27adYa0FLhBI6UDucYLbNLJp7ka4aHUuFzOhl5aLeBJzQPswIaP3CFSoE8pBzaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m1rQR1dA; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m1rQR1dA"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e3e590c31aso2704699b6e.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 06:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729084699; x=1729689499; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cncVh9iezCUKxtCYa1ysyk4sxYm9tSRp3WNBn0gGRZY=;
        b=m1rQR1dA0RcYu45OvInkI3l9/ANqaXC/RX1XY80sJB+vOX3hxnQTzShUoL5Boc8YSd
         jMcWIEu/FkmQKyuDdYn/H72oMI2YXdzgEJqvKbb8SE7apu+xmWn3fqBPJUfqnqyRCr4M
         hOuaEmA2PLWWqxcukfEB5EdkdVXKlcwMkRGL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729084699; x=1729689499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cncVh9iezCUKxtCYa1ysyk4sxYm9tSRp3WNBn0gGRZY=;
        b=W3Iwxzr63/bH8BcML2dPNwgD0UrhYgIQ8ExoEm7unRNgKWlFgyjwLwHgOpow/alYMg
         7xAExfP6qwMxG2bAU3ULb8KDvpAk4ID717cJQdXzEBXuW2Zai/Ajy2Xpn86Yh40f25wW
         a1kq7UTPPV7q0DG0wNLqtSFibDI7GJoI7ORAP5ODLxboJijuJ2j8ETTdZtuvRK7L/Zqh
         gTMVH/gxC6B4Opt6QGYfd7JaOPQkpBh5F+hbsU9ZD9dXDDEXo1QzWphPAe0Ohivbt/ys
         GWph5Yfc27HjWseJ5kLVXMCGR/OoQOteS2hb9XmVmZesGvJSsAmmwyNTZwWoARKw2cO8
         QqKw==
X-Gm-Message-State: AOJu0YyageKc0Pg6Jk8ycv1t/I0bKoKEp5b9i0n5u1jlRCTmUSiqS/OX
	PVgPpGjsujZ+7QNAaTblBA9+NJsC9jqEhkSCaNwk3YqenzxCSkaiJgeDO2XcY+x0rxbimQ7kToo
	=
X-Google-Smtp-Source: AGHT+IHfSzdbAUWafqOQMDshj81uVBUWMjZ3HuFIEYtnWgtG0tpjBBAAaOZ+CpqDbsN+ZDphw2P3pA==
X-Received: by 2002:a05:6871:88f:b0:264:9161:82e8 with SMTP id 586e51a60fabf-288874d82f5mr7363764fac.41.1729084699482;
        Wed, 16 Oct 2024 06:18:19 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-288dab8a172sm860434fac.6.2024.10.16.06.18.18
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 06:18:18 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-718065d6364so379764a34.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 06:18:18 -0700 (PDT)
X-Received: by 2002:a05:6830:65c4:b0:703:6434:aba8 with SMTP id
 46e09a7af769-717df1e1178mr12663380a34.0.1729084698412; Wed, 16 Oct 2024
 06:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410160906.ckDFQWGk-lkp@intel.com> <c094ee1f-9870-4958-beaf-16d23c44ccb4@collabora.com>
In-Reply-To: <c094ee1f-9870-4958-beaf-16d23c44ccb4@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 16 Oct 2024 21:17:42 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhda6genLCVRndbQLu1H-d7RTF=1qD8_uWZgk1+SR7zDg@mail.gmail.com>
Message-ID: <CAC=S1nhda6genLCVRndbQLu1H-d7RTF=1qD8_uWZgk1+SR7zDg@mail.gmail.com>
Subject: Re: [linux-next:master 3879/4439] arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb:
 pinctrl@10005000: 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Macpaul Lin <macpaul.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 6:08=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 16/10/24 03:36, kernel test robot ha scritto:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
> > commit: 355508880d41cfa5b0643515f27b6da490a1345e [3879/4439] arm64: dts=
: mediatek: mt8188: Add PCIe nodes
> > config: arm64-randconfig-051-20241015 (https://download.01.org/0day-ci/=
archive/20241016/202410160906.ckDFQWGk-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 14.1.0
> > dtschema version: 2024.10.dev6+g12c3cd5
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20241016/202410160906.ckDFQWGk-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410160906.ckDFQWGk-l=
kp@intel.com/
> >
> > dtcheck warnings: (new ones prefixed by >>)
> >     arch/arm64/boot/dts/mediatek/mt8188.dtsi:1442.35-1447.5: Warning (s=
imple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error=
, expected "10b86100"
> >     arch/arm64/boot/dts/mediatek/mt8188.dtsi:1449.35-1454.5: Warning (s=
imple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error=
, expected "10b87100"
>
> That was bad. I fixed it directly. Fei, no action required from you.

Oops, sorry, I went through the changes before sending but still
failed to catch that...
Anyways, many thanks for fixing them!

Regards,
Fei

>
> Thanks,
> Angelo

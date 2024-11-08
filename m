Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B151D2F55
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 08:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731053940; cv=none; b=ox8xFrJJKtiurysmagVgEttdJkIXvdkjosy8jQs7AZejidJN0jPBeCDlx+vNf74no9t45K+VValL/U4CAul6C2Mc43NINKIpvVKm38lxP44rNfAcu38MMEDBKYIJS7EwhPjwvP0rlbvlPCQgiKzyD/rNq1VmUUcGp3Cs6XibiaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731053940; c=relaxed/simple;
	bh=U0jdlpjGj9J+texZ51ynRWmquMVsx3tc4YKsZb3IV+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rPyKDkVE3KR7OxznGNx5Qji9ZAz+hXLSMQ7Prp/Wamo742U12wZeiB8Ov/VAXyloSQs9GaUBPHu6D0aijGbscoz3r4YRp3nxRS/dW3cVbg86UF24jynqX4FL4rJMldPstytTBD8S5redoapwMDi7+NY9oxFe2PK/48QyW3yK2ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGv8Z6ed; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGv8Z6ed"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f7606199so1800073e87.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 08 Nov 2024 00:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731053937; x=1731658737; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7weDCW+gN74xem4t7h6tdCuTguG0yxU10+YOsux9xyA=;
        b=EGv8Z6edy4RnPv3YT5mNRgvntHYpMhc0NjV4eJUy0czpsO50i1/obTi51tBmdOVr0L
         yoJiIHxaeWsmcrIgUUIY1gc/H8iO+lZIIkKzgmvmgqSCO4+NrncmAWLl1eJDbugUpRzQ
         wXnXoB7YppOypqpqzCZSPZ9X79D7U4Pju1FcznXFmktzHT6mglC5cy5g7nHlUl1FVhB0
         90kG2QsUJ5FNT7rEnIOYPyzuv3FPkCBY/drvs+ej1Lr1JOoSnQdz6ySNsjORSw8Yv5Ph
         hKS+7+he9Qmy9QVTF6EhcNrEZzaoecE7NI4ZV0bHl47+K5VALgHBoaKQjBeuSltS3aCV
         qTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731053937; x=1731658737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7weDCW+gN74xem4t7h6tdCuTguG0yxU10+YOsux9xyA=;
        b=giox0qgiu9p6hMPNSDM5bjpofHAA76nCXQTcDxRQn4fvxzOgbJWMvGjekmuNbPnMmv
         ep6006XCtBFmn6JZEmvD2nokuYc06KAXiU2VzeFnuzMS8McLYWT4F5Mw7m9mSWpQLxi9
         A+ZAJr1DOOmtxiglldbYy3nLy9/9i7VZGXL3d+qqOla+6te12bipOMMAaBk7BnauY8Tb
         wmKO53orwpX1E/1saWNMFHwKXaIOeWhf/LBpHrBcaGNjmokpjATAccM3LdFGvM/dcq/b
         +4xT5EhvVbqSmIZYaHrAaoMSO1En3HtZhGxUk0lnw0JwXwMtap8D9BzRW1kkCIWQbctT
         u3sg==
X-Forwarded-Encrypted: i=1; AJvYcCUBLsT/t9ii/lxYeHdAs1t4PCm78c1AlQwnIT83wdlJt/Kmg1sO98IlY6lw6VXnfKt0o6v8mv+kWQVtcM3k@lists.linux.dev
X-Gm-Message-State: AOJu0YzX6KJvHF146jViwAHi9S4iSxZZRTHuviqLih98n9JpuoUZaDcm
	A0a5U+Taxp9lBeKq6qxJzwWGkhvhOSkqHjPrdLIHahy+8E71nTpprMKQWNikgYk1EfZ8MfGQDKo
	rxBGgs/Ej8M6h9vR0oNae6q6NkDx1RbBkmRwgMdEeBSrOYn2KPuw=
X-Google-Smtp-Source: AGHT+IHCIxuHEoVE8+BFhK198XyG/6aUMFHKEpPKf+uJvRzG/l802RGWVl7otTIHAYFAGrY/bbYUdRjkiACDFEhl8zE=
X-Received: by 2002:a2e:a914:0:b0:2ff:191d:f077 with SMTP id
 38308e7fff4ca-2ff200809a3mr9758101fa.0.1731053936611; Fri, 08 Nov 2024
 00:18:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410301531.7Vr9UkCn-lkp@intel.com>
In-Reply-To: <202410301531.7Vr9UkCn-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:18:45 +0100
Message-ID: <CACRpkdbW5kheaWPzKip9ucEwK2uv+Cmf5SwT1necfa3Ynct6Ag@mail.gmail.com>
Subject: Re: drivers/net/ethernet/freescale/ucc_geth.c:2454:64: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
To: kernel test robot <lkp@intel.com>, 
	"linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, netdev <netdev@vger.kernel.org>
Cc: Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 8:05=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   c1e939a21eb111a6d6067b38e8e04b8809b64c4e
> commit: b28d1ccf921a4333be14017d82066386d419e638 powerpc/io: Expect immut=
able pointer in virt_to_phys() prototype

Ugh Stanislav do you have ideas around this one?

>    drivers/net/ethernet/freescale/ucc_geth.c:244:21: sparse:     got rest=
ricted __be32 [noderef] __iomem *
>    drivers/net/ethernet/freescale/ucc_geth.c:405:22: sparse: sparse: inco=
rrect type in argument 1 (different base types) @@     expected unsigned sh=
ort volatile [noderef] [usertype] __iomem *addr @@     got restricted __be1=
6 [noderef] [usertype] __iomem * @@

They all look the same, it's from this:

static void set_mac_addr(__be16 __iomem *reg, u8 *mac)
{
    out_be16(&reg[0], ((u16)mac[5] << 8) | mac[4]);
    out_be16(&reg[1], ((u16)mac[3] << 8) | mac[2]);
    out_be16(&reg[2], ((u16)mac[1] << 8) | mac[0]);
}

Is it simply that we need a paranthesis extra around the thing casted
to (u16) else it becomes u32?

I.e. change:

out_be16(&reg[0], ((u16)mac[5] << 8) | mac[4]);

to:

out_be16(&reg[0], ((u16)(mac[5] << 8) | mac[4]));

everywhere in this driver?

In that case it's a straight-forward fix (and the code is buggy to begin wi=
th).

Yours,
Linus Walleij

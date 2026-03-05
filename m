Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555683BD63C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 19:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739789; cv=pass; b=P3/ek+Wi5BFRNu+G/IoBS+cF2HBNypv27iG/v9aJNpXc98K6pMVYZk2xDPO4QYu779veyPY2sZJy3oKUb1dXXxCu8D5ddQmt/IWRlvzlBEyrHq2/fSfoYFAR2c0WBjxPAwVyI1cO+k5j55TM7ypsvav5WiWXazXarwNuGw3EZ7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739789; c=relaxed/simple;
	bh=fR1TXWfd4CA+egVR32d5wNh0tx0iKYkAsimEICO08/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PkY3WfO+1Zb8mv5qlflztIFMdxYgyDj5jZKPcaAtQ5YeGLXeKukB3V2x+uuYeNjCOMzrZptDyyacxvcLEghit+VvYL59j1Umm1VFZFreAr3PNR8FgIGexyNIGbHhwtdq3EmF7WTexWdRm/8/1+MVNNYJ+6zmmARIEF4eDA/AjcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XsWuKYGd; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XsWuKYGd"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1271257ae53so10243909c88.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 05 Mar 2026 11:43:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772739787; cv=none;
        d=google.com; s=arc-20240605;
        b=YbrZbXObToIqLJQcV/jcqbS9tTQ6IrrnV2TNLMOlAUvmCZl3DlQARTbHXq+X2LR+xK
         Q876R07AtTd7NNxkW/9AWBNuP0iLghwckUK6SucKB/rTmsArueDQAgPq3X7NYueSzVt2
         Ji99xJqdo8H2ZSkfb5iCm8DC96QguGEmi8WzJXClHSB+F54Lef4eBGla2r5I09C29DZJ
         eNO5vJaKUOXfT6MdWSoIPwJOL9di9WDcHiiSSkPX3l7EQS9KSYKgZWVVeLhHzuUJVhfV
         29eUGyI800ZmUc1XLzSm662bc4W46vGyAuvM4taZXucjLF0MuANxUep6WjYXbc/Ru7eg
         pOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oX1aoye6X+Uzh2BOw07U5xvyxILQi2uKYkUCyKCeMXs=;
        fh=id7VqteWGV73BeATVkuDX5UdLHV7m18WRk0qpuD/868=;
        b=F4qpvErnHFwsM3OjzEV3/0myEdlnchju+SAAILFznamQcpJH/KappB9oCraidPDtki
         HU/8OO+TccKEZ2qVHb5JE3W9W9S+f7LYZCDxO6WqoA6EG32+oI7eUCM2JeJK0tbjYOne
         PaeRH2nywL8QYz9ImfrIhDJYSsHTp9xvp2wjXHOrj+OuK4aKWV9g9kw1AdMRa+EcARla
         r2cc+3n8IDDwRZADdmvX2DsmMGWSqnFSgZmOgesjAU864lKC+JHFjvbWj0U+t/aS2Kt7
         sJAUgJ6Fb5uNzuDaG6wYgteqdCPJyZeH9CHN84JWq5bnZj+EqcvrZ6yO0R1u4qwwmDKA
         MB9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772739787; x=1773344587; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oX1aoye6X+Uzh2BOw07U5xvyxILQi2uKYkUCyKCeMXs=;
        b=XsWuKYGdp6xbHRdkEW1cQS92xYmf1iOzl4G/UKJs/M+YEN5LfA4klsyAQPlxzZPKrX
         MOO8YcrAZME8XJIGzprukRkCpHg3UIBJct5OlLN2p9X1uigRFGXB2VJMpPMZ31wke8dP
         Ou5VwjwiVjuPOrRtHz+L3vFzvewYoHojLBYUw+UznS7d1A9gNbTMtSb7gGR+WMvSnKor
         tlEHqkIR2yocRGp1WR1XtmsE4NJpFcWW7beWoUb5NOgSPu7PAZnRjlNUepKJx397y1jY
         nDN5mNcuyDSDd14zaFcoJMd7RRVJ0Ahftzjx9lM3rEpuWaNox44C27d5SIhKG2mJI9rM
         ZaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772739787; x=1773344587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oX1aoye6X+Uzh2BOw07U5xvyxILQi2uKYkUCyKCeMXs=;
        b=uhB7iGhylrQWb7i9GbAPi+sx2w/+mODbxlKB84Hcvj4aFaEUgPfb3fQW1sDgXl3HWV
         XDOeibmcMk1YyiQj4jWTUHOL7ZYatBouBuHyNHyr3dVmp2XZVQa3ilYPLOOucRmOImJ5
         jRzfFYmc0PQ4S+yTYhMGAyJqMrGuuZQL16G7lGBZRanSiLw8sb07qU8BGgXTkNUa6Ljm
         ivLKx8qH096bz/T0BcAwMHpzyofcxYOFYJcfv+xsmufmHMFgqUbJ0AZ/2YYBAwoNXQ4a
         IB7JoQA/gU57RaGniguamBYauEXoWHoVMrXFGXzFsIC9Yw9YbyYjIQYhLtGJuJi7Q1zo
         xywA==
X-Forwarded-Encrypted: i=1; AJvYcCXdPEIUFu89ppASaM7zH3/bYiIP3dvUKszO7fGGZB0Z7bBCzI/n8Z9VFMv28Ai4Kya8bGD2WFrYmVAB9jVO@lists.linux.dev
X-Gm-Message-State: AOJu0YywTeZKdj7pQ7tJbk1OOxo7kvnQDHC9g5KrUijwpoqF8w/ubyvf
	0e0NK2omoZqNG0Po6NoF/2R3hL/hXGb7npmuLZ4lpdsuCjK0CbNrFm0JWDS0Px2shS2G2hD2bhn
	NkJNI6O54zYkJ0ty/r16gXYgVOwrHG84ZjZm6dRVs
X-Gm-Gg: ATEYQzwIdl8w2N0nNpWJhLCaggKPkdUxRiUG/UaMuCWn32zdx4k7RbucrqYyf3DJmsF
	yW6EhV5ZiI3rnOTs3xXV9xswCwcdMZxHunIVBqLBupxku6ld96gvGTf+PNRVNanpZpw0/4akx4r
	UNY8Ehcmd7FUZJgvsJjazNiYiOTjQdxx7V7GlcNJ9v5kycn7OBqXmrAufHcj/ITbptsJKwtjNcU
	tKw0cwfMwV7lnPgi4K/BLVB7lkBYIldvadsZdVmLkNDifHfSAgnuHybgFMAHn3DMDzruEHsYiHK
	LVZjPfXm0RxvLcGLldqmAlmbv6ThY1ZEcG1un9HF6HTozItSvzumq0j6rvNpI9xopZvORf9M
X-Received: by 2002:a05:7022:128b:b0:124:9f67:6b6f with SMTP id
 a92af1059eb24-128c10ad55dmr449281c88.20.1772739786763; Thu, 05 Mar 2026
 11:43:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260304193034.1870586-5-kuniyu@google.com> <202603052252.qcNefHFm-lkp@intel.com>
In-Reply-To: <202603052252.qcNefHFm-lkp@intel.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 5 Mar 2026 11:42:54 -0800
X-Gm-Features: AaiRm508G-v6MJNuY-4iHqxIFwZuCKLIrOOkb_pTH11Y7XuxTur_rvFnh0604sA
Message-ID: <CAAVpQUBbsRin3NO7-zARiBbOBTMZN=zr017_zYMaOo_VZr9Tfg@mail.gmail.com>
Subject: Re: [PATCH v1 net-next 04/15] ipv4: Retire UDP-Lite.
To: kernel test robot <lkp@intel.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, David Ahern <dsahern@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, oe-kbuild-all@lists.linux.dev, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 7:04=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Kuniyuki,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/=
udp-Make-udp-46-_seq_show-static/20260305-033454
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20260304193034.1870586-5-kuniyu%=
40google.com
> patch subject: [PATCH v1 net-next 04/15] ipv4: Retire UDP-Lite.
> config: nios2-randconfig-r131-20260305 (https://download.01.org/0day-ci/a=
rchive/20260305/202603052252.qcNefHFm-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260305/202603052252.qcNefHFm-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603052252.qcNefHFm-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> net/ipv4/udp.c:3748:29: sparse: sparse: symbol 'udp_seq_ops' was not d=
eclared. Should it be static?

Ah, I forgot to make udp_seq_ops static.
udp6_seq_ops was done properly

Will fix in v2.

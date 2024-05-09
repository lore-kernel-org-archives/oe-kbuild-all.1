Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6119B14A4CC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 08:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715243147; cv=none; b=JLkK9V6TZyq/dJe1GIe+TEnH/mT3tboBz2oxDE6VhjL/FtTy8wyBihu8SnMDWPpEoqnWLaqf6aVmOc8NPbU8tVLd1aUdaf7p4S6I5Bb5dRk+WgIfFxBSP0zD/o5ngNHA1zFKXJmN14J5arPIfuRnR3RSw9DvcYWk+OUP/UaZSUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715243147; c=relaxed/simple;
	bh=6de1OuVin/1TKmuo5RwjirrKHZ8hQTkZpSXpGp0qFVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+3SvysghWW4LhrVa64P6MfN1g6WDjyaknSCeoSiQ6hbuQ3kOapYpw8bu/lWHW8r4QGI7wahJULvXF9aJx/P107CIYd9Go0MXXZfGPHuzUyDgocN/F4tkER0LjcrnjrKNhedfGFbsnDRsAVqfBk2YgM10FtmNJSK84Y2Grv1DB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0xqzSK+o; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0xqzSK+o"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-572aad902baso9774a12.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 May 2024 01:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715243129; x=1715847929; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXWL+fp9thGcVKthzYUPa2+h322jRzxE5eeJp5R44m8=;
        b=0xqzSK+ozNxJCfMjibEI9MPXifKNDxXUugCbl8NyT43CH3oYLjs157qSsgBZdArjP3
         5Mhl0GZCYFpaNJx4fFdKBV/ofF1i0HJdgQLqKXQJc0CDqeJ2ya65ql29UbJSnsN+SS+h
         W9eGcfPjVC+8HMjzi+kzGU5/Xct3C2DYRtJ3+G1eyDU6lRrecZMAe/IwMYR4rUfrgix8
         QEOefci1PE01qiwmF5t3w9SP3gwiBlxP+MnR+noFsjo2Hq2XsjZD0MjWXVf/RQuLxvJN
         /hUFGxLMQ11KB28S6pCi8fIg/hf7M+4MXSjm0B8xlOdT6Fen2pb5OYuD3IbexSHzmwY3
         168A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715243129; x=1715847929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXWL+fp9thGcVKthzYUPa2+h322jRzxE5eeJp5R44m8=;
        b=EtyLWNC+LM2XPNLJKFDTIvEimK3ydpEuBSR2j20vVsJXB2FGzjTVeG5Q4sNHnjGOu6
         AuArhRHb5ONX7JEVXoPUKHCZaslw8H81x2YzXYT3nlOBFfCuabXQk1SFywavEVErP2Y7
         5JFREi3JPe5phEiyI6KQfuJCtP2jU8XmsNv2J3kL4wTs4UvVGEMV4hg8LUMl9Cya4i7/
         nsrQI9x1SRQyjMFvVmZmQmTUL7Qt1EWi3Tkd/kA4qCcFAa4Lmil7Em4FfElPB/FCKRaD
         3VfDYFJD5OoIFjpHCdOYIkt0T69/9gCzvutzfp6V0QCYP3bylX5tA2pkLhNjn7wNHM2m
         MLaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnp20Tha2c7R89EySpIOoTbz7sIUaEvNxa0JVbMVOr3H9TaQ8nCW7MYq0d//zBudPzPQFn/c5848s/JMXeaPGVSkE1B+rUM2DUugLT+Q==
X-Gm-Message-State: AOJu0YyOXQGuCaJm+yrZegj0BD8RcTgtiiOKT2YyIuit42Z1UtYgOXM4
	M6ILDMKaerzIRv1ph7lNxaFVs869MrWrN1GnUQGzX23S0D1XFriajaoT6BfWg0n19QLGmvu/ZfS
	dZzATj9GyLsPlhFgY3YzaPPkGUKgu+hfDUMuH
X-Google-Smtp-Source: AGHT+IEBb3fkt7PS3dSxfVEhOctV9ND4hE7/VpA2DYo+vsphPwKBGxq8jj2thNiHzHYF11+V5GhJ13pBNa4Jmw33gH4=
X-Received: by 2002:a50:85c5:0:b0:573:438c:7789 with SMTP id
 4fb4d7f45d1cf-573438c7b65mr18557a12.1.1715243129012; Thu, 09 May 2024
 01:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240508075159.1646031-1-edumazet@google.com> <202405091310.KvncIecx-lkp@intel.com>
In-Reply-To: <202405091310.KvncIecx-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 9 May 2024 10:25:18 +0200
Message-ID: <CANn89iJvTqGtSzyPFXTzomcG=ThyFC-jVcjcE9jBE0Tpd26C9g@mail.gmail.com>
Subject: Re: [PATCH v2 net-next] net: usb: smsc95xx: stop lying about skb->truesize
To: kernel test robot <lkp@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, 
	eric.dumazet@gmail.com, Steve Glendinning <steve.glendinning@shawell.net>, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 8:01=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Eric,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-u=
sb-smsc95xx-stop-lying-about-skb-truesize/20240508-155316
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20240508075159.1646031-1-edumaze=
t%40google.com
> patch subject: [PATCH v2 net-next] net: usb: smsc95xx: stop lying about s=
kb->truesize
> config: arc-randconfig-r132-20240509 (https://download.01.org/0day-ci/arc=
hive/20240509/202405091310.KvncIecx-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20240509/202405091310=
.KvncIecx-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405091310.KvncIecx-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/net/usb/smsc95xx.c:1815:19: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected restricted __wsum [userty=
pe] csum @@     got unsigned short x @@
>    drivers/net/usb/smsc95xx.c:1815:19: sparse:     expected restricted __=
wsum [usertype] csum
>    drivers/net/usb/smsc95xx.c:1815:19: sparse:     got unsigned short x
>    drivers/net/usb/smsc95xx.c: note: in included file (through include/ne=
t/checksum.h, include/linux/skbuff.h, include/net/net_namespace.h, ...):
>    arch/arc/include/asm/checksum.h:27:26: sparse: sparse: restricted __ws=
um degrades to integer
>    arch/arc/include/asm/checksum.h:27:36: sparse: sparse: restricted __ws=
um degrades to integer
>    arch/arc/include/asm/checksum.h:29:11: sparse: sparse: bad assignment =
(-=3D) to restricted __wsum
>    arch/arc/include/asm/checksum.h:30:16: sparse: sparse: restricted __ws=
um degrades to integer
>    arch/arc/include/asm/checksum.h:30:18: sparse: sparse: incorrect type =
in return expression (different base types) @@     expected restricted __su=
m16 @@     got unsigned int @@
>    arch/arc/include/asm/checksum.h:30:18: sparse:     expected restricted=
 __sum16
>    arch/arc/include/asm/checksum.h:30:18: sparse:     got unsigned int
>
> vim +1815 drivers/net/usb/smsc95xx.c
>
>   1810
>   1811  static void smsc95xx_rx_csum_offload(struct sk_buff *skb)
>   1812  {
>   1813          u16 *csum_ptr =3D (u16 *)(skb_tail_pointer(skb) - 2);
>   1814
> > 1815          skb->csum =3D get_unaligned(csum_ptr);
>   1816          skb->ip_summed =3D CHECKSUM_COMPLETE;
>   1817          skb_trim(skb, skb->len - 2); /* remove csum */
>   1818  }
>   1819
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


Please note this is not a new warning. Prior to my change we had :

drivers/net/usb/smsc95xx.c:1813:19: warning: incorrect type in
assignment (different base types)
drivers/net/usb/smsc95xx.c:1813:19:    expected restricted __wsum
[usertype] csum
drivers/net/usb/smsc95xx.c:1813:19:    got unsigned short [usertype]

I will submit a v3, to _also_ fix the sparse warning.

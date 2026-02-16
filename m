Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F471DF258
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 05:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771219145; cv=pass; b=F/Vr4HYxV3JeZ67u/dgL+knulGwtkT7ibn+dQmOHYw8/4cEWW5OFAildazhAfF7Bc/lmpVugZUaJmmUGajnN6MLY1sf5vW9xn5HOFpdoMZvwh3m6Rd5qdPpR+saMy0Nc5g1PT/uj1bQ0lVYByr6Z/PCDr9CJxwgCC/1pcy8ZITE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771219145; c=relaxed/simple;
	bh=cTydM6llwe17dEOjiDWqAOfd5hLsCH5gFvItqj94xXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uOEcGo1vbgJtlIj9GE+npU+ytj3Qq6BBo6xVjtrXGHWzm06evPXl+/unV83sKVu86Kj5s6HjBG+9MtEq1W9T9nqG5UZfvEQfp/E5gyK5UrDplfkwp7mdaSzb5vxf4dISegiH8n4GOHrFxhh/k626pe7ji/4AjheI3azLShUz1x8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TbljmUkJ; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TbljmUkJ"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1248d27f293so6545971c88.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 21:19:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771219143; cv=none;
        d=google.com; s=arc-20240605;
        b=A88QNqCHKp5ozjto6eiHT0MSNAACJiPAIpAp8EazR6+juyMWwvg1V2sMPQpiKCO9mP
         8J1U+lhVEOxMuof4lT/A0+xhitruC2NDlMqHiFx4i+xttF+e7pAMzvoZrRN14bTlizXl
         BLblG/SxsY5pX1Fm/AW32oHEQr9C2ci70pyRmrJQS5F91fZTohXkMzgZGXUoGDmM2IJ7
         zS0/EXJ+4tIjWtFulVQh9tGb9WqSJP1zKJdHOSbEjubCzEDU081sI7lOEdfflO1tS5Jy
         +EQBDKt/ImVgfpUMMfswxawZxV+Q2uCqurGW9WPhq4FQG2UHnPDYPPsea6DxSoDmUlUm
         NNfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=byzn3mYrXH2f08drE1WkmiXr5JyMmD4IsRirzVhSrPA=;
        fh=4Cc/2e7k9+IbT4CvwWaQUrJ5S/nvOaOsIOmKq0jPXEE=;
        b=JpRRXo7kGQpBvkw/9WsgiI4H2yTX1MFeX4In0CWzZoWCw/zAGeGK3xBEI/AR7JgOKQ
         UQ+jSkmaZpVFfEihQr8s9t9OCo8R8cXJR2MS7Lur1zNzaB2a3wg0otE4O5gZ9Zo16o4z
         BjVRF0t6nNMUwQaF8iZpw85wMKBJ9/0UHU242DYngZqV4REZAkd8OROSFNNRda/zctUT
         /uaReiSMpH552aELObjqEeTrmXI8Ps6Su1SM7/SChbyA381hpJy6RE2sR/uPOXFmJYnD
         Eu1zIFP2aVGribSl4pFdq2YiN1AOCgZiZwRnvQAP9cq3XJL2X/8bZLsuXmJeRQ+XK/kq
         sUgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771219143; x=1771823943; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byzn3mYrXH2f08drE1WkmiXr5JyMmD4IsRirzVhSrPA=;
        b=TbljmUkJcdEuZh1Mtx78zHMRSQZ9Zb3sEDvYJWgXzzX6lEWCl7FNjh8eSEdP0LV/ut
         NxJHlxa/C79g7sXMfq6D3np0XKr4GSl78RO6IIwH0cZNOSpx/1+OqhOW72ZXDf4n3Pvd
         pjvNc4AwxMe5jNZ6l0MyJhVxoz3JdWDBxgR72LueKSH1ZVKvNVKkub1AzJu2fw/WtcOm
         yNn3BhWmTO8KubA8bLZJOJJen4IbnY2aSkWGHfhB/DDGjXQENC2AhLJv+KoH/4+eAN4J
         vBEih2IZ+/rd/BtQrBuBYXtJ3y1wtUU2/JUXrMyAKqBkPlekYXUWiT07S4OoOZ2se/lp
         R6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771219143; x=1771823943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=byzn3mYrXH2f08drE1WkmiXr5JyMmD4IsRirzVhSrPA=;
        b=oVIpmUi5DETJNkB+ccvCI1axkC7lAVHv7Wi3OGIlQLoZYLeocXXddK1i0IZT2YpGyA
         7yV+Xk0c3HeA6kzcg4OvDl+cIGHK98hY2SWDsYFjCXLlFwG0JnHSZYYGyjUGWVg/9WCw
         UgsjCxTM3//u31UpbFJQXdIPFN51ETnoSchl4s0KTiJngStIi6Ep+7RsUQHgpY7mow13
         iksytskPMzEMS6k1nSmHdRqfEkTbvafeMnjsh55eJhtS+z333zr5TnB0cRiajtPVKvCq
         mwIgksHLScoJcAYw5DcAWv058wu20dLQdFTHvE8cTU+dsUczhHzFBmeTfWsLbgoY7oc0
         A0ng==
X-Forwarded-Encrypted: i=1; AJvYcCVflA4d+2eTHdTrwbgkICTwRChwSJI/6LzPLxA1J4x6zXu+ka3psEoZXxLySTXqsi3iyJUHVrlCe1dTmkXa@lists.linux.dev
X-Gm-Message-State: AOJu0YyIYbn/LdHmH+kRhiB0227W+CtCZBejBpYTlTvEY0W0UWN6uinO
	AEitLbglO+TN2gkxtx0Ma7PghCeicgcJ2Nb852zoGH2AsE43fdWvKppAJMDRHyTvTRRIW8UjWqI
	xRJT4sh7jgazrKxm0u5Et4EhWWgXh1FD4qYIJ7WiW
X-Gm-Gg: AZuq6aL/uIrRLX5ZCjkUIFnjQi4L5FJr6kyeVX7fXWYJKu4d3qv4Zp3uAgBENCI6vYp
	OBNhfQHnRrENd/1NsHrPPDIjt520ssfWO6meRVHXOiqONUXrGMwx2d4o/77ETW/eEfAPHoJybxR
	KNnOtOlFa1ROjJLld/wwmYwt7idFtR9q0tCOGY7pOA5JwELVMnt6+Tuga3wLOSgueJtPUamEgLH
	+98kEabl1ust861QoM5wYkjqwdUHHZuMUVm0VdtCXgYecK828faDgIVIzozKXCzZ3dOpC2ErHNi
	cO231hlqO6BOypMi5DMhuLfm0fUmyPeCdnxLqkhGYsQKb7LeqgLPoF8oSlhfD6MttKFaAw==
X-Received: by 2002:a05:7022:41aa:b0:119:e56b:c74d with SMTP id
 a92af1059eb24-1273ae20572mr5446447c88.18.1771219142650; Sun, 15 Feb 2026
 21:19:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260215204353.3645744-7-kuniyu@google.com> <202602161010.ohfwdwoo-lkp@intel.com>
In-Reply-To: <202602161010.ohfwdwoo-lkp@intel.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sun, 15 Feb 2026 21:18:51 -0800
X-Gm-Features: AaiRm53TuLLrj5i07WCfZaVSzTTG-oZE_UcBw7XWP_S2gWKmb775mn2vrkqu9BY
Message-ID: <CAAVpQUCBY=rcJdBKNb5nMWnFvak7dVzsF4_SpKfJKSWkqXaPmQ@mail.gmail.com>
Subject: Re: [PATCH v1 bpf/net 6/6] sockmap: Fix broken memory accounting for UDP.
To: kernel test robot <lkp@intel.com>
Cc: John Fastabend <john.fastabend@gmail.com>, Jakub Sitnicki <jakub@cloudflare.com>, 
	oe-kbuild-all@lists.linux.dev, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Cong Wang <cong.wang@bytedance.com>, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, 
	syzbot+5b3b7e51dda1be027b7a@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 6:51=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Kuniyuki,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on next-20260213]
> [cannot apply to horms-ipvs/master v6.19]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/=
sockmap-Annotate-sk-sk_data_ready-for-UDP/20260216-044819
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20260215204353.3645744-7-kuniyu%=
40google.com
> patch subject: [PATCH v1 bpf/net 6/6] sockmap: Fix broken memory accounti=
ng for UDP.
> config: x86_64-buildonly-randconfig-002-20260216 (https://download.01.org=
/0day-ci/archive/20260216/202602161010.ohfwdwoo-lkp@intel.com/config)

Okay, CONFIG_INET is not set.  Will fix it.


> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260216/202602161010.ohfwdwoo-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602161010.ohfwdwoo-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    ld: vmlinux.o: in function `sk_psock_skb_ingress':
> >> skmsg.c:(.text+0x8fc777): undefined reference to `udp_sock_rfree'
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

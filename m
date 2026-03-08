Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C29256C6C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 18:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772996293; cv=pass; b=RbDVad8CPvIdegSOPqyVxi8u/AS+ZGOBM799ags1w/gSqkNFm2hseA9zX3D3dyQbZ2Bzmhs4Aw8Vrtd7ATDyfTslSsz2NWEewP9CMynM4Z6YcfdOxlrLOuoWMKDJmZv9xRqHaa0it+unTLt1uZPSlCrYxxVe1nv/MOieq15toUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772996293; c=relaxed/simple;
	bh=J+okUNsU4n0XXov13CjFPOR5tCpWRrmV8oBT26GKEfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtfZs00V9PH41t3cKP5j/VfsKdyBdD+/+/jgIXNJXctnIBdgNEZy9XIJ9nEbxhk3ISYo8vLCeFjJQCoaG7GMM5UDI94fWkQ4Uh9k5CXnmx+NMX3yTFRQXK07j/m8Z7lCva2x8EpsFyeCYPreutCs70jDdjknkwil249veWmRg/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uW8UD+9O; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uW8UD+9O"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-127380532eeso8433354c88.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 08 Mar 2026 11:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772996292; cv=none;
        d=google.com; s=arc-20240605;
        b=TlQQz3PrQW0D3bJVHoLLxe4JcLjrS6y7btwQYKKJ0/K/G7h/xhi+UKJgem97yH3KVB
         l8S6/B5E5us+V1dhhxRvEmlTTF2RtWmSOcnWBw9B4a7xJDjfhsgoQp7RJen/YOYAvBtw
         lfiE5aBZz9RM2eq3Md3AaQ7Vb1b3ziwQzuxB0ktFbs1PfovpHXBG5j4JtjUb2fSxOLWj
         ssZ5+gX3n6jFV+jmoNxlvXVqMPk0DSR4mwwogWIOSiU+YYZwDG4BxPk0YVE1t6htklmP
         zx9H/BLZWe0kLKGUnp6938t4/lRVr7ZrmZUYQzoiEAlX07ucO+ZqwNwuOLU0ni6EMiFV
         bU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oFOMMYzs+cDnMVZz6rJ8vj6DqKrcVUiqEcJmPl3Msys=;
        fh=4i0RUPOq1hPUcFgLC+o/f/1YeuwTof3fKyh3nmkzwBA=;
        b=kYCSCmDZKPa14skSoRAO9tKFG/kQl1K8y3l8JHhO6OW3GkT4LtCa86ZLG0NAJ1mx/i
         KC6sgds/64V4+mQi+7aZ3yP5gMMByXs+1toRX8R8RnJir4xo82mq1IZxZmaerlXP5Dk9
         HHZnjnVQthM8XqvgRUeUMw8dgHpLTD2fKM0nz/I18VLFcbXstxLPw6wz/hdv/06lSb0i
         yNl8XmP7lzPuBqw9BdhqQb9SLye66hsM3pcIMWTUcIbcFKAbQhSG5ssOQvpLYiIcbgLh
         WymN13ooLje7cswnw6hWSbYBgiH/FcErpzKrxvfojMg6v9IwuvTN240q37O+Ip00V0r0
         UEjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772996292; x=1773601092; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFOMMYzs+cDnMVZz6rJ8vj6DqKrcVUiqEcJmPl3Msys=;
        b=uW8UD+9OhiSJ7CGUDkQn5ts7ZOrPmthBEOWub4Vj+R/aJj1dKpcezw8771tKlj9ifK
         bE59I1ziRVknqHeSm2XimH13yL0O0iY8IwG3yl+2qRFyd/kRIFVnyOVhsKG+9FRXLr9T
         cR50qwTMwAPh9buWuWF4EhT6ZGYzeWnx7lypYdO4A1WeY45I0siO9MUaOBpSW3Jc2jOI
         +bmJMqlLvXs++Iiv8OcppPZWT94qXkRVQof26SfZfsbN3vpi/Tygdu5Ak4XpRNV6CuZJ
         VPeUCPthCTZleb2Gl4LHHWha/TSrBXHXWkhrX3sMsEN/GaubQJdt1FDbkyDPHXcTFYmN
         RqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772996292; x=1773601092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oFOMMYzs+cDnMVZz6rJ8vj6DqKrcVUiqEcJmPl3Msys=;
        b=VYbzwF808Gsu5IFm2+2WD04PpwbdcuvTA2C7xMimhKILIMQsv0HUMGfRUowuweLd18
         U5zZ+xFuqm+xAwpUKo9yjzSdSJnYEklSN9RUSa8BoiuLsyabYHBznTvNRAJ4NFboYD93
         idAYL6Wt60BabAojIw0m3tMeA26m//NEC1nj5jIcX6X8v0D09W9HcvnDOV0yUDjcxZmM
         h/FtomZ/MoRgNYwPCNsSHkjzdiZVwJeBNH90yqTb38Zh9c7J5+j8ykC2/ETsFxPCG54o
         WnrwHPB5rA7hYcBiRD93gxCXYLS/POBwn6RY+6A0zE1lvDCNOFWhOqYLIe4okugrxrIw
         LDYw==
X-Forwarded-Encrypted: i=1; AJvYcCW4hkK8vO9ALZGzuV0h7PDsAde6GDrv0Z2RJU/tUGUwK1rd9lOW60q7NiPvXvFw48EQQkYa7+CLj4ZbtjHX@lists.linux.dev
X-Gm-Message-State: AOJu0YxjH+unO/mIjgdLL46DipiFDmI27hmaBmD4Ckr/P7ooa71RZ6JS
	nmXiIFwNU9nNgqa5IVmbfSey0GQB06tYce4Yym7NmT8rEQxNx7yEWy9ETAC3AdXJemVQ6js8+ME
	f0BIuYWu+f1Ze0sk2RiT7Xj6N7DslDdrwrXDIAPTk
X-Gm-Gg: ATEYQzwTPDdyjtkGQ64wyWQkV3a29OiC1lKuut91UDtsrjrPllOUbTAz+Zn922Dv2EU
	6HrZnPsjSxtUvSCiU2LLjIpQDHHHpvaAhgQxdsVKTCs0MR/J90EBJ/0Xn41fk84219YFQbEnbkM
	xaxruapXYAh7OwTNkG+9SB/wH78fw/LueZQ1NL6+1ykJKYG4nK744/OAuJG2itlGg7bHPxkYIGL
	O27nUNtVR4JvIGVhu5zFqB1pWvN8neNdTJoXrqzARBVlMC55Mm//q2HlQ8KWoHSrxh9Uzxsku7c
	yIRO+Kd9sRQmIxXT3iEFToTh1uexSH/7vDIo4Y/Mapj6iAEeByzyYoBgDoKyOl697btMLcUI
X-Received: by 2002:a05:7022:6714:b0:122:153:d161 with SMTP id
 a92af1059eb24-128c2dff0b4mr4373551c88.17.1772996291360; Sun, 08 Mar 2026
 11:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308032304.1841198-3-kuniyu@google.com> <202603082250.0lR88YW6-lkp@intel.com>
In-Reply-To: <202603082250.0lR88YW6-lkp@intel.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sun, 8 Mar 2026 11:58:00 -0700
X-Gm-Features: AaiRm50gvdwjwEaFZ30chmoDyx4QO3rQoJKA6k3uOdzy-9ih5FaZdPvPg0Wecpk
Message-ID: <CAAVpQUC3q-m_RR4qvkN_tNt6CKA-8tmQttMaxVy+HjQpXf==hQ@mail.gmail.com>
Subject: Re: [PATCH v2 net 2/2] ipv6: Don't remove permanent routes with
 exceptions from tb6_gc_hlist.
To: kernel test robot <lkp@intel.com>
Cc: David Ahern <dsahern@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Kui-Feng Lee <thinker.li@gmail.com>, Xin Long <lucien.xin@gmail.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 7:50=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Kuniyuki,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/=
ipv6-Remove-permanent-routes-from-tb6_gc_hlist-when-all-exceptions-expire/2=
0260308-113030
> base:   net/main
> patch link:    https://lore.kernel.org/r/20260308032304.1841198-3-kuniyu%=
40google.com
> patch subject: [PATCH v2 net 2/2] ipv6: Don't remove permanent routes wit=
h exceptions from tb6_gc_hlist.
> config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/202=
60308/202603082250.0lR88YW6-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c=
32caeec8158d634bb71ab8911a6031248b9fc47)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260308/202603082250.0lR88YW6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603082250.0lR88YW6-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> net/ipv6/addrconf.c:1282:5: error: call to undeclared function 'fib6_a=
dd_gc_list'; ISO C99 and later do not support implicit function declaration=
s [-Wimplicit-function-declaration]
>     1282 |                                 fib6_add_gc_list(f6i);

Ugh, apparently I should've used IS_ENABLE()...
Will fix it.

Sorry for noise !

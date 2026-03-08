Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D081E7C2E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 03:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772939328; cv=pass; b=poTrW6w9WtQBfrYqrwbMHpvg3E0oD8170QaJxU74qwOrM/mFFIboBBfE7kwK/WKbU0Plk2H2zT2/uRlgB7O2sWMwxG42h4gKnHEAnLoo8sU88XgCfNBzl9j6a7AtfmhRy0XAIY6VyvuhpD2/HYIV50Pew/BtQeYKquwdY2Ytj/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772939328; c=relaxed/simple;
	bh=urYB0CUwxtHfVVQokjPh2rco2JxICNlUyjAd+lTINpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pu3SA2/jsgLmNMrtuT5zKkYxL4qpOmoAC1titauJ9usmuAFbPhlY1wVhV6xUhagi30iei2fEOMZOMH9JRTTXumLpUjQqR8cLfCX5NwM4+rd9O06THvoKPkcIjXKFlnvLdhlzZrvRUh65uOs/vk742K1ZOTdi97Dgb/pGko/WL6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fSdfNfA3; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fSdfNfA3"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2be4781d2baso3805452eec.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 07 Mar 2026 19:08:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772939326; cv=none;
        d=google.com; s=arc-20240605;
        b=helXcAaMWViW/62Thby1ypNHmR+bv9yBeoqwgLXsEchlGA2mOK+rdUg0yzw7RN0QwJ
         aTcNHon1Ab3Vp44BEDOfuiYdEqLGE00c+KENrSqyuADIzKQvPvl7HF6lkxOy286qhNiU
         Sr3Qcpfelb+ncj76LksBGEbVNiPrq48wE239GPwH3LLZ8Wfqq7vBvm5P0IxMuE73d7xd
         Xj98YEiwUCrh18/iu95/MNXLgoXtg1C44QTlLZN9lQqMHVKJoMXU47IKe6Pd2UFHpyzi
         cKcPq+v4iQsMEVUh0qT2mkQIZdo15SSr8dEetxKil/GjZNe7+CgQ1T7oO5U4SVFpx9JS
         7pBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vL+kYgBcVaHGMpKP/KOcO6tTjJs1gho5KzlvMYmWcNg=;
        fh=MjGwaeZGC3elJUk3SZMobxH1Z90/7SYFUwP11KhqOzs=;
        b=Qb1lZHc+KgPb4utjvQN+5mF9VsDzNcnytYYQ5a8s5Iu7Y78MxWs4DbBhQTn+umm9VY
         /THj4/12C52sRInDPgO5nRkc6PFU/CpxaTSKPln7ZqG+GyzYFH1oNGxm+H10Xp9LoIeG
         rjy5+eioNlw7JABggft1WjyoIS8Ob7kFkMWqjMwpd8b+LjRr2JRbmt5Au8r++OWitA9k
         jTyK3LjVgUDVu+ItnJIcJl+EV6eMBrKI4hgmt3fja8Wi5FzsApuCX0YUgnWdE0P0qsC6
         PrGRVR3PH6CzXkHigUaryWl5TdvE+Mo57OJiQW/GTtMMlLQqRSj7H9DQLLrElJBHuVOQ
         Rddw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772939326; x=1773544126; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vL+kYgBcVaHGMpKP/KOcO6tTjJs1gho5KzlvMYmWcNg=;
        b=fSdfNfA3g9LsyLlgekLr1BTF9vPoczZfqCvxKrqS6PzCXcO0Vv4K2VEC9/GqasofZn
         K61drjb3JeJ6wWS2eN5B2efXkRn/Ck+gUVr2doDgHBILyGpz4j6sH9XVjhlOguGXXBYq
         1+bipYIyrgv3K5KKuTD2RxeBLwAqgwEm7uBPvQ0XoEnl+pH6R+PH2KYVMhk1XsUIcyB0
         zfa3xxK8YIt+5Wec3cMS/oAPm9OjqmhA8CpUZLiJxUjc93Tx+zflBNw5BKcTGMPGf3EF
         xQqzRq0lbF3FxiX4zrjmumHmv/eLS81+OpLP0fr3spQci99SCFZoJlDqn3V6pZG0Hxhp
         gw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772939326; x=1773544126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vL+kYgBcVaHGMpKP/KOcO6tTjJs1gho5KzlvMYmWcNg=;
        b=QsGr3gJGRR2Hxs7CrdNIvArmgolKiFndnczryuDOqHyhAaRjMf8p2kUIeOAukBHiwB
         nP27m8+II7TQ6jUM28ZEft5U4HShxY7C0QLYSpT4S8h7oE6tnjJpaRZ07pQw1fIWxeC6
         wv0uP2FopQ5Qi9RQxdBJN936Q05kK9FmjEt0VsBXQyUd/dlP3wq1aj6pT4iWrsSq9sV7
         8WJRsRWXur4LjXPAP8T7zIKYMS+YJvNzK0xyMCqrd4F+bPJMRULcQogrRt+g+oQ8lskL
         dowmcHTw24oFJSEZbyDYoZL6JfkArXUqs3noVwM59Ur/Vomhjv0jxMCPqBvfSXbJpf+5
         Fu1w==
X-Forwarded-Encrypted: i=1; AJvYcCXCFXl6P2VWOJKwJ1r2kEvt3dyq2z8QCt8mwEoUjvpHG8dmO/chvm+MHP10RxtJ/eZnVeJJoxMmmbpxsuo6@lists.linux.dev
X-Gm-Message-State: AOJu0Yxge58X061Ix2ki9OKP7MjKMuI97bpolHXVV8L5VF2aSmxouddo
	+vMvbyw2nBKoqaK1877SFfuYiMwSmRLaB5yFmpyE7xPzjJN5RYWEz+6xe60CIGfX5mh4eR3Mx42
	ObWrJBmW8MgjgKdGa7T4fki+veYfsTtEICmYscUyC
X-Gm-Gg: ATEYQzyGD+56bIw7TMWekofXmIaWuRG2rpsw44B+Rp0D8yBv77u0u8Io6/3RZ3s88KD
	0XKPSa/RIYolPJOEql1E+xPHt0OMlkPsulPkOBNP3QOyEcrEY3PEj6Zf0dXELnAwzJOUCdtVeQB
	MU9lj7DuIrWqiyVi5RfVBA0g4pGc7wWMN3OavgZVUpqjn+EiNz/rVGPAS7dvzixKnYCeEg4MhdR
	9f6bjgJYLnm+dNW5A9yoIK8W7eaMHWAMfTUKRcuzbRvXdGnSZ+rRMbN7O422qfv8FH4EY/pFXBy
	wTaBMkfp9zwAyKe4a7fiH2mdAVhg7xtEGPAIJp33zX4dCc7Y34PDgKh4e6jZnkuwFTLUFAKz
X-Received: by 2002:a05:7022:117:b0:123:3407:1066 with SMTP id
 a92af1059eb24-128c2e8f192mr3059142c88.43.1772939325636; Sat, 07 Mar 2026
 19:08:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260307024709.718395-3-kuniyu@google.com> <202603072124.nNhJgNnw-lkp@intel.com>
In-Reply-To: <202603072124.nNhJgNnw-lkp@intel.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 7 Mar 2026 19:08:34 -0800
X-Gm-Features: AaiRm530dp8zNSZFQaweLHDEXy6u7qeD2gjLWLlfefoma-wEY34m8E-f-DzfMgs
Message-ID: <CAAVpQUCFHWPYown66QVTaNDeVWERg0a99gcc3WBQeikXdUy1=w@mail.gmail.com>
Subject: Re: [PATCH v1 net 2/2] ipv6: Don't remove permanent routes with
 exceptions from tb6_gc_hlist.
To: kernel test robot <lkp@intel.com>
Cc: David Ahern <dsahern@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Kui-Feng Lee <thinker.li@gmail.com>, Xin Long <lucien.xin@gmail.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 7, 2026 at 5:38=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
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
0260307-104803
> base:   net/main
> patch link:    https://lore.kernel.org/r/20260307024709.718395-3-kuniyu%4=
0google.com
> patch subject: [PATCH v1 net 2/2] ipv6: Don't remove permanent routes wit=
h exceptions from tb6_gc_hlist.
> config: powerpc-currituck_defconfig (https://download.01.org/0day-ci/arch=
ive/20260307/202603072124.nNhJgNnw-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c=
32caeec8158d634bb71ab8911a6031248b9fc47)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260307/202603072124.nNhJgNnw-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603072124.nNhJgNnw-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from net/core/sock.c:133:
>    In file included from include/net/xfrm.h:26:
> >> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct=
 net'
>      557 |         gc_args.timeout =3D READ_ONCE(net->ipv6.sysctl.ip6_rt_=
gc_interval),
>          |                                     ~~~  ^

Oops, I missed ip6_fib.h is included from many places.
I'll guard the GC functions with ifdef CONFIG_IPV6.

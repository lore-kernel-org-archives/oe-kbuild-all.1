Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3022C1788
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 09:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759139410; cv=none; b=GwlonFe2CKQVhgkxnEM9GZknID4JgU08Aa+uq3OlRQEudnDrpbUlZ28H7uRJvmtbfu4WPrwR6ejcw+EshABvH7v3RuyW6znrk8LB2kWWakNfQaGzBEnj0jp6uYLBWk2e3E9LrglnNnjm4uwbwDTeuMdsUe9x0H3uq98BXz0jEWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759139410; c=relaxed/simple;
	bh=mvicEPuf4r0RGtAkZoJ5xmZW/q0IyX+okVr/uMTxpmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQbKttvJM112i1AZIKMjfsZiPEsdHLeTjqSMibdEs+GQh+owBGSdbwicDkuOJbaOGRg6XJDJF3bRf6HzoJrH+Wou1Y3vRQKzLVwdEIZcDOpk1iUF/WRVPHk6j3UcRoAYxrSJjhYEq+iEXeVQUiW3AwTy16lVYv5IN+X1TG4J4LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pQSJYeA5; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pQSJYeA5"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4db385e046dso37154121cf.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 02:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759139407; x=1759744207; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBKBF55HXYFQaMFnx3x4Kb2psOZMurlqFtNAu8yb0U4=;
        b=pQSJYeA5QioO/7jyXdz7LurLNHf8uUqZBBUjfl7CYaJPPHnCzh/tJM+oyVn+x2cghl
         QDfbLJ8dz1Kn41ygfA9h3tB3XHN/rk06+Zy0XsInPAjgDtTHTniGp1HHdgwaiIJ1ciYC
         Kk4my6HekBuenlW/NiTg7AZMdwYvQCzyO864anmePyacMLT4qT9UlwfKHzqJrcPUa9rc
         WL1ILr7f9xdbS0roKNqdKb1ud5VDtm3UZgb3jZkE0+6bwwm5tKjciSIV5NaVndPjQAON
         AypP+9Z35OYORP3nCeLPzDn15VsuWCKozCOCfT5dL+T2tjEROO+qETCa1JZ5mw8Vqv8r
         w8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759139407; x=1759744207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBKBF55HXYFQaMFnx3x4Kb2psOZMurlqFtNAu8yb0U4=;
        b=S+kD8xKiPtA7xGzLu+8p9zU5a2FYgUGTAOX8bKzS+JJ2gzSCzJJZwqEGd1jZPVh3S5
         tTo3TvwywP9ZQzRtm5JDuQMf4F6rhJ9faIGGxTcBMtyfTMz7Xg7+IgqUA77U/jNKIW4o
         iJnSJwKhUF1raWD5MG7hfYMaGYgtEMvXFb4O44SNQghVR8Nsa/aghj3XNAvjD+E0SNkn
         dRYBkwjS73QlgJwuUoLTtl22UPF4y2EAbu7BoLdm8+P38hzM7/T6KyvAzP1xLV44SUPH
         ASiBJ3HifjV567HOYfsnJr8nGRVC1c+7FVZ1QSo8Vndv5p4Zl52lU1urDZ+I2X6kqe9X
         R7YA==
X-Gm-Message-State: AOJu0YzCk6QUPusYXDOVBb0MDInnwan0tRhKRzmFdLD+2eYhEEb6KRZB
	NTKV4hwcEIcjRFFQuvUTUzq7sMa5LQiAW3OFOJ/YmkbyoWQ4aHbdYDEh+PKLhEG115jLMCAXlRI
	o0yG+hvvWbAiGKQP3NphTrNTWK10JWtICq8ecMhCu
X-Gm-Gg: ASbGnct2N1f8Q1p1hHuYxZ5I9tyBJZICl1BDYpddlGuN1q5F+9bmfb/hsGxqLNu8Dtm
	1QnKYErLw4uLttBOHu+QS3D2/ClWudz9/0eprufxVEo4AbZW7muE7l8kb4H7jpJO5YFzfZFUDnD
	jtFthJiHuTHsPPB0Oteq4KJdGvEyY0RQNd4lZLDLQBkHGYPVEkfQFn4MCR5N74r92aKeubwi99t
	0iOPqxLvEGnxFfQT7pXsRi4
X-Google-Smtp-Source: AGHT+IH+8BTBdjJ/qk0sPVOmAqIlSkDcP3vnsTNce6M/cqgozNtY9rsfNP9O8L2vdibMgh/FIyVwCCmU18hxA9oKtrM=
X-Received: by 2002:a05:622a:1145:b0:4e0:e2b:1085 with SMTP id
 d75a77b69052e-4e00e2b2259mr60046921cf.26.1759139407142; Mon, 29 Sep 2025
 02:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202509291645.fcBIaXMb-lkp@intel.com>
In-Reply-To: <202509291645.fcBIaXMb-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 29 Sep 2025 02:49:56 -0700
X-Gm-Features: AS18NWDfCUfaZvpzjNJOJK1mKvgkeD6hO2LgWPXyr1Z7w2ehpEHzsk9zKcK9K9o
Message-ID: <CANn89i+Bt5Coi3YOj2JjX4KWQN4tJJpyYD3EabS274T8bQwjSw@mail.gmail.com>
Subject: Re: include/net/sock.h:2098:16: sparse: sparse: cast to non-scalar
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>, 
	Will Deacon <will@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 1:58=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   e5f0a698b34ed76002dc5cff3804a61c80233a7a
> commit: c51da3f7a161c6822232be832abdffe47eb55b4c net: remove sock_i_uid()
> date:   3 months ago
> config: alpha-randconfig-r122-20250929 (https://download.01.org/0day-ci/a=
rchive/20250929/202509291645.fcBIaXMb-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250929/202509291645.fcBIaXMb-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509291645.fcBIaXMb-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    net/packet/diag.c: note: in included file (through include/linux/sock_=
diag.h):
> >> include/net/sock.h:2098:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2098:16: sparse: sparse: cast from non-scalar
> --
>    net/packet/af_packet.c:1099:13: sparse: sparse: context imbalance in '=
__packet_lookup_frame_in_block' - different lock contexts for basic block
>    net/packet/af_packet.c:2541:17: sparse: sparse: context imbalance in '=
tpacket_rcv' - unexpected unlock
>    net/packet/af_packet.c: note: in included file (through include/net/in=
et_sock.h, include/net/ip.h):
> >> include/net/sock.h:2098:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2098:16: sparse: sparse: cast from non-scalar
>
> vim +2098 include/net/sock.h
>
> ^1da177e4c3f415 Linus Torvalds 2005-04-16  2094
> e84a4927a404f36 Eric Dumazet   2025-06-20  2095  static inline kuid_t sk_=
uid(const struct sock *sk)
> e84a4927a404f36 Eric Dumazet   2025-06-20  2096  {
> e84a4927a404f36 Eric Dumazet   2025-06-20  2097         /* Paired with WR=
ITE_ONCE() in sockfs_setattr() */
> e84a4927a404f36 Eric Dumazet   2025-06-20 @2098         return READ_ONCE(=
sk->sk_uid);
> e84a4927a404f36 Eric Dumazet   2025-06-20  2099  }
> e84a4927a404f36 Eric Dumazet   2025-06-20  2100
>
> :::::: The code at line 2098 was first introduced by commit
> :::::: e84a4927a404f369c842c19de93b216627fcc690 net: annotate races aroun=
d sk->sk_uid
>
> :::::: TO: Eric Dumazet <edumazet@google.com>
> :::::: CC: Jakub Kicinski <kuba@kernel.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This seems an Alpha issue to me ?

I can submit the following fix if there is an agreement.

diff --git a/arch/alpha/include/asm/rwonce.h b/arch/alpha/include/asm/rwonc=
e.h
index 35542bcf92b3a883df353784bcb2d243475ccd91..b6801cd2ace962e11624737ed33=
4a5aeb30478b7
100644
--- a/arch/alpha/include/asm/rwonce.h
+++ b/arch/alpha/include/asm/rwonce.h
@@ -22,10 +22,10 @@
  */
 #define __READ_ONCE(x)                                                 \
 ({                                                                     \
-       __unqual_scalar_typeof(x) __x =3D                                 \
-               (*(volatile typeof(__x) *)(&(x)));                      \
+       __auto_type __x =3D                                               \
+               (*(const volatile __unqual_scalar_typeof(x) *)&(x));    \
        mb();                                                           \
-       (typeof(x))__x;                                                 \
+       __x;                                                            \
 })

 #endif /* CONFIG_SMP */

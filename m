Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654BE5692
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 15:48:50 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-407db3e9669so247161cf.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 08:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691768929; x=1692373729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LSHVIb9UFewOc6C0cD7YznG7qCPc2ebrFIqE79xMTg=;
        b=s8Mz5GqhAAT4q6vGrdOzXaJudtrGog0Ocsp1selmLwBPN8st0Z6gyYx36mk8S1MG9n
         YXG0bc6hY2ba+8m2a9TNioyaDVgCmvkEfmrmXsFgkvd2ayAaLUaLYji7gOaQG+yPoIRz
         ezbTbNx+Yhn7dVeJSG7T9p/8udtOA720WHDfvRkBY1GsA5XFzCOhdrHEZqLM7POT36ER
         QXJO8JBTrZ2dHHb+vOQqH2tCnlfG8Jaae/cCLqLwSZijm1KQH+BNu0MWvTe0w2XWFZ3W
         55XZ4M91ptr36HtJemPivQq50fFkED4Yi9vf51m8lEZETIxKDlZvArbuWp8OgiaWaM8A
         dUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691768929; x=1692373729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LSHVIb9UFewOc6C0cD7YznG7qCPc2ebrFIqE79xMTg=;
        b=C9rrwJnKRaDG34kSMYPq52Sl4ISQy8QYzMDD4AFhuXcb5w1gc1ckE+59kcJnwLaVMG
         M2y5RRGl79Plf7UVOz1c3qto+PYNmFBxrgujhMqnITP+Qw4MisX6oaZRCXrwjnC3pDkB
         LvTrgpQ4KE8oEVWhglN4QaB6+YaCHjLs8L+Nj6vrYd/2MllSgUmqrHZhgYEjPF39ahlo
         3UIhL49BHtHe37TANN7BK+/FVX0xzFMScNfET1huRqwuCyZs0jRx8GOp+F2LNRG4v2n/
         N45LL4vDnEfu1HdqBaKrv7ZVi5cse3BR2Ds0fLgFm4ZtfZaXaekOSOhDm1tMbn/erc7h
         5NXA==
X-Gm-Message-State: AOJu0Yze2nPCLfSWafPiFrGjAPXWgZeA1dlmK9WCDXkDiEJvwM+TYQHw
	zC6JdfIZiiVs2uy+y0RzV4zM5OhMruythED6gVw8Rw==
X-Google-Smtp-Source: AGHT+IH+PqXwthH0SiAVCdPC/kJd+tpX6FmU5nDdAuZANyBiIUF8HIjq4B6xfmSYnVkkqcpA3zJiidcdcg8BAtwnS8o=
X-Received: by 2002:a05:622a:156:b0:403:ff6b:69b9 with SMTP id
 v22-20020a05622a015600b00403ff6b69b9mr177084qtw.13.1691768928950; Fri, 11 Aug
 2023 08:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230811073621.2874702-8-edumazet@google.com> <202308112211.xpcXWwEP-lkp@intel.com>
In-Reply-To: <202308112211.xpcXWwEP-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 11 Aug 2023 17:48:37 +0200
Message-ID: <CANn89i+f6vzEP13gX9FBw_Lkx5fPFLn7jPQ=6b7MRMW2S7xijA@mail.gmail.com>
Subject: Re: [PATCH v2 net-next 07/15] inet: move inet->mc_loop to inet->inet_frags
To: kernel test robot <lkp@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, oe-kbuild-all@lists.linux.dev, 
	Simon Horman <simon.horman@corigine.com>, Soheil Hassas Yeganeh <soheil@google.com>, netdev@vger.kernel.org, 
	eric.dumazet@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 4:11=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Eric,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/inet-=
introduce-inet-inet_flags/20230811-154157
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20230811073621.2874702-8-edumaze=
t%40google.com
> patch subject: [PATCH v2 net-next 07/15] inet: move inet->mc_loop to inet=
->inet_frags
> config: nios2-randconfig-r001-20230811 (https://download.01.org/0day-ci/a=
rchive/20230811/202308112211.xpcXWwEP-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230811/202308112211=
.xpcXWwEP-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308112211.xpcXWwEP-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    net/netfilter/ipvs/ip_vs_sync.c: In function 'set_mcast_loop':
> >> net/netfilter/ipvs/ip_vs_sync.c:1304:13: error: 'struct inet_sock' has=
 no member named 'mc_loop'
>     1304 |         inet->mc_loop =3D loop ? 1 : 0;
>          |             ^~
>
>
> vim +1304 net/netfilter/ipvs/ip_vs_sync.c

Oh right, thanks.

Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143C01862F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 21:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XPves1wt"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7bb4b7eb808so907038241.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 13:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702242339; x=1702847139; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wy/7JIgDHr+AOX+tkb0BNEATDAp5U47siWpf/cuRp9A=;
        b=XPves1wtVUh7GQfBvkUweCQsJ/AakSCu7iPpKXz0Gxx9HrBy9sx4ZSjZd5zQwKH70i
         sxZ9lK/d+xGWAg/WxPb1tcyqSC/dRb401gTqebShbZ7tkroVCwVPk9PjNGTHs3KZh+3h
         fgZEPKGPcJ15NdatNHcRog0Iqi5kkh7Zaq5WDF5JgIpAwTrB4e/omaLeINc3PnVusg8H
         Jzz/5faTl4Lj2REC7S4gDGa2X2GTeSCll5i/TRjjMXc3OHGbe1YzDSqVKjXjmrQA/sLn
         h39Fm1h1Z9ScLZDyvFaFsb6zMfFJgoTspo0A2/bdZA9xsWLW68NiR6vZJ5Du7OIgzVcI
         PFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702242339; x=1702847139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wy/7JIgDHr+AOX+tkb0BNEATDAp5U47siWpf/cuRp9A=;
        b=kvp8DX8oUG3c5Mk5zGzCM0XikbisNkHLZrJJxnG7Pfulbm0msgvA2P0coUNwlrj5y3
         phYLrhu+FKahv9XCIYlM3H5fgokcsOoo1f1NmrGuJIN5ayFnbyxSwb7YDFp6rlmCtQrk
         8D4qdFLrkaAiCp9ep7IWJaoODjMG0T6oV9JEQm7Lkod7FTvD1Hayb0C0vQPCJ2FFAYyl
         paDBenHGljdD87NOCiOhU0IWKUFvwvDskX/UOVEWt/q/64sI4sSLQUhJh301ftnZ0Ybl
         T9z75jqcctNdQZtetmPlxf4wUfeitXXh9HJn/JayIIetmn1R0c5x9onDo9l11CMSij1+
         WLGQ==
X-Gm-Message-State: AOJu0YxA+UFL8MuaqabW683NetqEFZI8rLxsANNnPDy31a8t/zOG/EmR
	v+xTGKrBCDygQpYiAiD4KAlMQE7lpEbCNYXLbtohAg==
X-Google-Smtp-Source: AGHT+IFT0ErSlXhkSNmybzhzjzMcovjnPe8KMF5aV4ti0PjFyzAuvpHcAdxIiuVv1MAbaMYlIfbFWhKkProaYS3VTrw=
X-Received: by 2002:a05:6122:458f:b0:4b2:c554:dfcc with SMTP id
 de15-20020a056122458f00b004b2c554dfccmr3013830vkb.27.1702242337369; Sun, 10
 Dec 2023 13:05:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312102313.zJHWVLAZ-lkp@intel.com> <182d28da-8822-4d2d-85fe-5a1843905eb1@gmail.com>
In-Reply-To: <182d28da-8822-4d2d-85fe-5a1843905eb1@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 10 Dec 2023 13:05:26 -0800
Message-ID: <CAHS8izMn0JhRkmvF1yEvk1iUdYmHNbxbs8GgO=0GX6Qq5uR80w@mail.gmail.com>
Subject: Re: [isilence:zc/rx-pp-provider 5/31] net/core/dev.c:2065: undefined
 reference to `gen_pool_for_each_chunk'
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 10, 2023 at 8:54=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>
> On 12/10/23 15:45, kernel test robot wrote:
> > tree:   https://github.com/isilence/linux zc/rx-pp-provider
> > head:   4b8de8977565096e38b6da993c68da6f2ef9b89c
> > commit: 161f99ad49ca48fa141161b409eac11a6b63c105 [5/31] netdev: support=
 binding dma-buf to netdevice
> > config: i386-randconfig-003-20231210 (https://download.01.org/0day-ci/a=
rchive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/reproduce)
>
> Ergh, I have no clue, why lkp thinks that it's a good idea to spam
> about someone's non-release repos, but just ignore it.
>

How do i enable this on my repos? I have branches on github I'd like
reports for:

https://github.com/mina/linux/branches


--=20
Thanks,
Mina

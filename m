Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF3F84A44
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 19:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707508714; cv=none; b=bHupTcPpBEcKwM0SOBcRF3fKYMgH6z+L2YCxX2BndyjEQ0QgJEc1gqqHG0ouRyZ4GsL4M1gSrvIO7bjXQpQCzQowMHwM85mj9BxyDDW50UbvnOGU5mwmIbChR+oUgBWsJj84RjQzndX68oPYoEY6kj5XX9Hf4OTNZRfzA0+w/Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707508714; c=relaxed/simple;
	bh=eD9EQcFDBNiBgcU5tvMZBRIekyRKjj9vzifDaj4xy+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfnjqJV7glFHzZN+9tRqC+OtiN3fybcISyUNvVE40yBHhf6FSNr6O/qugu5OuTmvfVh2ecTjktgxmfsMjxxPm9uyRZvVnBxVfP9OCgcpjO9vd29z3EwoLWbhnsv6i1NJUGVPJ15qVjQGnr6OfG/5Q3uhnv9/WWvVzPEYRYC/e1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q8vX4Igz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q8vX4Igz"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56037115bb8so31940a12.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 09 Feb 2024 11:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707508711; x=1708113511; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p20YnXv7NpCJx02QrzV6jlP0H9fDT2JyoFdNhx5bIEA=;
        b=q8vX4IgzP6A3DRThL1aiEEKJOIdlaFOduZosznr7OD2Ka5hLpb/yOoZnn1IO7tShPF
         lOQPW5yi1de52u4z7AVrrIkdm0Sztdu61qjMxdoxhiViJfFyGlxnXBktOTQm2e1K+YND
         aOsSTzY7+9rdBKFOJuGgL6vQ30RDPRfi3rRa9cJkWs6kBsYZ1tUsvjUYUGu/yHFjPavE
         0J8muAy12r5s+RrIxTndVchq6XTshfRiRvOrZaYeahcbnCGmPoVglDzz/jxKf3ryZXjC
         nfwEDlyG6/5Cjp1QzfsJQV7foZvYIdqLQB7js5bkof50KI+ksEHX4tTiBfmn6S5EYKAU
         4KFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707508711; x=1708113511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p20YnXv7NpCJx02QrzV6jlP0H9fDT2JyoFdNhx5bIEA=;
        b=KD9ZfkiPmrPTWsLIAQ/Jxvp8zNHV7lZ/Kwm+BZi+cUbwvBK2p1zkkyCF+bSmhaxoNu
         mEozbHINxvk7eyy75pQSdTVGna2d/gTFPRAxCsiJiw7JSziM1zRp72yViV357lSvhMZU
         oxRIijXiVtNn4BcNpm4pbaw44UTJTnpijn5U+jvVD1AQFZp+xvkBYV2fE4hlXCpUdNsV
         fMG62j4oVpC85FEn9duNJe50qQtBqpjq9ZXB+4CvVf/KzbsauvuW3qEhGUjMdbwRQNcs
         O8265xLBL0olpRfPqEl3Jf/NuDGLDMXcKpOMWS5UUwDfp+uwTLIOUWxX0J6Gf3VUAx9Z
         QVPA==
X-Gm-Message-State: AOJu0YwcnDcg6CugqzGtBh2dR7JwTcJQ6PHKKt/7RT4LHPds6LwM1eBu
	Ecc2zH/nSXTxCtgdoTcoe8vLjRGhFgT3abaePSnpXDJgZeYcX2Z9IZ9xeHO+EYCRQ0lFnSaR9cf
	JfK6ymveHX0IOXi+fjc87lfGnh9y2XtTY88B8
X-Google-Smtp-Source: AGHT+IGJN2AMdvjrJdhIoLmn1ZUADI/e7sMUkA35RQJWoOSTrSGAMPfObja6Fhu4Ifki9/iguSDWuW03WbCKF92s7v8=
X-Received: by 2002:a50:c30b:0:b0:561:207f:d089 with SMTP id
 a11-20020a50c30b000000b00561207fd089mr194005edb.6.1707508710608; Fri, 09 Feb
 2024 11:58:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240208141154.1131622-11-edumazet@google.com> <202402100218.Gmr6NGqc-lkp@intel.com>
In-Reply-To: <202402100218.Gmr6NGqc-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 9 Feb 2024 20:58:16 +0100
Message-ID: <CANn89iKPjqXu9EBHsGcvdpZmC7ZRFFt_aKixiP0=bXN9wRDs0g@mail.gmail.com>
Subject: Re: [PATCH v2 net-next 10/13] net: add netdev_set_operstate() helper
To: kernel test robot <lkp@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, 
	eric.dumazet@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 8:13=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Eric,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-a=
nnotate-data-races-around-dev-name_assign_type/20240208-222037
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20240208141154.1131622-11-edumaz=
et%40google.com
> patch subject: [PATCH v2 net-next 10/13] net: add netdev_set_operstate() =
helper
> config: sh-sh2007_defconfig (https://download.01.org/0day-ci/archive/2024=
0210/202402100218.Gmr6NGqc-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240210/202402100218.Gmr6NGqc-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402100218.Gmr6NGqc-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    sh4-linux-ld: net/core/rtnetlink.o: in function `set_operstate':
> >> net/core/rtnetlink.c:873:(.text+0x1140): undefined reference to `__cmp=
xchg_called_with_bad_pointer'
>    sh4-linux-ld: net/core/rtnetlink.o: in function `netdev_set_operstate'=
:
>    net/core/rtnetlink.c:855:(.text+0x16d0): undefined reference to `__cmp=
xchg_called_with_bad_pointer'
>

Ah right, there was also dev->operstate.

These old arches...

Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9D139AD3B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 22:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786400617; cv=pass; b=Ixu6Rflg7ClI81/zts3UhzDw76bI/eB118FfdeGrzkHgqqoUzuHqBbhtz8kS4M2S0NQwE10p77fsybFOKOP/oXriQlsPNQ1EwoSw4pUEUXAhYILLXTQ33IAsLuK4WOUhBvZGtt46taChp/MH5VmZxp+QUGtaoSVNpJv2BqGPHzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786400617; c=relaxed/simple;
	bh=WTIlZfm6gJQ4mviowkxHBhEgFTjDw5kq9NwWRimdm6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pmr7uTihoNPrmxmPDQZCptuxOX+j6KO5bcgJyisTWfERvyVmxj4rcv6udZFBuoZIN8F92SppUNAVfIUEZErNBIy/0Tq1B7P+yTEDwW37rP1Bu3JIg9DwagD/pqomloxyK1oyiMM9i9hXrnH+GYIPfjUydj0Nk7709xUPIE2+H+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VLH38dAS; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VLH38dAS"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b29599b81cso3076818e87.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 15:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786400613; cv=none;
        d=google.com; s=arc-20260327;
        b=FC9AaY90KAHYzeoCJ2bf3KjH2QHLio2K018C/xk0ZAn38SD3tcJJgJ0Ze5KdgZFY2p
         XqOQCtZO68/Rh2Or7165bHiJIFegQTyQaXu/mNsAZWtlRyQgnykrEuCFlFxStzcNOt6E
         jAl2DORASOyKbKn0/x3gTO5Tdyhkhc5KL9wnnYulaVsiXP0oCgV3p3idvMLb+VT6Bpgd
         m6r4e6K+f7KXZtoUSJkzyCl15vwlE7kFT8++Ev6Zkb7icY+RKWkwVhqbgXZMDbX5H5t8
         PxTpamPtVz0aemPzFi2ffFq4mFz6esZlNPWZGgRHifEFkZYYrvxQLDwMaIZTfJTDdZIF
         Fv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zae1kDqiRfUCwneu1mLjo8ITZyLtnW38KmqiV/IWQAM=;
        fh=OSuvEzlA7ZiFTcEGaXwz3k4cKimo+4jonPzLq2bpzEc=;
        b=aO4ApgTLoyyyjfo0Sb3tyEftqjYe6bLzzkxTvw0y6o4TcYXanmH73eIUdvIDjLsvPY
         h1t+e7adWGd8eCp0KWEmPdn6IwLxeSfy+iXEYNKn4ZVlNr3gEgY0Uwys4hWJZg64xXoo
         9uN+2c810tuybT5eJy36SFB7WDoaEO6D3inAnNS7UavTNOVXmMppQd/mQaC87CjVSeu6
         nLQhBlLW5OPljGFozEitmLi0oIQ1q3jliR3OGyli42NBrgf9mpDMieb4nSZsfSBrTubR
         gdG1REbLJtkZHbpKXOU3OqLCqgloFLNUUC8R7EK6PHl9XiFUU8/xWMHcDNSx2V36Ul3F
         3LbA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786400613; x=1787005413; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zae1kDqiRfUCwneu1mLjo8ITZyLtnW38KmqiV/IWQAM=;
        b=VLH38dASGxhxlWAYxWzSwRZvVjQW50N3DwY+9B5V8Im9yG2gJnjRfSLXlrNkhLWg9F
         z/WI+BIflLVaNpUJ/cIBSAgfyo+5J6QLQ2pUU9cNTRb9IQyLiF7yBtrnKCFrOfGO55dW
         9yGxkTtYnkjA3EECVDrhiD1PJHlCIMzLVywSJYpshLOilCCZBPdH2jsjJ2ZBUh39k2cL
         9jEIdIA1Jts9/rcdM5+N58ooeJn/qYK7f1TUV+hspifyk96mWBVCRKmk3B6HzpCwF6WQ
         3YVDJsL93RDBt3MDH6ov3Ds8YXg3EsVgkf2Jo8w+WqDOvlT3cTU0tPAsZLK2QC1iU5/Y
         CkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786400613; x=1787005413;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zae1kDqiRfUCwneu1mLjo8ITZyLtnW38KmqiV/IWQAM=;
        b=EVX+ErBYVm6u9KrJIzAcsHtCxPCopeGMF6iA5h6o4+wbFWE2W3O1T7ctGqkQ2i8reE
         /iXPI4Qe/1ffwJ1IvRQ8h2Iqt2wEwSy+Xxukgkc9Kh5DMOlDL1SwQ28byvdgzpPVLpeP
         FoGB0SSv9lsDhVJwESUJ0JLBTnG3lCQ6g+93JXsES49d51F33fWfPz6GSGLrvvaLEeNM
         5CR+AzcZFFLKaXOT+qYlhFnVEfdI4g7XL1E4C1jLLpTiOa9G/RLXQ56X9s7EXAyalhhC
         0zsjH4zukDGd5WNefU2tldhcw8W4Bp4mgE+VsCFe4ljpG5pQKPm+fdIPXjODU/VijOxd
         sOVg==
X-Forwarded-Encrypted: i=1; AHgh+RrvGO79bH5Sokn7cLoSPIg9q4VrZ9fR8PNDIrSlyXY6AiVveuv3JKfmV1RMKN5TTV9fS2Yr7NICZuDuF8wP@lists.linux.dev
X-Gm-Message-State: AOJu0YzXFPoqukWdn4fSGGheVGPxIfUvdyL5A4ZEIXaJHlYNDAV8xZws
	WsIdfQDeqk524sQFw9qZlKY/u4A4wH/Atpie2O9VgC0trI+7Q0iYxTGlY677VmRl/86KcLryp3R
	BHVXEUuN84QiAlsRgxNKumCQi7ZlOSHZEByDsq+yBMyWB5jJwpdfj1c+acNw=
X-Gm-Gg: AR+sD10Gkvw4hx0vtqvofb9mcoP2QUAv0ylp1MPvYx4mCwWYqz96sfi3eSahdgGUhxL
	sWuGcBwS019BR1WMO29H/7dQc/YoJIxCLOA/tQKzNKV/XTGRIp7ejZScqZjbyNOhb7MemjikN70
	5LTLA3j3nm7ibqGDYCRQenUkP40S7bO17u9OcC5TwNMQZw9iSyvFgu33E4rBvj6L+fyZ7NiZUOK
	93tJ9ZbSVa8Xo80OcsQCMwe7a6dc6Kvwo36yZQXGFOT1EmfWvIzpfw+FLyAn9P9mffZLg+j8kep
	/rI6S3msS5pb2xlu56UAuO60wvVzH3nti6wPSnD7VGy+cJKPA+FtqdkLUPcXTUzmxf5upfttukp
	sIIsD0+6B/UIbn2kOHolVgsV7IygdBqY=
X-Received: by 2002:a05:6512:3a95:b0:5b4:475f:c322 with SMTP id
 2adb3069b0e04-5b4475fc632mr69899e87.43.1786400613111; Mon, 10 Aug 2026
 15:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202608101002.AO7X3ZCH-lkp@intel.com>
In-Reply-To: <202608101002.AO7X3ZCH-lkp@intel.com>
From: Willem de Bruijn <willemb@google.com>
Date: Mon, 10 Aug 2026 18:22:56 -0400
X-Gm-Features: AUfX_myyfqWI4vcZBmubdnq0bIq53zqt4_43e-mzmzqgftmZgbSkTW6Zrv03fZs
Message-ID: <CA+FuTSfy1bOw3QAB+5wXzdHaXAARNvUYS8nNqb_waz6UfYHOcQ@mail.gmail.com>
Subject: Re: [linux-next:master 4018/13846] drivers/net/tun.c:2375:24: sparse:
 sparse: cast to non-scalar
To: kernel test robot <lkp@intel.com>
Cc: Eric Dumazet <edumazet@google.com>, oe-kbuild-all@lists.linux.dev, 
	Paolo Abeni <pabeni@redhat.com>, Kuniyuki Iwashima <kuniyu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 11:33=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   6b8c8af514d739d0335f5579b585e02babe8a727
> commit: 23dad2d088dfc82cae1f5a936f8ff7ffebb38dd9 [4018/13846] tun: no lon=
ger rely on RTNL in tun_fill_info()
> config: alpha-randconfig-r134-20260810 (https://download.01.org/0day-ci/a=
rchive/20260810/202608101002.AO7X3ZCH-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 14.3.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260810/202608101002.AO7X3ZCH-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608101002.AO7X3ZCH-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/net/tun.c:2375:24: sparse: sparse: cast to non-scalar
> >> drivers/net/tun.c:2375:24: sparse: sparse: cast from non-scalar
>    drivers/net/tun.c:2376:24: sparse: sparse: cast to non-scalar
>    drivers/net/tun.c:2376:24: sparse: sparse: cast from non-scalar
>
> vim +2375 drivers/net/tun.c
>
>   2370
>   2371  static int tun_fill_info(struct sk_buff *skb, const struct net_de=
vice *dev)
>   2372  {
>   2373          const struct tun_struct *tun =3D netdev_priv(dev);
>   2374          unsigned int flags =3D READ_ONCE(tun->flags);
> > 2375          kuid_t owner =3D READ_ONCE(tun->owner);

I guess this would need to be owner.val and group.val to silence this
warning. Both from and to arguments.

That approach would not improve readability.

Types:

typedef struct {
        uid_t val;
} kuid_t;

typedef struct {
        gid_t val;
} kgid_t;

Whatever we choose to do (if anything), probably also applies to sk_uid:

static inline kuid_t sk_uid(const struct sock *sk)
{
        /* Paired with WRITE_ONCE() in sockfs_setattr() */
        return READ_ONCE(sk->sk_uid);
}

Another helper, make_kuid, uses a KUIDT_INIT wrapper to cast to the struct =
type.

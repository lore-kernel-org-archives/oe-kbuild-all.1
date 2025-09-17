Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBD12FB0A7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 18:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758132145; cv=none; b=pkx7oT8s9+O/Cff1q/DmQd8krLwgdyHgrFIS1DlGNLfRwhp9re0liFOyp8bnHwNFCLAGRjOdy2Nu5py04HJKW1QbtgFT9QviyJFgr0Vd+MmeBz7a2fao6KV2dqxQXeW+H2RQM2RL0stGkkGjfp0xyhXd0Qg5KfPubQp1gmPKBsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758132145; c=relaxed/simple;
	bh=c45IjX5cJSPCE8t6J9t1ECSHcRcCXtq2ZmI6fywkbX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cqt6oOBcTbq0U2XHuPpjmAPhXRlUonvyPab1JkYBNnOJUtt25i2RPHxnrWYqpBLmFTg+5nO4xIGoJzNcYrtAz64E1TvpuHT1cYh4UsXaLFlueZ9/CAHgN1RrIB97HLkP13kCKZFBfskFocDvBo01FSeMgqAAXsH+70rNO4e85sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Gvbkw+1g; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Gvbkw+1g"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b54a2ab01ffso45262a12.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 11:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1758132143; x=1758736943; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUM77tLsoDUjAibRwyKv5SQ08Xu0AqfeFVlC0hwSnKI=;
        b=Gvbkw+1gNtGDBOrFY4a+URqh9Hf3I8KUqsfcKP4KaxyOLkFDw+R7HT+PaP/f9wGR7w
         X9c3MRKsd3TGBJ8g3lNFkbK86bjMEKoCwnLONd2drd4GRabzrMBQbeqtQ6ZsYyJnqgpU
         vUF2Mkfn6JXruRSqAGjnoXHveibn2HcFa6Mie8Jg53QlkHty4Z+zPtlAx5zSqbTIDmVL
         Re12dWwdzOWPSBxN/jiSiZhDEhZ1svULECL4Ei+GFFMVV3H2VuaRXqe/DD8Wolixl6BH
         Ph75B8bmYOhIakKVl8CLSj/tmTgyWDDSP38PqHvj88BerQWdAi6yNM7F30gFwq9Hxhh8
         18Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758132143; x=1758736943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUM77tLsoDUjAibRwyKv5SQ08Xu0AqfeFVlC0hwSnKI=;
        b=v2CjrLaocYbTP1Tbzebf519F5z7dXffJRio/w0Cjw7qfyFBlpGZCodnTcUmRa+tGD2
         lFMvcYWw7Lczbz8GLgRHTEn5N0iJNQaWmxlW8fbJJR8C0QTWla1dSq/xnxRmSM9pKglb
         ctYr2iJReRst6ufgPJFX+X8U80GnkrO1jwF51MtsS9QbgddYiW5zAK0RdhuZP44YMtrV
         c4Evpn42maSCsGQN6pwEvOQOC7SNWCoMEzY+YMjEcTWxS1dAzBD/9NBUuhK5miopPi/G
         VizBD3BXhw6kP5NRtV61ykaEZbmuqXnKpft+syEj4HZxbR8BPWcWVy4LHBuYH/hQ0rsZ
         MUBA==
X-Gm-Message-State: AOJu0YwGfONFrUpiezlTMez1Z42E7MLJ15gjb2vDH8zqnSiuajson7BO
	Mc7EbCgk/2NB0+ZpnROAISLNANetN5/wpaZm0G0khed0kExcLBLqsRX2E0zzbUKTj/YcW8hJ9xk
	cMXgifTADpd2C4bxtsoSSO0aS4eZt+trDfDC7idYh
X-Gm-Gg: ASbGncvFogfXKh1mIOeRLYltJccSv7MYCxebqpeNzottRleAKUmweA5taN81kVPTPRk
	T31kjzvGXJA/dz+53E72jn1zALFdUZcNcQRFJDXJtea+xxyBbYTXjb+NVOWKKz/H3YpaljGqdRz
	6kjCB6/XILfTuPekMM5oD5rioMrl7KRm3Zrngu7Orr6LIxDfUjzRZmA6vzzRqLg6h0LIwBNPfI7
	Ehjthw=
X-Google-Smtp-Source: AGHT+IHS8hOdCDVgiuUdP/vRW/9oLFhnIxkpzATPwO934ELt+GqvfVJnYqe1LADwkFmuGaSy/4pUKM2P+XlmDtuGwHY=
X-Received: by 2002:a17:90b:4a90:b0:32a:e706:b7b6 with SMTP id
 98e67ed59e1d1-32ee3ecfc30mr3766058a91.11.1758132142492; Wed, 17 Sep 2025
 11:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202509171951.rXOi8Oez-lkp@intel.com>
In-Reply-To: <202509171951.rXOi8Oez-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 17 Sep 2025 14:02:09 -0400
X-Gm-Features: AS18NWAYbfQp7PVjmPX7J13L8lVmlULdlb1F4ZsAfSLFrxqxS41iXrPrFiQ_TeQ
Message-ID: <CAHC9VhSNoAP98XnBXz681-G-f08ycZULhTZRS6t37Lg1P6qUQA@mail.gmail.com>
Subject: Re: [pcmoore-lsm:working-lsm_init_rework 40/41] security/lsm_init.c:516:undefined
 reference to `securityfs_init'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Casey Schaufler <casey@schaufler-ca.com>, 
	John Johansen <john.johhansen@canonical.com>, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 7:57=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git w=
orking-lsm_init_rework
> head:   8ea7358ca612bb85eef9179ae746edeb5f1dc9ac
> commit: bf19c9b17d8d2f27e2031822337e8d137b2c6224 [40/41] lsm: consolidate=
 all of the LSM framework initcalls
> config: x86_64-randconfig-003-20250917 (https://download.01.org/0day-ci/a=
rchive/20250917/202509171951.rXOi8Oez-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250917/202509171951.rXOi8Oez-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509171951.rXOi8Oez-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    ld: security/lsm_init.o: in function `security_initcall_core':
> >> security/lsm_init.c:516:(.init.text+0x101b): undefined reference to `s=
ecurityfs_init'
>
>
> vim +516 security/lsm_init.c
>
>    508
>    509  /**
>    510   * security_initcall_core - Run the LSM core initcalls
>    511   */
>    512  static int __init security_initcall_core(void)
>    513  {
>    514          int rc_sfs, rc_lsm;
>    515
>  > 516          rc_sfs =3D securityfs_init();
>    517          rc_lsm =3D lsm_initcall(core);
>    518
>    519          return (rc_sfs ? rc_sfs : rc_lsm);
>    520  }
>    521  core_initcall(security_initcall_core);
>    522
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Fixed in the lsm/working-lsm_init_rework branch in case anyone wants
to take a look.  However, as the fix really doesn't have anything to
do with the IMA/EVM patch, I'll wait to repost the patchset until Mimi
has a chance to look at the IMA/EVM patch from Roberto.

--=20
paul-moore.com

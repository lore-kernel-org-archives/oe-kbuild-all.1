Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B74122A4D8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 18:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758132092; cv=none; b=XCrHfo0mLX19UtxH/LbXa9LmuVFG7dc+bT/Q4QZezjZfZ64MbN6duXp03LqcQ2cxmVjOG3IS1tKhLDPCc+bBrpRKTOVr7Pf8Y3lo6qn84f0bOr0Psl8sUm6iIOnF/Wq54Pxi2SBTEbUD5Xum5iPF35M7AkqO8cGsPo59ym0w9Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758132092; c=relaxed/simple;
	bh=c45IjX5cJSPCE8t6J9t1ECSHcRcCXtq2ZmI6fywkbX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PanxAXvTFu/h35KtAdOFiZutrcHf77knA4YHJjJ7chf/wkVV1rG3gUz0pyYsl8e42nkf/Qcklj/yLMGX2HjTpHX2aFaEvqzQsowWrkqb4AEdW0BEGCQdkahmWeo+JQ2Ukd+DbjO+rbwIFXIEL3GqIvIHrvhP17OtP2VPin8SWYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Vvcww//X; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Vvcww//X"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32e1c8223d3so40650a91.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 11:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1758132089; x=1758736889; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUM77tLsoDUjAibRwyKv5SQ08Xu0AqfeFVlC0hwSnKI=;
        b=Vvcww//Xp6NJT8zRpeMhPLprkLZkSaT6XXZZPwcM/Ktj8i/xxqY+46gbpICxxbskRw
         FipSPQjIbaqW17bvHhk4hrn9oonCWTuE7wGe42H17kE4TpiiYPuRL8vAdH5b3CPhupBP
         FGRq7Flj88tYczrBRto7+z+z1cQlvNx0yegAQ07WWND00QusKwgUy+tyhN1RfpvVgG2F
         ZeiFrUCxAtfHXsEirZHS/WobKSzerwiDQ8jMNqZPEjSEWWvtpg3HgsaPyuvqgPiQn0r8
         3y7ocn45deLq4bzx6BWy3jiGBezYLZdKxZrvQL6/nMIuOzDOTGNCy300AdbBcaP0qE3U
         AWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758132089; x=1758736889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUM77tLsoDUjAibRwyKv5SQ08Xu0AqfeFVlC0hwSnKI=;
        b=X8JpMnZKGgAbtYrDkQu98U40JnLa0bj+9w5q1rMmnRIPbkABx+Svc0r6/BiOBomz6M
         4TLeEt/rCc4lOJ9sHUFbdpqsEDjj801cauOfB43mRvCJisbKM53WwZ/HQKN4OHBuJhkT
         K9ejMrLB2W/ZPs5IeErM2bf3nFd7HL9RUJz3DBYsj1N5cKfjOsQg+a/PGzIQycayECJO
         dMthleLO5694+SySTsRduPYx29AOppKjlEr8J7CccoNWykFWPRL1jn7DaD8LOKYbcbew
         OGPYB00I26V9FW/tMASwxzVWtUo0D5fejwF1bUd33kPEHoBAB9XGWy/VYKk1DwcbcQsN
         vhnQ==
X-Gm-Message-State: AOJu0Yy11F70kzxdJb3fMSN1xwnk3Dl/AMPyA/CCnle7lC55QGu6/GCg
	B/aJVRnb14ZB6r1L+33dTaF9i7KYGoT+WJklZeG/6FsteQ/36wLmnFHOhdv7MukUnLpQI2O+cgf
	+7mHjKfMxwE5oT7wzrGnQ1X9yXzQz3zOYUdiDyPjLtAr/YGiKhNYC/g==
X-Gm-Gg: ASbGncs6TUaJwiqWTNT/XJ6r2j7Z0DanxhVYo6NVxVEKo+ryiNb4qc/3eNh520NeI81
	k7bpWnU2FKwrY52HHb1Fl2Izn0YPHCrootXVNoW/R8WgH4lbpjx9kCB2YJPmg6brVbFMR+x2Hs1
	CSd1FweXyLAWyTGI2CHc14Qp9cOMCBzBzDhjzN4EEBl4hU0LoqzCR0yWa7Y1BZdb+8C/+MQ8xLq
	T5gt6w=
X-Google-Smtp-Source: AGHT+IFoHijaP0gepq8w27vVNUQ5JM688HlMNmwc5dW1iW8CvmOm2BMveu7L+vY/mH9dbMJCVGkHqX14xRj4JvvZvf4=
X-Received: by 2002:a17:90b:4cc3:b0:32e:7270:94a4 with SMTP id
 98e67ed59e1d1-32ee3ebed73mr3871046a91.14.1758132089233; Wed, 17 Sep 2025
 11:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202509171951.rXOi8Oez-lkp@intel.com>
In-Reply-To: <202509171951.rXOi8Oez-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 17 Sep 2025 14:01:17 -0400
X-Gm-Features: AS18NWD3IXWbrTsORXNjbm2hCTuqOOvIpf4K8RmoY7qzAjiYxrcd7d2bWSTEHAs
Message-ID: <CAHC9VhTBvoa+N0GnnrNjhbP-RNUS4aGKrWxWdTN0YcjJz-Fq6w@mail.gmail.com>
Subject: Re: [pcmoore-lsm:working-lsm_init_rework 40/41] security/lsm_init.c:516:undefined
 reference to `securityfs_init'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Casey Schaufler <casey@schaufler-ca.com>, 
	John Johansen <john.johhansen@canonical.com>
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

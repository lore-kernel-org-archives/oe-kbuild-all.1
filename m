Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F2D2FF659
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120731; cv=none; b=Rhvjx+LY8hiQcmuAqYicxB7iJQm6Xqr0lLHArt3OD+ebMgof83vSD3H2pOMqdZZf8Nnca0PmFM5CGJ6a6SwejE34z54Z7z604JanVHLK/HAQEBRpnRbxcJnM5/FNBCPhLOzXVrz1lymsSVzJIcKOQuMIUb3t8C5rSQC6kcegjxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120731; c=relaxed/simple;
	bh=2EhaIZ9w4ACSPgJE/JDVN7B1Apmr5NN898dqYdmjCEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iafP8ritdVTBKetd8ZA/7aAzlKqFhpTYeYiZm+2/FKCa4UzRO5YEVRThjIyBBB1BcCSJcOolLTjlXkQ0UKy3wFzto+t9kxbLcCdHWHQRSYvHey518Wjt7O5pbIZzfOO/qXF2veN+cgHVdqz1fkkVwaK/5irfBSDtcEzsB3B8Ff0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hFLwukb/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hFLwukb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763120729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wz9hDAVJgc4sXEislEl+a9GGGR5Wr0YxsAFgHQX0A+4=;
	b=hFLwukb/f2gdcNhm2Z3e7eeMkG7dxAHazrCZ7y/hOITavsdRENkHRDRBk48FO44ML4Piyl
	WxFICFXd4bsXoBrMSI/avTMmQI3yZYOibAYiVso+kJ45etitzB9TdAL0yJTgIZdoGQ7c47
	nhgCagUjxSqpgNxJt6p3UaXEwRESKwU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-aTpY_beiPuCG9MKTh5v63g-1; Fri, 14 Nov 2025 06:45:25 -0500
X-MC-Unique: aTpY_beiPuCG9MKTh5v63g-1
X-Mimecast-MFC-AGG-ID: aTpY_beiPuCG9MKTh5v63g_1763120725
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b7343d2a0fbso245641266b.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 03:45:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120724; x=1763725524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wz9hDAVJgc4sXEislEl+a9GGGR5Wr0YxsAFgHQX0A+4=;
        b=odxE4aUl8mjINiueU3BZ729Xfq2i2OPNdtAmR5UxXCzOUozJMo1CjBWXSMWAanaZU5
         MMxR8ijj8OFjvmnk33JB3JeYTkMhajAxZQaG4GDlJRfJwxV9FmE9q2kV4ftjsA9UUXdy
         i3/R9vaVAfS8XNTp4PfFIiD+TYo27cYvhqu7OZogbHSYrlvKD6yfkazX5cNSh/2Wkcxs
         IJNpa6yhdP/8vQhWIXIBf3Z2AuYP3Q/VIZhyYTKad9XVD2Eb5qoUFh2BMQuk1Plyh6oA
         ru5Sz/mnjM5eS0ZJd3wMy3bllvE0i8aicsMyqCkRwsF8UKGiLRoY5sCWpybGDg/5dm2x
         FH2g==
X-Forwarded-Encrypted: i=1; AJvYcCW2I4VtzMlSCCeX7MFI0Cx0SRaNiEjP53m2qOtS9faLnt6jrURTN2Li3VTd++AXlAqG+63+5ZBOgs+JhCCW@lists.linux.dev
X-Gm-Message-State: AOJu0YwhNBTMmdWaNg4+1r/F481ZV68A7oZ8ZF1In5Hz+O3fxcBCW1zY
	TCEPXQSRYlJoqfkOzfjjLooAhEQOMr5+sv/kO6b4REvfEWkUoTT+H8P7XrAc2ejaJ3P5ixuInt5
	RX7jijehH1f1gnyBMKgtox8/ZyGNypj9W4HboCvYyeE9SOYn+dDx/Qa5A8bvsdtP5QkR6ofxlru
	Vmm5X2h/aGyaRkkeVMPkSVwPChk4tqY7OFLD3JVs1KFw==
X-Gm-Gg: ASbGncsXrceoCc2y2siCjIDOw3PgnR8c4zaeV1CpkCgQ6OBGFbVYMr0/n5kMzYEd5l8
	7EnnAfGvCVO44SDfvmdhp/6t7zbMw51atSqFevpgZDCbYaVfAJqRwpcZS+vYTvjXD6FCl8Vhoan
	BJaGO0Jb/w1/X7LDHZ8Wj2aVQUJUhAHDCdKptjEglTbYCh+Yoh4Y7E+C/Au73aazGIsn7zkfIvq
	CYjBwFvkLn8ajfuTrXA1uo5Tlo=
X-Received: by 2002:a17:907:6e8b:b0:b73:4c5e:eb5f with SMTP id a640c23a62f3a-b7367bad2b5mr266197766b.37.1763120724515;
        Fri, 14 Nov 2025 03:45:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhysit7cw6JvEBGnwx/vAv9DTICTw5akmL7NNUObAtMOylvilTtqMpwtvLzStE93wkJr+/iNd12njknnEiKKA=
X-Received: by 2002:a17:907:6e8b:b0:b73:4c5e:eb5f with SMTP id
 a640c23a62f3a-b7367bad2b5mr266194666b.37.1763120724118; Fri, 14 Nov 2025
 03:45:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <589b485078a65c766bcdee2fd9881c540813f8c5.1763036807.git.rrobaina@redhat.com>
 <202511141355.QCbxBTw0-lkp@intel.com>
In-Reply-To: <202511141355.QCbxBTw0-lkp@intel.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Fri, 14 Nov 2025 08:45:11 -0300
X-Gm-Features: AWmQ_blzCXTg_QdB4MFUJRLnLugcHhca6haiFQAeZgT-CG7usEbb896bZ-Sef5M
Message-ID: <CAABTaaBceDLf2XSEi8H=2_swcoAk0oj8smOPyFkPWud2QzVnsg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] audit: add audit_log_nf_skb helper function
To: kernel test robot <lkp@intel.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	oe-kbuild-all@lists.linux.dev, paul@paul-moore.com, eparis@redhat.com, 
	fw@strlen.de, pablo@netfilter.org, kadlec@netfilter.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cm4WgWTjT4E0UE9UbtLiaEjmXKzrNNIDv-vCqlOL0LU_1763120725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear reviewers,

I missed that unused variable, please disregard this version. I'm
submitting an updated one right away.

On Fri, Nov 14, 2025 at 3:48=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Ricardo,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on pcmoore-audit/next]
> [also build test WARNING on netfilter-nf/main nf-next/master linus/master=
 v6.18-rc5 next-20251113]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Robaina/au=
dit-include-source-and-destination-ports-to-NETFILTER_PKT/20251113-223721
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git=
 next
> patch link:    https://lore.kernel.org/r/589b485078a65c766bcdee2fd9881c54=
0813f8c5.1763036807.git.rrobaina%40redhat.com
> patch subject: [PATCH v6 1/2] audit: add audit_log_nf_skb helper function
> config: arm-randconfig-002-20251114 (https://download.01.org/0day-ci/arch=
ive/20251114/202511141355.QCbxBTw0-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251114/202511141355.QCbxBTw0-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511141355.QCbxBTw0-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    net/netfilter/xt_AUDIT.c: In function 'audit_tg':
> >> net/netfilter/xt_AUDIT.c:35:13: warning: unused variable 'fam' [-Wunus=
ed-variable]
>       35 |         int fam =3D -1;
>          |             ^~~
>
>
> vim +/fam +35 net/netfilter/xt_AUDIT.c
>
> 43f393caec0362a Thomas Graf        2011-01-16  30
> 43f393caec0362a Thomas Graf        2011-01-16  31  static unsigned int
> 43f393caec0362a Thomas Graf        2011-01-16  32  audit_tg(struct sk_buf=
f *skb, const struct xt_action_param *par)
> 43f393caec0362a Thomas Graf        2011-01-16  33  {
> 43f393caec0362a Thomas Graf        2011-01-16  34       struct audit_buff=
er *ab;
> 2173c519d5e912a Richard Guy Briggs 2017-05-02 @35       int fam =3D -1;
> 43f393caec0362a Thomas Graf        2011-01-16  36
> f7859590d976148 Richard Guy Briggs 2018-06-05  37       if (audit_enabled=
 =3D=3D AUDIT_OFF)
> ed018fa4dfc3d26 Gao feng           2013-03-04  38               goto erro=
ut;
> 43f393caec0362a Thomas Graf        2011-01-16  39       ab =3D audit_log_=
start(NULL, GFP_ATOMIC, AUDIT_NETFILTER_PKT);
> 43f393caec0362a Thomas Graf        2011-01-16  40       if (ab =3D=3D NUL=
L)
> 43f393caec0362a Thomas Graf        2011-01-16  41               goto erro=
ut;
> 43f393caec0362a Thomas Graf        2011-01-16  42
> 43f393caec0362a Thomas Graf        2011-01-16  43       audit_log_format(=
ab, "mark=3D%#x", skb->mark);
> 43f393caec0362a Thomas Graf        2011-01-16  44
> 832662a8b1d3d70 Ricardo Robaina    2025-11-13  45       audit_log_nf_skb(=
ab, skb, xt_family(par));
> 131ad62d8fc06d9 Mr Dash Four       2011-06-30  46
> 43f393caec0362a Thomas Graf        2011-01-16  47       audit_log_end(ab)=
;
> 43f393caec0362a Thomas Graf        2011-01-16  48
> 43f393caec0362a Thomas Graf        2011-01-16  49  errout:
> 43f393caec0362a Thomas Graf        2011-01-16  50       return XT_CONTINU=
E;
> 43f393caec0362a Thomas Graf        2011-01-16  51  }
> 43f393caec0362a Thomas Graf        2011-01-16  52
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>


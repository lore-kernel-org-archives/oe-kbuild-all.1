Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220EE2DF13B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777744455; cv=pass; b=QfXqj4GKhyGYKSOdvgZTciauf+EWTqir6x12VHDQGwaWY9WxQA+e+qMnwDiADME6yDOe7+DzpCck0/PPaTGKGHkMgKrmn2CHowUIPDI/gTZp/Yk32xL7kVYLs52j+I1mL0GS9qPiWQfSilpbvfEQyrSx4+JbhVfBy0e2Lf+Q4CA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777744455; c=relaxed/simple;
	bh=QDrbfDAXOOnypvZy26/N7cuw26NME2IlMJKn5zQb9fA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oe8iYgR2kB+fsQKPN8Hyuhikwm7AowtAX1bgcZY257M7RUvMn3ZSL7/cl5sE+s1X4UIJHpKGFXKZVdZI1CTojOfViiizmJdok/Olg8NsVfoGC5qDbhr4CzTX3LHQlHdNT6hOWAEAbPKEESmENUCXM+0Wkta1jbfUWQ8ZZ+mcjuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m3oAwz9O; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m3oAwz9O"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12e332315a8so1087152c88.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 02 May 2026 10:54:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777744452; cv=none;
        d=google.com; s=arc-20240605;
        b=VC6Nr6z5X6v0hEogcJTWpbj2NbCApM4iuEXHMVueJzInmYOA+lkzB5iVI1SNB08Ah9
         mhGLRU+VR5dt7wSWCHjXKYd7AbjhcRNdc8ZI9hkO6IxZ0koJZ59UgzUyJuFIohe9rltW
         FQ1G2Bv0QhNLzwQHBnCFQusxifNmLIm1BXA1zm39Y4/5kWBB8ta3BUqBg4ZrcB57mtzL
         bcUilTNxwUOcBIxPrOidbAJw9hd9VTJCM5NPQhrkWlxZ58cAFWqwr2mPPolXQxbO9pEj
         6LZqGzLzhyphbG/weJ7/teXCUqdkcvDC/ma16KVCl7lQ9sOOrvODXNWO+3lborgu6TyR
         yvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dd3SXfdo7HTpUts7GZf8WkSWOn5DNHYOt9FOiijtIO4=;
        fh=w4ATK5v7FDZmg9CfhcjmGjVccfFvIODKqeMYRrxy4to=;
        b=gHA4aLIdJSEh15b6pJ901Oed9OPuN1dQoyNDApa1Rkz5Xo0BLvBwvAA50Mld3syS1s
         GB6Ol0p2vUcQRDh3XiraGYdaxTXEvcW3YqvMfv4HN8GU7GmZUkSPlpSd9/ZtjqmMJxSw
         aFN46M75m7B4Ni7NrSt1VpTQVt9eS51Y0N/V+A/UPWvboc3fa/3BvSHTXT8AKH+Pqv9g
         OW4MENLdh9HxbxovyxfQQ+EzNCnOshQCbRSRuyVyAMsqnrjvd+ZC1nzjN6Hy0wxGiIiy
         wOKXqECXgw7G2t0cCFUOol5k/UO9q80T2oWh0j+/Cjly9J1/AlmrLt9dFaxBLJZksKDP
         Htuw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777744452; x=1778349252; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dd3SXfdo7HTpUts7GZf8WkSWOn5DNHYOt9FOiijtIO4=;
        b=m3oAwz9OtN3ew0heCGWze4nydeM4Pfs3NYxfulI4aPTzQgS/pKhD7zxQ7Hbr1m/JSg
         +96kL+BedWKB/wGMNk9X1CxP1cD8s5dkj9aApqbdyHbQz6F0oknhtIL2lUQS/EOdSfVg
         kuncBn6GgnEtUOxvdeCzoKxMR08yrAbHjtS8MBf9wwAhBPdNwE2zdgOHqsBQFF2JKlM+
         xqo8U/Il+yMwiYc+wRMoseksNZfG6NaDod2O19LEwQujPXRSpAlOXn8UFDrDRAlF0QCW
         m1VnCrv4l1cmHZNHafzOS4x0a0vMm8G+Txq/73UpcAuNEr0lhpygrad4SiB9eL/NCbk+
         42Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777744452; x=1778349252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dd3SXfdo7HTpUts7GZf8WkSWOn5DNHYOt9FOiijtIO4=;
        b=XJBZTbV6pEE95Gxe/GhMJS0r4xj6EyHVdybpucgUB/tU/Y9TVU+uCE8jIpCa8HcxP/
         GQnma+9lxeYYJ1CYwfHxhWD/b9OwdcRmlD80KUz8ingRIAldDnW7RrLahpKIo7sv7+K0
         XXHuyafyT9oXbetUWW7HUGlWgMhO/XR6Kg/dy+qb0hgBOAr2MECcowbD+WSuD/QvTuOU
         ANnT73imKpVauj5IAuzsCPBQBcT2gi9VKvvmA8QvRNkIR8pfXGPTECn5UsrocajDY4C5
         29ZeJptiKk9t+cXT7ukccZ2+X8qCfPDgP3HgccBA9iLZNTvP/UcYPqvNlk3M8CnuTT2B
         Nhag==
X-Gm-Message-State: AOJu0YwmA1RC5gkTlb5OChElS9pSof9HSyav3strVki1NdEiwIgrQ9pw
	e+ShDAQVzsEmmefYzvu7kiZDIt1flJZfo08vB43N6MVLRfmCDQjDyr7dk6j0kv1Bv/841gpU6Rm
	GB5TriMADM9jKc8F/52BXSfsYRYOHLf1EST7YQDV+GqdlIcfxEG4GGpJWohwRHg==
X-Gm-Gg: AeBDies6ehZasLqMFHR+B2eAqUeJVKBweb3zA2e5ZuWlFC3PhlpjPfyY7lBAkfqc/WD
	uvmu0VNK7Mh5S8bU1QyK4TpfhvXTLGBcXVLsHV6i3VLSPm9k0HuqRLMxSMUIIcBmYV11C/vsytN
	e6dpV1cOOpsvRgs5uZtoKICZeqHWtOH4VZL7L0iExs8ceaAyhzlzefKodlFX1VfL+pNN/knw5bF
	Ew8F6293fRiy3MVjFR1LD/OzZhhjY6I+XIbb+n374xatQyVpqSLf6WuLAuv+QcEiOyJqXl6T+za
	DTQYtJxrThunYm0NjzEchGUNrxQlbl2iSQN+E1P5yugE98WrkbQjVh1JoSOdY8qBvZWpaIvV0Xd
	ULc6Qj38k63H+sEjtMN/gxwqrD5K6BFUmITQAncHPX1dy/qxRAtTdC1+xyUNPkrLM48SJgeWdVw
	==
X-Received: by 2002:a05:7022:389:b0:12c:8cae:cca5 with SMTP id
 a92af1059eb24-12dfd830619mr1840632c88.23.1777744451605; Sat, 02 May 2026
 10:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605030032.glNApko7-lkp@intel.com>
In-Reply-To: <202605030032.glNApko7-lkp@intel.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 2 May 2026 10:54:00 -0700
X-Gm-Features: AVHnY4JRDEqsP2MwKxyXLnAruXq_oBWsmjYH0kiopTIaHyMvJvbNvrh_GfSEaYU
Message-ID: <CAAVpQUA5STowrBX77w47_jw1fgiug00uP81EKhXuwkbLX6_7fw@mail.gmail.com>
Subject: Re: net/ipv4/ipmr.c:312:24: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 2, 2026 at 9:39=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   f1a5e78a55ebf2b05777fd5eb738038ddae609d6
> commit: b3b6babf47517fde6b6de2493dea28e8831b9347 ipmr: Free mr_table afte=
r RCU grace period.
> date:   5 days ago
> config: nios2-randconfig-r132-20260502 (https://download.01.org/0day-ci/a=
rchive/20260503/202605030032.glNApko7-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260503/202605030032.glNApko7-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Fixes: b3b6babf4751 ("ipmr: Free mr_table after RCU grace period.")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605030032.glNApko7-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    net/ipv4/ipmr.c: note: in included file (through include/uapi/linux/sw=
ab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, .=
..):
>    arch/nios2/include/asm/swab.h:25:24: sparse: sparse: too many argument=
s for function __builtin_custom_ini
> >> net/ipv4/ipmr.c:312:24: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
>    net/ipv4/ipmr.c:312:24: sparse:    struct mr_table [noderef] __rcu *
>    net/ipv4/ipmr.c:312:24: sparse:    struct mr_table *

Will add __rcu to struct mr_table in netns_ipv4.

Thanks

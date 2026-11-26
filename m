Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696523;
	b=usLgF0bDoRV4LMtFg3ZTe1LkzEyQcJudlxBfpIbHffHMC4FkYeiS27qZUGSV+CjDK8Hy
	 1uI5veGIQ5Y7+c6qRsTqd0sCnmSDzbf61KzgfS+1Y4QC/2wSHI/0XjEbreDH0VzrgSpsm
	 K8gj956sOi5UxkDtFl7EO3VjIJ8dFZ+gB4+UWHaAwzS8z/7TkTn7JIHdMd4VC4fFAoFgz
	 11ABWosC2KTyKYTpc0EQgOhObSemwvnKbYzDu6GDEZP7KtE+MSda28/kRerCPnpcO4eee
	 jTdD6L67M5GxpbQ1MAJX1+5/R0fITMfozE5tWHn9MJwvHwtJHVtwD1gU6XZ2pBvS3EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696523;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FEDVzQa+iZe6gwdu1NIfM+JEyWbQaQvPJVlc6XP2vwo=;
	b=jmmFG7eD0gHybSkQRFZ3SBVfqiYNFV35QQY4lZrgPNPUZIhxR2sWB34aeP1MF0lVvYcM
	 FpQL2CKPR1/Oy6XCNcxi96X1dGMH5iyl3b+6gJ9xQAEfQsfs4qjRY9OYrUGp6e4I7xV4S
	 9elruK59e9+fua2OF/a3fjJe7lLLPICgaPVWvnkO8wvropqfNuaHmOKZTp1lg1rxmFUkO
	 LAh9pXOthfM/rQ+M2sG4AUKX09XUyedcakk7UzxPTN4SpsSsOHgwybTTVeByt9cZcVbcQ
	 cwOx/8Gz8RbtXP5t2jtn3o5nYy/lisvdfwrh1DwNnTmgoyTSp3PJzDnlL2cJ3bVR8Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=StrxGH4u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB1A606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=StrxGH4u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB941F000CF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 12:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696522;
	bh=FEDVzQa+iZe6gwdu1NIfM+JEyWbQaQvPJVlc6XP2vwo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=StrxGH4uED2k895qoI1asFryJkOWBxHfO8AsxOUwO+WvwWH/mzwhwAtUHbdooVF/f
	 WRpzm3q3Ewb1difInye7kOzfvb40mhXgccYfEZgCBaO6nE+rBz7kpkPGCX2bJaZFwk
	 X5HGY2AD6MxJ+QNyxw177iv/1oh3aQ8XWhJ8el5w2nIWvmuMGwZdSHXBf7iJXlxjxM
	 g/pyZkfVfKInPAs+X7UfrZ+OyWXaKsyXwetxFhoOOd9r8hsvGsmrNgUzL1BfyeVWbo
	 5IhYhl8uHCL4tlkJwIWvbr+5zKvJf0ajD4FWtmhJ7LVzc5TWNhbRlNJkR5SUt1hFLy
	 rRw/aA+tKSZsg==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5118deebcfso1034649566b.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 04:35:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH/XeQ52bbKV4ctwb1aDBFeACuEdIVfErvfFY5y5KEK23D77HWXEFQhneZlLRfzNI9V0GmkxKvOReb3zs8h@lists.linux.dev
X-Gm-Message-State: APuU4Z8A/SN/BQ/3pDCVUdjyC3ECHNVOBw3jedXFKbdSD43jSu07kj3n
	25IA2MirZLj4j2y2mG4u7GKOWPWioQEHr/4P+W8VsklaGvtfc9+Tkvd+jZMA/snnfaZJtJOuQG3
	rkdGJjrOk14ySfkmeQ/RqpPkFE/YA8oU=
X-Received: by 2002:a17:907:9411:b0:c40:d920:747c with SMTP id
 a640c23a62f3a-c513a47d409mr1725738166b.7.1795696521485; Thu, 26 Nov 2026
 04:35:21 -0800 (PST)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261126042013.QSoDDLPw-lkp@intel.com>
In-Reply-To: <20261126042013.QSoDDLPw-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 26 Nov 2026 21:35:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9R-bO2N93DcUnHKc7Yu=mQonFGbBAOpcXLPDaSfaJEsg@mail.gmail.com>
X-Gm-Features: Aa3M54q-aWJlGzy3E4a3rqceojy4xQ3bv3-JtxRrek-GZg0bVn9Lcb4oZpgZyVQ
Message-ID: <CAKYAXd9R-bO2N93DcUnHKc7Yu=mQonFGbBAOpcXLPDaSfaJEsg@mail.gmail.com>
Subject: Re: [linkinjeon-smb:ksmbd-for-next 48/48] fs/smb/server/smbacl.c:793
 parse_sec_desc() warn: missing error code? 'rc'
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Ian Bridges <icb@fastmail.org>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 3:01=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.gi=
t ksmbd-for-next
> head:   f9208b7a49196e36c0434637ab83e001f5800a1d
> commit: f9208b7a49196e36c0434637ab83e001f5800a1d [48/48] ksmbd: use the s=
ecurity descriptor codec in callers
> config: sparc-randconfig-2200-20261126 (https://download.01.org/0day-ci/a=
rchive/20261126/20261126042013.QSoDDLPw-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 13.5.0
> smatch: v0.5.0-9187-g5189e3fb
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/20261126042013.QSoDDLPw-lkp@intel.com=
/
>
> smatch warnings:
> fs/smb/server/smbacl.c:793 parse_sec_desc() warn: missing error code? 'rc=
'
I will fix it.
Thanks for the report.

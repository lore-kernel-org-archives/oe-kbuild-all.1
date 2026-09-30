Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782CA321F5F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 12:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790770038; cv=none; b=uapCRqwczNXgZHNESmWCO93LbDA/bKAoBCrf7IySr7qnkDfZc69EJBs2QFeKJyvtePpx5oGa4fij3wcU5GvnfToG6kSoHDSYUtyVjnCfIObKactx6uWwuJeAf3Ht+9HnIrntW2G7r0sW+V+Kt6B3lWoP3GZIVNaOhQwdfVRVRMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790770038; c=relaxed/simple;
	bh=mSdlthVamvv13dTvA6eqxFC54thYc7nsJnv5irc2yC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ufHrW0ujd1/dWl7qIMuiBD2XfVKcH4YuJt2P7l01r8i34017OeF6NOMAYywv2win97mky+0szlaxobk6kUfUAf9nabonXDoMLP8+/FUgO4yHr5dsnLHV2LvvQSkpLkZbPk0qzc8HgsGmkM3aSPp9/EqSGNqHpcBtSvVSaV0o8kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clBE8iFa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clBE8iFa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1671F00898
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 12:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790770037;
	bh=mSdlthVamvv13dTvA6eqxFC54thYc7nsJnv5irc2yC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=clBE8iFaNw1PCLj4rVwmvP4Qn64slLJPmV4YnQZ8hqrLvGCZpIz4TGG7KSFspS4S5
	 yFACKMoX+1NG7ikCQe0QoprYvZ1fx2M/9lTawqdMTKDfwvJPUMLeAMsxoiL+QWeG0a
	 WS0K5uHgGf9aCeLPYyLepEQwemeX3sAcryIiKIxfhYoiuMPqT4sjJ2QXWFQwbzDIus
	 U5YcdfiuyZjGfKSJgiD3XT3etk9vhxQWuWqqceOT9z6+8dBfgt5QjSWW3CRWY7xkl5
	 spePlYdg+atrVWQpKoX+IqMeaq4RU0VtcegxW4zZSMjg8JRzi7WupsithTBy4jXceP
	 LUEQC8Id7N3gQ==
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ab02c68d2cso2915189a12.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 05:07:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgJ96ZxCr1ldNagj0uU+Oj6V0xcVSEeeqaSrPPs0ggEjh5QP0soTErst/KHbfcWaNr+m6N7Hkmv03ZPwMu@lists.linux.dev
X-Gm-Message-State: AFuF++mbD+ZV1+2tQw+38tI1oZmEiL1plxTOmwFJJ1tw8wotDkmhVdW0
	Og3uFPlSGSyLu80XIs3QBBvyD1+kH2eaXgQRq+RPyoeHBtVBcSO2c8nAG7Y2fDRSXMxdm7DMCL5
	vbNVixop7Qd5+L5Mu/hHT9m5eRj5Zrw==
X-Received: by 2002:a17:907:9703:b0:c25:8b1e:3750 with SMTP id
 a640c23a62f3a-c2e24116425mr98358266b.12.1790770035741; Wed, 30 Sep 2026
 05:07:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609301056.m1VNxu3Z-lkp@intel.com> <CAD++jLnqJ62g1=jqGPOJPZNmRukzArgNNMJdh4wsAeRe--U+XQ@mail.gmail.com>
In-Reply-To: <CAD++jLnqJ62g1=jqGPOJPZNmRukzArgNNMJdh4wsAeRe--U+XQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 30 Sep 2026 07:07:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL16LyQGvMuktobzfhnrKYBQVMztrAgyUr-9KL+uy4X1w@mail.gmail.com>
X-Gm-Features: AclHuK8i5BjQkB5RqhcWvNUT3WD8d9Too05E-hIAwKG6glWukCZboxuQHfsjBTg
Message-ID: <CAL_JsqL16LyQGvMuktobzfhnrKYBQVMztrAgyUr-9KL+uy4X1w@mail.gmail.com>
Subject: Re: [linux-next:master 8900/11456] arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb:
 prcmu@80157000 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is
 a required property
To: Linus Walleij <linusw@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:48=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Wed, Sep 30, 2026 at 10:31=E2=80=AFAM kernel test robot <lkp@intel.com=
> wrote:
>
> > dtcheck warnings: (new ones prefixed by >>)
>
> I'm not happy about how this bot keeps hammering despite I say this will =
be
> merged in an orthogonal tree and just isn't applied to linux.next there y=
et.
>
> Should I go and just merge my own pull request into the SoC tree just
> to shut this up...

We really should stop making schema changes that break existing DTs
unless the change fixes an error. I imagine this one was this way for
*years*, so hardly seems like it falls in that category.

It's not just 0-day, but my own time chasing down new warnings that
show up in linux-next every cycle. But that's mainly arm64, because
arm32 warnings are pretty much a lost cause IMO.

Rob

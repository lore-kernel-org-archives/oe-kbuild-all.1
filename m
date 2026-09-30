Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C505187DA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 17:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788449; cv=none; b=AZFcT4zkMr/6dVNLshxpODhFg5MP60Vw5LugP7QeIftphm9Q39suKxNJtxDgKAYcdoXWfJexfx5IXHdw8qjUt5tOidGiBcPv/aVrbcFxCxtfoLlNKKTElgVsx/cO8v1vOcpJ/JnET2jNonKsk3+mfkeZbidqUkGn7esoSbdtk50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788449; c=relaxed/simple;
	bh=wsOuf1FicqFQ+nM3xfDMEFWjAzPOH5ApCAFV6J4gaFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QHsKcxZ7mZf7iDVUbdM9wJOo8ISiYgIUv53RqsWET4BNDwJszTGCdztnyTq3JZhwsS1kzWT3ZlPCuFIA6jemmJil/3T0FKLWvMtmQC6HCA/8mp/coL4PW4jOtltnn91jSK1OqS+8mcRqQpldhiez+Tcr/sBLPpcPX3xqiCzGuR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjJMX1X0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjJMX1X0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593D71F00899
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 17:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790788448;
	bh=epz0WRzoi380HJbSVf1f3TBmMXToNAvaTA1C8h0ofzo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SjJMX1X0AZBMm1nacjZ17iN55D+IrsI7M/eZ4T3/ZmTPd2Zg2nycj82pJ2IuayLjy
	 kmPs68f5XUyF/rPL1YGL3PAVc5tgUB1YU1fEB387pFW9etW4QkVcTMRHzug4B/lB8A
	 ZkQFfU7Jem9creV7TLD4AX8AvyWC2W4x+QiPv41VdJPrbrCP2FwS9msq/685FCtutO
	 a8BG7wGKsC9WhJcWPy5DrKh1J0z6TgJhiKxVUlAlgmArgAWjju5hHMHsMByxHSZEkO
	 AADZqp/om52BrzFCEG84VdMHpDXSm/Q++CEIqn1f63lJo9DnQ0FHuSYBr07frM3cjg
	 Y+7uRN/IvwQAA==
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e17363b97so177746366b.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 10:14:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwVjeDCx6EJE3qbs74QWpsyx3vFFfDSJqOZ8lKspCkpa0M/F9jgWSdO3CjEPBPBUQXNir83CHdtvwLyPlB8@lists.linux.dev
X-Gm-Message-State: AFuF++mmcdmCOGXss6d7b4HmsXLIC5Za9IYgvydMgNVAJjui9KZLMZ+O
	YZUWWVFw/69pllbGaQaEeFyNzbMnx01Ffqy3ECW1hib9g7vIsNpAhCxg3FIgWi6ghw/84ahAScr
	36fLNxoha8GzvSElcDeTo68xeTmtjYw==
X-Received: by 2002:a17:907:72d2:b0:c2a:fd39:f23b with SMTP id
 a640c23a62f3a-c2e23d6425emr195730766b.24.1790788447035; Wed, 30 Sep 2026
 10:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609301056.m1VNxu3Z-lkp@intel.com> <CAD++jLnqJ62g1=jqGPOJPZNmRukzArgNNMJdh4wsAeRe--U+XQ@mail.gmail.com>
 <CAL_JsqL16LyQGvMuktobzfhnrKYBQVMztrAgyUr-9KL+uy4X1w@mail.gmail.com> <CAD++jL=7amXYBVVt8qrN5tSJpOR2uMCfaWUb3ZOiWPQkLB2Y+w@mail.gmail.com>
In-Reply-To: <CAD++jL=7amXYBVVt8qrN5tSJpOR2uMCfaWUb3ZOiWPQkLB2Y+w@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 30 Sep 2026 12:13:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJgDFN5=8=H=4KOR9R6GYs4oo9zOG5E+6FEujYprvsWpA@mail.gmail.com>
X-Gm-Features: AclHuK91LEpuEQAUwK4KU7XvZY8h4Zvy9so4NHTXn9lraLX6u1NsLJQ3MB0DAuE
Message-ID: <CAL_JsqJgDFN5=8=H=4KOR9R6GYs4oo9zOG5E+6FEujYprvsWpA@mail.gmail.com>
Subject: Re: [linux-next:master 8900/11456] arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb:
 prcmu@80157000 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is
 a required property
To: Linus Walleij <linusw@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 8:06=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Wed, Sep 30, 2026 at 2:07=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> > On Wed, Sep 30, 2026 at 4:48=E2=80=AFAM Linus Walleij <linusw@kernel.or=
g> wrote:
> > > On Wed, Sep 30, 2026 at 10:31=E2=80=AFAM kernel test robot <lkp@intel=
.com> wrote:
> > >
> > > > dtcheck warnings: (new ones prefixed by >>)
> > >
> > > I'm not happy about how this bot keeps hammering despite I say this w=
ill be
> > > merged in an orthogonal tree and just isn't applied to linux.next the=
re yet.
> > >
> > > Should I go and just merge my own pull request into the SoC tree just
> > > to shut this up...
> >
> > We really should stop making schema changes that break existing DTs
> > unless the change fixes an error. I imagine this one was this way for
> > *years*, so hardly seems like it falls in that category.
>
> It's actually not breaking any existing DTs (i.e. they compile fine), it
> breaks the validation. But that's bad too.

Warnings are broken in my book.

> It's adding new properties to existing nodes.
>
> This whole mess is caused just by making one new property required:

That's pretty common unfortunately.

The problem is the schema is the ABI contract. If you change it, then
you change the contract. The OS is free to treat a missing required
property as an error. So if you add one and then add that to the OS,
then any existing DT before that change is broken.

>
> @@ -319,6 +346,7 @@ properties:
>
>      required:
>        - compatible
> +      - '#sound-dai-cells'
>
> In hindsight I should have deferred adding this requirement...

Or just never made it required. Maybe it's nice to use the warnings
for what to fix in .dts files, but that's not their purpose. In this
case in particular, this is old stuff which is not gaining new
platforms where you want to make sure they are correct.

>
> If it's very annoying I can send a oneliner making this non-required
> that we can then later revert.

If the dts change is going in this cycle, just get that done and
ignore the warning for now. Most folks are good at ignoring them. :(

Rob

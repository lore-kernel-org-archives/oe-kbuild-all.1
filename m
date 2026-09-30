Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61DD4E236B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 13:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773605; cv=none; b=XRTgf5QdAtDdZSE+cM3BJME2/TvaZcFuCoMpIORTiri8qBV93D2Y3em8zErcC1lj44YRGykeRIVbPK33lcRYMofqTCxRF7aEDcP2/6Per/f7rvE4NVN2on29BSLavWWWuWjoBVVWEv2I+MjcSmk0cqg53P4SBdlXhFBlMR+ujRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773605; c=relaxed/simple;
	bh=AXIRw0JS2IA7ugOzWMvROEU0C2Rfj6UgMlOgHo8y2p0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKcIIpwQtZvxJevhxMTnlcZa6DJEyE1gpUG0QYhgba1GluchfdaOeSHq4BN63WKo+HSc4qoGcOS8liCmZDB3RMa/qLSkzg4bnzD9Unrfplavf9Rb8MNRWCgPTbNAiS9j31xwzZPDsy54Pn3Hd5xeIOwW+WTbXn0Ihsd5kPT3114=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDXgHd27; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDXgHd27"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC4E1F00898
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 13:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790773592;
	bh=kpR/6fPV+Qa5QDaGeRoJUiMGQcuh6Ngasb2D3KqrUKc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bDXgHd27MPJSFCqqbs9MdMGnIw43z/Tzjbjzezeropkq1e122lKkcXu/q2ZWVLl1k
	 pPNsM4OVD13UVwycrgjuM1XqRNwmcKDyY+Zoq3NdNbsT3VPns3cIQcXsyW/0wDZlPd
	 rwBzu2RY6m7Akg2T4OCLFoZ/eisZ/WhxP67UWi1kWw8DR7pD60cNdclxeqfkJwjBk9
	 dlTXvEu8WUlpXrLpZifPcYql7Cwyu4ixqemsk3ZsfSQxjoRif5EjeHjvVvoUcaDpid
	 WtBFM/55v970XDJcNFN29Rbsxiv8EQC2JKCVKET2zoCVNlJ2uWUORFycNh7uLswuWB
	 XWdvKn8ZYm70g==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8eacb7c8fso4657504e87.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 06:06:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzxejAdefJyNwtsbLCRERkD5NEKlndZdKVK6k5AseJjhDWf0bwIRSgVhmeEZn/mMJum1P2flv1fipvxSvN9@lists.linux.dev
X-Gm-Message-State: AFq9FYKOOBZI0qe0dUMih+cTyCErAcFELfhbtm1ikudmy7l3HEjYY12L
	+UmAYM5jXs4QWcd6nbWSN3yg2JjjvKAkBURpXduoLBb0Q8CmujsN4OqTHXhaRDgZ9VwZrPmynG3
	TSzWC9pvHdSpJIkUhqtKj+N8lAp3QwtQ=
X-Received: by 2002:ac2:5d30:0:b0:5b6:1a7c:27 with SMTP id 2adb3069b0e04-5ba405f57eamr490595e87.42.1790773591259;
 Wed, 30 Sep 2026 06:06:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609301056.m1VNxu3Z-lkp@intel.com> <CAD++jLnqJ62g1=jqGPOJPZNmRukzArgNNMJdh4wsAeRe--U+XQ@mail.gmail.com>
 <CAL_JsqL16LyQGvMuktobzfhnrKYBQVMztrAgyUr-9KL+uy4X1w@mail.gmail.com>
In-Reply-To: <CAL_JsqL16LyQGvMuktobzfhnrKYBQVMztrAgyUr-9KL+uy4X1w@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:06:18 +0200
X-Gmail-Original-Message-ID: <CAD++jL=7amXYBVVt8qrN5tSJpOR2uMCfaWUb3ZOiWPQkLB2Y+w@mail.gmail.com>
X-Gm-Features: AclHuK_yChPVurcI7xDyR5tFYQWXL_0_G7hQUKh00sPzfcRWm3-w1W98tpL6Kjg
Message-ID: <CAD++jL=7amXYBVVt8qrN5tSJpOR2uMCfaWUb3ZOiWPQkLB2Y+w@mail.gmail.com>
Subject: Re: [linux-next:master 8900/11456] arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb:
 prcmu@80157000 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is
 a required property
To: Rob Herring <robh@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:07=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Wed, Sep 30, 2026 at 4:48=E2=80=AFAM Linus Walleij <linusw@kernel.org>=
 wrote:
> > On Wed, Sep 30, 2026 at 10:31=E2=80=AFAM kernel test robot <lkp@intel.c=
om> wrote:
> >
> > > dtcheck warnings: (new ones prefixed by >>)
> >
> > I'm not happy about how this bot keeps hammering despite I say this wil=
l be
> > merged in an orthogonal tree and just isn't applied to linux.next there=
 yet.
> >
> > Should I go and just merge my own pull request into the SoC tree just
> > to shut this up...
>
> We really should stop making schema changes that break existing DTs
> unless the change fixes an error. I imagine this one was this way for
> *years*, so hardly seems like it falls in that category.

It's actually not breaking any existing DTs (i.e. they compile fine), it
breaks the validation. But that's bad too.

It's adding new properties to existing nodes.

This whole mess is caused just by making one new property required:

@@ -319,6 +346,7 @@ properties:

     required:
       - compatible
+      - '#sound-dai-cells'

In hindsight I should have deferred adding this requirement...

If it's very annoying I can send a oneliner making this non-required
that we can then later revert.

Yours,
Linus Walleij

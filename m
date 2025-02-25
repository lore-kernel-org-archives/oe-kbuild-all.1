Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2389A19C54F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 10:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740480320; cv=none; b=lQqsWPRJ2sjT5TRNxHoXH0YEnPhGJgxyQOEjyxz+n3G5DnQwGto/KR9KgV7T75/NIvs9p5J55cat9A+mDWznV4PTw5Sm09qsOBzdmGebtxaJ+1u9dFU5yHER6fJmueW5fvJnbQLkc9H8yMXR81MToUL/9GIqd7dwwnFS2vvkexI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740480320; c=relaxed/simple;
	bh=BIYG736QXOJlemgi3UvjDcanU7LDYXGM/Oj5GRkgcwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tOMquVWtjM/tJ85lTlboqw40yc9h8QrgEK/FW9vqB+v6TA2ZMEL179K2kWVYyg38yHOo8TPaRv+1iw0oBtbxGxfx0WQkk98As4lHuujvCrncgwDMR31enKRaGiyEdSlryFsNWIy9A2GmM95qegQsMV3u9tbVt0ZoF79Rinj2hC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=krm/eQqP; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="krm/eQqP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BIYG736QXOJlemgi3UvjDcanU7LDYXGM/Oj5GRkgcwA=; b=krm/eQqPmY6ii5IGtGfYd3ftxv
	Q25/DbRk/l+X9R2tS9kmot3qVGIRqxZ9t7fDPbvfTvM2yWhcsRAyX9mO3JY7SvvSXxbQ0jyrwrbum
	ZDdYqAtwigVxD/sP10ziA44Bd+KgSyVIiyw0MAgsjTb3hvwyAJdQZFkwQULLOwoXgyKdXXjvrHj+C
	yZb+TUJFuqQleQKOY+UvWnFTkejfEyas5gkgUVzY+UWYqFJ7yUuGYwG5f3+G+YzF5iXwg4zXtPg77
	djacq5cNo9M5B8HhGufiQ5/lSwnE0yfrfpMvO7jfrWguu9mF+Q0sEaI099UhzIjELdLKqTwPR0SXT
	fjsQx1Eg==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tmsR6-0002WG-QV; Tue, 25 Feb 2025 11:45:12 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel test robot <lkp@intel.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, oe-kbuild-all@lists.linux.dev
Subject:
 Re: [linux-next:master 5345/5954]
 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb:
 gpio@27: 'reset-gpios' does not match any of the regexes:
 '^(.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
Date: Tue, 25 Feb 2025 11:45:12 +0100
Message-ID: <21492727.0c2gjJ1VT2@diego>
In-Reply-To:
 <CAMRc=Me11Sf-UKW3Fj-cwpKgbEvg--yF4fUZ8ioH+XLixt_APw@mail.gmail.com>
References:
 <202502250657.z4e1UeVZ-lkp@intel.com> <6725313.tM3a2QDmDi@diego>
 <CAMRc=Me11Sf-UKW3Fj-cwpKgbEvg--yF4fUZ8ioH+XLixt_APw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 25. Februar 2025, 11:32:00 MEZ schrieb Bartosz Golaszewski:
> On Tue, Feb 25, 2025 at 11:29=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech=
=2Ede> wrote:
> > Am Dienstag, 25. Februar 2025, 11:08:23 MEZ schrieb Quentin Schulz:
> > > On 2/24/25 11:09 PM, kernel test robot wrote:
> > With the patch-series for the PCA967x in question [0] not getting any m=
ore
> > change requests, I suppose Linus or Bartosz might even apply it in the =
near
> > future, so I'll give it some days and if that doesn't come true, I'll d=
rop
> > the board patches here.
> >
> > Heiko
> >
> >
> > [0] https://lore.kernel.org/linux-gpio/20250224-pca976x-reset-driver-v3=
=2D0-58370ef405be@cherry.de/T/#m34648451131d34ba85538e08da0cacfc366d91af
> >
> >
>=20
> v3 was submitted yesterday. I will certainly queue it for v6.15, don't wo=
rry.

that was my thinking too ... I should've spelled out the "v3 was submitted
only yesterday" in my reply though ;-)


Heiko



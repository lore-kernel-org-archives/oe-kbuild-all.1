Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2980212198
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 14:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729867824; cv=none; b=aI/4nflaaQsZ0OfQ4+XwSssMqbnp7hLnBY8G5gCbvT1RgGpbD5YS7Kscx+8+CctldTLJyhmOWxePzEa8cVjHcT9ydz71RqwuB6PIzfxFk4SdX38ybFo5Nzw8+blFAzHxJEP1F3BHnyYLuM8pFKeGuNmWKff/rN4QcRg63Mt5htY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729867824; c=relaxed/simple;
	bh=Ns3S+jviNq58EqmLAr2xu+Cu+x324auKxKxXH0yLtEs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=AtieRcle5ex0PIBAb0qFED82LfGE7waPxERiBiCbsDatcgDDYaYfZmgzpoykyzjG64vJAaXFKHeUTAWBHzpsTEfjECh7q9Qoackj4P5MzjF/Yats+Vq5A27A+ZZl1fNy6pl5ATRxdiG5MYvMm45l8Xe9qPaNHmudjIXz/Zj4CJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/8Qd54K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/8Qd54K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFEBC4CECD;
	Fri, 25 Oct 2024 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729867823;
	bh=Ns3S+jviNq58EqmLAr2xu+Cu+x324auKxKxXH0yLtEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/8Qd54KigL8jOC+5BWNCL00a5tjf1DOtjjIVCpVshQFBR0iwvHdBd8sf2f6zfhK9
	 70L+gw/ocbkqUZEMWDAGoTtkqB+81qX3rw41kPLRyPIQFYi5+bmy4RKpfl4QwOK47f
	 LFxvxmDMr1l5+tYBcfBgQ3I34hQWk4buk6jFZoRigGKPI1o/sJj4w+lJSIMary2MjH
	 jWe0M1IGF+/1TTvxtXn913uQQn9NR1O4asDDH/5qYfgEiDXdV6Lb9C0niDhk52+dmc
	 1EH+ztzkt6kI7bnooBF5pW13hO4NaY7RPgdudj8mNzLmx7rvv8qeQ7RWnkUhddzIGc
	 OrMBjP0pAtXhw==
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Oct 2024 17:50:19 +0300
Message-Id: <D54YYPJY2PEG.15C1DXGIE8JAH@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "kernel test robot"
 <lkp@intel.com>
Cc: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [jarkko-tpmdd:lgp-v2 2/4] mm/madvise.c:1098:10: error: 'const
 struct mm_walk_ops' has no member named 'install_pte'
X-Mailer: aerc 0.18.2
References: <202410251042.SfLMse1o-lkp@intel.com>
 <daca8283-ad71-459c-bf16-a6f0660180bb@lucifer.local>
In-Reply-To: <daca8283-ad71-459c-bf16-a6f0660180bb@lucifer.local>

On Fri Oct 25, 2024 at 9:48 AM EEST, Lorenzo Stoakes wrote:
> On Fri, Oct 25, 2024 at 10:17:54AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tp=
mdd.git lgp-v2
> > head:   7ed651841db9f18744191e575637d69239102a73
> > commit: 94de21c76e54641539032105ccd3f36801fa9d85 [2/4] mm: madvise: imp=
lement lightweight guard page mechanism
> > config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/202410=
25/202410251042.SfLMse1o-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20241025/202410251042.SfLMse1o-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410251042.SfLMse1o-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> mm/madvise.c:1098:10: error: 'const struct mm_walk_ops' has no membe=
r named 'install_pte'
> >     1098 |         .install_pte            =3D guard_poison_install_pte=
,
> >          |          ^~~~~~~~~~~
>
> I'm not sure why I'm getting emails about a random tree/branch which pres=
umably
> hasn't applied the patches correctly but could I not?

TBH, I don't either.

BR, Jarkko

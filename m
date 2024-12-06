Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55FC202C25
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733489265; cv=none; b=UaMybRHFQazUlVo+ba01WmoRyoYXOa3oxFcYr2UwxkNv4+KYd5vPrkLxLYJ7tnhmNDOlPdnr2wo1C+aie306jfJ81gGmnHxrfWgECv94rUlomfgfcZ8kZIDO8KKExspyaw98KIX7fdtDREDCN01rUPmhiSlVMTEWfbdUs5fDhPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733489265; c=relaxed/simple;
	bh=luvaLEsir7NjCvJffVBs4WtdDScEoHm8FBWXtLtg1R4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxCMZKP5dPA/sY+9DyyCWItC+NKqRemmdMtNcHdrJy2isq2AdQI3S+AL/35f78ym1p9pOFF2VGlbgyMZyqPcYHROCeLdsBNvacHKHG32gbsvHZAvZN0izzWvGKU9Pk1EulJxKOicjukcLOKQgnSvbiNvU1sY6K4itfN2Lkr5TtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqmScRVq; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqmScRVq"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ef28f07dbaso1456133a91.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 06 Dec 2024 04:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733489263; x=1734094063; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AN6wSJOQKeS8K8OswS/K9JukacIPLWbnXcQDadD1vP8=;
        b=QqmScRVqXJiLWw0aNp9XDwSUFCjDLD0POOhhMzK3bhT3nORzrJXbasGxLTir9UQMmJ
         pdjjgzKOmFiG9nk203npoajp34ysoRMQ/uUNhnhOG+CkIM0zHPNEwPiwVDnELIiZinlD
         kjdbIXexJtfDkY0r3Dhw6yVB/DJJLEoOntOwjBskGyuscMBJSSl1lvj9HmpRfCVgqBNm
         9E2bWx3A5KEndB+G+XjhjA83YDW4yKrxxHa3RYbHLXplNqySgbKQgpHk/mX0kni5aT6a
         3Y3aQCQv5JakI/rgR5tbkYjWJRGrP/1QXnsPQUUoz0GIfsdJ0VJwV2QVOvGtfXe68FBb
         Nagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733489263; x=1734094063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AN6wSJOQKeS8K8OswS/K9JukacIPLWbnXcQDadD1vP8=;
        b=GVRSdVcP8z8VS+TucP7TDb1plnVG1yCUs6feuQnhUkOMJRBKwCqDyvyg2mCv9Pw8yR
         ZP9IeEI5ZZ47fgJ9OGdomSK0hkNhqY93K3RPns6rQ8JpDwxk/9buLP3CdeJgyFGKG3mA
         XmksZqUtSKuVfRjbJg5F6QLZv09KX03Z7FiX9fzwpDKSI+6MJNrufgxunoVwxa2YYKGN
         b7YHPiSwcxpBvn42UYEWb0G5tWWh8ooBUkWGOEfkUNdbPmJeB6ONjg7oMsO2p1224deL
         LgNxK2SjGwmF4XijAybBcLag3hFFs+iifZVFqcngk5e8dSzHUrZdBxDXqSE3WlkkU8/P
         5OfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb+wed8eAGd2COhH85hgx/lxtW+15hRQ74QhzFpxOnMrPD8ZCs0MCjaOIy45WF2mDnbZbG3C5Ih08a0wle@lists.linux.dev
X-Gm-Message-State: AOJu0YwskbmcXGsa/HK7LP9b3eyi/1YgeoXUj0gH7jAa6zPvzjhijt8s
	Z02wKcbWBf/zRzOF6OND/PGSzSXUggVGCdqmC4qzbEPKG7TuzOz3Ybxx0SKX5jv2WLB9T7Ux4mF
	xvPLvegHGvzPTUzn2MRx9w3fy1Uk=
X-Gm-Gg: ASbGncu/le7C1SPTIt1FnVu15RqrWbys0m1zIv3wKu8zbnQusL+RlwSxuhQTn15TQ7f
	IkpogVh0aDrBjM34AXqVMWRAOzE9shQ==
X-Google-Smtp-Source: AGHT+IFIuAmE5evZRQVOpWixS07pJUiCWd6rEIDUBIPKl09LCARVG3DFqnIcjP/XHH0456aJoyhfu8BCInBZIcs6m6g=
X-Received: by 2002:a17:90b:5101:b0:2ee:964e:67ce with SMTP id
 98e67ed59e1d1-2ef6955f6fdmr4458139a91.3.1733489262934; Fri, 06 Dec 2024
 04:47:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408220755.LlaA10C6-lkp@intel.com> <3ba6caea-654e-4dcd-a4a4-bfdcf808f0e5@intel.com>
 <CAMo8BfJOPNaHb0f3Rf2GyhApCDg5bFfCGETWU9-LBJWiJpLeFw@mail.gmail.com> <20241204230526.GA1166824@ZenIV>
In-Reply-To: <20241204230526.GA1166824@ZenIV>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 6 Dec 2024 04:47:52 -0800
Message-ID: <CAMo8BfLYSRxEXJVJxrZEe-SpLhcz2ScZs7avCoh=_C4taWuL2Q@mail.gmail.com>
Subject: Re: WARNING: [xtensa] modpost: vmlinux: section mismatch in
 reference: ice_adv_lnk_speed_maps+0x14 (section: .data) ->
 __setup_str_initcall_blacklist (section: .init.rodata)
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>, kernel test robot <lkp@intel.com>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Pawel Chmielewski <pawel.chmielewski@intel.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	Paul Greenwalt <paul.greenwalt@intel.com>, Simon Horman <horms@kernel.org>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 3:05=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> wr=
ote:
>
> On Fri, Aug 23, 2024 at 11:41:17PM -0700, Max Filippov wrote:
>
> > static struct ethtool_forced_speed_map ice_adv_lnk_speed_maps[]
> > __ro_after_init =3D {
> >        ETHTOOL_FORCED_SPEED_MAP(ice_adv_lnk_speed, 100),
> >
> > that array goes into the .data,
>
> ... due to
>
> #define __ro_after_init __read_mostly
>
> in your asm/cache.h,

Oh, the trail leads back to me (:

> instead of the usual .data..ro_after_init,
> which would be enough for modpost to assume that driver knows
> what it's doing and won't access the dangling pointers to
> .init.rodata in there after the initmem had been freed.
>
> The same goes for qed and the same thing happens on openrisc,
> for exact same reason.
>
> While we are at it, that might as well had been
> #define __ro_after_init
> since __read_mostly is not defined on xtensa and default is empty.
>
> If you don't want that stuff to go into RODATA, why not
> simply define an empty RO_AFTER_INIT_DATA in your vmlinux.lds
> and put those sections explicitly there, along with the data ones,
> as e.g. s390 does?  Or arch/arm/kernel/vmlinux-xip.lds.S,
> for that matter...

I'll do that, thanks for digging into it.

--=20
Thanks.
-- Max

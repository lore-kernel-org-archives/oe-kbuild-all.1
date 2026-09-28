Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED42436194C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 01:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790560598; cv=pass; b=t3JSzYBQFmjPZSqLqQYk/ftuQo41sw79u+pzEpCxOzFZolX6B+0Cn+h1CcratH41tkdEySlLXlmzFonRwLUQTS2yrGYEoqx6DJCGNf11/1253XssWYp8BoshSYpQmcFvZrjTFJPum6bhI2hQKtnaq6G50KD4XyWgIkPnyra+0RM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790560598; c=relaxed/simple;
	bh=Gzm/SDiPl5LV7kq4ksYwnfd/Rs55KibiUJ+2DHK4yaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vBbNg07zHlqzuKKgaonNIwlHRrxd800PYHlQjfRC7bPGM9Iy4tJB/CqpXqrKqAPJZyLW//gXwKoxyjhlDXuyVyxcBx3r+IjU5/GhPQg23l7wAbApTQyNyfq0cOp+IEC0QbvX68bbuEhBpCDUTf7A2xIsBj1lKeLA+O6BWJX7kik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=cHyJ/uN/; arc=pass smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="cHyJ/uN/"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc7a15ba46fso294367a12.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 18:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790560596; cv=none;
        d=google.com; s=arc-20260327;
        b=SEJ11JA7eF9Abmr8tViuKQtIaXFkcIA6T6Gy+DVYErGvOkUKbM4KitjHFdriP6gWLQ
         IcsvpegzzYT+JYmNNbfl0QMRCxZvxWNgN4FMvmRoGMb6bZKwRopsSsmVgZ9kDMUdUkEI
         nCFt31qo7FJDEQX+V+cYmhK0uzQAIEUCNJP66podwWiK+PuRxcRuh+nMF2iy5HXMJD28
         Hd7wDYnqE6NXic7SJdmauhzL8BGYPdW67FKTKG2udt2/VS7c4gtFiNn0vHz7qF3+AbID
         qMsMIWDFT4XZVyJI9CEf8leGwfRKfj6/NkfK2ISloSyz0cX8ASKIgGtVSbxFbNpImHQb
         UuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=opUJfX6rzUaH5Jw8UwUM0LVklt+jFqGlQlou9k79izk=;
        fh=JkmaElRXlisaNxanmRXaf5CyV6bAbKf6OhnEMG/Tfmw=;
        b=m4KlAE5EaEQWytufkXvD0OUhleWKGhrD5amh6ZPXuyRKHUHk3FTuPrTIaY91TTMkdH
         OnL4i0NPLPI/kW1dorr/E8UzjHTPDXGmQ/XXMizZC1jakiZU3usVvAWfIzvib0E8HvwN
         NTj3wLHxR1bAZrYqK2ho6syQV+qb7Bfo+2cgEXpkZzyVQYznxviIBS8LdnLkt2wwkKAB
         mrS8E4oH5AUt2FNao2zGqqiGCwXppRLAgbJkXREOL2azzvMIZEAXLAAJzplDf/nRW6AQ
         4fV5cb3EdqytIVPRrk8fY6rsKMX06GXQu7RTcq+z0+TRDv/qfU+r+RUMlyEjkDx1U52l
         Y+lQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790560596; x=1791165396; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=opUJfX6rzUaH5Jw8UwUM0LVklt+jFqGlQlou9k79izk=;
        b=cHyJ/uN/xD9jo3k1aCYnHAttfpjnqJMkb5ZwKa/SvHnfk7YDIabDlWtxPPGmluWE/3
         abWQzIFVxeyYGwprqKiueMps6XDxqxfNPbtLyOMHdFeg87azHoBMc4U2noVPOgmKME0R
         0DKwvSzwNZa4qh/qbgHrnqoc5OgVp9LeTzgNkqMkucxn0+9aZ9yWvUtmwGUxsYSmthmB
         yX5ZHnlXCnklYzuhpnSJuilyqIBYD8fXri3WbfnT9emostyR1L1L4FREKz5TS1NVtG29
         vZNExXsTssxRuXzU4/uKvRmcvBfnhgzpieZZa3ImeVwoTaivrsPYPeSzEVcryoyGqZQy
         b1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790560596; x=1791165396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opUJfX6rzUaH5Jw8UwUM0LVklt+jFqGlQlou9k79izk=;
        b=SD4E3m+ac8G3LG/vUEOOaBFcReMZOycwWxGfiFwdup0dJVr6va70OQiQP9Ph+J+ebW
         AUX9BTuqmXGdHp8715n4bcvMqqDV0DnROk24hQUhvNuRBcPl0AUckwKjxOS6/jVodcHJ
         B32zXKKuKSt8Nbr8CYut9nO2Ghmka/Z19ayltWjhyok8jtl9py1S2/UXa7iXbJLD0ph6
         /K02ln/+X1DKLHXpWAnC+/mCcSYC7tUNNgRlCrEH8bWqoL0gwu8Pz/fF3kJ9AqsgZgeL
         ld304Ip9TlBd/23ZTPvUzn6unSVll6vP/rmdYRlQjlBDKe+mZNxWRxyEW3wlmEKyyGo2
         OIyg==
X-Forwarded-Encrypted: i=1; AKwUvBx4GIaYqlU/q7G3uYqkkSA1fMB3ACQc1Jv4r/ucoiQzsep5+J4AR5h2S3mpho0P9f3LSVy0LEacgRq/styA@lists.linux.dev
X-Gm-Message-State: AFq9FYJpdsVqP/pbBqXpfX96Iyh6Ay+QYRe/ZT8QJJktBGrSB9iileZ7
	WD5EXbCulqDjYmBAHpvd6iKpjswq3qMe9/mZ0iqugGjWRe7e+Og4yOdFf8/A89h1DEzQMO+6Xvn
	mftOBvVOnwvPw5jhy6vXOqyJtU+o0vYju97iVrgwMElmtZYvkzTcsAXVL
X-Gm-Gg: AYBFou3uGZ88tV7LNhSUVQbugr79w2CDUs6CMhFMA0srSDCoCckG1XXm8Z2AMs04Q/9
	IcLhsETdvHSUjEQai9P/dty2CAW2kQhU9OtrjezS8kncEna25iUXb8681T5boXJhw685Q0rCtR9
	DrsI0S+/A4HoSh+ZJ7reCMLLtm1zWPAHWKZnzz57upZIRbz6cFyt8trFK4uXNPBZRbFj+m0yh23
	+SmeEskxNzjLTA6BkhDCmTy3ZrBtr0/A/TTU3aOgaiCxexFX5DgifpKv66wAjkvBnyB4jTG0ayK
	29t2h18TIchsy6JfimbI/3C93h/JduRw2YvAn2YOmD3McFcWvHuwKLzNAgi8/4g+eFNk2gZGfuK
	RGdvuQ6Qj4w8=
X-Received: by 2002:a17:90b:3b51:b0:3a0:b312:1fbe with SMTP id
 98e67ed59e1d1-3a0b31224ebmr6885823a91.23.1790560596087; Sun, 27 Sep 2026
 18:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609271254.ivVsYFHQ-lkp@intel.com>
In-Reply-To: <202609271254.ivVsYFHQ-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 27 Sep 2026 21:56:24 -0400
X-Gm-Features: AclHuK_Onz12fPVtD3sji4ysceT5YiF34XIRYrd1xdeAqddW0A07UPZOuxBv-ck
Message-ID: <CAHC9VhQwMpZ8O+E3CjdXvcwDfaa8B+2ViG6T813REwdUNK4SRQ@mail.gmail.com>
Subject: Re: [linux-next:master 1600/10910] include/linux/compiler_types.h:702:45:
 error: call to '__compiletime_assert_636' declared with attribute error:
 BUILD_BUG_ON failed: sizeof(a->u) > sizeof(void *)*2
To: kernel test robot <lkp@intel.com>
Cc: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 12:16=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
> commit: e26307d83048803274837abf33f65396a88e21ac [1600/10910] lsm: add LS=
M_AUDIT_DATA_NS for namespace audit records
> config: arm-randconfig-1001-20260927 (https://download.01.org/0day-ci/arc=
hive/20260927/202609271254.ivVsYFHQ-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260927/202609271254.ivVsYFHQ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609271254.ivVsYFHQ-lkp=
@intel.com/
>
> Note: the linux-next/master HEAD f5f84daefcd92d7a630066635ecea1433ed5eac7=
 builds fine.
>       It may have been fixed somewhere.

This was fixed in the commit below which is currently in the lsm/dev branch=
:

  commit 11d73af7b0830f278cca77804d2aa802525ec243
  Author: Paul Moore <paul@paul-moore.com>
  Date:   Thu Aug 13 13:52:13 2026 -0400

    lsm: update the BUILD_BUG_ON() in audit_log_lsm_data()

    On 32-bit systems the newly added namespace fields in the
    common_audit_data struct exceed the BUILD_BUG_ON(sizeof(void *) * 2)
    size check in audit_log_lsm_data().  Convert the size check to two
    u64 types to both fit the new fields and move to a size that is not
    architecture dependent.

    Fixes: bb20ca26f960 ("lsm: add LSM_AUDIT_DATA_NS for namespace
audit records")
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202608131232.Owej9tlx-lkp=
@intel.com/
    Signed-off-by: Paul Moore <paul@paul-moore.com>

> All errors (new ones prefixed by >>):
>
>    In file included from <command-line>:
>    security/lsm_audit.c: In function 'audit_log_lsm_data':
> >> include/linux/compiler_types.h:702:45: error: call to '__compiletime_a=
ssert_636' declared with attribute error: BUILD_BUG_ON failed: sizeof(a->u)=
 > sizeof(void *)*2
>      702 |         _compiletime_assert(condition, msg, __compiletime_asse=
rt_, __COUNTER__)
>          |                                             ^
>    include/linux/compiler_types.h:683:25: note: in definition of macro '_=
_compiletime_assert'
>      683 |                         prefix ## suffix();                   =
          \
>          |                         ^~~~~~
>    include/linux/compiler_types.h:702:9: note: in expansion of macro '_co=
mpiletime_assert'
>      702 |         _compiletime_assert(condition, msg, __compiletime_asse=
rt_, __COUNTER__)
>          |         ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:40:37: note: in expansion of macro 'compilet=
ime_assert'
>       40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond)=
, msg)
>          |                                     ^~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG=
_ON_MSG'
>       51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #c=
ondition)
>          |         ^~~~~~~~~~~~~~~~
>    security/lsm_audit.c:185:9: note: in expansion of macro 'BUILD_BUG_ON'
>      185 |         BUILD_BUG_ON(sizeof(a->u) > sizeof(void *)*2);
>          |         ^~~~~~~~~~~~
>    In function 'audit_log_lsm_data',
>        inlined from 'dump_common_audit_data' at security/lsm_audit.c:425:=
2,
>        inlined from 'common_lsm_audit' at security/lsm_audit.c:455:2:
> >> include/linux/compiler_types.h:702:45: error: call to '__compiletime_a=
ssert_636' declared with attribute error: BUILD_BUG_ON failed: sizeof(a->u)=
 > sizeof(void *)*2
>      702 |         _compiletime_assert(condition, msg, __compiletime_asse=
rt_, __COUNTER__)
>          |                                             ^
>    include/linux/compiler_types.h:683:25: note: in definition of macro '_=
_compiletime_assert'
>      683 |                         prefix ## suffix();                   =
          \
>          |                         ^~~~~~
>    include/linux/compiler_types.h:702:9: note: in expansion of macro '_co=
mpiletime_assert'
>      702 |         _compiletime_assert(condition, msg, __compiletime_asse=
rt_, __COUNTER__)
>          |         ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:40:37: note: in expansion of macro 'compilet=
ime_assert'
>       40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond)=
, msg)
>          |                                     ^~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG=
_ON_MSG'
>       51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #c=
ondition)
>          |         ^~~~~~~~~~~~~~~~
>    security/lsm_audit.c:185:9: note: in expansion of macro 'BUILD_BUG_ON'
>      185 |         BUILD_BUG_ON(sizeof(a->u) > sizeof(void *)*2);
>          |         ^~~~~~~~~~~~

--=20
paul-moore.com

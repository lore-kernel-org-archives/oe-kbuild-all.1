Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB452F531B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 18:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772649178; cv=pass; b=bZQBDLN1kYjbvhWbgkBFyxc2yPZ2zMLoEoSnBrrdVjNzZPQOsELARutNmb3Bqf+8EleHigaGKOYtWMeawmhK+UPLPHK1f5AiyInXepg2QkSp2tDaXwF3Y40g2bxcOiTNujzNoESzy3bibMHYfTLS7pIIl5TQPjXOABQeEue5U+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772649178; c=relaxed/simple;
	bh=Hvw2CycS35qb0O4fH7JHfnq/MmVNRaZyInR0sCYj+xE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eg+Tnu+8nLf0bkWIh8LAH44corCU5qWlh23ZTv3+lcQAefzT0yWbfLAWsqlKQmlRuGqwOLG1e4Z/JnyJyvz/3JJPJ/OwFQ9mU3He+WxQqsq5Vo64+1KaUPRGFlsdGCg2tH41hhiPHq9E49W8xo1Ajv+wZk1kM+kvsmClRzDuVPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8eI4S0D; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8eI4S0D"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-506989e8516so61969371cf.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Mar 2026 10:32:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772649176; cv=none;
        d=google.com; s=arc-20240605;
        b=CpgwpBuHcLipV9qzQg7KV5+dX8jVQO7WCBIqnuL7TLziQDym2o0Oo4cB56ul1ySnVr
         9IP/TvbZFPyEqCKVJHpO3l8tfENUOikUYN5R+MiYJalf7hQetHK1XJYzRo0YQgYU5ytk
         OfqojUfnF3p0MyiX3JbuUGzvHrqMPr7PSEVUwb6e7OLJr6x0aqHt9HDXU1zg7wpKQnmx
         PvtGHF/342X1wi5xECbTLVgC25ZSILIGvxFhxqEEQyMNdA76oTmhcOj1dRR+05l9phbX
         NoQMr1xgciDc4qqqnOLHHrhPVNM3OB+x5GlZp1t0dYcu4LCw01n7ELkKh7wYB9icnXXT
         /9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ceoxTnbBzYaWAmxiCz1LrHsBpNMLveQPK1ZBQa9r+Hs=;
        fh=lqbJKLZR47VydQWCG/yHv33Q2TQrxvaGepQEuP9SdTk=;
        b=OyC9JAtZ1lxoGKaPiKtE4HkaKSWBvpBxOT0LausosJHs6ockygfj2act4gzI+EjR6d
         lOS2RZNFDC3q0UeB1SRFsl4VGrs9QfYW9Tb4S9aZMCQkSD3m//0iML0+rEooAMgfOvBZ
         2DELL6TyFKDkDuEjkSm5xqQkkmbfjt5bOXqIwXmPsCVlsmRF5xVUV93QYEGUErtnh2ca
         p4RaHkK38JrXM0B5il30EII8Iys0ym8VEKlq7X7bp2pYYIl+Jpld4S/E0knFTmRsEEde
         CBXy5jyqhXkQHrDdiXrEQWIj0uC76NEmgATt9hXiUE36pfMWiNfXDLy33n/1h0kh3I60
         3pCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772649176; x=1773253976; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceoxTnbBzYaWAmxiCz1LrHsBpNMLveQPK1ZBQa9r+Hs=;
        b=h8eI4S0DMIztxPHkpn///bvqEvKluNxbv85A1m4bZFqCfizy1nDyImxN4EVHeAEdaa
         z199G+tMIZs3hC90Lzoc5+N6JmM8e5fArFvMvV9+7EB28zhpOp0ihrhvV67LmmFGj7+m
         9BszopvErEvBRcyAsKmRla96gtHuykqeWzyHwkud7l3phj4B6VpvfF11IKRadK39kBP5
         Uea/9CIAUw84Y7GlC4/UxEjfHAZUKiPpNfWfdHaGDjlgPCdDcNrSyiPlLf3YcIEIzh78
         ySYBBw1QVlLX8FYwHfnGmX65BoSxipnOfIFYJrJtnQYJKOkL4CPKmgsvCRQNP8YwQtRv
         k23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772649176; x=1773253976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ceoxTnbBzYaWAmxiCz1LrHsBpNMLveQPK1ZBQa9r+Hs=;
        b=Wx5Z8GCaJXRbAuw203yD9ajFCvNvhxvx8IAqzpnVLQRcRG8shE7yGCa8mzsq2H/kqb
         iKebjgWk51WJ5xQH7s/vCW4Hd2NIDeRQef0zC+lYGcjRWD7CfnseLWeMxYKVNt+nQFKG
         6c85CMFRIHjE7MVGsW+I40H5g+IwXN5GMjxpzz0PaGz0B3JRQ7Ly79BHSlDSmpzUkOV2
         dW3fX+mPPj5DykPhRyiMwn6lOjliMaiPnRRvg/Ilr/tBNoy1rWfWb1KyxaZdObqKKjJj
         ewgo7HUxh+DcAydsCGDjn2AQf9eiC2qOl7sc8d8t+G8ejhvAk0yL+Y+u265b7vOWFClw
         T/AA==
X-Gm-Message-State: AOJu0YyOG7V2/9HiODKqn9NV1UMBV8cfN9jxmkA1K5wXcojisA+yaQD1
	JnC/N186qgyxJzJZuTH+3tvAjhj45QaCEO3DfGscpPB8Dq4wO/DPM2PzoMWRuR+puQCAQ2SvwOp
	oFmArO8p/7eMmMjbSnHoGTk9WscNfgnE=
X-Gm-Gg: ATEYQzyWh0SVWgFcfwmJsjTyj7OeLSScDSD3El0gdrWGwyJEpXRon/AlIpYvST6ZIro
	tcoYoR0kfC2Uo2BY6GFIx4oKl8E017IjBgx0YNprT5cN4dx/4ou3qe8986aRJfojN+JzHLv84tw
	BYerco4CA/znFKGGN5kViMEkPW15Xjc+CPpqIaVF3yirdDus1G6d/OBBijaQSDOW51MISbenxdg
	lqPqncUd5G9L7k25KJx40mrm12YgV+ns0QM89EYzgxLEY1cn/qKtJ3npNYHPFWOfXKOhHxVRYC3
	Up/a0A==
X-Received: by 2002:a05:622a:14cf:b0:502:9e4c:2670 with SMTP id
 d75a77b69052e-508db2ed117mr38007571cf.27.1772649176475; Wed, 04 Mar 2026
 10:32:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603042237.M1MDFjps-lkp@intel.com>
In-Reply-To: <202603042237.M1MDFjps-lkp@intel.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 4 Mar 2026 10:32:44 -0800
X-Gm-Features: AaiRm52ohnlsdagqdMUktrTS-I2u9pAA3QtBVPwXvJsN93ZY1jEaK8tCvCmVWz8
Message-ID: <CAJnrk1Z77x09DT8yLFhBB8msShFv4V4xOSKWrVHp1THcUhjO7Q@mail.gmail.com>
Subject: Re: [linux-next:master 3223/3431] include/linux/compiler_types.h:706:38:
 error: call to '__compiletime_assert_430' declared with attribute error:
 min(outarg.size, ((loff_t)(~0UL) << 14) - pos) signedness error
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Miklos Szeredi <mszeredi@redhat.com>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>, "Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 6:45=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
> commit: db64b9107f146940606d512f1d6214323b905565 [3223/3431] fuse: simpli=
fy logic in fuse_notify_store() and fuse_retrieve()
> config: arc-randconfig-002-20260304 (https://download.01.org/0day-ci/arch=
ive/20260304/202603042237.M1MDFjps-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 9.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260304/202603042237.M1MDFjps-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603042237.M1MDFjps-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from <command-line>:
>    fs/fuse/dev.c: In function 'fuse_notify_store':
> >> include/linux/compiler_types.h:706:38: error: call to '__compiletime_a=
ssert_430' declared with attribute error: min(outarg.size, ((loff_t)(~0UL) =
<< 14) - pos) signedness error
>      706 |  _compiletime_assert(condition, msg, __compiletime_assert_, __=
COUNTER__)
>          |                                      ^
>    include/linux/compiler_types.h:687:4: note: in definition of macro '__=
compiletime_assert'
>      687 |    prefix ## suffix();    \
>          |    ^~~~~~
>    include/linux/compiler_types.h:706:2: note: in expansion of macro '_co=
mpiletime_assert'
>      706 |  _compiletime_assert(condition, msg, __compiletime_assert_, __=
COUNTER__)
>          |  ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:39:37: note: in expansion of macro 'compilet=
ime_assert'
>       39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond)=
, msg)
>          |                                     ^~~~~~~~~~~~~~~~~~
>    include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON=
_MSG'
>       93 |  BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
>          |  ^~~~~~~~~~~~~~~~
>    include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cm=
p_once'
>       98 |  __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_)=
)
>          |  ^~~~~~~~~~~~~~~~~~
>    include/linux/minmax.h:105:19: note: in expansion of macro '__careful_=
cmp'
>      105 | #define min(x, y) __careful_cmp(min, x, y)
>          |                   ^~~~~~~~~~~~~
>    fs/fuse/dev.c:1790:8: note: in expansion of macro 'min'
>     1790 |  num =3D min(outarg.size, MAX_LFS_FILESIZE - pos);
>          |        ^~~
>

Sorry for missing this - it should be
num =3D min_t(loff_t, outarg.size, MAX_LFS_FILESIZE - pos);

Do you prefer a follow-up patch fix be sent for this or is it trivial
to fix it up locally in your tree, Miklos?

Thanks,
Joanne

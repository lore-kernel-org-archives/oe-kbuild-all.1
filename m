Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C865D1F9ED9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 12:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732709259; cv=none; b=tID8HKpq24EDEyNs7vpIeC3vK8qnRDz4WRux2SNvKgsgGifeacjWn4X1CTmUgtKe9RSoK2C8baXjRjtBm3SwQH+KVFrDoUyu0BBGHU2Dv1xsCDsVdTlsqCqcXb015mlsRD9zqAMUAEwQgF06sKQeWp+2LFhOZ/6mz/6MD744Vqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732709259; c=relaxed/simple;
	bh=0DAwBIuwfDFeVjAyyl2kiKCxxuWS8YClRsH5Rv23TIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bq4r9XFcuT9Yj77SqWJfqxzVpfbbq3KlXeoyOEjI07/X4bSxmBOGms4+xsV+WRBGTUdayelLLE9OAhl2G/JbwXcU9i9UtIXXX0Ttd0vc50kw6iaXh8MTkyUTOBsV/Ejzv6Rc7M6JGU0DSTq8Hg9dnQ2OMj43n5rdlNtg9Eyds6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pxTxw+Dj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pxTxw+Dj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4349f160d62so30521865e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 04:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732709256; x=1733314056; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWm1TWYufvmfNpaeEtp42v64UUjDvzA4BzbXGW2BVf4=;
        b=pxTxw+Dj2fwiSbCkpawh5EMMLl7jzlkdonYvRrMnhOTl/4/BSX6t6RdZl8gbb6Y5qF
         JyLEf16pxWs99+4ChNWRK4EUNMnp9E9PbrC/BummB9qAgrOYoIJoGwn+sX3fW4LYcNYA
         0ID0twKodVB142sBGN6NxNuGMojeD7YFxiRyEZT7nsZAiAokPneh74yKMPRDcyCkdJDj
         Tqxf0ANGmIuPMjigXwXF1lLreXHfAcXF92kGV74jsuvUg2ic9m8r1ErmJTl++7ovcuHp
         0e6pr1KdI6Gvis74jqGHu9oEUcZ6qOkpllO7dVfxmsP+rcsnxhN1ZRSf13YkfOvJsYy5
         lyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732709256; x=1733314056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWm1TWYufvmfNpaeEtp42v64UUjDvzA4BzbXGW2BVf4=;
        b=w5t4WMT7cnntJb+B6yHZe8h3jqNaGAhJD8LhIka7rQrjGrbkUnTPBrnLnvyKYh09Yv
         IfQb23A/U/zAeDmHhXNWRNy5R6z67VfUcQ6YaDsaVFDHeagIW2MM04ZPkIWSQThAzeHq
         eAQOrANSS6ehATdM+DBAmcMA5x/THlsvP3NLZEHT0zBsooF1H48rXR+eHEfequJzENRO
         dB+OCyh9XBYRA0M3rQf6mp6afbrduQq0i4Ja9r0rgzsIcjEyD0l3ImhPqdIalOMzzm8h
         JVpxCsUdnHzx8EOMYOswf3LieSr9ZJKbTgpxSEf9Qsjj19i/8S9x+toNuXTotRT4jWYR
         X4vw==
X-Gm-Message-State: AOJu0Yzce+jZtupfEwviKvHZRLIZs4JZomUXPRRShE7kkMQpi/5MS21k
	44VXRc4GwwWVFnBQGuVvUE3BK2ZokL8p2WEBhLZ+3Q6MXQGGagVFUcscibr5PRvPAtmwsFJEf+j
	+cub1/2gS3q5/URnVsCrBNEorw7BxD6eT25ih
X-Gm-Gg: ASbGnctF7zurC/KMSzMXzCH22WO+G1ZTgnBnpLIquL/xPly7KTqfqv03D3wBljh9hs5
	9We0piaV9gBJKA9XkWaYSeHnOnS1IZxT58w321OnfreFHazhI1HmI7j3UH5/Y5Q==
X-Google-Smtp-Source: AGHT+IEU7sCQZACTxRM+APpfp1z3LglXVBsKbLEmt9jC3z9LLn6MH3hFnU0ce83BO+yNXFOxsujS3zXOPd85Sp63IP0=
X-Received: by 2002:a05:6000:1fad:b0:382:4b80:abc8 with SMTP id
 ffacd0b85a97d-385c6eddaf1mr1952403f8f.46.1732709256079; Wed, 27 Nov 2024
 04:07:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411271011.gFsgMWRv-lkp@intel.com>
In-Reply-To: <202411271011.gFsgMWRv-lkp@intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 Nov 2024 13:07:24 +0100
Message-ID: <CAH5fLgiH+hu-VA4GTCWRaEBVXoENX36P16EQzDadJptNi=vk8Q@mail.gmail.com>
Subject: Re: rust/helpers/jump_label.c:10:5: sparse: sparse: symbol
 'rust_helper_static_key_count' was not declared. Should it be static?
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 3:38=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   b50ecc5aca4d18f1f0c4942f5c797bc85edef144
> commit: 6e59bcc9c8adec9a5bbedfa95a89946c56c510d9 rust: add static_branch_=
unlikely for static_key_false
> date:   3 weeks ago
> config: um-randconfig-r111-20241126 (https://download.01.org/0day-ci/arch=
ive/20241127/202411271011.gFsgMWRv-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5=
92c0fe55f6d9a811028b5f3507be91458ab2713)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241127/202411271011.gFsgMWRv-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411271011.gFsgMWRv-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/helpers.c: note: in included file:
> >> rust/helpers/jump_label.c:10:5: sparse: sparse: symbol 'rust_helper_st=
atic_key_count' was not declared. Should it be static?
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/mutex.c:11:6: sparse: sparse: symbol 'rust_helper___mutex=
_init' was not declared. Should it be static?
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/helpers.c: note: in included file:
>    rust/helpers/spinlock.c:16:6: sparse: sparse: context imbalance in 'ru=
st_helper_spin_lock' - wrong count at exit
>    rust/helpers/spinlock.c:21:6: sparse: sparse: context imbalance in 'ru=
st_helper_spin_unlock' - unexpected unlock
>
> vim +/rust_helper_static_key_count +10 rust/helpers/jump_label.c
>
>      8
>      9  #ifndef CONFIG_JUMP_LABEL
>   > 10  int rust_helper_static_key_count(struct static_key *key)

Can we turn off sparse warnings for rust/helpers?

Alice

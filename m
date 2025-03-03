Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB8F22DFAD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 18:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741027403; cv=none; b=AHf4kLSYNp5oJhDEjYMCa3R5SfigjKFcDyyzPM2BvOZlPUZEdLeqqs3D+Rvf32q0NjYD5jQK3bwSgfDXXr5141APNfr7R51hx5PyWm8swa/qkaYEHhqN3SDJNjfWSJo6mg2KK3177RxaUzNy99THPujBoV437l1MBW6/SxAvye4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741027403; c=relaxed/simple;
	bh=T3tAXzw45yILnfI7CfOutrgJFUSDJ1BtL6o/yGwTbk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KjtIWKxClKQGb3zoJtXSUQ20bKdTeW3oBFszGFQiQpDvEAhgplJNFEKnpyHfKjmZgJmbKFbqbQzAPJWP6efvDXpCXaFTJ3OyK73Xwin9mTunQQRESpyA3TUID/LvoCoDWOv9tARAaX15FNfxykRc1qXrOi3KnTL4mf/SHDH4p9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OaAk/Vml; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OaAk/Vml"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390effd3e85so3473346f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 03 Mar 2025 10:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741027400; x=1741632200; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0Qj2do2lKjHM4up5hNRdCkie5ZUt4A6ZgQ1FxVoTq8=;
        b=OaAk/VmlTauLUBXJ3Z3n/m90j6R2jCAA0w1plJ5ecRW3Hs+VIDFT30bqlSOMg++2sQ
         jsJxf+xBlYbnaqkqlKdB3QKnIWIdoclahn0sPZMzfkffP0cWuOLCUFTojWQIiN7iafLR
         Xc5itZjLCGnZN+v1r/Fe/FPXXK9Njs8H61fuVGTD/NYRPUJ6YTR86h34S38xkw+GvlHU
         ZGRWhWy/8dnpa8KeIhymTiIff3KcjLzzxx8stq9R6377VWtJHADxGjYyVD5Ji3UCKRCb
         K8bYe2SA3C/wWz1VenYvBgRAm+8HPG0/lgLLxMmti6N5EzjTl+wnd5J1JwStipdJX8r8
         b6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741027400; x=1741632200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0Qj2do2lKjHM4up5hNRdCkie5ZUt4A6ZgQ1FxVoTq8=;
        b=q2t098tpaX9+8zKw7c78cIiqSkCC3XWa/2PLGMLaVTEpGEanY9ZzjzxGDjjCCcxI+8
         gEoD8A+GS+pbY9wGqPc8kfBXhVCK9Y/uDoFcY3TqpzrgQxdGKuQXuSCyw1tWm02RtWiL
         HWW3Esqx5NLz4igsN5EkhvsscRegaZUKnky3n/n5Wknl60hyiSL59lyoQxFpgOMNyny1
         +mexTESfbm+j1nvMvIoz0eyL69jClgmTdIwztJzcxhaOnNhAq48FhIIQcdAuaHBlSz4A
         AhtNaMWmsw4Tvo+9nEDYOqd2bQgD1qG+UsU2QYHBZtGC0Zvs31KZilDrsf4WqdC9Hn4q
         f7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUwXr7D37PQSNoTAIIKIf/hoaNzee5ZIH+DmryX+qVSi6tKZAQdlfB7lbv7XE9T/NOjzW0JOx/C3fW3ci9n@lists.linux.dev
X-Gm-Message-State: AOJu0Yy97NmqD7SL8FE9PBsGyxwDfNaJ7YbQ0R8KS2d6uUlA2eWWYwJx
	wAu5B+etEtSP0wcPvc9ki8TIv+Rf0fgol5qy7Hiawvlhz3S/jopYQ4MYINHt2gmtrbgIyTHmpgt
	kDZSzb4Sd7XQs41Y9Ssp+9TTAZmU=
X-Gm-Gg: ASbGncvjXwwDn//MHJUZ8h9narTJEG1Imjxj9BGQNOLYAhKaa6ICqXOSMigRxnA8ZVv
	48GJbHRTYJ53KEliCwZTGq36NQd4Ebj92ZbGLiLAdqAh/vel+vjNIn40Py3fwt5hOFIbBkBaWIa
	WZxAPPEfjHNRQUui1NUZ1h9G3u0STnCdkGPpr88dEnHQ==
X-Google-Smtp-Source: AGHT+IGDDnMZt3CWNMZ4/sQPWl3Fx2tgxAa5xRzjOQ98uGHkSButjm55wGRCRQL9ya4vSsAelL2gDCTl1KIzjuqQ0EM=
X-Received: by 2002:a05:6000:156d:b0:391:901:311c with SMTP id
 ffacd0b85a97d-391090131camr3764566f8f.32.1741027398340; Mon, 03 Mar 2025
 10:43:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2c82b29f3530b961b41f94a4942e490ab35a31c8.1740978603.git.yepeilin@google.com>
 <202503031631.OeUhVRHz-lkp@intel.com>
In-Reply-To: <202503031631.OeUhVRHz-lkp@intel.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 3 Mar 2025 10:43:07 -0800
X-Gm-Features: AQ5f1JoRxo3CAzV2ykcVy66gZAUbFkQeh9Ko6yETGexZgoB5dBAptBGoLyQICIg
Message-ID: <CAADnVQLLhNRmpjwDYHB0-59TDrGcgXzqSkop+-5eHYsG-Ws08Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 04/10] bpf: Introduce load-acquire and
 store-release instructions
To: Peilin Ye <yepeilin@google.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	oe-kbuild-all@lists.linux.dev, bpf@ietf.org, 
	Alexei Starovoitov <ast@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, David Vernet <void@manifault.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 12:55=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Peilin,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Peilin-Ye/bpf-veri=
fier-Factor-out-atomic_ptr_type_ok/20250303-134110
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/2c82b29f3530b961b41f94a4942e490a=
b35a31c8.1740978603.git.yepeilin%40google.com
> patch subject: [PATCH bpf-next v4 04/10] bpf: Introduce load-acquire and =
store-release instructions
> config: arc-randconfig-002-20250303 (https://download.01.org/0day-ci/arch=
ive/20250303/202503031631.OeUhVRHz-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0

...

>    kernel/bpf/core.c:2228:25: note: in expansion of macro 'LOAD_ACQUIRE'
>     2228 |                         LOAD_ACQUIRE(DW, u64)
>          |                         ^~~~~~~~~~~~

Peilin,

how do you plan on fixing this?
So far I could only think of making compilation conditional for CONFIG_64BI=
T
and let the verifier reject these insns on 32-bit arches.
Other ideas?

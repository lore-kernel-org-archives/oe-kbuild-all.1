Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792996041;
	b=TVmWfkZTnoMXgcIdqEeKqlUxlR/GEjrpahUnCFH1Qzv3p2ovclbf1VbiCdabwmNiTYwI
	 fCMsgmjX3MX47Rs6R6YiyebFAVld0Icdnv6h+ghkx5y72yiTAXm2dKiTAdNr5ADkPNPlQ
	 vpdDytp0yDjUWYcVpggvHq4cRRdcjuLpddlqfp3DXjXS9pia2YK3viQOe3DwVhkVr+11+
	 P85oaWkwoRgsUCJN+zoHm6cJ1q7OkJJh7yXcz6ht4jfKq23IDhlfNVhfUD636GoYIXmjC
	 jjbfl0IlPBF6HL9+UL/zhJSUmOZ0cU5GKYfLRjcQpw058u7P3ebbRR5AMzYdDtaHIEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792996041;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=z+IKLIStpOdV7cxZ4x1g/LuE+pvqSjom4YK/4yyIQRw=;
	b=MYlr7EvOOeZaWXnNkDBF2yZFMDwFTG6gBTWa+hvgC6nd5/B4tOiSWFI4P9dbYYKK6Zr6
	 KnkSg8IwCICE2u/jpxa17vT0pHPESWZi+QpyrKEggOlm/jzycpFyhzkUIvgQl7MQF7XeW
	 nakE31VOSPH0GT3bmEbRVw7g4GNe276mgeK6JIRgA94yPpz9A0dTzYRbd8Hq4OZD8dfFf
	 nEa3+ytYsvcqT+9d/4l0EvW0NZIDXi8P9zgicGcAo76y/GfLlQSO3tRtB4MIdlp0OgbdA
	 jhgWCeMReCaJa5Jjnqp08RhzrLHk7REEWvJnFdqfZ+JPyjbkRJbpXOdfKXNZmdYh9Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jcHS5bX+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A21606A31B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 06:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jcHS5bX+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76BD1F01829
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 06:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792996040;
	bh=z+IKLIStpOdV7cxZ4x1g/LuE+pvqSjom4YK/4yyIQRw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jcHS5bX+/RNNoAQ77gkQX7I4syq8GLlFB9CHymLAXq3XBscNuP7YKr4N9f9JnhuRV
	 dyx6cMMKEWpZOQ3bmIwgrzawLcC3AjJ2EUMBFL/+VSUQ1peyXz6yySot3uJdEqDlW2
	 IU8loSTj9pyTvbm8mKuMdlitkwdisMpRAvgKGBjAUAxBU3A7g8JEF1OM8UXQUx17oE
	 D7hMm/OVWjc8/v8eGTVaYyPgxueTYXpWRRISHVROUM8BPZ/vICSbOVqC9sZjIQiBsa
	 FQCjTE4jeplpt85RqyTDMU75JA3O4PkWyipMo4qqlxj439bqGKjrlvmOvTgmozTGpR
	 rUrMNC9bxQD4Q==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so4148581a12.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 23:27:20 -0700 (PDT)
X-Gm-Message-State: AFq9FYIjAXdZ6gk0D9OEBtBUDzZ0/r05p9WHuQI7SwM/KVvIMXZNGxrU
	DNFF4o8CwL6mcAUQlO5wH3opzTRMIFWhanL8UPwI46aRTYm6S+xogWXgpFH5Ejc8qnow0dS4zRA
	6H7DgyrAh/yla32I6JNNXxW43EMf64rE=
X-Received: by 2002:a05:6402:5191:b0:6b1:b97b:744 with SMTP id
 4fb4d7f45d1cf-6b442ff3810mr8308596a12.32.1792996039548; Sun, 25 Oct 2026
 23:27:19 -0700 (PDT)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <202610251743.jztr17Ib-lkp@intel.com>
In-Reply-To: <202610251743.jztr17Ib-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 26 Oct 2026 15:27:07 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8YEY_JacArmYATL2k6oijj5rvpkj6-N=g5TfOmotYi_w@mail.gmail.com>
X-Gm-Features: AclHuK8ADwX2ZrvMNEXtD-P6YLT3ttzb6ENxFz_uNT2-eJeVMh26idfZvmZGAQk
Message-ID: <CAKYAXd8YEY_JacArmYATL2k6oijj5rvpkj6-N=g5TfOmotYi_w@mail.gmail.com>
Subject: Re: [linkinjeon-smb:ksmbd-for-next 55/96] include/linux/compiler_types.h:702:38:
 error: call to '__compiletime_assert_1021' declared with attribute error:
 clamp() low limit msecs_to_jiffies(1200) greater than high limit 6 * 1024
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 1:24=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.gi=
t ksmbd-for-next
> head:   ed0063dd214dce027717f64817c594cc1b2e1d41
> commit: c0632d2010ffc006eed9becc8d0d10d54f294bbd [55/96] ksmbd: track del=
ivery of queued TCP writes
> config: mips-randconfig-r2105-20261025 (https://download.01.org/0day-ci/a=
rchive/20261025/202610251743.jztr17Ib-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261025/202610251743.jztr17Ib-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610251743.jztr17Ib-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from <command-line>:
>    fs/smb/server/transport_tcp.c: In function 'ksmbd_tcp_writev':
> >> include/linux/compiler_types.h:702:38: error: call to '__compiletime_a=
ssert_1021' declared with attribute error: clamp() low limit msecs_to_jiffi=
es(1200) greater than high limit 6 * 1024
>      702 |  _compiletime_assert(condition, msg, __compiletime_assert_, __=
COUNTER__)
>          |                                      ^
>    include/linux/compiler_types.h:683:4: note: in definition of macro '__=
compiletime_assert'
>      683 |    prefix ## suffix();    \
>          |    ^~~~~~
>    include/linux/compiler_types.h:702:2: note: in expansion of macro '_co=
mpiletime_assert'
>      702 |  _compiletime_assert(condition, msg, __compiletime_assert_, __=
COUNTER__)
>          |  ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:40:37: note: in expansion of macro 'compilet=
ime_assert'
>       40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond)=
, msg)
>          |                                     ^~~~~~~~~~~~~~~~~~
>    include/linux/minmax.h:188:2: note: in expansion of macro 'BUILD_BUG_O=
N_MSG'
>      188 |  BUILD_BUG_ON_MSG(statically_true(ulo > uhi),    \
>          |  ^~~~~~~~~~~~~~~~
>    include/linux/minmax.h:195:2: note: in expansion of macro '__clamp_onc=
e'
>      195 |  __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(=
l_), __UNIQUE_ID(h_))
>          |  ^~~~~~~~~~~~
>    include/linux/minmax.h:218:36: note: in expansion of macro '__careful_=
clamp'
>      218 | #define clamp_t(type, val, lo, hi) __careful_clamp(type, val, =
lo, hi)
>          |                                    ^~~~~~~~~~~~~~~
>    fs/smb/server/transport_tcp.c:699:4: note: in expansion of macro 'clam=
p_t'
>      699 |    clamp_t(unsigned long, 6UL * inet_csk(sk)->icsk_rto,
>          |    ^~~~~~~
I will fix it.
Thanks for the report!

Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD2A3803F2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 06:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772431396; cv=pass; b=GEG19tSa8tuft3grs6EoHCQev7o8ZhhDRODrKj8S9MWTRYb6ZmOyxMNSKK/pB2bmv0GFZXeKPEdsgTrkHDUZNNj7g7Q/by3kyMGfGiIdkd6ppS9KpdcbDiJGOTFffMKjUqpLLu2UTOctf3mVCoECyJFyBh66Cfe2+5r/v7TPjxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772431396; c=relaxed/simple;
	bh=VoL9+Q5vKBh/stH6CbzLSnBWXCrGTyp5hmi39PUL9ZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJVTqX1dSGYmJAJl5EWN53aQNBQBy9sOxFS2EDSoPkZj607d9Wosp76MjVMyar/o1WTKqgOiydv3NxePnoJXStBdVqX+iZpjcmPXcp0SCQe5f/5jKpKPWbc1aJ19QRO1bE5/CuGVUZ70wIAQNLEMK3Y2GhCjgPNLr8+2ECK6vq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rDkRMd2Z; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rDkRMd2Z"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-506a321cc53so47971961cf.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 01 Mar 2026 22:03:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772431388; cv=none;
        d=google.com; s=arc-20240605;
        b=a6KowpNaCR8r5p29HT56VCyKZqjP2m2JnNHKpiNRvQJ4nE0W9v8ru08KAHvPKprTH1
         jdoZVe0rXfj9Pl3nlELEEkEpsq+s+XyRc2NDKv+3YBeTbF60wD85SJtipsjZiehX+VRM
         OBy9S+EPOvW1DJdt49zzL4xc8mJL2xu8cGTqhR6nnny9wrnV00AHrvtQDJ/kfGFWo8nd
         ktVJKJGU5RGi17KmDSh/BxEOfZeq5k5taw0+xxM23x3gMgCCFTYtT8jyvb29P6MkdaSo
         1/JkPYRpQXOCAlCQcTgUsamJLEKsME63h8KGuTUfCgI3NP2UfDXRaEAZvO9XCJRXm78q
         +LZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UjR2Jso0hAuDoeUEgb8RQHlOodoa5Tiq2cd7ca0LZWk=;
        fh=YMivqOkP726gur4nf7heYyT+ZnHaWCgGm8YOpsgpgQg=;
        b=HgVVJoy8rMhdJMO9QWk4yiIh8rFqBkPTRCrjT6UChKrbLRA3E2XfaOIaGultn6QDim
         xgtkKSC2VTGBG8fTWTgTOlR+cevaf4kp2Y6PDbTyzF43eCuTwYIwB0CD0Vn56CDsKj7f
         DIPrZOjvQqW81J+35p9YB9W1axDlcgsr+05LfP7ARqyLtLWlLvPpKi6fvmebHxo4CgBs
         fr2OcGKWYeqJgQIOk6auIS77nkIS5IjBTlYOnqTED6uttBGI/oe/ljerixtBj/Eb/CKJ
         /S0lrOkJ9zM8ECWbfHIu6f5Po/jAT+fw66p90WAbnB0tJCdhvxEcIGF8lXRnqUjyDYd/
         zFgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772431388; x=1773036188; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjR2Jso0hAuDoeUEgb8RQHlOodoa5Tiq2cd7ca0LZWk=;
        b=rDkRMd2ZOFss4L04qF557h70F/NLoSaCGyP1LWDueoHiJ8dtiaE6cHF7eA3onW2/Z0
         xTMnkn7oM8EKI3vkGF9c0Yn99wBVmQWPrjyCR67xa/OkX5kxphfnG/TvIjWaqNje+Scc
         lp96cGC1zBQPQvWPjGXORmPq3fA+7CPls3IY9sLizW8ob8J98tpf/Bnr/zUJWAoQOE8/
         22FA5E3cByZC8yQZnU1lwqeOVuzDYbL/tBPP45E0ZQ10ychX17JHNEwDZc31Kj51hiBN
         WUzunu4ZKLJiwsokN5pZOYF2GC3g5geER4lz5BaWkAjoJ8v+8W8DbnfeZ6u+liljdAeR
         4x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772431388; x=1773036188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjR2Jso0hAuDoeUEgb8RQHlOodoa5Tiq2cd7ca0LZWk=;
        b=LnY5gp3dfzcjIHKwAcz8HnB2StNr1pYvxfkZGEkuEN8hLM2Ekwmi0aPTGu8xgs5lnA
         hj2ABneW8LYuElJjGUrawaMPR5ptWnj5DnFHxh8yLyssU8XFIvtzlm+f0CnS6GaSN8FD
         DeFKCS0ReKkeeGfRxgWzRdeHF6ycryGP9DkaDSAX2Pe3+n5ZI9euEjMQNtlJgn9C4kCB
         HX8Ba5DLl4HvjTY/VteCzBMj3RcLKEwkUG6VhaEC/1JGqSYshdKrtp8yiJ8KVH8wwLqA
         q0NILhNC4H97ymffLT0Nm9rDx+NmR6IT0imJWFXrx4QdtEgtY6Q4s36WaeqQrFlAcRs8
         hBDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSdD4dPLlkHYSRevhGMxjSqBECoA7dwU0zuXV2nH4Al2bOeCppCbA5N/2ssf6BMuGjuqlAt2qUtCiXjFSd@lists.linux.dev
X-Gm-Message-State: AOJu0YylD3diL0Sw9mKXs9TRCfvrdtr6eiSBf1IM3QF2l4F/XK+FpD1n
	vxhXYrUQ/wyw9k7+GcgDi74zoEUGlSzLdXxm30RGuHGVNQc5T7p9PeKilmNMhKGk+2y6C5CNXsk
	amNG5m/wpozgQzajqm4eDdQYX6Mr2AMt7G1wsjzo7
X-Gm-Gg: ATEYQzwPVMeUJ7xKF2gpXzkKpO66I0iBXZj+3WeX9RYDCcs8vguKMk3MLXo9mHlr6sU
	nIek6pE4moCIF5kiWICkL1EAQSesteB3OU3C5Yh9mdlhU6dGOVfJK5wDAedsFejgIWGUz8SwkIV
	O8jSNeI4rSqd/JgnaoZahwCkJKlDqpz02kva2tSixmPGePcqs/3/6dB+++XyemoXtT0L9yVKTD6
	OTa0Xt/VjctAtWpG1tDlKePFC0k2hcdyeA9UguufxFzSIbK20tZ24An7u8AfqHRd9DjupyeHTqR
	pnQ7jAs=
X-Received: by 2002:a05:622a:5ca:b0:4ee:bac:e3a9 with SMTP id
 d75a77b69052e-50752a0a185mr159644611cf.68.1772431387431; Sun, 01 Mar 2026
 22:03:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260301181457.3539105-8-edumazet@google.com> <202603020743.NEL0agrx-lkp@intel.com>
In-Reply-To: <202603020743.NEL0agrx-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 2 Mar 2026 07:02:55 +0100
X-Gm-Features: AaiRm53wQGM3WwCV3bQMeh1Dn2GLN-C3-snKzACE_E-q2yOPyIOVSeKUAVhiYKE
Message-ID: <CANn89iLCXFOuMSrNQY27CfOwTfzUoVMkq1Zd+-O50YtCMSEmDw@mail.gmail.com>
Subject: Re: [PATCH v2 net-next 7/7] net-sysfs: use rps_tag_ptr and remove
 metadata from rps_dev_flow_table
To: kernel test robot <lkp@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
	eric.dumazet@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 12:39=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Eric,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-a=
dd-rps_tag_ptr-type-and-helpers/20260302-021900
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20260301181457.3539105-8-edumaze=
t%40google.com
> patch subject: [PATCH v2 net-next 7/7] net-sysfs: use rps_tag_ptr and rem=
ove metadata from rps_dev_flow_table
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/202=
60302/202603020743.NEL0agrx-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260302/202603020743.NEL0agrx-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603020743.NEL0agrx-lkp=
@intel.com/

Yeah, in V3 I will remove the BITS_PER_LONG distinction, prone to
errors like this one.

 #if BITS_PER_LONG > 32
 ...
#else
  ...
#endif

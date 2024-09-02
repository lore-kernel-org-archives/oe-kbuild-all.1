Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B024F29422
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 02:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725244927; cv=none; b=PhL687MlyraIDe/L7RlKGmYuyAXD8jsa+7noSEpTMpEj27AiZWj5QAScQNxIEbz+sBLI3w+gt5bohfH57PNTtOlbYx8Hp04Lg2qqrJwGPIwMdVV3BZpnMQDPfXgQxus0/xkU7mg2FuQ1tcJYqvNmLr7cxAL3riNXiGEUL1AJY1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725244927; c=relaxed/simple;
	bh=fRQBjGtlnvDAfBgkDPlHm5l+iboxelN7tPUpU9ILVL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCW3QBVFjMWuJsPTjEIzQhv1msq3nj+adRrtdtJxLSwJdNTOomZhsEPon8BP+oWG1HJ3Mz3aP7mk0oCWqkDSdXU3BIbbmbtliH3IwMgN9SR3KRCEtinYWFUYTxrNGuwHxMGoG+fWlbR46Cdj+LtaiaOluPtwloShDN6svqsxCTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuEOlTWK; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuEOlTWK"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-39d4161c398so14354395ab.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 01 Sep 2024 19:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725244925; x=1725849725; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYVuWR+KJMOu7VVG8hiplGAK1TU6V31co4dLMl7opaY=;
        b=AuEOlTWK0NgfUFKJ7i9M+lPfbnWOXCF9JLurt41tf3EYjxdPK8fg1Xx2QG9wtEy0eg
         OBjuigVUP+QyNR65Eiq0+N0PQNm6q+A5bAGeJyinP15WRENidfBPp+mpCfCAcFfQJtB5
         v1VvTTmOevRd3h/XhU5Ja4bFzSLEln3s2BzbB34uHkcNhZwPEKu4LwT3tnkttlcOC+GT
         FrDmLFKCStxGHEQdljcGEuFlX4CN0C8Cup3noqkih1Fd3YTQcQIBUCDQQOpnRZ+iACuu
         I25w9R/PKM8+rxhULdFJ83z9CbGE7PQfusZSJguBTrDC9k4pVRzrUegrtVPgns9TPpwN
         1t+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725244925; x=1725849725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYVuWR+KJMOu7VVG8hiplGAK1TU6V31co4dLMl7opaY=;
        b=QUbo+ezWEzHDSEVuUVVMrbOJMhCIv/NHW9t8BTpcwfY9YWciiNIW2NIMoXKkbwoPx2
         D1JeWXG3kraLby/F7byk4gH8QwZR/MSqlJMW5BS0d1iaAO7vrE88DqeNaALShF8uhP5T
         Bhj7eNiNIkRUCReM0HvreXt5/znvZYSLzSJRN4TuY8CtG9QGvAtugHTACibLK217c1hG
         TpRiULQzNjosKM2sfrtAjNOp9n8ZAHI6VHGTThvNU48mXi4QYyhmiwtQOnam2Iv+nWe6
         rZwNF+oZNeYD9FCkCfA53OJICjSWAGt8rXH1b2v3mCEu5MVhqyL2kyRq/l81BCQsNDMn
         ETRg==
X-Forwarded-Encrypted: i=1; AJvYcCW4GoYFjQRwbxTcmkDbSyOrBQWwng7FfIIaTfYGtVyIySrctKc7Romng2zIgRIGh2eE01WDfc6wFYY1qG4e@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs86XxJehDEiwoB+3+4VQDUOvrEr3142HObwS3WYrwf/rViuJN
	AOpbdE3taMEfMUgeaWTkDZ3HQxax3rbgKyy9vtolpHaJ5kxxclZfQ1AhLzzeApj/7+jt+DSZ9Kt
	VO74Ci7S9l4+l/oDzSvy6QACUOiY=
X-Google-Smtp-Source: AGHT+IGU/4FmqbkrGxfuuIcBMSAIpnYMeDpJVcK8PuY2InxMEkx3irFDs6E+DBoWldDLN7taMAIn3PmFedOV+mIsj48=
X-Received: by 2002:a92:b709:0:b0:37a:7662:7591 with SMTP id
 e9e14a558f8ab-39f4f516a8bmr61004735ab.6.1725244924702; Sun, 01 Sep 2024
 19:42:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240830153751.86895-3-kerneljasonxing@gmail.com> <ZtUZpPISIpChbcRq@rli9-mobl>
In-Reply-To: <ZtUZpPISIpChbcRq@rli9-mobl>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 2 Sep 2024 10:41:28 +0800
Message-ID: <CAL+tcoDg5rEQpx7mAvOxFg71iOT9gWBy0+NzjWV4r6JfhnOG0g@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] rxtimestamp.c: add the test for SOF_TIMESTAMPING_OPT_RX_SOFTWARE_FILTER
To: kernel test robot <lkp@intel.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, dsahern@kernel.org, willemb@google.com, 
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, 
	Jason Xing <kernelxing@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 9:49=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Jason,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/net-tim=
estamp-filter-out-report-when-setting-SOF_TIMESTAMPING_SOFTWARE/20240830-23=
4014
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20240830153751.86895-3-kerneljas=
onxing%40gmail.com
> patch subject: [PATCH net-next v3 2/2] rxtimestamp.c: add the test for SO=
F_TIMESTAMPING_OPT_RX_SOFTWARE_FILTER
> :::::: branch date: 2 days ago
> :::::: commit date: 2 days ago
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a=
15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240902/202409020124.YybQQDrP-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202409020124.YybQQDrP-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> rxtimestamp.c:102:6: error: use of undeclared identifier 'SOF_TIMESTAM=
PING_OPT_RX_SOFTWARE_FILTER'
>      102 |                         | SOF_TIMESTAMPING_OPT_RX_SOFTWARE_FIL=
TER },
>          |                           ^
> >> rxtimestamp.c:373:20: error: invalid application of 'sizeof' to an inc=
omplete type 'struct test_case[]'
>      373 |                         for (t =3D 0; t < ARRAY_SIZE(test_case=
s); t++) {
>          |                                         ^~~~~~~~~~~~~~~~~~~~~~
>    ./../kselftest.h:61:32: note: expanded from macro 'ARRAY_SIZE'
>       61 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
>          |                                ^~~~~
>    rxtimestamp.c:380:13: error: invalid application of 'sizeof' to an inc=
omplete type 'struct test_case[]'
>      380 |                         if (t >=3D ARRAY_SIZE(test_cases))
>          |                                  ^~~~~~~~~~~~~~~~~~~~~~
>    ./../kselftest.h:61:32: note: expanded from macro 'ARRAY_SIZE'
>       61 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
>          |                                ^~~~~
>    rxtimestamp.c:419:19: error: invalid application of 'sizeof' to an inc=
omplete type 'struct test_case[]'
>      419 |                 for (t =3D 0; t < ARRAY_SIZE(test_cases); t++)=
 {
>          |                                 ^~~~~~~~~~~~~~~~~~~~~~
>    ./../kselftest.h:61:32: note: expanded from macro 'ARRAY_SIZE'
>       61 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
>          |                                ^~~~~
>    4 errors generated.

I didn't get how it happened? I've already test it locally.

Is it because the test environment didn't update the header files by
using the command like "make headers_install && cp -r
usr/include/linux /usr/include/"?

If the applications or some userspace tools try to use the new flag,
it should update the header file to sync the uapi file first.

Thanks,
Jason

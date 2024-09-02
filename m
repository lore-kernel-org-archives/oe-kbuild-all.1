Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40FA15445B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 05:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725253526; cv=none; b=nmH6UhKlhFnoL+2rpgKJRIcszyJpaSFxZxyq482h7k4kPBwLonUyxMzMovLmXNQowCAj29mWV8kKnvogrxs9GYq3iJFxkO2QEZpfElCckdKUnis7WR7FwByvI8FdxbaCqWbLDTdSZ2AEyKTlvFEKjYH8cX+qfoz4xBnZGMvzCZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725253526; c=relaxed/simple;
	bh=YjSKkk5AaZK3SGxgSqTIcqwVSkYiq33F+jspB0swlXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l255ow/60I/Zc89nUBT5BwjZ+6ZtU/I30MKrI2a5DXFc4Z5MZPyMrsI0CHmOAPLPQsHW7gl0w2oMjKItysUve2ByXF3uHtBs3Rw5lzqdOhiHt/fjZhbw4tYGrLT7FWVcMugHnQSjnjtG/yF5nR0zApmZ9tSPrXftcZSgOS695EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaGwnoKm; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaGwnoKm"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-39f4ec52c5fso6722155ab.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 01 Sep 2024 22:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725253524; x=1725858324; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2TWqbJDbwXPjIIRpGPoSbV9nXuYLQsW7xnpIAgHKkY=;
        b=BaGwnoKm7LkMUC10u0BVqupegSBbrB/AGfaWZLbTgJ2InWJYaXSq8X7JMslE166Ark
         Q+scb895IbTaViOknhGreWk+OZiOBKsLVS7qel+Q+Q4Qwq3oYVG0fB9wFij9q6mvBA0j
         VaxyYTeT1mEN4ST6uFtwGZNZFX5D7/ORSdEBqTZ9D4zzLERXJYqyFx56HJLnwDLuqBXd
         X1/7cmXvfY3W1szrMuEaqCkZcN/vIDKECo7iQ8OvJTw051UPf+TJso4w/qvcY4YZqUsB
         shXN+T0dqDlmUAeDd5hRFBY5joA0s0dXltXAbw0xWLBefy15KMif/7ei+Kdok2bAMRf0
         yoqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725253524; x=1725858324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2TWqbJDbwXPjIIRpGPoSbV9nXuYLQsW7xnpIAgHKkY=;
        b=UQEzMFjPlw8quyrim+bhGkutoliJ6zLF0218TUDcSOWYIOu8Xuj9MvegEy5Uoz9k0w
         UmH6HtFtiEZPGb4GvdgMj6WG4xEYnF7lTJjeUKIJDLx1h3BMwfgDP+zjkWnQDTRzK80o
         EDQuO4efFcS7sqn9CJm+mQfUqz1ODhTa94Q7S/dchsGmhNnAMi/u8WPPhpjq98A2iB2e
         I/WEwBrTr+21Ygdi71Gbh4ws1iE06PRa4u2AqPCeUPuF2sA5CJICMmFWmwvE3yLjAR3i
         GqhsTemohXfbREkUqDuBvnQILGqw1EdItaJm7x98zmfJEOM2iI7SD2H14Zth5blZskau
         vRMA==
X-Forwarded-Encrypted: i=1; AJvYcCUspTCrgBm7BBq10oXy0xfyBMz2xpw1DQ/Yynm8wyW/A1qmdbs/Xsanmgokycl75t6kO2Tv2lbozfkJ0Qjz@lists.linux.dev
X-Gm-Message-State: AOJu0YyCJxQoqVsl9iEkcL5bHGgASOdqj0C5z9nd8j+44qn0bwLJiaMu
	1q7spA7zu+1SQrGRP+XzCwtpO8bkN0hz2onrDzvqwSaMUBz+nCMnkPosycBBMv84WPdkUOwFe/e
	hxXDokeOHCPvauGD0gFbJJDo5tVI=
X-Google-Smtp-Source: AGHT+IG1VyHfZjalYJIqKIyNKw/sF6IhMej6C7l+bmZXB6KNHUd9UNuI58IkccdU6ygosPo8329/ErH6f1PP2xuQ7rQ=
X-Received: by 2002:a05:6e02:219e:b0:39a:1d8d:fc9d with SMTP id
 e9e14a558f8ab-39f4f6c1f49mr74980875ab.22.1725253523751; Sun, 01 Sep 2024
 22:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240830153751.86895-3-kerneljasonxing@gmail.com>
 <ZtUZpPISIpChbcRq@rli9-mobl> <CAL+tcoDg5rEQpx7mAvOxFg71iOT9gWBy0+NzjWV4r6JfhnOG0g@mail.gmail.com>
 <ZtU+H5md7d/Svo0u@rli9-mobl>
In-Reply-To: <ZtU+H5md7d/Svo0u@rli9-mobl>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 2 Sep 2024 13:04:47 +0800
Message-ID: <CAL+tcoBL3ggcGOJXwsxXtq-OLH9Hjmou8se4eU8BKUWTOQjJHA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] rxtimestamp.c: add the test for SOF_TIMESTAMPING_OPT_RX_SOFTWARE_FILTER
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, dsahern@kernel.org, willemb@google.com, 
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, 
	Jason Xing <kernelxing@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 12:25=E2=80=AFPM Philip Li <philip.li@intel.com> wro=
te:
>
> On Mon, Sep 02, 2024 at 10:41:28AM +0800, Jason Xing wrote:
> > On Mon, Sep 2, 2024 at 9:49=E2=80=AFAM kernel test robot <lkp@intel.com=
> wrote:
> > >
> > > Hi Jason,
> > >
> > > kernel test robot noticed the following build errors:
> > >
> > > [auto build test ERROR on net-next/main]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/net=
-timestamp-filter-out-report-when-setting-SOF_TIMESTAMPING_SOFTWARE/2024083=
0-234014
> > > base:   net-next/main
> > > patch link:    https://lore.kernel.org/r/20240830153751.86895-3-kerne=
ljasonxing%40gmail.com
> > > patch subject: [PATCH net-next v3 2/2] rxtimestamp.c: add the test fo=
r SOF_TIMESTAMPING_OPT_RX_SOFTWARE_FILTER
> > > :::::: branch date: 2 days ago
> > > :::::: commit date: 2 days ago
> > > compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project =
617a15a9eac96088ae5e9134248d8236e34b91b1)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20240902/202409020124.YybQQDrP-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/r/202409020124.YybQQDrP-lkp@intel.c=
om/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> rxtimestamp.c:102:6: error: use of undeclared identifier 'SOF_TIME=
STAMPING_OPT_RX_SOFTWARE_FILTER'
> > >      102 |                         | SOF_TIMESTAMPING_OPT_RX_SOFTWARE=
_FILTER },
> > >          |                           ^
> > > >> rxtimestamp.c:373:20: error: invalid application of 'sizeof' to an=
 incomplete type 'struct test_case[]'
> > >      373 |                         for (t =3D 0; t < ARRAY_SIZE(test_=
cases); t++) {
> > >          |                                         ^~~~~~~~~~~~~~~~~~=
~~~~
> > >    ./../kselftest.h:61:32: note: expanded from macro 'ARRAY_SIZE'
> > >       61 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> > >          |                                ^~~~~
> > >    rxtimestamp.c:380:13: error: invalid application of 'sizeof' to an=
 incomplete type 'struct test_case[]'
> > >      380 |                         if (t >=3D ARRAY_SIZE(test_cases))
> > >          |                                  ^~~~~~~~~~~~~~~~~~~~~~
> > >    ./../kselftest.h:61:32: note: expanded from macro 'ARRAY_SIZE'
> > >       61 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> > >          |                                ^~~~~
> > >    rxtimestamp.c:419:19: error: invalid application of 'sizeof' to an=
 incomplete type 'struct test_case[]'
> > >      419 |                 for (t =3D 0; t < ARRAY_SIZE(test_cases); =
t++) {
> > >          |                                 ^~~~~~~~~~~~~~~~~~~~~~
> > >    ./../kselftest.h:61:32: note: expanded from macro 'ARRAY_SIZE'
> > >       61 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> > >          |                                ^~~~~
> > >    4 errors generated.
> >
> > I didn't get how it happened? I've already test it locally.
> >
> > Is it because the test environment didn't update the header files by
> > using the command like "make headers_install && cp -r
> > usr/include/linux /usr/include/"?
>
> Sorry about the false report, kindly ignore this. And thanks for the hint=
,
> we will check to understand the root cause of this wrong report and fix t=
he
> bot asap.

That's all right :)

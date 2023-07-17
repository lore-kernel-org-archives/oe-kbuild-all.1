Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87928A927
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 09:38:24 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fbd33a1819so72565e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 02:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689586702; x=1692178702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4F7xH44pSR87wfHmzN8XeGaLUNitnx7cNk83gCctcXI=;
        b=xw8RVI04szkgflTVWnQRKDa9wUGmZ/JBcWesiMgT2NfDFQLSsU60ki8SfUyopcdTQC
         PAnZq8QAoD7h/prMIBUAASkFF2W140GwWuKRwqvPlnff/FQZJUCyIfos3GeimJrCUodM
         X6KArsOwZkTUb0zITNwsZWOx3eIwd9wbYytrD6aqdhCjUCQpDJcKoOAcAZ+D7zowN4AB
         hU0fMWm89/NqE0gtfaXS01Ika/PEXkKbpEG/E6Gvhy5GlVRt12NwQ8iOx9cYzrv+pOY7
         5NGNS31pXWAxgEd5OEGEg0x68+KdZGdHoti38A8GFA2G1SSMVWXLB+duVJ0zuHxN4Uhs
         uonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689586702; x=1692178702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4F7xH44pSR87wfHmzN8XeGaLUNitnx7cNk83gCctcXI=;
        b=bAeIGQjfkLzoHxDq4ZWTJuouOBV7dOtjdNagHMUNOXWcNIzTdZq8H3xIuTHVZWp4U+
         8LRBeKauj4uRriQ7cL6MI+Fv04moHjenNI4PoqCYFyS8I6rYn29HYGU90qMFgPOT+IMt
         AV7eAp5c8Aciy3XwlFwbnka9Oiq4FSxFbfNDtjJUFzZvcOD3oT8FEAs8jmxT3lmQ16yi
         QQJmmx7OJvm/yW+UzglVxrHRwaz4rJoEgvq/wBLt83STVIa5/Je02c98vbRmsZX1+sE0
         iaVc4yBHXGYr7rONXNmWVoc/4LjJVH2ki2ylu5xxhXJfzzfwV4kMTEgYI1imeTWyIOZ1
         nJwQ==
X-Gm-Message-State: ABy/qLZeTf+RCQUuB55TVRAmakThycw97TRil+2XruzMog+fjOVY2t/y
	Cw03P/jtRLW+2cMdQREWrJXY4MQkJasOUjnQ2Itf9Q==
X-Google-Smtp-Source: APBJJlGHW/Qv5Khx6X8f0EXb59wLIOeX/dp7w3Z5fDxgO4myiQrv7V1DWnmYOh2S5xO4nFa69cjDTGDzn7/DVOibBQc=
X-Received: by 2002:a05:600c:8609:b0:3f1:73b8:b5fe with SMTP id
 ha9-20020a05600c860900b003f173b8b5femr482464wmb.3.1689586702548; Mon, 17 Jul
 2023 02:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307170435.p9l0j6zC-lkp@intel.com>
In-Reply-To: <202307170435.p9l0j6zC-lkp@intel.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 17 Jul 2023 11:37:45 +0200
Message-ID: <CAG48ez0mT5KYe1=Bd0YHXvaM8a5OF_5OJOnF7jO1nmMteDvZMg@mail.gmail.com>
Subject: Re: [stable:linux-4.14.y 4549/9999] drivers/android/binder.c:3355:
 Error: unrecognized keyword/register name `l.lwz ?ap,4(r20)'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martijn Coenen <maco@android.com>, 
	stable <stable@vger.kernel.org>, openrisc@lists.librecores.org, 
	Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 16, 2023 at 10:20=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le.git linux-4.14.y
> head:   60a6e3043cc8b918c989707a5eba5fd6830a08a4
> commit: f40f289b96bf856e1613f17bf9426140e8b89393 [4549/9999] binder: Prev=
ent context manager from incrementing ref 0
> config: openrisc-randconfig-r002-20230717 (https://download.01.org/0day-c=
i/archive/20230717/202307170435.p9l0j6zC-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230717/202307170435=
.p9l0j6zC-lkp@intel.com/reproduce)
[...]
>    drivers/android/binder.c: Assembler messages:
> >> drivers/android/binder.c:3355: Error: unrecognized keyword/register na=
me `l.lwz ?ap,4(r20)'
>    drivers/android/binder.c:3360: Error: unrecognized keyword/register na=
me `l.addi ?ap,r0,0'
>    drivers/android/binder.c:3427: Error: unrecognized keyword/register na=
me `l.lwz ?ap,4(r20)'
>    drivers/android/binder.c:3432: Error: unrecognized keyword/register na=
me `l.addi ?ap,r0,0'
> >> drivers/android/binder.c:3555: Error: unrecognized keyword/register na=
me `l.lwz ?ap,4(r21)'
>    drivers/android/binder.c:3560: Error: unrecognized keyword/register na=
me `l.addi ?ap,r0,0'

Probably same issue as
https://lore.kernel.org/oe-kbuild-all/202010160523.r8yMbvrW-lkp@intel.com/
? That thread says the fix is
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/a=
rch/openrisc?h=3Dv5.9&id=3Dd877322bc1adcab9850732275670409e8bcca4c4
, and it was then backported to 5.4 (as
a6db3aab9c408e1b788c43f9fb179382f5793ea2) and 5.8.

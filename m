Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B312554A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 13:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAZM2nBa"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-54c5ed26cf6so744585a12.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 01 Dec 2023 05:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701439062; x=1702043862; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5n/qv2LCwI00fHFBUjE06/h0++7Sj0TWAFXvAyHTE2s=;
        b=SAZM2nBaTiEWS63tlVrFHT0yGvN/XzL5cblbnqUCTV62qtQjey1l7smj9vd216Vr7C
         S0jf9qCFn16MUzu5yqyPvwIrgf43QOOMUnBZkFOgPQO+jiFY1gqr1YaYr6HNbERRKZTi
         Tj4Yyo1kIcXfjTk0LXmI3HXYtnxV3n/NqXQcv1qOcY5OmPgtGIHAT459Bf3feaONCQbh
         Vead6IHl853f2pAdkNcacHw/P9lhz6vDkXFlgk/phT78j0QGZtANSzkDO+AUv8WfPHWb
         SHy1legrU5DrXQTB8Gj5LI5U4lWjtyeTSCbTLOmGk974XL2t1qvEGTUOKP7Q8HCnMYC0
         +WCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701439062; x=1702043862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5n/qv2LCwI00fHFBUjE06/h0++7Sj0TWAFXvAyHTE2s=;
        b=giSzgRlteSn+bH8alL0ikLTCeAHdMWzekBujJmh3AFIEugdxJVOzbExZJJVZ+dm5h6
         74yOKx7RBz3DXskQfzFbaSjPsx8+nWTdedm/su/1vOmFJkjfKNMAtHKr9sHdTZnOoZ5t
         KNJd0+pR3SwgSE9khiM1y9IbuWindFCI0aGb6hhLtpDS5jNbRwYnfF4dnpZ1N7m4dlDk
         //szDDXxformoDo+XQyG9N7uQf6TektvikVXtPfcU7TG9ra1QbYLzAUI1KSsbzBQVQ3T
         MU890e383YzI9I9QLLlBk1FgRtcIMQEo8IJnF8KuB2KClr3XBf1QNp0+j8hd6Fu7ib38
         M3Bg==
X-Gm-Message-State: AOJu0YzAnYF0cLaw02GGlxQ4Wj/35BPtQuT1IjxkC7Pg0/g1FplyiUUL
	4zYaZ6cqh1nU5exZWcyN2MQlyatrbj2pmLFphUQ=
X-Google-Smtp-Source: AGHT+IFfkOWyhwcAkAnHUnlFEmYBTN9VWeBVAvneasImqWYtB0+3VBTv+Y0p8zOZF+Yrv8OmgdUOw+emPLOO3ekbsKk=
X-Received: by 2002:a50:aa84:0:b0:54c:4837:81f1 with SMTP id
 q4-20020a50aa84000000b0054c483781f1mr845192edc.66.1701439061559; Fri, 01 Dec
 2023 05:57:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310080853.UhMe5iWa-lkp@intel.com>
In-Reply-To: <202310080853.UhMe5iWa-lkp@intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 1 Dec 2023 14:57:29 +0100
Message-ID: <CAFULd4ZgT1dZFz36ZbPeqJa+U2NwusSTudg175sSarhpvEu-Zw@mail.gmail.com>
Subject: Re: [tip:x86/percpu 12/12] arch/x86/include/asm/preempt.h:27:55:
 sparse: sparse: incompatible types for operation (&):
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>, Nadav Amit <namit@vmware.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 8, 2023 at 2:43=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/p=
ercpu
> head:   ca4256348660cb2162668ec3d13d1f921d05374a
> commit: ca4256348660cb2162668ec3d13d1f921d05374a [12/12] x86/percpu: Use =
C for percpu read/write accessors
> config: x86_64-randconfig-122-20231007 (https://download.01.org/0day-ci/a=
rchive/20231008/202310080853.UhMe5iWa-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231008/202310080853.UhMe5iWa-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310080853.UhMe5iWa-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    kernel/bpf/percpu_freelist.c: note: in included file (through arch/x86=
/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, =
...):
>    arch/x86/include/asm/percpu.h:550:49: sparse: sparse: Expected ) at en=
d of cast operator
>    arch/x86/include/asm/percpu.h:550:49: sparse: sparse: got __seg_gs
>    arch/x86/include/asm/percpu.h:564:33: sparse: sparse: Expected ) at en=
d of cast operator
>    arch/x86/include/asm/percpu.h:564:33: sparse: sparse: got __seg_gs

sparse is too strict here. The following code is perfectly legal:

--cut here--
int __seg_gs foo;

int bar (int *pcp)
{
  return *(typeof (*pcp) __seg_gs *)(unsigned long)(pcp);
}
--cut here--

$ gcc -O2 -S -Wextra -Wall test.c
$
$ sparse test.c
test.c:1:14: error: Expected ; at end of declaration
test.c:1:14: error: got foo
test.c:5:26: error: Expected ) at end of cast operator
test.c:5:26: error: got __seg_gs
$

Uros.

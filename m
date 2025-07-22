Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E817427A45C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 17:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753203667; cv=none; b=McEcW1DBMPceVNvlWHqVYUIGSDOeNyGoCOEkNse21pdPW1Ax5G6DAb2yJjkPfHtdFbO9nJ5n24jOK46vLius0LsIUGTef8C63x+faOIOCJq01Wav15K5S5KHIJ6qGJ/CTtGqFu6AXOK2l38CMmK9zETCQkxMm1Zr276EvSnlKQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753203667; c=relaxed/simple;
	bh=RozRmBpgPdHgFhGbUCcQ7z8NNdDISN+K64Cuc6NwFaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFmoO8nBKvkfsCJo8vS7wII36M6uYKDQkBVK3QE49pIuc2K7neljarLGUhLypRV2Vt2O/uhx8Vk+jZKMnQzG8UcStAh5EMk6ON+A//GvEoKvfnpB7Ia78UDMePxMoLWCbEzP0D0k01AlASqcSlXNyNpjDkFJdycL73F172zYPE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UeISlKUO; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UeISlKUO"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e2429bd4b3so6445ab.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 10:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753203664; x=1753808464; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMWl+IVSXU3UWMDRzWAL2yct7yvUc0gdtp2ypyWEquo=;
        b=UeISlKUOql6PPbiilEzwgqk0oHZXzGge+8cr/jafR6ShBt35Ue6kUmc9gW9p0kSWJ7
         OCnSediN6Yp2xL0Z5k/IlFLbemTZ+ELpXJj4USrBf6gzznWwOPbCR41yMYyf1MTT3P9K
         m9xfEbMaMlpr03LQiqOACFzc0FASrS5YgRXBqgPjtEcgFibe04xT4IdFLw1+ybgwOsTo
         Scdhb6qhaCB9S2YJKcYkMSCiZcdezRGddEY5dNjs1NJSPhnwxYHHPgLaPktaMKCMjT+2
         O8RK0DCwnxWSDjRXmKPQxaakmWhCVF/cPmSYdqJpoVdkbnsIbO+VxBD5VgovYCIh3Q88
         ea7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753203664; x=1753808464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMWl+IVSXU3UWMDRzWAL2yct7yvUc0gdtp2ypyWEquo=;
        b=TTiACxNeBSfpCHoDXCG/zmg3nGaBoPv/qaaVx31WFodioFltFg8rXgenkhPdEj/PGL
         kWGmDukZbt7lgr9cqe395Df6fe5qicsmbUkUkJMkEk378C8UBqdg2LFRX++n8opjJscv
         gQkBy1KovgjggBGj7Wz+5p6Q6VORMpR9KVgt3ORuxQQ3NpYwcbs7zhgoHOaDlEo9JmxX
         DTfjI1/RejQBpF01b8VYNRrkmuPiRPhfkBzCSc3AY06tKI3c5SFFdmojKldBq/8oyg8H
         LOxmOGGpoboExYQq4Y5bHqNuRptZO46ws1jfJN+QJ7jTVBHMQo8IXtwkDIBdF42htDfO
         HvTg==
X-Forwarded-Encrypted: i=1; AJvYcCVn61BtvTx8xYa7aTOezy3xtZXZb6IT3wlZdv1FXCrbMfCeq0OhvwwIgSnMAuatWJtDUgh4GQ4mMUyYsMKT@lists.linux.dev
X-Gm-Message-State: AOJu0YxMJWEaradBkvKKHOfosMYJWN7fe496nfYe4RujjhiPAHLEG52W
	jJixYgpd0XGVr2bzfa22FcUJ4YZJ2c+m2o5CQmz88BdS9+wXgrno6Un7MX9Bo3zXiPzsmI//E0D
	25zbw1IYOPgNsPP+xqygae0fxvLyyMa9PqziNt+Rs
X-Gm-Gg: ASbGncvvu69dnJ+Lkq2H2d28TcvtKp/x31aiTJ5qA/6Ft4/MRkhQOdTOw21B4hN8VrC
	ZWdtM1dyWEw7KZZSxRD7mldw0oJYeHS6TcvO8a6XJ8Q0gHiIYHmJS8eP0gpSoNruRycO2gHl5o3
	K96p3jqI/j2ssBCTqUUDIzku7CrfNJGap17JiLVCZIBAgn0na53jaX0H6oN0E4VTwJk9Dx8AlUz
	+AlTa3eD0cpaLOct7wxsWn3gmFXagwBuD62
X-Google-Smtp-Source: AGHT+IEpvXyjeWxRcF/tu++Jd7SjfKR5DekS7xK1pGaWvDF8YHnNhRtkTHcjlr/j3YuSDcN0aAqV8516n/nUez2TuD0=
X-Received: by 2002:a05:6e02:461b:b0:3e2:c215:1388 with SMTP id
 e9e14a558f8ab-3e2c21515c2mr3649285ab.19.1753203663507; Tue, 22 Jul 2025
 10:01:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626054826.433453-2-irogers@google.com> <202507050736.b4hX0Xks-lkp@intel.com>
 <87o6tcrzh2.ffs@tglx> <CAP-5=fWbmo3ejmeWbweSk5waPtS2VTc1obtaWiibZC3cVmvVvg@mail.gmail.com>
In-Reply-To: <CAP-5=fWbmo3ejmeWbweSk5waPtS2VTc1obtaWiibZC3cVmvVvg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 22 Jul 2025 10:00:51 -0700
X-Gm-Features: Ac12FXzd_gAiZTQN5n1xPWmuULZhc8NKzh5QjOASDGMh9-MiyBPpltLGiJE_8A4
Message-ID: <CAP-5=fWeK4RnL8=BQm3o3u0KoONYEptwEYFBC5_DkJTbgpbx9g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] vdso: Switch get/put unaligned from packed struct
 to memcpy
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel test robot <lkp@intel.com>, Eric Biggers <ebiggers@google.com>, Yuzhuo Jing <yuzhuo@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 9:44=E2=80=AFAM Ian Rogers <irogers@google.com> wro=
te:
>
> On Tue, Jul 22, 2025 at 8:56=E2=80=AFAM Thomas Gleixner <tglx@linutronix.=
de> wrote:
> >
> > Ian!
> >
> > On Sat, Jul 05 2025 at 08:05, kernel test robot wrote:
> > > kernel test robot noticed the following build warnings:
> > >
> > > [auto build test WARNING on linus/master]
> > > [also build test WARNING on tip/timers/vdso v6.16-rc4 next-20250704]
> > > [cannot apply to acme/perf/core]
> > > [If your patch is applied to the wrong git tree, kindly drop us a not=
e.
> > > And when submitting patch, we suggest to use '--base' as documented i=
n
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/vds=
o-Switch-get-put-unaligned-from-packed-struct-to-memcpy/20250626-135005
> > > base:   linus/master
> > > patch link:    https://lore.kernel.org/r/20250626054826.433453-2-irog=
ers%40google.com
> > > patch subject: [PATCH v3 1/3] vdso: Switch get/put unaligned from pac=
ked struct to memcpy
> > > config: s390-randconfig-002-20250705 (https://download.01.org/0day-ci=
/archive/20250705/202507050736.b4hX0Xks-lkp@intel.com/config)
> > > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-proje=
ct 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20250705/202507050736.b4hX0Xks-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202507050736.b4hX0Xks=
-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > >    In file included from arch/s390/boot/decompressor.c:48:
> > >    In file included from arch/s390/include/uapi/../../../../lib/decom=
press_unlz4.c:10:
> > >    In file included from arch/s390/include/uapi/../../../../lib/lz4/l=
z4_decompress.c:36:
> > >>> arch/s390/include/uapi/../../../../lib/lz4/lz4defs.h:109:9: warning=
: default initialization of an object of type 'typeof (*((const U16 *)ptr))=
' (aka 'const unsigned short') leaves the object uninitialized [-Wdefault-c=
onst-init-var-unsafe]
> > >      109 |         return get_unaligned((const U16 *)ptr);
> > >          |                ^
> >
> > Any update on this one?
>
> Hi Thomas!
>
> Thanks for the interest. I'm not sure how to resolve this.
> Basically the story in the code is:
>
>   get_unaligned((const U16 *)ptr);
>
> is being expanded by:
>
>   #define get_unaligned(ptr)      __get_unaligned_t(typeof(*(ptr)), (ptr)=
)
>   #define __get_unaligned_t(type, ptr) ({
>           \
>        type __get_unaligned_ctrl_type __always_unused;                 \
>        __unqual_scalar_typeof(__get_unaligned_ctrl_type) __get_unaligned_=
val; \
>        __builtin_memcpy(&__get_unaligned_val, (void *)(ptr),           \
>                         sizeof(__get_unaligned_val));                  \
>        __get_unaligned_val;                                            \
>   })
>
> to:
>
>   ({
>   const U16 __get_unaligned_ctrl_type __always_unused;
>   __unqual_scalar_typeof(__get_unaligned_ctrl_type) __get_unaligned_val;
>   __builtin_memcpy(&__get_unaligned_val, (void *)(ptr),
>    sizeof(__get_unaligned_val));
>   __get_unaligned_val;
>   })
>
> which is then expanded to:
>
>   ({
>   const U16 __get_unaligned_ctrl_type __always_unused;
>   U16 __get_unaligned_val;
>   __builtin_memcpy(&__get_unaligned_val, (void *)(ptr),
>    sizeof(__get_unaligned_val));
>   __get_unaligned_val;
>   })
>
> so the analysis is correct that __get_unaligned_ctrl_type is
> unused, however, I've also put __always_unused on the variable.
> The purpose of that variable is for __unqual_scalar_typeof that
> passes the value to _Generic. I truly don't care about that
> variable but I care about it causing _Generic to get the correct
> type for __get_unaligned_val (that value can't be const as it is
> the destination of the memcpy). Why even declare
> __get_unaligned_ctrl_type? Well we want the result of __get_unaligned_t t=
o
> match its type argument which needn't match the dereference of
> its pointer argument (*ptr) - I accept that in many cases it
> will. The value passed to _Generic is an expression and not a
> type, so declaring the variable and using the variable for
> _Generic allows this.
>
> My feeling is that my patch is correct and I'm not clear how to
> improve upon it. I believe it is a weakness in the analysis that
> the __always_unused isn't having an effect.
>
> Should adding new warnings for analysis on the code base be
> allowed for this patch? Well the upside to the patch is getting
> closer to not requiring -fno-strict-aliasing, or not introducing
> requiring that flag for things in the tools directory. I think
> the upside is good, I don't know how to mitigate the downside
> with poor analysis by certain tools.

Oh, the actual warning is "leaves the object uninitialized". It is
possible to silence this by changing:

  const U16 __get_unaligned_ctrl_type __always_unused;

to something like:

  const U16 __get_unaligned_ctrl_type __always_unused =3D 0;

You then get complained at that the code is using 0 instead of NULL
when instead of U16 the type of the __get_unaligned_t is a pointer.
Basically I've entered into an analysis tool wac-a-mole and I don't
have a combination to make them all happy.

Thanks,
Ian

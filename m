Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C313455A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 23:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K4N/vhe5"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6b5af4662b7so5193499b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Nov 2023 15:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699399502; x=1700004302; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XDWMiq/2ClUpNf7l50C4dkGfwlleMPhjaG5SVTFskio=;
        b=K4N/vhe5m8x1EwhH1UBtUgtdWU9ZpGEJ93pPv9Np6/7n4WWeg6GwYN8f830RtJb1ZF
         Ngtc8zonRzsfMPbFdNgvrdhEwPORjbJwEh/dXavnqMlsYGL7Kifaa3PEeX6yAa2XWoJR
         cUDCp010XWEI1HV1RBTPJufQAmUPe3hr1l3x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699399502; x=1700004302;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XDWMiq/2ClUpNf7l50C4dkGfwlleMPhjaG5SVTFskio=;
        b=Abfa11fcEmx8Du5h1WBsWPD0j/ZKEMR/HjQr0XhR8FpMrHFuqj/FEIhsabzOd5ePkr
         5NklkpBYlttwdzrpmyePRiR7kd4Z2j0RZUTaMKz8S53T2381p2CtxX03ebvvGl2NZ3m1
         SYFfwMNGjOXSe3SDMFDN+uk7/3GI44tGiwVpxBj8anZOmZqG7sTirNeeFWUK2epyhnrz
         voQWFvUCa2IGCvj/HlrF767ZbSi7n/lx9suZhjvts8tiYelrmNqtfNN7huDbs/yklYqJ
         MIG9PbgNYWpL6+i/tcGmMbj7TAdGJA9z3n+CkNIKg290z0XZzbxrJQZtUuOY/sstu6N/
         R0Eg==
X-Gm-Message-State: AOJu0YxlTpHuHmOa6L6bUAcf51OW0cOfR6ny7oCK1EQCy+asOHBnYf+l
	3q1M8loBdGPFlOT1ABap0uEKeQ==
X-Google-Smtp-Source: AGHT+IHKmeWdNqg8xV4LjBf3dq6jLliKT0Z15hAj2ecHLNWH3B16uFe/4vaumqd744U979GPCfPSTQ==
X-Received: by 2002:a05:6a00:b92:b0:68b:bf33:2957 with SMTP id g18-20020a056a000b9200b0068bbf332957mr126998pfj.22.1699399502232;
        Tue, 07 Nov 2023 15:25:02 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e6-20020a62ee06000000b0068ff267f094sm7692689pfi.158.2023.11.07.15.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 15:25:01 -0800 (PST)
Date: Tue, 7 Nov 2023 15:25:01 -0800
From: Kees Cook <keescook@chromium.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Syed Nayyar Waris <syednwaris@gmail.com>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alobakin:pfcp 11/19] include/linux/bitmap.h:642:17: warning:
 array subscript [1, 1024] is outside array bounds of 'long unsigned int[1]'
Message-ID: <202311071521.099CAEA58@keescook>
References: <202310170708.fJzLlgDM-lkp@intel.com>
 <bd7fe929-c6fc-42be-9d2f-3f53ec21fd10@intel.com>
 <ZUkvOCxyiin_77qd@smile.fi.intel.com>
 <0a29df6b-bc27-43e9-a97d-57ecabb29a9e@intel.com>
 <CAG_fn=VtA6e3oGm4WVnxmy9yMBab780-U_4VoHSqm4tcd2UTzQ@mail.gmail.com>
 <ca0ad357-727b-4f41-a3d6-2c48a9dd5836@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca0ad357-727b-4f41-a3d6-2c48a9dd5836@intel.com>

On Tue, Nov 07, 2023 at 05:44:00PM +0100, Alexander Lobakin wrote:
> From: Alexander Potapenko <glider@google.com>
> Date: Tue, 7 Nov 2023 17:33:56 +0100
> 
> > On Tue, Nov 7, 2023 at 2:23 PM Alexander Lobakin
> > <aleksander.lobakin@intel.com> wrote:
> >>
> >> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> Date: Mon, 6 Nov 2023 20:23:52 +0200
> >>
> >>> On Mon, Nov 06, 2023 at 05:31:34PM +0100, Alexander Lobakin wrote:
> >>>
> >>>>> | Reported-by: kernel test robot <lkp@intel.com>
> >>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202310170708.fJzLlgDM-lkp@intel.com/
> >>>
> >>>> Not sure how to approach this :z It was also captured on the version you
> >>>> sent 2 weeks ago, so this could've been resolved already.
> >>>
> >>> Is it in the repository already? if so, we should revert it.
> >>> Otherwise you have time to think and fix.
> >>
> >> Nah, neither Alex' series nor mine. And I'd say this should rather be
> >> resolved in the functions Alex introduce.
> >>
> >> Thanks,
> >> Olek
> > 
> > Sorry, I couldn't reproduce the problem using the instructions at
> > https://download.01.org/0day-ci/archive/20231017/202310170708.fJzLlgDM-lkp@intel.com/reproduce
> > locally, maybe that's because I only have gcc-11 and higher.
> > 
> > But if I'm understanding correctly what's going on, then GCC will be
> > reporting the same issue in the following code:
> > 
> > =======================================================
> > #include <stddef.h>
> > #include <stdbool.h>
> > 
> > #define BITS_PER_LONG 64
> > #define unlikely(x) x
> > #define UL(x) (x##UL)
> > #define GENMASK(h, l) \
> >         (((~UL(0)) - (UL(1) << (l)) + 1) & \
> >          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
> > 
> > #define BIT_WORD(nr)            ((nr) / BITS_PER_LONG)
> > #define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) & (BITS_PER_LONG - 1)))
> > #define BITMAP_LAST_WORD_MASK(nbits) (~0UL >> (-(nbits) & (BITS_PER_LONG - 1)))
> > 
> > inline void bitmap_write(unsigned long *map,
> >                                 unsigned long value,
> >                                 unsigned long start, unsigned long nbits)
> > {
> >         size_t index;
> >         unsigned long offset;
> >         unsigned long space;
> >         unsigned long mask;
> >         bool fit;
> > 
> >         if (unlikely(!nbits))
> >                 return;
> > 
> >         mask = BITMAP_LAST_WORD_MASK(nbits);
> >         value &= mask;
> >         offset = start % BITS_PER_LONG;
> >         space = BITS_PER_LONG - offset;
> >         fit = space >= nbits;
> >         index = BIT_WORD(start);
> > 
> >         map[index] &= (fit ? (~(mask << offset)) :
> > ~BITMAP_FIRST_WORD_MASK(start));
> >         map[index] |= value << offset;
> >         if (fit)
> >                 return;
> > 
> >         map[index + 1] &= BITMAP_FIRST_WORD_MASK(start + nbits);
> >         map[index + 1] |= (value >> space);
> > }
> > 
> > unsigned long foo(unsigned int n) {
> >     unsigned long bm[1] = {0};
> >     bitmap_write(bm, 1, n, 2);
> >     return bm[0];
> > }
> > =======================================================
> > (see also https://godbolt.org/z/GfGfYje53)
> > 
> > If so, the problem is not specific to GCC 9, trunk GCC also barks on this code:
> > 
> > =======================================================
> > In function 'bitmap_write',
> >     inlined from 'bitmap_write' at <source>:15:13,
> >     inlined from 'foo' at <source>:47:7:
> > <source>:40:12: warning: array subscript 1 is outside array bounds of
> > 'long unsigned int[1]' [-Warray-bounds=]
> >    40 |         map[index + 1] &= BITMAP_FIRST_WORD_MASK(start + nbits);
> >       |         ~~~^~~~~~~~~~~
> > =======================================================
> > 
> > If this is true for the code in drivers/gpio/gpio-pca953x.c,
> > suppressing the report for GCC 9 won't help for other versions.
> > Given that this report is isolated in a single file, we probably need
> 
> I tested it on GCC 9 using modified make.cross from lkp and it triggers
> on one more file:
> 
> drivers/thermal/intel/intel_soc_dts_iosf.c: In function 'sys_get_curr_temp':
> ./include/linux/bitmap.h:601:18: error: array subscript [1,
> 288230376151711744] is outside array bounds of 'long unsigned int[1]'
> [-Werror=array-bounds]
> 
> > to give the compiler some hints about the range of values passed to
> > bitmap_write() rather than suppressing the optimizations.
> 
> OPTIMIZER_HIDE_VAR() doesn't disable optimizations if I get it
> correctly, rather shuts up the compiler in cases like this one.
> 
> I've been thinking of using __member_size() from fortify-string.h, we
> could probably optimize the object code even a bit more while silencing
> this warning.
> Adding Kees, maybe he'd like to participate in sorting this out as well.

I'm trying to find all the pieces for this code, so I might be working
from the wrong version or something, but I think this is the change:
https://github.com/alobakin/linux/commit/66808fb20fed014a522b868322d54daef14a6bd8

and the induced warning is correctly analyzed in this thread (i.e. GCC
can't convince itself that it'll never reach the out of bounds access).
Does this work?

-	if (fit)
+	if (fit || index + 1 >= __member_size(map))
 		return;


-- 
Kees Cook

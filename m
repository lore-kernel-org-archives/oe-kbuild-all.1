Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051FC36AE6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZLD1JSb"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cc0e78ec92so40473945ad.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Nov 2023 10:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699381930; x=1699986730; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SunHHN1/iQODqSQHwnSP1s4Wb0vFxONmUla7Hxi/DaY=;
        b=XZLD1JSbQX/ZhWgg3cwC2OxuvbD6XWRMYLj3xl/yGewwk1in+scU3f6tQQ7OPjiQ3N
         Zl0AxhkLOSo5ZC1Spu/tCBimq9s0jzbyyjKBZfUx1vckp1SRoQvLjRKAT2Ukg7aUPn5k
         rCY046/EGylAltnTEWzuP0LPC6qMET9VmCyeSu/lGivC+EYGbRcIs0B202uhLCck6V/y
         oJQy9qXSlQCX5dnc8Z0oKzFjmyGMQm4r10zDIDNUIe1rtYODxwhrVOQ/cwvErGAD/OmL
         smVsyNYlW+3SNABvxVf/GQtMbqeowYgZ+BHC8n+W1C+852KiJraDTbpRLfpzzgu7mRdV
         iJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699381930; x=1699986730;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SunHHN1/iQODqSQHwnSP1s4Wb0vFxONmUla7Hxi/DaY=;
        b=wTbHxw7a8QiNGSrHq3DmEmBlmz0tLeaLsbwMmxjGX58tzC1UNi36B4ZovcJBrr2N16
         QXG3EkbhSaV3K+NqX63iiSRbUyNL6psaaA4+fnYb2tOjUvb/uLVS7g+6oHFzWTMVQiQ4
         7lgPwOH6PoleAg6jEw4NKTiXYSbPxQduhdgXVGMaGsh43DpwP6mkgR9LnUlYSwZYj3mg
         +dYpOnBfQMMn6MgpPwiujGA60rOxXe/XVpHl/5/i8W5Z1pP75yI7RjcuRctwMsMjNEt7
         xket0IVpYm+b0OM+iQicC4D8DxBZK28iv3sr6YIRIo5JBc641Z4wfzK9bCyTqT3lBKAo
         B/2A==
X-Gm-Message-State: AOJu0YxMdYDo/gyOHVXNCKaunJGVVtDxvI7ixX1q0/WuDo++Gr4HalQQ
	/YvA735tKIR7rKTn314u774=
X-Google-Smtp-Source: AGHT+IE8x1K/3j8/6uiu2lfwOH0eUUp91B4Py2DmFccL89sMo3+gKp3MwqyDxjclm3qrwZaNeITylw==
X-Received: by 2002:a17:903:22c5:b0:1cc:3a60:bd69 with SMTP id y5-20020a17090322c500b001cc3a60bd69mr29499374plg.25.1699381930027;
        Tue, 07 Nov 2023 10:32:10 -0800 (PST)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d2-20020a170902cec200b001c3be750900sm136703plg.163.2023.11.07.10.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 10:32:09 -0800 (PST)
Date: Tue, 7 Nov 2023 10:32:06 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Syed Nayyar Waris <syednwaris@gmail.com>,
	Kees Cook <keescook@chromium.org>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alobakin:pfcp 11/19] include/linux/bitmap.h:642:17: warning:
 array subscript [1, 1024] is outside array bounds of 'long unsigned int[1]'
Message-ID: <ZUqCpmDgKFbscRgW@yury-ThinkPad>
References: <202310170708.fJzLlgDM-lkp@intel.com>
 <bd7fe929-c6fc-42be-9d2f-3f53ec21fd10@intel.com>
 <ZUkvOCxyiin_77qd@smile.fi.intel.com>
 <0a29df6b-bc27-43e9-a97d-57ecabb29a9e@intel.com>
 <CAG_fn=VtA6e3oGm4WVnxmy9yMBab780-U_4VoHSqm4tcd2UTzQ@mail.gmail.com>
 <ca0ad357-727b-4f41-a3d6-2c48a9dd5836@intel.com>
 <e3b4b1a6-5383-4bfb-ba83-ab27d58dae29@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3b4b1a6-5383-4bfb-ba83-ab27d58dae29@intel.com>

On Tue, Nov 07, 2023 at 06:24:04PM +0100, Alexander Lobakin wrote:
> From: Alexander Lobakin <aleksander.lobakin@intel.com>
> Date: Tue, 7 Nov 2023 17:44:00 +0100
> 
> > From: Alexander Potapenko <glider@google.com>
> > Date: Tue, 7 Nov 2023 17:33:56 +0100
> > 
> >> On Tue, Nov 7, 2023 at 2:23 PM Alexander Lobakin
> >> <aleksander.lobakin@intel.com> wrote:
> 
> [...]
> 
> > I tested it on GCC 9 using modified make.cross from lkp and it triggers
> > on one more file:
> > 
> > drivers/thermal/intel/intel_soc_dts_iosf.c: In function 'sys_get_curr_temp':
> > ./include/linux/bitmap.h:601:18: error: array subscript [1,
> > 288230376151711744] is outside array bounds of 'long unsigned int[1]'
> > [-Werror=array-bounds]
> > 
> >> to give the compiler some hints about the range of values passed to
> >> bitmap_write() rather than suppressing the optimizations.
> > 
> > OPTIMIZER_HIDE_VAR() doesn't disable optimizations if I get it
> > correctly, rather shuts up the compiler in cases like this one.
> > 
> > I've been thinking of using __member_size() from fortify-string.h, we
> > could probably optimize the object code even a bit more while silencing
> > this warning.
> > Adding Kees, maybe he'd like to participate in sorting this out as well.
> 
> This one seems to work. At least previously mad GCC 9.3.0 now sits
> quietly, as if I added OPTIMIZER_HIDE_VAR() as Yury suggested.
 
What's wrong with OPTIMIZER_HIDE_VAR()? The problem is clearly on GCC
side, namely - it doesn't realize that the map[index+1] fetch is
conditional.

And moreover, it's fixed in later stable builds. I tested 12 and 13,
and both are silent.

> Note that ideally @map should be marked as `POS` in both cases to help
> Clang, but `POS` gets undefined at the end of fortify-string.h, so I
> decided to not do that within this draft.
> 
> Thanks,
> Olek
> ---
> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index e8031a157db5..efa0a0287d7c 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -589,12 +589,14 @@ static inline unsigned long bitmap_read(const
> unsigned long *map,
>  	size_t index = BIT_WORD(start);
>  	unsigned long offset = start % BITS_PER_LONG;
>  	unsigned long space = BITS_PER_LONG - offset;
> +	const size_t map_size = __member_size(map);
>  	unsigned long value_low, value_high;
> 
>  	if (unlikely(!nbits || nbits > BITS_PER_LONG))
>  		return 0;
> 
> -	if (space >= nbits)
> +	if ((__builtin_constant_p(map_size) && map_size != SIZE_MAX &&
> +	     index + 1 >= map_size / sizeof(long)) || space >= nbits)
>  		return (map[index] >> offset) & BITMAP_LAST_WORD_MASK(nbits);

This silences the compiler, but breaks the code logic and hides potential bugs.
After the fix, the following code will become legit:

        DECLARE_BITMAP(bitmap, 64);

        bitmap_fill(bitmap, 64)
        char ret = bitmap_read(bitmap, 60, 8); // OK, return 0b00001111

Before this change, the return value would be undef: 0xXXXX1111, and
it would (should) trigger Warray-bounds on compile time, because it's
a compile-time boundary violation.

On runtime KASAN, UBSAN and whatever *SAN would most likely be silenced
too with your fix. So no, this one doesn't seem to work.

>  	value_low = map[index] & BITMAP_FIRST_WORD_MASK(start);
> @@ -620,6 +622,7 @@ static inline unsigned long bitmap_read(const
> unsigned long *map,
>  static inline void bitmap_write(unsigned long *map, unsigned long value,
>  				unsigned long start, unsigned long nbits)
>  {
> +	const size_t map_size = __member_size(map);
>  	size_t index;
>  	unsigned long offset;
>  	unsigned long space;
> @@ -638,7 +641,9 @@ static inline void bitmap_write(unsigned long *map,
> unsigned long value,
> 
>  	map[index] &= (fit ? (~(mask << offset)) :
> ~BITMAP_FIRST_WORD_MASK(start));
>  	map[index] |= value << offset;
> -	if (fit)
> +
> +	if ((__builtin_constant_p(map_size) && map_size != SIZE_MAX &&
> +	     index + 1 >= map_size / sizeof(long)) || fit)
>  		return;
> 
>  	map[index + 1] &= BITMAP_FIRST_WORD_MASK(start + nbits);

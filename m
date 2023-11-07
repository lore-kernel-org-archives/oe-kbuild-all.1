Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8E836AEA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 19:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiwLG/Xp"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5b856d73a12so4491317a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Nov 2023 11:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699385092; x=1699989892; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oj9MZK4wUctOna3bEFza6Z8b7j977JaPhxo3SsWBCcs=;
        b=UiwLG/XpP6peHnZQNfRrSIAaIwron6a2f8K7GdDw2FD0K/5beAnp6MYcVIo2cT2VwX
         MiAn+r276xrQ2/u5oa1GKAQcNYzbB9iyp4MCQAUI45UWlL2pIBMGCBfUWsYN3EvwQZ//
         Ne3h4uj136Y5owaywyltDdVX03dsyz2BRqqM0ygl3NCKzNarulDIO+kcdK6SHfHPXRB6
         NlOOZ5z24H4PvnP13HNMnWZQXAzsTC1s1mXcmhdRrt23mwDG4Eq3ZjOPkt0/5HNFLdF4
         fZkHlkcpi8RwjYWT1d4nOPZlif77WSwXn38oK0O6Z2i4Egpc7+ETpCmjPbuW7s8HZE3M
         rLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699385092; x=1699989892;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oj9MZK4wUctOna3bEFza6Z8b7j977JaPhxo3SsWBCcs=;
        b=urgC9+x3ZCSpfa/vJ5/p62y984bWHpfR9N45tok3RSNJSmkh2be8NTal6ALK70etlp
         wKb9O+rQhrKI1pFSv5UvXfXKiY9PI8fJ2oXwTDbEkHJN5cQgCRHiAWxiwQXfcBQQhkXF
         kg+xy4WjHrNhoIdzaXe5MBMDq/D0jXnrenMo5W4avTvtkH2FdMOddxgUK93R4ZA/k8H3
         CiV6DqDZm1njunh/6k65oijgFqEpdJ7HN86LivpGgsKPrt+2jWTcxfXX55NsxKz9t9ig
         bwHBBFNYwpxry7tegLHa/VuO7b+VIeW6ftQcMLCRcIme8686vBdO/0HXEiULWFFinJDz
         Bkog==
X-Gm-Message-State: AOJu0Yy4t5BKOcxGe6WS06QfGUqdnTKSsf8cmmm5wtHCmiUNVfxmSQ3k
	ugtVAupV14Pny+Py4mVGGMk=
X-Google-Smtp-Source: AGHT+IGS33QtOaJIzJHkuOlPXXHZVu17ZHfO5B5Wi3fl8+b8Sh2g+W26KPqZgEFwcz7/OXBcrsHtQw==
X-Received: by 2002:a05:6a20:2590:b0:16b:977d:f7cf with SMTP id k16-20020a056a20259000b0016b977df7cfmr39259363pzd.36.1699385092348;
        Tue, 07 Nov 2023 11:24:52 -0800 (PST)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id kx14-20020a170902f94e00b001bc6e6069a6sm172531plb.122.2023.11.07.11.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 11:24:51 -0800 (PST)
Date: Tue, 7 Nov 2023 11:24:49 -0800
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
Message-ID: <ZUqPAZC4sS455xtx@yury-ThinkPad>
References: <202310170708.fJzLlgDM-lkp@intel.com>
 <bd7fe929-c6fc-42be-9d2f-3f53ec21fd10@intel.com>
 <ZUkvOCxyiin_77qd@smile.fi.intel.com>
 <0a29df6b-bc27-43e9-a97d-57ecabb29a9e@intel.com>
 <CAG_fn=VtA6e3oGm4WVnxmy9yMBab780-U_4VoHSqm4tcd2UTzQ@mail.gmail.com>
 <ca0ad357-727b-4f41-a3d6-2c48a9dd5836@intel.com>
 <e3b4b1a6-5383-4bfb-ba83-ab27d58dae29@intel.com>
 <ZUqCpmDgKFbscRgW@yury-ThinkPad>
 <457b9cbb-9a5f-47ef-9eac-3e4f135d6a96@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <457b9cbb-9a5f-47ef-9eac-3e4f135d6a96@intel.com>

On Tue, Nov 07, 2023 at 07:52:19PM +0100, Alexander Lobakin wrote:
> From: Yury Norov <yury.norov@gmail.com>
> Date: Tue, 7 Nov 2023 10:32:06 -0800
> 
> > On Tue, Nov 07, 2023 at 06:24:04PM +0100, Alexander Lobakin wrote:
> >> From: Alexander Lobakin <aleksander.lobakin@intel.com>
> >> Date: Tue, 7 Nov 2023 17:44:00 +0100
> >>
> >>> From: Alexander Potapenko <glider@google.com>
> >>> Date: Tue, 7 Nov 2023 17:33:56 +0100
> >>>
> >>>> On Tue, Nov 7, 2023 at 2:23 PM Alexander Lobakin
> >>>> <aleksander.lobakin@intel.com> wrote:
> >>
> >> [...]
> >>
> >>> I tested it on GCC 9 using modified make.cross from lkp and it triggers
> >>> on one more file:
> >>>
> >>> drivers/thermal/intel/intel_soc_dts_iosf.c: In function 'sys_get_curr_temp':
> >>> ./include/linux/bitmap.h:601:18: error: array subscript [1,
> >>> 288230376151711744] is outside array bounds of 'long unsigned int[1]'
> >>> [-Werror=array-bounds]
> >>>
> >>>> to give the compiler some hints about the range of values passed to
> >>>> bitmap_write() rather than suppressing the optimizations.
> >>>
> >>> OPTIMIZER_HIDE_VAR() doesn't disable optimizations if I get it
> >>> correctly, rather shuts up the compiler in cases like this one.
> >>>
> >>> I've been thinking of using __member_size() from fortify-string.h, we
> >>> could probably optimize the object code even a bit more while silencing
> >>> this warning.
> >>> Adding Kees, maybe he'd like to participate in sorting this out as well.
> >>
> >> This one seems to work. At least previously mad GCC 9.3.0 now sits
> >> quietly, as if I added OPTIMIZER_HIDE_VAR() as Yury suggested.
> >  
> > What's wrong with OPTIMIZER_HIDE_VAR()? The problem is clearly on GCC
> > side, namely - it doesn't realize that the map[index+1] fetch is
> > conditional.
> 
> It's totally fine for me to use it, this one is just an alternative
> (well, a bit broken as per below).

OK, guys, that's even worse. The 12 and 13 don't fire the warning
because Warray-bounds is explicitly disabled for gcc-11+. Check
0da6e5fd6c372 ("gcc: disable '-Warray-bounds' for gcc-13 too"). I'll
test how gcc-10 builds it, and if it's broken too, it's worth to shift
the threshold in init/Kconfig.

Let me check it later today.

[...]

> Oh you're right, I didn't think about this. Your approach seems optimal
> unless hardening folks have anything else.
>
> I don't see bitmap_{read,write}() mini-series applied anywhere in your

I'll not take the code unless there are real kernel users for it. Your
compressor is still under development AFAIK, so I'm going to pull
bitmap_read/write with ip_tunnel series, if it comes first. 

> tree, maybe Alex could incorporate your patch into it and resubmit?

Yes, that's what I asked him to do. But let's put it on hold while I'm
testing different compilers.

Thanks,
Yury

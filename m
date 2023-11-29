Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73BC4CB40
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 22:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q55LVwA/"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5482df11e73so133914a12.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 14:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701296335; x=1701901135; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mc5oZ5kMzWzBvnqmGCM0wHSRW1jSSaaHkMsnEuBQazI=;
        b=q55LVwA/oFe2Kx11XKNp13ABFOP7qHBno+rrD8t/G+tQQYpl4FTBZwvE3RJF2RzBvz
         yEAfrUcvXKmh2r4VWnMKyqc4W2W/mDuU/gmL53xWiKUtsOt04/HYA5yVM7/nsbo1Z1t9
         lORQ4BUx3AoyxSOz+14zMU/e+VZ3y7ikjUUtPJD6gWJx18DguvwSAN99V5AUf9/6OdNj
         0cCHuSv0JuicGIsWdkkkXBOdcz4hR6JOi69XPAX84QR9Pj3Bn/Sahnt2xfn/p1lXqiBM
         0ieJjf2YaXs820hPWlNx7flONj6jiHQSNbn+JWSRuXR0R0d2XGmiMGefIchmiq9nJpSY
         9StA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701296335; x=1701901135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mc5oZ5kMzWzBvnqmGCM0wHSRW1jSSaaHkMsnEuBQazI=;
        b=c9wdPBlQ7/1Hn58h4fKfpuvWBPOZK9vDUA8NIMRnjbYSJfLuuta9HhiMaxQxLUEqUv
         u9xkrCqFAs5aNHcOQINh8VwF2wWP88nXI7Yr4ibGtmrqTm+VqM3I1FUhEIyi7/pwnmlc
         Vx6HQ5MDWrer8LTBoIfIjE1l58UNtOGqJBM4jg8bdycaT7AD5odIjD9+ylJLdM10szsZ
         kLBAPeU+eZmvl93haMdI+vmEPfBUijgheMPJq9TH4Vt1O8ZNHU1hypWdNe9Ugi0fKzIG
         kElDb3Wn6RrS+Arv2b96BF0Ps9j4oM69nfJGjoJqLOrWo+hqzxUhYwrrRFue0GRctECJ
         KLqw==
X-Gm-Message-State: AOJu0Yx+jPtxOPcUXyOorirCzcJvzSnJ0IyXi5Rbc+fhvKHLGB2X1gcY
	TPxlfpankmc3ZgSpmVaSHKpKuC1cxTTxjxc00VEn7w==
X-Google-Smtp-Source: AGHT+IFCYdupu3pZexadhnbP9FExaaVX7xetS+iWSLWLmbOS3XYi2X1XdJn3/08dpuY+a7WToE8Az4g4QnAVEq2XsVo=
X-Received: by 2002:a17:906:530b:b0:a0b:d4f4:ef0f with SMTP id
 h11-20020a170906530b00b00a0bd4f4ef0fmr11453298ejo.43.1701296334646; Wed, 29
 Nov 2023 14:18:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311292250.RUfWGNgx-lkp@intel.com> <20231129134313.656e76c2e3fec1361007633b@linux-foundation.org>
 <20231129135342.5697165df1adfff04c749082@linux-foundation.org>
In-Reply-To: <20231129135342.5697165df1adfff04c749082@linux-foundation.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 29 Nov 2023 14:18:15 -0800
Message-ID: <CAJD7tkaVpM6DU9Dra6VO_rsDB-6sHejTY7jGWTqCX2do0i3HAQ@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 179/192] mm/zswap.c:825:17: error:
 dereferencing pointer to incomplete type 'struct mem_cgroup'
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Domenico Cerasuolo <cerasuolodomenico@gmail.com>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Nhat Pham <nphamcs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 1:53=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 29 Nov 2023 13:43:13 -0800 Andrew Morton <akpm@linux-foundation.o=
rg> wrote:
>
> > On Wed, 29 Nov 2023 23:42:11 +0800 kernel test robot <lkp@intel.com> wr=
ote:
> >
> > > >> mm/zswap.c:825:17: error: dereferencing pointer to incomplete type=
 'struct mem_cgroup'
> > >       css_get(&memcg->css);
> > >                     ^~
> >
> > OK, thanks, patchset needs work for CONFIG_MEMCG=3Dn.  I'll drop this v=
ersion.
>
> Well that's annoying - the "mm: memcg: subtree stats flushing and
> thresholds" series had lots of dependencies on this series.

FWIW, the "mm: memcg: subtree stats flushing and thresholds" series
has no actual dependency on the zswap series. The conflicts come from
patch 2, which moves some code in mm/memcontrol.c, which happens to be
touched by the zswap series. The first 2 patches of the stats series
are just refactoring with no functional changes, so if those two can
remain in mm-unstable, independent of the remaining of the series or
the zswap series, then either Nhat or I could easily rebased our
patches on top of them, and you can easily move the series in & out of
mm-unstable without conflicts.

Another thing is, the only difference between v3 & v4 of the "mm:
memcg: subtree stats flushing and thresholds" series is the rebase on
top of the zswap series. So if you want, you can take both series out,
and add in v3 of the stats series instead of v4. If you need to remove
the stast series again in the future, you can leave the first two
patches to avoid conflicts with the zswap series.

I hope this helps.

Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5E61D0E12
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 18:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727894656; cv=none; b=gSvrn+BywECGBx8SnTCdv8TA6569wIYp0/beu1tNOV231D32XjoSjUJnreckyDky+ZfOl0fk3fy6DsHcK6bfln0gHu+p2cWbQX6YCiTBCvlqYkxQO/THh2hPvWoBTd87FNM066PHAF7waqPY0CODXwiGoEHJLzC75JM5P8kMW6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727894656; c=relaxed/simple;
	bh=iJBzvn/cj/JRuaVnnHh9DDHoNTwL/SAzdLlHVGlLAm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHu5TvfiGXy4V8RCRLTe+9AzGzZoRkT0Evm4563tSBzUAewuFOWyqdFfauznfnOXU/+NHU+0GHt0xMBzqWm6RamTzl8tzS9kz+QK/86C1q4iRm3gu9u5/8gHaAG/J0+XyeCGwXcigGU5M7CkNWgDzqJeoX7YeoT6cCpg1QVWca8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4ebvYHVj; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4ebvYHVj"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so9940866b.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Oct 2024 11:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727894653; x=1728499453; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZE2Ce/T+Mvy1H3tSTUGCLB3DqdOmW8uu6V5jQSIQoeI=;
        b=4ebvYHVj9yiZtMZTgQWIZN9YSmRhq1rAEk0WnAmw8fbUiHb1lmo5G2kfgYQMxUVMAJ
         G995Jg6/krkaNE5TzZKujcd8ixxViH19utj33yJqBsij7RZCEiUprn/yp9MAkWPrR7cq
         gyXOrmW2oZPGMZlDoZr9bEQXc6O6YQkyULU7/xyhxuPfacy/J1EnRmjOcrGwZoXPcl47
         9Bt7cgLedHF5BqMBEX4Uv4zLnNHsZrzMWvc5+7WCdCvLJQ2ZbRE95ZRreuS87mUm+VWq
         RylyuCczf++LVsqABNclXGTz6io1m8Bm7p4Q8EYHBhcQYoTOX0w5lyduu58/3FAU2o3w
         zbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727894653; x=1728499453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZE2Ce/T+Mvy1H3tSTUGCLB3DqdOmW8uu6V5jQSIQoeI=;
        b=pE2uwsQl3BQKkKkS8wGvk6GdyZNUStqwLGdI19ANnOI+qZvjUWboYjx/W0zajGAPLR
         GHs6364TQs1/a9IfkuKM/OYK2kqhIfrHwN8gsiWvBgmP4sIRzEkYRhKNMLcMaxBqvEDf
         oUKingQJJABbYS7PQXpE1KWQawhhDmnUcdvz0Ppz3Rm0QoJx/iccYcZomWapgC+znKEj
         V1uYK/mSnJC99eqK5eXfITRQYQVk8JgzCpiIcisOaf8G+Ww/5mPDI9tt7YItoBMleUYX
         XIQ8E975E1nEqhzSA/31guqDBAk5SQblkKXeN8KR6rm6Bj+hT6q0333xpbYpyvmlVhI5
         Y3Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXD3VfavdSkIzCOHMyMohPXNFshLXFzN1aF8nTpP/QpPEMZvUGF10YeK+ZDVPiKFvADe56Q3ffhw1HiDqzZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5L4lSSQgiLnKCQxgYEUfMnsB+twzvJCD5yMX4UIH4MYLVxFJm
	kN15jbLQynTXkNhYYCRbc071mg9zRWN2Jr70EOrBqtYnYJoI2cjlkzdCIDFUgCB1HtIzmxP7/2W
	LBsx4l/3uFHIaK3ax+ORCeTCOkafZe4IJCrA3
X-Google-Smtp-Source: AGHT+IEil/s7p+VRY6t+0zcsrwiNDY//TmdLrQJ3cdUC1G29saH9zpEzRGC2WIzFjCvXcKvMUeQ2DtMotmphT//t2nY=
X-Received: by 2002:a17:907:25cb:b0:a8d:2e3a:5303 with SMTP id
 a640c23a62f3a-a98f8295ed5mr418895066b.39.1727894652491; Wed, 02 Oct 2024
 11:44:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410021530.DnNbPqfN-lkp@intel.com> <CAKEwX=Ma9usQBge8uKvin=+GsuRDgJrDYTthzLg7zhtbLMPc8w@mail.gmail.com>
In-Reply-To: <CAKEwX=Ma9usQBge8uKvin=+GsuRDgJrDYTthzLg7zhtbLMPc8w@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 2 Oct 2024 11:43:35 -0700
Message-ID: <CAJD7tkYoL-V+tEHSDQ2uCdSTeEL-TfJDnok9gGR-d_MW42F2cw@mail.gmail.com>
Subject: Re: mm/zswap.c:744:52: error: 'struct zswap_lruvec_state' has no
 member named 'nr_disk_swapins'
To: Nhat Pham <nphamcs@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 11:13=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Wed, Oct 2, 2024 at 1:01=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   e32cde8d2bd7d251a8f9b434143977ddf13dcec6
> > commit: e31c38e037621c445bb4393fd77e0a76e6e0899a zswap: implement a sec=
ond chance algorithm for dynamic zswap shrinker
> > date:   4 weeks ago
> > config: x86_64-randconfig-r133-20240215 (https://download.01.org/0day-c=
i/archive/20241002/202410021530.DnNbPqfN-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20241002/202410021530.DnNbPqfN-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410021530.DnNbPqfN-l=
kp@intel.com/
> >
>
> I'm stumped...I downloaded this config file, and used the same
> reproducer build commands, and it built successfully for me :(

There seems to be tons of existing build problems with zswap.h and
zswap.c, I am not sure what's going on.

>
> Fellow zswappers, anyone managed to reproduce this? Or is this a false
> positive...

No luck here.

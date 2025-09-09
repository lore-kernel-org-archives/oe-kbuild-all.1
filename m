Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5D32550CA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 06:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757398680; cv=none; b=cikWdbG/AzAozhPn+lUQTjn9MAoZG+EHLWSQsN0bsXCHzhcN+h/YIxIC9OK3Ed+wxsQF52o1XNyI9w27Sdb8vfSJCCFiTUym0ZxR/me1vp09Mcs2VJqOZmWJGdOPYyH2woQfy1Ed2wP3kr06CDgmXo1a3ltqVZl5Oj0yZbuzvJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757398680; c=relaxed/simple;
	bh=4WXIW00rUMuoH/LxiruMwl6Jw8DXTQAxkOm73/utT7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4pG8lloSyhePZzd4j0iY+shKCG38sqoNc9Z3G7iU9lDuHgTgFp83XNjWs8Fwy2B0C4YR4hSlHrR/IzPDsPL0CcH4MYDOZcgyCF9GCcTFMytY4Ygx9pAebIXv8QVqgNZ4zd1WRO7OQxB/odptaFFa3J21SGvYvmAarlDudDzi5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=N87mo8PV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="N87mo8PV"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-24cd340377dso32250765ad.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 08 Sep 2025 23:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1757398678; x=1758003478; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LArI4fz9z2RUHIMVRDEozej8RuFnnFsDypQBKDKEKlM=;
        b=N87mo8PVOjUYJbrPl32Lc1qy0Pb3buC23eZ5Upo3J0K4S6u4/Mxd3pA6UxaB9koXDs
         yZVZZw1ex/2rMlrBkSypdcrQdVpNnbZSV1OPXqjgNwLHLtafsVS6IpDoNGvm/Zh4sqwm
         fYRC1lcL6t5HJCoqjS9YoODBCKrFaab/wg9Cfa/KGSQtf3d9uk4YcGehDsjD6zrHrflK
         unKYwAUQEuRBjA0V63DKiX/yQZ3+47NXaLA4g8004H6PdlgusGJOkmxp5jzTNFHdm8Lr
         HXhNC8lE3SXVbVWr6bjkqAWapHyrUw34itlCJOqgmw0aOIsxxrKBtm2Id37AFNCI1aTM
         KRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757398678; x=1758003478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LArI4fz9z2RUHIMVRDEozej8RuFnnFsDypQBKDKEKlM=;
        b=fgNE3qIb6IrGKnTHZ0XDhnm/ih6H2QJPqLRBcryFXREw+VocgVFooQrNKmyWr1Tone
         vydA2VnTIEAD85UOi24ZLxa2sZE3NJql7RMjviGzqcMPkrF1hk6cFzTWFLrYd8Uo2P2e
         tzLIx0HsEI1Bp7OOYG7YMJkcFCFcIgE+xPd8LbL5j38XWCr4k/TwLsqg8/tFZ94Pwd1k
         figj22d1SeP/hmGiTqM467Xm6nl9pKGBUZ5Tx1vXqkq7KTowzZfU6VMdWPXo56mIIVM3
         on/yX9VroGRo6rSpc97VSZhja++oaCBh+L7q3+DqehJhURRfJTwbuJuDkbRrc/6EBLgG
         4NNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV13gK4EWf1Xmtc4mq760moipy5XESxfr4bLzE4qngYCptQBylF9cUMrkkBAQJpNZeUEUhLHFA8hBnG5Pfp@lists.linux.dev
X-Gm-Message-State: AOJu0YyOPYgV0hDjFHZ8A0a3CIQqZ/IErozI8ddVHWScr82pJhdf16CJ
	oRoJh8wcgnZkbwMVjbCE4tWdL7vshzel5Qz39igOqi5y8QQfEqx9duNGtIA+qD8sjg==
X-Gm-Gg: ASbGncuebtx2m/+UN5HQ3xQXI06Phshv47bIaq8wNB9gZnePsxSYMRKiH4ii7grAqPc
	ZwqSjkJp7riwEH6JA0F/xHWOk9mVO4QFpOx4JUD5MorMgHcY6lY8PgaMEoQgP6jpS/bAx8Xl0n+
	321smJjm3tkP/MN8xMOY3K66A7/m5fgSCugSUEh63J4IfuNY62M+nm4tZi0FFgvkBwhn7urta8/
	Nz367nJSLYrdxtCSyB+/UYpm0NdHp0eC3LlhWvUnZlUepaW/p0h6PjbzQnTwyv4OltH3aV4/g6d
	cxbJzPOgXANTtPs6O+icCyEAOL/b9pMTEXHteZoFoxRAVPgULXAdaWFVaC2W/NjSEU9hyg3Tcqw
	oDhSKCWNr54cLt5ncpZXfxMqoUPI4aInkXOl1JdNcU8xeS4xbt5kTNmKOqfyV
X-Google-Smtp-Source: AGHT+IEkHAzR6Xk0Y97cHdzqv3Qzt2g/2xG94+TwykxPgXHKx13j3+cFe6/+Cc21Ki8tIBcNSVxmEg==
X-Received: by 2002:a17:903:2350:b0:252:1d6e:df75 with SMTP id d9443c01a7336-2521d6ee123mr132890615ad.41.1757398678082;
        Mon, 08 Sep 2025 23:17:58 -0700 (PDT)
Received: from bytedance ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cea3c7a83sm116669035ad.9.2025.09.08.23.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 23:17:57 -0700 (PDT)
Date: Tue, 9 Sep 2025 14:17:46 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: kernel test robot <lkp@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, oe-kbuild-all@lists.linux.dev,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>,
	Songtang Liu <liusongtang@bytedance.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Matteo Martelli <matteo.martelli@codethink.co.uk>,
	Michal <mkoutny@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] sched/fair: Propagate load for throttled cfs_rq
Message-ID: <20250909061746.GB35@bytedance>
References: <20250908110548.GA35@bytedance>
 <202509091233.f6nP3BVh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509091233.f6nP3BVh-lkp@intel.com>

On Tue, Sep 09, 2025 at 12:20:47PM +0800, kernel test robot wrote:
> Hi Aaron,
> 
> kernel test robot noticed the following build errors:
> 
> 
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20250908-190724/Aaron-Lu/sched-fair-Add-related-data-structure-for-task-based-throttle/20250829-161501
> base:   the 3th patch of https://lore.kernel.org/r/20250829081120.806-4-ziqianlu%40bytedance.com
> patch link:    https://lore.kernel.org/r/20250908110548.GA35%40bytedance
> patch subject: [PATCH] sched/fair: Propagate load for throttled cfs_rq
> config: i386-buildonly-randconfig-001-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091233.f6nP3BVh-lkp@intel.com/config)
> compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091233.f6nP3BVh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509091233.f6nP3BVh-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/sched/fair.c:6747:1: error: expected identifier or '(' before '+' token
>     6747 | +static inline bool cfs_rq_pelt_clock_throttled(struct cfs_rq *cfs_rq)
>          | ^

Sigh, I remembered I did a build test with !CFS_BANDWIDTH and now I went
to check that build directory and noticed I didn't have CFS_BANDWIDTH
disabled...

Sorry for the trouble, will send an updated patch later.

And thanks for the report, lkp.

> 
> 
> vim +6747 kernel/sched/fair.c
> 
>   6746	
> > 6747	+static inline bool cfs_rq_pelt_clock_throttled(struct cfs_rq *cfs_rq)
>   6748	{
>   6749		return false;
>   6750	}
>   6751	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

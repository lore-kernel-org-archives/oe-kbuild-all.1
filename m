Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C16235074
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 06:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757399249; cv=none; b=S12aFAY4XZDjdyXGNPnd8FOvzjsklOGK764Gj4PzzrhfkS+ZVCYN9+2HcVypJ3gzVeGsR88UVbdOO8fAyV/O/6HmUoUKJD3ASCbot/Zdt8QseAmmRG+YB8DpznwUZ0aQD+gu6RLNIV1gpcf+LPHXBHKJziFma2zcvU+LNiqBvpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757399249; c=relaxed/simple;
	bh=oZT6kWzzKCaWeBLUxhtiZLLSS9X2Fa0fJAeUILTYYN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBRukbGAz/oZTm1eOI9t3byKtTeiW6y6wASW+OnTqwxHuuLE0JeqLqz7ED0ohNEUvpui2w9KXIEtMGwiL5/1PSbneG/U8Tzgy12oqJIbgzOSUNbQVJyO7JQbe5ZMKZd2ylSbX+u/C2sXOwSfNsKQMo4NjHCqIE2i3g7uOUvhOgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ekie+kiD; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ekie+kiD"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7728a8862ccso4496971b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 08 Sep 2025 23:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1757399246; x=1758004046; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TIfQ0ej2H13X+Mf/hogW6BzJHq1AE9tbW6U5ofOKEOY=;
        b=Ekie+kiDn61lhW2/XnkY3etfUopkOaj6BID8s+sOB812aNEPG/n55fD9R6TTi5nqLv
         sRYWqSWJbmwwAeNgMPSfiJh5TWcPYFr3JkZFLY9l6RI/Fo1vKMkDG7pFWES+4/O6+N2Q
         iW1ie+mxMma/cB+UCxnN3HbvoDLuyVhvRC77rMj1AtLI3GdJLcH2y553NXT9nZFmvNz1
         nB2dH+AQiBJugtZuPSPSCNkCBshOzXigAqEIkQK0XXjj7w/5XQ75d29EQKZ24bsR5/Wy
         OJPO3V6Ok5y3kXdO/lqsldjLB/9mx1Z7l5MsYy7ngcvW8w8OZFhj7kWyOoMl8+VbcCOc
         8VxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757399246; x=1758004046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIfQ0ej2H13X+Mf/hogW6BzJHq1AE9tbW6U5ofOKEOY=;
        b=G9wlYlKj3NKDwqkFHSC4pMxqvkLRnW4BZ8SRMyjy5iENe9nTv/swgS7r+4chKEgMvy
         uNm4GS2616hcY5uf8sQSqGn3OZorJYUZB0RTm1Jlhq85vQc5Y1iqgAVHhVqYRlLic79q
         yANQ1LWr66Ty9+xV+8a366dezkdae57taOSkw1nMSY7J57KP5ocvXvjUBNqbn3fJ/B1C
         Me4efDl7WCA4ElTFFWMIevgcZnAbZzPJqMsT+Fseg7MZL/u2GB0HUCDSPbukgAj7QajJ
         EoWPX5PpFIyGMeNSMFL3r6IILRkYKIKL6PNgf72Ty1XurZPCXiF7BcvAMr45v7jzwiLU
         s1EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw9OmXhzZfbQOinOGrKJvbFy/vr3L75CX9t0OFS3DWwULhAt+CT/IDthdDLtbdK+EDrw2kAQFzmVnvmA/m@lists.linux.dev
X-Gm-Message-State: AOJu0YyFK7KiASbgcIToVfJGLDnDQnPhb+nctBoy0jkOgsLQBO2k/+JC
	ZJbpoCbgCM7wp22FbKwr3WVLZS2rTaQ2FgTBW9QEz2V5KUMkhz7+YT8+kTQiaqTurA==
X-Gm-Gg: ASbGnctImNUI2pdlPYPJdcD3zVfGxuV5zH1x3IiBV8bGehViCQFVTq9XwA29pAjx5JP
	WmMeEwAweef7SOQ8+zkGI2fea1dFphK6ldxdOrBTOEkFVAoL9NLlPcx+pKbsZPA9nZxoW59oGgT
	0auhs3SApBD9x8y63HbzphhOZj6hy6MoiLLQ+GMXgeSieFO9H0iXW55/0rBOEuBhaOpmBuHP+D7
	gsAQc9Brjmq0YLX6U/silP8TPBRWyjifGGXrQySV1w0NRwKfGuO6VRz+eHjEu36wwQZiRNjFGRP
	OvvUS2CmzHoWfqpqU3WorL1Gb/Y1lPgCTA+6mmZf0bDQnOmXxMmzTYcz7fozVr3DI8oxXMdzTWK
	t3kFba+7yk1Pyy58icnwhSIltsq0KtPLJj6xbNUEN4TjVnILU+DhV9t+IN13T
X-Google-Smtp-Source: AGHT+IEjXDRhmzDLAQ7JbHedj82gankQmM/a4mRdl/qrwQdv7IW3BtEjOxI5vHM6y9RbJG9gtfcz7w==
X-Received: by 2002:a05:6a20:7484:b0:246:1e3:1f7e with SMTP id adf61e73a8af0-25376386b77mr13623443637.5.1757399246269;
        Mon, 08 Sep 2025 23:27:26 -0700 (PDT)
Received: from bytedance ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774660e55f1sm944357b3a.13.2025.09.08.23.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 23:27:25 -0700 (PDT)
Date: Tue, 9 Sep 2025 14:27:15 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: kernel test robot <lkp@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	oe-kbuild-all@lists.linux.dev,
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
Message-ID: <20250909062715.GC35@bytedance>
References: <20250908110548.GA35@bytedance>
 <202509091233.f6nP3BVh-lkp@intel.com>
 <20250909061746.GB35@bytedance>
 <fd017cc8-0eb0-4961-8f59-575505f27a68@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd017cc8-0eb0-4961-8f59-575505f27a68@amd.com>

On Tue, Sep 09, 2025 at 11:52:55AM +0530, K Prateek Nayak wrote:
> Hello Aaron,
> 
> On 9/9/2025 11:47 AM, Aaron Lu wrote:
> >>>> kernel/sched/fair.c:6747:1: error: expected identifier or '(' before '+' token
> >>     6747 | +static inline bool cfs_rq_pelt_clock_throttled(struct cfs_rq *cfs_rq)
> >>          | ^
> > 
> > Sigh, I remembered I did a build test with !CFS_BANDWIDTH and now I went
> > to check that build directory and noticed I didn't have CFS_BANDWIDTH
> > disabled...
> > 
> > Sorry for the trouble, will send an updated patch later.
> 
> While at it, another nit.
> 
> On 9/8/2025 4:35 PM, Aaron Lu wrote:
> > @@ -13151,10 +13161,13 @@ static void propagate_entity_cfs_rq(struct sched_entity *se)
> >  {
> >  	struct cfs_rq *cfs_rq = cfs_rq_of(se);
> >  
> > -	if (cfs_rq_throttled(cfs_rq))
> > -		return;
> > -
> > -	if (!throttled_hierarchy(cfs_rq))
> > +	/*
> > +	 * If a task gets attached to this cfs_rq and before being queued,
> > +	 * it gets migrated to another CPU due to reasons like cpuset change,
> > +	 * we need to make sure this cfs_rq stays on leaf cfs_rq list to
> > +	 * have that removed load decayed or it can cause faireness problem.
> > +	 */
> > +	if(!cfs_rq_pelt_clock_throttled(cfs_rq))
> 
>           ^ Can you also add a space after the "if" here.
>

Yeah, I definitely should do that, thanks for catching this.

> >  		list_add_leaf_cfs_rq(cfs_rq);
> 

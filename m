Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68877277CBC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757498129; cv=none; b=kB0aQY1fn811KoYb4PalzwoD7OQ2VXbjOEBsPd3HmbEtUp/olxGgwCSvo0Ap+oGT7QDGR/BuZBOO677WjOrgCJQG/1UGx3r1yqfiY0k9/nkMj9YaovEO/n9QngH/5DwmmtUK3R2IP5bAr4xs2w3AWleBWbLeTd86lRXW3fg9Lgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757498129; c=relaxed/simple;
	bh=xfTqnHdvgd+w7nvWVenmv/Zl+heyzHkpemmTdjv859E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCPCg33mIUTBo9e3Dkvo/+kB5asqvncDviguPjmZjE1/vtCi7UQORVIDbUsapy8JPNLGh7gel1Edl+S8aSN8IBnJeiwAncU0hyuK2zPv4821cs8Wn/MAzP6Cjs39KyIYQ/BLD87Fe3nS+iuLuS9+EW6uicRNG/eiXfMFJQk6lgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dB8MFo25; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dB8MFo25"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-772301f8a4cso9225521b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 02:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1757498128; x=1758102928; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HCDCW1DJDwjeVUsbjWyUYxZAgB9l/KJebELwDQQoPFg=;
        b=dB8MFo25C2LldXAhxYBQolCxUW33oeaPISbJz3TS83z7YYirPpJ5cpIOQTUFrQheOP
         Vz5bwPgAIvgqIv0MyuF0Ior2jFK6cVLNrsdTjRj407uxaHLyBPgC+IsasR5IIfrbfmUA
         m63IXO7TZbPGNayJgU1Gqryd9qyNyuChIa749TG8qVwZs1TLZFMIpSOIWQgh59bJyv8F
         zvYdAivoFzGp/TcbLLQTSFYjjXJs2CXW6mcfevnmu2Uyxh/P5lZdn1/Xx8DUfICHqrlS
         rsLAAhWhVmIsEvFR63RwmmK+5B/dq7OEDy+ARxngmTnjPEMSIHY8zJR0caw662cR1t3/
         RKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757498128; x=1758102928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCDCW1DJDwjeVUsbjWyUYxZAgB9l/KJebELwDQQoPFg=;
        b=tMYEacD5ONAwEUGMRsLCKtDI8kTt6562L20+HDm+0qnen8ACsFb9HkNFvbPRln4jkT
         qul3b0l5LCnCW3ycOjpD6giPETl+p2FAiAfi/ljb/iH+v/KvwRUlGz0WhAfG4Y+PDDIA
         LnHCuZiKSKXpxQ75S4C2X1GDVT4q7pYNNf7QG0MVwtTPGolk/bvBjnwH1wgHuYH4SjRS
         vSAaMwzFnUCtG+QjtFK4WiDaSgmjTDfrTLo65RSelGrlCXcQISj5SbJVpxXQIKGbY6nt
         /Qth7alIDrBWZp6ZJZ6o/BlDEXpo0Duu26VbvT1n57Dpxk54Fts5Lm2ToD5OXvyyPazH
         hEdg==
X-Forwarded-Encrypted: i=1; AJvYcCXx9ratWQ4qrJgOCYgQ4DScdx8crUj6cCHEGR4CA9rPlo7ki2XfLd5y8xCyOPqjzmVlvMSLZ9lDYqUAZrfi@lists.linux.dev
X-Gm-Message-State: AOJu0YzKn81tAz4nIvuiARp03+HeQ6Yl0ubdQL4B6ilRxu5u7gVtHE44
	9h9l+Q4gwkBGrZej4auX1bGjcIJRHjcK7BPXQXH+FfS0L4fKdmBkjhor33+SaT1+PA==
X-Gm-Gg: ASbGnctBvXDisPxoyjoe1LgOweF+e+WnTLj4nZ787Aqk3qkmeRgJhYJVPZc5Zv0Kmue
	uVW3LbCHPGpzMI/ILKT0Cl0xoXmyqwPK/eKY9f25L8Ceg+I/GHV7nOGCLh2VMCXbdpHbE4TO5hG
	MtLOEbwEyfs1ONT6emDfGZmuy1sChp4UceFzNLYVw8TaRfMweQucJ5JI230zLzQTQwE6iRRso8F
	ozE3ohE19P4+9QXSWumsn1wkiPNWmppu8Gmug75Xb4J4DkCAmVemzOnZW6eLfd+O5qrTZad1ppj
	GB4P1R+EgBhpzkwXlzvmUQTUs8o7DAL/Z2hiTuThNcxPbJQDJpNYOOZFWXR+d66kSRj8W/loGCl
	h0IcIoD2kht30z7nA5sHJQEpGhdreFjUrUnRYdiYq1CSjmxxDdA==
X-Google-Smtp-Source: AGHT+IFmU3xrUacDZpXLML8Y+6XKXJYFALe5fXyF/Z8mNdu2z6DBp0qPcfflXDumO96Ad3U8GHtFWg==
X-Received: by 2002:a05:6a20:258c:b0:251:9f29:4544 with SMTP id adf61e73a8af0-2534441f61emr23884742637.34.1757498127563;
        Wed, 10 Sep 2025 02:55:27 -0700 (PDT)
Received: from bytedance ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b548a50cb23sm2065239a12.19.2025.09.10.02.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 02:55:27 -0700 (PDT)
Date: Wed, 10 Sep 2025 17:55:03 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
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
Message-ID: <20250910095503.GA261@bytedance>
References: <20250908110548.GA35@bytedance>
 <202509091233.f6nP3BVh-lkp@intel.com>
 <20250909061746.GB35@bytedance>
 <fd017cc8-0eb0-4961-8f59-575505f27a68@amd.com>
 <20250909062715.GC35@bytedance>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909062715.GC35@bytedance>

On Tue, Sep 09, 2025 at 02:27:15PM +0800, Aaron Lu wrote:
> On Tue, Sep 09, 2025 at 11:52:55AM +0530, K Prateek Nayak wrote:
> > Hello Aaron,
> > 
> > On 9/9/2025 11:47 AM, Aaron Lu wrote:
> > >>>> kernel/sched/fair.c:6747:1: error: expected identifier or '(' before '+' token
> > >>     6747 | +static inline bool cfs_rq_pelt_clock_throttled(struct cfs_rq *cfs_rq)
> > >>          | ^
> > > 
> > > Sigh, I remembered I did a build test with !CFS_BANDWIDTH and now I went
> > > to check that build directory and noticed I didn't have CFS_BANDWIDTH
> > > disabled...
> > > 
> > > Sorry for the trouble, will send an updated patch later.
> > 
> > While at it, another nit.
> > 
> > On 9/8/2025 4:35 PM, Aaron Lu wrote:
> > > @@ -13151,10 +13161,13 @@ static void propagate_entity_cfs_rq(struct sched_entity *se)
> > >  {
> > >  	struct cfs_rq *cfs_rq = cfs_rq_of(se);
> > >  
> > > -	if (cfs_rq_throttled(cfs_rq))
> > > -		return;
> > > -
> > > -	if (!throttled_hierarchy(cfs_rq))
> > > +	/*
> > > +	 * If a task gets attached to this cfs_rq and before being queued,
> > > +	 * it gets migrated to another CPU due to reasons like cpuset change,
> > > +	 * we need to make sure this cfs_rq stays on leaf cfs_rq list to
> > > +	 * have that removed load decayed or it can cause faireness problem.
> > > +	 */
> > > +	if(!cfs_rq_pelt_clock_throttled(cfs_rq))
> > 
> >           ^ Can you also add a space after the "if" here.
> >
> 
> Yeah, I definitely should do that, thanks for catching this.
> 
> > >  		list_add_leaf_cfs_rq(cfs_rq);
> > 

Just a note that the updated patch is sent here:
https://lore.kernel.org/lkml/20250910095044.278-2-ziqianlu@bytedance.com/

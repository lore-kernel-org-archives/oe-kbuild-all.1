Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7182CA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Nov 2022 20:55:52 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id w14so26441278wru.8
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Nov 2022 12:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RyUy3FPoDZHpwS/VbPdG1C0STKM2EnbRqd6JJodHJlc=;
        b=U5nlGcBPMNWp/Xt2hRAghUYFWmN6wwNXCHZjJUj2vxkImjYFZRW4uteWG4V3FeVdRs
         Fl50nI7zXE1jPP6mTri82uh9Kiw5O595Or3TnDVdmMDmNZDO8v4rsHDOxA0wsff3nu+D
         K0eB/lfxN+KIPJBFPg+sTn5mTR8Ngf2MiponBLFpe0EgPXiE3YyJOMxLkC8k02QydLKh
         pW3HOATAsdHn+UFL70hLsORCjfKiO8O005nkb53FwO/Kn6opkDLwRzoceRldAocirxp3
         2+3Qj2w8O1mhnZoCk0U/FdrsfHH90fYv6tEwbfTBfJM0OlnW/AqV1pqM3fQUALBEbozY
         1eBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyUy3FPoDZHpwS/VbPdG1C0STKM2EnbRqd6JJodHJlc=;
        b=Z1oRYx6lroZqAgE2TvCTBP2ZNFyr6Emh/s8lk6ec72ze2/hsTlvZL4q7Dbg+xS4SzT
         Y1tLakj21v3z09Mcx07VaCekt/Myw4Fy3JXk9t/a/XzseCag6Hk7e7aQ9TtsU+gr7Dx2
         rKtXcgoz6a0HiX3Q3T26TY/F3Bte5hXmCxZ/tCCQIRMX5U6OAfs03S4kg9Tbi1g8p6NB
         q8rPO4zdlth9KM11OkScKa9qDtM9dGY4/6uG2zKY0GYVmzictBVdhRsta2m9MVm4KxxU
         Ke8jUyCHc1+pvoj2rFA36h6VaHxIR8I6lcdCul/hPEBr2Ov2KH9EKvOKbB2gQmDTnzj1
         10Hg==
X-Gm-Message-State: ANoB5pncCnNNk8mCMAPFI9QLZx9TcEtu5+hWOsA1N/Vj0cIMaqMsPgnt
	qlmw74OIWQ5wUPEgulflgIz1gg==
X-Google-Smtp-Source: AA0mqf5dHQcyR/rzPXzBYaHBwalgHriwZ76e2nI9JYRtXBV3qfTZQVRFVYuYzlzUls0ASh5rwX2/sQ==
X-Received: by 2002:a5d:5234:0:b0:236:518d:f2b4 with SMTP id i20-20020a5d5234000000b00236518df2b4mr12379273wra.397.1668545750388;
        Tue, 15 Nov 2022 12:55:50 -0800 (PST)
Received: from airbuntu (host86-130-134-87.range86-130.btcentralplus.com. [86.130.134.87])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d458e000000b0022eafed36ebsm13281766wrq.73.2022.11.15.12.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 12:55:49 -0800 (PST)
Date: Tue, 15 Nov 2022 20:55:47 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lukasz Luba <lukasz.luba@arm.com>,
	Xuewen Yan <xuewen.yan94@gmail.com>, Wei Wang <wvw@google.com>,
	Jonathan JMChen <Jonathan.JMChen@mediatek.com>,
	Hank <han.lin@mediatek.com>, Paul Bone <pbone@mozilla.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: sched: Add a new sched-util-clamp.rst
Message-ID: <20221115205547.3f4kzig5r44ipv3b@airbuntu>
References: <20221113152629.3wbyeejsj5v33rvu@airbuntu>
 <Y3ICaCPX61EOn/KN@debian.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y3ICaCPX61EOn/KN@debian.me>

On 11/14/22 15:55, Bagas Sanjaya wrote:
> On Sun, Nov 13, 2022 at 03:26:29PM +0000, Qais Yousef wrote:
> > Thanks! I have the below fixup patch that addresses these. It made me realize
> > my html output could look better. It's cosmetic; so won't post a new version
> > till some feedback is provided first.
> > 
> > 
> > Cheers
> > 
> > --
> > Qais Yousef
> > 
> > 
> > --->8---
> > 
> > diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
> > index b430d856056a..f12d0d06de3a 100644
> > --- a/Documentation/scheduler/index.rst
> > +++ b/Documentation/scheduler/index.rst
> > @@ -15,6 +15,7 @@ Linux Scheduler
> >      sched-capacity
> >      sched-energy
> >      schedutil
> > +    sched-util-clamp
> >      sched-nice-design
> >      sched-rt-group
> >      sched-stats
> > diff --git a/Documentation/scheduler/sched-util-clamp.rst b/Documentation/scheduler/sched-util-clamp.rst
> > index e75b69767afb..728ffa364fc7 100644
> > --- a/Documentation/scheduler/sched-util-clamp.rst
> > +++ b/Documentation/scheduler/sched-util-clamp.rst
> > @@ -169,24 +169,27 @@ could change with implementation details.
> >  2.1  BUCKETS:
> >  -------------
> >  
> > +.. code-block:: c
> > +
> >                             [struct rq]
> >  
> > -(bottom)                                                    (top)
> > +  (bottom)                                                    (top)
> >  
> > -  0                                                          1024
> > -  |                                                           |
> > -  +-----------+-----------+-----------+----   ----+-----------+
> > -  |  Bucket 0 |  Bucket 1 |  Bucket 2 |    ...    |  Bucket N |
> > -  +-----------+-----------+-----------+----   ----+-----------+
> > -     :           :                                   :
> > -     +- p0       +- p3                               +- p4
> > -     :                                               :
> > -     +- p1                                           +- p5
> > -     :
> > -     +- p2
> > +    0                                                          1024
> > +    |                                                           |
> > +    +-----------+-----------+-----------+----   ----+-----------+
> > +    |  Bucket 0 |  Bucket 1 |  Bucket 2 |    ...    |  Bucket N |
> > +    +-----------+-----------+-----------+----   ----+-----------+
> > +       :           :                                   :
> > +       +- p0       +- p3                               +- p4
> > +       :                                               :
> > +       +- p1                                           +- p5
> > +       :
> > +       +- p2
> 
> The code block above is diagram, isn't it? Thus specifying language for
> syntax highlighting (in this case ``c``) isn't appropriate.

I could do with a helping hand here actually. I am a text only person but
trying to follow the new rst docs; but I don't have a clue to be honest.

I did try to find the right directive, but I couldn't find it. What should be
specified for this diagram?

> 
> >  
> >  
> > -DISCLAMER:
> > +.. note::
> > +  DISCLAMER:
> >     The diagram above is an illustration rather than a true depiction of the
> >     internal data structure.
> 
> The DISCLAIMER line above isn't needed, since note block should do the
> job.

Okay.

> 
> >  
> > @@ -200,6 +203,8 @@ The rq has a bucket for each uclamp_id: [UCLAMP_MIN, UCLAMP_MAX].
> >  The range of each bucket is 1024/N. For example for the default value of 5 we
> >  will have 5 buckets, each of which will cover the following range:
> >  
> > +.. code-block:: c
> > +
> 
> Again, why ``c`` syntax highlighting?

This is a C code snippet. What would be better to use? I think I was getting
errors if I don't specify something. But again; I was touching my way around in
the dark here trying to figure it out.

> Otherwise no new warnings. Thanks for fixing this up.
> 
> However, in the future, for documentation patches you should always Cc:
> linux-doc list. Adding it to Cc list now.

Indeed. Maybe I went into auto-mode and didn't use get_maintainer proper.
Apologies.


Thanks!

--
Qais Yousef

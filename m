Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B851C80B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Nov 2022 20:52:08 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5so7225400wmo.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Nov 2022 12:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SG0Aeb3AkNCRdUKmIoyZXLGGCOpWzdo7IiLbJYcybAQ=;
        b=sVJjVbQ8f6t/SnFDbSP7Uh2ol/fTnLHmcckKbLxA0w2qvSHz+/egSniH/vQEVhRTIQ
         1sDT/RoYXRg7mslXE107+QRF2buBDezS/Xde8n/KDizX3G+AHdu/60x2nkWPe99c7j+c
         niF9Cu+w+rT0bAZh3V8+mQLMGAHGLq3wyWtG7srXCyKm6caQgCRk6IMkLe4zudDiHOjp
         7WZrRqFYGJVbA37cA6RcBO8ohnmA6dXrvFPKFrB0XcSNJfPC6mS47AC6tPWx5JAh27KS
         y/1Cd2RT/4t8mJ0bqBpYBmiAecWftsvwPhHe4ulEET5AuBGNbpzKTOa67vZM7vpJxEaT
         sKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SG0Aeb3AkNCRdUKmIoyZXLGGCOpWzdo7IiLbJYcybAQ=;
        b=OMz8iWaNYdptMqgkbNZUf7pq0p4jdPmuwQB+1b2AY0TwmnsYKMDphxQKcxwFQ3929c
         JxXgtHoDLmpfeNjr0AEJDLDogB5PMEGAXbLaBMgkVGJpF1tEWK3mvnJ5zkYTIP4hydmq
         Fx5AgS2Hzk9iKTxOF+Ctbs0hP6j6d2Wa8UGlyks2R9tx22uVR47TSPsWY+oGEW9oRX2q
         5t7dcxiqjol0Bm76dhsqcyjHmOhiFVpbNodrK6Bu/vR7gCOOCcZ+wveSQxR5qldQKxCn
         IyyGhJCUTC6XhvDY8qC3th57dQDAjpuuLvo4WWmyA4ni9tYQiKQlN1zovtv/5Nxb4sjj
         f1Cg==
X-Gm-Message-State: ANoB5pkhF0XLKPSi/6UX68lQZ1klB/O/M+Ifu0t3x60h1hdBn+te2lph
	sLUzCT7M1NwUM8Zwv0E1fqcI8g==
X-Google-Smtp-Source: AA0mqf7bOvSTYUu/AICcCb4TKkNUK5bJ4iXaEeIUcc2L+EI+6h0HYJGdUl7p/lc5fV8n5firUWmbXQ==
X-Received: by 2002:a05:600c:1f0c:b0:3cf:a41d:8418 with SMTP id bd12-20020a05600c1f0c00b003cfa41d8418mr2708337wmb.190.1668977526994;
        Sun, 20 Nov 2022 12:52:06 -0800 (PST)
Received: from airbuntu (host86-130-134-87.range86-130.btcentralplus.com. [86.130.134.87])
        by smtp.gmail.com with ESMTPSA id q3-20020adfcd83000000b0022eafed36ebsm9571723wrj.73.2022.11.20.12.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 12:52:06 -0800 (PST)
Date: Sun, 20 Nov 2022 20:52:05 +0000
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
Message-ID: <20221120205205.itjp7ken5hdbtkty@airbuntu>
References: <20221113152629.3wbyeejsj5v33rvu@airbuntu>
 <Y3ICaCPX61EOn/KN@debian.me>
 <20221115205547.3f4kzig5r44ipv3b@airbuntu>
 <Y3ShA8SGM4PTYPLJ@debian.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y3ShA8SGM4PTYPLJ@debian.me>

On 11/16/22 15:36, Bagas Sanjaya wrote:
> On Tue, Nov 15, 2022 at 08:55:47PM +0000, Qais Yousef wrote:
> > > >  2.1  BUCKETS:
> > > >  -------------
> > > >  
> > > > +.. code-block:: c
> > > > +
> > > >                             [struct rq]
> > > >  
> > > > -(bottom)                                                    (top)
> > > > +  (bottom)                                                    (top)
> > > >  
> > > > -  0                                                          1024
> > > > -  |                                                           |
> > > > -  +-----------+-----------+-----------+----   ----+-----------+
> > > > -  |  Bucket 0 |  Bucket 1 |  Bucket 2 |    ...    |  Bucket N |
> > > > -  +-----------+-----------+-----------+----   ----+-----------+
> > > > -     :           :                                   :
> > > > -     +- p0       +- p3                               +- p4
> > > > -     :                                               :
> > > > -     +- p1                                           +- p5
> > > > -     :
> > > > -     +- p2
> > > > +    0                                                          1024
> > > > +    |                                                           |
> > > > +    +-----------+-----------+-----------+----   ----+-----------+
> > > > +    |  Bucket 0 |  Bucket 1 |  Bucket 2 |    ...    |  Bucket N |
> > > > +    +-----------+-----------+-----------+----   ----+-----------+
> > > > +       :           :                                   :
> > > > +       +- p0       +- p3                               +- p4
> > > > +       :                                               :
> > > > +       +- p1                                           +- p5
> > > > +       :
> > > > +       +- p2
> > > 
> > > The code block above is diagram, isn't it? Thus specifying language for
> > > syntax highlighting (in this case ``c``) isn't appropriate.
> > 
> > I could do with a helping hand here actually. I am a text only person but
> > trying to follow the new rst docs; but I don't have a clue to be honest.
> > 
> > I did try to find the right directive, but I couldn't find it. What should be
> > specified for this diagram?
> 
> Just leave ..code-block:: directive alone or use simpler double colon
> (::). The highlighting will not be applied to the code snippet.

Leaving

	..code-block::

produces this error:

	sched-util-clamp.rst:172: WARNING: Error in "code-block" directive: 1 argument(s) required, 0 supplied

I used

	::

and it seems to produces the desired results. I tried this first but I think my
indentation was broken then which is why it didn't work at the time and I moved
to code-block.

> 
> > > > @@ -200,6 +203,8 @@ The rq has a bucket for each uclamp_id: [UCLAMP_MIN, UCLAMP_MAX].
> > > >  The range of each bucket is 1024/N. For example for the default value of 5 we
> > > >  will have 5 buckets, each of which will cover the following range:
> > > >  
> > > > +.. code-block:: c
> > > > +
> > > 
> > > Again, why ``c`` syntax highlighting?
> > 
> > This is a C code snippet. What would be better to use? I think I was getting
> > errors if I don't specify something. But again; I was touching my way around in
> > the dark here trying to figure it out.
> > 
> 
> Yup, that's the correct language for highlighting.

Thanks Bagas!


--
Qais Yousef

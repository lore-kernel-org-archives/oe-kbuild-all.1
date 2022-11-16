Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5252564
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Nov 2022 08:36:24 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id v3so16020355pgh.4
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Nov 2022 00:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vwLoi1Ok3PtF/ie+UOseiAZ/lHqLfRlgXaoL3yNNmwk=;
        b=HF5b3NXW6A2JETiEFQ3FaGUS1cNSxVJKcCziy8RK+QMEp9yWOWV+7UwjC9MNWfVlB4
         +DxC1/VuLbEJB9i9bFaGckqT/wVP5f9V/wiCj78vJyUHnkOed6hlmdF3p/5SkTrALGw3
         GjSjgAdFOK37wRHBsOU1WtIlE74y8qkg0xmrJP77RavUxkUeNvULWzIQURzGJ7wLR2uw
         8KXUjYODhb91Ba5Gj4XwaxD+5j4Rl5kbKeLaR/uTcCyE9DN2Hwi2qQHKVcxbA9WiEo9T
         fjOzrPSvxcRlDEu9RrkaNwugNIdSLNuUD8jZzbKkyUBL5e3380o9RkrGuIHyrN4pgBY4
         oIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwLoi1Ok3PtF/ie+UOseiAZ/lHqLfRlgXaoL3yNNmwk=;
        b=yEHdrznOqeQerGHskKI2sBpd13F+qbYG/AbxxAf4l39nlCGpGx2eVlc2sFe0/exSUK
         Ji39FNyCZ47ejTJPhU0vvGgFJmlqVU4Tl8J6Yhto+gRpdZMWOVrw/aBKm8N9QpM8XGDD
         WFqZJyYR4t5ZczIuuYVSALF8btR6mGOhT6WO3RQeTGGIRqBzIKS7x3qIeJ+hCQICyf+L
         fVtxxqFg0O42MSOgaGaZKiGxdvHs9CShU9ZIZp4uzmWTk8jy7a3P92D5qJg27Omkyidh
         FpcTyMAyTrd/0YvCBa79OcZDVL/gr8thDMqwbjKx+7OtS7urJueS8j2Hxj4AY5kKMTNs
         POkQ==
X-Gm-Message-State: ANoB5pkNBkfcfgrXOcjVafapa6TIroVaXSAimy1uTBDlz30jYQ4LW1Ct
	FQQ/xN9KtbBGbVymfKnbg7Q=
X-Google-Smtp-Source: AA0mqf70ENAI2GXTQESEBn98H9BphkY+lxz1HVk+iUpruXANF2kjaxXeIU/FQfYaGla6vXQvox3NkQ==
X-Received: by 2002:a65:6107:0:b0:43c:758:5190 with SMTP id z7-20020a656107000000b0043c07585190mr19699472pgu.339.1668587784291;
        Wed, 16 Nov 2022 00:36:24 -0800 (PST)
Received: from debian.me (subs02-180-214-232-81.three.co.id. [180.214.232.81])
        by smtp.gmail.com with ESMTPSA id t7-20020a635347000000b0046fe244ed6esm9042017pgl.23.2022.11.16.00.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 00:36:23 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 7A448103FF6; Wed, 16 Nov 2022 15:36:20 +0700 (WIB)
Date: Wed, 16 Nov 2022 15:36:19 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Qais Yousef <qyousef@layalina.io>
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
Message-ID: <Y3ShA8SGM4PTYPLJ@debian.me>
References: <20221113152629.3wbyeejsj5v33rvu@airbuntu>
 <Y3ICaCPX61EOn/KN@debian.me>
 <20221115205547.3f4kzig5r44ipv3b@airbuntu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HFCAWN1oLQKieb8/"
Content-Disposition: inline
In-Reply-To: <20221115205547.3f4kzig5r44ipv3b@airbuntu>


--HFCAWN1oLQKieb8/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 15, 2022 at 08:55:47PM +0000, Qais Yousef wrote:
> > >  2.1  BUCKETS:
> > >  -------------
> > > =20
> > > +.. code-block:: c
> > > +
> > >                             [struct rq]
> > > =20
> > > -(bottom)                                                    (top)
> > > +  (bottom)                                                    (top)
> > > =20
> > > -  0                                                          1024
> > > -  |                                                           |
> > > -  +-----------+-----------+-----------+----   ----+-----------+
> > > -  |  Bucket 0 |  Bucket 1 |  Bucket 2 |    ...    |  Bucket N |
> > > -  +-----------+-----------+-----------+----   ----+-----------+
> > > -     :           :                                   :
> > > -     +- p0       +- p3                               +- p4
> > > -     :                                               :
> > > -     +- p1                                           +- p5
> > > -     :
> > > -     +- p2
> > > +    0                                                          1024
> > > +    |                                                           |
> > > +    +-----------+-----------+-----------+----   ----+-----------+
> > > +    |  Bucket 0 |  Bucket 1 |  Bucket 2 |    ...    |  Bucket N |
> > > +    +-----------+-----------+-----------+----   ----+-----------+
> > > +       :           :                                   :
> > > +       +- p0       +- p3                               +- p4
> > > +       :                                               :
> > > +       +- p1                                           +- p5
> > > +       :
> > > +       +- p2
> >=20
> > The code block above is diagram, isn't it? Thus specifying language for
> > syntax highlighting (in this case ``c``) isn't appropriate.
>=20
> I could do with a helping hand here actually. I am a text only person but
> trying to follow the new rst docs; but I don't have a clue to be honest.
>=20
> I did try to find the right directive, but I couldn't find it. What shoul=
d be
> specified for this diagram?

Just leave ..code-block:: directive alone or use simpler double colon
(::). The highlighting will not be applied to the code snippet.

> > > @@ -200,6 +203,8 @@ The rq has a bucket for each uclamp_id: [UCLAMP_M=
IN, UCLAMP_MAX].
> > >  The range of each bucket is 1024/N. For example for the default valu=
e of 5 we
> > >  will have 5 buckets, each of which will cover the following range:
> > > =20
> > > +.. code-block:: c
> > > +
> >=20
> > Again, why ``c`` syntax highlighting?
>=20
> This is a C code snippet. What would be better to use? I think I was gett=
ing
> errors if I don't specify something. But again; I was touching my way aro=
und in
> the dark here trying to figure it out.
>=20

Yup, that's the correct language for highlighting.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--HFCAWN1oLQKieb8/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY3ShAwAKCRD2uYlJVVFO
owYHAQDa8a84KtchgyJpx4axzQ+iluhGd5lM2NDhW2nye7ml+wEA1hgSmjfRoTC7
Zem7z+npTY/PWdm1wxsK7MjCCi30aQ0=
=imkl
-----END PGP SIGNATURE-----

--HFCAWN1oLQKieb8/--

Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFC923A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Nov 2022 08:55:09 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so10000627pjk.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Nov 2022 00:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HR9P7zKDMW3cvd2Jzy9gdBg7jDLfTliN9t0QdH38uC8=;
        b=k1aAHmpudMPnmmJzMx9XJ+M200gMG9hJ3TKsiCEnT2+JM4UUIIJAimAjZ8oSt28XwK
         OizPtqX+mue+30Co+i+zSK2K/IpD5PZeGPtaLuiKGwrF3fga6+UxKIZrw23inCrzr83z
         SBuZghcaB9tLIRJdK4AcluzX6+fL1xWVnkTgdVmxxtY+a1S2Qrk5eMSse5Vs7zi6qdiK
         fH0O1eBwrK5ohEk2+ah582fJr36kwrK6mNmtvpGcmN/fciGGS0icxjhxtDTgD5zlg+JA
         7/lJHiJPCcgGrL0YE793kjKFNf68Na9gCs84+/DZETrJd3fjLzQj6kCJcmq+fFmWL/we
         Xs7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HR9P7zKDMW3cvd2Jzy9gdBg7jDLfTliN9t0QdH38uC8=;
        b=D6V3roXHGyyjd2mpJiBilqdIB6HxLHCe7Lz6gLsrHevpmC6eMrgE7DHuEYOQFmtkFp
         1EmElHvhDUp+di81gDRxuyBPwlhZcPVAUhdqHSY3coBZ3fKmYn8aSRqZyhN4jrS4SNMB
         lwhRfxh9zZbb/XT0WFQsJ5eAtoq5lkbn1JgtigE7gk3QnfLVS6bXTfX1DM/6C9HlO6M9
         Qgrxsq3M+bB2LeZVNqouC+eIz6SWZ390Vmgdrj1JOQL0BL62jIiRQw8Hcg/pgspVzdRs
         AKPnTdJYlGLY4IbjRRG2m+0iQCzKi+UZerE+TjLr6Pl1deGqD1QCRvW7sRytsb4aBoe+
         gHuA==
X-Gm-Message-State: ANoB5pkXZSRnjerT4kMW6YRmQ2MMu+3ppV1M3xPMtHqH2jrLh4s8EMiX
	ylqLQhV4rI4LL/9I6Fnu3Nw=
X-Google-Smtp-Source: AA0mqf5mZ2n5x8+R0Vu+IaNJ8Odh2314RiZTIzus7TXohdNN6/T8n3UWyJZ/EgN1iwHa4RFbsgeuDg==
X-Received: by 2002:a17:902:7202:b0:186:9b7d:f0c9 with SMTP id ba2-20020a170902720200b001869b7df0c9mr12898481plb.58.1668416108491;
        Mon, 14 Nov 2022 00:55:08 -0800 (PST)
Received: from debian.me (subs03-180-214-233-25.three.co.id. [180.214.233.25])
        by smtp.gmail.com with ESMTPSA id h2-20020aa79f42000000b0056c2a85c097sm6165167pfr.20.2022.11.14.00.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 00:55:07 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id D6BD81042EC; Mon, 14 Nov 2022 15:55:04 +0700 (WIB)
Date: Mon, 14 Nov 2022 15:55:04 +0700
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
Message-ID: <Y3ICaCPX61EOn/KN@debian.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7WRnNdsftvyBSXEC"
Content-Disposition: inline
In-Reply-To: <20221113152629.3wbyeejsj5v33rvu@airbuntu>


--7WRnNdsftvyBSXEC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 13, 2022 at 03:26:29PM +0000, Qais Yousef wrote:
> Thanks! I have the below fixup patch that addresses these. It made me rea=
lize
> my html output could look better. It's cosmetic; so won't post a new vers=
ion
> till some feedback is provided first.
>=20
>=20
> Cheers
>=20
> --
> Qais Yousef
>=20
>=20
> --->8---
>=20
> diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/=
index.rst
> index b430d856056a..f12d0d06de3a 100644
> --- a/Documentation/scheduler/index.rst
> +++ b/Documentation/scheduler/index.rst
> @@ -15,6 +15,7 @@ Linux Scheduler
>      sched-capacity
>      sched-energy
>      schedutil
> +    sched-util-clamp
>      sched-nice-design
>      sched-rt-group
>      sched-stats
> diff --git a/Documentation/scheduler/sched-util-clamp.rst b/Documentation=
/scheduler/sched-util-clamp.rst
> index e75b69767afb..728ffa364fc7 100644
> --- a/Documentation/scheduler/sched-util-clamp.rst
> +++ b/Documentation/scheduler/sched-util-clamp.rst
> @@ -169,24 +169,27 @@ could change with implementation details.
>  2.1  BUCKETS:
>  -------------
> =20
> +.. code-block:: c
> +
>                             [struct rq]
> =20
> -(bottom)                                                    (top)
> +  (bottom)                                                    (top)
> =20
> -  0                                                          1024
> -  |                                                           |
> -  +-----------+-----------+-----------+----   ----+-----------+
> -  |  Bucket 0 |  Bucket 1 |  Bucket 2 |    ...    |  Bucket N |
> -  +-----------+-----------+-----------+----   ----+-----------+
> -     :           :                                   :
> -     +- p0       +- p3                               +- p4
> -     :                                               :
> -     +- p1                                           +- p5
> -     :
> -     +- p2
> +    0                                                          1024
> +    |                                                           |
> +    +-----------+-----------+-----------+----   ----+-----------+
> +    |  Bucket 0 |  Bucket 1 |  Bucket 2 |    ...    |  Bucket N |
> +    +-----------+-----------+-----------+----   ----+-----------+
> +       :           :                                   :
> +       +- p0       +- p3                               +- p4
> +       :                                               :
> +       +- p1                                           +- p5
> +       :
> +       +- p2

The code block above is diagram, isn't it? Thus specifying language for
syntax highlighting (in this case ``c``) isn't appropriate.

> =20
> =20
> -DISCLAMER:
> +.. note::
> +  DISCLAMER:
>     The diagram above is an illustration rather than a true depiction of =
the
>     internal data structure.

The DISCLAIMER line above isn't needed, since note block should do the
job.

> =20
> @@ -200,6 +203,8 @@ The rq has a bucket for each uclamp_id: [UCLAMP_MIN, =
UCLAMP_MAX].
>  The range of each bucket is 1024/N. For example for the default value of=
 5 we
>  will have 5 buckets, each of which will cover the following range:
> =20
> +.. code-block:: c
> +

Again, why ``c`` syntax highlighting?

Otherwise no new warnings. Thanks for fixing this up.

However, in the future, for documentation patches you should always Cc:
linux-doc list. Adding it to Cc list now.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--7WRnNdsftvyBSXEC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY3ICZAAKCRD2uYlJVVFO
oxzTAP91SQV2sUAfb8KpjDND49+RN0oPj9m6X1HvfIe84iwYaQD/SZMwOaKVGXxX
4RN1JV9biThAMBnOmGe5hT0C3nCrVws=
=zvFR
-----END PGP SIGNATURE-----

--7WRnNdsftvyBSXEC--

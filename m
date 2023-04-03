Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1E67C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Apr 2023 03:41:32 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso31108514pjb.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Apr 2023 20:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680493292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FXg7HFo8IGOwcXz+xhhxTe6e3AAoC5T1g7VGxj4ZrTU=;
        b=GQMh9Mc66DJQmu3ozynlsyvpfEs2UHpQQq3PLKnmT5DOBz73qqb2LSX9XWX8O9sNOk
         LVF7JaOsCdxo4lB8gW09vEx411Dh8psSegvwjBc0H1QBD6TsX1fAm4zbhDfqYdsXrlGO
         ugeUsJ4Ah/04bj/Tye0jIXFl47Y5UsDp/Iab6YNi2L21rLEMOfUZpGdSRZEYs8+6Wluj
         lUEqJDdkp8n8fXf/4wIDaRjQdVZGKipQEnBJVDdEENGgEljZCE/chAFyN0b7+pxWqv+j
         pA+mi6PxK+w72E6M/T0XHUraXxJJKjMQHYpVbXKAQKS56rb/QdhvI9qU3PBez8yLdasw
         NR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680493292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXg7HFo8IGOwcXz+xhhxTe6e3AAoC5T1g7VGxj4ZrTU=;
        b=h/f3iS1/Cjdkok8HyxdzZEtuxxSrvyQazYAZ9pbntFMRUAVQMVN5RSBRmncJnq1wGz
         Qi5WPDgpkZvIuSizqZ24ofQ2IC041EU+x4LTFPELRafv4fiJc2kfr4Zbn49+gDKidhvK
         8bIlJV+yFggyZ2OM5SiFIQ+FLWFj6GQhYSoOV+UBd2Oso/HKTYDIKphlL1c5wipapApX
         6Vp4zdtfdUhDTb4FiaURS7vhFd0XwAXc56t1EcPA/isHzg+Nk0KsGvMooi4xdfPr60eS
         hptg/QeQnaYFX2xdolL+nmitN1arnXzCFqF71EVGNRYa3PVIC1KllI4BvFZa3HJmCeE3
         DxqQ==
X-Gm-Message-State: AAQBX9efhg72+zs/ukXMy0znlnw7IWPsEj66BNi1JeqOycAK5bRZZAvr
	K1ypTLlHdRqP5ZXVquczVU8=
X-Google-Smtp-Source: AKy350Zj8qEaJ+ZabiLCgRpf2zuuu+PDP+ydP0Spb/wnTC7MJGQSvPJqCeW61Xy8SbFBrmDX/0gbIQ==
X-Received: by 2002:a17:902:f785:b0:19e:2860:3ae8 with SMTP id q5-20020a170902f78500b0019e28603ae8mr39191402pln.33.1680493292013;
        Sun, 02 Apr 2023 20:41:32 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-12.three.co.id. [116.206.28.12])
        by smtp.gmail.com with ESMTPSA id v19-20020a1709028d9300b0019d397b0f18sm5455896plo.214.2023.04.02.20.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 20:41:31 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 5795110679D; Mon,  3 Apr 2023 10:41:27 +0700 (WIB)
Date: Mon, 3 Apr 2023 10:41:27 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: kernel test robot <lkp@intel.com>, Joe Stringer <joe@isovalent.com>,
	bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, ast@kernel.org, corbet@lwn.net,
	martin.lau@linux.dev, maxtram95@gmail.com, john.fastabend@gmail.com
Subject: Re: [PATCH bpf-next v4 2/2] docs/bpf: Add LRU internals description
 and graph
Message-ID: <ZCpK5wOI0ZEedhrr@debian.me>
References: <20230401200651.1022113-2-joe@isovalent.com>
 <202304022107.IwHc05cs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ilTwJv3f+pqw84Rg"
Content-Disposition: inline
In-Reply-To: <202304022107.IwHc05cs-lkp@intel.com>


--ilTwJv3f+pqw84Rg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 02, 2023 at 09:47:49PM +0800, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
>=20
> >> Warning: Orthogonal edges do not currently handle edge labels. Try usi=
ng xlabels.
>=20

Hi,

I can't reproduce the warning above. My system has graphviz 2.42.2
installed (via Debian package). What graphviz version do kernel test
robot have?

--=20
An old man doll... just what I always wanted! - Clara

--ilTwJv3f+pqw84Rg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZCpK4wAKCRD2uYlJVVFO
ozQcAQCj8UTVKu5oY+LWQWX0nnujGgsrcAZl1lt6077X3AedOAEAgYGC9Us8sPRg
ZPi23Z3f3810sBuRzxVOC9SzIa6oqwc=
=bziQ
-----END PGP SIGNATURE-----

--ilTwJv3f+pqw84Rg--

Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651DC257D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 14:39:06 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-58fae4a5285so10669337b3.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 07:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1693492745; x=1694097545; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLZrBGnLZs2pRE/KvifoHn+CI1rpeJi7JyyHMepmqgM=;
        b=LrgagBSKyC72ZHODfq7UmsCm8uChvbDbeVIAwNxnR/yBzZZrdbApg4GM4x2/iFVdTY
         eGBI5kXq4AsyKrf2yfJpiYA7xNEgIfgEYHO5+Xiyxia/m4sCJNW1+o2+D7LeUTNUkS5O
         p4TZI/tkEfF2892C0vj8BdsHP6Alb8V0ZyaLh0or/AnOZ6fLvSbJAX4nXo/TYD1RiqjQ
         briksdpQmg8K1yvlKZRsxZJiSL6/XNYYSiGgtsX9VdRX2Y1+TOoL7oh4QNAAj5mRvz3K
         VJHZMJxHWiFpaDo6JM92hkHB0/v5Hkf/vzCXZprSQT1TcRBQ/mzapTTGbuzeVBdosCLq
         WSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693492745; x=1694097545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLZrBGnLZs2pRE/KvifoHn+CI1rpeJi7JyyHMepmqgM=;
        b=J/wxAX0GledpywWMphl7HSpwZGQWXixbtgBMfWTgxbc0c098x5TYIDG0QPotjSVpTf
         3+6zT4gPynTRS52DKJ2H1S/I9f57hqxJdSGGITBl797WyrdXeg7maZQ7A0MATWbjIpyp
         vwWlq0xOt6/B8rYmD0p03emug6Z/m/6qzNYtot+gP1wtaNsCzKDf+V7vpayDNN+4Mete
         Je0auRfRz1D/921JtAtmqFg7PV5mN3ctZ8YIGv+lSVBCapCRPdOb+yYD8IRRVa3y0X36
         +g8gB2DmM4078loXfJNfKhHxLFNG58CJFR/dGDnV3/WkBJ+Y4AM5F0R4DujR5V1BGRqt
         ND9A==
X-Gm-Message-State: AOJu0Yw6fjv7MSlEO85vD1MtKvXawuBJB/A9/Zb3AWV5k82s3r1P2TRU
	IyNSaqLXgXj9mhXEnVYbf+OI2jWc1HJXFy/6V9Ao
X-Google-Smtp-Source: AGHT+IGlvktnyds773cVOckzfrRiCq9Hr2UGcPh7WhbuB2zn1wCLypOEdnosfpZzT+35z4FMVFwhUXHkoDfzjbfWDDs=
X-Received: by 2002:a0d:e606:0:b0:595:973:b4b5 with SMTP id
 p6-20020a0de606000000b005950973b4b5mr6195696ywe.12.1693492745139; Thu, 31 Aug
 2023 07:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308301248.hEwyeVEl-lkp@intel.com> <CAHC9VhQZFZTaXb_S5YCy9KniVfPBmEQrY74_dMi5cBftZsrwNg@mail.gmail.com>
 <4d8308622a1513099fe461ed41409c3768d95946.camel@intel.com>
In-Reply-To: <4d8308622a1513099fe461ed41409c3768d95946.camel@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 31 Aug 2023 10:38:54 -0400
Message-ID: <CAHC9VhTjb8E0GUVNbdbgR2wzbXaGYFYZ6gNSMns+TF1muRA3+A@mail.gmail.com>
Subject: Re: [pcmoore-audit:main 1/1] README.orig: warning: ignored by one of
 the .gitignore files
To: "Liu, Yujie" <yujie.liu@intel.com>
Cc: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, 
	"linux-audit@redhat.com" <linux-audit@redhat.com>, "audit@vger.kernel.org" <audit@vger.kernel.org>, lkp <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 5:33=E2=80=AFAM Liu, Yujie <yujie.liu@intel.com> wr=
ote:
> On Wed, 2023-08-30 at 10:29 -0400, Paul Moore wrote:
> > I have no idea if there is a person attached to any of the addresses
> > on the To line above, but please send audit kernel issues to
> > audit@vger.kernel.org and not linux-audit@redhat.com.
>
> Sorry for the inconvenience. We've updated the bot's email
> configuration to send audit-related reports to audit@vger.kernel.org.

Great, thank you!

--=20
paul-moore.com

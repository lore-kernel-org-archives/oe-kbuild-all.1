Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4136E168C20
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 07:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718954076; cv=none; b=ZBGE8ird+zaOA4KQVdUWZfhWAI0kvvZ+NPoQJSMzkjh9GVEoe4tbdQzraP16WrEUTcL0CFeWO3zviT0JDPoCC562LjXRXUGp5uy0fhfIJNHhrs4cS+gLIRhSbS/VA4FDqk50TKra6TkDa79q7NUybhKmxFxjBjoJ/3jzAMNBDEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718954076; c=relaxed/simple;
	bh=I1d26+FYwmfD9Tc9dF0H8tsiQttz7MrvNQjmOX9mk7s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hMM0GFO/UdNzOwr5ZMfzZV9DUdI+fEexb+mMdSXHQelcBKsbVv8lYwlUyCcbXCcXxyRpsU8k+wzXmXvdr/0l61jVgJfLIg193Azc8nEt9w4HA+AZ8TejAoMLYdPBSCR0DX7Zu1/IR/0YgtJ9/45mrL585pxBssQu1kkEfWH01Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBd33DB/; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBd33DB/"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57a30dbdb7fso1818220a12.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 00:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718954073; x=1719558873; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I1d26+FYwmfD9Tc9dF0H8tsiQttz7MrvNQjmOX9mk7s=;
        b=cBd33DB/cICnPCRsR3owzI6DwAnHy8sHGxxjGo80ZoYlUGyYY1Y02GOboVQ835DqCb
         F6W8GDYQvMB3XvTbln9Bn93/M6vvCKsLY9LCQ2qu5Bou6AdXAXexbZuuk+aHZt1CbGMb
         CPzeePLS98NHJiBa9KGzp7iCLAaQxqX4TchJM9uLqz45FpJqJ/dUaspk6rUWUTKnBY5N
         zDAoBFdB4NnyKusi6fMcaMBDqEFbxOOgRkCxX6W/ey3pQwgVR33/0BgOPGAYxbg5twaP
         ItN8XvK8z61N6uEyTNB0KUPz1OhQhwv00YtLayvd0062yH4aXB61tvclQ3d9ZLp4mhH4
         JYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718954073; x=1719558873;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I1d26+FYwmfD9Tc9dF0H8tsiQttz7MrvNQjmOX9mk7s=;
        b=m+GUo2/nVhXRkCCKdc+e06TCvOiZ19cvMrblZBJmr2JWSxxy21WXHJA1qGJ7MXK+3x
         NqXajWg/X+AVRhhycla6eijduwTWg4I9GCOptBeguXRGXgkXaduU7Il3jrpqvnyMbrz9
         MZ6FVk3VEccqYqVsNgvydSyqiapzMk5qu12GxVIUiwTQ5gfjP6eTyI6v7MXzKL8/qQmC
         NiTIszQWsQdidgvj6aK86zXyKMGrvWS+euTbaLJX+jQKfZTMjXJS15b5t9xL6mk97rmO
         7qIv/3m0Qo2vamA4u3/kSvdQVy3rTIVr5Eww9L9xw7p18bGrsv3uahYTxiwl11bkczHx
         HHRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV6+LMJpGT93hgTyTzi8E8XMF90ape0ZmRNHJo9dYwQUjNtAPnIrJN2qvq2tpcLly3ItzcsaVhHAJjiBwFF43bVWCkOjX/OGHidCKFFw==
X-Gm-Message-State: AOJu0YzuDq04OSxOVIIJ9YsO3iTpgMm14TuOMfrnguCmcxaLF9iMiVYb
	UE7sGyMl+qBGGnsbj+AyGJJg81o0N8lzLqN5PjmtpmChPrCHkDAg
X-Google-Smtp-Source: AGHT+IHJQ1yPK263/uUvL42ye22QYzUxYEagwPu/zDgRslXQjOwm4KteKF6Tb6SaGoGeiBRNCTcVaA==
X-Received: by 2002:a50:c050:0:b0:57d:22ef:d055 with SMTP id 4fb4d7f45d1cf-57d22efd0e0mr2481140a12.24.1718954073269;
        Fri, 21 Jun 2024 00:14:33 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba? (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d305351dbsm527719a12.77.2024.06.21.00.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 00:14:32 -0700 (PDT)
Message-ID: <b7283f9458047e63e7d8c8b80daf2bd6232403cb.camel@gmail.com>
Subject: Re: [v11 3/7] iio: core: Add new DMABUF interface infrastructure
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, lkp@intel.com, Paul Cercueil
 <paul@crapouillou.net>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, 
 linux-iio@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter
 Clausen <lars@metafoo.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 oe-kbuild-all@lists.linux.dev,  LKML <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Julia Lawall
 <julia.lawall@inria.fr>, Randy Dunlap <rdunlap@infradead.org>
Date: Fri, 21 Jun 2024 09:18:23 +0200
In-Reply-To: <ZnUnFeum1Z2ahm9M@matsya>
References: <202406191014.9JAzwRV6-lkp@intel.com>
	 <c25aab0d-48f6-4754-b514-d6caf8d51fd1@web.de> <ZnRUSaHJhz7XLcKa@matsya>
	 <20240620170522.GU3029315@google.com> <ZnUnFeum1Z2ahm9M@matsya>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2024-06-21 at 12:39 +0530, Vinod Koul wrote:
> On 20-06-24, 18:05, Lee Jones wrote:
> > On Thu, 20 Jun 2024, Vinod Koul wrote:
> >=20
> > > On 20-06-24, 12:45, Markus Elfring wrote:
> > > > =E2=80=A6
> > > > > All errors (new ones prefixed by >>):
> > > > >=20
> > > > > > > drivers/iio/industrialio-buffer.c:1715:3: error: cannot jump =
from
> > > > > > > this goto statement to its label
> > > > > =C2=A0=C2=A0=C2=A0 1715 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_dmabuf_u=
nmap_attachment;
> > > > =E2=80=A6
> > > >=20
> > > > Which software design options would you like to try out next
> > > > so that such a questionable compilation error message will be avoid=
ed
> > > > finally?
> > >=20
> > > The one where all emails from Markus go to dev/null
> >=20
> > Play nice please.
>=20
> Would love to... but Markus has been repeat offender
>=20
> Sadly, I am yet to see a constructive approach or even better a helpful
> patch which improve something, rather than vague suggestions on the list
>=20

Yeah, just look at how many automatic replies he get's from Greg pretty muc=
h
saying to ignore his comments.

- Nuno S=C3=A1

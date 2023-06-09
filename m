Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A6B7498
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 07:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=PhSnm3a4vgOy5LTadhAze1xes6Zjvjn4mMhXbpeAuyQ=;
	t=1686297344; x=1687506944; b=Exp2qT5RzgFoTs3/JXcro80nP9N08MzYECuPFsusM+vk00M
	t9Cl5gSnF33qRIb+5Va1MKtWeuHyvSg01TV/FN9A2ipcdoojl7KrC1Sdoeq3QmVBuWpS0PpvbakyH
	dLGpQuSaMQSLICzQiTDWfZqwMveFmq/LQmktzvySzyVMT9fqoGsQL0cbd9YiVOQfd32DARiA+0eUq
	b6auo0mwO3qa8TXktukME5E4QMyOyqaGAo+dJhPu2ZkUzbKQRgyfg+nNlYkTFHVJ206SeuHe3EX70
	1+7iOEIrkkFBxLJofQidb7/Mr9UtBX4AEUR0C8bFiSgx3l4Ape9mdV0u3mS1fd6A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1q7Wy0-000quC-1A;
	Fri, 09 Jun 2023 09:55:28 +0200
Message-ID: <075e9d3d9c63f57dc5b9006b87c62ea1aef807c2.camel@sipsolutions.net>
Subject: Re: [linux-next:master 12780/13853]
 arch/um/drivers/harddog_user.c:6:10: fatal error: stdio.h: No such file or
 directory
From: Johannes Berg <johannes@sipsolutions.net>
To: "Liu, Yujie" <yujie.liu@intel.com>, Richard Weinberger <richard@nod.at>
Cc: lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	 <oe-kbuild-all@lists.linux.dev>, linux-mm <linux-mm@kvack.org>
Date: Fri, 09 Jun 2023 09:55:27 +0200
In-Reply-To: <ZIJ/vvquEQXN8NBf@yujie-X299>
References: <202304250419.YtCLtUhG-lkp@intel.com>
	 <280967570.292780.1682370047405.JavaMail.zimbra@nod.at>
	 <ZIJ/vvquEQXN8NBf@yujie-X299>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

Hi Yujie,

> > >=20
> > > > > arch/um/drivers/harddog_user.c:6:10: fatal error: stdio.h: No suc=
h file or
> > > > > directory
> > >       6 | #include <stdio.h>
> > >         |          ^~~~~~~~~
> > >   compilation terminated.
> >=20
> > Wild guess, is this a nolibc toolchain?
>=20
> The bot is using the gcc-11 provided by debian distribution, so we think
> it is not a "nolibc toolchain".
>=20
>     compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>=20
> We can reproduce it on commit fc54a4f15988, and its parent commit is
> clean. Please help give some guidance if anything wrong in our test
> flow. Thanks.
>=20

That was just a misinterpretation. The real issue was fixed by commit
73a23d771033 ("um: harddog: fix modular build").

johannes

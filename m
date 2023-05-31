Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCB81879
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 06:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=OMeS+07AgIwC67dUdNYRuvFtsnzkhUi03Dd3OAGMjZo=;
	t=1685515210; x=1686724810; b=M0nNu4gJv/bYfJaJBjJnDZkvbs67rkgHOXg3nwmz77hgJVF
	BuRphXWlWYeIWbMtS/QulkD0LEgN9Fxf8yMoRa4O2L3KnkomSkNS0khMAysPQsPHG8i2Hcm9mkdT/
	+oT3IuTXWhzYPipwtW1BVNdjEjEdVffTL9pQS6E6LWxBUhGr0EJxFU0nckHgUkLjpge37gQZYS9HB
	Mk2izR2APTm5VZNpQPCh4m3uh2qaUSHY3zjv+Diz2ZkMK+5ax3wNJzbzHDEtyjWd+5+viJEiKqrUr
	EWt3+25EDvxSmKWlcmKEXTPoQPVPCuRk5Cvq57grX90LRjBNPeJ9uNbOe/R142KA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1q4F9q-009CER-0i;
	Wed, 31 May 2023 08:18:06 +0200
Message-ID: <8033fb8f9677cf9aae411e97eb554d251ca03011.camel@sipsolutions.net>
Subject: Re: [PATCH] uml: Replace all non-returning strlcpy with strscpy
From: Johannes Berg <johannes@sipsolutions.net>
To: Kees Cook <kees@kernel.org>, kernel test robot <lkp@intel.com>, Azeem
	Shaikh <azeemshaikh38@gmail.com>, Maxim Krasnyansky <maxk@qti.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hardening@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Anton
 Ivanov <anton.ivanov@cambridgegreys.com>, linux-um@lists.infradead.org
Date: Wed, 31 May 2023 08:18:00 +0200
In-Reply-To: <09A0C6FA-669F-4B73-9620-43AEA17E5D0C@kernel.org>
References: <20230530164004.986750-1-azeemshaikh38@gmail.com>
	 <202305311135.zGMT1gYR-lkp@intel.com>
	 <09A0C6FA-669F-4B73-9620-43AEA17E5D0C@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned



> -		strlcpy(ifr.ifr_name, pri->dev_name,
> sizeof(ifr.ifr_name));
> +		strscpy(ifr.ifr_name, pri->dev_name,
> sizeof(ifr.ifr_name));
>=20

> >   arch/um/os-Linux/drivers/tuntap_user.c: In function 'tuntap_open':
> > > > arch/um/os-Linux/drivers/tuntap_user.c:149:17: error: implicit decl=
aration of function 'strscpy'; did you mean 'strncpy'? [-Werror=3Dimplicit-=
function-declaration]
> >     149 |                 strscpy(ifr.ifr_name, pri->dev_name, sizeof(i=
fr.ifr_name));
> >         |                 ^~~~~~~
> >         |                 strncpy
> >   cc1: some warnings being treated as errors
>=20
> Ah, yeah, this is another "not actually in the kernel" cases. Let's ignor=
e this strlcpy for now.
>=20

Well, strlcpy() isn't part of libc either, so all this would need is to
add it to user.h just like strlcpy() is now?

johannes

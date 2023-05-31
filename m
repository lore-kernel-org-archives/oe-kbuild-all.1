Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8AE2103
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 06:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E454A63CC10C;
	Wed, 31 May 2023 08:23:20 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id L1MW3AYx1K1h; Wed, 31 May 2023 08:23:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9E3CC616B2CF;
	Wed, 31 May 2023 08:23:20 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sVKUU-jUg0rd; Wed, 31 May 2023 08:23:20 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7EB866081100;
	Wed, 31 May 2023 08:23:20 +0200 (CEST)
Date: Wed, 31 May 2023 08:23:20 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Kees Cook <kees@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Maxim Krasnyansky <maxk@qti.qualcomm.com>, 
	oe-kbuild-all <oe-kbuild-all@lists.linux.dev>, 
	linux-hardening@vger.kernel.org, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	anton ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	linux-um <linux-um@lists.infradead.org>
Message-ID: <103925562.158061.1685514200368.JavaMail.zimbra@nod.at>
In-Reply-To: <09A0C6FA-669F-4B73-9620-43AEA17E5D0C@kernel.org>
References: <20230530164004.986750-1-azeemshaikh38@gmail.com> <202305311135.zGMT1gYR-lkp@intel.com> <09A0C6FA-669F-4B73-9620-43AEA17E5D0C@kernel.org>
Subject: Re: [PATCH] uml: Replace all non-returning strlcpy with strscpy
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Replace all non-returning strlcpy with strscpy
Thread-Index: /e3HVPBWZ39oPFmlPQoqSK9b5wqRFQ==

----- Urspr=C3=BCngliche Mail -----
>>>> arch/um/os-Linux/drivers/tuntap_user.c:149:17: error: implicit declara=
tion of
>>>> function 'strscpy'; did you mean 'strncpy'?
>>>> [-Werror=3Dimplicit-function-declaration]
>>     149 |                 strscpy(ifr.ifr_name, pri->dev_name,
>>     sizeof(ifr.ifr_name));
>>         |                 ^~~~~~~
>>         |                 strncpy
>>   cc1: some warnings being treated as errors
>=20
> Ah, yeah, this is another "not actually in the kernel" cases. Let's ignor=
e this
> strlcpy for now.

Well, actually it's another case of "not even compile tested". :-(

Thanks,
//richard

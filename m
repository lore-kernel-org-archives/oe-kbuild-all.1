Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235BE30DEB7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762424040; cv=none; b=XlrQwyCpfvH2RADraV2xdfqVY+nLrpjyiE8sr32xFv5/P2uMkLeu1mUIDHgc0HdHYs0DEJUhWQEj6Jn7PeT1dwmgtBELPchcVEfEbt4YTi93+8V1/kuH+kb61+fLZyupeYuS7F+LhrfxoxBC5t6U6jDWS8uTcRfxouh9nJ02ABw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762424040; c=relaxed/simple;
	bh=3g6OwqvUvgOuE0sVQ1tvj2/4v52gpeHEPrmCnel5VNw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iiFgQ8d2JrsVKtOvZl2Uql0wovO39k6wqiOyQ+4XlD0KMYILndzyHnme77bJrzwHG75FS9CqrJmQL4ac5GNIOyU16otrjfXBYYh3UCEDbbQrYF0MriYuD+IFvC770A1NIAVr3rTEnO9WesOoftyLHTKy3VPU4+S+ZQ588HYC7ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7J+hUZs; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7J+hUZs"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso817708b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 06 Nov 2025 02:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762424038; x=1763028838; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XVferEyN4+RzXvE7eehEmFRfQazqGQ49nTw3vZt6WP4=;
        b=Y7J+hUZsN2PPcyFOhmiTMM+9lWs+G3wZVaQiOdJViRW+X+xXZ+i6goHemQ7xOooV03
         VkSb7A70UTPmPrDXppKvwyJx4OgS6MfJ5l/iECQgbcfXpo/0fMX5Hxw5R83TeNanh4zd
         B5WH9I5sOLdsozhWWkX40b0qb1/jSg6R+iq2PrTZxCbe4aX0rWMf6vlJT9iC0nknJ1ii
         Jvlu2Lvp4EvLtH+/Jt4CcpZefCF87ySLDW5213GyroUgMFFvg8MHT2kHTKT+UmL5C16c
         NjDyGJCBTy+q1t4zawqQvdj7jHPhUYUbE7au/CFXsm6wK/F2ijVZfISCwbgsg9h3qv2g
         dEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762424038; x=1763028838;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVferEyN4+RzXvE7eehEmFRfQazqGQ49nTw3vZt6WP4=;
        b=l8An905auYpdFQF5vNeakztNuB/ewNW/Kz/ZLqMB3gXxanf4T5kHkTvQ1TSl+OVQ4u
         JuU2PoLwu5f1KyhBihEQJWcziNVtqzxQVrywiwI4WOdLP2LdZcXqdxO3N+SVtifdhjI9
         m7f4X6Exj+07suJp7bCtiNpWU0aEKIRcEq97O5x1U4+6tU5nrvTQrRTykrFH06WxokNB
         eG6WQKnmbzTAQtYAq3Td435fmtd8xyyaHQtpaO/aHsRkWE8FrosAPYxMpPWmpaQ84ZPz
         d/sI4B63q9CNmygImXLjnbsf1yLE3xpapSw9V5u4SAXjohZQgI9mTWo6wP2QBrqsXEn6
         b8Bw==
X-Gm-Message-State: AOJu0YyyBfVxcuHwKD9YzROqaSPt3yFabqkgnw73wNWyGfLPZlTWclIn
	m5gMRM/0H1/ULsp3V6oep9qyTBN7uo6AQyuCQMqtkMxXcSSgp/a7UMsH
X-Gm-Gg: ASbGncvmEAoAK7bdwk2nePYYoq3na8TBamqOfBpYr8OJ6wqbBJHy8gtHXblOWwdotlK
	Pmq6aK7pzhiz74mTBZ1JCmN3qw4hDWERaMS5y2i4S6uQO1Vuk57bthB1uW7ZXSdr5o5LCBilJ5E
	Czh3+8Bag0TinbCx9hBzffriVsPqol+Is/Wd9qi+Bk0DJIHgTRbomVTmmpVLwbX1RDgxZmsKZJK
	O/3yKZrrjS+upWSGyhGd7vtwuR4IYzNLBsoH7jlSpbvJTEOOUxKHE3RlxwDTUyvZgqPKmzTP24b
	TVrKz+pp3kHtGMF0EaSCb3EMAuNg8MT18DOzHv2VS3byU4+UHuQueVzv2fOPK6tCLpq3+XMtjp8
	ZzbROVg/vHmRy5athHSFW+9qJavkhdxKNtfOPHte+I3lg5ATMhHSimjqS8Kddjqbrc9eieIT7r0
	hNGgfvXSWy8xr1sCFHrDk6MYfD1bd6QkC35DfafZt+JL1bEYf+
X-Google-Smtp-Source: AGHT+IHFm4f4DIfuJZeWFWHECmS607MVUrzEbqxwY7bBNABCSqwm+nfFI94x/cfAN4hYxfUSU4FFIA==
X-Received: by 2002:a05:6a00:2e0d:b0:792:574d:b12 with SMTP id d2e1a72fcca58-7ae1d7350a5mr8116654b3a.10.1762424038444;
        Thu, 06 Nov 2025 02:13:58 -0800 (PST)
Received: from ?IPv6:2401:4900:88f4:f6c4:5041:b658:601d:5d75? ([2401:4900:88f4:f6c4:5041:b658:601d:5d75])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af825fbc63sm2270481b3a.49.2025.11.06.02.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 02:13:58 -0800 (PST)
Message-ID: <26b0845236aeeedae68b20765376e6acf3bb0e97.camel@gmail.com>
Subject: Re: [PATCH] net: ethernet: fix uninitialized pointers with free attr
From: ally heev <allyheev@gmail.com>
To: kernel test robot <lkp@intel.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>,  Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller"	 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski	 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "K. Y.
 Srinivasan"	 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu	 <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, Dan Carpenter <error27@gmail.com>
Date: Thu, 06 Nov 2025 15:43:49 +0530
In-Reply-To: <202511061627.TYBaNPrX-lkp@intel.com>
References: 
	<20251105-aheev-uninitialized-free-attr-net-ethernet-v1-1-f6ea84bbd750@gmail.com>
	 <202511061627.TYBaNPrX-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-11-06 at 17:06 +0800, kernel test robot wrote:
> Hi Ally,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on c9cfc122f03711a5124b4aafab3211cf4d35a2ac]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Ally-Heev/net-ethe=
rnet-fix-uninitialized-pointers-with-free-attr/20251105-192022
> base:   c9cfc122f03711a5124b4aafab3211cf4d35a2ac
> patch link:    https://lore.kernel.org/r/20251105-aheev-uninitialized-fre=
e-attr-net-ethernet-v1-1-f6ea84bbd750%40gmail.com
> patch subject: [PATCH] net: ethernet: fix uninitialized pointers with fre=
e attr
> config: x86_64-randconfig-015-20251106 (https://download.01.org/0day-ci/a=
rchive/20251106/202511061627.TYBaNPrX-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251106/202511061627.TYBaNPrX-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202511061627.TYBaNPrX-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    In file included from include/uapi/linux/posix_types.h:5,
>                     from include/uapi/linux/types.h:14,
>                     from include/linux/types.h:6,
>                     from include/linux/objtool_types.h:7,
>                     from include/linux/objtool.h:5,
>                     from arch/x86/include/asm/bug.h:7,
>                     from include/linux/bug.h:5,
>                     from include/linux/vfsdebug.h:5,
>                     from include/linux/fs.h:5,
>                     from include/linux/debugfs.h:15,
>                     from drivers/net/ethernet/microsoft/mana/gdma_main.c:=
4:
>    drivers/net/ethernet/microsoft/mana/gdma_main.c: In function 'irq_setu=
p':
> > > include/linux/stddef.h:8:14: error: invalid initializer
>        8 | #define NULL ((void *)0)
>          |              ^
>    drivers/net/ethernet/microsoft/mana/gdma_main.c:1508:55: note: in expa=
nsion of macro 'NULL'
>     1508 |         cpumask_var_t cpus __free(free_cpumask_var) =3D NULL;
>          |                                                       ^~~~
>=20
>=20
> vim +8 include/linux/stddef.h
>=20
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  6 =20
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
> ^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
> 6e218287432472 Richard Knutsson 2006-09-30  9 =20

Sorry. I think I messed up config somehow during build. Hence, couldn't
catch the error in local. Fixed in v2

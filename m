Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFDC4315F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 05:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718776672; cv=none; b=rdTGkjbvj96hubgIFFcOG/mWtT+VhBQm2D3x/RC39YOB69tBZ7R804rlTRv5lqlF+8urpb9XuetFexAa8BHXazLlXP7i5rUSX6SlHh3FTEzhD8YYS9iWKoeEf4Wf7hfRn08WLgewKfv+vEYEUWWeodaWlLQu6ELvM9lNQy5/+fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718776672; c=relaxed/simple;
	bh=scEJE+FtrAipbWWuCOlW7sNdiWYp1YNxGU1Wofz9Sk0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZscjgEWsjofrkBsZmnEqG1Dsij2J2fvT6NmGepWp/gaqQ1uiOdGwyDMKQFhETyGGLnL6yiTVcJtxG7AUJS3JpM76u9zRzmibSJdW93ffUyHjCPssYX5iHi2Rk6Or48losKKZL8Aswq1E0k2pFx57ptr3WeGOfLTJ8iJmUXuxNmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUK/Fg7s; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUK/Fg7s"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4217d808034so54842535e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 22:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718776669; x=1719381469; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=scEJE+FtrAipbWWuCOlW7sNdiWYp1YNxGU1Wofz9Sk0=;
        b=gUK/Fg7szhtt7YoeaunoYRl2AS0Hb8k22dXeTDTLXQoqbFvDYqX6RHOk1djrpXBr0T
         mP4E8Rb5ayUsU1X0cmJFaBUOzlsKSik8bPWzSCmRPRUKxKcVguvr2S1RrgE1mqh+o7N8
         iQq73s30HSj+bn0VvEiH8axVz8olcnApLgApkGCU6gGZ676gOxGN7hzrH/jX7XVe4MM/
         Ty5ZGTF9ROseuPnElvYGzJw6N3xk/GwKywnrie/tm5Sg1H8sY6KUmZdQ1BR21XZiYa9T
         KvCzEenDRKmxXCyE4MrsIwaGUR1igErU8Rije1N28Z13yS2UBAiWSQh6gGPKI++UUYUF
         xBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718776669; x=1719381469;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=scEJE+FtrAipbWWuCOlW7sNdiWYp1YNxGU1Wofz9Sk0=;
        b=jV2JuQh/45RBs4ELniCXrpfX7UWJYiIdbazhHhf26Dttbw+t8qS4R511pYj107+PJt
         XYvLoJnbIuDGZI7BHMXtXBUvpYUnmWUZEzxP4p6GfEj6jNz097NNT7YWd1HlmMaRn1Vr
         zOF75TEKlVVMcL0gTGXOPOBuJ1GLs4yx+FLHGt3CkEitAdBVfyTcjjPkXkfnYMpD9J3T
         Ust8MqGUr8zO0I9OPtP1GgeCluRo3GH8lOukKiouJGm1+lfCVqXUTCWsJAFqlNb20JMq
         HAouTAUYjce8cSe7zpQOy5yYWuYaWTB556qZFMczoMwqGEbRN9H4/qZf//CUPySZrdpm
         dODQ==
X-Gm-Message-State: AOJu0YxJBCM/ugk5WwzL5TF6S8Sgfm72sZOjkKPaKJ5TUCXA3RZjz7W6
	LuBKsyi6xmjDsGx78DtR4dPTw2qJOqhaDMk4ofMWPOIjitaXRUvu
X-Google-Smtp-Source: AGHT+IGUWmG2ozlLnkr7/lTelYMt1DNSd/pixvzBkdl27mVAYbqX6fLVIuUMu0W+3eqBG/aY2Mqy9w==
X-Received: by 2002:a05:600c:1c98:b0:423:791:f446 with SMTP id 5b1f17b1804b1-4247507a087mr9346335e9.7.1718776668365;
        Tue, 18 Jun 2024 22:57:48 -0700 (PDT)
Received: from nsa.fritz.box ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de68asm254670625e9.29.2024.06.18.22.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 22:57:48 -0700 (PDT)
Message-ID: <7b20ed6c17fc7e7a023eb2d305ee699a81a2a2ce.camel@gmail.com>
Subject: Re: [PATCH v11 3/7] iio: core: Add new DMABUF interface
 infrastructure
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: kernel test robot <lkp@intel.com>, Paul Cercueil <paul@crapouillou.net>,
  Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Vinod Koul <vkoul@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Nuno Sa
 <nuno.sa@analog.com>, linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
Date: Wed, 19 Jun 2024 07:57:47 +0200
In-Reply-To: <202406191014.9JAzwRV6-lkp@intel.com>
References: <20240618100302.72886-4-paul@crapouillou.net>
	 <202406191014.9JAzwRV6-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2024-06-19 at 11:15 +0800, kernel test robot wrote:
> Hi Paul,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on jic23-iio/togreg]
> [also build test ERROR on vkoul-dmaengine/next linus/master v6.10-rc4 nex=
t-
> 20240618]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/dmaengine-Ad=
d-API-function-dmaengine_prep_peripheral_dma_vec/20240618-180602
> base:=C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/jic23/i=
io.git=C2=A0togreg
> patch link:=C2=A0=C2=A0=C2=A0
> https://lore.kernel.org/r/20240618100302.72886-4-paul%40crapouillou.net
> patch subject: [PATCH v11 3/7] iio: core: Add new DMABUF interface infras=
tructure
> config: x86_64-randconfig-161-20240619
> (https://download.01.org/0day-ci/archive/20240619/202406191014.9JAzwRV6-l=
kp@intel.c
> om/config)
> compiler: clang version 18.1.5
> (https://github.com/llvm/llvm-project=C2=A0617a15a9eac96088ae5e9134248d82=
36e34b91b1)
> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-ci/archive/20240619/202406191014.9JAzwRV6-l=
kp@intel.c
> om/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-kbuild-all/202406191014.9JAzwRV6-lkp@intel.c=
om/
>=20
> All errors (new ones prefixed by >>):
>=20
> > > drivers/iio/industrialio-buffer.c:1715:3: error: cannot jump from thi=
s goto
> > > statement to its label
> =C2=A0=C2=A0=C2=A0 1715 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_dmabuf_unmap_atta=
chment;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ^
> =C2=A0=C2=A0 drivers/iio/industrialio-buffer.c:1720:2: note: jump bypasse=
s initialization of

I guess the compiler produces code that will run the cleanup function on an
uninitialized variable. I would then go back to plain mutex() instead of mo=
ving
guard() to a place where it does not make sense only to shut up the warning=
s.

- Nuno S=C3=A1



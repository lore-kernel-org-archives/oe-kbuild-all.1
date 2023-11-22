Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098ED5786B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 16:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Z1fdnTRr"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-daf4f0e3a0fso6812402276.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 08:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1700669402; x=1701274202; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdCGHGbzdbeaCYIJr9v4FCuZAi+3Ly0kgJz+OuU3/qE=;
        b=Z1fdnTRrxd3rF+X8RWI265YZtCic1oZgzr4d7hqIYC0rJc54Xip+qxxs30MN4nuDUO
         YPDvGUsDo6fjoLWA2diAgYCELavsfQzbGriI40E3dnLWIrj1Eu0GacRhu8qzysRkJ/bB
         KOfs/hVBrBW5aZ1ORM5V/WD4oXqoar1XpQAC8QgFIAU2D+vT3OlHzeziVuSGaD81nG9C
         40ftleh2IInPlQ5+m7ZokWTKX0Y7J0CLFQqBDEDfEpJyPePeoL55nOypdqmmgTF9sQf9
         E9XBE5UsuvhzUgOq8KDepRj2L3Rr2ZOGTXCAx44PZA9AcwaLFz1Q7OV5DoUUUqhVLSoN
         3LrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700669402; x=1701274202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdCGHGbzdbeaCYIJr9v4FCuZAi+3Ly0kgJz+OuU3/qE=;
        b=WitLi8c1orkwNy8AVzkcubah9faPZwQ6NFYTlspMIplp0wNjFVU4KXDg3M4Iu54ut1
         b89N/ojp3ItLKaCFhif2XPkYmVi0GqoTHxpkWTHu7YoAi9powcGJovtlXa6fUUTJj96p
         HyuO/6HXTp4XitQu374ROIF5OC+wD21G29RFyfOdTEsBTNWEkmRfttWs9o+irGA35x8p
         YZuakPIEDJ32SU53Ecz+Fk40t1Q5H0cwaq0vLaSMbUC3h5AtNIg7VZJhKz0E/hAGn0nS
         5v74A0iKfWar5Ikd6B0EYtK9MqXhz7KiDdPcElhMwZ2Ul2X6+Ij8jtP91rUMlElicy5k
         4wlQ==
X-Gm-Message-State: AOJu0Yy02jci5zrkG4kZX//ciT7b5rTnhdk8rYdC2UEQhmsgMn1YuJSz
	UCSO22GJJSk3F2F4rF9obHMfPYRAEydhQlZtdCfJ
X-Google-Smtp-Source: AGHT+IFZHnLHtkR/4LAcEVO6IHNfOs3NmopA5dFIkVuvNFNOUNH49hCmmHZpOXOtHn2IgEXm/4E3XkhYff4BoTL1oXI=
X-Received: by 2002:a25:6645:0:b0:db0:33fe:4125 with SMTP id
 z5-20020a256645000000b00db033fe4125mr2616337ybm.57.1700669401902; Wed, 22 Nov
 2023 08:10:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311221047.a9Dww3vY-lkp@intel.com>
In-Reply-To: <202311221047.a9Dww3vY-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Nov 2023 11:09:51 -0500
Message-ID: <CAHC9VhQk=HP-tSxpmx=1ZaYWjjJoYt92_A7kJmZfUFyKkDoSPQ@mail.gmail.com>
Subject: Re: [pcmoore-lsm:next 12/23] lsm_list_modules_test.c:104:22: error:
 'LSM_ID_IMA' undeclared; did you mean 'LSM_ID_YAMA'?
To: kernel test robot <yujie.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Roberto Sassu <roberto.sassu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 12:37=E2=80=AFAM kernel test robot <yujie.liu@intel=
.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git n=
ext
> head:   afe576a62062cf944372fff2b6510b621ec454f2
> commit: edd71f8e266c7ba15eedfec338864e53ddde1c25 [12/23] lsm: drop LSM_ID=
_IMA
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231122/202311221047.a9Dww3vY-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Closes: https://lore.kernel.org/r/202311221047.a9Dww3vY-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    lsm_list_modules_test.c: In function 'correct_lsm_list_modules':
> >> lsm_list_modules_test.c:104:22: error: 'LSM_ID_IMA' undeclared (first =
use in this function); did you mean 'LSM_ID_YAMA'?
>      104 |                 case LSM_ID_IMA:
>          |                      ^~~~~~~~~~
>          |                      LSM_ID_YAMA
>    lsm_list_modules_test.c:104:22: note: each undeclared identifier is re=
ported only once for each function it appears in

I just posted a patch for this, lore link below:

https://lore.kernel.org/linux-security-module/20231122160742.109270-2-paul@=
paul-moore.com

--=20
paul-moore.com

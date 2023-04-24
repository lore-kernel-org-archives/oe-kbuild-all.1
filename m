Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A08263C5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 21:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2C3CB60A0E1E;
	Mon, 24 Apr 2023 23:00:48 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ugwIf7tcA6fT; Mon, 24 Apr 2023 23:00:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B4FC364551DE;
	Mon, 24 Apr 2023 23:00:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id g-K51Ih_btys; Mon, 24 Apr 2023 23:00:47 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 90197609B3C0;
	Mon, 24 Apr 2023 23:00:47 +0200 (CEST)
Date: Mon, 24 Apr 2023 23:00:47 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: kernel test robot <lkp@intel.com>
Cc: Johannes Berg <johannes.berg@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-mm <linux-mm@kvack.org>
Message-ID: <280967570.292780.1682370047405.JavaMail.zimbra@nod.at>
In-Reply-To: <202304250419.YtCLtUhG-lkp@intel.com>
References: <202304250419.YtCLtUhG-lkp@intel.com>
Subject: Re: [linux-next:master 12780/13853]
 arch/um/drivers/harddog_user.c:6:10: fatal error: stdio.h: No such file or
 directory
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
Thread-Topic: arch/um/drivers/harddog_user.c:6:10: fatal error: stdio.h: No such file or directory
Thread-Index: uHpcqendf6kv+PgcUOBNum0LyemTcA==

----- Urspr=C3=BCngliche Mail -----
> Von: "kernel test robot" <lkp@intel.com>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
> master
> head:   3b85b9b39960c08f29fa91b8d984d055dde6017e
> commit: fc54a4f15988e228cf88f888483e985c5f35031e [12780/13853] um: preven=
t user
> code in modules
> config: um-allmodconfig
> (https://download.01.org/0day-ci/archive/20230425/202304250419.YtCLtUhG-l=
kp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=3D1 build):
>        #
>        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.gi=
t/commit/?id=3Dfc54a4f15988e228cf88f888483e985c5f35031e
>        git remote add linux-next
>        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.gi=
t
>        git fetch --no-tags linux-next master
>        git checkout fc54a4f15988e228cf88f888483e985c5f35031e
>        # save the config file
>        mkdir build_dir && cp config build_dir/.config
>        make W=3D1 O=3Dbuild_dir ARCH=3Dum olddefconfig
>        make W=3D1 O=3Dbuild_dir ARCH=3Dum SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag where applicable
>| Reported-by: kernel test robot <lkp@intel.com>
>| Link: https://lore.kernel.org/oe-kbuild-all/202304250419.YtCLtUhG-lkp@in=
tel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>>> arch/um/drivers/harddog_user.c:6:10: fatal error: stdio.h: No such file=
 or
>>> directory
>       6 | #include <stdio.h>
>         |          ^~~~~~~~~
>   compilation terminated.

Wild guess, is this a nolibc toolchain?

Thanks,
//richard

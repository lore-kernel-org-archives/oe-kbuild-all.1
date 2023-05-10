Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7713262F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 06:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C00F061B8B4D;
	Wed, 10 May 2023 07:54:57 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id n_S4LQIz-Mly; Wed, 10 May 2023 07:54:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 35D8661CECF8;
	Wed, 10 May 2023 07:54:57 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vpLgkkUi-oWy; Wed, 10 May 2023 07:54:57 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0EF94615C9F5;
	Wed, 10 May 2023 07:54:57 +0200 (CEST)
Date: Wed, 10 May 2023 07:54:56 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: kernel test robot <lkp@intel.com>
Cc: Johannes Berg <johannes.berg@intel.com>, 
	oe-kbuild-all <oe-kbuild-all@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <997268184.9271684.1683698096971.JavaMail.zimbra@nod.at>
In-Reply-To: <202305100640.HGwVAUIt-lkp@intel.com>
References: <202305100640.HGwVAUIt-lkp@intel.com>
Subject: Re: arch/um/drivers/harddog_user.c:6:10: fatal error: stdio.h: No
 such file or directory
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
Thread-Index: /HP02hVwBMcXLMWFmev9z/iN8nuRpg==

----- Urspr=C3=BCngliche Mail -----
> Von: "kernel test robot" <lkp@intel.com>
> FYI, the error/warning still remains.
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t
> master
> head:   16a8829130ca22666ac6236178a6233208d425c3
> commit: fc54a4f15988e228cf88f888483e985c5f35031e um: prevent user code in
> modules
> date:   3 weeks ago
> config: um-allmodconfig
> (https://download.01.org/0day-ci/archive/20230510/202305100640.HGwVAUIt-l=
kp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=3D1 build):

The fix is already in linux-next. PR will follow shortly.

Thanks,
//richard

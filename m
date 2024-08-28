Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B1C1A2C20
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 15:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724860298; cv=none; b=VMrb6lCxZaitjlRYMKWpLN6u3jWg5GaAU9ssEqltXrvHXdcBTpQa88KEISuzLeaK9AXpizw1fmI0sblhE1PrWGWPefeEdGtH52xpr8AXCNnn06mjkK5Le36liwqZAu3sKikKtSdsKSjUG5YyL4Q0egnWXemnunUelxivb+RswtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724860298; c=relaxed/simple;
	bh=OFFj1NEy5g3i6vGCQ/1G2WW7fCe1HDsr1xX6gfPYgSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rBKTakpraiTSGJO/e9mJMMh69yfnqo32n1r2cd9HdIz5I3a26xgzcgHePnmelUEGPgo+1z+ucauj+ve0YXhf3uYz8QqfF/oqvFE8YWSQ9z+dVtNB9JMAjc3Etcwp6/GnV8zOpDaKxlIyFoy/EGAYIuGjBu4u19zDr0zZH396gBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhHIPBov; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhHIPBov"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4567edb7dceso220611cf.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 08:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724860294; x=1725465094; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7ms7TuhcUGP2Kd6Iyh+E63IDbeeFTrHgWyCubmUSMg=;
        b=IhHIPBovv7DpB/5lmGGhvaRV0IXP19clWQYl1URy9/B5XGgu7LEceE9krffq7mRirU
         29lN2BMD1MnC1UE9HXRKhrnQLR7H8QbusEU0NQfAcoCIeOzzlCf9Ho5D2lpXzkj7ftuX
         omenctlSvy5iRmsovlOoVfi1znA2/suX3tMmrrykYXUmjKHSvi7yExDhAwz8eXTUhPbB
         J24cx7/lanveguWtVWOukEfWIbbUplPLr5iU+Ipzqy4BvWBTfpNzRW9n8bLCIEusZawD
         cErav8kuB/Odb27PNk2UpqOCat2hx1knoj3XbaRxF1KxFZbIjMl5egsChDxGaPPrC/7j
         2o7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724860294; x=1725465094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7ms7TuhcUGP2Kd6Iyh+E63IDbeeFTrHgWyCubmUSMg=;
        b=MCZWU+1via89yna3yGMG7Z72IooIi2xAnSd5CYFRooHFG5/inlBOcfZn+8zGpdqVuD
         vhmrcuSI7bLTavP2kSlIx65TOuTF78rNcCH/wWswZxqfUeZKBT8lec/RJVr6K7OsQ3Ok
         gc3yDO6KD4ZU6WcTuFGvP3cNxZ6y/oCneZxgKtl+TiADMsvpbU7ax5Oe4EuLfH6wGxEL
         df2CsAjTtyhhJnRdTnyi4aMiR7ljqqpgkLukPOYqHnTZy8OZoitlrudieSUmoUHpws0K
         m8tUTlYaLB6TrU2jyfhEj/sJvK8XqFdE93Ie+YizyJkkKtTYnWrmp/8RSKRQ+SHtrd9n
         +QFA==
X-Forwarded-Encrypted: i=1; AJvYcCUh94vgkZCH66O4ygMIAnj1jnGiQloBdyWmIWasxZgXcAdjtB9iWbwqauAMdan0FUQnXyagn2ETF6ciyqTJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9kxCCs6KKR1cc5gUjYO1wZLSKcHQ76Z2lLJIZjOTdeGFOQJHg
	vUNl1d+PSRbFY3h90HxAS0z9HfxWDmN0OCVqOgTYqTKOP96OeRskU7U49js5K1wLXtCG3/MhTF7
	Yns9/TqLlE/w4GlMyOinfm047zNc=
X-Google-Smtp-Source: AGHT+IEGoKWC4F/OJCQkBY+n2LoGZU9WkWOA8kAbisIXzU03+K4zrmT76a+W6VlyWt3PPU/6qDA5iMrh5CsysucEsn4=
X-Received: by 2002:a05:622a:17ca:b0:450:3eb:cb30 with SMTP id
 d75a77b69052e-4566e6a81f2mr27575271cf.42.1724860293793; Wed, 28 Aug 2024
 08:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240826203234.4079338-3-joannelkoong@gmail.com> <202408280419.yuu33o7t-lkp@intel.com>
In-Reply-To: <202408280419.yuu33o7t-lkp@intel.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 28 Aug 2024 08:51:22 -0700
Message-ID: <CAJnrk1Y3piNWm3482N1QcasAmmUMYk1KkoO9TyupaJDBM8jW9A@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] fuse: add default_request_timeout and
 max_request_timeout sysctls
To: kernel test robot <lkp@intel.com>
Cc: miklos@szeredi.hu, linux-fsdevel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, josef@toxicpanda.com, 
	bernd.schubert@fastmail.fm, jefflexu@linux.alibaba.com, laoar.shao@gmail.com, 
	kernel-team@meta.com, Bernd Schubert <bschubert@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 2:52=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Joanne,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on mszeredi-fuse/for-next]
> [also build test ERROR on linus/master v6.11-rc5 next-20240827]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Joanne-Koong/fuse-=
add-optional-kernel-enforced-timeout-for-requests/20240827-043354
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git=
 for-next
> patch link:    https://lore.kernel.org/r/20240826203234.4079338-3-joannel=
koong%40gmail.com
> patch subject: [PATCH v5 2/2] fuse: add default_request_timeout and max_r=
equest_timeout sysctls
> config: arc-randconfig-002-20240827 (https://download.01.org/0day-ci/arch=
ive/20240828/202408280419.yuu33o7t-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240828/202408280419.yuu33o7t-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408280419.yuu33o7t-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> fs/fuse/sysctl.c:30:5: error: redefinition of 'fuse_sysctl_register'
>       30 | int fuse_sysctl_register(void)
>          |     ^~~~~~~~~~~~~~~~~~~~
>    In file included from fs/fuse/sysctl.c:9:
>    fs/fuse/fuse_i.h:1495:19: note: previous definition of 'fuse_sysctl_re=
gister' with type 'int(void)'
>     1495 | static inline int fuse_sysctl_register(void) { return 0; }
>          |                   ^~~~~~~~~~~~~~~~~~~~
> >> fs/fuse/sysctl.c:38:6: error: redefinition of 'fuse_sysctl_unregister'
>       38 | void fuse_sysctl_unregister(void)
>          |      ^~~~~~~~~~~~~~~~~~~~~~
>    fs/fuse/fuse_i.h:1496:20: note: previous definition of 'fuse_sysctl_un=
register' with type 'void(void)'
>     1496 | static inline void fuse_sysctl_unregister(void) { return; }
>          |                    ^~~~~~~~~~~~~~~~~~~~~~
>

I see. In the Makefile, the sysctl.o needs to be gated by CONFIG_SYSCTL
eg
fuse-$(CONFIG_SYSCTL) +=3D sysctl.o

I'll wait a bit to see if there are more comments on this patchset
before submitting v6.

>
> vim +/fuse_sysctl_register +30 fs/fuse/sysctl.c
>
>     29
>   > 30  int fuse_sysctl_register(void)
>     31  {
>     32          fuse_table_header =3D register_sysctl("fs/fuse", fuse_sys=
ctl_table);
>     33          if (!fuse_table_header)
>     34                  return -ENOMEM;
>     35          return 0;
>     36  }
>     37
>   > 38  void fuse_sysctl_unregister(void)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

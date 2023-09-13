Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D527200CB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 22:19:04 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-59bbed7353aso5508567b3.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 15:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1694643543; x=1695248343; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pve2evvQG8Wu6dcM6eIRAvQq/3oe/203mcy+b19gA8=;
        b=Y7N3n2zkkK4BHbLGpRAzwQk8KFR6Z9zNgov5tnHdLohweaAS2pj3leANe96wGqYhUf
         ETFpL945HhUmZ5oyD8f42919yE7RJBpqjEkUHGtdH/T1Q2ruQHS/4TVibkic0pGUp6L2
         whWr9Pk6CaWYRkmU6KgBh0phnajy7I7sqlQ1anfFzgv/slntsGTeO/duJKo/okbYk+zw
         Sx31DnOTi8w6h1+rg/MyEq6e4t2nqVMYo7XSm7sy5/F5+ug9nGQfnTf+ef0YDhGmCosI
         L8dsMdsheSb94mcJyHZkJ4VnnZpK+B2QIB6JFtSMuEUUiRGqW8goEefxt/YdkYN69ZLd
         xnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694643543; x=1695248343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pve2evvQG8Wu6dcM6eIRAvQq/3oe/203mcy+b19gA8=;
        b=aFprJM5QMKGFWMiEddp8Mm/Zqip/4knW5w9XGcBbzA/Qc5GTh3whd/ZMAzOn+eFM1Y
         7E0E1lWCtgqPm4UeBDwekA7cOByBQHLFhAMk0uL8XvLc0seKTGaPJjFC4TLGNRL3SMW8
         EONGL3EUFYYFWn3a7P3J1JIp153BT9WYa+wYp2JUE2/UpF1UQis+D1TXNOysfTe7cL18
         EZAtbOfIxtknpwdWVxDbPpwh7PcaUA0lIlKsOYBImZPBG67kO8VqIi+7K8G8iEfgbJnb
         zJZHnT1bnR4Rgsu8f4Qu0CIyvjKNmPWtDnla5jy1/SrqCKL1MyVAdfC98gUCZsEWQfV+
         ZOZg==
X-Gm-Message-State: AOJu0YwVx/HA8oOCihWC0n6ZBm/Y/OGMCZCHL4QgrPQcUMAGUujDpzs5
	PbW0mN+B8cQhq/38DnxyMuIVYIAJG7Q4C5VceC4x
X-Google-Smtp-Source: AGHT+IHd6f6RECjVcqmCL7A7894346dihNwE1aPIds0EMQzgoG2VHb2Uwc+wEHwTPX1DhNcQCvdHYBRnbGkUN+jxvow=
X-Received: by 2002:a81:91d3:0:b0:59b:52c2:5f15 with SMTP id
 i202-20020a8191d3000000b0059b52c25f15mr19342ywg.25.1694643543316; Wed, 13 Sep
 2023 15:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZOXG/VVC1XRc7TtI@gmail.com> <202308240128.Gsn0b0Fv-lkp@intel.com>
In-Reply-To: <202308240128.Gsn0b0Fv-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 13 Sep 2023 18:18:52 -0400
Message-ID: <CAHC9VhS2Smf9V0xJoBeuVfpMP2fhUnn8za_rLzJCmLB_-wBVLA@mail.gmail.com>
Subject: Re: [PATCH] lsm: constify 'mnt_opts' parameter in security_free_mnt_opts()
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, 
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, ztarkhani@microsoft.com, 
	alison.schofield@intel.com, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 1:22=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Khadija,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on pcmoore-selinux/next]
> [also build test ERROR on pcmoore-audit/next linus/master v6.5-rc7 next-2=
0230823]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Khadija-Kamran/lsm=
-constify-mnt_opts-parameter-in-security_free_mnt_opts/20230823-170310
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.g=
it next
> patch link:    https://lore.kernel.org/r/ZOXG%2FVVC1XRc7TtI%40gmail.com
> patch subject: [PATCH] lsm: constify 'mnt_opts' parameter in security_fre=
e_mnt_opts()
> config: riscv-randconfig-001-20230823 (https://download.01.org/0day-ci/ar=
chive/20230824/202308240128.Gsn0b0Fv-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git =
f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240128=
.Gsn0b0Fv-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308240128.Gsn0b0Fv-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> fs/btrfs/super.c:1523:25: error: passing 'void **' to parameter of typ=
e 'const void **' discards qualifiers in nested pointer types [-Werror,-Win=
compatible-pointer-types-discards-qualifiers]
>            security_free_mnt_opts(&new_sec_opts);
>                                   ^~~~~~~~~~~~~
>    include/linux/security.h:301:42: note: passing argument to parameter '=
mnt_opts' here
>    void security_free_mnt_opts(const void **mnt_opts);
>                                             ^
>    fs/btrfs/super.c:1536:25: error: passing 'void **' to parameter of typ=
e 'const void **' discards qualifiers in nested pointer types [-Werror,-Win=
compatible-pointer-types-discards-qualifiers]
>            security_free_mnt_opts(&new_sec_opts);
>                                   ^~~~~~~~~~~~~
>    include/linux/security.h:301:42: note: passing argument to parameter '=
mnt_opts' here
>    void security_free_mnt_opts(const void **mnt_opts);
>                                             ^
>    fs/btrfs/super.c:1699:26: error: passing 'void **' to parameter of typ=
e 'const void **' discards qualifiers in nested pointer types [-Werror,-Win=
compatible-pointer-types-discards-qualifiers]
>                    security_free_mnt_opts(&new_sec_opts);
>                                           ^~~~~~~~~~~~~
>    include/linux/security.h:301:42: note: passing argument to parameter '=
mnt_opts' here
>    void security_free_mnt_opts(const void **mnt_opts);
>                                             ^
>    3 errors generated.

Hi Khadija, can you check to see if these errors can be resolved?

--=20
paul-moore.com

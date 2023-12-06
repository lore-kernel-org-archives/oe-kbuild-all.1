Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91D636B13
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swlNULzY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78321C433C9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 13:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701868339;
	bh=YMczTZ+eUHFpccAjn65QXRp1IZ9uvtp9OipJcjA7ks8=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=swlNULzYsqzQaBP6v8T8CZvUmNSO9mfmulVwCAc0L60wcQtZqYWxvC2unGzPWaga/
	 pCAPN/GRAnEqGpiMMBnFjHB7r6g6huX4iffcsLpOmsdXVjct33LJzvEohdG087MQru
	 Qng7r+Kkwz2tofyjKzsO7e1tlbGv4v3fkNii3dqJyxY/t1How+StD+6O3rpB4bCLsq
	 NiEyA2ogUWBZRvZBn/bfoKPb9Eo1RUow+N4gp5Pq3qtOZ/xIzgL1SaUAmklIQ0d96K
	 rRmFuWETHBnjFJHW+ZfJ2+4qWXFnoV+KfanBnkUkIlX1nuTZrHuxkOv9Jv9dL0hlxr
	 90yotU2Z2ft6g==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-58d12b53293so4496297eaf.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 06 Dec 2023 05:12:19 -0800 (PST)
X-Gm-Message-State: AOJu0Yy+gtFlT+L5QFDNI5nJW+rZYfkXQ3g0Q5/4eV9cdntXJ2FZBuk6
	1ODCkJHMVbBeBFX6qUatmtUif9iQOsje1clXtPg=
X-Google-Smtp-Source: AGHT+IEmRqk6MZ5qlyfC7AYFjdyXPzo05A6Ci3sLCzJ/2SOoM/xtJT2VnOddkAA2JMOFUKVaAivA7y4ghrx25ZyYqHs=
X-Received: by 2002:a05:6870:2b10:b0:1fb:75a:6d41 with SMTP id
 ld16-20020a0568702b1000b001fb075a6d41mr931052oab.104.1701868338730; Wed, 06
 Dec 2023 05:12:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ac9:5a85:0:b0:507:5de0:116e with HTTP; Wed, 6 Dec 2023
 05:12:17 -0800 (PST)
In-Reply-To: <202312062020.FbeMXJCT-lkp@intel.com>
References: <20231204134509.11413-5-linkinjeon@kernel.org> <202312062020.FbeMXJCT-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 6 Dec 2023 22:12:17 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-jT8TaB0JoQ3+O9ZHSjsnYNxXDrK3MkW5Mv8ODiEqbuQ@mail.gmail.com>
Message-ID: <CAKYAXd-jT8TaB0JoQ3+O9ZHSjsnYNxXDrK3MkW5Mv8ODiEqbuQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] ksmbd: lazy v2 lease break on smb2_write()
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

2023-12-06 21:41 GMT+09:00, kernel test robot <lkp@intel.com>:
> Hi Namjae,
Hi kernel test robot,

Thanks for your report, I have already fixed it and applied it to
#ksmbd-for-next-next.

>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on cifs/for-next]
> [also build test WARNING on linus/master v6.7-rc4 next-20231206]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:
> https://github.com/intel-lab-lkp/linux/commits/Namjae-Jeon/ksmbd-set-v2-lease-capability/20231204-214847
> base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> patch link:
> https://lore.kernel.org/r/20231204134509.11413-5-linkinjeon%40kernel.org
> patch subject: [PATCH 5/7] ksmbd: lazy v2 lease break on smb2_write()
> config: parisc-randconfig-r122-20231206
> (https://download.01.org/0day-ci/archive/20231206/202312062020.FbeMXJCT-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 13.2.0
> reproduce:
> (https://download.01.org/0day-ci/archive/20231206/202312062020.FbeMXJCT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version
> of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> https://lore.kernel.org/oe-kbuild-all/202312062020.FbeMXJCT-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    fs/smb/server/oplock.c: note: in included file (through
> include/linux/dcache.h, include/linux/unicode.h, fs/smb/server/unicode.h,
> ...):
>    include/linux/list.h:83:21: sparse: sparse: self-comparison always
> evaluates to true
>    include/linux/list.h:83:21: sparse: sparse: self-comparison always
> evaluates to true
>    include/linux/list.h:83:21: sparse: sparse: self-comparison always
> evaluates to true
>>> fs/smb/server/oplock.c:1120:16: sparse: sparse: dereference of noderef
>>> expression
>    fs/smb/server/oplock.c:1120:42: sparse: sparse: dereference of noderef
> expression
>    include/linux/list.h:83:21: sparse: sparse: self-comparison always
> evaluates to true
>    include/linux/list.h:83:21: sparse: sparse: self-comparison always
> evaluates to true
>
> vim +1120 fs/smb/server/oplock.c
>
>   1114	
>   1115	void smb_lazy_parent_lease_break_close(struct ksmbd_file *fp)
>   1116	{
>   1117		struct oplock_info *opinfo;
>   1118		struct ksmbd_inode *p_ci = NULL;
>   1119	
>> 1120		if (!fp->f_opinfo->is_lease || fp->f_opinfo->o_lease->version != 2)
>   1121			return;
>   1122	
>   1123		p_ci = ksmbd_inode_lookup_lock(fp->filp->f_path.dentry->d_parent);
>   1124		if (!p_ci)
>   1125			return;
>   1126	
>   1127		list_for_each_entry(opinfo, &p_ci->m_op_list, op_entry) {
>   1128			if (!opinfo->is_lease)
>   1129				continue;
>   1130	
>   1131			if (opinfo->o_lease->state != SMB2_OPLOCK_LEVEL_NONE)
>   1132				oplock_break(opinfo, SMB2_OPLOCK_LEVEL_NONE);
>   1133		}
>   1134	
>   1135		ksmbd_inode_put(p_ci);
>   1136	}
>   1137	
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

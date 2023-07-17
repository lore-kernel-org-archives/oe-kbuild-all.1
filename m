Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1155228
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 04:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBF2C433C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 04:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689567446;
	bh=DJWcdBAH8oGdRvLXCXygL/f6KLmDwCJZB+zk1y98Qzs=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=rb0tdIiGq/34dK9Z4uHD7pdlyjOuxXIOnSsHNfIWFYklFAK1u5jZfc0XT4lmFyxdk
	 p8ycWJA+1qSLOKxP1/hS/eRJ5oHEE1GTmg8TsVsQCN1xtPkZYVM0efApMtjxdnQaaf
	 vt2Qg0lmlx5ZKCTgm/sbbTNbzqglLaLuF4nBqzJaE6KuaG2Izcwm0iUGAK6itpLmbx
	 /oS5OgOUS3UzsHulZHgm0mkRpMGy+M8t9aXXlT8kXky+qZU0/0fkDHtMoVvpStiavl
	 hFy0QiAC3MTXsabLICnOhxESXdXoy71QJSJahlR8Dnn2wAmHP7WP8t5uMTAT9VTpTX
	 fQbe2hpVJtdtw==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5634db21a78so2584611eaf.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 21:17:25 -0700 (PDT)
X-Gm-Message-State: ABy/qLbnITlNLBjkVAsnp7f1ntEVoNmEXpHZhrc7bgFil3rWLfeWB/lq
	mQy0oKbEazT+xMzigXYU7Phd4wuiH9hqqf/HrzI=
X-Google-Smtp-Source: APBJJlFZHkIswmkFuijosgK8QQQlQqpWFIsgDc/83XqdOeuFw4tcjO7ps9BkfmTvRmiyFY1q3GAzNFu9wBa0FwWBdXY=
X-Received: by 2002:a4a:6141:0:b0:566:f052:696d with SMTP id
 u1-20020a4a6141000000b00566f052696dmr3470497ooe.6.1689567445161; Sun, 16 Jul
 2023 21:17:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a8a:4c7:0:b0:4e8:f6ff:2aab with HTTP; Sun, 16 Jul 2023
 21:17:24 -0700 (PDT)
In-Reply-To: <202307171058.2onUUbC3-lkp@intel.com>
References: <202307171058.2onUUbC3-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 17 Jul 2023 13:17:24 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8eU_Skpu0ekRXDBv2Me0rurJ-nPS9q8_S9BDaWUY9fFw@mail.gmail.com>
Message-ID: <CAKYAXd8eU_Skpu0ekRXDBv2Me0rurJ-nPS9q8_S9BDaWUY9fFw@mail.gmail.com>
Subject: Re: [samba-ksmbd:ksmbd-for-next-next 2/2] fs/smb/server/vfs.c:113:48:
 error: 'KSMBD_SHARE_FLAG_CROSSMNT' undeclared; did you mean 'KSMBD_SHARE_FLAG_STREAMS'?
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I have already fixed it before a few hours.
Thanks for your report.

2023-07-17 11:50 GMT+09:00, kernel test robot <lkp@intel.com>:
> tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
> head:   ad297d25edb98d80a162f7ab8280ffbc025e8ebf
> commit: ad297d25edb98d80a162f7ab8280ffbc025e8ebf [2/2] ksmbd: check if a
> mount point is crossed during path lookup
> config: x86_64-allyesconfig
> (https://download.01.org/0day-ci/archive/20230717/202307171058.2onUUbC3-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce:
> (https://download.01.org/0day-ci/archive/20230717/202307171058.2onUUbC3-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version
> of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> https://lore.kernel.org/oe-kbuild-all/202307171058.2onUUbC3-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    fs/smb/server/vfs.c: In function 'ksmbd_vfs_path_lookup_locked':
>>> fs/smb/server/vfs.c:113:48: error: 'KSMBD_SHARE_FLAG_CROSSMNT' undeclared
>>> (first use in this function); did you mean 'KSMBD_SHARE_FLAG_STREAMS'?
>      113 |         if (test_share_config_flag(share_conf,
> KSMBD_SHARE_FLAG_CROSSMNT)) {
>          |
> ^~~~~~~~~~~~~~~~~~~~~~~~~
>          |
> KSMBD_SHARE_FLAG_STREAMS
>    fs/smb/server/vfs.c:113:48: note: each undeclared identifier is reported
> only once for each function it appears in
>
>
> vim +113 fs/smb/server/vfs.c
>
>     63	
>     64	static int ksmbd_vfs_path_lookup_locked(struct ksmbd_share_config
> *share_conf,
>     65						char *pathname, unsigned int flags,
>     66						struct path *parent_path,
>     67						struct path *path)
>     68	{
>     69		struct qstr last;
>     70		struct filename *filename;
>     71		struct path *root_share_path = &share_conf->vfs_path;
>     72		int err, type;
>     73		struct dentry *d;
>     74	
>     75		if (pathname[0] == '\0') {
>     76			pathname = share_conf->path;
>     77			root_share_path = NULL;
>     78		} else {
>     79			flags |= LOOKUP_BENEATH;
>     80		}
>     81	
>     82		filename = getname_kernel(pathname);
>     83		if (IS_ERR(filename))
>     84			return PTR_ERR(filename);
>     85	
>     86		err = vfs_path_parent_lookup(filename, flags,
>     87					     parent_path, &last, &type,
>     88					     root_share_path);
>     89		if (err) {
>     90			putname(filename);
>     91			return err;
>     92		}
>     93	
>     94		if (unlikely(type != LAST_NORM)) {
>     95			path_put(parent_path);
>     96			putname(filename);
>     97			return -ENOENT;
>     98		}
>     99	
>    100		inode_lock_nested(parent_path->dentry->d_inode, I_MUTEX_PARENT);
>    101		d = lookup_one_qstr_excl(&last, parent_path->dentry, 0);
>    102		if (IS_ERR(d))
>    103			goto err_out;
>    104	
>    105		if (d_is_negative(d)) {
>    106			dput(d);
>    107			goto err_out;
>    108		}
>    109	
>    110		path->dentry = d;
>    111		path->mnt = mntget(parent_path->mnt);
>    112	
>  > 113		if (test_share_config_flag(share_conf, KSMBD_SHARE_FLAG_CROSSMNT))
> {
>    114			err = follow_down(path, 0);
>    115			if (err < 0) {
>    116				path_put(path);
>    117				goto err_out;
>    118			}
>    119		}
>    120	
>    121		putname(filename);
>    122		return 0;
>    123	
>    124	err_out:
>    125		inode_unlock(d_inode(parent_path->dentry));
>    126		path_put(parent_path);
>    127		putname(filename);
>    128		return -ENOENT;
>    129	}
>    130	
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

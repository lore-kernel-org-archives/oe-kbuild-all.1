Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED6A37C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 00:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C33C433D2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 00:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678928214;
	bh=gJBFKt2i6aoActDDsUjsbEPUUDwRkGizNkt2NSXkZr8=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=bUvqgPUco0o/CI94WJR+vv3Y4MrI+NZWEHWwd83rAOc+lWtvfLFV6K5TwtlXPPuRR
	 5r/hwWvEeNUEgTk7dv3mTjffdNvnPewERq6u131hKn2CmKPs/wDjyhTeS8AHYT4lIT
	 /OgF0dm7ODmXTlloM7eDSFspoJjbQ3heSGPy/lszedfp1XKYJIJ/ZgHwfU2HQyXhk4
	 SAjo83mUD22Fg9/Fpr6HdBX44FIu/0gViynA81F0nqtcV4UGMET5RR7C3jpkS1K2mE
	 C6hmERr7YqWv4kKsJaPvS23TJ5Ak3LDofMT4+UEmBS1U2rnt3FzBPFbAZTvS5urmiZ
	 G4nvJ7ZRZHh5w==
Received: by mail-ot1-f43.google.com with SMTP id w21-20020a9d6755000000b00698853a52c7so132909otm.11
        for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 17:56:54 -0700 (PDT)
X-Gm-Message-State: AO0yUKUwkl92fWRZH+PUB/kPnTutbutH9bnuBwK1gYIvdrPUoVW8hjiy
	c1gWlf02bOBhahZh+KNzm6ibMquDNTfrqXQN8TQ=
X-Google-Smtp-Source: AK7set9JifUdJt4H9ShJVLcHsW31rA2f282imPX1UWVz19GZbN0NDOPe0jrF5hD2DTbaQYlChr/pfp1EiDdPK134pU4=
X-Received: by 2002:a05:6830:26f7:b0:68b:d7a3:8027 with SMTP id
 m55-20020a05683026f700b0068bd7a38027mr15434796otu.0.1678928213123; Wed, 15
 Mar 2023 17:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ac9:5a45:0:b0:4c6:b336:2407 with HTTP; Wed, 15 Mar 2023
 17:56:52 -0700 (PDT)
In-Reply-To: <202303160854.zjX0rhqS-lkp@intel.com>
References: <20230315223435.5139-4-linkinjeon@kernel.org> <202303160854.zjX0rhqS-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 16 Mar 2023 09:56:52 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8iOdiPnJmiOjtEvJugbGHq8ZJe6DdO-nPsAqixq-MUdQ@mail.gmail.com>
Message-ID: <CAKYAXd8iOdiPnJmiOjtEvJugbGHq8ZJe6DdO-nPsAqixq-MUdQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] ksmbd: fix racy issue from using ->d_parent and ->d_name
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2023-03-16 9:30 GMT+09:00, kernel test robot <lkp@intel.com>:
> Hi Namjae,
Hi,

First, Thanks for your report!

I will fix it on next version.

Thanks!
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on vfs-idmapping/for-next]
> [also build test WARNING on linus/master v6.3-rc2 next-20230315]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:
> https://github.com/intel-lab-lkp/linux/commits/Namjae-Jeon/ksmbd-remove-i=
nternal-h-include/20230316-063731
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git
> for-next
> patch link:
> https://lore.kernel.org/r/20230315223435.5139-4-linkinjeon%40kernel.org
> patch subject: [PATCH v8 3/3] ksmbd: fix racy issue from using ->d_parent
> and ->d_name
> config: riscv-allmodconfig
> (https://download.01.org/0day-ci/archive/20230316/202303160854.zjX0rhqS-l=
kp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross =
-O
> ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         #
> https://github.com/intel-lab-lkp/linux/commit/96a66748207926f3642ac4d24c7=
a591de22e3bad
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review
> Namjae-Jeon/ksmbd-remove-internal-h-include/20230316-063731
>         git checkout 96a66748207926f3642ac4d24c7a591de22e3bad
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1
> O=3Dbuild_dir ARCH=3Driscv olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1
> O=3Dbuild_dir ARCH=3Driscv SHELL=3D/bin/bash fs/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link:
> https://lore.kernel.org/oe-kbuild-all/202303160854.zjX0rhqS-lkp@intel.com=
/
>
> All warnings (new ones prefixed by >>):
>
>    fs/ksmbd/vfs.c:54: warning: Function parameter or member 'parent' not
> described in 'ksmbd_vfs_lock_parent'
>    fs/ksmbd/vfs.c:54: warning: Function parameter or member 'child' not
> described in 'ksmbd_vfs_lock_parent'
>    fs/ksmbd/vfs.c:356: warning: Function parameter or member 'fp' not
> described in 'ksmbd_vfs_read'
>    fs/ksmbd/vfs.c:356: warning: Excess function parameter 'fid' descripti=
on
> in 'ksmbd_vfs_read'
>    fs/ksmbd/vfs.c:472: warning: Function parameter or member 'fp' not
> described in 'ksmbd_vfs_write'
>    fs/ksmbd/vfs.c:472: warning: Excess function parameter 'fid' descripti=
on
> in 'ksmbd_vfs_write'
>    fs/ksmbd/vfs.c:535: warning: Function parameter or member 'path' not
> described in 'ksmbd_vfs_getattr'
>    fs/ksmbd/vfs.c:535: warning: Function parameter or member 'stat' not
> described in 'ksmbd_vfs_getattr'
>    fs/ksmbd/vfs.c:535: warning: Excess function parameter 'work' descript=
ion
> in 'ksmbd_vfs_getattr'
>    fs/ksmbd/vfs.c:535: warning: Excess function parameter 'fid' descripti=
on
> in 'ksmbd_vfs_getattr'
>    fs/ksmbd/vfs.c:535: warning: Excess function parameter 'attrs'
> description in 'ksmbd_vfs_getattr'
>    fs/ksmbd/vfs.c:552: warning: Function parameter or member 'p_id' not
> described in 'ksmbd_vfs_fsync'
>    fs/ksmbd/vfs.c:575: warning: Function parameter or member 'work' not
> described in 'ksmbd_vfs_remove_file'
>    fs/ksmbd/vfs.c:575: warning: Function parameter or member 'path' not
> described in 'ksmbd_vfs_remove_file'
>    fs/ksmbd/vfs.c:575: warning: Excess function parameter 'name' descript=
ion
> in 'ksmbd_vfs_remove_file'
>    fs/ksmbd/vfs.c:613: warning: Function parameter or member 'work' not
> described in 'ksmbd_vfs_link'
>    fs/ksmbd/vfs.c:779: warning: Function parameter or member 'fp' not
> described in 'ksmbd_vfs_truncate'
>    fs/ksmbd/vfs.c:779: warning: Excess function parameter 'fid' descripti=
on
> in 'ksmbd_vfs_truncate'
>    fs/ksmbd/vfs.c:820: warning: Excess function parameter 'size' descript=
ion
> in 'ksmbd_vfs_listxattr'
>    fs/ksmbd/vfs.c:917: warning: Function parameter or member 'option' not
> described in 'ksmbd_vfs_set_fadvise'
>    fs/ksmbd/vfs.c:917: warning: Excess function parameter 'options'
> description in 'ksmbd_vfs_set_fadvise'
>    fs/ksmbd/vfs.c:1117: warning: Function parameter or member 'um' not
> described in 'ksmbd_vfs_lookup_in_dir'
>    fs/ksmbd/vfs.c:1152: warning: Function parameter or member 'work' not
> described in 'ksmbd_vfs_kern_path_locked'
>>> fs/ksmbd/vfs.c:1152: warning: expecting prototype for
>>> ksmbd_vfs_kern_path(). Prototype was for ksmbd_vfs_kern_path_locked()
>>> instead
>
>
> vim +1152 fs/ksmbd/vfs.c
>
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1139
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1140  /**
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1141   *
> ksmbd_vfs_kern_path() - lookup a file and get path info
> 265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1142   *
> @name:	file path that is relative to share
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1143   *
> @flags:	lookup flags
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1144   * @path:	=
if
> lookup succeed, return path info
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1145   *
> @caseless:	caseless filename lookup
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1146   *
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1147   * Return:=
	0
> on success, otherwise error
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1148   */
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1149  int
> ksmbd_vfs_kern_path_locked(struct ksmbd_work *work, char *name,
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1150  		=09
> unsigned int flags, struct path *path,
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1151  		=09
> bool caseless)
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16 @1152  {
> 265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1153  	struct
> ksmbd_share_config *share_conf =3D work->tcon->share_conf;
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1154  	int err;
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1155  	struct pa=
th
> parent_path;
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1156
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1157  	err =3D
> ksmbd_vfs_path_lookup_locked(share_conf, name, flags, path);
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1158  	if (!err)
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1159  		return
> err;
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1160
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1161  	if
> (caseless) {
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1162  		char
> *filepath;
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1163  		size_t
> path_len, remain_len;
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1164
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1165  		filepath=
 =3D
> kstrdup(name, GFP_KERNEL);
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1166  		if
> (!filepath)
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1167  			return
> -ENOMEM;
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1168
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1169  		path_len=
 =3D
> strlen(filepath);
> 265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1170  		remain_l=
en
> =3D path_len;
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1171
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1172  		parent_p=
ath
> =3D share_conf->vfs_path;
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1173
> 		path_get(&parent_path);
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1174
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1175  		while
> (d_can_lookup(parent_path.dentry)) {
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1176  			char
> *filename =3D filepath + path_len - remain_len;
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1177  			char *n=
ext
> =3D strchrnul(filename, '/');
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1178  			size_t
> filename_len =3D next - filename;
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1179  			bool
> is_last =3D !next[0];
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1180
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1181  			if
> (filename_len =3D=3D 0)
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1182  				break;
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1183
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1184  			err =3D
> ksmbd_vfs_lookup_in_dir(&parent_path, filename,
> dbab80e2071ad8c fs/ksmbd/vfs.c Atte Heikkil=C3=A4 2022-09-28  1185  					=
=09
> filename_len,
> dbab80e2071ad8c fs/ksmbd/vfs.c Atte Heikkil=C3=A4 2022-09-28  1186  					=
=09
> work->conn->um);
> 265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1187  			if (err=
)
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1188  				goto
> out2;
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1189
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1190  			next[0]=
 =3D
> '\0';
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1191
> 265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1192  			err =3D
> vfs_path_lookup(share_conf->vfs_path.dentry,
> 265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1193  				=09
> share_conf->vfs_path.mnt,
> 265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1194  				=09
> filepath,
> 265fd1991c1db85 fs/ksmbd/vfs.c Hyunchul Lee  2021-09-25  1195  				=09
> flags,
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1196  				=09
> path);
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1197  			if (err=
)
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1198  				goto
> out2;
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1199  			else if
> (is_last)
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1200  				goto
> out1;
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1201
> 			path_put(&parent_path);
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1202
> 			parent_path =3D *path;
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1203
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1204  			next[0]=
 =3D
> '/';
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1205  			remain_=
len
> -=3D filename_len + 1;
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1206  		}
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1207
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1208  		err =3D
> -EINVAL;
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1209  out2:
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1210
> 		path_put(&parent_path);
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1211  out1:
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1212
> 		kfree(filepath);
> 3c20378325c710e fs/cifsd/vfs.c Hyunchul Lee  2021-04-13  1213  	}
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1214
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1215  	if (!err)=
 {
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1216  		err =3D
> ksmbd_vfs_lock_parent(parent_path.dentry, path->dentry);
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1217  		if (err)
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1218
> 			dput(path->dentry);
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1219
> 		path_put(&parent_path);
> 96a66748207926f fs/ksmbd/vfs.c Namjae Jeon   2023-03-16  1220  	}
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1221  	return er=
r;
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1222  }
> f44158485826c07 fs/cifsd/vfs.c Namjae Jeon   2021-03-16  1223
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
>

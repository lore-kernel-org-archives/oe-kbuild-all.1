Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81BD2620F5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 10:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762077607; cv=none; b=O0wGnQVzzwu7H/qodyxQd4vtF+2wlvGccUZgfd1HjbU4kjO+5hg8yQgRPsKGvSmSD41RPtCwzb770YL10xydNbAizrOkDkPgRsvOoXAO9LOvZaHCZhZJz1xY/sGwGVbQJ9kdWI8I2P+Ymvj/IQPC0erf6a8RqCAUtlRDcgd0u4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762077607; c=relaxed/simple;
	bh=nBxCYxD0sLTtEpBQhu3TDTHvv4GPYUZANeSd6JK4LiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LlibT3QfM49i9uU7e2bQADjdRiP7Ovihdjzhri5leerkM0Nr2zDuzX+v+hjMZbUpkTnn+fja8k6wNNpjzuWlAsTQOMh5Bvn/pc4b6sdjWgoSsoIx9/aLs2DKgQbltKzT3rkB3G+am0tRJhlfYG2Vy4PR3XIuPlCtpovE976oEuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZeXOJM1; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZeXOJM1"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso770211a12.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Nov 2025 02:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762077604; x=1762682404; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVZpy55Yd7iT8ERHYRvSfdnx47RmCaBaV5nSwaxqOJ4=;
        b=LZeXOJM1h8n6XdwgQhgGHxWzalRCUYrkPRw6YaWzkdEECYMGkWmHqusjhU2ib69vcc
         8cdDYvWlk4b4gLBnoeJEKusKbee41Tr0zMyCOsixCSxk5m+7Jj/w02G2a0er8V0uG6/7
         jgDMz+NJGLcUwNucVjIrJblRMoPqWZagavPmBi06GMXfa1D3VndP0nqhIUwmgcVjbq6L
         BXGmdv1R1gROf+dThyu3EOMQNEhgPUBTo541SD/gvHyyjhur2DEYYMLbNR9gIRmk1SwB
         wTGb97vW/UeCu6J9wdDuK6fyW+Q9FBOCBctzLhhAOWvMpbarU5JINKkYnRc6Vbu+A6RP
         7vGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762077604; x=1762682404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVZpy55Yd7iT8ERHYRvSfdnx47RmCaBaV5nSwaxqOJ4=;
        b=urX4Tw4uf4I86BQO2nSeQ01xcB/l+x30VwSqyvrpxlM2HrpyK+yrOIDsBTF8XIcg2c
         XkEzisc1g3VdITwreUgZoeNRvYizpxFRzOYc3TMTu3Cvywjj0dYECtX66fXbcgdWzH2K
         8l4VXzZUwq8KNXJmTnsblynZYyf4j9whxhSMyCglV0a8meTO00VHvQhUoWNUYfgD4S9r
         Xs3PhI4QWxF1e1ZKAl9T3210IbsnsWzGo4UkYig9G9S9SGO09kTvBPc30IlkELRTNWhU
         ednGr7c4t3XHUoMtsNdhxZvTA6NutHrwF0Z8nvm1MTIQBjWYL1GtP5A96/e+tZUaxTKh
         f7yg==
X-Forwarded-Encrypted: i=1; AJvYcCVK21sppy1rH3HjnkVlfGlJzgftJm4+TaC8rum3DDYcQqjH5X0ZEbvMZU1H/PaC940LPYriJkOHo5ZFFuUt@lists.linux.dev
X-Gm-Message-State: AOJu0YxbExE2kcTKUvjecAikhSsj+yJRzxAWdhdCjUnVuub3LM7J4WWu
	NFHdd38pB7Q0re/Vo/H9RueFWhoI/eEXWzKsLTOJiXjmpkmqvh6I465lMqxo2IuNJ3f7Tr/RaO6
	lnWQM8UVYRRBu8WRksWQoJDTRj43Wxi8=
X-Gm-Gg: ASbGncvDPn17BpQwyY7KQNVanBw5SAg+bxE8Mpkcx85nSq5ges3/Ytdp1txCb8qxVvz
	LnzDKl/eyyUtbh0zhJWTWb1PVPDnY2KJ/x42e0JFdtboaoSGN2MWdhljivn/xxZdMDRx4ScbllC
	szvcUvzPTW4fniZ5sCxw/KbGau4IU5XJZD2SCU42vTVrNi3hgAgUrIbNesyeQG9RvEg9+wI1y1+
	GxaUO0G0N4WUGBnNbBXq4QPIFij7idLDxb6ob2oF4986NLJZBivpmJA2ihtR33/f2Jj/t/3PYHc
	Spc6wfGfQn3IqmFwbzY=
X-Google-Smtp-Source: AGHT+IFEH8jsZjQafTUVO/TEfvIzCIsb3Pcud9ukwPrVm6Ztp4IndvVlHlThgbhw4VZKJPdajE0xT0xUUtpyoeYFtj0=
X-Received: by 2002:a05:6402:2809:b0:63b:f238:8fe2 with SMTP id
 4fb4d7f45d1cf-64077015c29mr7333942a12.21.1762077603878; Sun, 02 Nov 2025
 02:00:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251029234353.1321957-5-neilb@ownmail.net> <202511021406.Tv3dcpn5-lkp@intel.com>
In-Reply-To: <202511021406.Tv3dcpn5-lkp@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 2 Nov 2025 10:59:52 +0100
X-Gm-Features: AWmQ_blkoXREpWDLxsdzeMY_8zMOO_hU7_rJh64Nz8Ib6B4vrj-gB-b9MPrdPRo
Message-ID: <CAOQ4uxgaANjJXdhiQamgop8cicWXZ7Er2CWW3W7w-VgNMn9OVw@mail.gmail.com>
Subject: Re: [PATCH v4 04/14] VFS/nfsd/cachefiles/ovl: add start_creating()
 and end_creating()
To: Dan Carpenter <dan.carpenter@linaro.org>, NeilBrown <neilb@ownmail.net>, 
	Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild@lists.linux.dev, Alexander Viro <viro@zeniv.linux.org.uk>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	Jeff Layton <jlayton@kernel.org>, Chris Mason <chris.mason@fusionio.com>, 
	David Sterba <dsterba@suse.com>, David Howells <dhowells@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Tyler Hicks <code@tyhicks.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Chuck Lever <chuck.lever@oracle.com>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Steve French <smfrench@gmail.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Carlos Maiolino <cem@kernel.org>, John Johansen <john.johansen@canonical.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Mateusz Guzik <mjguzik@gmail.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 2, 2025 at 10:08=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hi NeilBrown,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/debugfs-=
rename-end_creating-to-debugfs_end_creating/20251030-075146
> base:   driver-core/driver-core-testing
> patch link:    https://lore.kernel.org/r/20251029234353.1321957-5-neilb%4=
0ownmail.net
> patch subject: [PATCH v4 04/14] VFS/nfsd/cachefiles/ovl: add start_creati=
ng() and end_creating()
> config: x86_64-randconfig-161-20251101 (https://download.01.org/0day-ci/a=
rchive/20251102/202511021406.Tv3dcpn5-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202511021406.Tv3dcpn5-lkp@intel.com/
>
> smatch warnings:
> fs/overlayfs/dir.c:130 ovl_whiteout() error: uninitialized symbol 'whiteo=
ut'.
> fs/overlayfs/dir.c:130 ovl_whiteout() warn: passing zero to 'PTR_ERR'
>
> vim +/whiteout +130 fs/overlayfs/dir.c
>
> c21c839b8448dd Chengguang Xu     2020-04-24   97  static struct dentry *o=
vl_whiteout(struct ovl_fs *ofs)
> e9be9d5e76e348 Miklos Szeredi    2014-10-24   98  {
> e9be9d5e76e348 Miklos Szeredi    2014-10-24   99        int err;
> 807b78b0fffc23 NeilBrown         2025-10-30  100        struct dentry *wh=
iteout, *link;
> c21c839b8448dd Chengguang Xu     2020-04-24  101        struct dentry *wo=
rkdir =3D ofs->workdir;
> e9be9d5e76e348 Miklos Szeredi    2014-10-24  102        struct inode *wdi=
r =3D workdir->d_inode;
> e9be9d5e76e348 Miklos Szeredi    2014-10-24  103
> 8afa0a73671389 NeilBrown         2025-07-16  104        guard(mutex)(&ofs=
->whiteout_lock);
> 8afa0a73671389 NeilBrown         2025-07-16  105
> c21c839b8448dd Chengguang Xu     2020-04-24  106        if (!ofs->whiteou=
t) {
> 807b78b0fffc23 NeilBrown         2025-10-30  107                whiteout =
=3D ovl_start_creating_temp(ofs, workdir);
> 8afa0a73671389 NeilBrown         2025-07-16  108                if (IS_ER=
R(whiteout))
> 8afa0a73671389 NeilBrown         2025-07-16  109                        r=
eturn whiteout;
>
> white out is not an error pointer.
>
> 807b78b0fffc23 NeilBrown         2025-10-30  110                err =3D o=
vl_do_whiteout(ofs, wdir, whiteout);
> 807b78b0fffc23 NeilBrown         2025-10-30  111                if (!err)
> 807b78b0fffc23 NeilBrown         2025-10-30  112                        o=
fs->whiteout =3D dget(whiteout);
> 807b78b0fffc23 NeilBrown         2025-10-30  113                end_creat=
ing(whiteout, workdir);
> 807b78b0fffc23 NeilBrown         2025-10-30  114                if (err)
> 807b78b0fffc23 NeilBrown         2025-10-30  115                        r=
eturn ERR_PTR(err);
> e9be9d5e76e348 Miklos Szeredi    2014-10-24  116        }
>
> whiteout not set on else path
>
> e9be9d5e76e348 Miklos Szeredi    2014-10-24  117
> e4599d4b1aeff0 Amir Goldstein    2023-06-17  118        if (!ofs->no_shar=
ed_whiteout) {
> 807b78b0fffc23 NeilBrown         2025-10-30  119                link =3D =
ovl_start_creating_temp(ofs, workdir);
> 807b78b0fffc23 NeilBrown         2025-10-30  120                if (IS_ER=
R(link))
> 807b78b0fffc23 NeilBrown         2025-10-30  121                        r=
eturn link;
> 807b78b0fffc23 NeilBrown         2025-10-30  122                err =3D o=
vl_do_link(ofs, ofs->whiteout, wdir, link);
> 807b78b0fffc23 NeilBrown         2025-10-30  123                if (!err)
> 807b78b0fffc23 NeilBrown         2025-10-30  124                        w=
hiteout =3D dget(link);
>
> It's set here, but then returned on line 127.
>
> 807b78b0fffc23 NeilBrown         2025-10-30  125                end_creat=
ing(link, workdir);
> 807b78b0fffc23 NeilBrown         2025-10-30  126                if (!err)
> 807b78b0fffc23 NeilBrown         2025-10-30  127                        r=
eturn whiteout;;
>
> nit: double ;;
>
> 807b78b0fffc23 NeilBrown         2025-10-30  128
> 807b78b0fffc23 NeilBrown         2025-10-30  129                if (err !=
=3D -EMLINK) {
> 672820a070ea5e Antonio Quartulli 2025-07-21 @130                        p=
r_warn("Failed to link whiteout - disabling whiteout inode sharing(nlink=3D=
%u, err=3D%lu)\n",
> 672820a070ea5e Antonio Quartulli 2025-07-21  131                         =
       ofs->whiteout->d_inode->i_nlink,
> 672820a070ea5e Antonio Quartulli 2025-07-21  132                         =
       PTR_ERR(whiteout));
>
> whiteout is either valid or uninitialized.  For some reason
> Smatch thinks whiteout can be NULL, I suspect because of
> the NULL check in dget().
>

That looks like "rebase race" with the fix commit 672820a070ea5e
("ovl: properly print correct variable").

The fix is no longer correct, but also no longer needed because of
early return on lookup error in line 121.

This implies that there is also a change of behavior in this patch
causing that an error in lookup will not have a warning.

I have no problem with this change, because the warning text
indicated it was intended to refer to errors in linking.

Long story short, patch needs to go back to using err here for
printing the link error.

Thanks,
Amir.

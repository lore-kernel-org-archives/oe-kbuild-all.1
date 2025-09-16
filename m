Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4951B4231
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 11:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758023302; cv=none; b=IXMpWGZrlBxkEhblLWTOVF+jelrZd6dM2MaEjI78FTbutLS/XhMZ42zppKT+SYVXO2j3APdOZmHr2vNIdRTmXAtEUcnT6B1Yn5DxN9t/3XaxQcKB8FqODNchovGAdY2PgUe5Rkv72ICXRvAqxm60TfTacBy+OcXqO3wR+3l6E1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758023302; c=relaxed/simple;
	bh=bD0hsGvLlVb/tas6TC+cVNel3bkWgVhCw1S2N1NdjQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJgNjwTl5XnZtDSUa83m6mjvWzrROkwDiyeZoO5SrF1FAqNJpfYKJPGSoTX4TO0cu4/hSjIQ/8Ed+Jh34dfuZ/Ld+rY+nNBLREJ707Y+z1GbTxMQixR/QgHb6wKyd7lvmAQ3GDEoQ9khefXNZGwc2N90pXdK/Kk9ljzXxUoMES0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uhJlc9Pj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhJlc9Pj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C603C4CEEB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 11:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758023301;
	bh=bD0hsGvLlVb/tas6TC+cVNel3bkWgVhCw1S2N1NdjQU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uhJlc9Pj/7TKVV1Fl3ZLrXUeH/+OSLV+FltMIpZwMWNotUmq9ic4QYW41nti/gS4O
	 OLBvP2Mubw+fDuPUAQJViPj5eg1IMMUMEtRQyPcMVDZrfP695nmoj2IiFhrge+hp1n
	 JGoaJKWmxbyAgVVEoFD1NPT5HdBjf0JbRqwkgctDWdWCdVH+9ZEzyT426bkXgxH6Cs
	 pUA81S9GHw/7TgFvO59QY0wVkQojY/YDbre1UvLEebz3ckDADIDfeFMqHEpmBhj+bt
	 KccYgaG3oit3bpTsApsBwKaEYMb1pJUmYrk6zoUDvPcVbEwv/3l/Au7amkwGg2K+3O
	 vcYvscY50nw0g==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b0418f6fc27so906086766b.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 04:48:21 -0700 (PDT)
X-Gm-Message-State: AOJu0YxcQMpClJGpG3xCRM4HeE3Tu/Sm/jNwt1ay3Ulm2zBwIvvrXkS9
	kGHDKJiqb5NOeBytTafjUHaAvx7SxgIp9lI60XT+U4fAXC+HdjNa5jSMv+fdIervhfeP1WmoKaS
	sCRM5hB6Cn7po5gnEY1suvczCty4oifM=
X-Google-Smtp-Source: AGHT+IH+K2EgkALjcG5qipbxqq1Gkx4UgNLGq6l+SGNUlgP5RzUhchFl+GK1jdEa0pK69+umRXRqnS/1gqUt4x23Puc=
X-Received: by 2002:a17:906:6a0c:b0:afe:e7f1:289d with SMTP id
 a640c23a62f3a-b07c37b3d5amr1470493866b.62.1758023300013; Tue, 16 Sep 2025
 04:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <247e1013735943cecfe4942a4a163376552cc562.1757271913.git.fdmanana@suse.com>
 <202509161356.JTeWVygY-lkp@intel.com>
In-Reply-To: <202509161356.JTeWVygY-lkp@intel.com>
From: Filipe Manana <fdmanana@kernel.org>
Date: Tue, 16 Sep 2025 12:47:43 +0100
X-Gmail-Original-Message-ID: <CAL3q7H5LU1GhvSOixu-0w=RxD7Cbm-46XTDu6hq_LORVDn+DzA@mail.gmail.com>
X-Gm-Features: AS18NWDzWSnTDbure3rwrSccPrz57yrVTRoWglay9dlhkB80-rOUd5vsT50sagA
Message-ID: <CAL3q7H5LU1GhvSOixu-0w=RxD7Cbm-46XTDu6hq_LORVDn+DzA@mail.gmail.com>
Subject: Re: [PATCH v2 22/33] btrfs: add current log leaf, key and slot to
 struct walk_control
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 7:06=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on kdave/for-next]
> [cannot apply to linus/master v6.17-rc6 next-20250915]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/fdmanana-kernel-or=
g/btrfs-fix-invalid-extref-key-setup-when-replaying-dentry/20250908-180010
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git f=
or-next
> patch link:    https://lore.kernel.org/r/247e1013735943cecfe4942a4a163376=
552cc562.1757271913.git.fdmanana%40suse.com
> patch subject: [PATCH v2 22/33] btrfs: add current log leaf, key and slot=
 to struct walk_control
> config: s390-randconfig-r122-20250916 (https://download.01.org/0day-ci/ar=
chive/20250916/202509161356.JTeWVygY-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.4.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250916/202509161356.JTeWVygY-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509161356.JTeWVygY-lkp=
@intel.com/
>
> Note: it may well be a FALSE warning. FWIW you are at least aware of it n=
ow.
> http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings
>
> All warnings (new ones prefixed by >>):
>
>    In file included from fs/btrfs/ctree.h:21,
>                     from fs/btrfs/tree-log.c:12:
>    In function 'btrfs_inode_mode',
>        inlined from 'replay_one_buffer' at fs/btrfs/tree-log.c:2649:11:
> >> fs/btrfs/accessors.h:66:16: warning: 'inode_item' may be used uninitia=
lized [-Wmaybe-uninitialized]
>       66 |         return btrfs_get_##bits(eb, s, offsetof(type, member))=
;         \
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    fs/btrfs/accessors.h:270:1: note: in expansion of macro 'BTRFS_SETGET_=
FUNCS'
>      270 | BTRFS_SETGET_FUNCS(inode_mode, struct btrfs_inode_item, mode, =
32);
>          | ^~~~~~~~~~~~~~~~~~
>    fs/btrfs/tree-log.c: In function 'replay_one_buffer':
>    fs/btrfs/tree-log.c:2607:42: note: 'inode_item' was declared here
>     2607 |                 struct btrfs_inode_item *inode_item;
>          |                                          ^~~~~~~~~~

This is a false positive.
inode_item is initialized only when wc->log_key.type =3D=3D
BTRFS_INODE_ITEM_KEY and it's only accessed in other if blocks when
wc->log_key.type =3D=3D BTRFS_INODE_ITEM_KEY is one of the conditions, so
no risk of accessing inode_item without being initialized.

Thanks.

>
>
> vim +/inode_item +66 fs/btrfs/accessors.h
>
> 07e81dc94474eb Josef Bacik  2022-10-19  60
> 07e81dc94474eb Josef Bacik  2022-10-19  61  #define BTRFS_SETGET_FUNCS(na=
me, type, member, bits)                        \
> 07e81dc94474eb Josef Bacik  2022-10-19  62  static inline u##bits btrfs_#=
#name(const struct extent_buffer *eb,  \
> 07e81dc94474eb Josef Bacik  2022-10-19  63                               =
  const type *s)                       \
> 07e81dc94474eb Josef Bacik  2022-10-19  64  {                            =
                                       \
> 98efb4eb310d0d David Sterba 2023-07-13  65      static_assert(sizeof(u##b=
its) =3D=3D sizeof_field(type, member));   \
> 07e81dc94474eb Josef Bacik  2022-10-19 @66      return btrfs_get_##bits(e=
b, s, offsetof(type, member));         \
> 07e81dc94474eb Josef Bacik  2022-10-19  67  }                            =
                                       \
> 07e81dc94474eb Josef Bacik  2022-10-19  68  static inline void btrfs_set_=
##name(const struct extent_buffer *eb, type *s, \
> 07e81dc94474eb Josef Bacik  2022-10-19  69                               =
   u##bits val)                        \
> 07e81dc94474eb Josef Bacik  2022-10-19  70  {                            =
                                       \
> 98efb4eb310d0d David Sterba 2023-07-13  71      static_assert(sizeof(u##b=
its) =3D=3D sizeof_field(type, member));   \
> 07e81dc94474eb Josef Bacik  2022-10-19  72      btrfs_set_##bits(eb, s, o=
ffsetof(type, member), val);           \
> 07e81dc94474eb Josef Bacik  2022-10-19  73  }
> 07e81dc94474eb Josef Bacik  2022-10-19  74
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

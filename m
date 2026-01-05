Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA71331200
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 11:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767612601; cv=none; b=NdLmP/qxvfpK5jwUsfxBk313fLRMYJfrtEDOgvOw1EesE0oFWhjNodoRi8kqgH/u/FaOWaS7xbTrpLuBbZhH+N7es/TQx+lBhkD0xh2vR21Rk7v37Bi6i01Hv3Jlhawf9hkTsttNxnoXLdSxmaWEXxxl++UdQcgriugQVGlSlwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767612601; c=relaxed/simple;
	bh=MrdDFLSC+HtAVnUIntVS0+A5YDBbItxOZnu4x6lBhxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cy8C6lhH1UnfDt2JeElyulJJvD6/OD7P1AgOydV68xJLmVf/iM7Q8SMy6DdbC35o3Bav+iZYrk4f7x6k8pwlC10CB1C1FJdPE+hIyllBBA8AvKSOJMrjwJiZ8LJX1mEkf0wxbx3kiXggCiWgCCGsKDMaZJ7ExKeWj8caApOboVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f467u6UK; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f467u6UK"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-594270ec7f9so15324959e87.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jan 2026 03:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767612590; x=1768217390; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jT80HiGsZ94KHLXWj8nhFiGMKafnIFxWZMCmPRInK+8=;
        b=f467u6UKPjBME1xpntbSW50gE+jFu8CSNXTHsCrSjQRQcbb/G/zMTtjtssRobvvmu+
         TbersijHM4fVn/zqWcuP6LEIC46l2C+geppOLgnBNJTxVO8zo30OuBvaU5U0+9dj4MhE
         qPvLv0CnZuplsHJjFct6fqwprXdjpZY70LGv75QSPcsvRNg7z48bFzf5IGGIMuJxKUyc
         6+lPKueSi9Va9ehk0vEC1AMLZ+iBvJfdEFLopcox6MkPMFnBECbuxgEg/ZsLIqF9RFd2
         GVAakF0yMjUCmjKgwQbHBCkJw2sWWhINXJcvLVyncCbd7z5e/znifQHMwLGUVGnDKp8U
         Cw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767612590; x=1768217390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jT80HiGsZ94KHLXWj8nhFiGMKafnIFxWZMCmPRInK+8=;
        b=q8kJXd6NNbjofvPxif58wKTtASPnllb6XVpt1vmZavmo3ShIaEao1D/5SLUQX37aMq
         Z/HPwzNQBj8XjQ6jxoAZh3uOydnqrbKlG+ezev5Ng/KgcMvMmd4BV7ZDjZP2eR9Eo46F
         30f5nCOTcSPQWRjvq4Swqe+3njIDBN1wKpwP5h2EG2Ns9j47OSqZKW8MndQblpnugOl9
         igsd5sLohjtYc0WN/dLYgs0sKKpmMXxV/u9VCNpLgOKGBGeG2uXGGJ2kHEFkWRVLCO3d
         advIH045nTPAOFyuxFjKynLVfGbK5Q7zwBcNMFi7DGTwMs9BjvUDPznPXBUukaSUFLl+
         rpaA==
X-Gm-Message-State: AOJu0YwDg5MmeCDiL7OAYVszL6LHG17at9lYUEsuXdQPBGYhDOzqes+V
	oBP8MIehR/TO1FW+G7LmONGGMaTr0Hqzuola76DDnHmcR9LEHxJn9ZiZY1lbPfrHJ/bfdUZcZxW
	4VRfSDCY4sb71/u9buDE2LYJ0xs8Z9TsvvTvMYF1rvA==
X-Gm-Gg: AY/fxX4Of5zHpjCLkTpoR6QoU7KY7CoIskKjA8bOslF1sxufCKzv22T/pqLolOrJRS/
	1fQbXZlORlizds0GUSO2Krkn95wM+Eepz/eXYvwrrXzeenOjoKZCG1GklmEZhDvhgJWWyHA0dde
	pO9kBp54YOiKA48Rpdc3+Mj/eegW9nA1aB7JxPPbTux347fKhVaOwNFGFmCuCbOWvZ1dQrcaK5O
	ds2YPAPOlzictyYMyQnjCdFgE4fwmwBIriQiqSBTP7ahDMbc5XE0Yx5RcvGqYSqdB9IGhljy6eJ
	tPxA4NeQs9oxVpLczPkym0QehHBXo5Su1N9WRgY=
X-Google-Smtp-Source: AGHT+IE9akYpq0f59nVCFGoU3ntP5OyeIMe8Sz39dRPuCDTd9RNDgsLCXmw0J+nQ77y53tFj8kwkpNotGXXU3B3MdRY=
X-Received: by 2002:a05:6512:234b:b0:59a:123e:69ab with SMTP id
 2adb3069b0e04-59a17d08c20mr17697553e87.10.1767612590065; Mon, 05 Jan 2026
 03:29:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601021217.PPsDsiqO-lkp@intel.com>
In-Reply-To: <202601021217.PPsDsiqO-lkp@intel.com>
From: Filipe Manana <fdmanana@suse.com>
Date: Mon, 5 Jan 2026 11:29:39 +0000
X-Gm-Features: AQt7F2pgfbSlC8-QXX0NPMQQJL09nHRkKbvYkx8QPZJohYVr6Veypgm3QfDX0_w
Message-ID: <CAKisOQG=gLF=ac-70r0w3Z_oNnW=JBB2c6ObFwmHz8O-7PRzZw@mail.gmail.com>
Subject: Re: fs/btrfs/ordered-data.c:215:5-11: ERROR: allocation function on
 line 173 returns NULL not ERR_PTR on failure
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	David Sterba <dsterba@suse.com>, Boris Burkov <boris@bur.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 2, 2026 at 4:10=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
> commit: 08c649a5637371cb6bf8f3e974323cf59a7f434b btrfs: check we grabbed =
inode reference when allocating an ordered extent
> date:   8 months ago
> config: arm-randconfig-r051-20251231 (https://download.01.org/0day-ci/arc=
hive/20260102/202601021217.PPsDsiqO-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8=
6b9f90b9574b3a7d15d28a91f6316459dcfa046)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601021217.PPsDsiqO-lkp=
@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
> >> fs/btrfs/ordered-data.c:215:5-11: ERROR: allocation function on line 1=
73 returns NULL not ERR_PTR on failure

False alarm.
The allocation function does indeed return NULL, but if that's the
case we set 'entry' to ERR_PTR(-ENOMEM) in line 175.
The only other error path sets entry to ERR_PTR(-ESTALE).

So it's perfectly fine to test for IS_ERR(entry) at line 215.

Thanks.

>
> vim +215 fs/btrfs/ordered-data.c
>
>    147
>    148  static struct btrfs_ordered_extent *alloc_ordered_extent(
>    149                          struct btrfs_inode *inode, u64 file_offse=
t, u64 num_bytes,
>    150                          u64 ram_bytes, u64 disk_bytenr, u64 disk_=
num_bytes,
>    151                          u64 offset, unsigned long flags, int comp=
ress_type)
>    152  {
>    153          struct btrfs_ordered_extent *entry;
>    154          int ret;
>    155          u64 qgroup_rsv =3D 0;
>    156          const bool is_nocow =3D (flags &
>    157                 ((1U << BTRFS_ORDERED_NOCOW) | (1U << BTRFS_ORDERE=
D_PREALLOC)));
>    158
>    159          if (is_nocow) {
>    160                  /* For nocow write, we can release the qgroup rsv=
 right now */
>    161                  ret =3D btrfs_qgroup_free_data(inode, NULL, file_=
offset, num_bytes, &qgroup_rsv);
>    162                  if (ret < 0)
>    163                          return ERR_PTR(ret);
>    164          } else {
>    165                  /*
>    166                   * The ordered extent has reserved qgroup space, =
release now
>    167                   * and pass the reserved number for qgroup_record=
 to free.
>    168                   */
>    169                  ret =3D btrfs_qgroup_release_data(inode, file_off=
set, num_bytes, &qgroup_rsv);
>    170                  if (ret < 0)
>    171                          return ERR_PTR(ret);
>    172          }
>  > 173          entry =3D kmem_cache_zalloc(btrfs_ordered_extent_cache, G=
FP_NOFS);
>    174          if (!entry) {
>    175                  entry =3D ERR_PTR(-ENOMEM);
>    176                  goto out;
>    177          }
>    178
>    179          entry->file_offset =3D file_offset;
>    180          entry->num_bytes =3D num_bytes;
>    181          entry->ram_bytes =3D ram_bytes;
>    182          entry->disk_bytenr =3D disk_bytenr;
>    183          entry->disk_num_bytes =3D disk_num_bytes;
>    184          entry->offset =3D offset;
>    185          entry->bytes_left =3D num_bytes;
>    186          if (WARN_ON_ONCE(!igrab(&inode->vfs_inode))) {
>    187                  kmem_cache_free(btrfs_ordered_extent_cache, entry=
);
>    188                  entry =3D ERR_PTR(-ESTALE);
>    189                  goto out;
>    190          }
>    191          entry->inode =3D inode;
>    192          entry->compress_type =3D compress_type;
>    193          entry->truncated_len =3D (u64)-1;
>    194          entry->qgroup_rsv =3D qgroup_rsv;
>    195          entry->flags =3D flags;
>    196          refcount_set(&entry->refs, 1);
>    197          init_waitqueue_head(&entry->wait);
>    198          INIT_LIST_HEAD(&entry->list);
>    199          INIT_LIST_HEAD(&entry->log_list);
>    200          INIT_LIST_HEAD(&entry->root_extent_list);
>    201          INIT_LIST_HEAD(&entry->work_list);
>    202          INIT_LIST_HEAD(&entry->bioc_list);
>    203          init_completion(&entry->completion);
>    204
>    205          /*
>    206           * We don't need the count_max_extents here, we can assum=
e that all of
>    207           * that work has been done at higher layers, so this is t=
ruly the
>    208           * smallest the extent is going to get.
>    209           */
>    210          spin_lock(&inode->lock);
>    211          btrfs_mod_outstanding_extents(inode, 1);
>    212          spin_unlock(&inode->lock);
>    213
>    214  out:
>  > 215          if (IS_ERR(entry) && !is_nocow)
>    216                  btrfs_qgroup_free_refroot(inode->root->fs_info,
>    217                                            btrfs_root_id(inode->ro=
ot),
>    218                                            qgroup_rsv, BTRFS_QGROU=
P_RSV_DATA);
>    219
>    220          return entry;
>    221  }
>    222
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

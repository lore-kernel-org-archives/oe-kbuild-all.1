Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963779;
	b=QidbH8N8JYMTL2EXuI5DWF3xXPD2gvg8wydJPxbxVWrCZia0kaK6fW02wzoA41GVoLbr
	 zp5LfSyJBDYPInbLn/ZdPCpOCJlwXBCqW4B6TkYYUUyaXN4mmlK/0aJ0Ncj7cq7F/NbNt
	 mngABevSMpKTTAKPyQcc8zBmfjSwsS8ADYxOkvUZgc9oBq2Pa5DEY0wf7ww18mkQM0T36
	 8SUVF+kHP+gr1V73ZW4xPQkelD/UtX5Vk9+XB1wGCN+YxU2Z/uN2J8C4qAFL9/Bn2oCrW
	 MMCP/lfXK+ZL3pwcFOrckbXKIxIjZ2u+iaP48nN8qBGiO9P3l6jYwKJDYmRNMwe0aLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963779;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=SYzdm638AtOqbdMEy6crc/7BV8WOy+IdAY5f9s4lF7k=;
	b=OF/hMXnovysqayCTXt8U3GKC6j9ZIcsrvTyfK4064sepOWdyyCwst6TJeO6koY0ZwvjG
	 LWQAymtFPlK3VUeQOo1uXrOfRkVWH5TOhTuiSETyFk2Pzjhs6rdnOyG+vjDYRXcsakAB6
	 XJiSDHTg5eT7gt6R+uWoI9mDuartzUymqFbfoI60I9l04Kt8YKwOdW06hFyu4QZ3w0Xw+
	 fjYtP0qTEqqeqjt8+p2gQByuxbbq/TqTF6ar8n1BIMQlZQUI4PN343MyuyVhxBf8VwPPv
	 Usw31D4Gc6auKEgGkgEyEB0RcmCwL5895TSYNXDMZwwEomEVElcGC9+xjsuva7xekqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LcxlFS+0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A820D606D82C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 11:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LcxlFS+0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8E61F008A4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 11:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793963778;
	bh=SYzdm638AtOqbdMEy6crc/7BV8WOy+IdAY5f9s4lF7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LcxlFS+0lTpQ96OWyxV0WJ3eJjS7xPVwpgmkw+U/n+lCHUb1RQAQhCPYIVEPRvOn/
	 vc7y4t+gC40p3Aa3BZcSgGjb9pMYHwbFiVEMg9JwhmeiID/RlK+jhYMuZRz0vzAhew
	 aGR97JO2p7zqcjU4q+8Jl9Cus9yZ3eMt9Z+/JsltGlS0bf/IUKNUxhyzIqZfgDzER3
	 U+c0bcAvjO77n19rC+asUzNJZp/s15nAi3Wg2vNC4Si4iwl1e38OPyeIktqXFm6l9P
	 ko/+9qmxln/+3R7LulzM8DUzNKCI2xuh2y2hlIaXq1FY82MM947V0UjaOoRa00+ut0
	 F+gBWYn+780RQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso83234966b.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 06 Nov 2026 03:16:18 -0800 (PST)
X-Gm-Message-State: APuU4Z9Xl4vU3OcD9KmoBkudMvJEUrf0AOr+2dv0UdmItDvs1TU79qh2
	sRXYxI/VILcqek2lEUBZk43hPrwbk8iPKUWhhjauHRizU6E80invoFTgk3xRuFwdHPa8df6WMtC
	alVz1AhByRUohMdfNV32zN3qJVNsRfjk=
X-Received: by 2002:a17:907:97cb:b0:c46:87f9:f5f7 with SMTP id
 a640c23a62f3a-c4d35485cb6mr179552966b.17.1793963776714; Fri, 06 Nov 2026
 03:16:16 -0800 (PST)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <598c2f18-21f3-d252-98da-e9288356c480@inria.fr>
In-Reply-To: <598c2f18-21f3-d252-98da-e9288356c480@inria.fr>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 6 Nov 2026 20:16:03 +0900
X-Gmail-Original-Message-ID: <CAKYAXd90TcYaXg9vsrOyDnqMMyEmkJTQgOC_YV6Car5pj83H1A@mail.gmail.com>
X-Gm-Features: AclHuK8ACdTCnzeMfWQvOFJ0e_u7Fvi2v5eOZI4i1_FDDKBy2MHsxA2w5sE8xKQ
Message-ID: <CAKYAXd90TcYaXg9vsrOyDnqMMyEmkJTQgOC_YV6Car5pj83H1A@mail.gmail.com>
Subject: Re: fs/ntfs/iomap.c:481:14-15: WARNING kmalloc is used to allocate
 this memory at line 460 (fwd)
To: Julia Lawall <julia.lawall@inria.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will check it.
Thanks for forwarding this to me!

On Fri, Nov 6, 2026 at 7:23=E2=80=AFPM Julia Lawall <julia.lawall@inria.fr>=
 wrote:
>
> ---------- Forwarded message ----------
> Date: Fri, 06 Nov 2026 07:59:12 +0100
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: fs/ntfs/iomap.c:481:14-15: WARNING kmalloc is used to allocate t=
his
>     memory at line 460
>
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: Namjae Jeon <linkinjeon@kernel.org>
> CC: Amir Goldstein <amir73il@gmail.com>
> CC: Christoph Hellwig <hch@lst.de>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   f66469d9905b39d2c260a15d7d6db450f4db67c1
> commit: 47503f989736d6c4c9f8bfca1c28d267473ccd4b ntfs: add Kconfig and Ma=
kefile
> date:   9 months ago
> :::::: branch date: 5 hours ago
> :::::: commit date: 9 months ago
> config: loongarch-randconfig-r2105-20261104 (https://download.01.org/0day=
-ci/archive/20261106/202611060717.0Na5FqQR-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e=
2e3d6c39cfebec9eace23629a5a103df2c79ba6)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Fixes: 47503f989736 ("ntfs: add Kconfig and Makefile")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202611060717.0Na5FqQR-lkp@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
> >> fs/ntfs/iomap.c:481:14-15: WARNING kmalloc is used to allocate this me=
mory at line 460
>
> vim +481 fs/ntfs/iomap.c
>
> b041ca562526b3c Namjae Jeon 2026-02-13  378
> b041ca562526b3c Namjae Jeon 2026-02-13  379  static int ntfs_write_simple=
_iomap_begin_non_resident(struct inode *inode, loff_t offset,
> b041ca562526b3c Namjae Jeon 2026-02-13  380                              =
                     loff_t length, struct iomap *iomap)
> b041ca562526b3c Namjae Jeon 2026-02-13  381  {
> b041ca562526b3c Namjae Jeon 2026-02-13  382     struct ntfs_inode *ni =3D=
 NTFS_I(inode);
> b041ca562526b3c Namjae Jeon 2026-02-13  383     struct ntfs_volume *vol =
=3D ni->vol;
> b041ca562526b3c Namjae Jeon 2026-02-13  384     loff_t vcn_ofs, rl_length=
;
> b041ca562526b3c Namjae Jeon 2026-02-13  385     struct runlist_element *r=
l, *rlc;
> b041ca562526b3c Namjae Jeon 2026-02-13  386     bool is_retry =3D false;
> b041ca562526b3c Namjae Jeon 2026-02-13  387     int err;
> b041ca562526b3c Namjae Jeon 2026-02-13  388     s64 vcn, lcn;
> b041ca562526b3c Namjae Jeon 2026-02-13  389     s64 max_clu_count =3D
> b041ca562526b3c Namjae Jeon 2026-02-13  390             ntfs_bytes_to_clu=
ster(vol, round_up(length, vol->cluster_size));
> b041ca562526b3c Namjae Jeon 2026-02-13  391
> b041ca562526b3c Namjae Jeon 2026-02-13  392     vcn =3D ntfs_bytes_to_clu=
ster(vol, offset);
> b041ca562526b3c Namjae Jeon 2026-02-13  393     vcn_ofs =3D ntfs_bytes_to=
_cluster_off(vol, offset);
> b041ca562526b3c Namjae Jeon 2026-02-13  394
> b041ca562526b3c Namjae Jeon 2026-02-13  395     down_read(&ni->runlist.lo=
ck);
> b041ca562526b3c Namjae Jeon 2026-02-13  396     rl =3D ni->runlist.rl;
> b041ca562526b3c Namjae Jeon 2026-02-13  397     if (!rl) {
> b041ca562526b3c Namjae Jeon 2026-02-13  398             up_read(&ni->runl=
ist.lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  399             err =3D ntfs_map_=
runlist(ni, vcn);
> b041ca562526b3c Namjae Jeon 2026-02-13  400             if (err) {
> b041ca562526b3c Namjae Jeon 2026-02-13  401                     mutex_unl=
ock(&ni->mrec_lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  402                     return -E=
NOENT;
> b041ca562526b3c Namjae Jeon 2026-02-13  403             }
> b041ca562526b3c Namjae Jeon 2026-02-13  404             down_read(&ni->ru=
nlist.lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  405             rl =3D ni->runlis=
t.rl;
> b041ca562526b3c Namjae Jeon 2026-02-13  406     }
> b041ca562526b3c Namjae Jeon 2026-02-13  407     up_read(&ni->runlist.lock=
);
> b041ca562526b3c Namjae Jeon 2026-02-13  408
> b041ca562526b3c Namjae Jeon 2026-02-13  409     down_write(&ni->runlist.l=
ock);
> b041ca562526b3c Namjae Jeon 2026-02-13  410  remap_rl:
> b041ca562526b3c Namjae Jeon 2026-02-13  411     /* Seek to element contai=
ning target vcn. */
> b041ca562526b3c Namjae Jeon 2026-02-13  412     rl =3D __ntfs_attr_find_v=
cn_nolock(&ni->runlist, vcn);
> b041ca562526b3c Namjae Jeon 2026-02-13  413     if (IS_ERR(rl)) {
> b041ca562526b3c Namjae Jeon 2026-02-13  414             up_write(&ni->run=
list.lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  415             mutex_unlock(&ni-=
>mrec_lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  416             return -EIO;
> b041ca562526b3c Namjae Jeon 2026-02-13  417     }
> b041ca562526b3c Namjae Jeon 2026-02-13  418     lcn =3D ntfs_rl_vcn_to_lc=
n(rl, vcn);
> b041ca562526b3c Namjae Jeon 2026-02-13  419
> b041ca562526b3c Namjae Jeon 2026-02-13  420     if (lcn <=3D LCN_RL_NOT_M=
APPED && is_retry =3D=3D false) {
> b041ca562526b3c Namjae Jeon 2026-02-13  421             is_retry =3D true=
;
> b041ca562526b3c Namjae Jeon 2026-02-13  422             if (!ntfs_map_run=
list_nolock(ni, vcn, NULL)) {
> b041ca562526b3c Namjae Jeon 2026-02-13  423                     rl =3D ni=
->runlist.rl;
> b041ca562526b3c Namjae Jeon 2026-02-13  424                     goto rema=
p_rl;
> b041ca562526b3c Namjae Jeon 2026-02-13  425             }
> b041ca562526b3c Namjae Jeon 2026-02-13  426     }
> b041ca562526b3c Namjae Jeon 2026-02-13  427
> b041ca562526b3c Namjae Jeon 2026-02-13  428     max_clu_count =3D min(max=
_clu_count, rl->length - (vcn - rl->vcn));
> b041ca562526b3c Namjae Jeon 2026-02-13  429     if (max_clu_count =3D=3D =
0) {
> b041ca562526b3c Namjae Jeon 2026-02-13  430             ntfs_error(inode-=
>i_sb,
> b041ca562526b3c Namjae Jeon 2026-02-13  431                             "=
runlist(vcn : %lld, length : %lld) is corrupted\n",
> b041ca562526b3c Namjae Jeon 2026-02-13  432                             r=
l->vcn, rl->length);
> b041ca562526b3c Namjae Jeon 2026-02-13  433             up_write(&ni->run=
list.lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  434             mutex_unlock(&ni-=
>mrec_lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  435             return -EIO;
> b041ca562526b3c Namjae Jeon 2026-02-13  436     }
> b041ca562526b3c Namjae Jeon 2026-02-13  437
> b041ca562526b3c Namjae Jeon 2026-02-13  438     iomap->bdev =3D inode->i_=
sb->s_bdev;
> b041ca562526b3c Namjae Jeon 2026-02-13  439     iomap->offset =3D offset;
> b041ca562526b3c Namjae Jeon 2026-02-13  440
> b041ca562526b3c Namjae Jeon 2026-02-13  441     if (lcn <=3D LCN_DELALLOC=
) {
> b041ca562526b3c Namjae Jeon 2026-02-13  442             if (lcn < LCN_DEL=
ALLOC) {
> b041ca562526b3c Namjae Jeon 2026-02-13  443                     max_clu_c=
ount =3D
> b041ca562526b3c Namjae Jeon 2026-02-13  444                             n=
tfs_available_clusters_count(vol, max_clu_count);
> b041ca562526b3c Namjae Jeon 2026-02-13  445                     if (max_c=
lu_count < 0) {
> b041ca562526b3c Namjae Jeon 2026-02-13  446                             e=
rr =3D max_clu_count;
> b041ca562526b3c Namjae Jeon 2026-02-13  447                             u=
p_write(&ni->runlist.lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  448                             m=
utex_unlock(&ni->mrec_lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  449                             r=
eturn err;
> b041ca562526b3c Namjae Jeon 2026-02-13  450                     }
> b041ca562526b3c Namjae Jeon 2026-02-13  451             }
> b041ca562526b3c Namjae Jeon 2026-02-13  452
> b041ca562526b3c Namjae Jeon 2026-02-13  453             iomap->type =3D I=
OMAP_DELALLOC;
> b041ca562526b3c Namjae Jeon 2026-02-13  454             iomap->addr =3D I=
OMAP_NULL_ADDR;
> b041ca562526b3c Namjae Jeon 2026-02-13  455
> b041ca562526b3c Namjae Jeon 2026-02-13  456             if (lcn <=3D LCN_=
HOLE) {
> b041ca562526b3c Namjae Jeon 2026-02-13  457                     size_t ne=
w_rl_count;
> b041ca562526b3c Namjae Jeon 2026-02-13  458
> b041ca562526b3c Namjae Jeon 2026-02-13  459                     rlc =3D k=
malloc(sizeof(struct runlist_element) * 2,
> b041ca562526b3c Namjae Jeon 2026-02-13 @460                              =
       GFP_NOFS);
> b041ca562526b3c Namjae Jeon 2026-02-13  461                     if (!rlc)=
 {
> b041ca562526b3c Namjae Jeon 2026-02-13  462                             u=
p_write(&ni->runlist.lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  463                             m=
utex_unlock(&ni->mrec_lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  464                             r=
eturn -ENOMEM;
> b041ca562526b3c Namjae Jeon 2026-02-13  465                     }
> b041ca562526b3c Namjae Jeon 2026-02-13  466
> b041ca562526b3c Namjae Jeon 2026-02-13  467                     rlc->vcn =
=3D vcn;
> b041ca562526b3c Namjae Jeon 2026-02-13  468                     rlc->lcn =
=3D LCN_DELALLOC;
> b041ca562526b3c Namjae Jeon 2026-02-13  469                     rlc->leng=
th =3D max_clu_count;
> b041ca562526b3c Namjae Jeon 2026-02-13  470
> b041ca562526b3c Namjae Jeon 2026-02-13  471                     rlc[1].vc=
n =3D vcn + max_clu_count;
> b041ca562526b3c Namjae Jeon 2026-02-13  472                     rlc[1].lc=
n =3D LCN_RL_NOT_MAPPED;
> b041ca562526b3c Namjae Jeon 2026-02-13  473                     rlc[1].le=
ngth =3D 0;
> b041ca562526b3c Namjae Jeon 2026-02-13  474
> b041ca562526b3c Namjae Jeon 2026-02-13  475                     rl =3D nt=
fs_runlists_merge(&ni->runlist, rlc, 0,
> b041ca562526b3c Namjae Jeon 2026-02-13  476                              =
       &new_rl_count);
> b041ca562526b3c Namjae Jeon 2026-02-13  477                     if (IS_ER=
R(rl)) {
> b041ca562526b3c Namjae Jeon 2026-02-13  478                             n=
tfs_error(vol->sb, "Failed to merge runlists");
> b041ca562526b3c Namjae Jeon 2026-02-13  479                             u=
p_write(&ni->runlist.lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  480                             m=
utex_unlock(&ni->mrec_lock);
> b041ca562526b3c Namjae Jeon 2026-02-13 @481                             k=
vfree(rlc);
> b041ca562526b3c Namjae Jeon 2026-02-13  482                             r=
eturn PTR_ERR(rl);
> b041ca562526b3c Namjae Jeon 2026-02-13  483                     }
> b041ca562526b3c Namjae Jeon 2026-02-13  484
> b041ca562526b3c Namjae Jeon 2026-02-13  485                     ni->runli=
st.rl =3D rl;
> b041ca562526b3c Namjae Jeon 2026-02-13  486                     ni->runli=
st.count =3D new_rl_count;
> b041ca562526b3c Namjae Jeon 2026-02-13  487                     ni->i_dea=
lloc_clusters +=3D max_clu_count;
> b041ca562526b3c Namjae Jeon 2026-02-13  488             }
> b041ca562526b3c Namjae Jeon 2026-02-13  489             up_write(&ni->run=
list.lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  490             mutex_unlock(&ni-=
>mrec_lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  491
> b041ca562526b3c Namjae Jeon 2026-02-13  492             if (lcn < LCN_DEL=
ALLOC)
> b041ca562526b3c Namjae Jeon 2026-02-13  493                     ntfs_hold=
_dirty_clusters(vol, max_clu_count);
> b041ca562526b3c Namjae Jeon 2026-02-13  494
> b041ca562526b3c Namjae Jeon 2026-02-13  495             rl_length =3D ntf=
s_cluster_to_bytes(vol, max_clu_count);
> b041ca562526b3c Namjae Jeon 2026-02-13  496             if (length > rl_l=
ength - vcn_ofs)
> b041ca562526b3c Namjae Jeon 2026-02-13  497                     iomap->le=
ngth =3D rl_length - vcn_ofs;
> b041ca562526b3c Namjae Jeon 2026-02-13  498             else
> b041ca562526b3c Namjae Jeon 2026-02-13  499                     iomap->le=
ngth =3D length;
> b041ca562526b3c Namjae Jeon 2026-02-13  500
> b041ca562526b3c Namjae Jeon 2026-02-13  501             iomap->flags =3D =
IOMAP_F_NEW;
> b041ca562526b3c Namjae Jeon 2026-02-13  502             if (lcn <=3D LCN_=
HOLE) {
> b041ca562526b3c Namjae Jeon 2026-02-13  503                     loff_t en=
d =3D offset + length;
> b041ca562526b3c Namjae Jeon 2026-02-13  504
> b041ca562526b3c Namjae Jeon 2026-02-13  505                     if (vcn_o=
fs || ((vol->cluster_size > iomap->length) &&
> b041ca562526b3c Namjae Jeon 2026-02-13  506                              =
       end < ni->initialized_size)) {
> b041ca562526b3c Namjae Jeon 2026-02-13  507                             l=
off_t z_start, z_end;
> b041ca562526b3c Namjae Jeon 2026-02-13  508
> b041ca562526b3c Namjae Jeon 2026-02-13  509                             z=
_start =3D vcn << vol->cluster_size_bits;
> b041ca562526b3c Namjae Jeon 2026-02-13  510                             z=
_end =3D min_t(loff_t, z_start + vol->cluster_size,
> b041ca562526b3c Namjae Jeon 2026-02-13  511                              =
             i_size_read(inode));
> b041ca562526b3c Namjae Jeon 2026-02-13  512                             i=
f (z_end > z_start)
> b041ca562526b3c Namjae Jeon 2026-02-13  513                              =
       err =3D ntfs_zero_range(inode,
> b041ca562526b3c Namjae Jeon 2026-02-13  514                              =
                             z_start,
> b041ca562526b3c Namjae Jeon 2026-02-13  515                              =
                             z_end - z_start);
> b041ca562526b3c Namjae Jeon 2026-02-13  516                     }
> b041ca562526b3c Namjae Jeon 2026-02-13  517                     if ((!err=
 || err =3D=3D -EPERM) &&
> b041ca562526b3c Namjae Jeon 2026-02-13  518                         max_c=
lu_count > 1 &&
> b041ca562526b3c Namjae Jeon 2026-02-13  519                         (ioma=
p->length & vol->cluster_size_mask &&
> b041ca562526b3c Namjae Jeon 2026-02-13  520                          end =
< ni->initialized_size)) {
> b041ca562526b3c Namjae Jeon 2026-02-13  521                             l=
off_t z_start, z_end;
> b041ca562526b3c Namjae Jeon 2026-02-13  522
> b041ca562526b3c Namjae Jeon 2026-02-13  523                             z=
_start =3D (vcn + max_clu_count - 1) <<
> b041ca562526b3c Namjae Jeon 2026-02-13  524                              =
       vol->cluster_size_bits;
> b041ca562526b3c Namjae Jeon 2026-02-13  525                             z=
_end =3D min_t(loff_t, z_start + vol->cluster_size,
> b041ca562526b3c Namjae Jeon 2026-02-13  526                              =
             i_size_read(inode));
> b041ca562526b3c Namjae Jeon 2026-02-13  527                             i=
f (z_end > z_start)
> b041ca562526b3c Namjae Jeon 2026-02-13  528                              =
       err =3D ntfs_zero_range(inode,
> b041ca562526b3c Namjae Jeon 2026-02-13  529                              =
                             z_start,
> b041ca562526b3c Namjae Jeon 2026-02-13  530                              =
                             z_end - z_start);
> b041ca562526b3c Namjae Jeon 2026-02-13  531                     }
> b041ca562526b3c Namjae Jeon 2026-02-13  532
> b041ca562526b3c Namjae Jeon 2026-02-13  533                     if (err =
=3D=3D -EPERM)
> b041ca562526b3c Namjae Jeon 2026-02-13  534                             e=
rr =3D 0;
> b041ca562526b3c Namjae Jeon 2026-02-13  535                     if (err) =
{
> b041ca562526b3c Namjae Jeon 2026-02-13  536                             n=
tfs_release_dirty_clusters(vol, max_clu_count);
> b041ca562526b3c Namjae Jeon 2026-02-13  537                             r=
eturn err;
> b041ca562526b3c Namjae Jeon 2026-02-13  538                     }
> b041ca562526b3c Namjae Jeon 2026-02-13  539             }
> b041ca562526b3c Namjae Jeon 2026-02-13  540     } else {
> b041ca562526b3c Namjae Jeon 2026-02-13  541             up_write(&ni->run=
list.lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  542             mutex_unlock(&ni-=
>mrec_lock);
> b041ca562526b3c Namjae Jeon 2026-02-13  543
> b041ca562526b3c Namjae Jeon 2026-02-13  544             iomap->type =3D I=
OMAP_MAPPED;
> b041ca562526b3c Namjae Jeon 2026-02-13  545             iomap->addr =3D n=
tfs_cluster_to_bytes(vol, lcn) + vcn_ofs;
> b041ca562526b3c Namjae Jeon 2026-02-13  546
> b041ca562526b3c Namjae Jeon 2026-02-13  547             rl_length =3D ntf=
s_cluster_to_bytes(vol, max_clu_count);
> b041ca562526b3c Namjae Jeon 2026-02-13  548             if (length > rl_l=
ength - vcn_ofs)
> b041ca562526b3c Namjae Jeon 2026-02-13  549                     iomap->le=
ngth =3D rl_length - vcn_ofs;
> b041ca562526b3c Namjae Jeon 2026-02-13  550             else
> b041ca562526b3c Namjae Jeon 2026-02-13  551                     iomap->le=
ngth =3D length;
> b041ca562526b3c Namjae Jeon 2026-02-13  552     }
> b041ca562526b3c Namjae Jeon 2026-02-13  553
> b041ca562526b3c Namjae Jeon 2026-02-13  554     return 0;
> b041ca562526b3c Namjae Jeon 2026-02-13  555  }
> b041ca562526b3c Namjae Jeon 2026-02-13  556
>
> :::::: The code at line 481 was first introduced by commit
> :::::: b041ca562526b3c4a71b41b80ba5e520eac636ad ntfs: update iomap and ad=
dress space operations
>
> :::::: TO: Namjae Jeon <linkinjeon@kernel.org>
> :::::: CC: Namjae Jeon <linkinjeon@kernel.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

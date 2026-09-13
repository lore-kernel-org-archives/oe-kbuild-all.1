Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A143905F5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326747; cv=none; b=H3Wa1xwjkHaAWl3s2OOmbebusv3//9faQxa+O6M/pIJ5LmTuEkaMtT8rVn74Jk5RWZnGN0pH2Gdu5mlmFvv2pKUet0atollIbmauFELy6Ci/y1JuXr3CY0aAxLwcmd48hyaKk6a1AZULKOUdUhxF4ZOzGC1slC0OcWTsFlZPuCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326747; c=relaxed/simple;
	bh=m2KmqRZJEACTILb20yIKZaaT18vPWU+MpisT+rdzX/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PzClPWdLCezhT8apidDxm2daEhvjaQThnObxQlL/vao+6sfzddUlSfqx/lg5CZ6Z/xOHxe+e0QlFVjIOkp8uokNmByyIRE56tKrirmpA20TsWtJCQbltDJDNzQAH0pfiXh3L9e7HmeQVbqDVi4b137GUhinquI9uHEOx5i1Ka3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RYrJx3MU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYrJx3MU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789326743; x=1820862743;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=m2KmqRZJEACTILb20yIKZaaT18vPWU+MpisT+rdzX/o=;
  b=RYrJx3MUfgD7T/eMD2DIM5s8XeWkZMkavjaVhfwzhN7CcFmRi5yAbkot
   5e4vUJVXuhkpg0CE8jIT4VEkV3raYVMcei/Ynb6OINHuLPKC4yrxspvi5
   adPzb9lqmvke/rU52KlqKQ+nOaxNZqJkX/bcxZiCdrSa0scw+WConrF6+
   qVWqvl/JkMr3fdDdrRA8XY+xLWKUQF3zQFucAPW9uOUgxo8bSV/CFh9nv
   ottC+AlFdwMoRncQDpVl19JVVZQwgvBWkLC0yvYvYVCGLcgyqrd/v5uC4
   XgIoaXMNL8WX9IgqA/f8U8oNFszWz3GIFoUyq65Encdv5CVxNsuDkz9Hu
   Q==;
X-CSE-ConnectionGUID: W5wsDyMnQ8KK85yMZiYeAQ==
X-CSE-MsgGUID: CScqByNuToWTL/QwG/nFIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="88638282"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="88638282"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 12:12:22 -0700
X-CSE-ConnectionGUID: DqjFDwBfQfC6TJBFU7L6WQ==
X-CSE-MsgGUID: L6uek6sjR3m0SgEu74aLyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="269151493"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 13 Sep 2026 12:12:20 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5pcf-000000001gp-1HFk;
	Sun, 13 Sep 2026 19:12:17 +0000
Date: Sun, 13 Sep 2026 21:11:16 +0200
From: kernel test robot <lkp@intel.com>
To: ProofOfConcept <poc@bcachefs.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 77/111]
 fs/bcachefs/data/update.c:474:1: warning: the frame size of 1552 bytes is
 larger than 1536 bytes
Message-ID: <202609132106.9aWSL5Kq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: b5b58a49569e8e154ee1e41ee759bd253e7d9fc4 [77/111] bcachefs: move bc=
h2_bkey_set_needs_reconcile() into the extent trigger
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/202609=
13/202609132106.9aWSL5Kq-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260913/202609132106.9aWSL5Kq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609132106.9aWSL5Kq-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/update.c: In function 'data_update_index_update_key':
>> fs/bcachefs/data/update.c:474:1: warning: the frame size of 1552 bytes i=
s larger than 1536 bytes [-Wframe-larger-than=3D]
     474 | }
         | ^


vim +474 fs/bcachefs/data/update.c

235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  213 =
=20
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  214  s=
tatic int data_update_index_update_key(struct btree_trans *trans,
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  215  	=
				struct data_update *u,
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  216  	=
				struct btree_iter *iter)
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  217  {
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  218  	=
struct bch_fs *c =3D trans->c;
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  219  	=
struct bkey_s_c old =3D bkey_i_to_s_c(u->k.k);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  220 =
=20
4dcd1cae72912a fs/bcachefs/data_update.c Kent Overstreet 2022-11-14  221  	=
bch2_trans_begin(trans);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  222 =
=20
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  223  	=
struct bkey_s_c k =3D bkey_try(bch2_btree_iter_peek_slot(iter));
5945219ab7e9ac fs/bcachefs/data/update.c Kent Overstreet 2025-10-16  224 =
=20
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  225  	=
/* make a local copy, so that we can trace it after the transaction commit:=
  */
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  226  	=
k =3D bkey_i_to_s_c(errptr_try(bch2_bkey_make_mut_noupdate(trans, k)));
5945219ab7e9ac fs/bcachefs/data/update.c Kent Overstreet 2025-10-16  227 =
=20
09db8aab33e52c fs/bcachefs/data/update.c Kent Overstreet 2025-10-12  228  	=
/*
581f7e27bc9728 fs/bcachefs/data/update.c Kent Overstreet 2025-11-12  229  	=
 * We're calling set_needs_reconcile() on both @insert and @new,
09db8aab33e52c fs/bcachefs/data/update.c Kent Overstreet 2025-10-12  230  	=
 * and it can add a bch_extent_reconcile and additional
09db8aab33e52c fs/bcachefs/data/update.c Kent Overstreet 2025-10-12  231  	=
 * pointers to BCH_SB_MEMBER_INVALID if the extent is now
09db8aab33e52c fs/bcachefs/data/update.c Kent Overstreet 2025-10-12  232  	=
 * degraded due to option changes:
09db8aab33e52c fs/bcachefs/data/update.c Kent Overstreet 2025-10-12  233  	=
 */
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  234  	=
struct bkey_i_extent *new =3D bkey_i_to_extent(bch2_keylist_front(&u->op.in=
sert_keys));
b5b58a49569e8e fs/bcachefs/data/update.c ProofOfConcept  2026-05-05  235  	=
unsigned new_buf_u64s =3D new->k.u64s + 1 + BCH_REPLICAS_MAX;
b5b58a49569e8e fs/bcachefs/data/update.c ProofOfConcept  2026-05-05  236  	=
new =3D errptr_try(bch2_trans_kmalloc(trans, new_buf_u64s * sizeof(u64)));
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  237  	=
bkey_copy(&new->k_i, bch2_keylist_front(&u->op.insert_keys));
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  238 =
=20
b5b58a49569e8e fs/bcachefs/data/update.c ProofOfConcept  2026-05-05  239  	=
unsigned insert_buf_u64s =3D k.k->u64s + bkey_val_u64s(&new->k) + 1 + BCH_R=
EPLICAS_MAX;
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  240  	=
struct bkey_i *insert =3D errptr_try(bch2_trans_kmalloc(trans,
b5b58a49569e8e fs/bcachefs/data/update.c ProofOfConcept  2026-05-05  241  	=
					insert_buf_u64s * sizeof(u64)));
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  242  	=
bkey_reassemble(insert, k);
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  243 =
=20
e40c9a06251432 fs/bcachefs/data/update.c Kent Overstreet 2025-11-28  244  	=
bch2_cut_front(c, iter->pos,	&new->k_i);
e40c9a06251432 fs/bcachefs/data/update.c Kent Overstreet 2025-11-28  245  	=
bch2_cut_front(c, iter->pos,	insert);
e40c9a06251432 fs/bcachefs/data/update.c Kent Overstreet 2025-11-28  246  	=
bch2_cut_back(new->k.p,		insert);
e40c9a06251432 fs/bcachefs/data/update.c Kent Overstreet 2025-11-28  247  	=
bch2_cut_back(insert->k.p,	&new->k_i);
e40c9a06251432 fs/bcachefs/data/update.c Kent Overstreet 2025-11-28  248 =
=20
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  249  	=
struct bpos next_pos =3D insert->k.p;
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  250 =
=20
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  251  	=
if (!bch2_extents_match(c, k, old)) {
e40c9a06251432 fs/bcachefs/data/update.c Kent Overstreet 2025-11-28  252  	=
	count_data_update_key_fail(u, k, bkey_i_to_s_c(&new->k_i), insert, "no mat=
ch:");
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  253  	=
	bch2_btree_iter_set_pos(iter, next_pos);
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  254  	=
	return 0;
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  255  	}
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  256 =
=20
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  257  	=
unsigned ptrs_kill =3D ptr_mask_remap(c, old, u->opts.ptrs_kill,	bkey_i_to_=
s_c(insert));
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  258  	=
if (ptrs_kill) {
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  259  	=
	/* Don't replace non-cached replicas with cached: */
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  260  	=
	bool replacing_non_cached_replicas =3D false;
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  261  	=
	unsigned ptr_bit =3D 1;
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  262  	=
	bkey_for_each_ptr(bch2_bkey_ptrs_c(bkey_i_to_s_c(insert)), ptr) {
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  263  	=
		if (ptrs_kill & ptr_bit)
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  264  	=
			replacing_non_cached_replicas |=3D !ptr->cached;
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  265  	=
		ptr_bit <<=3D 1;
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  266  	=
	}
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  267 =
=20
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  268  	=
	if (replacing_non_cached_replicas)
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  269  	=
		bkey_for_each_ptr(bch2_bkey_ptrs_c(bkey_i_to_s_c(&new->k_i)), ptr)
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  270  	=
			if (ptr->cached) {
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  271  	=
				CLASS(bch_log_msg_ratelimited, msg)(c);
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  272  	=
				prt_printf(&msg.m, "data update tried to replace non cached data with c=
ached:\n");
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  273  	=
				data_update_key_to_text(&msg.m, u, k, bkey_i_to_s_c(&new->k_i),
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  274  	=
							insert);
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  275  	=
				return 0;
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  276  	=
			}
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  277  	}
ec2537c2c93df7 fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  278 =
=20
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  279  	=
if (!u->opts.no_devs_have) {
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  280  	=
	/*
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  281  	=
	 * Drop replicas in the existing extent that conflict with what
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  282  	=
	 * we just wrote - but only if they were explicitly specified in
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  283  	=
	 * ptrs_kill:
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  284  	=
	 * A replica that we just wrote might conflict with a replica
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  285  	=
	 * that we want to keep, due to racing with another move:
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  286  	=
	 */
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  287  	=
	unsigned ptrs_conflict =3D bkey_ptr_conflicts_mask(c, bkey_i_to_s_c(insert=
), bkey_i_to_s_c(&new->k_i)) &
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  288  	=
		ptr_mask_remap(c, old, u->opts.ptrs_kill, bkey_i_to_s_c(insert));
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  289  	=
	bch2_bkey_drop_ptrs_mask(c, insert, ptrs_conflict);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  290 =
=20
0cc51545ca6962 fs/bcachefs/data/update.c Kent Overstreet 2025-12-24  291 =
=20
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  292  	=
	/* Any conflicts that are left over were useless writes -
66e2788e68d1de fs/bcachefs/data/update.c ProofOfConcept  2026-03-25  293  	=
	 * perhaps due to a copygc race.
66e2788e68d1de fs/bcachefs/data/update.c ProofOfConcept  2026-03-25  294  	=
	 *
66e2788e68d1de fs/bcachefs/data/update.c ProofOfConcept  2026-03-25  295  	=
	 * But a new durable pointer doesn't conflict with a cached
66e2788e68d1de fs/bcachefs/data/update.c ProofOfConcept  2026-03-25  296  	=
	 * pointer on the same device =E2=80=94 it replaces it:
d7dd3fb84f05a0 fs/bcachefs/data_update.c Kent Overstreet 2023-01-07  297  	=
	 */
66e2788e68d1de fs/bcachefs/data/update.c ProofOfConcept  2026-03-25  298  	=
	ptrs_conflict =3D bkey_ptr_noncached_conflicts_mask(c, bkey_i_to_s_c(&new-=
>k_i), bkey_i_to_s_c(insert));
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  299  	=
	if (ptrs_conflict) {
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  300  	=
		event_add_trace(c, data_update_useless_write_fail,
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  301  	=
				k.k->size * hweight32(ptrs_conflict), buf, ({
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  302  	=
			ptr_bits_to_text(&buf, ptrs_conflict, "conflicted");
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  303  	=
			prt_printf(&buf, "wrote: ");
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  304  	=
			bch2_bkey_val_to_text(&buf, c, bkey_i_to_s_c(&new->k_i));
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  305  	=
			prt_newline(&buf);
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  306  	=
			bch2_data_update_to_text(&buf, u);
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  307  	=
		}));
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  308 =
=20
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  309  	=
		bch2_bkey_drop_ptrs_mask(c, &new->k_i, ptrs_conflict);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  310 =
=20
bb6c4b92fd8566 fs/bcachefs/data_update.c Kent Overstreet 2023-03-10  311  	=
		if (!bkey_val_u64s(&new->k)) {
e40c9a06251432 fs/bcachefs/data/update.c Kent Overstreet 2025-11-28  312  	=
			count_data_update_key_fail(u, k,
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  313  	=
						   bkey_i_to_s_c(bch2_keylist_front(&u->op.insert_keys)),
880d14d77ea984 fs/bcachefs/data_update.c Kent Overstreet 2025-09-27  314  	=
						   insert, "new replicas conflicted:");
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  315  	=
			bch2_btree_iter_advance(iter);
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  316  	=
			return 0;
bb6c4b92fd8566 fs/bcachefs/data_update.c Kent Overstreet 2023-03-10  317  	=
		}
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  318  	=
	}
66e2788e68d1de fs/bcachefs/data/update.c ProofOfConcept  2026-03-25  319  	}
66e2788e68d1de fs/bcachefs/data/update.c ProofOfConcept  2026-03-25  320 =
=20
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  321  	=
/*
66e2788e68d1de fs/bcachefs/data/update.c ProofOfConcept  2026-03-25  322  	=
 * Drop all conflicts from the existing extent, not the newly written
66e2788e68d1de fs/bcachefs/data/update.c ProofOfConcept  2026-03-25  323  	=
 * replicas:
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  324  	=
 *
66e2788e68d1de fs/bcachefs/data/update.c ProofOfConcept  2026-03-25  325  	=
 * When converting an extent to erasure coding, we don't disallow the
66e2788e68d1de fs/bcachefs/data/update.c ProofOfConcept  2026-03-25  326  	=
 * write from allocating on the extent's existing devices: we just want
66e2788e68d1de fs/bcachefs/data/update.c ProofOfConcept  2026-03-25  327  	=
 * a new replica that will have a stripe pointer added asynchronously by
66e2788e68d1de fs/bcachefs/data/update.c ProofOfConcept  2026-03-25  328  	=
 * erasure coding, and it can overwrite whichever device it happens to
66e2788e68d1de fs/bcachefs/data/update.c ProofOfConcept  2026-03-25  329  	=
 * land on
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  330  	=
 *
66e2788e68d1de fs/bcachefs/data/update.c ProofOfConcept  2026-03-25  331  	=
 * XXX: make sure drop_extra_replicas does not drop the new replica
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  332  	=
 */
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  333  	=
unsigned ptrs_conflict =3D bkey_ptr_conflicts_mask(c, bkey_i_to_s_c(insert)=
, bkey_i_to_s_c(&new->k_i));
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  334  	=
bch2_bkey_drop_ptrs_mask(c, insert, ptrs_conflict);
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  335 =
=20
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  336  	=
/* Now, merge newly written replicas:
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  337  	=
 * Since these are appended to the end of @insert, they don't invalidate
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  338  	=
 * our pointer masks:
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  339  	=
 */
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  340  	=
struct extent_ptr_decoded p;
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  341  	=
union bch_extent_entry *entry;
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  342  	=
extent_for_each_ptr_decode(extent_i_to_s(new), p, entry)
44c1946444a82a fs/bcachefs/data/update.c Kent Overstreet 2025-11-05  343  	=
	bch2_extent_ptr_decoded_append(c, insert, &p);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  344 =
=20
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  345  	=
struct bch_inode_opts opts;
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  346  	=
try(bch2_bkey_get_io_opts(trans, NULL, k, &opts));
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  347 =
=20
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  348  	=
struct bkey_durability old_durability, new_durability;
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  349  	=
try(bch2_bkey_durability(trans, k, &old_durability));
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  350  	=
try(bch2_bkey_durability(trans, bkey_i_to_s_c(insert), &new_durability));
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  351 =
=20
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  352  	=
if (new_durability.total < old_durability.total &&
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  353  	=
    new_durability.total < min(u->op.opts.data_replicas, opts.data_replicas=
)) {
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  354  	=
	/*
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  355  	=
	 * This can happen when a move - evacuate or copygc - races with an
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  356  	=
	 * extent being erasure coded: we replaced a pointer with one on the
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  357  	=
	 * same device (so we have to drop it early, to avoid conflicts) which
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  358  	=
	 * is no longer erasure coded.
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  359  	=
	 *
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  360  	=
	 * XXX: trace this
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  361  	=
	 */
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  362  	=
	bch2_btree_iter_set_pos(iter, next_pos);
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  363  	=
	return 0;
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  364  	}
11feb5c307ddcb fs/bcachefs/data/update.c Kent Overstreet 2026-02-01  365 =
=20
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  366  	=
try(bch2_bkey_drop_extra_durability(trans, &opts,	insert,
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  367  	=
	ptr_mask_remap(c, old, u->opts.ptrs_io_error,	bkey_i_to_s_c(insert)), true=
));
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  368 =
=20
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  369  	=
try(bch2_bkey_drop_extra_ec_durability(trans, &opts,	insert,
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  370  	=
	ptr_mask_remap(c, old, u->opts.ptrs_kill_ec,	bkey_i_to_s_c(insert))));
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  371 =
=20
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  372  	=
try(bch2_bkey_drop_extra_durability(trans, &opts,	insert,
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  373  	=
	ptr_mask_remap(c, old, u->opts.ptrs_kill,	bkey_i_to_s_c(insert)), false));
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  374 =
=20
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  375  	=
/* Prefer to drop existing replicas over new - we don't want to drop the
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  376  	=
 * new replica being erasure coded*/
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  377  	=
if (u->opts.no_devs_have) {
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  378  	=
	try(bch2_bkey_drop_extra_durability(trans, &opts,	insert,
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  379  	=
		~bkey_ptr_conflicts_mask(c, bkey_i_to_s_c(insert), bkey_i_to_s_c(&new->k_=
i)),
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  380  	=
		false));
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  381  	=
} else {
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  382  	=
	/* Prefer to drop new replicas, and if we did, trace that we did
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  383  	=
	 * useless work
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  384  	=
	 *
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  385  	=
	 * XXX: break up bch2_bkey_drop_extra_durability() so we can
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  386  	=
	 * trace what we're doing (or have it return a mask)
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  387  	=
	 */
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  388  	}
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  389 =
=20
bdfe44454dbbff fs/bcachefs/data/update.c Kent Overstreet 2026-01-29  390  	=
try(bch2_bkey_drop_extra_durability(trans, &opts,	insert, ~0, false));
2b07b20ee6702c fs/bcachefs/data/update.c Kent Overstreet 2025-12-24  391 =
=20
ec2537c2c93df7 fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  392  	=
bch2_bkey_drop_extra_cached_ptrs(c, &opts, bkey_i_to_s(insert));
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  393 =
=20
a580dc4d613691 fs/bcachefs/data/update.c Kent Overstreet 2026-01-17  394  	=
bch2_bkey_propagate_incompressible(c, insert, k);
a580dc4d613691 fs/bcachefs/data/update.c Kent Overstreet 2026-01-17  395 =
=20
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  396  	=
bool should_check_enospc =3D false;
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  397  	=
s64 i_sectors_delta =3D 0, disk_sectors_delta =3D 0;
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  398  	=
try(bch2_sum_sector_overwrites(trans, iter, insert,
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  399  	=
			       &should_check_enospc,
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  400  	=
			       &i_sectors_delta,
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  401  	=
			       &disk_sectors_delta));
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  402 =
=20
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  403  	=
if (disk_sectors_delta > (s64) u->op.res.sectors)
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  404  	=
	try(bch2_disk_reservation_add(c, &u->op.res,
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  405  	=
				disk_sectors_delta - u->op.res.sectors,
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  406  	=
				!should_check_enospc
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  407  	=
				? BCH_DISK_RESERVATION_NOFAIL : 0));
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  408 =
=20
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  409  	=
try(bch2_trans_log_str(trans, bch2_data_update_type_strs[u->opts.type]));
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  410  	=
try(bch2_trans_log_bkey(trans, u->btree_id, 0, u->k.k));
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  411 =
=20
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  412  	=
try(bch2_insert_snapshot_whiteouts(trans, u->btree_id, k.k->p, insert->k.p)=
);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  413 =
=20
d772c15601e0ae fs/bcachefs/data/update.c Kent Overstreet 2025-08-19  414  	=
/*
581f7e27bc9728 fs/bcachefs/data/update.c Kent Overstreet 2025-11-12  415  	=
 * This set_needs_reconcile call is only for verifying that the data we
d772c15601e0ae fs/bcachefs/data/update.c Kent Overstreet 2025-08-19  416  	=
 * just wrote was written correctly, otherwise we could fail to flag
d772c15601e0ae fs/bcachefs/data/update.c Kent Overstreet 2025-08-19  417  	=
 * incorrectly written data due to needs_rb already being set on the
d772c15601e0ae fs/bcachefs/data/update.c Kent Overstreet 2025-08-19  418  	=
 * existing extent
d772c15601e0ae fs/bcachefs/data/update.c Kent Overstreet 2025-08-19  419  	=
 */
b5b58a49569e8e fs/bcachefs/data/update.c ProofOfConcept  2026-05-05  420  	=
try(bch2_bkey_set_needs_reconcile(trans, NULL, &opts, bkey_i_to_s(&new->k_i=
),
b5b58a49569e8e fs/bcachefs/data/update.c ProofOfConcept  2026-05-05  421  	=
				  new_buf_u64s,
d13d86d8c4b9a5 fs/bcachefs/data/update.c Kent Overstreet 2026-01-26  422  	=
				  SET_NEEDS_RECONCILE_foreground,
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  423  	=
				  u->op.opts.change_cookie));
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  424 =
=20
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  425  	=
if (u->op.opts.change_cookie =3D=3D c->opt_change_cookie) {
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  426  	=
	struct bkey_durability old_durability, new_durability;
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  427  	=
	try(bch2_bkey_durability(trans, k, &old_durability));
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  428  	=
	try(bch2_bkey_durability(trans, bkey_i_to_s_c(insert), &new_durability));
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  429 =
=20
9fd08d18704e77 fs/bcachefs/data/update.c Kent Overstreet 2026-04-14  430  	=
	if (((new_durability.total < old_durability.total &&
59bb891d704dbe fs/bcachefs/data/update.c Kent Overstreet 2026-01-28  431  	=
	      new_durability.total < min(u->op.opts.data_replicas, opts.data_repli=
cas)) ||
9fd08d18704e77 fs/bcachefs/data/update.c Kent Overstreet 2026-04-14  432  	=
	     !new_durability.total) &&
9fd08d18704e77 fs/bcachefs/data/update.c Kent Overstreet 2026-04-14  433  	=
	    ({smp_mb();
9fd08d18704e77 fs/bcachefs/data/update.c Kent Overstreet 2026-04-14  434  	=
	     u->op.opts.change_cookie =3D=3D READ_ONCE(c->opt_change_cookie);})) {
9fd08d18704e77 fs/bcachefs/data/update.c Kent Overstreet 2026-04-14  435 =
=20
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  436  	=
		CLASS(bch_log_msg, msg)(c);
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  437  	=
		prt_printf(&msg.m, "Data update would have reduced extent durability:\n");
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  438  	=
		prt_printf(&msg.m, "Old extent %u, new %u, option specifies %u\n",
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  439  	=
			   old_durability.total,
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  440  	=
			   new_durability.total,
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  441  	=
			   opts.data_replicas);
235216b4093556 fs/bcachefs/data/update.c Kent Overstreet 2026-02-03  442  	=
		data_update_key_to_text(&msg.m, u, k, bkey_i_to_s_c(&new->k_i), insert);
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  443  	=
		bch2_fs_emergency_read_only(c, &msg.m);
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  444  	=
		return bch_err_throw(c, emergency_ro);
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  445  	=
	}
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  446  	}
da20eadca73eef fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  447 =
=20
b5b58a49569e8e fs/bcachefs/data/update.c ProofOfConcept  2026-05-05  448  	=
/* This is the real set_needs_reconcile() call */
b5b58a49569e8e fs/bcachefs/data/update.c ProofOfConcept  2026-05-05  449  	=
try(bch2_bkey_set_needs_reconcile(trans, NULL, &opts, bkey_i_to_s(insert),
b5b58a49569e8e fs/bcachefs/data/update.c ProofOfConcept  2026-05-05  450  	=
				  insert_buf_u64s,
b5b58a49569e8e fs/bcachefs/data/update.c ProofOfConcept  2026-05-05  451  	=
				  SET_NEEDS_RECONCILE_foreground,
b5b58a49569e8e fs/bcachefs/data/update.c ProofOfConcept  2026-05-05  452  	=
				  u->op.opts.change_cookie));
b5b58a49569e8e fs/bcachefs/data/update.c ProofOfConcept  2026-05-05  453 =
=20
b5b58a49569e8e fs/bcachefs/data/update.c ProofOfConcept  2026-05-05  454  	=
try(bch2_trans_update(trans, iter, insert,
b5b58a49569e8e fs/bcachefs/data/update.c ProofOfConcept  2026-05-05  455  	=
		      BTREE_UPDATE_internal_snapshot_node|
b5b58a49569e8e fs/bcachefs/data/update.c ProofOfConcept  2026-05-05  456  	=
		      BTREE_TRIGGER_set_needs_reconcile_done));
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  457  	=
try(bch2_trans_commit(trans, &u->op.res, NULL,
cb52d23e77a6e5 fs/bcachefs/data_update.c Kent Overstreet 2023-11-11  458  	=
		      BCH_TRANS_COMMIT_no_check_rw|
cb52d23e77a6e5 fs/bcachefs/data_update.c Kent Overstreet 2023-11-11  459  	=
		      BCH_TRANS_COMMIT_no_enospc|
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  460  	=
		      u->opts.commit_flags));
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  461 =
=20
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  462  	=
bch2_btree_iter_set_pos(iter, next_pos);
674cfc26240b78 fs/bcachefs/data_update.c Kent Overstreet 2022-08-27  463 =
=20
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  464  	=
event_add_trace(c, data_update_key, new->k.size, buf, ({
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  465  	=
	prt_str(&buf, "\nold: ");
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  466  	=
	bch2_bkey_val_to_text(&buf, c, old);
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  467  	=
	prt_str(&buf, "\nk:   ");
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  468  	=
	bch2_bkey_val_to_text(&buf, c, k);
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  469  	=
	prt_str(&buf, "\nnew: ");
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  470  	=
	bch2_bkey_val_to_text(&buf, c, bkey_i_to_s_c(insert));
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  471  	=
}));
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  472 =
=20
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  473  	=
return 0;
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08 @474  }
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  475 =
=20

:::::: The code at line 474 was first introduced by commit
:::::: d31fc1c200e6bc8b1a8f13b2ffa46d9fee90bc0f bcachefs: data_update_index=
_update_key()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EC739937C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 12:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560752; cv=none; b=bT/2uCMqj76GqzoFTUBtjyehua1OikuwbGEC3yGRxgSk4dEK5xhllLHGLHojiuosGLDyniclVJXcgcmw4KF+HUqi++SYNCI7BGue+IpC/QFRbgC/d91/7mWz3OQLbHWpdPozGuCyZzeA+bvKJmE52EQEOvwrYeby2+3fZSaJask=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560752; c=relaxed/simple;
	bh=f330gSxYcdDDx1spFvZSoi90f/pH5t1KSfMxTQbTPU0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rKPk6LqzHVOjnwjGatwA00D3qjaLos25kHfT8ihZXpRJFWo+CeufC1+l3X8r/3xjPfJqk2YRhNEoRIX659g/zIcoX/CfEV8XLIDkYm/t2JuRTG0kfJdh4sA+CohTwTQdBSEUeHxStKftZ18+jn0dO4ZalQD1gxIl0HynGQZP1pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=de7Wl8VT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="de7Wl8VT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560750; x=1821096750;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=f330gSxYcdDDx1spFvZSoi90f/pH5t1KSfMxTQbTPU0=;
  b=de7Wl8VTgLuowGmDLNzmy/ULLfngEfaKGX9EqyHQxts3bXBqf9aTWfqF
   pyV09t9wPnaB9q0jla9sPRPOa9churrCY+rhIC74/H/xvlD/v0qinRZGh
   /FpE8JuWllCBuWVa8HWmjwHab6fyHhsmTwWePXCAMkJZtHgM+7MglOhrB
   ChuYA2zhVlq6EJ61iF107rulPEadCTvnEiSXJdcDrj8eBybBOQGR9F7gs
   miVCaA4pmn/Ljk1Ls5MnXqecXlqD1CUHZbAEFkqFLHh4vpGmg3euTAJP1
   mzg8KsbviUsMOWL5+A3KMXUde4qrXKZsWKGwfuxolQ51m6fBVFDuRoTyP
   g==;
X-CSE-ConnectionGUID: m/Uk6bcBTECDiQzcaoexZA==
X-CSE-MsgGUID: 5IiCG374RGS1JqaCB4TCfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93760726"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93760726"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:12:29 -0700
X-CSE-ConnectionGUID: xs8IkUf6SGKmrWMwEut8LQ==
X-CSE-MsgGUID: 7tJ01s7ATzSpt7beQUthSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271866889"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Sep 2026 05:12:28 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6oV0-0000000061f-05Vv;
	Wed, 16 Sep 2026 12:12:26 +0000
Date: Wed, 16 Sep 2026 20:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 31/106]
 fs/bcachefs/btree/interior.c:2966:17: sparse: sparse: restricted __le16
 degrades to integer
Message-ID: <202609162001.Z8972Qwj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/koverstreet/bcachefs master
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 8fa192c9e9735f5801a191e8a37e5376fc279a57 [31/106] bcachefs: __bch2_=
foreground_maybe_merge: 3-way merge support
config: openrisc-randconfig-r112-20260915 (https://download.01.org/0day-ci/=
archive/20260916/202609162001.Z8972Qwj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260916/202609162001.Z8972Qwj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609162001.Z8972Qwj-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/btree/interior.c:1270:33: sparse: sparse: mixing different e=
num types:
   fs/bcachefs/btree/interior.c:1270:33: sparse:    unsigned int enum bch_t=
rans_commit_flags
   fs/bcachefs/btree/interior.c:1270:33: sparse:    unsigned int enum bch_w=
atermark
>> fs/bcachefs/btree/interior.c:2966:17: sparse: sparse: restricted __le16 =
degrades to integer

vim +2966 fs/bcachefs/btree/interior.c

  2723=09
  2724	int __bch2_foreground_maybe_merge(struct btree_trans *trans,
  2725					  btree_path_idx_t path,
  2726					  unsigned level,
  2727					  enum bch_trans_commit_flags flags,
  2728					  u64 *merge_count)
  2729	{
  2730		struct bch_fs *c =3D trans->c;
  2731		struct btree_update *as =3D NULL;
  2732		enum btree_id btree =3D trans->paths[path].btree_id;
  2733		u64 start_time =3D local_clock();
  2734		int ret =3D 0;
  2735=09
  2736		CLASS(darray_merge_node, srcs)();
  2737		CLASS(darray_merge_node, dsts)();
  2738=09
  2739		try(darray_make_room(&srcs, 3));
  2740		try(darray_make_room(&dsts, 2));
  2741=09
  2742		bch2_trans_verify_not_unlocked_or_in_restart(trans);
  2743		BUG_ON(!trans->paths[path].should_be_locked);
  2744		BUG_ON(!btree_node_locked(&trans->paths[path], level));
  2745=09
  2746		/*
  2747		 * Work around a deadlock caused by the btree write buffer not doing
  2748		 * merges and leaving tons of merges for us to do - we really don't=
 need
  2749		 * to be doing merges at all from the interior update path, and if =
the
  2750		 * interior update path is generating too many new interior updates=
 we
  2751		 * deadlock:
  2752		 */
  2753		if ((flags & BCH_WATERMARK_MASK) =3D=3D BCH_WATERMARK_interior_upda=
tes)
  2754			return 0;
  2755=09
  2756		if ((flags & BCH_WATERMARK_MASK) <=3D BCH_WATERMARK_reclaim) {
  2757			flags &=3D ~BCH_WATERMARK_MASK;
  2758			flags |=3D BCH_WATERMARK_btree;
  2759			flags |=3D BCH_TRANS_COMMIT_journal_reclaim;
  2760		}
  2761=09
  2762		struct btree *b =3D trans->paths[path].l[level].b;
  2763=09
  2764		if (bpos_eq(b->data->min_key, POS_MIN))
  2765			b->sib_u64s[btree_prev_sib] =3D U16_MAX;
  2766		if (bpos_eq(b->data->max_key, SPOS_MAX))
  2767			b->sib_u64s[btree_next_sib] =3D U16_MAX;
  2768=09
  2769		/*
  2770		 * Push srcs in left-to-right order so srcs is naturally sorted: pr=
ev
  2771		 * sibling first (if merging left), then caller's node, then next
  2772		 * sibling (if merging right). The caller's path takes an extra ref=
 so
  2773		 * the destructor can put it uniformly with helper-acquired paths.
  2774		 */
  2775		try(btree_merge_push_pos(trans, &srcs, btree, level, path, btree_pr=
ev_sib));
  2776=09
  2777		__btree_path_get(trans, trans->paths + path, true);
  2778		BUG_ON(darray_push(&srcs, ((struct btree_merge_node) {
  2779			trans, b, path, b->nr.live_u64s,
  2780		})));
  2781=09
  2782		try(btree_merge_push_pos(trans, &srcs, btree, level, path, btree_ne=
xt_sib));
  2783=09
  2784		if (srcs.nr =3D=3D 1)
  2785			return 0;
  2786=09
  2787		event_inc_trace(c, btree_node_merge_attempt, buf, ({
  2788			unsigned total_u64s =3D 0;
  2789			darray_for_each(srcs, s) {
  2790				if (s->b)
  2791					bch2_btree_pos_to_text(&buf, c, s->b);
  2792				else
  2793					prt_str(&buf, "(evicted node)");
  2794				prt_printf(&buf, "\nlive u64s %u (%zu%% full)\n",
  2795					   s->live_u64s,
  2796					   s->live_u64s * 100 / btree_max_u64s(c));
  2797				total_u64s +=3D s->live_u64s;
  2798			}
  2799=09
  2800			prt_printf(&buf, "Pivot sib_u64s %u %u threshold %u\n",
  2801				   b->sib_u64s[btree_prev_sib],
  2802				   b->sib_u64s[btree_next_sib],
  2803				   c->btree.foreground_merge_threshold);
  2804			bch2_btree_pos_to_text(&buf, c, b);
  2805=09
  2806			prt_printf(&buf, "\ntotal_u64s %u per-node max %zu nr_dsts %un",
  2807				   total_u64s, BTREE_FOREGROUND_MERGE_HIGHER_THRESHOLD(c),
  2808				   max_t(unsigned, 1,
  2809					 DIV_ROUND_UP(total_u64s, BTREE_FOREGROUND_MERGE_HIGHER_THRESHOL=
D(c))));
  2810		}));
  2811=09
  2812		struct bkey_format new_f;
  2813		unsigned nr_dsts =3D compute_merge(c, b, &srcs, NULL, &new_f);
  2814		if (nr_dsts >=3D srcs.nr)
  2815			goto out;
  2816=09
  2817		/*
  2818		 * Estimate-based gate said the merge will fit =E2=80=94 fill (or r=
e-traverse)
  2819		 * any srcs whose path isn't currently should_be_locked. Deferred s=
rcs
  2820		 * pushed without a real read fall here; so do any srcs whose locks
  2821		 * may have been dropped since push (a !should_be_locked path won't
  2822		 * get relocked by unlock/relock cycles).
  2823		 *
  2824		 * On parent-identity mismatch, poison that side's cached estimate
  2825		 * and drop the src =E2=80=94 saves us the bch2_btree_update_start =
cost that
  2826		 * the post-update_start recheck would otherwise discover.
  2827		 */
  2828		for (unsigned i =3D 0; i < srcs.nr;) {
  2829			struct btree_merge_node *s =3D &srcs.data[i];
  2830=09
  2831			if (trans->paths[s->path_idx].should_be_locked) {
  2832				i++;
  2833				continue;
  2834			}
  2835=09
  2836			ret =3D bch2_btree_path_traverse(trans, s->path_idx, 0);
  2837			if (ret)
  2838				goto err;
  2839=09
  2840			s->b =3D trans->paths[s->path_idx].l[level].b;
  2841			s->live_u64s =3D s->b->nr.live_u64s;
  2842=09
  2843			if (btree_node_parent(trans->paths + s->path_idx, s->b) !=3D
  2844			    trans->paths[path].l[level + 1].b) {
  2845				enum btree_node_sibling bad =3D
  2846					bpos_lt(s->b->data->max_key, b->data->min_key)
  2847					? btree_prev_sib
  2848					: btree_next_sib;
  2849				b->sib_u64s[bad] =3D U16_MAX;
  2850				btree_merge_node_put(*s);
  2851				darray_remove_item(&srcs, s);
  2852				continue;
  2853			}
  2854=09
  2855			btree_path_set_should_be_locked(trans, trans->paths + s->path_idx);
  2856			i++;
  2857		}
  2858=09
  2859		try(btree_merge_topology_check(c, &srcs));
  2860=09
  2861		if (srcs.nr =3D=3D 1)
  2862			goto out;
  2863=09
  2864		/*
  2865		 * Post deferred-fill, every surviving src must have ->b set so that
  2866		 * compute_merge() / merge_node_u64s_and_format() takes the precise
  2867		 * format-aware path. The estimate-only fallback (sum of live_u64s)
  2868		 * doesn't account for format growth on repack and would let an
  2869		 * infeasible merge through, blowing up later in btree_pack_into_ds=
ts
  2870		 * or sort_into.
  2871		 */
  2872		darray_for_each(srcs, s)
  2873			BUG_ON(!s->b);
  2874=09
  2875		nr_dsts =3D compute_merge(c, b, &srcs, &dsts, &new_f);
  2876		if (nr_dsts >=3D srcs.nr)
  2877			goto out;
  2878=09
  2879		BUG_ON(nr_dsts > 2);
  2880=09
  2881		as =3D bch2_btree_update_start(trans, trans->paths + path, level, n=
r_dsts =3D=3D 2,
  2882					     0, BCH_TRANS_COMMIT_no_enospc|flags, 0);
  2883		ret =3D PTR_ERR_OR_ZERO(as);
  2884		if (ret) {
  2885			as =3D NULL;
  2886			goto err;
  2887		}
  2888=09
  2889		/*
  2890		 * update_start upgraded path's locks to cover parent nodes; re-read
  2891		 * parent and re-verify all srcs still share it. The earlier check =
in
  2892		 * btree_merge_push_pos() was racy because parents weren't locked.
  2893		 *
  2894		 * On mismatch, identify which side the bad sibling is on by bpos
  2895		 * comparison and poison just that side's cached estimate.
  2896		 */
  2897		struct btree *parent =3D btree_node_parent(trans->paths + path, b);
  2898		darray_for_each(srcs, s) {
  2899			if (s->path_idx =3D=3D path)
  2900				continue;
  2901			if (btree_node_parent(trans->paths + s->path_idx, s->b) !=3D paren=
t) {
  2902				enum btree_node_sibling bad_sib =3D
  2903					bpos_lt(s->b->data->max_key, b->data->min_key)
  2904						? btree_prev_sib
  2905						: btree_next_sib;
  2906				b->sib_u64s[bad_sib] =3D U16_MAX;
  2907				bch2_btree_update_free(as, trans);
  2908				as =3D NULL;
  2909				ret =3D 0;
  2910				goto out;
  2911			}
  2912		}
  2913=09
  2914		as->node_start	=3D srcs.data[0].b->data->min_key;
  2915		as->node_end	=3D srcs.data[srcs.nr - 1].b->data->max_key;
  2916=09
  2917		darray_for_each(srcs, s) {
  2918			ret =3D bch2_btree_node_lock_write(trans, trans->paths + s->path_i=
dx, &s->b->c);
  2919			if (ret)
  2920				goto err_free_update;
  2921		}
  2922=09
  2923		/*
  2924		 * Allocate destination nodes: 1 for plain N->1, 2 for the 3->2 cas=
e.
  2925		 * compute_merge() already populated dsts entries with their per-dst
  2926		 * format and max_key =E2=80=94 here we just attach trans + a fresh=
ly allocated
  2927		 * btree node to each. path_idx is filled in after the pack since e=
ach
  2928		 * dst's key.k.p (=3D=3D max_key) is set inside btree_set_max().
  2929		 */
  2930		darray_for_each(dsts, d) {
  2931			d->trans =3D trans;
  2932			d->b =3D bch2_btree_node_alloc(as, trans, level);
  2933		}
  2934=09
  2935		if (nr_dsts =3D=3D 1) {
  2936			struct btree *n =3D dsts.data[0].b;
  2937			u64 max_seq =3D 0;
  2938=09
  2939			darray_for_each(srcs, s)
  2940				max_seq =3D max(max_seq, BTREE_NODE_SEQ(s->b->data));
  2941			SET_BTREE_NODE_SEQ(n->data, max_seq + 1);
  2942=09
  2943			btree_set_min(n, srcs.data[0].b->data->min_key);
  2944			btree_set_max(n, dsts.data[0].max_key);
  2945=09
  2946			n->data->format =3D dsts.data[0].format;
  2947			btree_node_set_format(n, n->data->format);
  2948=09
  2949			darray_for_each(srcs, s)
  2950				bch2_btree_sort_into(c, n, s->b);
  2951=09
  2952			ret =3D bch2_btree_node_check_topology(trans, n);
  2953			BUG_ON(ret);
  2954=09
  2955			btree_node_reset_sib_u64s(n);
  2956		} else {
  2957			btree_pack_into_dsts(as, trans, &srcs, &dsts);
  2958		}
  2959=09
  2960		/*
  2961		 * Diagnostic: each dst's packed content must fit in btree_buf_bytes
  2962		 * with room for the +8 varint slop in btree_node_write. Mirrors
  2963		 * bch2_btree_node_format_fits()'s strict-less-than check.
  2964		 */
  2965		darray_for_each(dsts, d)
> 2966			BUG_ON(__vstruct_bytes(struct btree_node, d->b->data->u64s) >=3D
  2967			       btree_buf_bytes(d->b));
  2968=09
  2969		darray_for_each(dsts, d) {
  2970			bch2_btree_build_aux_trees(d->b);
  2971			bch2_btree_update_add_new_node(as, d->b);
  2972=09
  2973			d->path_idx =3D bch2_path_get_unlocked_mut(trans, btree,
  2974								 d->b->c.level, d->b->key.k.p, false);
  2975			six_lock_increment(&d->b->c.lock, SIX_LOCK_intent);
  2976			mark_btree_node_locked(trans, trans->paths + d->path_idx,
  2977					       d->b->c.level, BTREE_NODE_WRITE_LOCKED);
  2978			bch2_btree_path_level_init(trans, trans->paths + d->path_idx, d->b=
);
  2979		}
  2980=09
  2981		/*
  2982		 * Conceptually: every src becomes a delete, every dst becomes a new
  2983		 * key, sorted and deduped (a new key at the same .p as a delete
  2984		 * subsumes the delete). For N -> 1 the last src's .p equals the ds=
t's
  2985		 * .p (the dst's max_key was set to the last src's max_key), so the
  2986		 * last src's delete is the only one that gets dropped.
  2987		 *
  2988		 * Both parent_keys (the in-memory parent update) and new_nodes (the
  2989		 * journal record) need each surviving delete; emit them together.
  2990		 */
  2991		struct btree_merge_node *src =3D srcs.data;
  2992		struct btree_merge_node *dst =3D dsts.data;
  2993		while (src || dst) {
  2994			if (src && dst && bpos_eq(src->b->key.k.p, dst->b->key.k.p)) {
  2995				bch2_btree_update_add_node(c, &as->new_nodes, dst->b);
  2996				bch2_keylist_add(&as->parent_keys, &dst->b->key);
  2997				src++;
  2998				dst++;
  2999			} else if (src && (dst ? bpos_lt(src->b->key.k.p, dst->b->key.k.p)=
 : true)) {
  3000				struct bkey_i delete;
  3001				bkey_init(&delete.k);
  3002				delete.k.p =3D src->b->key.k.p;
  3003				bch2_keylist_add(&as->parent_keys, &delete);
  3004				bch2_btree_update_add_key(&as->new_nodes, level, &delete);
  3005				src++;
  3006			} else {
  3007				bch2_btree_update_add_node(c, &as->new_nodes, dst->b);
  3008				bch2_keylist_add(&as->parent_keys, &dst->b->key);
  3009				dst++;
  3010			}
  3011=09
  3012			if (src =3D=3D srcs.data + srcs.nr)
  3013				src =3D NULL;
  3014			if (dst =3D=3D dsts.data + dsts.nr)
  3015				dst =3D NULL;
  3016		}
  3017=09
  3018		bch2_trans_verify_paths(trans);
  3019=09
  3020		ret =3D bch2_btree_insert_node(as, trans, path, parent, &as->parent=
_keys);
  3021		if (ret)
  3022			goto err_free_new_node;
  3023=09
  3024		event_inc_trace(c, btree_node_merge, buf, ({
  3025			btree_node_op_log(&buf, c, b, &srcs, &dsts);
  3026		}));
  3027=09
  3028		darray_for_each(srcs, s)
  3029			bch2_btree_interior_update_will_free_node(as, s->b);
  3030=09
  3031		bch2_trans_verify_paths(trans);
  3032=09
  3033		darray_for_each(dsts, d) {
  3034			bch2_btree_update_get_open_buckets(as, d->b);
  3035			bch2_btree_node_write_trans(trans, d->b, SIX_LOCK_write, 0);
  3036		}
  3037=09
  3038		darray_for_each(srcs, s)
  3039			bch2_btree_node_free_inmem(trans, trans->paths + s->path_idx, s->b=
);
  3040=09
  3041		darray_for_each(dsts, d)
  3042			bch2_trans_node_add(trans, trans->paths + d->path_idx, d->b);
  3043=09
  3044		bch2_trans_verify_paths(trans);
  3045=09
  3046		darray_for_each(dsts, d)
  3047			six_unlock_intent(&d->b->c.lock);
  3048=09
  3049		bch2_btree_update_done(as, trans);
  3050=09
  3051		bch2_time_stats_update(&c->times[BCH_TIME_btree_node_merge], start_=
time);
  3052=09
  3053		if (merge_count)
  3054			(*merge_count)++;
  3055	out:
  3056	err:
  3057		bch2_trans_verify_locks(trans);
  3058		if (ret =3D=3D -BCH_ERR_journal_reclaim_would_deadlock)
  3059			ret =3D 0;
  3060		if (!ret)
  3061			ret =3D bch2_trans_relock(trans);
  3062		return ret;
  3063	err_free_new_node:
  3064		darray_for_each(dsts, d)
  3065			bch2_btree_node_free_never_used(as, trans, d->b);
  3066	err_free_update:
  3067		darray_for_each_reverse(srcs, s)
  3068			if (btree_node_write_locked(trans->paths + s->path_idx, s->b->c.le=
vel))
  3069				bch2_btree_node_unlock_write(trans, trans->paths + s->path_idx, s=
->b);
  3070		if (as)
  3071			bch2_btree_update_free(as, trans);
  3072		goto out;
  3073	}
  3074=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

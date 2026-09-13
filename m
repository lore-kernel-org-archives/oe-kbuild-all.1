Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E725D2DB78B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 19:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789327955; cv=none; b=Kc5MbZ89CQoJCMAL/0XJjjTQMJcpXhFDfErHEuDtpzQA8w+U536ZLdp025tibxnQVlsgYSEzwfKXmySAP7nwBc1CMYyYmZXjKJFC+qTYQeeHmT4Ib0tSLrb8O1NcR2nDhI+JI9bBKkm0gDDmOlpZIBkfN1p/DYi2splvvTEwOcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789327955; c=relaxed/simple;
	bh=oDUMUaG9zsZ4FWljyPEPY3TTKPsf7OtlaLaDyWT9Ebs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NlSWuNL2LSobG0SIPoe+4+yleTrNb9psQ+sNC5m7OdBWG3+mt59pxcbUdhcJ9iYP0Aw6aPMfbWTqG6OULvgZxKUIQ0301x4qA+QoSkLllj5TL7Cg5EZWl2dK7chlLUWkqpgBC/8E+wJAGdeoPMMUEjIyjmaYxw+BzwpuzWjUbNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TdzYPIdj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdzYPIdj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789327953; x=1820863953;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oDUMUaG9zsZ4FWljyPEPY3TTKPsf7OtlaLaDyWT9Ebs=;
  b=TdzYPIdjjwa1zdQHLdm5cJAu0GgL1Mo+gXCJL6aySBxOil+vHb6ED3Kn
   FSqzw3XdrlKCE75k+jnHb7rsGwy6Io/93yMNTYh7cYwFq8/1UnpyeJnrG
   EjJsTJIg998qUI+S6g5h3eevOnuvVQfoecZa3rUY2fzjDeNz+DBuOYSW/
   57pSjZNYT64CG3C5d8pYnb3Qr2T9ehNG4ff+qLyFGNQIn7jWYc9nwgAvo
   byGsrnKK3Eo4upZHXDjk8OKRLnbjajgzVnOWyijepF2Ma76Irh5QTWcmb
   LS2gO58ZMhlufAfOXx5bFDDm6Io8nT93KJApJK6kkJDJlH/T50a4ZwPd5
   A==;
X-CSE-ConnectionGUID: xOUMhSOHTUam2feaUV99bw==
X-CSE-MsgGUID: 4tFkucfIS5SAVS2WizG1Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89906343"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89906343"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 12:32:32 -0700
X-CSE-ConnectionGUID: KZGeTA1KRZmkuqQyIaRPUw==
X-CSE-MsgGUID: mV7sgco7RjKPBscshFTBuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="269823989"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 13 Sep 2026 12:32:30 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5pwB-000000001gx-2dHe;
	Sun, 13 Sep 2026 19:32:27 +0000
Date: Sun, 13 Sep 2026 21:32:22 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 56/69]
 fs/bcachefs/data/move.c:899:1: warning: the frame size of 1028 bytes is
 larger than 1024 bytes
Message-ID: <202609132143.Z99DjF0M-lkp@intel.com>
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
commit: c1af6851c9e220767da3b72658ca5dc9a1980475 [56/69] bcachefs: opts.scr=
ub_recent_journal_entries
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260913/2=
02609132143.Z99DjF0M-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260913/202609132143.Z99DjF0M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609132143.Z99DjF0M-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/move.c: In function 'bch2_scrub_journal':
>> fs/bcachefs/data/move.c:899:1: warning: the frame size of 1028 bytes is =
larger than 1024 bytes [-Wframe-larger-than=3D]
     899 | }
         | ^


vim +899 fs/bcachefs/data/move.c

   757=09
   758	int bch2_scrub_journal(struct bch_fs *c, u64 *rewind_seq)
   759	{
   760		CLASS(darray_u64, flushes)();
   761		int ret =3D 0;
   762=09
   763		u64 last_entry_time =3D 0;
   764		*rewind_seq =3D 0;
   765=09
   766		struct journal_replay **_i;
   767		struct genradix_iter radix_iter;
   768		genradix_for_each(&c->journal_entries, radix_iter, _i) {
   769			struct journal_replay *i =3D *_i;
   770=09
   771			if (!journal_replay_ignore(i) &&
   772			    !JSET_NO_FLUSH(&i->j)) {
   773				u64 t =3D jset_datetime(&i->j);
   774				if (!last_entry_time)
   775					last_entry_time =3D t;
   776				else if (time_before64(t + c->opts.scrub_journal_max_rewind_secs,=
 last_entry_time))
   777					break;
   778=09
   779				try(darray_push(&flushes, le64_to_cpu(i->j.seq)));
   780			}
   781		}
   782=09
   783		if (!flushes.nr) {
   784			bch_info(c, "%s(): No journal flushes found", __func__);
   785			return 0;
   786		}
   787=09
   788		bch_info(c, "journal scrub: checking %zu flush ranges",
   789			 flushes.nr);
   790=09
   791		struct bch_move_stats stats;
   792		bch2_move_stats_init(&stats, "journal_scrub");
   793=09
   794		struct moving_context ctxt __cleanup(bch2_moving_ctxt_exit);
   795		bch2_moving_ctxt_init(&ctxt, c, NULL, &stats, (struct write_point_s=
pecifier) {}, false);
   796=09
   797		struct btree_trans *trans =3D ctxt.trans;
   798		struct journal_keys *keys =3D &c->journal_keys;
   799=09
   800		/*
   801		 * Scrub one flush range at a time, newest first. Within each range,
   802		 * fire off all reads asynchronously, then flush once to check for
   803		 * errors. Walk backwards until we find a good range =E2=80=94 ever=
ything
   804		 * newer is tainted.
   805		 *
   806		 * Stop if we've gone further back than scrub_journal_max_rewind_se=
cs seconds.
   807		 */
   808		unsigned nr_good =3D 0;
   809=09
   810		for (int f =3D flushes.nr - 1; f > 0; f--) {
   811			u64 range_start =3D flushes.data[f - 1];
   812			u64 range_end   =3D flushes.data[f];
   813			u64 errors_before =3D atomic64_read(&stats.sectors_error_uncorrect=
ed);
   814			memset(&stats.devs_error_uncorrected, 0, sizeof(stats.devs_error_u=
ncorrected));
   815			int move_ret =3D 0;
   816=09
   817			darray_for_each(*keys, jk) {
   818				u64 seq =3D c->journal_entries_base_seq + jk->journal_seq_offset;
   819				struct bkey_s_c k =3D bkey_i_to_s_c(journal_key_k(c, jk));
   820=09
   821=09
   822				if (seq <=3D range_start || seq > range_end)
   823					continue;
   824=09
   825				struct bkey_ptrs_c ptrs =3D bch2_bkey_ptrs_c(k);
   826				if (!ptrs.start)
   827					continue;
   828=09
   829				struct bch_inode_opts io_opts;
   830				bch2_inode_opts_get(c, &io_opts, bkey_is_btree_ptr(k.k));
   831=09
   832				bkey_for_each_ptr(ptrs, ptr) {
   833					struct data_update_opts data_opts =3D {
   834						.type		=3D BCH_DATA_UPDATE_scrub_no_repair,
   835						.read_flags	=3D BCH_READ_hard_require_read_device,
   836						.read_dev	=3D ptr->dev,
   837					};
   838					ret =3D lockrestart_do(trans, ({
   839						struct bkey_s_c k2;
   840=09
   841						CLASS(btree_node_iter, iter)(trans, jk->btree_id, k.k->p, 0, jk=
->level,
   842									     BTREE_ITER_all_snapshots);
   843						int ret2 =3D bkey_err(k2 =3D bch2_btree_iter_peek_slot(&iter));
   844=09
   845						BUG_ON(!ret2 && !bkey_and_val_eq(k, k2));
   846=09
   847						ret2 ?:
   848						bch2_move_extent(&ctxt, NULL, &io_opts, &data_opts, &iter, jk->=
level, k);
   849					}));
   850=09
   851					if (ret)
   852						move_ret =3D ret;
   853				}
   854			}
   855=09
   856			bch2_moving_ctxt_flush_all(&ctxt);
   857=09
   858			if (move_ret)
   859				bch_err(c, "journal scrub: move error %s in flush range seq %llu-=
%llu",
   860					bch2_err_str(move_ret),
   861					range_start + 1, range_end =3D=3D U64_MAX ? range_start : range_=
end);
   862=09
   863			bool checksum_err =3D atomic64_read(&stats.sectors_error_uncorrect=
ed) !=3D errors_before;
   864=09
   865			if (checksum_err) {
   866				bch2_sb_error_count(c, BCH_FSCK_ERR_device_bad_flush);
   867				CLASS(bch_log_msg, msg)(c);
   868				prt_printf(&msg.m, "journal scrub: checksum errors in flush range=
 seq %llu-%llu, "
   869					"device(s) not honoring flush/FUA:",
   870					range_start + 1, range_end =3D=3D U64_MAX ? range_start : range_=
end);
   871=09
   872				unsigned i;
   873				for_each_set_bit(i, stats.devs_error_uncorrected.d, BCH_SB_MEMBER=
S_MAX) {
   874					CLASS(bch2_dev_tryget_noerror, ca)(c, i);
   875					if (ca)
   876						prt_printf(&msg.m, " %s", ca->name);
   877					else
   878						prt_printf(&msg.m, " dev%u", i);
   879				}
   880=09
   881				guard(memalloc_flags)(PF_MEMALLOC_NOFS);
   882				guard(mutex)(&c->sb_lock);
   883				for_each_set_bit(i, stats.devs_error_uncorrected.d, BCH_SB_MEMBER=
S_MAX) {
   884					struct bch_member *m =3D bch2_members_v2_get_mut(c->disk_sb.sb, =
i);
   885					if (m)
   886						le64_add_cpu(&m->flush_errors, 1);
   887				}
   888				bch2_write_super(c);
   889=09
   890				*rewind_seq =3D range_start;
   891				nr_good =3D 0;
   892			} else if (++nr_good >=3D 2) {
   893				/* Two consecutive good ranges =E2=80=94 safe to stop */
   894				break;
   895			}
   896		}
   897=09
   898		return 0;
 > 899	}
   900=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

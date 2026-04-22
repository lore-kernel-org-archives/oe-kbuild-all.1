Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D2F3EC2EB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Apr 2026 13:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776864232; cv=none; b=KN1j9uzxFoEs60sqR0uyJC4Q2ETGpJZFCR/OFO7ZatPCcRdhkxWtgaJGTQIjmOQlCoz334EibKphs8CJzBRE+GB3XHOqVPmhp7Y5PRWcAdpAKaT68EgSyusXAH3Dq2F89Z50hX/SO0+i9+VQwsG7QnCM1HFzRSLYkQPc3kBUp/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776864232; c=relaxed/simple;
	bh=PYKrdv1CGLe/36Dn8XMoZ9iRsgmKqLY+cximikQ4mH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k5PBSb6eRkt0oPQ7MRsgasvxFeTYqLlNOIcJjq1E6o9OV/zag69OG9qDH0PDGkmSSl+4F8LxIgaFLStooUir5/nGBhHXkdbBX/Pxv2srvQ/YbaTYcZ2F/xLKO1f5QD6VE7ysfsMdpxmaECuWjskAc2VDdahhBnS4Jfhk0euntr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Un/OBBDp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Un/OBBDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776864229; x=1808400229;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PYKrdv1CGLe/36Dn8XMoZ9iRsgmKqLY+cximikQ4mH4=;
  b=Un/OBBDp214sDxwsUdsW0Hv8UQryq6GMkWkWic8EYie+oU5tCcg+zwG1
   c6dUSrVmMnrfap+orGRA4Z9ZRsmaq8mr37MTdbiwOVhec/XZN0P6hojl/
   gLjZMvuERmlG4kp4iQCMOImhH1xFBeJbV/fR73To8c15Wd/IExL9YAFmw
   Ive2n9b4vyUx5R+CiOFqgeayjoPOxtRL3mQ8FCtudxVDCyCQElx4VYDFs
   eRtZnkumnhaBL5ws2i+h/hivPKDDMTWOz9+8mPuBsvr2teF3YOumTo2ky
   mMZPTEvYprcCMcTZQrlIKk1VdKU+T8zjXLOVK3E9s//q6wS1t6aEQFvHw
   A==;
X-CSE-ConnectionGUID: KJ+SAIQvQsGeibad9WLIrQ==
X-CSE-MsgGUID: k7s6LZzzRIGsvJURe1Jn8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="103275303"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="103275303"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 06:23:47 -0700
X-CSE-ConnectionGUID: J+9Ah0JBSUurgC4ADWBzYg==
X-CSE-MsgGUID: OamxgXv9RcS6DW0j8HTIdg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Apr 2026 06:23:46 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFXYN-000000000gz-23DZ;
	Wed, 22 Apr 2026 13:23:43 +0000
Date: Wed, 22 Apr 2026 21:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 56/69]
 fs/bcachefs/data/move.c:899:1: warning: the frame size of 1872 bytes is
 larger than 1536 bytes
Message-ID: <202604222114.lcLtaSGm-lkp@intel.com>
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
head:   8bef7bbc83268947311e1860ab1bd01364b288e5
commit: c1af6851c9e220767da3b72658ca5dc9a1980475 [56/69] bcachefs: opts.scr=
ub_recent_journal_entries
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/202604=
22/202604222114.lcLtaSGm-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260422/202604222114.lcLtaSGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604222114.lcLtaSGm-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/move.c: In function 'bch2_scrub_journal':
>> fs/bcachefs/data/move.c:899:1: warning: the frame size of 1872 bytes is =
larger than 1536 bytes [-Wframe-larger-than=3D]
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

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

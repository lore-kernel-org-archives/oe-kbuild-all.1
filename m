Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9555930C345
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774173110; cv=none; b=cfYJm5IMEeRqeWSBkdpc+8U/eyVUt670HhJMww/EgD4hyw2bLrmKo+si0xHXcVfry9jB5RRCMXzBXz9/D/dAdcRRHXLqReE7SQVLQtSyID6K3hKAGl2yATlGO/6uHgduDeRaK19f3l++6I1d7pm7vz1KYZANhENw43Zsew5ATEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774173110; c=relaxed/simple;
	bh=jmJ6VeAO90BWtbgL70x/tkaqxDwySZWBvDAPLYNi6lU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PXrizi2OMaYaZVlQqAXtB+p1UlvEj+BbjIQZ/XVkDyrHsUBePrgXhNmBSLnZIM7uWVbu7CmJFGU0Tn1RQftAKt4ExK66ZT0/VL5N85wdjYSkw1JMyOPTk7AnwX9PJhNCbtWXubGLwdsyrOSk22YNKCk8qBr4YbUSJX7mK0cApJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BM1inOVA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BM1inOVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774173109; x=1805709109;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jmJ6VeAO90BWtbgL70x/tkaqxDwySZWBvDAPLYNi6lU=;
  b=BM1inOVATVfIR5puAavPl8FKOsFPiZwoijSt22qUzi4pQNJLyPZRrDzs
   l3ybezwAf5+j5PY06kIe2dHQkPvFoJVbs7byiJHniIyo8jifatQ35b3Ce
   CBglgZjAWmBkj0QRWz4dHn2xfePVKu/5L0hgk0d/jmepyShnCqFLJbd1C
   cO+/r+7963G0c2Q1FyzliRgMecW0BAQDK6drszjnlnXT33dnLx393qlot
   a/U+jVKsuP939cOOP/ZQSbrq5iQU5Kjj0afTV0ru1OQMIjJEd6+jeUPEK
   JUMqz75yZ5BTgFRFj1ED10zPtwXa3w49qgXQ7qgPlCR/gtPe7+w3W1xTk
   Q==;
X-CSE-ConnectionGUID: 5A4zO4g/SnaOCWiKD/HgBw==
X-CSE-MsgGUID: bVi2y7PnRF6Na4PYcxDt1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="75268136"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="75268136"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 02:51:48 -0700
X-CSE-ConnectionGUID: Wjn3oqW+SE+SeitRCMGPjw==
X-CSE-MsgGUID: nFlv8AbpQ8KCjMYma5yr4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="228462105"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Mar 2026 02:51:46 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4FTD-000000001yP-3guP;
	Sun, 22 Mar 2026 09:51:43 +0000
Date: Sun, 22 Mar 2026 17:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 5/5]
 fs/bcachefs/alloc/discard.c:489:1: warning: the frame size of 1376 bytes is
 larger than 1280 bytes
Message-ID: <202603221732.8pIDfo5b-lkp@intel.com>
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
head:   d7f15677081cb4e19feee9ffb9a4983719439375
commit: ecf4fc40038a81c249ded1dcf5894f2819366e86 [5/5] bcachefs: Discard pi=
pelining
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260322/=
202603221732.8pIDfo5b-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260322/202603221732.8pIDfo5b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221732.8pIDfo5b-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/alloc/discard.c: In function '__bch2_do_discards':
>> fs/bcachefs/alloc/discard.c:489:1: warning: the frame size of 1376 bytes=
 is larger than 1280 bytes [-Wframe-larger-than=3D]
     489 | }
         | ^


vim +489 fs/bcachefs/alloc/discard.c

9a424ccada5a56 Kent Overstreet 2026-03-09  382 =20
4275c7a8422e5c ProofOfConcept  2026-03-19  383  static void __bch2_do_disca=
rds(struct bch_fs *c)
796b20996fc24b Kent Overstreet 2026-01-16  384  {
b9c70cc60c8bef Kent Overstreet 2026-02-06  385  	int ret =3D 0;
11995b82f6c965 Kent Overstreet 2026-03-17  386  	bool again;
b9c70cc60c8bef Kent Overstreet 2026-02-06  387 =20
b9c70cc60c8bef Kent Overstreet 2026-02-06  388  	CLASS(btree_trans, trans)(=
c);
b9c70cc60c8bef Kent Overstreet 2026-02-06  389 =20
11995b82f6c965 Kent Overstreet 2026-03-17  390  	do {
11995b82f6c965 Kent Overstreet 2026-03-17  391  		again =3D false;
11995b82f6c965 Kent Overstreet 2026-03-17  392 =20
11995b82f6c965 Kent Overstreet 2026-03-17  393  		struct discard_buckets_st=
ate s =3D {};
ecf4fc40038a81 Kent Overstreet 2026-03-21  394  		bool done_queuing =3D fal=
se;
796b20996fc24b Kent Overstreet 2026-01-16  395 =20
ecf4fc40038a81 Kent Overstreet 2026-03-21  396  		do {
9a424ccada5a56 Kent Overstreet 2026-03-09  397  			/*
4275c7a8422e5c ProofOfConcept  2026-03-19  398  			 * Iterate need_discard =
btree (sorted by journal_seq).
4275c7a8422e5c ProofOfConcept  2026-03-19  399  			 * Stop when we hit a se=
q beyond rewind_seq_ondisk.
9a424ccada5a56 Kent Overstreet 2026-03-09  400  			 */
4275c7a8422e5c ProofOfConcept  2026-03-19  401  			ret =3D for_each_btree_k=
ey(trans, iter,
ecf4fc40038a81 Kent Overstreet 2026-03-21  402  					BTREE_ID_need_discard,=
 c->discards.pos, 0, k, ({
4275c7a8422e5c ProofOfConcept  2026-03-19  403  				u64 journal_seq =3D k.k=
->p.inode;
ecf4fc40038a81 Kent Overstreet 2026-03-21  404  				done_queuing =3D journa=
l_seq >=3D c->journal.rewind_seq_ondisk;
ecf4fc40038a81 Kent Overstreet 2026-03-21  405  				if (done_queuing)
9a424ccada5a56 Kent Overstreet 2026-03-09  406  					break;
9a424ccada5a56 Kent Overstreet 2026-03-09  407 =20
ecf4fc40038a81 Kent Overstreet 2026-03-21  408  				if (!s.eagain)
ecf4fc40038a81 Kent Overstreet 2026-03-21  409  					c->discards.pos =3D it=
er.pos;
9a424ccada5a56 Kent Overstreet 2026-03-09  410 =20
ecf4fc40038a81 Kent Overstreet 2026-03-21  411  				bch2_discard_one_bucket=
(trans,
ecf4fc40038a81 Kent Overstreet 2026-03-21  412  							u64_to_bucket(k.k->p=
.offset),
ecf4fc40038a81 Kent Overstreet 2026-03-21  413  							&s, false);
4275c7a8422e5c ProofOfConcept  2026-03-19  414  			}));
ecf4fc40038a81 Kent Overstreet 2026-03-21  415  			if (ret =3D=3D -BCH_ERR_=
max_discards_in_flight)
ecf4fc40038a81 Kent Overstreet 2026-03-21  416  				ret =3D bch2_discards_c=
omplete(trans, &s, false, false);
ecf4fc40038a81 Kent Overstreet 2026-03-21  417 =20
ecf4fc40038a81 Kent Overstreet 2026-03-21  418  		} while (!ret && s.seen &=
& !done_queuing);
ecf4fc40038a81 Kent Overstreet 2026-03-21  419 =20
ecf4fc40038a81 Kent Overstreet 2026-03-21  420  		ret =3D bch2_discards_com=
plete(trans, &s, false, true) ?: ret;
9a424ccada5a56 Kent Overstreet 2026-03-09  421 =20
4275c7a8422e5c ProofOfConcept  2026-03-19  422  		/*
4275c7a8422e5c ProofOfConcept  2026-03-19  423  		 * Rewind buffer policy: =
advance rewind_seq when free space
4275c7a8422e5c ProofOfConcept  2026-03-19  424  		 * is tight, releasing mo=
re buckets for discard.
4275c7a8422e5c ProofOfConcept  2026-03-19  425  		 */
4275c7a8422e5c ProofOfConcept  2026-03-19  426  		struct discard_sectors_to=
_release r =3D discard_sectors_to_release(trans);
9a424ccada5a56 Kent Overstreet 2026-03-09  427 =20
4275c7a8422e5c ProofOfConcept  2026-03-19  428  		if (!ret && r.release) {
4275c7a8422e5c ProofOfConcept  2026-03-19  429  			u64 new_rewind_seq =3D 0;
4275c7a8422e5c ProofOfConcept  2026-03-19  430  			s64 remaining =3D r.rele=
ase;
9a424ccada5a56 Kent Overstreet 2026-03-09  431 =20
4275c7a8422e5c ProofOfConcept  2026-03-19  432  			for_each_btree_key(trans=
, iter,
4275c7a8422e5c ProofOfConcept  2026-03-19  433  					BTREE_ID_need_discard,=
 POS_MIN, 0, k, ({
4275c7a8422e5c ProofOfConcept  2026-03-19  434  				u64 journal_seq =3D k.k=
->p.inode;
4275c7a8422e5c ProofOfConcept  2026-03-19  435  				struct bpos bucket =3D =
u64_to_bucket(k.k->p.offset);
9a424ccada5a56 Kent Overstreet 2026-03-09  436 =20
4275c7a8422e5c ProofOfConcept  2026-03-19  437  				if (remaining <=3D 0)
4275c7a8422e5c ProofOfConcept  2026-03-19  438  					break;
9a424ccada5a56 Kent Overstreet 2026-03-09  439 =20
4275c7a8422e5c ProofOfConcept  2026-03-19  440  				if (journal_seq >=3D c-=
>journal.rewind_seq) {
4275c7a8422e5c ProofOfConcept  2026-03-19  441  					CLASS(bch2_dev_tryget_=
noerror, ca)(c, bucket.inode);
4275c7a8422e5c ProofOfConcept  2026-03-19  442  					if (ca) {
4275c7a8422e5c ProofOfConcept  2026-03-19  443  						new_rewind_seq =3D ma=
x(new_rewind_seq, journal_seq + 1);
4275c7a8422e5c ProofOfConcept  2026-03-19  444  						remaining -=3D ca->mi=
.bucket_size;
9a424ccada5a56 Kent Overstreet 2026-03-09  445  					}
11995b82f6c965 Kent Overstreet 2026-03-17  446  				}
4275c7a8422e5c ProofOfConcept  2026-03-19  447  				0;
4275c7a8422e5c ProofOfConcept  2026-03-19  448  			}));
9a424ccada5a56 Kent Overstreet 2026-03-09  449 =20
11995b82f6c965 Kent Overstreet 2026-03-17  450  			if (new_rewind_seq)
11995b82f6c965 Kent Overstreet 2026-03-17  451  				bch2_journal_advance_re=
wind_seq(&c->journal, new_rewind_seq);
4275c7a8422e5c ProofOfConcept  2026-03-19  452  		}
11995b82f6c965 Kent Overstreet 2026-03-17  453 =20
4275c7a8422e5c ProofOfConcept  2026-03-19  454  		if (!ret && r.flush_journ=
al) {
9a424ccada5a56 Kent Overstreet 2026-03-09  455  			bch2_trans_unlock_long(t=
rans);
11995b82f6c965 Kent Overstreet 2026-03-17  456  			u64 start_time =3D local=
_clock();
9a424ccada5a56 Kent Overstreet 2026-03-09  457  			ret =3D bch2_journal_flu=
sh(&c->journal);
11995b82f6c965 Kent Overstreet 2026-03-17  458  			bch2_time_stats_update(&=
c->times[BCH_TIME_blocked_discard_journal_flush],
11995b82f6c965 Kent Overstreet 2026-03-17  459  					       start_time);
11995b82f6c965 Kent Overstreet 2026-03-17  460  			again =3D true;
9a424ccada5a56 Kent Overstreet 2026-03-09  461  		}
9a424ccada5a56 Kent Overstreet 2026-03-09  462 =20
a4c608248d50d0 ProofOfConcept  2026-03-19  463  		/*
a4c608248d50d0 ProofOfConcept  2026-03-19  464  		 * If the FIFO is empty b=
ut we need free buckets, flush the
a4c608248d50d0 ProofOfConcept  2026-03-19  465  		 * write buffer =E2=80=94 =
need_discard keys may be buffered from
a4c608248d50d0 ProofOfConcept  2026-03-19  466  		 * the alloc trigger's at=
omic section:
a4c608248d50d0 ProofOfConcept  2026-03-19  467  		 */
4275c7a8422e5c ProofOfConcept  2026-03-19  468  		if (!ret && !s.seen && r.=
release) {
a4c608248d50d0 ProofOfConcept  2026-03-19  469  			bch2_btree_write_buffer_=
flush_sync(trans);
ecf4fc40038a81 Kent Overstreet 2026-03-21  470  			c->discards.pos =3D POS_=
MIN;
a4c608248d50d0 ProofOfConcept  2026-03-19  471  			again =3D true;
a4c608248d50d0 ProofOfConcept  2026-03-19  472  		}
796b20996fc24b Kent Overstreet 2026-01-16  473 =20
796b20996fc24b Kent Overstreet 2026-01-16  474  		event_inc_trace(c, bucket=
_discard_worker, buf, ({
11995b82f6c965 Kent Overstreet 2026-03-17  475  			printbuf_tabstop_push(&b=
uf, 24);
4275c7a8422e5c ProofOfConcept  2026-03-19  476  			prt_printf(&buf, "ret %s=
\n", bch2_err_str(ret));
11995b82f6c965 Kent Overstreet 2026-03-17  477 =20
11995b82f6c965 Kent Overstreet 2026-03-17  478  			prt_printf(&buf, "Discar=
d buckets state:\n");
11995b82f6c965 Kent Overstreet 2026-03-17  479  			scoped_guard(printbuf_in=
dent, &buf)
4275c7a8422e5c ProofOfConcept  2026-03-19  480  				discard_buckets_state_t=
o_text(&buf, &s);
11995b82f6c965 Kent Overstreet 2026-03-17  481 =20
11995b82f6c965 Kent Overstreet 2026-03-17  482  			prt_printf(&buf, "Discar=
d buffer state\n");
11995b82f6c965 Kent Overstreet 2026-03-17  483  			scoped_guard(printbuf_in=
dent, &buf) {
11995b82f6c965 Kent Overstreet 2026-03-17  484  				prt_printf(&buf, "relea=
se:\t%llu\n",		r.release);
11995b82f6c965 Kent Overstreet 2026-03-17  485  				prt_printf(&buf, "flush=
_journal:\t%u\n",	r.flush_journal);
11995b82f6c965 Kent Overstreet 2026-03-17  486  			}
796b20996fc24b Kent Overstreet 2026-01-16  487  		}));
11995b82f6c965 Kent Overstreet 2026-03-17  488  	} while (!ret && again);
796b20996fc24b Kent Overstreet 2026-01-16 @489  }
796b20996fc24b Kent Overstreet 2026-01-16  490 =20

:::::: The code at line 489 was first introduced by commit
:::::: 796b20996fc24b2b7524f76613ca6c26b513a313 bcachefs: Split out alloc/d=
iscard.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

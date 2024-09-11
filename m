Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E231AC899
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 15:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726070044; cv=none; b=PaAS2pKEcIF3tPv2rmzaMiEiTjdSb1Wyq1xKigoEMO5RQAgTX/HMsBPQ989PuHQATh+HByQVGvpW0QRqRO5KAW7yQTHbbOvZ4dKBXZ7NBCCWsg/d9s2AbAJdDgZ2KXPuHRztrDbXj56ozkWzVTiTsFH5yyHmt3cEuu/d4HVDBZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726070044; c=relaxed/simple;
	bh=ST9B6GA7mFMo503BCI5wmQE+xbmMMP9TDWCNyTeOtbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QSNr+0HidC3F+V30SqZYGLt7vxOqfrFfP/+EsScAOVpz4NOf2DQrSWJtrcd0qSYk9AtM2ExcUVDeAgHHan6z2BpZsg6V8/wL4pSJLH+GXrZUsdBX8oOCWhOIkgYYHvMuNMTIcZ2s0MzPYNOfG1z5hlTRebFVGX4RhTf2xDj4uqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ergh1G3O; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ergh1G3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726070043; x=1757606043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ST9B6GA7mFMo503BCI5wmQE+xbmMMP9TDWCNyTeOtbc=;
  b=Ergh1G3Oa+GVnm7c/JJKuZzvMHqbqO74Fi2hETM383QDSX0y9N2ytG/5
   JPcTPhAiIr85oyGaLG/B0Bvfp3uLUI86p4XBw4+YQtL3/rilXb21fYREC
   UZqedHlXXnjB3QtZ79u2vyCJlXVDTTm7YFAKWS+HRWjFCM8xZC3GMXvoA
   4It3e7RbB4AvNZmLvo0IhmN0QnziZY+idqP6/6NQ57+ZnJP3R+fwQZSVj
   JG5NV2dMydiEf2GidVskII6c9dpEluhqWO+xbNIiApxKW19dWeFkB1AsT
   FEoDy3zmQGqFXeVThuDtliY1KvAWaX2LvuTlfG0S2IFatKL78++Z0+uHM
   g==;
X-CSE-ConnectionGUID: KHvY+jI6SX6Q0CL3/TPCWw==
X-CSE-MsgGUID: L9pGNwM3SHeBkWgyq/SS2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="50295884"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="50295884"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:54:03 -0700
X-CSE-ConnectionGUID: JO9xbDriTfOM7KmnAFiWUA==
X-CSE-MsgGUID: X2QXCBH3SeaAvnVX1281sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="72197175"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2024 08:54:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soPfL-0003mo-02;
	Wed, 11 Sep 2024 15:53:59 +0000
Date: Wed, 11 Sep 2024 23:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10192/10862] fs/bcachefs/ec.c:903:24-25: Unneeded
 semicolon
Message-ID: <202409112351.VArA2OwR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   32ffa5373540a8d1c06619f52d019c6cdc948bb4
commit: d11ad060548411650467240ea1041b4f490b0e23 [10192/10862] bcachefs: improve error messages in bch2_ec_read_extent()
config: loongarch-randconfig-r063-20240911 (https://download.01.org/0day-ci/archive/20240911/202409112351.VArA2OwR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409112351.VArA2OwR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/ec.c:903:24-25: Unneeded semicolon

vim +903 fs/bcachefs/ec.c

   830	
   831	/* recovery read path: */
   832	int bch2_ec_read_extent(struct btree_trans *trans, struct bch_read_bio *rbio,
   833				struct bkey_s_c orig_k)
   834	{
   835		struct bch_fs *c = trans->c;
   836		struct ec_stripe_buf *buf = NULL;
   837		struct closure cl;
   838		struct bch_stripe *v;
   839		unsigned i, offset;
   840		const char *msg = NULL;
   841		struct printbuf msgbuf = PRINTBUF;
   842		int ret = 0;
   843	
   844		closure_init_stack(&cl);
   845	
   846		BUG_ON(!rbio->pick.has_ec);
   847	
   848		buf = kzalloc(sizeof(*buf), GFP_NOFS);
   849		if (!buf)
   850			return -BCH_ERR_ENOMEM_ec_read_extent;
   851	
   852		ret = lockrestart_do(trans, get_stripe_key_trans(trans, rbio->pick.ec.idx, buf));
   853		if (ret) {
   854			msg = "stripe not found";
   855			goto err;
   856		}
   857	
   858		v = &bkey_i_to_stripe(&buf->key)->v;
   859	
   860		if (!bch2_ptr_matches_stripe(v, rbio->pick)) {
   861			msg = "pointer doesn't match stripe";
   862			goto err;
   863		}
   864	
   865		offset = rbio->bio.bi_iter.bi_sector - v->ptrs[rbio->pick.ec.block].offset;
   866		if (offset + bio_sectors(&rbio->bio) > le16_to_cpu(v->sectors)) {
   867			msg = "read is bigger than stripe";
   868			goto err;
   869		}
   870	
   871		ret = ec_stripe_buf_init(buf, offset, bio_sectors(&rbio->bio));
   872		if (ret) {
   873			msg = "-ENOMEM";
   874			goto err;
   875		}
   876	
   877		for (i = 0; i < v->nr_blocks; i++)
   878			ec_block_io(c, buf, REQ_OP_READ, i, &cl);
   879	
   880		closure_sync(&cl);
   881	
   882		if (ec_nr_failed(buf) > v->nr_redundant) {
   883			msg = "unable to read enough blocks";
   884			goto err;
   885		}
   886	
   887		ec_validate_checksums(c, buf);
   888	
   889		ret = ec_do_recov(c, buf);
   890		if (ret)
   891			goto err;
   892	
   893		memcpy_to_bio(&rbio->bio, rbio->bio.bi_iter,
   894			      buf->data[rbio->pick.ec.block] + ((offset - buf->offset) << 9));
   895	out:
   896		ec_stripe_buf_exit(buf);
   897		kfree(buf);
   898		return ret;
   899	err:
   900		bch2_bkey_val_to_text(&msgbuf, c, orig_k);
   901		bch_err_ratelimited(c,
   902				    "error doing reconstruct read: %s\n  %s", msg, msgbuf.buf);
 > 903		printbuf_exit(&msgbuf);;
   904		ret = -BCH_ERR_stripe_reconstruct;
   905		goto out;
   906	}
   907	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF74E2459C9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 17:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768669571; cv=none; b=WGFFUc1JxCWgH/D1MSyaFpEQWQ5tGHmkIAeJp2q6EmX9xZhrWl8GFUIqxy4C15NiuHC9kHzPpmsr9ifiHABQS2/LxurDB905mZGg4x2YeE+h+b2CELqkSLpIKapBbx2nR/0/s+ykwxkkmDjRNKCmhaIL5TS9PYhxkOnwUr2PaPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768669571; c=relaxed/simple;
	bh=8GmzNUZZJ6VZqhc6OebQYN1xT/d4Cm/tCWEUz4xIZ6A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Trs9k9lyp80HB6TXYhz4uOqVsVsvh/y1qzh2mmrL1jYSCEmuof8Y4drIOjbQiKTCmEL4uvx2i7jjj7ZYgJLbeaEbK1woJbm2Ht97fcbjN06gH8KvNNe5y2ChGyXMnUKuemFIyV+pHLf5197aRSaj+zo96cvQt27u6GH9lN6dfao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPeLMgM+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPeLMgM+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768669570; x=1800205570;
  h=date:from:to:cc:subject:message-id;
  bh=8GmzNUZZJ6VZqhc6OebQYN1xT/d4Cm/tCWEUz4xIZ6A=;
  b=TPeLMgM+yD/St2+0CGKhvpKxcu/Nfbs/KXCzGlRG0KDB85TZTmmTeawT
   B2vqZ9aOWT3IHLwe3bUq4/Pcgmvbp9KAJvzIsyUDt1qTuEkvjAkTYXFe2
   8DbfLrX02CX41E1NJhcb+ScZl0dXU2NvtKIPypmAR4f0sNAriAbiydSGK
   qZB+9mOfYuwcHctYgb9rW40CQbQLA+hFX6T7zXIjzdlOqr/d8QbiAJgui
   BgscbZJvtsdIoiphB0rpgQbmHE8Y6lbvFfacSYUFvYFGw7qpT9FMMV+L1
   HVARZlcAqT/jkSgmrxnoSBrBi2A71mR89zHsmAUVpmUbYbgTcF2ot+5Hj
   A==;
X-CSE-ConnectionGUID: zV+qSEzbRGKcNCyPxfA3yg==
X-CSE-MsgGUID: FDclCkBeQJ6X1+AAOIIZAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="80589861"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="80589861"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 09:06:09 -0800
X-CSE-ConnectionGUID: rirIxlqrQQ6HhFWIe3cv3w==
X-CSE-MsgGUID: 1bR0xk/pRpCvzy08sJhtEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205915423"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jan 2026 09:06:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh9kT-00000000M4O-3fh7;
	Sat, 17 Jan 2026 17:06:05 +0000
Date: Sun, 18 Jan 2026 01:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 216/216]
 fs/bcachefs/data/ec/create.c:802:2: error: a label can only be part of a
 statement and a declaration is not a statement
Message-ID: <202601180151.GSIWWsvn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   bde39b90107558a6e5c84934716bf171ced1cef5
commit: bde39b90107558a6e5c84934716bf171ced1cef5 [216/216] bcachefs: Split up data/ec.c
config: sparc-randconfig-001-20260117 (https://download.01.org/0day-ci/archive/20260118/202601180151.GSIWWsvn-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180151.GSIWWsvn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180151.GSIWWsvn-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/data/ec/create.c: In function '__bch2_ec_stripe_head_get':
>> fs/bcachefs/data/ec/create.c:802:2: error: a label can only be part of a statement and a declaration is not a statement
     unsigned long rw_devs_change_count = READ_ONCE(c->allocator.rw_devs_change_count);
     ^~~~~~~~


vim +802 fs/bcachefs/data/ec/create.c

   760	
   761	static struct ec_stripe_head *
   762	__bch2_ec_stripe_head_get(struct btree_trans *trans,
   763				  unsigned disk_label,
   764				  unsigned algo,
   765				  unsigned redundancy,
   766				  enum bch_watermark watermark)
   767	{
   768		struct bch_fs *c = trans->c;
   769		struct ec_stripe_head *h;
   770	
   771		if (!redundancy)
   772			return NULL;
   773	
   774		int ret = bch2_trans_mutex_lock(trans, &c->ec.stripe_head_lock);
   775		if (ret)
   776			return ERR_PTR(ret);
   777	
   778		if (test_bit(BCH_FS_going_ro, &c->flags)) {
   779			h = ERR_PTR(bch_err_throw(c, erofs_no_writes));
   780			goto err;
   781		}
   782	
   783		list_for_each_entry(h, &c->ec.stripe_head_list, list)
   784			if (h->disk_label	== disk_label &&
   785			    h->algo		== algo &&
   786			    h->redundancy	== redundancy &&
   787			    h->watermark	== watermark) {
   788				ret = bch2_trans_mutex_lock(trans, &h->lock);
   789				if (ret) {
   790					h = ERR_PTR(ret);
   791					goto err;
   792				}
   793				goto found;
   794			}
   795	
   796		h = ec_new_stripe_head_alloc(c, disk_label, algo, redundancy, watermark);
   797		if (!h) {
   798			h = ERR_PTR(bch_err_throw(c, ENOMEM_stripe_head_alloc));
   799			goto err;
   800		}
   801	found:
 > 802		unsigned long rw_devs_change_count = READ_ONCE(c->allocator.rw_devs_change_count);
   803		if (h->rw_devs_change_count != rw_devs_change_count) {
   804			ec_stripe_head_devs_update(c, h);
   805			h->rw_devs_change_count = rw_devs_change_count;
   806		}
   807	
   808		if (h->insufficient_devs) {
   809			mutex_unlock(&h->lock);
   810			h = NULL;
   811		}
   812	err:
   813		mutex_unlock(&c->ec.stripe_head_lock);
   814		return h;
   815	}
   816	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

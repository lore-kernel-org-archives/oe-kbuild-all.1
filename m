Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB902D24BC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 17:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767549444; cv=none; b=tz5uxgnnlq3ZpWiX8kADacXJYZDyIFAAHk/tU1RXIWPIksTZZgkD1JkGF7mPR8cFwCalRhoRol+j5e+r5n6LdzzzqMrCXGIEqVIGHR7L3YowDIBN+Ou9EkOml4sf5dHsNl/SpP6mWiMxrMJT1UAocC+j2kQIP+4F4LeV0xz5h3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767549444; c=relaxed/simple;
	bh=rpYr84qyQDm6bynhH3+30W8Q9qixmvbqPnRe/WiROxk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ABZ1ctD7pzeAUKEcEkFX+OFm3kjmFJN0vwEKF1CH5ZeRbGuyWlPapPkTJNJSgtiibQFkbOUShYdeeZ85oPzzWKnJWs3/q+rOH3fgmFgiTEwo4X4d5J2+xP0uzXlOJTxloWwVhwoy3rZGE7qMvGFfrOqe5p/R97LuuHhC2CIY2QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWolqK1L; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWolqK1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767549443; x=1799085443;
  h=date:from:to:cc:subject:message-id;
  bh=rpYr84qyQDm6bynhH3+30W8Q9qixmvbqPnRe/WiROxk=;
  b=JWolqK1LiSMGNjFA+nULNI9OBnkEo6jwIyDJIhy0nfov/gX+ae20Eyot
   t4COGXrQ/9vQB/t4L/bjpSKA3CXWPsrqWYyvoLwaIVzLSwoMVh4Ma2H+w
   HQjVm6gjMd8UmfgaPIox30bXTLwPxtLYOzCS2/Hr9ojAa8CaX3b64v8wB
   3nnsEOMSl1dF9PmEvhMvjHRbu2kguJxF/2m18Y8I+442jKPdPh13T9xLv
   znfvoOZaXhgs6X3A8YNdpHpMDPpirAzw5cYUsNW6EMgJftELoga0EDr+e
   RhwbTUP+10rSYFnM6IkbnL0kSsivIwpPay3L1Th80VPkibUgCSBQfI+FC
   g==;
X-CSE-ConnectionGUID: wIT50qADTHu9IvD5+yqeTg==
X-CSE-MsgGUID: aAV+0sPuRRSXkczKK78Jgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="79569054"
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="79569054"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 09:57:22 -0800
X-CSE-ConnectionGUID: gJ29+HhUTX6ExHiDt3CeyA==
X-CSE-MsgGUID: gHn6U1r3RymZZWSmEs22TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="225747560"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jan 2026 09:57:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcSLu-000000000iX-1aLj;
	Sun, 04 Jan 2026 17:57:18 +0000
Date: Mon, 05 Jan 2026 01:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 96/115] fs/bcachefs/data/ec.c:1711:2:
 error: a label can only be part of a statement and a declaration is not a
 statement
Message-ID: <202601050127.UXBdXHVn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   c8443102a129f8cf440d2e0e02ee631753f16327
commit: 60ec49d3d5c5f92d0abff0a4886461be69672af3 [96/115] bcachefs: BCH_WRITE_must_ec, alloc_request.ec_replicas
config: m68k-randconfig-r112-20260104 (https://download.01.org/0day-ci/archive/20260105/202601050127.UXBdXHVn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601050127.UXBdXHVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601050127.UXBdXHVn-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/data/ec.c: In function '__bch2_ec_stripe_head_get':
>> fs/bcachefs/data/ec.c:1711:2: error: a label can only be part of a statement and a declaration is not a statement
    1711 |  unsigned long rw_devs_change_count = READ_ONCE(c->allocator.rw_devs_change_count);
         |  ^~~~~~~~


vim +1711 fs/bcachefs/data/ec.c

  1669	
  1670	static struct ec_stripe_head *
  1671	__bch2_ec_stripe_head_get(struct btree_trans *trans,
  1672				  unsigned disk_label,
  1673				  unsigned algo,
  1674				  unsigned redundancy,
  1675				  enum bch_watermark watermark)
  1676	{
  1677		struct bch_fs *c = trans->c;
  1678		struct ec_stripe_head *h;
  1679	
  1680		if (!redundancy)
  1681			return NULL;
  1682	
  1683		int ret = bch2_trans_mutex_lock(trans, &c->ec.stripe_head_lock);
  1684		if (ret)
  1685			return ERR_PTR(ret);
  1686	
  1687		if (test_bit(BCH_FS_going_ro, &c->flags)) {
  1688			h = ERR_PTR(bch_err_throw(c, erofs_no_writes));
  1689			goto err;
  1690		}
  1691	
  1692		list_for_each_entry(h, &c->ec.stripe_head_list, list)
  1693			if (h->disk_label	== disk_label &&
  1694			    h->algo		== algo &&
  1695			    h->redundancy	== redundancy &&
  1696			    h->watermark	== watermark) {
  1697				ret = bch2_trans_mutex_lock(trans, &h->lock);
  1698				if (ret) {
  1699					h = ERR_PTR(ret);
  1700					goto err;
  1701				}
  1702				goto found;
  1703			}
  1704	
  1705		h = ec_new_stripe_head_alloc(c, disk_label, algo, redundancy, watermark);
  1706		if (!h) {
  1707			h = ERR_PTR(bch_err_throw(c, ENOMEM_stripe_head_alloc));
  1708			goto err;
  1709		}
  1710	found:
> 1711		unsigned long rw_devs_change_count = READ_ONCE(c->allocator.rw_devs_change_count);
  1712		if (h->rw_devs_change_count != rw_devs_change_count) {
  1713			ec_stripe_head_devs_update(c, h);
  1714			h->rw_devs_change_count = rw_devs_change_count;
  1715		}
  1716	
  1717		if (h->insufficient_devs) {
  1718			mutex_unlock(&h->lock);
  1719			h = NULL;
  1720		}
  1721	err:
  1722		mutex_unlock(&c->ec.stripe_head_lock);
  1723		return h;
  1724	}
  1725	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

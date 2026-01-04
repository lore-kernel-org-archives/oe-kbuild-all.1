Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E211B21773F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 22:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767565649; cv=none; b=cKphhCQmJzFCRk82ijSNOENdGDpueV3w2/8xSdMjdjkLLbGZYF1MZT1WklYYWDDGoK4tuA5Wf132/eGhOpPClFB0EcqMJuNE48TDe5kiWq/vDhve62vDFBbBJ+NGwROOiHrdvwzZQynHFFOTFFVAY11qCir+fXbnuOGJMBLN2Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767565649; c=relaxed/simple;
	bh=7aXsAw45KVqFjb9IH1pCVNLShuITe2xk4j/1PJKxSr8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C8IDdcDnhYwLzdxPQWKLNtokpDB0Yanjo9FYblmOqrQFKMXJ5AgaIUcYM7krg+U3MHHrpW69icJs5t4ksm1HuYvoTSEJlF1uraIFGP4S5WEF5jC3OyqcqifE8wnJphDvXiAfE0x9oQcSseYIYQwrbTCN/ZgXRfxNBt8eV4Ei09g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bs5JazyC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bs5JazyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767565648; x=1799101648;
  h=date:from:to:cc:subject:message-id;
  bh=7aXsAw45KVqFjb9IH1pCVNLShuITe2xk4j/1PJKxSr8=;
  b=bs5JazyCajimdxVr8OdbzcWVL2ZKskYdQHRNJOJLWsNA1fOntyU08CCW
   cPpYn4LtMZzyQIlC1ESvJksrT+5eJtJUdPqz3jU32SEW3VS6QjqFrKu+/
   NF5be1qDHHQVnw8xtQZ95hNkstuxe6xJGezRgDbmkeYcoIWH2dveIvLb6
   RRuxWaj4JsbH3B3PKe85zPA667euYwJEZW2gf9jMyGHmFTwhskPdCcuih
   xWfFpa1lYdseCFztsQXov6Q8xh46MUCra0em3p7tmcm0ywAbynOIHWdYI
   IBWnVl/pBjiCmqTRYG1s9AswEKOfPOvZ0kAGzxsVqUyxKR5wIdb+DUzWz
   g==;
X-CSE-ConnectionGUID: 1j20/TZdSAmuSsxgw1jSxw==
X-CSE-MsgGUID: L/nfIMCATl2W0Oy8uqVZGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="79574917"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="79574917"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 14:27:27 -0800
X-CSE-ConnectionGUID: CTyxR74HRqqCWdIaMpnTWg==
X-CSE-MsgGUID: 5BMDx1BfSKKYAusD0yqWIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="233386079"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jan 2026 14:27:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcWZH-000000000of-3vqn;
	Sun, 04 Jan 2026 22:27:23 +0000
Date: Mon, 05 Jan 2026 06:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 96/117] fs/bcachefs/data/ec.c:1711:2:
 error: expected expression
Message-ID: <202601050601.aCEewj8A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   77cf6b5a3a079b55e3b202da0ec474e0c3ee7b00
commit: 60ec49d3d5c5f92d0abff0a4886461be69672af3 [96/117] bcachefs: BCH_WRITE_must_ec, alloc_request.ec_replicas
config: powerpc64-randconfig-r131-20260105 (https://download.01.org/0day-ci/archive/20260105/202601050601.aCEewj8A-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601050601.aCEewj8A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601050601.aCEewj8A-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/data/ec.c:1711:2: error: expected expression
           unsigned long rw_devs_change_count = READ_ONCE(c->allocator.rw_devs_change_count);
           ^
>> fs/bcachefs/data/ec.c:1712:33: error: use of undeclared identifier 'rw_devs_change_count'
           if (h->rw_devs_change_count != rw_devs_change_count) {
                                          ^
   fs/bcachefs/data/ec.c:1714:29: error: use of undeclared identifier 'rw_devs_change_count'
                   h->rw_devs_change_count = rw_devs_change_count;
                                             ^
   3 errors generated.


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
> 1712		if (h->rw_devs_change_count != rw_devs_change_count) {
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

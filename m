Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E420307
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705499654; cv=none; b=hwaIp8HYbzEgKIka/kUe6F/KndFP/PLTvPGFdkHtqnUs3xPMlyXpG3tZEBBam3zdWYbBfe+SSuW29VpLMIp1hi8PPMXCli0y3G31L7ajZHgMG6kynopeNE2xZ4ao/X3MzqlR395DwbHLJckmBTStznQHhft/hi2FK8j+R+dyykY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705499654; c=relaxed/simple;
	bh=RsDYYhAXyCkg8b9dp9cHoIHW7NnKRGtWQb9rJsyA5KI=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=nEXMITUKFI26quI4WfopPzFFeBd8A0WJ6rJLwLwW+XisaySG5ZBUHEzcN8NSzUhu+hqFnEOFCl9RS3bNGVmwKU/pdPP7rDWFPa+Hda9NBnly+uBHMkKAoxrOny7hSoSOv7pz1SAOQcyzUf3Haoj3PYVSi3EGSoyvOSzlVtY7114=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BT26mb7J; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BT26mb7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705499653; x=1737035653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RsDYYhAXyCkg8b9dp9cHoIHW7NnKRGtWQb9rJsyA5KI=;
  b=BT26mb7JG+uAu7aWjh7KucA2pSzai0tx6zqf1zZk8VeOUUDCsFTh5wtX
   W9cv4oizwifZ+azpXQ6XuQ1ThFRPkyjxQbQjaa1WF4PaMrN2U+O/QKhKX
   z8TRqe3BuiS8kp4I5BL4LyqpUGJxL0QwbfznFM783m+olI1xSzzvrU0eP
   9iJDpnp67E/oUI7ixP/CcY+Kv7yINBV+ZqPdUkeQiJcdeVBj5CZ/kNSN3
   pi95i6FQpI9b1Hbcz9CMRTLNh5TVajtjRLkQrA9CEmrBsUhEE0Km46S5f
   q03UVxeYC0E5HIFEz7XZ/IMmZDer2mMCHN9mYpytF+pfBN/oOeoSp4SXZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6874032"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6874032"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 05:54:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="26493561"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jan 2024 05:54:05 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQ6Ml-00023e-1L;
	Wed, 17 Jan 2024 13:54:03 +0000
Date: Wed, 17 Jan 2024 21:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13597/13716]
 fs/bcachefs/btree_write_buffer.c:128:24: warning: unused variable 'c'
Message-ID: <202401172139.XSfsNhrJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   943b9f0ab2cfbaea148dd6ac279957eb08b96904
commit: 3e76edb0f4db19fca9ee02a6c163a670bc66fa2c [13597/13716] bcachefs: Prep work for variable size btree node buffers
config: x86_64-buildonly-randconfig-003-20240117 (https://download.01.org/0day-ci/archive/20240117/202401172139.XSfsNhrJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401172139.XSfsNhrJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401172139.XSfsNhrJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/btree_write_buffer.c: In function 'wb_flush_one':
>> fs/bcachefs/btree_write_buffer.c:128:24: warning: unused variable 'c' [-Wunused-variable]
     128 |         struct bch_fs *c = trans->c;
         |                        ^


vim +/c +128 fs/bcachefs/btree_write_buffer.c

ab4fb4b678c378 Kent Overstreet 2023-11-26  123  
ab4fb4b678c378 Kent Overstreet 2023-11-26  124  static inline int wb_flush_one(struct btree_trans *trans, struct btree_iter *iter,
920e69bc3db88d Kent Overstreet 2023-01-04  125  			       struct btree_write_buffered_key *wb,
ab4fb4b678c378 Kent Overstreet 2023-11-26  126  			       bool *write_locked, size_t *fast)
920e69bc3db88d Kent Overstreet 2023-01-04  127  {
920e69bc3db88d Kent Overstreet 2023-01-04 @128  	struct bch_fs *c = trans->c;
920e69bc3db88d Kent Overstreet 2023-01-04  129  	struct btree_path *path;
920e69bc3db88d Kent Overstreet 2023-01-04  130  	int ret;
920e69bc3db88d Kent Overstreet 2023-01-04  131  
ab4fb4b678c378 Kent Overstreet 2023-11-26  132  	EBUG_ON(!wb->journal_seq);
09caeabe1a5daa Kent Overstreet 2023-11-02  133  	EBUG_ON(!c->btree_write_buffer.flushing.pin.seq);
09caeabe1a5daa Kent Overstreet 2023-11-02  134  	EBUG_ON(c->btree_write_buffer.flushing.pin.seq > wb->journal_seq);
09caeabe1a5daa Kent Overstreet 2023-11-02  135  
920e69bc3db88d Kent Overstreet 2023-01-04  136  	ret = bch2_btree_iter_traverse(iter);
920e69bc3db88d Kent Overstreet 2023-01-04  137  	if (ret)
920e69bc3db88d Kent Overstreet 2023-01-04  138  		return ret;
920e69bc3db88d Kent Overstreet 2023-01-04  139  
e17b93eb36729c Kent Overstreet 2023-11-07  140  	/*
e17b93eb36729c Kent Overstreet 2023-11-07  141  	 * We can't clone a path that has write locks: unshare it now, before
e17b93eb36729c Kent Overstreet 2023-11-07  142  	 * set_pos and traverse():
e17b93eb36729c Kent Overstreet 2023-11-07  143  	 */
07f383c71fadc9 Kent Overstreet 2023-12-04  144  	if (btree_iter_path(trans, iter)->ref > 1)
07f383c71fadc9 Kent Overstreet 2023-12-04  145  		iter->path = __bch2_btree_path_make_mut(trans, iter->path, true, _THIS_IP_);
e17b93eb36729c Kent Overstreet 2023-11-07  146  
07f383c71fadc9 Kent Overstreet 2023-12-04  147  	path = btree_iter_path(trans, iter);
920e69bc3db88d Kent Overstreet 2023-01-04  148  
920e69bc3db88d Kent Overstreet 2023-01-04  149  	if (!*write_locked) {
920e69bc3db88d Kent Overstreet 2023-01-04  150  		ret = bch2_btree_node_lock_write(trans, path, &path->l[0].b->c);
920e69bc3db88d Kent Overstreet 2023-01-04  151  		if (ret)
920e69bc3db88d Kent Overstreet 2023-01-04  152  			return ret;
920e69bc3db88d Kent Overstreet 2023-01-04  153  
920e69bc3db88d Kent Overstreet 2023-01-04  154  		bch2_btree_node_prep_for_write(trans, path, path->l[0].b);
920e69bc3db88d Kent Overstreet 2023-01-04  155  		*write_locked = true;
920e69bc3db88d Kent Overstreet 2023-01-04  156  	}
920e69bc3db88d Kent Overstreet 2023-01-04  157  
3e76edb0f4db19 Kent Overstreet 2024-01-16  158  	if (unlikely(!bch2_btree_node_insert_fits(path->l[0].b, wb->k.k.u64s))) {
920e69bc3db88d Kent Overstreet 2023-01-04  159  		*write_locked = false;
ab4fb4b678c378 Kent Overstreet 2023-11-26  160  		return wb_flush_one_slowpath(trans, iter, wb);
920e69bc3db88d Kent Overstreet 2023-01-04  161  	}
920e69bc3db88d Kent Overstreet 2023-01-04  162  
920e69bc3db88d Kent Overstreet 2023-01-04  163  	bch2_btree_insert_key_leaf(trans, path, &wb->k, wb->journal_seq);
920e69bc3db88d Kent Overstreet 2023-01-04  164  	(*fast)++;
920e69bc3db88d Kent Overstreet 2023-01-04  165  	return 0;
920e69bc3db88d Kent Overstreet 2023-01-04  166  }
920e69bc3db88d Kent Overstreet 2023-01-04  167  

:::::: The code at line 128 was first introduced by commit
:::::: 920e69bc3db88d3825c69190cafd43f0a1918d3b bcachefs: Btree write buffer

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458BF20FE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 08:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mamM/WdG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699173343; x=1730709343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IL6YhhEai/dBby2vuRq88F712WxFFmhiMl3DEpL4Z9Y=;
  b=mamM/WdG0meENZwhuSLrWqCgPA1aQZxMBzgsTEAbCyzf0yJyoXMsbY81
   CU2Y3yTmTO5yjkjtviLMG1ULpJ6wRFqx37oftLgeYDvKZNGD2WjCKwuEf
   poHFcPAlsflOYBl9bq3qWp8Us6Zzk1VIS8K/MIFEcV8yC9KR9dCcVE7Us
   2PqiF1Qg5MLHmhCxOLNfm1GrUJjCgK8e/ymY3tg5FTHC4zE6GvZpw9MN4
   8KPD8JrR0fTpYx7YUH+2JOPLUlMVjwkbhOMlzc2envkWLU6xmOMpZwfbc
   ZkvjiXDtiLC9flUI6UALSXPHxN80cW7j8IU78wondF2SbUvMB4gxSaM/3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="379525510"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="379525510"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 01:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="3346407"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2023 01:35:39 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzYbY-0005Cq-1s;
	Sun, 05 Nov 2023 08:35:36 +0000
Date: Sun, 5 Nov 2023 16:35:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: fs/ubifs/replay.c:359: warning: Function parameter or member 'hash'
 not described in 'insert_node'
Message-ID: <202311051618.D7YUE1Rr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sascha,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aea6bf908d730b01bd264a8821159db9463c111c
commit: 16a26b20d2afd0cf063816725b45b12e78d5bb31 ubifs: authentication: Add hashes to index nodes
date:   5 years ago
config: x86_64-randconfig-012-20231101 (https://download.01.org/0day-ci/archive/20231105/202311051618.D7YUE1Rr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051618.D7YUE1Rr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051618.D7YUE1Rr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ubifs/replay.c:71: warning: Function parameter or member 'hash' not described in 'replay_entry'
>> fs/ubifs/replay.c:359: warning: Function parameter or member 'hash' not described in 'insert_node'
>> fs/ubifs/replay.c:408: warning: Function parameter or member 'hash' not described in 'insert_dent'
   fs/ubifs/replay.c:792: warning: Excess function parameter 'ref_lnum' description in 'validate_ref'
   fs/ubifs/replay.c:792: warning: Excess function parameter 'ref_offs' description in 'validate_ref'
   fs/ubifs/replay.o: warning: objtool: ubifs_validate_entry()+0x257: sibling call from callable instruction with modified stack frame
   fs/ubifs/replay.o: warning: objtool: replay_bud()+0x547: sibling call from callable instruction with modified stack frame


vim +359 fs/ubifs/replay.c

debf12d54182b3 Artem Bityutskiy   2011-05-15  334  
debf12d54182b3 Artem Bityutskiy   2011-05-15  335  /**
debf12d54182b3 Artem Bityutskiy   2011-05-15  336   * insert_node - insert a node to the replay list
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  337   * @c: UBIFS file-system description object
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  338   * @lnum: node logical eraseblock number
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  339   * @offs: node offset
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  340   * @len: node length
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  341   * @key: node key
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  342   * @sqnum: sequence number
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  343   * @deletion: non-zero if this is a deletion
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  344   * @used: number of bytes in use in a LEB
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  345   * @old_size: truncation old size
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  346   * @new_size: truncation new size
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  347   *
debf12d54182b3 Artem Bityutskiy   2011-05-15  348   * This function inserts a scanned non-direntry node to the replay list. The
debf12d54182b3 Artem Bityutskiy   2011-05-15  349   * replay list contains @struct replay_entry elements, and we sort this list in
debf12d54182b3 Artem Bityutskiy   2011-05-15  350   * sequence number order before applying it. The replay list is applied at the
debf12d54182b3 Artem Bityutskiy   2011-05-15  351   * very end of the replay process. Since the list is sorted in sequence number
debf12d54182b3 Artem Bityutskiy   2011-05-15  352   * order, the older modifications are applied first. This function returns zero
debf12d54182b3 Artem Bityutskiy   2011-05-15  353   * in case of success and a negative error code in case of failure.
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  354   */
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  355  static int insert_node(struct ubifs_info *c, int lnum, int offs, int len,
16a26b20d2afd0 Sascha Hauer       2018-09-07  356  		       const u8 *hash, union ubifs_key *key,
16a26b20d2afd0 Sascha Hauer       2018-09-07  357  		       unsigned long long sqnum, int deletion, int *used,
16a26b20d2afd0 Sascha Hauer       2018-09-07  358  		       loff_t old_size, loff_t new_size)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14 @359  {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  360  	struct replay_entry *r;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  361  
515315a123af64 Artem Bityutskiy   2012-01-13  362  	dbg_mntk(key, "add LEB %d:%d, key ", lnum, offs);
debf12d54182b3 Artem Bityutskiy   2011-05-15  363  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  364  	if (key_inum(c, key) >= c->highest_inum)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  365  		c->highest_inum = key_inum(c, key);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  366  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  367  	r = kzalloc(sizeof(struct replay_entry), GFP_KERNEL);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  368  	if (!r)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  369  		return -ENOMEM;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  370  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  371  	if (!deletion)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  372  		*used += ALIGN(len, 8);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  373  	r->lnum = lnum;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  374  	r->offs = offs;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  375  	r->len = len;
16a26b20d2afd0 Sascha Hauer       2018-09-07  376  	ubifs_copy_hash(c, hash, r->hash);
074bcb9b5ce698 Artem Bityutskiy   2011-05-15  377  	r->deletion = !!deletion;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  378  	r->sqnum = sqnum;
074bcb9b5ce698 Artem Bityutskiy   2011-05-15  379  	key_copy(c, key, &r->key);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  380  	r->old_size = old_size;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  381  	r->new_size = new_size;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  382  
debf12d54182b3 Artem Bityutskiy   2011-05-15  383  	list_add_tail(&r->list, &c->replay_list);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  384  	return 0;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  385  }
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  386  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  387  /**
debf12d54182b3 Artem Bityutskiy   2011-05-15  388   * insert_dent - insert a directory entry node into the replay list.
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  389   * @c: UBIFS file-system description object
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  390   * @lnum: node logical eraseblock number
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  391   * @offs: node offset
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  392   * @len: node length
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  393   * @key: node key
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  394   * @name: directory entry name
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  395   * @nlen: directory entry name length
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  396   * @sqnum: sequence number
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  397   * @deletion: non-zero if this is a deletion
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  398   * @used: number of bytes in use in a LEB
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  399   *
debf12d54182b3 Artem Bityutskiy   2011-05-15  400   * This function inserts a scanned directory entry node or an extended
debf12d54182b3 Artem Bityutskiy   2011-05-15  401   * attribute entry to the replay list. Returns zero in case of success and a
debf12d54182b3 Artem Bityutskiy   2011-05-15  402   * negative error code in case of failure.
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  403   */
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  404  static int insert_dent(struct ubifs_info *c, int lnum, int offs, int len,
16a26b20d2afd0 Sascha Hauer       2018-09-07  405  		       const u8 *hash, union ubifs_key *key,
16a26b20d2afd0 Sascha Hauer       2018-09-07  406  		       const char *name, int nlen, unsigned long long sqnum,
16a26b20d2afd0 Sascha Hauer       2018-09-07  407  		       int deletion, int *used)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14 @408  {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  409  	struct replay_entry *r;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  410  	char *nbuf;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  411  
515315a123af64 Artem Bityutskiy   2012-01-13  412  	dbg_mntk(key, "add LEB %d:%d, key ", lnum, offs);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  413  	if (key_inum(c, key) >= c->highest_inum)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  414  		c->highest_inum = key_inum(c, key);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  415  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  416  	r = kzalloc(sizeof(struct replay_entry), GFP_KERNEL);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  417  	if (!r)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  418  		return -ENOMEM;
debf12d54182b3 Artem Bityutskiy   2011-05-15  419  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  420  	nbuf = kmalloc(nlen + 1, GFP_KERNEL);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  421  	if (!nbuf) {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  422  		kfree(r);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  423  		return -ENOMEM;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  424  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  425  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  426  	if (!deletion)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  427  		*used += ALIGN(len, 8);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  428  	r->lnum = lnum;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  429  	r->offs = offs;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  430  	r->len = len;
16a26b20d2afd0 Sascha Hauer       2018-09-07  431  	ubifs_copy_hash(c, hash, r->hash);
074bcb9b5ce698 Artem Bityutskiy   2011-05-15  432  	r->deletion = !!deletion;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  433  	r->sqnum = sqnum;
074bcb9b5ce698 Artem Bityutskiy   2011-05-15  434  	key_copy(c, key, &r->key);
f4f61d2cc6d878 Richard Weinberger 2016-11-11  435  	fname_len(&r->nm) = nlen;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  436  	memcpy(nbuf, name, nlen);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  437  	nbuf[nlen] = '\0';
f4f61d2cc6d878 Richard Weinberger 2016-11-11  438  	fname_name(&r->nm) = nbuf;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  439  
debf12d54182b3 Artem Bityutskiy   2011-05-15  440  	list_add_tail(&r->list, &c->replay_list);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  441  	return 0;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  442  }
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  443  

:::::: The code at line 359 was first introduced by commit
:::::: 1e51764a3c2ac05a23a22b2a95ddee4d9bffb16d UBIFS: add new flash file system

:::::: TO: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
:::::: CC: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

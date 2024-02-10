Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C20134C2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 06:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707544929; cv=none; b=nYlBVBzLfJpOOwnXtGm9pw7WsGCJ4uzNwo+GXMM/+hAyn7rqC2+ia+EzwV2+BfwHy60fM5YpciQx9jduD4a+fmSugCnuG6avNJuM6JtWpQJzxjauDJ2SvJDgM6m4jjAxeTpjXTfzNA4hbAVFa8qqbShXdiBIteJ0KILuQHAv4bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707544929; c=relaxed/simple;
	bh=fJlrwHJd9g6XMsgdwR875zuPVT0lAeZjyweyPCRcBsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sLKosEFCx6qK/JvhdSm/ip17JNrvrzRX0pivolFEfKeKr07vRHmRGINj1BzjQXqxj2KWYDzf6PLdhvQin2DRWiw06P6Ag+Zb8j4dcBWjCFxObDG52gnta5bUzGAcZYC/0Ie2l/5s3eZErRx1S6ErxL5UdUROEXEwyTwrsqlFyjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWA0hJP7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWA0hJP7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707544927; x=1739080927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fJlrwHJd9g6XMsgdwR875zuPVT0lAeZjyweyPCRcBsQ=;
  b=JWA0hJP7VyooSr/XegOVC53/ErpnjFBpUkYcD+NaQzxFbo8t0kgKAMhB
   8C+g/Vm0JM7rBlqZ1+8zyLY6BYXii7gQ1Qp40z0Sg0XNVdujrpksY2IRU
   JLGZC/CuLIKj0QWy8927VoGQT/ML4CKzgSx2tEemO1ccYX6sZuSGO6Qw/
   9Vov9AB6c7+IsaUNx9vcmlvRMADLu1Ijn3X9WGE+sTq+SYlLtBlowgcHu
   2kZ/uhf7jsqw7XQWz22D9HCOSUK1Iq8654gwDfRHHg71ruY7ywhwruA0k
   knhiicSNvFhD3i5XkGi1qUWXn9KNQ4xM0VfQdDVrtQB8rCcvAeyg/vyHa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1686937"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1686937"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 22:02:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="2330688"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2024 22:02:04 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYgR8-0005Nu-1B;
	Sat, 10 Feb 2024 06:02:02 +0000
Date: Sat, 10 Feb 2024 14:01:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: fs/quota/quota_tree.c:674:8: warning: variable 'blk' is
 uninitialized when used here
Message-ID: <202402101306.SBcbZx79-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
head:   71b12545f603de39a967b52287c29ede3f85ff2f
commit: 223bfb57631b10036e55579ecb5718123fa41c8c quota: Detect loops in quota tree
date:   19 hours ago
config: i386-randconfig-141-20240210 (https://download.01.org/0day-ci/archive/20240210/202402101306.SBcbZx79-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101306.SBcbZx79-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101306.SBcbZx79-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/quota/quota_tree.c:674:8: warning: variable 'blk' is uninitialized when used here [-Wuninitialized]
     674 |                             blk);
         |                             ^~~
   include/linux/quotaops.h:34:41: note: expanded from macro 'quota_error'
      34 |         __quota_error((sb), __func__, fmt , ## args)
         |                                                ^~~~
   fs/quota/quota_tree.c:666:10: note: initialize the variable 'blk' to silence this warning
     666 |         uint blk;
         |                 ^
         |                  = 0
   1 warning generated.


vim +/blk +674 fs/quota/quota_tree.c

1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  658  
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  659  /* Find entry for given id in the tree */
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  660  static loff_t find_tree_dqentry(struct qtree_mem_dqinfo *info,
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  661  				struct dquot *dquot, uint *blks, int depth)
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  662  {
a1e1b2becab7c0 fs/quota/quota_tree.c Jan Kara      2024-01-22  663  	char *buf = kmalloc(info->dqi_usable_bs, GFP_KERNEL);
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  664  	loff_t ret = 0;
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  665  	__le32 *ref = (__le32 *)buf;
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  666  	uint blk;
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  667  	int i;
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  668  
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  669  	if (!buf)
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  670  		return -ENOMEM;
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  671  	ret = read_blk(info, blks[depth], buf);
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  672  	if (ret < 0) {
fb5ffb0e160c93 fs/quota/quota_tree.c Jiaying Zhang 2010-07-20  673  		quota_error(dquot->dq_sb, "Can't read quota tree block %u",
fb5ffb0e160c93 fs/quota/quota_tree.c Jiaying Zhang 2010-07-20 @674  			    blk);
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  675  		goto out_buf;
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  676  	}
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  677  	ret = 0;
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  678  	blk = le32_to_cpu(ref[get_index(info, dquot->dq_id, depth)]);
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  679  	if (!blk)	/* No reference? */
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  680  		goto out_buf;
3fc61e0e96a326 fs/quota/quota_tree.c Zhihao Cheng  2022-09-23  681  	ret = do_check_range(dquot->dq_sb, "block", blk, QT_TREEOFF,
3fc61e0e96a326 fs/quota/quota_tree.c Zhihao Cheng  2022-09-23  682  			     info->dqi_blocks - 1);
3fc61e0e96a326 fs/quota/quota_tree.c Zhihao Cheng  2022-09-23  683  	if (ret)
9bf3d20331295b fs/quota/quota_tree.c Zhang Yi      2021-10-08  684  		goto out_buf;
9bf3d20331295b fs/quota/quota_tree.c Zhang Yi      2021-10-08  685  
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  686  	/* Check for cycles in the tree */
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  687  	for (i = 0; i <= depth; i++)
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  688  		if (blk == blks[i]) {
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  689  			quota_error(dquot->dq_sb,
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  690  				"Cycle in quota tree detected: block %u index %u",
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  691  				blks[depth],
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  692  				get_index(info, dquot->dq_id, depth));
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  693  			ret = -EIO;
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  694  			goto out_buf;
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  695  		}
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  696  	blks[depth + 1] = blk;
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  697  	if (depth < info->dqi_qtree_depth - 1)
223bfb57631b10 fs/quota/quota_tree.c Jan Kara      2024-02-07  698  		ret = find_tree_dqentry(info, dquot, blks, depth + 1);
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  699  	else
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  700  		ret = find_block_dqentry(info, dquot, blk);
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  701  out_buf:
d26ac1a8128f6e fs/quota/quota_tree.c Jan Kara      2009-01-26  702  	kfree(buf);
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  703  	return ret;
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  704  }
1ccd14b9c271c1 fs/quota_tree.c       Jan Kara      2008-09-22  705  

:::::: The code at line 674 was first introduced by commit
:::::: fb5ffb0e160c93c3fe08ab83845eb9a2768af812 quota: Change quota error message to print out disk and function name

:::::: TO: Jiaying Zhang <jiayingz@google.com>
:::::: CC: Jan Kara <jack@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

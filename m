Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3124A3D4123
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 21:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786915124; cv=none; b=iINJ6N701kxkxlyFw8VzasfK6Aky9owRBV1NpLivOiRjd7bRV08dknukBGvzlEct5L96ksWdq0jmZo4mu7kXAhWI+6ktrHRqWaTWSQ6Wv9BAt5WuPNfll89UN8m6ibVTVEn74nzf5FoYQbgHYDc0luPsLm5Ts5oqqnPFqqUtYcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786915124; c=relaxed/simple;
	bh=/IjJtWmshGNcO4y6OXlGzgPWVThJcVGNMQHa07bsFPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wt4lLs8a+ZO1yCOvYambmKgaDZApaNnFFU1/P2rR9Tj3QEWfb8t7jQNCZAK4f/UrMkYYLmYsNa5tP5Qiv/Zwq3JXDO1j0nsQXgzhLGDasrmDWuGBAJtBtT3y45DFPI1McbNo3aFiCPVfQu7qMJ+umnjjtDuK15Ey0HzBPgKbfI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+kl4eJu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+kl4eJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786915122; x=1818451122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/IjJtWmshGNcO4y6OXlGzgPWVThJcVGNMQHa07bsFPU=;
  b=H+kl4eJuHLpCGJqkS5OnrAK7ABXtBF/AALD0skpavr0HqhmCHy3mwTFO
   NfLnnurGWgLFunZr5bSQBw5eUmIQw6mVmsRYboBwUPyCNYDFiVOdxtw6m
   hvhfM+vqlyueckawPji+AuD+ADYVXTQVOBHKhauiqVsuUdCX324qXR31M
   N9VM7ldelne1ljUXlOxfKtZTDc0VHkxFtDAMBT7jSIe6m/xh4j6Sujug9
   PsHZOxOLYk0PgKz2AR5Ki3zKTmFiRxz3SvuXzg7x1IrZ3Cr854+4ieB/Q
   OJo+shbD2ErgEZLvnSRWyEapn04u38I9FwLJPUewJr9Uxt1acu904ynJT
   A==;
X-CSE-ConnectionGUID: ZWrsvs0BTyubczyjOqdPXQ==
X-CSE-MsgGUID: y3f7akrgTTeQpELc2t/kfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87156528"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="87156528"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 14:18:42 -0700
X-CSE-ConnectionGUID: CUxr0pSvS7iI+T9tVV9eKw==
X-CSE-MsgGUID: y6a6RNZjTdGqDPmG6dhAtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="289558951"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Aug 2026 14:18:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wviFa-00000000d6s-0w5E;
	Sun, 16 Aug 2026 21:18:38 +0000
Date: Mon, 17 Aug 2026 05:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jeremy Bingham <jbingham@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] minix: unify the v1 and v2/v3 itree code paths
Message-ID: <202608170548.3YDAL7r3-lkp@intel.com>
References: <d9f07a9037d019043ed24d8245d9a58ce2c669f0.1783324260.git.jbingham@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9f07a9037d019043ed24d8245d9a58ce2c669f0.1783324260.git.jbingham@gmail.com>

Hi Jeremy,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.2-rc7]
[also build test WARNING on linus/master next-20260814]
[cannot apply to brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Bingham/minix-unify-the-v1-and-v2-v3-itree-code-paths/20260814-012958
base:   v7.2-rc7
patch link:    https://lore.kernel.org/r/d9f07a9037d019043ed24d8245d9a58ce2c669f0.1783324260.git.jbingham%40gmail.com
patch subject: [RFC PATCH 1/1] minix: unify the v1 and v2/v3 itree code paths
config: s390-randconfig-r062-20260817 (https://download.01.org/0day-ci/archive/20260817/202608170548.3YDAL7r3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170548.3YDAL7r3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/minix/itree.c:420:3-8: WARNING: NULL check before some freeing functions is not needed.
   fs/minix/itree.c:422:3-8: WARNING: NULL check before some freeing functions is not needed.
   fs/minix/itree.c:717:2-7: WARNING: NULL check before some freeing functions is not needed.
   fs/minix/itree.c:719:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +420 fs/minix/itree.c

   401	
   402	/* offsets and chain have DEPTH elements. Since DEPTH varies between versions of
   403	 * the minix filesystems, instead of having two different definitions of DEPTH
   404	 * and two different versions of this function just allocate the offsets and
   405	 * chain arrays dynamically. This does require remembering to free them.
   406	 */
   407	int minix_get_block(struct inode *inode, sector_t block,
   408				struct buffer_head *bh, int create)
   409	{
   410		struct super_block *sb = inode->i_sb;
   411		struct minix_sb_info *sbi = minix_sb(sb);
   412		u8 s_depth = sbi->s_depth;
   413		int err = -EIO;
   414		int *offsets = kmalloc_array(s_depth, sizeof(int), GFP_KERNEL);
   415		Indirect *chain = kmalloc_array(s_depth, sizeof(Indirect), GFP_KERNEL);
   416	
   417		if (offsets == NULL || chain == NULL) {
   418			err = -ENOMEM;
   419			if (offsets != NULL)
 > 420				kfree(offsets);
   421			if (chain != NULL)
   422				kfree(chain);
   423			goto out;
   424		}
   425	
   426		Indirect *partial;
   427		int left;
   428		int depth = block_to_path(inode, block, offsets);
   429	
   430		if (depth == 0)
   431			goto out;
   432	
   433	reread:
   434		partial = get_branch(inode, depth, offsets, chain, &err);
   435	
   436		/* Simplest case - block found, no allocation needed */
   437		if (!partial) {
   438	got_it:
   439			map_bh(bh, inode->i_sb, block_to_cpu(chain[depth-1].key));
   440			/* Clean up and exit */
   441			partial = chain+depth-1; /* the whole chain */
   442			goto cleanup;
   443		}
   444	
   445		/* Next simple case - plain lookup or failed read of indirect block */
   446		if (!create || err == -EIO) {
   447	cleanup:
   448			while (partial > chain) {
   449				brelse(partial->bh);
   450				partial--;
   451			}
   452	
   453			kfree(offsets);
   454			kfree(chain);
   455	out:
   456			return err;
   457		}
   458	
   459		/*
   460		 * Indirect block might be removed by truncate while we were
   461		 * reading it. Handling of that case (forget what we've got and
   462		 * reread) is taken out of the main path.
   463		 */
   464		if (err == -EAGAIN)
   465			goto changed;
   466	
   467		left = (chain + depth) - partial;
   468		err = alloc_branch(inode, left, offsets+(partial-chain), partial);
   469		if (err)
   470			goto cleanup;
   471	
   472		if (splice_branch(inode, chain, partial, left) < 0)
   473			goto changed;
   474	
   475		set_buffer_new(bh);
   476		goto got_it;
   477	
   478	changed:
   479		while (partial > chain) {
   480			brelse(partial->bh);
   481			partial--;
   482		}
   483		goto reread;
   484	}
   485	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

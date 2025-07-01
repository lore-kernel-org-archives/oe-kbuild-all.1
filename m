Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112AB18D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 01:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751334237; cv=none; b=YO9fxJwN7+tjtqUW1MYv6SDPTo5/lhwYSPb9lmm6dXrwTWN+cWNtOda9RJVXrE6hDs2fbYpIYP+wb3QD8WffYk8xIDSCK8gKQxDTwjWq0eL+7MElTCHGuNDpRelZNas6m7ECbM/Qjzm/LWf+E0TIaZZfFlJ7Z+aqy5vy+UCX4Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751334237; c=relaxed/simple;
	bh=bd3EaD7KrSsLlK6SN+vw3W/vpYtANPtwOKp7s3W5gPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRvgRUqf2RQ0e2HXnqWOrSqhEFUtY+9g4fX5vyoEAG4K7fHGbSyJAOfARUMD4wiCjYTBEs9QpT9kmy85uOrcJs5KBIyACygfhUrSqDoS+7/klyPDhMuOLARpLw0fuEQUZu7A5k0XO71i9vEeE0wvNmNJpfltHGY+RVj51quFcrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHK6kciD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHK6kciD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751334236; x=1782870236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bd3EaD7KrSsLlK6SN+vw3W/vpYtANPtwOKp7s3W5gPw=;
  b=dHK6kciDUXsFYe6XbJSeoidiXPpdg94zGNR8KlHE8HVl3tJjPC9FsP59
   KnvqpZMhQLlwzc6u0l/ZPWereUoOuNQg40kBjCX2Hfqzgn0kvoZ8a168+
   iZELBnYf3twOCjLwXfOTgAMY3k8Kz66CuHL2hRQPSNgbysvkwwNB9UJL5
   XORJqiAHdr+zfWGzbCCgjHNcnEfl3aBCrUIZoMjDXVz0rQpcAWprC8vfu
   SrSIezVFRbmIrp6JfTOkeut9Zxt15SurYxymcIOstSlW5YvOe0mmD6sG2
   d6qOjAkLVSA/hPxV5Kp/w57uciI36dZ1nY0NesdeL6xgaGRa6O8/T2+KW
   Q==;
X-CSE-ConnectionGUID: vFSeTdmkQFGyljlOz7fSwQ==
X-CSE-MsgGUID: l9/jirkMRPqr4GcESTWf+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52807177"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="52807177"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:43:55 -0700
X-CSE-ConnectionGUID: VjV2eGe+TyO7DS98Yw/Dcw==
X-CSE-MsgGUID: swC7WzcdRUGB21YBuC3MNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153794534"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Jun 2025 18:43:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWQ2J-000ZVu-33;
	Tue, 01 Jul 2025 01:43:51 +0000
Date: Tue, 1 Jul 2025 09:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 55/95]
 fs/bcachefs/fs.c:2567:5: error: 'struct super_block' has no member named
 's_encoding'
Message-ID: <202507010941.JU9oxZlM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   689b1f32c808a06e270cf5158dff7358ffeb52d0
commit: 1b68e7f71480c4951aedad2c037d57b0856a488b [55/95] bcachefs: opts.casefold_disabled
config: riscv-randconfig-002-20250701 (https://download.01.org/0day-ci/archive/20250701/202507010941.JU9oxZlM-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010941.JU9oxZlM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010941.JU9oxZlM-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/fs.c: In function 'bch2_fs_get_tree':
>> fs/bcachefs/fs.c:2567:5: error: 'struct super_block' has no member named 's_encoding'
    2567 |   sb->s_encoding = c->cf_encoding;
         |     ^~


vim +2567 fs/bcachefs/fs.c

1c6fdbd8f2465d Kent Overstreet             2017-03-16  2563  
ecae0bd5173b10 Linus Torvalds              2023-11-02  2564  	sb->s_shrink->seeks = 0;
e3f2db39b39b69 Kent Overstreet             2021-11-13  2565  
1b68e7f71480c4 Kent Overstreet             2025-06-26  2566  	if (bch2_fs_casefold_enabled(c))
c83311c5b90d12 Kent Overstreet             2025-04-26 @2567  		sb->s_encoding = c->cf_encoding;
c83311c5b90d12 Kent Overstreet             2025-04-26  2568  	generic_set_sb_d_ops(sb);
c83311c5b90d12 Kent Overstreet             2025-04-26  2569  
284ae18c1d7aa4 Kent Overstreet             2021-03-16  2570  	vinode = bch2_vfs_inode_get(c, BCACHEFS_ROOT_SUBVOL_INUM);
d4bf5eecd78a90 Kent Overstreet             2022-07-18  2571  	ret = PTR_ERR_OR_ZERO(vinode);
e46c181af9e230 Kent Overstreet             2023-09-11  2572  	bch_err_msg(c, ret, "mounting: error getting root inode");
cf904c8d964fa4 Kent Overstreet             2023-12-16  2573  	if (ret)
1c6fdbd8f2465d Kent Overstreet             2017-03-16  2574  		goto err_put_super;
1c6fdbd8f2465d Kent Overstreet             2017-03-16  2575  
1c6fdbd8f2465d Kent Overstreet             2017-03-16  2576  	sb->s_root = d_make_root(vinode);
1c6fdbd8f2465d Kent Overstreet             2017-03-16  2577  	if (!sb->s_root) {
619f5bee86b558 Kent Overstreet             2019-04-17  2578  		bch_err(c, "error mounting: error allocating root dentry");
1c6fdbd8f2465d Kent Overstreet             2017-03-16  2579  		ret = -ENOMEM;
1c6fdbd8f2465d Kent Overstreet             2017-03-16  2580  		goto err_put_super;
1c6fdbd8f2465d Kent Overstreet             2017-03-16  2581  	}
1c6fdbd8f2465d Kent Overstreet             2017-03-16  2582  
1c6fdbd8f2465d Kent Overstreet             2017-03-16  2583  	sb->s_flags |= SB_ACTIVE;
1c6fdbd8f2465d Kent Overstreet             2017-03-16  2584  out:
25ee25e637a6f7 Kent Overstreet             2024-05-29  2585  	fc->root = dget(sb->s_root);
83208cbf2f08c2 Kent Overstreet             2024-05-28  2586  err:
5645c32ccf3197 Kent Overstreet             2024-05-29  2587  	darray_exit(&devs_to_fs);
5645c32ccf3197 Kent Overstreet             2024-05-29  2588  	bch2_darray_str_exit(&devs);
0f1f7324da0a65 Kent Overstreet             2024-07-03  2589  	if (ret)
0f1f7324da0a65 Kent Overstreet             2024-07-03  2590  		pr_err("error: %s", bch2_err_str(ret));
83208cbf2f08c2 Kent Overstreet             2024-05-28  2591  	/*
83208cbf2f08c2 Kent Overstreet             2024-05-28  2592  	 * On an inconsistency error in recovery we might see an -EROFS derived
83208cbf2f08c2 Kent Overstreet             2024-05-28  2593  	 * errorcode (from the journal), but we don't want to return that to
83208cbf2f08c2 Kent Overstreet             2024-05-28  2594  	 * userspace as that causes util-linux to retry the mount RO - which is
83208cbf2f08c2 Kent Overstreet             2024-05-28  2595  	 * confusing:
83208cbf2f08c2 Kent Overstreet             2024-05-28  2596  	 */
83208cbf2f08c2 Kent Overstreet             2024-05-28  2597  	if (bch2_err_matches(ret, EROFS) && ret != -EROFS)
83208cbf2f08c2 Kent Overstreet             2024-05-28  2598  		ret = -EIO;
25ee25e637a6f7 Kent Overstreet             2024-05-29  2599  	return bch2_err_class(ret);
5645c32ccf3197 Kent Overstreet             2024-05-29  2600  
5645c32ccf3197 Kent Overstreet             2024-05-29  2601  err_stop_fs:
5645c32ccf3197 Kent Overstreet             2024-05-29  2602  	bch2_fs_stop(c);
5645c32ccf3197 Kent Overstreet             2024-05-29  2603  	goto err;
5645c32ccf3197 Kent Overstreet             2024-05-29  2604  
5645c32ccf3197 Kent Overstreet             2024-05-29  2605  err_put_super:
7c4cb50e1a39ad Florian Albrechtskirchinger 2025-03-27  2606  	if (!sb->s_root)
5645c32ccf3197 Kent Overstreet             2024-05-29  2607  		__bch2_fs_stop(c);
5645c32ccf3197 Kent Overstreet             2024-05-29  2608  	deactivate_locked_super(sb);
5645c32ccf3197 Kent Overstreet             2024-05-29  2609  	goto err;
1c6fdbd8f2465d Kent Overstreet             2017-03-16  2610  }
1c6fdbd8f2465d Kent Overstreet             2017-03-16  2611  

:::::: The code at line 2567 was first introduced by commit
:::::: c83311c5b90d12ea22e847fd9390e2fdb6a34f68 bcachefs: Use generic_set_sb_d_ops for standard casefolding d_ops

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

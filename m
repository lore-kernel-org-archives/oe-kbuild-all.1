Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED038F7D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 23:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726355967; cv=none; b=ppL6WBO98KmfDQo095INJ6WHcEreuGE3KRYFwwa8ELHRNFszsGDOLZLNiPzSPejR7c3updH7NSzCqlvE+ptAxSyqUTt9kpeZyFWigt80/GAIfiUOLX7MWcPzFY0L2QbmcYAha30j/Z501tg6V4Ez2ne3Xom9Tk91Rhc9jUnwIUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726355967; c=relaxed/simple;
	bh=p1HX5CTDi3LKpwTGqd35uEkOX2yc7x24+3nGtXHp2ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLRj8I9tVooR1oIxnmLNNZVqx/Cwn71A1uokavR1x6S0FQBzjQUyhFfbGymmnF36wPmVKUyjx0PHELe4eTFOxiVO8iD2vuYbrhO04SIVFhZvoT+zcZKPzwsaTzapuUPnDoTICqomZPlfjWCuOckblFX38MppLOHu5VI52Dm8oU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8QxBAOR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8QxBAOR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726355964; x=1757891964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p1HX5CTDi3LKpwTGqd35uEkOX2yc7x24+3nGtXHp2ss=;
  b=X8QxBAORpQ7z5EB4kssXDoyBcXjYgmcSKDBIGJ382eWhY10+itRpFwMZ
   L1YQywbQZiT8x4XUUzgEW2OnuxZwJrpcNF86RjCs9jqlzTg16yl2x4RE8
   ZjjJoaVz5EsX9jt4AuUXgLCzjyRQZHh0vMVaYnvmVPgmSsWibjgwgmFCg
   +Gsk82CPDV7cGSR1fL2JjZLpWJ1xxQhyNaqLP19O/zynKwDKPHzSuw6Zt
   VQbnc9wsD6dyd95fS+/dEJ2l6hzh/ZMjkXbwQojRTXYt2DTYzASK5+SwW
   y5Sii0S3BGLrJmwIzJvkEjFIUiTHlZvd8Jg55AJyHmR8xDzxzBaOGK9hJ
   A==;
X-CSE-ConnectionGUID: puVQREtcRRWS9PAxwtJj6Q==
X-CSE-MsgGUID: qacbmVlKQYmsOUejlnGv8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="28978110"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="28978110"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 16:19:24 -0700
X-CSE-ConnectionGUID: RXQoNKX+QhqKap0rNr1EKg==
X-CSE-MsgGUID: wrIgEaUKRQ6dCT787AtbZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="73248254"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Sep 2024 16:19:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spc2y-0008EQ-2S;
	Sat, 14 Sep 2024 23:19:20 +0000
Date: Sun, 15 Sep 2024 07:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC V4 1/1] ocfs2: reserve space for inline xattr before
 attaching reflink tree
Message-ID: <202409150704.dHBcQscU-lkp@intel.com>
References: <20240912064720.898600-1-gautham.ananthakrishna@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912064720.898600-1-gautham.ananthakrishna@oracle.com>

Hi Gautham,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gautham-Ananthakrishna/ocfs2-reserve-space-for-inline-xattr-before-attaching-reflink-tree/20240912-144813
base:   linus/master
patch link:    https://lore.kernel.org/r/20240912064720.898600-1-gautham.ananthakrishna%40oracle.com
patch subject: [PATCH RFC V4 1/1] ocfs2: reserve space for inline xattr before attaching reflink tree
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240915/202409150704.dHBcQscU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150704.dHBcQscU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150704.dHBcQscU-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ocfs2/refcounttree.c: In function '__ocfs2_reflink':
>> fs/ocfs2/refcounttree.c:4197:55: error: initialization of 'struct ocfs2_dinode *' from incompatible pointer type 'char *' [-Werror=incompatible-pointer-types]
    4197 |                         struct ocfs2_dinode *new_di = new_bh->b_data;
         |                                                       ^~~~~~
   fs/ocfs2/refcounttree.c:4198:55: error: initialization of 'struct ocfs2_dinode *' from incompatible pointer type 'char *' [-Werror=incompatible-pointer-types]
    4198 |                         struct ocfs2_dinode *old_di = old_bh->b_data;
         |                                                       ^~~~~~
   cc1: some warnings being treated as errors


vim +4197 fs/ocfs2/refcounttree.c

  4150	
  4151	static int __ocfs2_reflink(struct dentry *old_dentry,
  4152				   struct buffer_head *old_bh,
  4153				   struct inode *new_inode,
  4154				   bool preserve)
  4155	{
  4156		int ret;
  4157		struct inode *inode = d_inode(old_dentry);
  4158		struct buffer_head *new_bh = NULL;
  4159		struct ocfs2_inode_info *oi = OCFS2_I(inode);
  4160	
  4161		if (oi->ip_flags & OCFS2_INODE_SYSTEM_FILE) {
  4162			ret = -EINVAL;
  4163			mlog_errno(ret);
  4164			goto out;
  4165		}
  4166	
  4167		ret = filemap_fdatawrite(inode->i_mapping);
  4168		if (ret) {
  4169			mlog_errno(ret);
  4170			goto out;
  4171		}
  4172	
  4173		ret = ocfs2_attach_refcount_tree(inode, old_bh);
  4174		if (ret) {
  4175			mlog_errno(ret);
  4176			goto out;
  4177		}
  4178	
  4179		inode_lock_nested(new_inode, I_MUTEX_CHILD);
  4180		ret = ocfs2_inode_lock_nested(new_inode, &new_bh, 1,
  4181					      OI_LS_REFLINK_TARGET);
  4182		if (ret) {
  4183			mlog_errno(ret);
  4184			goto out_unlock;
  4185		}
  4186	
  4187		if ((oi->ip_dyn_features & OCFS2_HAS_XATTR_FL) &&
  4188		    (oi->ip_dyn_features & OCFS2_INLINE_XATTR_FL)) {
  4189			/*
  4190			 * Adjust extent record count to reserve space for extended attribute.
  4191			 * Inline data count had been adjusted in ocfs2_duplicate_inline_data().
  4192			 */
  4193			struct ocfs2_inode_info *new_oi = OCFS2_I(new_inode);
  4194	
  4195			if (!(new_oi->ip_dyn_features & OCFS2_INLINE_DATA_FL) &&
  4196			    !(ocfs2_inode_is_fast_symlink(new_inode))) {
> 4197				struct ocfs2_dinode *new_di = new_bh->b_data;
  4198				struct ocfs2_dinode *old_di = old_bh->b_data;
  4199				struct ocfs2_extent_list *el = &new_di->id2.i_list;
  4200				int inline_size = le16_to_cpu(old_di->i_xattr_inline_size);
  4201	
  4202				le16_add_cpu(&el->l_count, -(inline_size /
  4203						sizeof(struct ocfs2_extent_rec)));
  4204			}
  4205		}
  4206	
  4207		ret = ocfs2_create_reflink_node(inode, old_bh,
  4208						new_inode, new_bh, preserve);
  4209		if (ret) {
  4210			mlog_errno(ret);
  4211			goto inode_unlock;
  4212		}
  4213	
  4214		if (oi->ip_dyn_features & OCFS2_HAS_XATTR_FL) {
  4215			ret = ocfs2_reflink_xattrs(inode, old_bh,
  4216						   new_inode, new_bh,
  4217						   preserve);
  4218			if (ret) {
  4219				mlog_errno(ret);
  4220				goto inode_unlock;
  4221			}
  4222		}
  4223	
  4224		ret = ocfs2_complete_reflink(inode, old_bh,
  4225					     new_inode, new_bh, preserve);
  4226		if (ret)
  4227			mlog_errno(ret);
  4228	
  4229	inode_unlock:
  4230		ocfs2_inode_unlock(new_inode, 1);
  4231		brelse(new_bh);
  4232	out_unlock:
  4233		inode_unlock(new_inode);
  4234	out:
  4235		if (!ret) {
  4236			ret = filemap_fdatawait(inode->i_mapping);
  4237			if (ret)
  4238				mlog_errno(ret);
  4239		}
  4240		return ret;
  4241	}
  4242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

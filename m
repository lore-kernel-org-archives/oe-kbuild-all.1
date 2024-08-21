Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329FA1B81BB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 07:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724224818; cv=none; b=iDqmOfKnKD1IymP6AiIEOXlnarw6SX03i/oG0xzVQEiBqvvw5h6n2CM34+fx0fNhsPyHXv9XlIUd+gSIfdIcxiukKZ7i87s6H5egjLpqVVV2YFscBJxMuPDXWGoUXyOQLapyFghAdF7PdRl6f5kItEJnUTtauy1fBvPxx/GaUas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724224818; c=relaxed/simple;
	bh=EfnEYzoxEQCNq3m2mqeoKvsC0TB3g/FOGQ9r6dkAXww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aNyzOh+4dr8b96j77k56Y5FWyhe7hEf2MhrHIHPhM6dKOu5xGqgT7HDOYNbwOdyfz7HMrpJEFjdhPWVyTsQbohtTWUI88A2dgoZDZEt/Q1MtwetvOu8O+qXVO7fW66CY/C8BB2HHHlX3lW3ND2Uwlx2F9yq0KMTFtjPMOt9QrPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/E2Oqem; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/E2Oqem"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724224818; x=1755760818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EfnEYzoxEQCNq3m2mqeoKvsC0TB3g/FOGQ9r6dkAXww=;
  b=m/E2OqemN08VKNHwW2I9mKAXgE7I6R1JYAsFPz0HzvIvxeTNuXuaiqOX
   HAstqjlIEnGrZn5j5NMYKIrfYR4ZHkQDJVX/+VwIkGSACaXeBDxmV6xki
   mQLNd9X9Cme7BEkoHkdowa2tc58WVaALvMGO96yN+iuzgYBNYfe0S+gb9
   Qe2RGflv6OxId03rXba82rnIt/P34PzeXmRk1QOH64UDLsCJTYfJVpgZ4
   oRzEEnB4JBwFEQNg2HQmvAq239Zb9unI8zKA74QbYLtvkelGROV8hfR1u
   eU7KQSWksJJOorg8PCWQilYLLDpCDEDQ23tjoZAaGoUd0Ae96b84EuvZC
   w==;
X-CSE-ConnectionGUID: /mR3AEafTqKWFgWdrXN++w==
X-CSE-MsgGUID: DceiUBIFTb+O/ywdjDQCCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22537415"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22537415"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 00:20:17 -0700
X-CSE-ConnectionGUID: x6TpD95oTdqdJyje8OdH1g==
X-CSE-MsgGUID: k5CqQtFSS6mZRh3MW76O9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61032417"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Aug 2024 00:20:15 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgfdd-000B24-1Z;
	Wed, 21 Aug 2024 07:20:13 +0000
Date: Wed, 21 Aug 2024 15:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.i_state 44/46] fs/bcachefs/fs.c:1650:61: error:
 passing argument 2 of 'inode_bit_waitqueue' from incompatible pointer type
Message-ID: <202408211510.ptTuyDD0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.i_state
head:   d86662f89fd88a775c03f0c1b537536a83fe38c2
commit: c5a89e7feae9465e60076bdef7a65adf5a3cc32e [44/46] inode: port __I_NEW to var event
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240821/202408211510.ptTuyDD0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211510.ptTuyDD0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211510.ptTuyDD0-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/fs.c: In function 'bch2_evict_subvolume_inodes':
>> fs/bcachefs/fs.c:1650:61: error: passing argument 2 of 'inode_bit_waitqueue' from incompatible pointer type [-Wincompatible-pointer-types]
    1650 |                         wq_head = inode_bit_waitqueue(&wqe, inode, __I_NEW);
         |                                                             ^~~~~
         |                                                             |
         |                                                             struct bch_inode_info *
   In file included from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/bio.h:10,
                    from fs/bcachefs/bcachefs.h:188,
                    from fs/bcachefs/fs.c:4:
   include/linux/fs.h:754:59: note: expected 'struct inode *' but argument is of type 'struct bch_inode_info *'
     754 |                                             struct inode *inode, u32 bit);
         |                                             ~~~~~~~~~~~~~~^~~~~


vim +/inode_bit_waitqueue +1650 fs/bcachefs/fs.c

  1611	
  1612	void bch2_evict_subvolume_inodes(struct bch_fs *c, snapshot_id_list *s)
  1613	{
  1614		struct bch_inode_info *inode;
  1615		DARRAY(struct bch_inode_info *) grabbed;
  1616		bool clean_pass = false, this_pass_clean;
  1617	
  1618		/*
  1619		 * Initially, we scan for inodes without I_DONTCACHE, then mark them to
  1620		 * be pruned with d_mark_dontcache().
  1621		 *
  1622		 * Once we've had a clean pass where we didn't find any inodes without
  1623		 * I_DONTCACHE, we wait for them to be freed:
  1624		 */
  1625	
  1626		darray_init(&grabbed);
  1627		darray_make_room(&grabbed, 1024);
  1628	again:
  1629		cond_resched();
  1630		this_pass_clean = true;
  1631	
  1632		mutex_lock(&c->vfs_inodes_lock);
  1633		list_for_each_entry(inode, &c->vfs_inodes_list, ei_vfs_inode_list) {
  1634			if (!snapshot_list_has_id(s, inode->ei_subvol))
  1635				continue;
  1636	
  1637			if (!(inode->v.i_state & I_DONTCACHE) &&
  1638			    !(inode->v.i_state & I_FREEING) &&
  1639			    igrab(&inode->v)) {
  1640				this_pass_clean = false;
  1641	
  1642				if (darray_push_gfp(&grabbed, inode, GFP_ATOMIC|__GFP_NOWARN)) {
  1643					iput(&inode->v);
  1644					break;
  1645				}
  1646			} else if (clean_pass && this_pass_clean) {
  1647				struct wait_bit_queue_entry wqe;
  1648				struct wait_queue_head *wq_head;
  1649	
> 1650				wq_head = inode_bit_waitqueue(&wqe, inode, __I_NEW);
  1651				prepare_to_wait_event(wq_head, &wqe.wq_entry,
  1652						      TASK_UNINTERRUPTIBLE);
  1653				mutex_unlock(&c->vfs_inodes_lock);
  1654	
  1655				schedule();
  1656				finish_wait(wq_head, &wqe.wq_entry);
  1657				goto again;
  1658			}
  1659		}
  1660		mutex_unlock(&c->vfs_inodes_lock);
  1661	
  1662		darray_for_each(grabbed, i) {
  1663			inode = *i;
  1664			d_mark_dontcache(&inode->v);
  1665			d_prune_aliases(&inode->v);
  1666			iput(&inode->v);
  1667		}
  1668		grabbed.nr = 0;
  1669	
  1670		if (!clean_pass || !this_pass_clean) {
  1671			clean_pass = this_pass_clean;
  1672			goto again;
  1673		}
  1674	
  1675		darray_exit(&grabbed);
  1676	}
  1677	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B671DF756
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 05:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596992; cv=none; b=Hjl3Bkdh/5i1O2nLQLi5Y2sLZNv+gEUDdMcocQdL4bZuurpzKKLcOF5pQYGaiF5dLOZTRa1P2HL9ovtzuX4aXGrm931nlY3YClAvKpw6t/E9zwT95T9YlG82aYzD+LdikIAiAlcXh0QTILjgn4MQWdUPvuJTtQZpHxP0zZI+h6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596992; c=relaxed/simple;
	bh=vUS/N8/7IZFWbCeTy+cbEth4DrlZGBMzOlj49cn0rdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlXdWxMI9C7rfB7Ivejk4TQeQXA36LXyKA5jNCORTJ5x4erlyXw58L5zRm33N1AVZ+ZL221E3OmCSAZYAJxmdrAr3jLfm8y2STZXHPLKoGvfgc3FQgiyCKfejwihi5yDHHxduqI2VEGZXdsjAXpRgbuVdPzdeB7nVdBuLLxewnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJE/gcU0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJE/gcU0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596991; x=1778132991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vUS/N8/7IZFWbCeTy+cbEth4DrlZGBMzOlj49cn0rdg=;
  b=JJE/gcU0zqImr/UBTr5xvUYtALxd4nPldsU2lQZ53UiTB4+UkH1Qcdwb
   B6hbMGpS471dd+z0uweI3JBkyWYMsHHdPWoXf0j/H2ANxfZjZwgwQ5m/P
   Mi5NwU4PNLsDgVmnyE3yZRxvdAwssKBep6/es9YjJyP9TsVB3x1LHurnY
   xqves6x/4MRkFa0NGt/gPZZk9iCp5P/l0T+H2Xv+c9DGEadDDQbJLfwBm
   992lABQH91t6F1tVRCUWJkpmJlUXmIRi5Z4HeeL5eICzhrw454CI2xRYK
   Pm8Mszu0CbIC8rnB4QJ97xUxxPRJXFvOrf1G3d94Cqk/1MSy1c7ieG62J
   Q==;
X-CSE-ConnectionGUID: AkAyb9PbRNOOQiUmN38BbQ==
X-CSE-MsgGUID: FdicgRliRSCsSa74/1v6vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52120516"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="52120516"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:49:50 -0700
X-CSE-ConnectionGUID: sO67tmEARdWIvmX6+XJJkQ==
X-CSE-MsgGUID: Jc8+VEhPQ3m4OGJTXIfp0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140580414"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 May 2025 22:49:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXf8-00077T-1n;
	Wed, 07 May 2025 05:49:46 +0000
Date: Wed, 7 May 2025 13:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/2] btrfs: make btrfs_truncate_block() zero folio
 range for certain subpage corner cases
Message-ID: <202505071337.yJPgv5rE-lkp@intel.com>
References: <50e41f048f26b5b58f55b25c045e5dfe94a8dcfd.1745443508.git.wqu@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50e41f048f26b5b58f55b25c045e5dfe94a8dcfd.1745443508.git.wqu@suse.com>

Hi Qu,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[cannot apply to linus/master v6.15-rc5 next-20250506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-make-btrfs_truncate_block-to-zero-involved-blocks-in-a-folio/20250424-052814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/50e41f048f26b5b58f55b25c045e5dfe94a8dcfd.1745443508.git.wqu%40suse.com
patch subject: [PATCH v4 2/2] btrfs: make btrfs_truncate_block() zero folio range for certain subpage corner cases
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20250507/202505071337.yJPgv5rE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071337.yJPgv5rE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071337.yJPgv5rE-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/inode.c: In function 'zero_range_folio':
>> fs/btrfs/inode.c:4816:9: error: implicit declaration of function 'lock_extent' [-Werror=implicit-function-declaration]
    4816 |         lock_extent(io_tree, block_start, block_end, &cached_state);
         |         ^~~~~~~~~~~
>> fs/btrfs/inode.c:4819:17: error: implicit declaration of function 'unlock_extent'; did you mean 'unlock_page'? [-Werror=implicit-function-declaration]
    4819 |                 unlock_extent(io_tree, block_start, block_end, &cached_state);
         |                 ^~~~~~~~~~~~~
         |                 unlock_page
   At top level:
   cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics
   cc1: some warnings being treated as errors


vim +/lock_extent +4816 fs/btrfs/inode.c

  4761	
  4762	/*
  4763	 * A helper to zero out all blocks inside range [@orig_start, @orig_end) of
  4764	 * the target folio.
  4765	 * The target folio is the one containing the head or tail block of the range
  4766	 * [@from, @end].
  4767	 *
  4768	 * This is a special case for fs block size < page size, where even if the range
  4769	 * [from, end] is already block aligned, we can still have blocks beyond EOF being
  4770	 * polluted by memory mapped write.
  4771	 */
  4772	static int zero_range_folio(struct btrfs_inode *inode, u64 from, u64 end,
  4773				    u64 orig_start, u64 orig_end,
  4774				    enum btrfs_truncate_where where)
  4775	{
  4776		const u32 blocksize = inode->root->fs_info->sectorsize;
  4777		struct address_space *mapping = inode->vfs_inode.i_mapping;
  4778		struct extent_io_tree *io_tree = &inode->io_tree;
  4779		struct extent_state *cached_state = NULL;
  4780		struct btrfs_ordered_extent *ordered;
  4781		pgoff_t index = (where == BTRFS_TRUNCATE_HEAD_BLOCK) ?
  4782				(from >> PAGE_SHIFT) : (end >> PAGE_SHIFT);
  4783		struct folio *folio;
  4784		u64 block_start;
  4785		u64 block_end;
  4786		u64 clamp_start;
  4787		u64 clamp_end;
  4788		int ret = 0;
  4789	
  4790	again:
  4791		folio = filemap_lock_folio(mapping, index);
  4792		/* No folio present. */
  4793		if (IS_ERR(folio))
  4794			return 0;
  4795	
  4796		if (!folio_test_uptodate(folio)) {
  4797			ret = btrfs_read_folio(NULL, folio);
  4798			folio_lock(folio);
  4799			if (folio->mapping != mapping) {
  4800				folio_unlock(folio);
  4801				folio_put(folio);
  4802				goto again;
  4803			}
  4804			if (!folio_test_uptodate(folio)) {
  4805				ret = -EIO;
  4806				goto out_unlock;
  4807			}
  4808		}
  4809		folio_wait_writeback(folio);
  4810	
  4811		clamp_start = max_t(u64, folio_pos(folio), orig_start);
  4812		clamp_end = min_t(u64, folio_pos(folio) + folio_size(folio) - 1,
  4813				  orig_end);
  4814		block_start = round_down(clamp_start, blocksize);
  4815		block_end = round_up(clamp_end + 1, blocksize) - 1;
> 4816		lock_extent(io_tree, block_start, block_end, &cached_state);
  4817		ordered = btrfs_lookup_ordered_range(inode, block_start, block_end + 1 - block_end);
  4818		if (ordered) {
> 4819			unlock_extent(io_tree, block_start, block_end, &cached_state);
  4820			folio_unlock(folio);
  4821			folio_put(folio);
  4822			btrfs_start_ordered_extent(ordered);
  4823			btrfs_put_ordered_extent(ordered);
  4824			goto again;
  4825		}
  4826		folio_zero_range(folio, clamp_start - folio_pos(folio),
  4827				 clamp_end - clamp_start + 1);
  4828		unlock_extent(io_tree, block_start, block_end, &cached_state);
  4829	
  4830	out_unlock:
  4831		folio_unlock(folio);
  4832		folio_put(folio);
  4833		return ret;
  4834	}
  4835	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

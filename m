Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60CE2580E1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768649819; cv=none; b=HTQJckGrWWWHXADOKktjdEWOzwebVtWA8mysU7Mg1Jg5AnLMI9FOLILrjrsz19tEyltcFPirJ8AZh5kK7jAJSjn4lDbzNqQAVrPO/TQ1LnKXQzL+u60i/X1CP1YFbnJEYED6pmRyr5DJ38ceSHxEfPPX44Z1MRuEbi2KDFn+ccA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768649819; c=relaxed/simple;
	bh=iT79yQKHAIH/Rbt/LtPOzwiBBXxLawFEehMJ2ixGXTk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H6cJ5GPP8hEjJYtvgRfFe1I5m3YLYAdkKm/QjJLupGkxI1JiIwtuCPBzQuBp2SfoRCRq90SIC2kVnoA/4TpZauDFJw105l8JwS0FPJYSw/5BCwflL9cNlxeCqjB3wRRvpedbfMkM8y/DeRrTLwPnYPsXEjv6txgqoRTY4cYeykg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwAOwHIA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwAOwHIA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768649817; x=1800185817;
  h=date:from:to:cc:subject:message-id;
  bh=iT79yQKHAIH/Rbt/LtPOzwiBBXxLawFEehMJ2ixGXTk=;
  b=dwAOwHIAe2GSX8zotgBYT7N/PS/1hmj5oveaU6RfN5sFzysN3QAtYuWf
   wa5XPTQQofa1xvH00HVto5IjG+wslfpFCsaLLmmhI45BDtxi7gLAZJnrW
   YWBdwTjjxcsmyPPnsoZJ4ekZIMLYiXz9eqx5U5+VEam8OEIdEVBkRg7F6
   8jA/f6lo1TnBV16AVzYUV3h4X9ku2wIGQRHD+cOuyPuT0OFZgTogARWEM
   V4GK95N3r3oYTH8EJuZG+e0UFNrgf3MGOifXRE8osDAPEtxGU2wNyvtFz
   GmMzwjLhKoE0ShcFiyupw0EFohmu9bmOkSf58V/btAYrDnKvS3twvacae
   w==;
X-CSE-ConnectionGUID: gssrZOZUTe+tvq0spbEUyw==
X-CSE-MsgGUID: QrNqA7NEQPC/kVkkVSIbHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="95416583"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="95416583"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 03:36:56 -0800
X-CSE-ConnectionGUID: zIT8vp5pQDGldDCgofH99A==
X-CSE-MsgGUID: Z5ZOpCj2RzqykxVyx1OP1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="243011171"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2026 03:36:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh4br-00000000LoP-3Pst;
	Sat, 17 Jan 2026 11:36:51 +0000
Date: Sat, 17 Jan 2026 19:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Harmstone <mark@harmstone.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
 Boris Burkov <boris@bur.io>
Subject: [btrfs:pr/1157 76/80] fs/btrfs/relocation.c:5023:15:
 warning: 'start' may be used uninitialized
Message-ID: <202601171944.CbSjYmaV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/btrfs/linux.git pr/1157
head:   92a19b3e78cc245671e8937ffd5530cb4bb9bcc4
commit: 17f0cb9a092a2eca4259b862bc7754e9b50f93bf [76/80] btrfs: replace identity remaps with actual remaps when doing relocations
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20260117/202601171944.CbSjYmaV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171944.CbSjYmaV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171944.CbSjYmaV-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   fs/btrfs/relocation.c: In function 'do_remap_reloc_trans':
>> fs/btrfs/relocation.c:5023:15: warning: 'start' may be used uninitialized [-Wmaybe-uninitialized]
    5023 |         ret = copy_remapped_data(fs_info, start, new_addr, length);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/relocation.c:4939:13: note: 'start' was declared here
    4939 |         u64 start, remap_length, length, new_addr, min_size;
         |             ^~~~~
>> fs/btrfs/relocation.c:4967:9: warning: 'remap_length' may be used uninitialized [-Wmaybe-uninitialized]
    4967 |         btrfs_space_info_update_bytes_may_use(sinfo, remap_length);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/relocation.c:4939:20: note: 'remap_length' was declared here
    4939 |         u64 start, remap_length, length, new_addr, min_size;
         |                    ^~~~~~~~~~~~


vim +/start +5023 fs/btrfs/relocation.c

  4930	
  4931	static int do_remap_reloc_trans(struct btrfs_fs_info *fs_info,
  4932					struct btrfs_block_group *src_bg,
  4933					struct btrfs_path *path, u64 *last_start)
  4934	{
  4935		struct btrfs_trans_handle *trans;
  4936		struct btrfs_root *extent_root;
  4937		struct btrfs_key ins;
  4938		struct btrfs_block_group *dest_bg = NULL;
  4939		u64 start, remap_length, length, new_addr, min_size;
  4940		int ret;
  4941		bool no_more = false;
  4942		bool is_data = (src_bg->flags & BTRFS_BLOCK_GROUP_DATA);
  4943		bool made_reservation = false, bg_needs_free_space;
  4944		struct btrfs_space_info *sinfo = src_bg->space_info;
  4945	
  4946		extent_root = btrfs_extent_root(fs_info, src_bg->start);
  4947	
  4948		trans = btrfs_start_transaction(extent_root, 0);
  4949		if (IS_ERR(trans))
  4950			return PTR_ERR(trans);
  4951	
  4952		mutex_lock(&fs_info->remap_mutex);
  4953	
  4954		ret = find_next_identity_remap(trans, path, src_bg->start + src_bg->length,
  4955					       *last_start, &start, &remap_length);
  4956		if (ret == -ENOENT) {
  4957			no_more = true;
  4958			goto next;
  4959		} else if (ret) {
  4960			mutex_unlock(&fs_info->remap_mutex);
  4961			btrfs_end_transaction(trans);
  4962			return ret;
  4963		}
  4964	
  4965		/* Try to reserve enough space for block. */
  4966		spin_lock(&sinfo->lock);
> 4967		btrfs_space_info_update_bytes_may_use(sinfo, remap_length);
  4968		spin_unlock(&sinfo->lock);
  4969	
  4970		if (is_data)
  4971			min_size = fs_info->sectorsize;
  4972		else
  4973			min_size = fs_info->nodesize;
  4974	
  4975		/*
  4976		 * We're using btrfs_reserve_extent() to allocate a contiguous
  4977		 * logical address range, but this will become a remap item rather than
  4978		 * an extent in the extent tree.
  4979		 *
  4980		 * Short allocations are fine: it means that we chop off the beginning
  4981		 * of the identity remap that we're processing, and will tackle the
  4982		 * rest of it the next time round.
  4983		 */
  4984		ret = btrfs_reserve_extent(fs_info->fs_root, remap_length, remap_length,
  4985					   min_size, 0, 0, &ins, is_data, false);
  4986		if (ret) {
  4987			spin_lock(&sinfo->lock);
  4988			btrfs_space_info_update_bytes_may_use(sinfo, -remap_length);
  4989			spin_unlock(&sinfo->lock);
  4990	
  4991			mutex_unlock(&fs_info->remap_mutex);
  4992			btrfs_end_transaction(trans);
  4993			return ret;
  4994		}
  4995	
  4996		made_reservation = true;
  4997	
  4998		new_addr = ins.objectid;
  4999		length = ins.offset;
  5000	
  5001		if (!is_data && !IS_ALIGNED(length, fs_info->nodesize)) {
  5002			u64 new_length = ALIGN_DOWN(length, fs_info->nodesize);
  5003	
  5004			btrfs_free_reserved_extent(fs_info, new_addr + new_length,
  5005						   length - new_length, 0);
  5006	
  5007			length = new_length;
  5008		}
  5009	
  5010		dest_bg = btrfs_lookup_block_group(fs_info, new_addr);
  5011	
  5012		mutex_lock(&dest_bg->free_space_lock);
  5013		bg_needs_free_space = test_bit(BLOCK_GROUP_FLAG_NEEDS_FREE_SPACE,
  5014					       &dest_bg->runtime_flags);
  5015		mutex_unlock(&dest_bg->free_space_lock);
  5016	
  5017		if (bg_needs_free_space) {
  5018			ret = btrfs_add_block_group_free_space(trans, dest_bg);
  5019			if (ret)
  5020				goto fail;
  5021		}
  5022	
> 5023		ret = copy_remapped_data(fs_info, start, new_addr, length);
  5024		if (ret)
  5025			goto fail;
  5026	
  5027		ret = btrfs_remove_from_free_space_tree(trans, new_addr, length);
  5028		if (ret)
  5029			goto fail;
  5030	
  5031		ret = add_remap_entry(trans, path, src_bg, start, new_addr, length);
  5032		if (ret) {
  5033			btrfs_add_to_free_space_tree(trans, new_addr, length);
  5034			goto fail;
  5035		}
  5036	
  5037		adjust_block_group_remap_bytes(trans, dest_bg, length);
  5038		btrfs_free_reserved_bytes(dest_bg, length, 0);
  5039	
  5040		spin_lock(&sinfo->lock);
  5041		sinfo->bytes_readonly += length;
  5042		spin_unlock(&sinfo->lock);
  5043	
  5044	next:
  5045		if (dest_bg)
  5046			btrfs_put_block_group(dest_bg);
  5047	
  5048		if (made_reservation)
  5049			btrfs_dec_block_group_reservations(fs_info, new_addr);
  5050	
  5051		mutex_unlock(&fs_info->remap_mutex);
  5052	
  5053		if (src_bg->identity_remap_count == 0) {
  5054			bool mark_fully_remapped = false;
  5055	
  5056			spin_lock(&src_bg->lock);
  5057			if (!test_bit(BLOCK_GROUP_FLAG_FULLY_REMAPPED, &src_bg->runtime_flags)) {
  5058				mark_fully_remapped = true;
  5059				set_bit(BLOCK_GROUP_FLAG_FULLY_REMAPPED, &src_bg->runtime_flags);
  5060			}
  5061			spin_unlock(&src_bg->lock);
  5062	
  5063			if (mark_fully_remapped)
  5064				btrfs_mark_bg_fully_remapped(src_bg, trans);
  5065		}
  5066	
  5067		ret = btrfs_end_transaction(trans);
  5068		if (ret)
  5069			return ret;
  5070	
  5071		if (no_more)
  5072			return 1;
  5073	
  5074		*last_start = start;
  5075	
  5076		return 0;
  5077	
  5078	fail:
  5079		if (dest_bg)
  5080			btrfs_put_block_group(dest_bg);
  5081	
  5082		btrfs_free_reserved_extent(fs_info, new_addr, length, 0);
  5083	
  5084		mutex_unlock(&fs_info->remap_mutex);
  5085		btrfs_end_transaction(trans);
  5086	
  5087		return ret;
  5088	}
  5089	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

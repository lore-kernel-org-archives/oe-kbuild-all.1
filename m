Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21D126CE3A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 23:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761606948; cv=none; b=bCzbM0gyBvGYhA8KsAVhKa45jcO7ro4JIiCJxtYhpWVZPr86AHYDigja9Ix5slG45ipjtICq8o8T+X65Hj20lwSanu8v0oTWpmBn8yrvcPX9svVRNLcRmfv71/njQHxElXzvVRFuPZai4/Zyv2I33CcUZykRczA8Q1tz+u92vhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761606948; c=relaxed/simple;
	bh=d5DofytqRfCKTrq+GxEKkaFtA8d7f8XAgjVYlLkKR3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOkKiIgHFsrY49dIb/OxB9UB1qpDvmgJXxp6oykC6t5iqZhDuZD0hSfk96rtCCE9qeUfq7DeGajzlUbBWpaZZutWlZKc27MaeCAV7GDbCmpHPv2sipkyQeGPC98cKVBu2Ewh2zxIJem5PbeSC7IOkd0NufumNfrWEEQXOiegZpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LeqkNmTR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LeqkNmTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761606946; x=1793142946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d5DofytqRfCKTrq+GxEKkaFtA8d7f8XAgjVYlLkKR3A=;
  b=LeqkNmTRyeUevSDYw+MD7EG1K0QFbthox1J3XponyNxJKZpYn0bKvBUW
   YLpxK4HW/6KddELuFwpci7jPGSceBXtP2pQsl6MvkP7WrfyWNWDwgNCrQ
   GRC57OC4PAjeJGUEHyqay4WqH6/H5uIxx//20haVRDLhuXo5hLgpLMUQ3
   2Ilnqzqf4HsPasX8R41p/1zrNtUXEP5bSqCrw9y2U5Xu4iCaiCxN9cxvd
   +903mR5dyxt4sna6g9+T0GzTC0enBS3NQ04cE8V+OYUM5cmRvEjn6XX8W
   i+SubSY6V+QNIgMzHg89mbZuolGYvx+nimO2vpUhMwxrbhYf1yLu/VZCu
   Q==;
X-CSE-ConnectionGUID: Bkdjmi28ShOrUgvK44YUvQ==
X-CSE-MsgGUID: +3rETlEuRxWs1qq6KsDEbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67563725"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="67563725"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 16:15:45 -0700
X-CSE-ConnectionGUID: X58UMSWxQN+g7mAUJMBYIw==
X-CSE-MsgGUID: v1zDwGN6Rw+Rbf8jkbRP/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="185644880"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Oct 2025 16:15:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDWRC-000IZ7-0D;
	Mon, 27 Oct 2025 23:15:42 +0000
Date: Tue, 28 Oct 2025 07:14:58 +0800
From: kernel test robot <lkp@intel.com>
To: Naohiro Aota <naohiro.aota@wdc.com>, linux-btrfs@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Naohiro Aota <naohiro.aota@wdc.com>
Subject: Re: [PATCH 2/2] btrfs: zoned: fix stripe width calculation
Message-ID: <202510280755.pneCp9oR-lkp@intel.com>
References: <20251027072758.1066720-3-naohiro.aota@wdc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027072758.1066720-3-naohiro.aota@wdc.com>

Hi Naohiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on linus/master v6.18-rc3 next-20251027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Naohiro-Aota/btrfs-zoned-fix-zone-capacity-calculation/20251027-153738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20251027072758.1066720-3-naohiro.aota%40wdc.com
patch subject: [PATCH 2/2] btrfs: zoned: fix stripe width calculation
config: i386-randconfig-011-20251028 (https://download.01.org/0day-ci/archive/20251028/202510280755.pneCp9oR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280755.pneCp9oR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280755.pneCp9oR-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/btrfs/zoned.o: in function `btrfs_load_block_group_raid0':
>> fs/btrfs/zoned.c:1540:(.text+0x3a12): undefined reference to `__udivmoddi4'
   ld: fs/btrfs/zoned.o: in function `btrfs_load_block_group_raid10':
   fs/btrfs/zoned.c:1593:(.text+0x3c0b): undefined reference to `__udivmoddi4'


vim +1540 fs/btrfs/zoned.c

  1518	
  1519	static int btrfs_load_block_group_raid0(struct btrfs_block_group *bg,
  1520						struct btrfs_chunk_map *map,
  1521						struct zone_info *zone_info,
  1522						unsigned long *active,
  1523						u64 last_alloc)
  1524	{
  1525		struct btrfs_fs_info *fs_info = bg->fs_info;
  1526		u64 stripe_nr = 0, stripe_offset = 0;
  1527		u32 stripe_index = 0;
  1528	
  1529		if ((map->type & BTRFS_BLOCK_GROUP_DATA) && !fs_info->stripe_root) {
  1530			btrfs_err(fs_info, "zoned: data %s needs raid-stripe-tree",
  1531				  btrfs_bg_type_to_raid_name(map->type));
  1532			return -EINVAL;
  1533		}
  1534	
  1535		if (last_alloc) {
  1536			u32 factor = map->num_stripes;
  1537	
  1538			stripe_nr = last_alloc >> BTRFS_STRIPE_LEN_SHIFT;
  1539			stripe_offset = last_alloc & BTRFS_STRIPE_LEN_MASK;
> 1540			stripe_index = stripe_nr % factor;
  1541			stripe_nr /= factor;
  1542		}
  1543	
  1544		for (int i = 0; i < map->num_stripes; i++) {
  1545			if (zone_info[i].alloc_offset == WP_MISSING_DEV)
  1546				continue;
  1547	
  1548			if (zone_info[i].alloc_offset == WP_CONVENTIONAL) {
  1549	
  1550				zone_info[i].alloc_offset = btrfs_stripe_nr_to_offset(stripe_nr);
  1551	
  1552				if (stripe_index > i)
  1553					zone_info[i].alloc_offset += BTRFS_STRIPE_LEN;
  1554				else if (stripe_index == i)
  1555					zone_info[i].alloc_offset += stripe_offset;
  1556			}
  1557	
  1558			if (test_bit(0, active) != test_bit(i, active)) {
  1559				if (unlikely(!btrfs_zone_activate(bg)))
  1560					return -EIO;
  1561			} else {
  1562				if (test_bit(0, active))
  1563					set_bit(BLOCK_GROUP_FLAG_ZONE_IS_ACTIVE, &bg->runtime_flags);
  1564			}
  1565			bg->zone_capacity += zone_info[i].capacity;
  1566			bg->alloc_offset += zone_info[i].alloc_offset;
  1567		}
  1568	
  1569		return 0;
  1570	}
  1571	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

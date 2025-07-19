Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FBF15530C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752941559; cv=none; b=bXgdbNVmwsdyG5Syevnb8Obln/J1VJ7hHeW8olKhVcOYQe7BUktubzdiJbaZPSgEgwXf2O8s/eou9peNYMpZUUEWv/MeTCKdAxVo41HhKK/EW/WQRpwMkKFeT2NnZ3iNZYFd3w2bi3JOSEgcsZbXdFZSWMCc4HW3ufh0iIHdrKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752941559; c=relaxed/simple;
	bh=Sey2oWLuQ71zr5JMyMTyoqWCjr/rmAgFqX1h+NODDb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y47aN34V0N7bfM5KQwoPsJuSZDQ3DjqSe7tlVBgKGii1qXCJsJ/6bYKFBdKxtArmOI/3QuROTDNbWSnSUyBCBQFWcgVpchC1uQGMANckW9THaFgEtrRKPnGJ+KJTqwpVmJAYSpyc577tq64D1kFkt/lXOrC7KVqRJz4u4ii+iyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLVLE+nL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLVLE+nL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752941559; x=1784477559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sey2oWLuQ71zr5JMyMTyoqWCjr/rmAgFqX1h+NODDb4=;
  b=NLVLE+nLaR2IaCqeDuSXvxQO5WwbXq9bSUlwNBpdXmPKaQwdU0jhVjFw
   R3TRQJFJRJpklDH9fqPuCamcqkz/J3hpXFb0aKPNqBlSUYe19bHrWcgwE
   hkuagOPOIkG6quHQD54tj1Kze//hi3eFEC0FakaaZCAWcykXu8b7jEocS
   0mP6krkR+iCDAca5sCLiyeQN8qrvEGQb0vamOOUmIC/BempGLz8tlZ4N0
   4ifuPxT8/dp91+oB1p4n7px0RFeY8SDPZerDQ84sNTLsftqSs+RLIzSP5
   pAaFVP3SKIIu4If8j3RzWm8CM4Wr8kdq/y/8y3Ruknq8HljcI2WHVK46T
   A==;
X-CSE-ConnectionGUID: tiISlbRbTxCYLMuys6Y20w==
X-CSE-MsgGUID: 55hMaSC8QV2FGPwcFcbHOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="58999879"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="58999879"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 09:12:37 -0700
X-CSE-ConnectionGUID: 8M7gmK6KQ629CDjcYyOvVQ==
X-CSE-MsgGUID: YmEeoZsyS12eRPmGZRq/jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="158250357"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jul 2025 09:12:35 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udAAq-000Fbf-3A;
	Sat, 19 Jul 2025 16:12:32 +0000
Date: Sun, 20 Jul 2025 00:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 2/4] fs/f2fs/data.c:4166:39: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202507200026.tYwtP0ZY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   88d7b4ea1d137bb80fc2cd458ffea283c37e2783
commit: 0b497cf366b5124f32a3f20dca8da28e896283d9 [2/4] f2fs: don't break allocation when crossing contiguous sections
config: i386-randconfig-063-20250719 (https://download.01.org/0day-ci/archive/20250720/202507200026.tYwtP0ZY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507200026.tYwtP0ZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507200026.tYwtP0ZY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/f2fs/data.c:4166:39: sparse: sparse: Using plain integer as NULL pointer

vim +4166 fs/f2fs/data.c

  4161	
  4162	static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
  4163				    unsigned int flags, struct iomap *iomap,
  4164				    struct iomap *srcmap)
  4165	{
> 4166		struct f2fs_map_blocks map = {0, };
  4167		pgoff_t next_pgofs = 0;
  4168		int err;
  4169	
  4170		map.m_lblk = F2FS_BYTES_TO_BLK(offset);
  4171		map.m_len = F2FS_BYTES_TO_BLK(offset + length - 1) - map.m_lblk + 1;
  4172		map.m_next_pgofs = &next_pgofs;
  4173		map.m_seg_type = f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
  4174							inode->i_write_hint);
  4175		if (flags & IOMAP_WRITE && iomap->private) {
  4176			map.m_last_pblk = (unsigned long)iomap->private;
  4177			iomap->private = NULL;
  4178		}
  4179	
  4180		/*
  4181		 * If the blocks being overwritten are already allocated,
  4182		 * f2fs_map_lock and f2fs_balance_fs are not necessary.
  4183		 */
  4184		if ((flags & IOMAP_WRITE) &&
  4185			!f2fs_overwrite_io(inode, offset, length))
  4186			map.m_may_create = true;
  4187	
  4188		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DIO);
  4189		if (err)
  4190			return err;
  4191	
  4192		iomap->offset = F2FS_BLK_TO_BYTES(map.m_lblk);
  4193	
  4194		/*
  4195		 * When inline encryption is enabled, sometimes I/O to an encrypted file
  4196		 * has to be broken up to guarantee DUN contiguity.  Handle this by
  4197		 * limiting the length of the mapping returned.
  4198		 */
  4199		map.m_len = fscrypt_limit_io_blocks(inode, map.m_lblk, map.m_len);
  4200	
  4201		/*
  4202		 * We should never see delalloc or compressed extents here based on
  4203		 * prior flushing and checks.
  4204		 */
  4205		if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
  4206			return -EINVAL;
  4207	
  4208		if (map.m_flags & F2FS_MAP_MAPPED) {
  4209			if (WARN_ON_ONCE(map.m_pblk == NEW_ADDR))
  4210				return -EINVAL;
  4211	
  4212			iomap->length = F2FS_BLK_TO_BYTES(map.m_len);
  4213			iomap->type = IOMAP_MAPPED;
  4214			iomap->flags |= IOMAP_F_MERGED;
  4215			iomap->bdev = map.m_bdev;
  4216			iomap->addr = F2FS_BLK_TO_BYTES(map.m_pblk);
  4217	
  4218			if (flags & IOMAP_WRITE && map.m_last_pblk)
  4219				iomap->private = (void *)map.m_last_pblk;
  4220		} else {
  4221			if (flags & IOMAP_WRITE)
  4222				return -ENOTBLK;
  4223	
  4224			if (map.m_pblk == NULL_ADDR) {
  4225				iomap->length = F2FS_BLK_TO_BYTES(next_pgofs) -
  4226								iomap->offset;
  4227				iomap->type = IOMAP_HOLE;
  4228			} else if (map.m_pblk == NEW_ADDR) {
  4229				iomap->length = F2FS_BLK_TO_BYTES(map.m_len);
  4230				iomap->type = IOMAP_UNWRITTEN;
  4231			} else {
  4232				f2fs_bug_on(F2FS_I_SB(inode), 1);
  4233			}
  4234			iomap->addr = IOMAP_NULL_ADDR;
  4235		}
  4236	
  4237		if (map.m_flags & F2FS_MAP_NEW)
  4238			iomap->flags |= IOMAP_F_NEW;
  4239		if ((inode->i_state & I_DIRTY_DATASYNC) ||
  4240		    offset + length > i_size_read(inode))
  4241			iomap->flags |= IOMAP_F_DIRTY;
  4242	
  4243		return 0;
  4244	}
  4245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B311AAD7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708777917; cv=none; b=D6nxkC5/FzEA2S2ZLKQnkts3TEWKVfmVu6LBlkCC3icDOybIsbISbOZKsdBKZGJbZJHiYylhXXtSTvxIQbGWsH6edv+zgE1YJd3h54zuI6RrUVW6BG9FM1H/wV0bBe4VW0I/w3HnusVp8DRF6wGcSV5IZadwp8yzXs6xxgbRixk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708777917; c=relaxed/simple;
	bh=zQTR2RFznfdQ1k25SQc0+kSzwEjNTdx8D0LvHuM3Vxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JkY5g26auQdVnTTGOomMkAwK59xq5IeXoSHs1rze8+K6CTs1x38bVK42X4EbY67EftLDVAtS81INv6n/qb9A6dzgLExw/z66dPchH2uiC7i8gXFH9nfwD7UzkvLuVnEZJwTCky+WsZWKRXAID2NGLfq8/cXCNeX8KU8nNIaN4Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDDffJYQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDDffJYQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708777915; x=1740313915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zQTR2RFznfdQ1k25SQc0+kSzwEjNTdx8D0LvHuM3Vxs=;
  b=LDDffJYQRV2Q4PU2Tr5GwYRXA5SUEEM7sFBCdPlOdR0GLv5no90aKG2u
   3ASUr9rqflMqnQZgpbFPjzV/ZKoQvAoP0B3i+v2FFQJ6GZu+KKDBjhDdO
   AjTac/D/QO0oAnB2mrZ+wDA3D//gMYadoW9VF2dQAmfmZmONSAGaXvRBV
   iu0pibfCIC77Yz0r4mlxKx8omgMZzpf78fW9mxKzBHAHQUz4uKijCpo9Q
   MT7Cg+8udj1TUvg11ALxevvG5celuyd35KOj9gUQPrajhgI0iPDmY85y0
   gGO91LCrzIm++1cpmVqU0195L1FxS1+bgkqbDfLFYSzEBrs7T8Awv27TT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="3270386"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="3270386"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 04:31:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6546941"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Feb 2024 04:31:53 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdrC2-0008W8-2c;
	Sat, 24 Feb 2024 12:31:50 +0000
Date: Sat, 24 Feb 2024 20:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Yi <yi.zhang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:ext4-iomap-v3 32/40] fs/ext4/inode.c:3620:undefined
 reference to `__divdi3'
Message-ID: <202402242032.Btcxzwbw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux ext4-iomap-v3
head:   9e716d325090913e86881adce749ee351757232e
commit: 1c02dbf66a9f0526f0f55e4230419ad652e6fbe5 [32/40] ext4: implement buffered write iomap path
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20240224/202402242032.Btcxzwbw-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402242032.Btcxzwbw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402242032.Btcxzwbw-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: fs/ext4/inode.o: in function `ext4_iomap_punch_delalloc':
>> fs/ext4/inode.c:3620:(.text+0x864): undefined reference to `__divdi3'


vim +3620 fs/ext4/inode.c

  3609	
  3610	/*
  3611	 * Drop the staled delayed allocation range from the write failure,
  3612	 * including both start and end blocks. If not, we could leave a range
  3613	 * of delayed extents covered by a clean folio, it could lead to
  3614	 * inaccurate space reservation.
  3615	 */
  3616	static int ext4_iomap_punch_delalloc(struct inode *inode, loff_t offset,
  3617					     loff_t length)
  3618	{
  3619		ext4_es_remove_extent(inode, offset >> inode->i_blkbits,
> 3620				DIV_ROUND_UP(length, EXT4_BLOCK_SIZE(inode->i_sb)));
  3621		return 0;
  3622	}
  3623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

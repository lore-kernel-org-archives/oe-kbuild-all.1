Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AB2311968
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 04:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789360865; cv=none; b=H4pga53sA1y/Ewj4CEP1EaINwlBqoYhHJnIfIuCe7HBlXXR8W+TbqPsGIer1vExU5M09cY1oITA2eKPRafaqrgh/tNcHAKEop9EHYNVrRPKRW+PIb+ExtvDbYft3YzZ47iQ9dgFsh/w9ABNB4AzygdN0d3EV5M9j5uTSeTnDKyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789360865; c=relaxed/simple;
	bh=2cuvoV5qtSRAhX5Cdw/yajanBJLwuATcmO9iT8Tbenw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lJySQOyGBQb7V6F9TUW9KhsywB8ujDZ52j+Rk/xqmV3R2Mai5Rdu7nnL9X5j8bvJ+DMuECGe+5QCIql33a6xsMZWmhe7BQUwNm6klZnb0FrEtsla5+PIuAfoaVLJ4gv4zAmzozcSf7a5CtftxZwEJ4lYPmI7q5xiIBwvceSnSYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TuRpnb65; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TuRpnb65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789360863; x=1820896863;
  h=date:from:to:cc:subject:message-id;
  bh=2cuvoV5qtSRAhX5Cdw/yajanBJLwuATcmO9iT8Tbenw=;
  b=TuRpnb65mg+kxlTzSv40l9qoXrn58KFyYrP2dq/b/N6XWl19tGPucvZT
   jiiyK/xxBkVL85uE1H9VCpziGKdDpKTt9O7t8Cx02Pxv5henMVSJVOXxz
   1fQlEO7fTay7KI62bu7Yz7biW8/sBUZ3cTmoiK+DmT8PInSW7dGNhdr/K
   zak3eM+yJKNukD9o6kH7ERyrS5MhRNYnFTSG3jRn3Gc/kHBxKZPbO8pKQ
   GhDPxxYsQ/9XOjruIreeZtg0sSbPQDYmydATKYs+24t470Xj0wJpP9Qa+
   JPt6KWWokvLv6SEAz2NaFiOjau5SoFDVaW7r0IKqpuj2GqxBYQCb3HGQn
   A==;
X-CSE-ConnectionGUID: BzdVUB1wRGCJkEk2eOQiHQ==
X-CSE-MsgGUID: EBphNmIESteJ/JH/jsL8pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100375108"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="100375108"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 21:41:03 -0700
X-CSE-ConnectionGUID: QQ16VeHzRRuiqL5BSi8BZA==
X-CSE-MsgGUID: sc8h1nFeTqqyFMkJueXMhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="276694446"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Sep 2026 21:41:02 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5yV1-000000002Ux-2b67;
	Mon, 14 Sep 2026 04:40:59 +0000
Date: Mon, 14 Sep 2026 12:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 26/30] ld: xfs_verify_media.c:undefined
 reference to `__moddi3'
Message-ID: <202609141224.vy80ng7j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   13c4aa2fcb1f62fdf47e7abe90741e89f682761e
commit: 0692a9486187fcc773504e42ef621c740441dd2b [26/30] xfs: verify data checksums during media verification
config: i386-buildonly-randconfig-002-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141224.vy80ng7j-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141224.vy80ng7j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141224.vy80ng7j-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/libxfs/xfs_rtcsumfile.o: in function `xfs_rtcsum_bmap':
   xfs_rtcsumfile.c:(.text+0x7b): undefined reference to `__divdi3'
   ld: fs/xfs/libxfs/xfs_rtcsumfile.o: in function `xfs_rtcsum_file_size':
   xfs_rtcsumfile.c:(.text+0x21f): undefined reference to `__udivdi3'
   ld: fs/xfs/xfs_ioend.o: in function `xfs_rtcsum_verify_ioend':
   xfs_ioend.c:(.text+0x3ca): undefined reference to `__moddi3'
   ld: fs/xfs/xfs_iomap.o: in function `xfs_read_iomap_begin':
   xfs_iomap.c:(.text+0x44cf): undefined reference to `__moddi3'
   ld: fs/xfs/xfs_verify_media.o: in function `xfs_submit_verify_bio_csum':
   xfs_verify_media.c:(.text+0x942): undefined reference to `__moddi3'
>> ld: xfs_verify_media.c:(.text+0xad9): undefined reference to `__moddi3'
   ld: fs/xfs/xfs_rtcsum.o: in function `xfs_rtcsum_log_one':
   xfs_rtcsum.c:(.text+0x84): undefined reference to `__divmoddi4'
   ld: fs/xfs/xfs_zone_gc.o: in function `xfs_zone_gc_finish_chunk':
   xfs_zone_gc.c:(.text+0x977): undefined reference to `__moddi3'
   ld: fs/xfs/xfs_zone_gc.o: in function `xfs_zone_gc_start_chunk':
   xfs_zone_gc.c:(.text+0x1199): undefined reference to `__moddi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

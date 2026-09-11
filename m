Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E77585966
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 20:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158147; cv=none; b=MrM8k8U4wzssoIkBqIGVkXWN21mdjfeA+opH+CRNNBxzXCnnalMmkTp4/N/oGhWrJWbxW7D38K49/HvP7K0zpL0uW+DYYyL3XSNDpZfMM+agBdNk4Dib3t4J05l7UihKozLZArsynx09ZF5ZD4aUp9JWMAgYfbXzGQI4x+ET4fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158147; c=relaxed/simple;
	bh=OS2bSdLTXmaI4+jQDcQKHCToQdF13rl6wXms6JWF7rk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gvu4IWFWhJWvQYWMpev6D3bkQW/HbJrdCynejWJqbqcdYMreWv51/Dalc/n+ue0fy6atD9kf+4IBhDFwmZQ44n0Qfwz3cIm64vwfA4SqhRQrv8kUavXQu7d66Rt1/3T9kqL4fL+3c3m9WCMkYByic98jr3+A2HdhZGSGfh1mk5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOf2LN15; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOf2LN15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789158143; x=1820694143;
  h=date:from:to:cc:subject:message-id;
  bh=OS2bSdLTXmaI4+jQDcQKHCToQdF13rl6wXms6JWF7rk=;
  b=VOf2LN15hHUegROQZfutZUBfIoJ0UA45yiEYb+fpDYAkDkq21RKKDp6U
   hD0h4BAdasnLcZcr6ZgWf7WXQiu/IS2OiisOpLP8mCHdS+oZRngC+kGIq
   XDBl9AmLLj6iTt6/EjTcK9tVBF11tQRSzqEPCE8W+6M7Z1EH7V8lsguyb
   vIsqIUNuvQOhX7mdqOGOjEshJPaoASiyLnx+gee3EuZPt2Db7sdUieT4S
   EX6HNUQOAE4C3A5ZCg5HEa+EXuTj0Zpn6qFezktiRLvTWFqFI7sYFjwCL
   BGN/AG0pQasRlCHf6G74oVGEzejKSmOwvEdNLVxqSla+jGsVy62fyhMpL
   w==;
X-CSE-ConnectionGUID: Pw3ZVxlxTF+7HHxbiGD5yQ==
X-CSE-MsgGUID: aSkVxHsbQyu2CsUjBpL19g==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="99955386"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="99955386"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:22:20 -0700
X-CSE-ConnectionGUID: l3wms8PWS8mgk+7BU4W4Qg==
X-CSE-MsgGUID: mf9BIBgwSQ6X88TT+v/QFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="295505105"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Sep 2026 13:22:17 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x57lH-0000000027t-0y90;
	Fri, 11 Sep 2026 20:22:15 +0000
Date: Sat, 12 Sep 2026 04:21:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 39/51] xfs_rtcsumfile.c:undefined reference
 to `__divdi3'
Message-ID: <202609120444.qG4Glbd5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christoph,

First bad commit (maybe != root cause):

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   c139b7471104b8928a7f979d91155590ba5e0c2f
commit: 7031d4764406ce0fa976364248fe7d9bc12c2392 [39/51] xfs: add support for per-RTG csum files
config: xtensa-randconfig-001-20260911 (https://download.01.org/0day-ci/archive/20260912/202609120444.qG4Glbd5-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120444.qG4Glbd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609120444.qG4Glbd5-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/ceph/super.o: defined in discarded section `.exit.text' of fs/ceph/super.o
   `.exit.text' referenced in section `__jump_table' of fs/ceph/super.o: defined in discarded section `.exit.text' of fs/ceph/super.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
>> xtensa-linux-ld: fs/xfs/libxfs/xfs_rtcsumfile.o:(.text+0x4c): undefined reference to `__divdi3'
   xtensa-linux-ld: fs/xfs/libxfs/xfs_rtcsumfile.o: in function `xfs_rtcsum_bmap':
>> xfs_rtcsumfile.c:(.text+0xd2): undefined reference to `__divdi3'
>> xtensa-linux-ld: xfs_rtcsumfile.c:(.text+0x2b0): undefined reference to `__udivdi3'
   xtensa-linux-ld: fs/xfs/libxfs/xfs_rtcsumfile.o: in function `xfs_rtcsum_file_size':
>> xfs_rtcsumfile.c:(.text+0x2ea): undefined reference to `__udivdi3'
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/pps/clients/pps-ktimer.o: defined in discarded section `.exit.text' of drivers/pps/clients/pps-ktimer.o
   `.exit.text' referenced in section `__jump_table' of drivers/pps/clients/pps-ktimer.o: defined in discarded section `.exit.text' of drivers/pps/clients/pps-ktimer.o
   `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_common.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o
   `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_common.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

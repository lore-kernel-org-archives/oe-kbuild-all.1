Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861E8163
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 22:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770676444; cv=none; b=uVlWGOrGkcSDfqN2+Fxfa7jgpws0QOFD0iwpDhJ3BSyawrPx9cyAjktb6HDlWY7i4UarmMPGqYWjp1oKboyOvoW+i+LFM86T7EAXq8TxqM0c8yYKKOBKT27fDD7LIaUZtZNgycoBjW4aIK8bJTFdzoWZlYju+65nHKIf9WwGF4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770676444; c=relaxed/simple;
	bh=7CUP0idvuhbtmrIQc4DohrFT5vzFApVVlKMl08eKB6o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PSbv4yt529bGSN8EMFQ2n4kgBy4MBlubQT2KAiqR+uNXMxO1xD084+l79y3FS8waTpZLe15Y8xbpcQ7kGjyTYAo8stHoWk/btTbuGC/kYmt5F9k/slGIaFj+edhhnHSbXdp4u7Ofs8uTsaUiAWyhTd9/YNBg9sqPnEmMuQAJP70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFip5s+V; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFip5s+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770676444; x=1802212444;
  h=date:from:to:cc:subject:message-id;
  bh=7CUP0idvuhbtmrIQc4DohrFT5vzFApVVlKMl08eKB6o=;
  b=hFip5s+VC8SLYltYtFUCdXwZnJzWxpf4jAhPBaQdMLgi3zjIDdF2is9w
   kWoqxPHNLX+uLx/lONs37gD1YElXIIaqL29W+mwMiqofBhetqfx3uJ/ca
   IIYD6SnzzG4r+EfhYYmJrqMr2CgcrVow0a2LSYIDRIIwjFl/ktWRiWx13
   iwdYS7EDYfDjmpxMAUveLG+XgOOErcb0Zv8hzyD47T8/NQ90+FZ1v1Rve
   h7zhOSjaoN7eNAx7D5i/eoieuxHgJLi5T34NEfqJ4ryjxJ2QGEbYe+ARi
   59pH+Te3uVhJP9iEN6b+WmjIIopToQH/UqAfEpORc/BrR1dUvOM0Eb44V
   w==;
X-CSE-ConnectionGUID: QTK1s2RIQjKtlEiG2iwoAA==
X-CSE-MsgGUID: /TIl4jMOR+GRY0ddUxHd5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="94440535"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="94440535"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 14:34:03 -0800
X-CSE-ConnectionGUID: XXUk21YsRGu6FQB2YguaRw==
X-CSE-MsgGUID: C5/YC5DyTm+dyv1yNO3aKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="234670195"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Feb 2026 14:34:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpZpP-00000000oNc-0yn3;
	Mon, 09 Feb 2026 22:33:59 +0000
Date: Tue, 10 Feb 2026 06:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 2/3] arm-linux-gnueabi-ld:
 fs/nfsd/netlink.o:undefined reference to `nfsd_nl_svc_export_rsp_doit'
Message-ID: <202602100615.CWDyGdKT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   c85f01c61c12fb4d6f368ae8e37e83a9d6fd0305
commit: 0e13ddc5e80de4eb58edd0a542ece89747043045 [2/3] nfsd: add new netlink spec for svc_export upcall
config: arm-socfpga_defconfig (https://download.01.org/0day-ci/archive/20260210/202602100615.CWDyGdKT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100615.CWDyGdKT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100615.CWDyGdKT-lkp@intel.com/

Note: the jlayton/kdevops HEAD c85f01c61c12fb4d6f368ae8e37e83a9d6fd0305 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: fs/nfsd/netlink.o:(.rodata+0xf0): undefined reference to `nfsd_nl_svc_export_rsp_doit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

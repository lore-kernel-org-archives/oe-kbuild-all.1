Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761CD1DB366
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 21:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746741232; cv=none; b=T0Mdaui5G/HDlXjHGc5xiUZ4/Ng/ADJQ6eeGLxhcoXerIKyftVcjIT2htE7BDYNERo/5c/cAc6E+vK7UHCjdJpJxql0+Y/IG3nvgnkUWRdfyKmOYIhuIV7Fz5mjGV1A5VAobZ/xv9zACWrVZlxO9zw+SZu8/DJtWIsYevt5uiIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746741232; c=relaxed/simple;
	bh=4QFYvrOPKCY+xYx+Go+CT1WjL5/rjgZ8bpxmEagQmks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P0gL7P+r5Fwohwn8O9EukXOjZhcT8lDA0Z8zUwyTv76VtdF8KDMgv/0XoIXYUwR0XqkswkTHUlYYF5UqNp/zdmHYYjPipESD4HrAEOjaX3PqnYE4Pr/gS5e1dSlVMDcLcaS1ih+dneNe/QepDLiPCqeSiV/oPlZK/rdGDK1a65o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPM22SU7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPM22SU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746741232; x=1778277232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4QFYvrOPKCY+xYx+Go+CT1WjL5/rjgZ8bpxmEagQmks=;
  b=KPM22SU7R3fL1Y0lJbxHoEliP3qIznA/Mp4hehtmLINpnY+bnGXwYCMA
   1qYeOij/iN9qNWy72b8sdYkS98woo4qm55CWvrR0zUMi8f9jdbMPaoIpN
   WidIGfeMO+zHDee3oRqsuOse1g7hguDw9vhE5mgod/1/ircp/T6nebnrU
   6ap+jQtqUU1Lys+2XHJO4HHhyjmbhvwp4vQx06hXs5y/bd7KK/UjDAgvW
   oL4lZXS+sB87NVM37X0NiuZOGADfBD0jVHPlnNOH19mNm9PAXeIWynhGA
   FxABPIxsDqqsBNvTiuUYvY0uhLka7o8bHjVRLSOprSvmOXMV/FbxecML1
   A==;
X-CSE-ConnectionGUID: 61YfXqmMTT+VIf+2TvTs+A==
X-CSE-MsgGUID: YH1kkWigRzWPlpTMJ5k7Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48465141"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48465141"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 14:53:51 -0700
X-CSE-ConnectionGUID: F6oz8dGPRmSO8vJ5lUNIyw==
X-CSE-MsgGUID: y5eUFplYSZyIn8YI7wVNAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136430511"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 May 2025 14:53:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD9Bb-000BPF-3A;
	Thu, 08 May 2025 21:53:47 +0000
Date: Fri, 9 May 2025 05:53:33 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-net-crc32c 5/10] ERROR: modpost: "skb_crc32c"
 [net/netfilter/nf_conntrack.ko] undefined!
Message-ID: <202505090548.VycES6DA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-net-crc32c
head:   afbcea6399d0902afcbd87a2c51e4437e3633c7a
commit: 9253504c252e9f6aad649a2aa5eecba66aa02aa0 [5/10] sctp: use skb_crc32c() instead of __skb_checksum()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250509/202505090548.VycES6DA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090548.VycES6DA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090548.VycES6DA-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "skb_crc32c" [net/netfilter/nf_conntrack.ko] undefined!
>> ERROR: modpost: "skb_crc32c" [net/netfilter/nf_nat.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

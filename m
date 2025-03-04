Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072A51F3B8B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 07:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741073078; cv=none; b=biQgcmQKqaWZs8u2WH6ULlv1k06ABNbegil5QWWiPK5f/3Uw2rlRzUJogg0cEaqKhEqzg9HtEJ7JkuGLV1fCE6u8kFoR6medzn5OyeqhUlCmQyVMXsMuuMe42lnOOe14Vn1fu1av2sdWzMtq0+TFHe82NmCgVFZh9nx3w62U+6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741073078; c=relaxed/simple;
	bh=QS3XVYHkPAanspFvOqL+q6ZgmUnJG8pl7Sp/2ZB0Fnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K5j1ULEmNAREJi0A3GiTj3ttJOThDRfOq0HATYJvumb/Xma+lhkR2rhnfgmyUt7jPrNaTZiJnNbj4xssyUWP+Or8ATiJ/aX4cCUDoDtkQmipqtnb7JG5Aa7fYn9kBHtgUZT3kom4VbPE18dWRGPOSIZZTtkdVOUlp4t/moyWRS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ATXFaUf9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ATXFaUf9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741073076; x=1772609076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QS3XVYHkPAanspFvOqL+q6ZgmUnJG8pl7Sp/2ZB0Fnc=;
  b=ATXFaUf9Sv9rWT7RwEJuPamu1pZMvSEkUpAhEEsUIn7ChvBL6AUQhdQP
   fifFmHBDfsd0FsH3ARLffKb8tNJFdv2fkcrpHjY3oR9RdNcRTJnOHaBQO
   Rm9WoQNeB23nJQXB0h9ttdv3SBGWVF7VflSKJzeGcTHy1sh+B5ApfCbIt
   OVXpa1gaL0hd8zXikOR3+rDIRFX/wMH6unRMJtWtyfsksk9GIarG10iDk
   dWUxGUHaTitsuE5jjO1dEOkQC8Dd5Cfjo01wA30m3qrAes3JJBOy1Ai89
   AMo7e6uYRfokZ9LSeaka7KtnHkSfS94NyiqJLk9F0mvi6jxNMBCr9cV7u
   w==;
X-CSE-ConnectionGUID: URGZbXSNRtGMtuiHxZ5kCA==
X-CSE-MsgGUID: RnDH1TgVRK+gqUbJ3q2zRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="64422078"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="64422078"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 23:24:34 -0800
X-CSE-ConnectionGUID: mr4BK6+XQaaOTDVb5xg+fQ==
X-CSE-MsgGUID: 4VLkREaBSWSYNohqPgJwjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119210454"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 03 Mar 2025 23:24:34 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpMdj-000JPe-1n;
	Tue, 04 Mar 2025 07:24:31 +0000
Date: Tue, 4 Mar 2025 15:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 7/7] ld.lld: error: undefined symbol:
 cma_get_first_virtzone_base
Message-ID: <202503041514.4YmqI71Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   46d2359d75bd941964a80569e952827904b763fa
commit: cb268664c36e97586b7d5c3836c2027339dcc91f [7/7] ANDROID: mm: Skip the virtzones area when reserving the CMA region
config: x86_64-buildonly-randconfig-001-20250304 (https://download.01.org/0day-ci/archive/20250304/202503041514.4YmqI71Q-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503041514.4YmqI71Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503041514.4YmqI71Q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: cma_get_first_virtzone_base
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__reserved_mem_alloc_size)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

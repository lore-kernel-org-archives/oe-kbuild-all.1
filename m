Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C24320298D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 10:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674818; cv=none; b=j90tx2AL2fceRrSeC+XUVIgCW5mgSpBsU8s/45aA1ACWKw3jL0hmQzPKjNE4BsZqS275yaj/hbkr09AhR7kJCWGA1gjAzCKN2YH09by+0vzmk3sZ+gcj3CEHf0wevklkAr3FDXc8RI0I+Dn1fS6XwQiu4vVkP082Osso0EQi4Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674818; c=relaxed/simple;
	bh=8N+GfFMCs8LL9zbMqu8LwDZBRz+2F9m4uIquYWddC30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jP2YOyMmVKMczPgR57WJ4oLAuaZs+zpHNP4ZnBZ1jB3Ruira3DSbKNlBU0PWbNhqQShbmWcnkmv1tQ4EzKGqnMeMG+53XBpoqJRskTYK3j+TO93ZO7jBuTdhk/g/KB0w1seOqZ3GKMhDITp/hkUEJsF5zs485tozLiKJAHwmIAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c718JWdB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c718JWdB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750674816; x=1782210816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8N+GfFMCs8LL9zbMqu8LwDZBRz+2F9m4uIquYWddC30=;
  b=c718JWdBNM87mzYmziIwjukwgAn5IEBoUz4A8onbOTNTnAjyrn+ejC5+
   Zwcl5dtt41FRUnktcla2BRt9Bf3S36wB2AbqqXIMxOVpdEAPJODAtMSaW
   Vqe8xKo3JMohL83z7fKJTTqu7otcSDieJh4A/E9vNkBDvYZjpR64m264E
   ao5sn5lEcmuOAWAmbEIJ8Ds0dfDfqNW34VJ7Xjy1ciHj/BMOVc2s3fl2i
   sWCdLyEwuLEW7fuIZUY3so+hQRfcKJ4JkL3svD1DFvYAt3MuLKxRri9w7
   5bYc3ZEzNKJAckqkNS64OO9JZesJn8oIT/WAdMOlLX/VjwkOZNYN+Vtp4
   Q==;
X-CSE-ConnectionGUID: X7Y0MpSrQQaXPXbe89QMAg==
X-CSE-MsgGUID: dwayXdLcRdCYY2W19c5mSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="63566341"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="63566341"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:33:35 -0700
X-CSE-ConnectionGUID: PtAGgTuYQNuQvlBphpheYg==
X-CSE-MsgGUID: I/TO9I9HTQuTycrAiXmQVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151712000"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2025 03:33:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTeUX-000NxC-00;
	Mon, 23 Jun 2025 10:33:33 +0000
Date: Mon, 23 Jun 2025 18:33:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] error[E0425]: cannot
 find function `size_of` in this scope
Message-ID: <202506231803.XmCp1uzh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alice,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   e81b218c0dc1536b8e63f5111b74ebc7e8e87adf
commit: 5e60c4805013d43492c922f537a63cd3e7e743c9 [1/1] ANDROID: ashmem_rust: add toggle for ASHMEM_UNPIN
config: x86_64-randconfig-161-20250623 (https://download.01.org/0day-ci/archive/20250623/202506231803.XmCp1uzh-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231803.XmCp1uzh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231803.XmCp1uzh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `size_of` in this scope
   --> rust/kernel/miscdevice.rs:264:19
   |
   264 |         let len = size_of::<T>();
   |                   ^^^^^^^ not found in this scope
   |
   help: consider importing this function
   |
   11  + use core::mem::size_of;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

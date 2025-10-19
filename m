Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5B93D994
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Oct 2025 15:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760888572; cv=none; b=doO6Ur7hJkptvYId79OVSyCIU89KWmJcml395lIMKn1ScHOgcvdjVDEWi0Jw5loOGoTftonADt0P2bc41WaWYQmLc/L40kAUJYcR6iWIzWQTi/DPbtfpzeofLw/2Ih8g9lgqmhxLlElmUjMSJ5fQ+i+IPrUwIWNuN7iSLB/d53M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760888572; c=relaxed/simple;
	bh=j2f0/lnoo8o9rZdFCXa4W+UDc/3ojju/8WNJRgael+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nipIVQveaa7GxpyrF9N8CjazGQxz1Olx6DGZpYVnkw6e6j8ga3VLlCe463y1pGq7m5TMsK4uUQBQrh0l9qwuvEKjQQUrB3L9UqLk5SfDGf/BmAs1K/3eJ3Sd+VKQob5z3Pk8clq4Y+aKOFpX3kQjKs2NI/rTNhVaYgfPO4GmBCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=adw0EN1k; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adw0EN1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760888570; x=1792424570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j2f0/lnoo8o9rZdFCXa4W+UDc/3ojju/8WNJRgael+M=;
  b=adw0EN1khde/p7P9oeG+4IXsva0CUVqcmxgK648KvCzAo3ICrDKkxupT
   GlVhY55TAZpg4aPv5VLTyLPl05A75e8P+czxIr1vvASSP8oJ5S4YlIkXT
   eLK2QJrxcW/dBQMTXbqEv8DL0EgD9hFR+sf2YhFguoYAwVBvTU287M6SH
   OgJxYZqdJM4sYJYR4+7+D7/KooHKuqq4ok53au9PhsQVekOpf0y5+MQei
   R7ZW8wbGOnh9dXFR+WhUYoTQWOy9ob17ZdvyGJvixs5TYauBOC5AL/TDf
   G5Oy97PzCVdQoJForTodGv81FFDYhesExJA82XOraOQdti0pFQQfTFsUb
   w==;
X-CSE-ConnectionGUID: K5mhRai3T9eWURl8c8Ueqg==
X-CSE-MsgGUID: npx4qkqQQFay/fvBsthx2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="65646414"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="65646414"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 08:42:49 -0700
X-CSE-ConnectionGUID: icZRHZwDTNaMhuw8xK9QtQ==
X-CSE-MsgGUID: FCIXYr48QROBNn0q/3jxRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="214114802"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2025 08:42:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAVYU-00099d-39;
	Sun, 19 Oct 2025 15:42:46 +0000
Date: Sun, 19 Oct 2025 23:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-EDAC-ANBZ25520 15/15] ld.lld:
 error: no input files
Message-ID: <202510192341.kCjVa5VP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ferry,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-CWF-EDAC-ANBZ25520
head:   31f4ee37032251af8f106ffe418b8235f5e08468
commit: d8c8d96e4a922ac40a4dc2c16c3a5e554cac1d99 [15/15] anolis: virtio-blk: add ext_feature negotiation method and ring-pair feature bit
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251019/202510192341.kCjVa5VP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510192341.kCjVa5VP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510192341.kCjVa5VP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: no input files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

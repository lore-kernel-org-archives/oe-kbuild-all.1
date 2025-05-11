Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29847433A0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 May 2025 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746978776; cv=none; b=aMMNFC4YUGwLCPt+ajUhFwocVtnmUIeKw6e0u9mza2YydOz12n8AiOO1ytxjxsz0Dvx8K1Jw2nMnRL+YHEsoNtzqwf4sgG71ZMBlrX4Qh4Qe0AXysKagoWW/vK2hfQr4+eAE42j/gL7Uc9+Ydx6sXTcXU41Uksf0DVY796qrkrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746978776; c=relaxed/simple;
	bh=MqTItDfRvec8AaETc7Fi/D391WX7xSwGRZHbcqopdTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iLiAxK6+E5COayHpIJCJpwI2GBzD4LIufWcmBw2YiVvHQjtKjX0iVEn2ZoAnFBmo4FZK8u2mkqk6UoRt932Zr6HQ7G34RhS2T3P11pxhp8FNLaWblLKKymj81Vsu1I88vQXv/x4lLF5YcOy2YQO6uW7C5IV1ypQ60wS8mab7Z5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSrx2Rm0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSrx2Rm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746978775; x=1778514775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MqTItDfRvec8AaETc7Fi/D391WX7xSwGRZHbcqopdTs=;
  b=TSrx2Rm0d3eWvvaciIcdJpNAlXLf21lzRFBnIGSX0qrFHewFHqTOUStx
   c/GGB6p9LO5QAV5QITfAMPa6xJLGTg073sF7Fn2YHvkovSxiAV/ntKGDB
   CqemzJDnFhGV7aSCSJG+F1x2nbjizFqzOu1ZwsGSV7yHJgnlN7RiJ2awW
   3TiN2N1DUZwuLEw83x7CbyqUBQDtGxkQahUre37n2P71sSNGSLz4l0miZ
   mn2aVj0rWqfzNtTpiJPXxD+6Qd6vLXbYs2veUJ44cEYmqKlluykhw01+V
   60iv+8JQc+hZ5EY3MIjDPqXQMoJDGgHIy2I+7FJU+P9RPk+r3YzgxfOjb
   w==;
X-CSE-ConnectionGUID: aZxLOem5SvuP2L3Wo1BySA==
X-CSE-MsgGUID: ySSWddM1RLWxz6JVkBLMuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="66178178"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="66178178"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 08:52:54 -0700
X-CSE-ConnectionGUID: aS9YgBuuT9iNNkAuSlwR2g==
X-CSE-MsgGUID: JsoFTBP/QIyxOfiWFqi3aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="168219860"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 May 2025 08:52:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uE8yw-000DpP-1x;
	Sun, 11 May 2025 15:52:50 +0000
Date: Sun, 11 May 2025 23:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] drivers/iommu/ioasid.o:
 warning: objtool: ioasid_free_locked()+0x162: unreachable instruction
Message-ID: <202505112300.nM9p6Fko-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   135e4e84e5a63d5ee88888402c3f84836ab97e95
commit: e1733d5aeaad4041e86cd13a5b48a75b42af1bf5 [11/11] iommu/ioasid: Introduce notification APIs
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250511/202505112300.nM9p6Fko-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505112300.nM9p6Fko-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505112300.nM9p6Fko-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/ioasid.o: warning: objtool: ioasid_free_locked()+0x162: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

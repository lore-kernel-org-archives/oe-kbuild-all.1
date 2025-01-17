Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1441FA8F5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 09:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737107243; cv=none; b=fmYxL+D++i3igbxzLLU5EtVQKw4YvICpW+AOLj6cpev6D/XvnlGVYmWtT/0M7E4xcjB2PfZBsy0n/dIpfQ4eTOEgogTuNMojnMwNpr2C6YQTuS0f9Gvb9XUV9TdOSL8MWGYvVHSJ97e7lke/O5c6nClKuCnCdqbWkyBaBSqe6C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737107243; c=relaxed/simple;
	bh=vpIsH2ubrShgWB8Lwul4TMNwc2BoCfrd7oM8yuJtob8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n/186RvL89NwteFISzXMk0+6LLH5CAUllL7flp6xYrZbWDVq5MlGmQDdFEjpSNhV3skGvTs6G+QeST3D2GE/FO+X36ia89xej/Yi+j6nBUUsp0IboYgtPEaL7rX6cTHf1NLUZdL7a8dxrd1WwD1jBJl5LJVynCNEMe8I2E4Tquk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXl2vPv7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXl2vPv7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737107242; x=1768643242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vpIsH2ubrShgWB8Lwul4TMNwc2BoCfrd7oM8yuJtob8=;
  b=JXl2vPv7V66oiv4UYWQQdX/gOoSL7mwz+nTKNlo6Zig4P816ZZHUr7cG
   OTkcmYJNgncOoQALNl4ZCulIzCLpktJx0ETveyW7oEdxK7rl8cwv5fH7m
   jFBnezt9gBVkMlkCWa4+wzbNH04ZxiyXEqpl76z9WLXb8WabK7RdgucQB
   S6pdj2OlrlFTYjsi1Vl4LRwK51g8x0b+KmuLa/61vxOa3bY7Jol3t7pyL
   1NoX0FTPJvHWTVBSKiO6Hcqnvvv41LU2OEdACn8daV7JcpNIo9HbWWEFs
   7mT3VGn8HgDWdT5V/yYo7bFCiMFPF64HUaFvzqNvVSEy1sLMU58Utt1sc
   A==;
X-CSE-ConnectionGUID: rJyb6/L5QyWXIMixyXvdWA==
X-CSE-MsgGUID: aDBUomRiRCiwSxsqm+Gz+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48928296"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="48928296"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 01:47:21 -0800
X-CSE-ConnectionGUID: OZj3UnQ0RjKANlDR22BKcg==
X-CSE-MsgGUID: KkkK8ChpR2uV3LAYY3P/jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="105718378"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2025 01:47:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYiwe-000T2E-2w;
	Fri, 17 Jan 2025 09:47:16 +0000
Date: Fri, 17 Jan 2025 17:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2709/2709] fs/buffer.o: warning: objtool:
 __breadahead_gfp()+0x9b: unreachable instruction
Message-ID: <202501171739.hW4TwhmP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   08e54ea5e4a4948874ca30d91be3e5cca4ecbeec
commit: 1ee722823d036ae6478e6bdb1afb12abff10a907 [2709/2709] fs/buffer: replace ll_rw_block()
config: x86_64-randconfig-161-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171739.hW4TwhmP-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171739.hW4TwhmP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171739.hW4TwhmP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/buffer.o: warning: objtool: __breadahead_gfp()+0x9b: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

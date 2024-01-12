Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655F1168B2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 20:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAKFTwsc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705092275; x=1736628275;
  h=date:from:cc:subject:message-id:mime-version;
  bh=o+KXhkXlnZKDxAV9HtvjeZa+0/YIpj+ATKQWBeVljVw=;
  b=eAKFTwscdrR0DAfa5wrjc+Q4jXX7q8pmAxFAnkGszAOUTg38zFT7aVx3
   3HIe7Ab4l9UvIY39c+SVfCRWULLGnjauV2bomHSuWCRKXTfEwMBV7zBKM
   cQg3dso+6/dlRU3myimY9Npx8m3vzMx9m/Iy5sbvdpp8D9N2iJLBR1p0W
   UPIR37eVbnnSSiWJ6N8+oO2zS8y2Ucc0qYND80jX+KWgMoILFMWHY4Vdz
   OwZ4vxyLSBgjkb2C+JFhaLrlHDUMNUgJI9wIylH62r+3Qk2lv+NSP3Myt
   32FjIE40M8oOKDCiVtq5UW3yf+8qudvpW/3Gt2jbdgMnpb6VpbT1MTjE9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="12650799"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="12650799"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 12:44:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="783152730"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="783152730"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 12 Jan 2024 12:44:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOOOF-0009oe-0U;
	Fri, 12 Jan 2024 20:44:31 +0000
Date: Sat, 13 Jan 2024 04:44:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:6.1/dovetail-xenomai 15646/15708] htmldocs:
 Documentation/dovetail.rst: WARNING: document isn't included in any toctree
Message-ID: <202401130445.ZOvPbOC7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   b21b4201c7eb0370e452a439cb4ce6e97c732972
commit: 93b8046b5a041b9aac3797ad35e2e1ccebd11695 [15646/15708] dovetail: add core support
reproduce: (https://download.01.org/0day-ci/archive/20240113/202401130445.ZOvPbOC7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401130445.ZOvPbOC7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/dovetail.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

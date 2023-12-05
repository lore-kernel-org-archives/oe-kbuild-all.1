Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3183E5D901
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Io6JuLZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701780088; x=1733316088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RtBu+QxQtHW+TcgROX0mBY2zSgQvg6znf9uGKvyl8Ag=;
  b=Io6JuLZYaztcscUNAxIjtzBqorkLbIiJ7wlmYuwYlG/i8FLahBSEkEBR
   z0X/dnBDlOAwgdz8VTbchR/T+Mhj5kXLmQ7CZHFqjSU8TNgElb72N8rUh
   bHiWtPWMrUXq38X6BBJlSx9kl5LffjmBDF1P1WHPzhPO3BoSRCAQN6QJq
   b0baOI6IOkiTitaSZ+IkmHk2gQok/5u937KElD1VfG/xRLNorrHjPnz81
   hAoLx2Twj6Jis+kTEKqUll3goBX/YRGVI0AE9N8W/8UjK2U0ae/2tyo3H
   mWVaiF+rXvXSrBEzHS5M2PwDzoVztLOtiJuK9tbBNtfQcMXwKmOCUOP1e
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942087"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942087"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 04:41:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018210030"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018210030"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 04:41:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAUjm-0008yf-0P;
	Tue, 05 Dec 2023 12:41:19 +0000
Date: Tue, 5 Dec 2023 20:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Leif Lindholm <leif@nuviainc.com>
Subject: drivers/firmware/efi/libstub/arm32-stub.c:12:28: sparse: sparse:
 symbol 'efi_entry_state' was not declared. Should it be static?
Message-ID: <202312052029.uKL2SfSM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 2a55280a3675203496d302463b941834228b9875 efi/libstub: arm: Print CPU boot mode and MMU state at boot
date:   3 years, 6 months ago
config: arm-randconfig-r113-20231116 (https://download.01.org/0day-ci/archive/20231205/202312052029.uKL2SfSM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312052029.uKL2SfSM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052029.uKL2SfSM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/efi/libstub/arm32-stub.c:12:28: sparse: sparse: symbol 'efi_entry_state' was not declared. Should it be static?

vim +/efi_entry_state +12 drivers/firmware/efi/libstub/arm32-stub.c

    11	
  > 12	struct efi_arm_entry_state *efi_entry_state;
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

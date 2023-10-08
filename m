Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8656D188
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Oct 2023 02:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lfeKGY3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696732906; x=1728268906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PmGMD3B+Npb1mP7MVwXf0fOYuvzPiyoEo12Oof8sNS4=;
  b=lfeKGY3cFM9M9YCb48d/XwfWdPDFanzMMALLir7vKx5nUjZGO3jPbLMz
   1OsWPfhkixSWzH+OJlMpbB9MIhHzchm6eQn/CjeVMh6atwPdtycldt2rG
   YgvrKAJM2bNdD7y0HIjhXcbxKoXuPb0e01UfwS0BnrV65+plPzOerSRnu
   ukOf0xKIoPrwSimgjtfGNrz+Bp2MotlbYiXqeDjaSJVdFycCiJ+rTECRX
   YkHjjhkVcRokf+AZOB4IvFFMhnGXaO/0iGu6xVnyTOxTkdIeDZyTKIn8a
   6heLRCEEDh9dxamuq3ZkP4szbU/g2tKInpnsMudlw9x9oC+wDmUEiAxVX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="382843276"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="382843276"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 19:41:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="822968786"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="822968786"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Oct 2023 19:41:44 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpJjh-000545-1z;
	Sun, 08 Oct 2023 02:41:41 +0000
Date: Sun, 8 Oct 2023 10:40:57 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 323/382] collect2: error: ld returned 1
 exit status
Message-ID: <202310081007.yoGMKvKO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   4a3a5f9a7567d507b37b51980516ce26b34b353e
commit: 4535fc8cd288f5c537ff9b8abe0e3131a0ebcc98 [323/382] spi: cadence-qspi: Tune PHY to allow running at higher frequencies
config: um-randconfig-001-20231008 (https://download.01.org/0day-ci/archive/20231008/202310081007.yoGMKvKO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231008/202310081007.yoGMKvKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310081007.yoGMKvKO-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: arch/x86/um/checksum_32.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/spi/spi-cadence-quadspi.o: in function `cqspi_phy_check_pattern':
   spi-cadence-quadspi.c:(.text+0x577): undefined reference to `spi_mem_exec_op'
>> collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B8620E0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 03:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oh08DFT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701054744; x=1732590744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3AUfvNhbwmjh8phTTnsW7q5Yo21lo4Iy9pBKZUYQ4eU=;
  b=Oh08DFT0v+oFBfjIPdH5RQTR9/E+Plg7Qqvm0ZiSlX2Jv5TqUZ3oUqSi
   we90P8x/T8TDoy+S3K1qZC/8uUKLsHBQ1F+w9aWLD1hGH3q4tP7tdT0hp
   ItCvlTBIuiuOTtfw0yhnM2d5oEIqvy8nz7sXulItCQUWBdsGXXMk3eYbx
   9gAMrhv1e+SsOBK3Lw+UUS2/Ur+/V6f/29STzAuGAoWVDfP6eANKcbUFw
   gltwTfQtpYhORh8/yT57pi65mFRHmgXUv51lJ1LQ+f5/iEDn7dN9SVljC
   r5HeDJsvb2KwU32dTWWE+lag4GAgk7UvQgSxqv6axsehI2QyqbXUZE2gV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="5875330"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="5875330"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 19:12:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="771788853"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="771788853"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Nov 2023 19:12:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7S2l-0005mK-0w;
	Mon, 27 Nov 2023 03:12:19 +0000
Date: Mon, 27 Nov 2023 11:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v11 10/10] spi: spi-zynqmp-gqspi: Add parallel memories
 support in GQSPI driver
Message-ID: <202311271014.0Zr8ASNR-lkp@intel.com>
References: <20231125092137.2948-11-amit.kumar-mahapatra@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125092137.2948-11-amit.kumar-mahapatra@amd.com>

Hi Amit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-linus]
[also build test WARNING on linus/master v6.7-rc2]
[cannot apply to mtd/spi-nor/next lee-mfd/for-mfd-fixes next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Kumar-Mahapatra/ALSA-hda-cs35l56-Use-set-get-APIs-to-access-spi-chip_select/20231125-182341
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-linus
patch link:    https://lore.kernel.org/r/20231125092137.2948-11-amit.kumar-mahapatra%40amd.com
patch subject: [PATCH v11 10/10] spi: spi-zynqmp-gqspi: Add parallel memories support in GQSPI driver
config: x86_64-randconfig-121-20231127 (https://download.01.org/0day-ci/archive/20231127/202311271014.0Zr8ASNR-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311271014.0Zr8ASNR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271014.0Zr8ASNR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-zynqmp-gqspi.c:227:6: sparse: sparse: symbol 'zynqmp_gqspi_update_stripe' was not declared. Should it be static?

vim +/zynqmp_gqspi_update_stripe +227 drivers/spi/spi-zynqmp-gqspi.c

   219	
   220	/**
   221	 * zynqmp_gqspi_update_stripe - For GQSPI controller data stripe capabilities
   222	 * @op:	Pointer to mem ops
   223	 * Return:      Status of the data stripe
   224	 *
   225	 * Returns true if data stripe need to be enabled, else returns false
   226	 */
 > 227	bool zynqmp_gqspi_update_stripe(const struct spi_mem_op *op)
   228	{
   229		if (op->cmd.opcode ==  SPINOR_OP_BE_4K ||
   230		    op->cmd.opcode ==  SPINOR_OP_BE_32K ||
   231		    op->cmd.opcode ==  SPINOR_OP_CHIP_ERASE ||
   232		    op->cmd.opcode ==  SPINOR_OP_SE ||
   233		    op->cmd.opcode ==  SPINOR_OP_BE_32K_4B ||
   234		    op->cmd.opcode ==  SPINOR_OP_SE_4B ||
   235		    op->cmd.opcode == SPINOR_OP_BE_4K_4B ||
   236		    op->cmd.opcode ==  SPINOR_OP_WRSR ||
   237		    op->cmd.opcode ==  SPINOR_OP_BRWR ||
   238		    (op->cmd.opcode ==  SPINOR_OP_WRSR2 && !op->addr.nbytes))
   239			return false;
   240	
   241		return true;
   242	}
   243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

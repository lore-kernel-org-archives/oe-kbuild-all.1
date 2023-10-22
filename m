Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D24681D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 08:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDwdlMJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697963514; x=1729499514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B+LUU+LUPgseHp/T5tWguaCeAhNu1hLovr80ntU32mA=;
  b=XDwdlMJYg/C5O1Plz7eL0yJLWomyC2FaMEnwRHQc5vO7424KEropDNab
   nvNjW3Q8EMTFUxFh4+z3nrTAN+GGrduMAki+/dbj4U5PLpi/m69pRAHZU
   R1CBZ/AJzis1bMWzc/+kbN+MGZuMdpGfMMLibncd4QTNDR6UcvfJl4J3z
   mwC0munNYuHfFy0FLQ79RvZsVoD015sc0yMdb6XAMkuGRStsTwu5Mx54z
   AFhR5VvjjTPaiD8fqn+1UqUMlXsADZ+KTBYIBb+QyMyY6YJywEbRjwZhW
   0qmLftsY1Xe+0XJgYGE7gLZ4A92uVydpHLOT3DWSvvYpPCBdWnZ3+xstR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="383890150"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="383890150"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 01:31:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="734369412"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="734369412"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Oct 2023 01:31:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quTs8-0005jy-2t;
	Sun, 22 Oct 2023 08:31:44 +0000
Date: Sun, 22 Oct 2023 16:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: dregan@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
	rafal@milecki.pl, joel.peshkin@broadcom.com,
	computersforpeace@gmail.com, dan.beygelman@broadcom.com,
	william.zhang@broadcom.com, frieder.schrempf@kontron.de,
	linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
	bbrezillon@kernel.org, kdasu.kdev@gmail.com,
	JaimeLiao <jaimeliao.tw@gmail.com>,
	Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Adam Borowski <kilobyte@angband.pl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/4] mtd: rawnand: brcmnand: exec_op implementation
Message-ID: <202310221656.oDdh8ExK-lkp@intel.com>
References: <20231017201417.129872-4-dregan@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017201417.129872-4-dregan@broadcom.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/dregan-broadcom-com/mtd-rawnand-NAND-controller-write-protect/20231018-042758
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20231017201417.129872-4-dregan%40broadcom.com
patch subject: [PATCH v3 4/4] mtd: rawnand: brcmnand: exec_op implementation
config: i386-buildonly-randconfig-002-20231022 (https://download.01.org/0day-ci/archive/20231022/202310221656.oDdh8ExK-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310221656.oDdh8ExK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221656.oDdh8ExK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/brcmnand/brcmnand.c:2393:5: warning: no previous declaration for 'brcmnand_exec_op_is_status' [-Wmissing-declarations]
    int brcmnand_exec_op_is_status(const struct nand_operation *op)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/nand/raw/brcmnand/brcmnand.c:2404:5: warning: no previous declaration for 'brcmnand_exec_op_is_reset' [-Wmissing-declarations]
    int brcmnand_exec_op_is_reset(const struct nand_operation *op)
        ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/brcmnand_exec_op_is_status +2393 drivers/mtd/nand/raw/brcmnand/brcmnand.c

  2392	
> 2393	int brcmnand_exec_op_is_status(const struct nand_operation *op)
  2394	{
  2395		if ((op->ninstrs == 2) &&
  2396			(op->instrs[0].type == NAND_OP_CMD_INSTR) &&
  2397			(op->instrs[0].ctx.cmd.opcode == NAND_CMD_STATUS) &&
  2398			(op->instrs[1].type == NAND_OP_DATA_IN_INSTR))
  2399			return 1;
  2400	
  2401		return 0;
  2402	}
  2403	
> 2404	int brcmnand_exec_op_is_reset(const struct nand_operation *op)
  2405	{
  2406		if ((op->ninstrs == 1) &&
  2407			(op->instrs[0].type == NAND_OP_CMD_INSTR) &&
  2408			(op->instrs[0].ctx.cmd.opcode == NAND_CMD_RESET))
  2409			return 1;
  2410	
  2411		return 0;
  2412	}
  2413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FBE28F9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 22:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694472054; x=1726008054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+luhMqJzd5t2PX9yoJxMR2B4a8hOtjp3kpbTrBssBYE=;
  b=E1W6rw7ygztDBBcZr+eh0Rte7/AntCrtGGz8yb1sbpR6bYwAtKlxc+aQ
   O203l1lnij91zWYHOCYUqPS87fIyFqlw/XjhpKDeZRvPROuXWpb+8jRGq
   7toxCv5xunvDpfct3WZ2/0YACgjQ13YWC1v6PVeNPWD1gmwmfS2NPXT1g
   WzNbfoSN/TqTAAY9BMOTOa5et0CN2KGF5dG2C5smdvsqmJrydp6QNImNc
   xJMnkFE6OmbNteXK2TtItCs6aDqTbkLvYEqM59J1k2YRAbYnnPn44igqh
   cnKlQyyGgiThlqb5GGjwt/IfVZYouERxiD9Y3rR/x2foTuKB+IpR7J28J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="375557092"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="375557092"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 15:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833666958"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="833666958"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Sep 2023 15:40:52 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfpaM-0006pY-0o;
	Mon, 11 Sep 2023 22:40:50 +0000
Date: Tue, 12 Sep 2023 06:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: drivers/spi/spi-mtk-snfi.c:1168: warning: Function parameter or
 member 'op' not described in 'mtk_snand_is_page_ops'
Message-ID: <202309120607.CST7vQDG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: 764f1b7481645b2b4488eda26c4da7f331697e6b spi: add driver for MTK SPI NAND Flash Interface
date:   1 year, 5 months ago
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230912/202309120607.CST7vQDG-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120607.CST7vQDG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120607.CST7vQDG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-mtk-snfi.c:1168: warning: Function parameter or member 'op' not described in 'mtk_snand_is_page_ops'


vim +1168 drivers/spi/spi-mtk-snfi.c

  1154	
  1155	/**
  1156	 * mtk_snand_is_page_ops() - check if the op is a controller supported page op.
  1157	 * @op spi-mem op to check
  1158	 *
  1159	 * Check whether op can be executed with read_from_cache or program_load
  1160	 * mode in the controller.
  1161	 * This controller can execute typical Read From Cache and Program Load
  1162	 * instructions found on SPI-NAND with 2-byte address.
  1163	 * DTR and cmd buswidth & nbytes should be checked before calling this.
  1164	 *
  1165	 * Return: true if the op matches the instruction template
  1166	 */
  1167	static bool mtk_snand_is_page_ops(const struct spi_mem_op *op)
> 1168	{
  1169		if (op->addr.nbytes != 2)
  1170			return false;
  1171	
  1172		if (op->addr.buswidth != 1 && op->addr.buswidth != 2 &&
  1173		    op->addr.buswidth != 4)
  1174			return false;
  1175	
  1176		// match read from page instructions
  1177		if (op->data.dir == SPI_MEM_DATA_IN) {
  1178			// check dummy cycle first
  1179			if (op->dummy.nbytes * BITS_PER_BYTE / op->dummy.buswidth >
  1180			    DATA_READ_MAX_DUMMY)
  1181				return false;
  1182			// quad io / quad out
  1183			if ((op->addr.buswidth == 4 || op->addr.buswidth == 1) &&
  1184			    op->data.buswidth == 4)
  1185				return true;
  1186	
  1187			// dual io / dual out
  1188			if ((op->addr.buswidth == 2 || op->addr.buswidth == 1) &&
  1189			    op->data.buswidth == 2)
  1190				return true;
  1191	
  1192			// standard spi
  1193			if (op->addr.buswidth == 1 && op->data.buswidth == 1)
  1194				return true;
  1195		} else if (op->data.dir == SPI_MEM_DATA_OUT) {
  1196			// check dummy cycle first
  1197			if (op->dummy.nbytes)
  1198				return false;
  1199			// program load quad out
  1200			if (op->addr.buswidth == 1 && op->data.buswidth == 4)
  1201				return true;
  1202			// standard spi
  1203			if (op->addr.buswidth == 1 && op->data.buswidth == 1)
  1204				return true;
  1205		}
  1206		return false;
  1207	}
  1208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

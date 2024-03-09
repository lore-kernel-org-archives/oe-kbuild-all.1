Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6FE249ED
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 22:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710023985; cv=none; b=LyxaRI15FUQt5csBoXhwFXzTa1LxAdk02KzgnMP5G61OAD8TppIkFlTqBsVkJTE59XOlb5Fiv4azrCfzZ2H2XXtyDr5dIU0OJDHkwGuow+0AowHJsYfTLVq4VDs9X9GsdCB4JR/sbSqUZrcR8II1a+dVb5YDQmDADC7uOlcokV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710023985; c=relaxed/simple;
	bh=KshtCiR0t0b+DPh2xzjhEYhHLDfq9nMYHIDn1wa1zbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ya/1SIPzSLSXYxsZUQipA5qlmulzDABtKBlLJJjazJXslLz+WXlZtjtzV6igsiEI4dUUsv4jLZwl45WyiRXAIj380xk4qhfcOBSY+vdFgPY5nqSQAZ8M3ZuM4ubywFkdVvUFWohN8/f6KyEdLvLox02ewh1vMlRah6CxDVO3ic4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/SkSO74; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/SkSO74"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710023984; x=1741559984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KshtCiR0t0b+DPh2xzjhEYhHLDfq9nMYHIDn1wa1zbA=;
  b=G/SkSO74ORqGD6K8w8kO2UF4ECKmg3YGeD/aff0E+1vmWUZ8+9ei6t+P
   SZUEcpUmgueP8qiaA3jHTdOeHdEj5zQXBYNaT73fX8aQlrlELXS/qpSwZ
   BKYMZtBsIzd6PtyyYAOzbwWODmyKcAoEXuP/5VH01Zh4vx4NqW/ExAxww
   vTmOf6TvAYoSqvhtSNumvj0qWDp9B9f4PuflOSBy98ZDisATVtv2G6bFn
   mUiyXikeexRNYEov1WKi6vwPsPohx/lGnAKKlWuKP69jPt6hw/KASDSp3
   rg7eA/xMUDdh4iCzs4HFl7/JHuPoAIfgUM2jAWs9+IfrefUjT64rUilqI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4839052"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="4839052"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 14:39:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="10885588"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Mar 2024 14:39:42 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj5Lv-0007i7-2S;
	Sat, 09 Mar 2024 22:39:39 +0000
Date: Sun, 10 Mar 2024 06:39:23 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ashyti:test/i2c-host 40/40]
 drivers/i2c/busses/i2c-qcom-geni.c:493:11: error: call to undeclared
 function 'FIELD_GET'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202403100654.k4JvUbUv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ashyti/linux test/i2c-host
head:   313d6aa4c64875ed8a10339a2db8766f49108efb
commit: 313d6aa4c64875ed8a10339a2db8766f49108efb [40/40] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI mode
config: arm-randconfig-r111-20240309 (https://download.01.org/0day-ci/archive/20240310/202403100654.k4JvUbUv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce: (https://download.01.org/0day-ci/archive/20240310/202403100654.k4JvUbUv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100654.k4JvUbUv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-qcom-geni.c:6:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/i2c/busses/i2c-qcom-geni.c:493:11: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     493 |         status = FIELD_GET(I2C_DMA_TX_IRQ_MASK, i2c_res->status);
         |                  ^
   1 warning and 1 error generated.


vim +/FIELD_GET +493 drivers/i2c/busses/i2c-qcom-geni.c

   486	
   487	static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
   488	{
   489		struct gpi_i2c_result *i2c_res = cb;
   490		struct geni_i2c_dev *gi2c = container_of(i2c_res, struct geni_i2c_dev, i2c_result);
   491		u32 status;
   492	
 > 493		status = FIELD_GET(I2C_DMA_TX_IRQ_MASK, i2c_res->status);
   494		if (status == BIT(NACK)) {
   495			geni_i2c_err(gi2c, NACK);
   496		} else if (status == BIT(BUS_PROTO)) {
   497			geni_i2c_err(gi2c, BUS_PROTO);
   498		} else if (status == BIT(ARB_LOST)) {
   499			geni_i2c_err(gi2c, ARB_LOST);
   500		} else if (result->result != DMA_TRANS_NOERROR) {
   501			dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
   502			gi2c->err = -EIO;
   503		} else if (result->residue) {
   504			dev_dbg(gi2c->se.dev, "DMA xfer has pending: %d\n", result->residue);
   505		}
   506	
   507		complete(&gi2c->done);
   508	}
   509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

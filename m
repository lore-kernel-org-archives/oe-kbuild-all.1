Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322DF6A33F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 21:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748209170; cv=none; b=p3mnPZV9ht3F4/E4SMt8cv1dzi1dpFKvlQ4/ihBE4zbaT+YULW4nRZfftZRzBXuoo4Ayt0ft4YtCB3qwjnk4MWtX1JmM1I/P0tntaetJ5l1fCdjVd78PeeqtHj7tzTLfFO0ixrL2/l9zMm1ky+SlB7vCx77HAD282+rTrtUwUhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748209170; c=relaxed/simple;
	bh=hHOzD+ilxRypnHgEwQyNmNXGlxRa1CZYmjNkaSXYZiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rlp4drqnQ/tvkgk1i2qJHH1hHyAeplDT58BNl/m4hYOrJNNyeN69uh9aLKJTQDbNDpeBT0e4O5jctWGFBsJwcTQjiWMWdmVAtFC67+hMaWyD+bKzRzHp1VvCl43JMV3pA+r/W41EViKAcLpwgMmYvKVoxRvMdLe1vlHQZgqhros=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2TUs1ih; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2TUs1ih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748209169; x=1779745169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hHOzD+ilxRypnHgEwQyNmNXGlxRa1CZYmjNkaSXYZiw=;
  b=h2TUs1ih4CfdOcL1ccUC1UbN+FDVd9d3MbftQ5YWAoC4mirglykfre+i
   i2oypQnxSq5vl7uHgfah8hA69bZGCCB8G8C1I4mjEoRNqPB+xE3BCPZ5E
   IFLtq3rzhxpGlNlQLBLjQXMnmO6GTogzOFT48VBi+3f0isl4u1jvW8u3j
   eOLAeCr77ahzbPvyvPJP+n/UMrvWPqzOkR5BDOT6SrK3WqKonGvBQ1a/a
   MLPxaq8heXo8peqPoq+DGwdNL9CNBLYc/nLtgyALFGeGRF/BqikK56drs
   eRQgjbSUhGaKM5v4MbDz9Hp51Qw254UMD+tfIV4ni2O6LCD71xaeMID1T
   g==;
X-CSE-ConnectionGUID: R2y434ycSEiK9w9EAT6U4g==
X-CSE-MsgGUID: jTmDxAImSQq+FnqxkfOvJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50179996"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="50179996"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 14:39:28 -0700
X-CSE-ConnectionGUID: x3dCyBzPSiGPO2Z1TsDTnw==
X-CSE-MsgGUID: euMQx1UuR7us7yrL4M0lQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="173005091"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 May 2025 14:39:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJJ40-000S0m-0N;
	Sun, 25 May 2025 21:39:24 +0000
Date: Mon, 26 May 2025 05:39:23 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_raid6_rvv_v5 21/73] drivers/clk/clk-rpmi.c:202:12:
 warning: assignment to 'struct rpmi_get_supp_rates_rx *' from 'int' makes
 pointer from integer without a cast
Message-ID: <202505260559.iyRlz9lO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_raid6_rvv_v5
head:   6700b4f3583c6e7cf95f16d89817343a6adfcdc0
commit: 7a9f321e07211295d163e3e5387abc7f2889e791 [21/73] clk: Add clock driver for the RISC-V RPMI clock service group
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250526/202505260559.iyRlz9lO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505260559.iyRlz9lO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505260559.iyRlz9lO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/clk-rpmi.c: In function 'rpmi_clk_get_supported_rates':
   drivers/clk/clk-rpmi.c:189:16: error: cleanup argument not a function
     189 |         struct rpmi_get_supp_rates_rx *rx __free(kfree) = NULL;
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-rpmi.c:202:14: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     202 |         rx = kzalloc(context->max_msg_data_size, GFP_KERNEL);
         |              ^~~~~~~
>> drivers/clk/clk-rpmi.c:202:12: warning: assignment to 'struct rpmi_get_supp_rates_rx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     202 |         rx = kzalloc(context->max_msg_data_size, GFP_KERNEL);
         |            ^
   cc1: some warnings being treated as errors


vim +202 drivers/clk/clk-rpmi.c

   183	
   184	static int rpmi_clk_get_supported_rates(u32 clkid, struct rpmi_clk *rpmi_clk)
   185	{
   186		struct rpmi_clk_context *context = rpmi_clk->context;
   187		struct rpmi_clk_rate_discrete *rate_discrete;
   188		struct rpmi_clk_rate_linear *rate_linear;
   189		struct rpmi_get_supp_rates_rx *rx __free(kfree) = NULL;
   190		struct rpmi_get_supp_rates_tx tx;
   191		struct rpmi_mbox_message msg;
   192		size_t clk_rate_idx = 0;
   193		int ret, rateidx, j;
   194	
   195		tx.clkid = cpu_to_le32(clkid);
   196		tx.clk_rate_idx = 0;
   197	
   198		/*
   199		 * Make sure we allocate rx buffer sufficient to be accommodate all
   200		 * the rates sent in one RPMI message.
   201		 */
 > 202		rx = kzalloc(context->max_msg_data_size, GFP_KERNEL);
   203		if (!rx)
   204			return -ENOMEM;
   205	
   206		rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_SUPPORTED_RATES,
   207						  &tx, sizeof(tx), rx, context->max_msg_data_size);
   208		ret = rpmi_mbox_send_message(context->chan, &msg);
   209		if (ret)
   210			return ret;
   211		if (rx->status)
   212			return rpmi_to_linux_error(le32_to_cpu(rx->status));
   213		if (!le32_to_cpu(rx->returned))
   214			return -EINVAL;
   215	
   216		if (rpmi_clk->type == RPMI_CLK_DISCRETE) {
   217			rate_discrete = (struct rpmi_clk_rate_discrete *)rx->rates;
   218	
   219			for (rateidx = 0; rateidx < le32_to_cpu(rx->returned); rateidx++) {
   220				rpmi_clk->rates->discrete[rateidx] =
   221					rpmi_clkrate_u64(le32_to_cpu(rate_discrete[rateidx].hi),
   222							 le32_to_cpu(rate_discrete[rateidx].lo));
   223			}
   224	
   225			/*
   226			 * Keep sending the request message until all
   227			 * the rates are received.
   228			 */
   229			while (le32_to_cpu(rx->remaining)) {
   230				clk_rate_idx += le32_to_cpu(rx->returned);
   231				tx.clk_rate_idx = cpu_to_le32(clk_rate_idx);
   232	
   233				rpmi_mbox_init_send_with_response(&msg,
   234								  RPMI_CLK_SRV_GET_SUPPORTED_RATES,
   235								  &tx, sizeof(tx),
   236								  rx, context->max_msg_data_size);
   237				ret = rpmi_mbox_send_message(context->chan, &msg);
   238				if (ret)
   239					return ret;
   240				if (rx->status)
   241					return rpmi_to_linux_error(le32_to_cpu(rx->status));
   242				if (!le32_to_cpu(rx->returned))
   243					return -EINVAL;
   244	
   245				for (j = 0; j < le32_to_cpu(rx->returned); j++) {
   246					if (rateidx >= clk_rate_idx + le32_to_cpu(rx->returned))
   247						break;
   248					rpmi_clk->rates->discrete[rateidx++] =
   249						rpmi_clkrate_u64(le32_to_cpu(rate_discrete[j].hi),
   250								 le32_to_cpu(rate_discrete[j].lo));
   251				}
   252			}
   253		} else if (rpmi_clk->type == RPMI_CLK_LINEAR) {
   254			rate_linear = (struct rpmi_clk_rate_linear *)rx->rates;
   255	
   256			rpmi_clk->rates->linear.min = rpmi_clkrate_u64(le32_to_cpu(rate_linear->min_hi),
   257								       le32_to_cpu(rate_linear->min_lo));
   258			rpmi_clk->rates->linear.max = rpmi_clkrate_u64(le32_to_cpu(rate_linear->max_hi),
   259								       le32_to_cpu(rate_linear->max_lo));
   260			rpmi_clk->rates->linear.step = rpmi_clkrate_u64(le32_to_cpu(rate_linear->step_hi),
   261									le32_to_cpu(rate_linear->step_lo));
   262		}
   263	
   264		return 0;
   265	}
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

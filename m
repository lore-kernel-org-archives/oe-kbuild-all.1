Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F067C1A76D4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 17:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748193849; cv=none; b=KI+eG3BmUUrwuLi9wc33GVtd0+buD7cIH2tiIOSpLR9C8mKZgH8VkgNvDaNHqzU4zXPoPjUIzlMO6MGaEWki7o86T0/x6/QHzhMr53p68RjKHy9oRnKyP5L2U18Z9ZPgOnx/U0Ll2i7Utc81C2GOmRvOBsheMxIPh1b6YQgsL+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748193849; c=relaxed/simple;
	bh=fwyGhsceKVno8IWq9+v+FrpBxCeXoDNOO6RuuIg0Y+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W1+OPr5KRNZrPH1i4FuCHIVClVFBF4dQ85/tdTU2b21frXRCYCNkFmeIWjFkYKO5CFmc/2306yUMVO5Lz3U3JHClFBYACsBdFa5jwS0YtR4w5LsOiAAE1kNlBwOIDWsSZDU7uDzgRMDR9LEf74Hb/T7SQ5Sok+nWWsEsTM4+GBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0dDORXx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0dDORXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748193848; x=1779729848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fwyGhsceKVno8IWq9+v+FrpBxCeXoDNOO6RuuIg0Y+E=;
  b=l0dDORXxAfCY5O2nbhaMaMma4ghMug+g+pwbbSXiLJcS42xM6CCH3eYo
   1jcp6gokx82yjX4miAg8jM6LF77JVmRUM2m7N7iZNC0zvp7ZtFsDQQ/UZ
   fFV9CrFSvH0DjtK0s59kFwSEMmColJjz0FWy46dLnV2j6Mv1ySmQ5tNED
   dq/R3mj1IUCI0mkPU7U14gAjL9TJRxUuQhd/IY0TD4CSvqIfagU/sRZlm
   TSnPeBFxLVG6nmJiqIXB+dluJfincN+XKYsbaFm9aeINj+EGs6RlmcCU0
   kMCcYT56pW6Gz4+MYxGN1aJ0hgtdrCKDL0qMD4XBlO0kqG09/uBjDe6CE
   Q==;
X-CSE-ConnectionGUID: 3TqtXXXrRgu6XbKbewShpw==
X-CSE-MsgGUID: +U7VNlxfTqWUcLiRKEh98Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="75570328"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="75570328"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 10:24:07 -0700
X-CSE-ConnectionGUID: 7GNxndQbRP+YuUblAhEHZg==
X-CSE-MsgGUID: XdCiWTJZSXaOP7ZbvrvtdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="146752344"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 May 2025 10:24:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJF4t-000Rvc-2X;
	Sun, 25 May 2025 17:24:03 +0000
Date: Mon, 26 May 2025 01:23:11 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_raid6_rvv_v5 21/73] drivers/clk/clk-rpmi.c:189:9:
 error: cleanup argument not a function
Message-ID: <202505260150.rlsq19S4-lkp@intel.com>
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
config: arm-randconfig-003-20250526 (https://download.01.org/0day-ci/archive/20250526/202505260150.rlsq19S4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505260150.rlsq19S4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505260150.rlsq19S4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/clk/clk-rpmi.c: In function 'rpmi_clk_get_supported_rates':
>> drivers/clk/clk-rpmi.c:189:9: error: cleanup argument not a function
     struct rpmi_get_supp_rates_rx *rx __free(kfree) = NULL;
            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/clk-rpmi.c:202:7: error: implicit declaration of function 'kzalloc'; did you mean 'xa_alloc'? [-Werror=implicit-function-declaration]
     rx = kzalloc(context->max_msg_data_size, GFP_KERNEL);
          ^~~~~~~
          xa_alloc
>> drivers/clk/clk-rpmi.c:202:5: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     rx = kzalloc(context->max_msg_data_size, GFP_KERNEL);
        ^
   cc1: some warnings being treated as errors


vim +189 drivers/clk/clk-rpmi.c

   183	
   184	static int rpmi_clk_get_supported_rates(u32 clkid, struct rpmi_clk *rpmi_clk)
   185	{
   186		struct rpmi_clk_context *context = rpmi_clk->context;
   187		struct rpmi_clk_rate_discrete *rate_discrete;
   188		struct rpmi_clk_rate_linear *rate_linear;
 > 189		struct rpmi_get_supp_rates_rx *rx __free(kfree) = NULL;
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

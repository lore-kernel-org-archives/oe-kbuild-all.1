Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B881259481
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 01:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734744160; cv=none; b=Nnk9l7iCE/UW4ZTC0aTACSzVI9hoo39BUmwUGSs3549yKcohymxKL9Fd0EuCFTikwMIP7MIN4EkHvx9gqihQB8hEiEsFqffWaLTfsQY3YCTGLHJVbmtzWapUGKUyClwvT7TFUUAQacs+ak568E/jfMrrEeAjaFgoe/IDDao81kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734744160; c=relaxed/simple;
	bh=jMrN65JFOUlXMbKzDLCJdfilSQAGp4MeRL81IRwoXcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rZ4Pudh/HcqAO6ADtUI8EO3+4eznRI6RrSehq8cQ9oNqqNLxvvKvIfAOWrZQTl82TBdPRZahMDWx6Az83l/nA2IMrzfAz6llHLicjQXslPx6pEL+CJv26YchDPqxJnoKU+UDQglF8L4NprdKr2s2ADR+5lofEivHKx5EHFPmOB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HIO0AP3/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIO0AP3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734744158; x=1766280158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMrN65JFOUlXMbKzDLCJdfilSQAGp4MeRL81IRwoXcQ=;
  b=HIO0AP3/XX/ZWEbozoRDsj12V4P84QQd7wF9RYB2Kmm+09ZJzlCGs2dq
   GenJ/7sB4TBDW0J2ogfL+OO6V3wmvCf1k7jOgYNNJ86WOtgrLx9zhBrKE
   WFdgzGjrQr19rm3zpBsSR6PHdaetwrPfXxZUtHS2Nt3AHqIMlPD13iCky
   5E/I5v8v1fhDCgryJzkiqHNCa0ykzU4wtntAixL6KxAcDaqsbL5sGQJze
   K6ERUx91tgn/57R48jIyjgt1YtjWc4qxptrKbf3OVkWoDIICf+89nrYoA
   ks9wfMvbwOCnkCg5d/Aba1VClEQ/7vm7fhyNl7qpx+/tbgiBO2zw++E5i
   A==;
X-CSE-ConnectionGUID: ILrnGp7aSuatrn/meX4J2A==
X-CSE-MsgGUID: jJZZ2Mi7RN23i86bb+B0OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="46307862"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="46307862"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 17:22:38 -0800
X-CSE-ConnectionGUID: jqP1BtwXTF2HU5TeW13unQ==
X-CSE-MsgGUID: tV5gnni0Sf+nktBgg8tLRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="103522216"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Dec 2024 17:22:36 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOoCQ-0001pZ-1t;
	Sat, 21 Dec 2024 01:22:34 +0000
Date: Sat, 21 Dec 2024 09:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_defconfig_v1 15/59] drivers/clk/clk-rpmi.c:172:18:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202412210918.fR6xrT6m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_defconfig_v1
head:   4fd509619498a267ba245e95fefba09eef65a97e
commit: 38aafc99456ba989993a4ba1dc6df07a9cedaccc [15/59] clk: Add clock driver for the RISC-V RPMI clock service group
config: openrisc-randconfig-r122-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210918.fR6xrT6m-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241221/202412210918.fR6xrT6m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210918.fR6xrT6m-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/clk-rpmi.c:172:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] clkid @@     got restricted __le32 [usertype] @@
   drivers/clk/clk-rpmi.c:172:18: sparse:     expected unsigned int [usertype] clkid
   drivers/clk/clk-rpmi.c:172:18: sparse:     got restricted __le32 [usertype]
   drivers/clk/clk-rpmi.c:204:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] clkid @@     got restricted __le32 [usertype] @@
   drivers/clk/clk-rpmi.c:204:18: sparse:     expected unsigned int [usertype] clkid
   drivers/clk/clk-rpmi.c:204:18: sparse:     got restricted __le32 [usertype]
   drivers/clk/clk-rpmi.c:268:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] clkid @@     got restricted __le32 [usertype] @@
   drivers/clk/clk-rpmi.c:268:18: sparse:     expected unsigned int [usertype] clkid
   drivers/clk/clk-rpmi.c:268:18: sparse:     got restricted __le32 [usertype]
   drivers/clk/clk-rpmi.c:316:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] clkid @@     got restricted __le32 [usertype] @@
   drivers/clk/clk-rpmi.c:316:18: sparse:     expected unsigned int [usertype] clkid
   drivers/clk/clk-rpmi.c:316:18: sparse:     got restricted __le32 [usertype]
>> drivers/clk/clk-rpmi.c:317:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] lo @@     got restricted __le32 [usertype] @@
   drivers/clk/clk-rpmi.c:317:15: sparse:     expected unsigned int [usertype] lo
   drivers/clk/clk-rpmi.c:317:15: sparse:     got restricted __le32 [usertype]
>> drivers/clk/clk-rpmi.c:318:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] hi @@     got restricted __le32 [usertype] @@
   drivers/clk/clk-rpmi.c:318:15: sparse:     expected unsigned int [usertype] hi
   drivers/clk/clk-rpmi.c:318:15: sparse:     got restricted __le32 [usertype]
>> drivers/clk/clk-rpmi.c:340:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] config @@     got restricted __le32 [usertype] @@
   drivers/clk/clk-rpmi.c:340:19: sparse:     expected unsigned int [usertype] config
   drivers/clk/clk-rpmi.c:340:19: sparse:     got restricted __le32 [usertype]
   drivers/clk/clk-rpmi.c:341:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] clkid @@     got restricted __le32 [usertype] @@
   drivers/clk/clk-rpmi.c:341:18: sparse:     expected unsigned int [usertype] clkid
   drivers/clk/clk-rpmi.c:341:18: sparse:     got restricted __le32 [usertype]
   drivers/clk/clk-rpmi.c:363:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] config @@     got restricted __le32 [usertype] @@
   drivers/clk/clk-rpmi.c:363:19: sparse:     expected unsigned int [usertype] config
   drivers/clk/clk-rpmi.c:363:19: sparse:     got restricted __le32 [usertype]
   drivers/clk/clk-rpmi.c:364:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] clkid @@     got restricted __le32 [usertype] @@
   drivers/clk/clk-rpmi.c:364:18: sparse:     expected unsigned int [usertype] clkid
   drivers/clk/clk-rpmi.c:364:18: sparse:     got restricted __le32 [usertype]

vim +172 drivers/clk/clk-rpmi.c

   157	
   158	/**
   159	 * Get the RPMI Clock Attributes.
   160	 * These attributes belong to a particular clock(clkid)
   161	 * which are different from the MPXY channel attributes.
   162	 */
   163	static int rpmi_clk_get_attrs(u32 clkid, struct rpmi_clk *rpmi_clk)
   164	{
   165		struct rpmi_clk_context *context = rpmi_clk->context;
   166		struct rpmi_mbox_message msg;
   167		struct rpmi_get_attrs_tx tx;
   168		struct rpmi_get_attrs_rx rx;
   169		u8 format;
   170		int ret;
   171	
 > 172		tx.clkid = cpu_to_le32(clkid);
   173		rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_ATTRIBUTES,
   174						  &tx, sizeof(tx), &rx, sizeof(rx));
   175		ret = rpmi_mbox_send_message(context->chan, &msg);
   176		if (ret)
   177			return ret;
   178		if (rx.status)
   179			return rpmi_to_linux_error(rx.status);
   180	
   181		rpmi_clk->id = clkid;
   182		rpmi_clk->num_rates = rx.num_rates;
   183		rpmi_clk->transition_latency = rx.transition_latency;
   184		strscpy(rpmi_clk->name, rx.name, RPMI_CLK_NAME_LEN);
   185	
   186		format = rx.flags & 1U;
   187		if (format >= RPMI_CLK_TYPE_MAX_IDX)
   188			return -EINVAL;
   189	
   190		rpmi_clk->type = format;
   191	
   192		return 0;
   193	}
   194	
   195	static int rpmi_clk_get_supported_rates(u32 clkid, struct rpmi_clk *rpmi_clk)
   196	{
   197		struct rpmi_clk_context *context = rpmi_clk->context;
   198		struct rpmi_get_supp_rates_tx tx;
   199		struct rpmi_get_supp_rates_rx rx;
   200		struct rpmi_mbox_message msg;
   201		size_t clk_rate_idx = 0;
   202		int ret, rateidx, j;
   203	
   204		tx.clkid = cpu_to_le32(clkid);
   205		tx.clk_rate_idx = 0;
   206	
   207		rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_SUPPORTED_RATES,
   208						  &tx, sizeof(tx), &rx, sizeof(rx));
   209		ret = rpmi_mbox_send_message(context->chan, &msg);
   210		if (ret)
   211			return ret;
   212		if (rx.status)
   213			return rpmi_to_linux_error(rx.status);
   214		if (!rx.returned)
   215			return -EINVAL;
   216	
   217		if (rpmi_clk->type == RPMI_CLK_DISCRETE) {
   218			for (rateidx = 0; rateidx < rx.returned; rateidx++) {
   219				rpmi_clk->rates->discrete[rateidx] =
   220						GET_RATE_U64(rx.rates.discrete[rateidx].hi,
   221							     rx.rates.discrete[rateidx].lo);
   222			}
   223	
   224			while (rx.remaining) {
   225				clk_rate_idx += rx.returned;
   226				tx.clk_rate_idx = clk_rate_idx;
   227	
   228				rpmi_mbox_init_send_with_response(&msg,
   229								  RPMI_CLK_SRV_GET_SUPPORTED_RATES,
   230								  &tx, sizeof(tx), &rx, sizeof(rx));
   231				ret = rpmi_mbox_send_message(context->chan, &msg);
   232				if (ret)
   233					return ret;
   234	
   235				for (j = 0; j < rx.returned; j++) {
   236					if (rateidx >= (clk_rate_idx + rx.returned))
   237						break;
   238					rpmi_clk->rates->discrete[rateidx++] =
   239						GET_RATE_U64(rx.rates.discrete[j].hi,
   240							     rx.rates.discrete[j].lo);
   241				}
   242			}
   243		} else if (rpmi_clk->type == RPMI_CLK_LINEAR) {
   244			rpmi_clk->rates->linear.min =
   245					GET_RATE_U64(rx.rates.linear.min_hi,
   246						     rx.rates.linear.min_lo);
   247			rpmi_clk->rates->linear.max =
   248					GET_RATE_U64(rx.rates.linear.max_hi,
   249						     rx.rates.linear.max_lo);
   250			rpmi_clk->rates->linear.step =
   251					GET_RATE_U64(rx.rates.linear.step_hi,
   252						     rx.rates.linear.step_lo);
   253		}
   254	
   255		return 0;
   256	}
   257	
   258	static unsigned long rpmi_clk_recalc_rate(struct clk_hw *hw,
   259						  unsigned long parent_rate)
   260	{
   261		struct rpmi_clk *rpmi_clk = to_rpmi_clk(hw);
   262		struct rpmi_clk_context *context = rpmi_clk->context;
   263		struct rpmi_mbox_message msg;
   264		struct rpmi_get_rate_tx tx;
   265		struct rpmi_get_rate_rx rx;
   266		int ret;
   267	
   268		tx.clkid = cpu_to_le32(rpmi_clk->id);
   269	
   270		rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_RATE,
   271						  &tx, sizeof(tx), &rx, sizeof(rx));
   272		ret = rpmi_mbox_send_message(context->chan, &msg);
   273		if (ret)
   274			return ret;
   275		if (rx.status)
   276			return rx.status;
   277	
   278		return GET_RATE_U64(rx.hi, rx.lo);
   279	}
   280	
   281	static long rpmi_clk_round_rate(struct clk_hw *hw,
   282					unsigned long rate,
   283					unsigned long *parent_rate)
   284	{
   285		struct rpmi_clk *rpmi_clk = to_rpmi_clk(hw);
   286		u64 fmin, fmax, ftmp;
   287	
   288		if (rpmi_clk->type == RPMI_CLK_DISCRETE)
   289			return rate;
   290	
   291		fmin = rpmi_clk->rates->linear.min;
   292		fmax = rpmi_clk->rates->linear.max;
   293	
   294		if (rate <= fmin)
   295			return fmin;
   296		else if (rate >=  fmax)
   297			return fmax;
   298	
   299		ftmp = rate - fmin;
   300		ftmp += rpmi_clk->rates->linear.step - 1;
   301		do_div(ftmp, rpmi_clk->rates->linear.step);
   302	
   303		return ftmp * rpmi_clk->rates->linear.step + fmin;
   304	}
   305	
   306	static int rpmi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
   307				     unsigned long parent_rate)
   308	{
   309		struct rpmi_clk *rpmi_clk = to_rpmi_clk(hw);
   310		struct rpmi_clk_context *context = rpmi_clk->context;
   311		struct rpmi_mbox_message msg;
   312		struct rpmi_set_rate_tx tx;
   313		struct rpmi_set_rate_rx rx;
   314		int ret;
   315	
   316		tx.clkid = cpu_to_le32(rpmi_clk->id);
 > 317		tx.lo = cpu_to_le32(GET_RATE_LO_U32(rate));
 > 318		tx.hi = cpu_to_le32(GET_RATE_HI_U32(rate));
   319	
   320		rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_SET_RATE,
   321						  &tx, sizeof(tx), &rx, sizeof(rx));
   322		ret = rpmi_mbox_send_message(context->chan, &msg);
   323		if (ret)
   324			return ret;
   325		if (rx.status)
   326			return rpmi_to_linux_error(rx.status);
   327	
   328		return 0;
   329	}
   330	
   331	static int rpmi_clk_enable(struct clk_hw *hw)
   332	{
   333		struct rpmi_clk *rpmi_clk = to_rpmi_clk(hw);
   334		struct rpmi_clk_context *context = rpmi_clk->context;
   335		struct rpmi_mbox_message msg;
   336		struct rpmi_set_config_tx tx;
   337		struct rpmi_set_config_rx rx;
   338		int ret;
   339	
 > 340		tx.config = cpu_to_le32(RPMI_CLK_ENABLE);
   341		tx.clkid = cpu_to_le32(rpmi_clk->id);
   342	
   343		rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_SET_CONFIG,
   344						  &tx, sizeof(tx), &rx, sizeof(rx));
   345		ret = rpmi_mbox_send_message(context->chan, &msg);
   346		if (ret)
   347			return ret;
   348		if (rx.status)
   349			return rpmi_to_linux_error(rx.status);
   350	
   351		return 0;
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

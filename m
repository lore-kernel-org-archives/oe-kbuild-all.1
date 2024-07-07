Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC20817C6D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 10:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720349213; cv=none; b=q2hYh9T9zlLXmMqLEu3UiFU3uCZ6CJGwq/9YV8SBG70xNk4mCGB02uQALusmeZeFsiRuiZp0BC6pK+z4w1+Hy3rwN+Io2/P+uKXXbz20ZLb72Sw1AC/oMpIeSKmlbNWsqfRB5Jh2QVE/kkG0YRf7e4kxCP71ZsT5HnOErhSvSjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720349213; c=relaxed/simple;
	bh=lI3/KfnioEuh5+ylCPr3j/RxylNpDbodDucYeSXM8Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kQnyI4NnqidxS0OSzCZEQ3TC63swvMXjqeYeKP6DebCl8v9nFTkjFUd8AA70AQXd4vXfbDEzpAb5OEN2aNlP0o1w4zD70iyvvbPHJXqL8ExjVtchwafq8wC9hDspdjH0V5BjMQ/RNyUiuI6DL+slctixFxRFVIR3bJTlflXaElw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JpDs86De; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JpDs86De"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720349211; x=1751885211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lI3/KfnioEuh5+ylCPr3j/RxylNpDbodDucYeSXM8Rw=;
  b=JpDs86DeTSGDO//pDOQ77ol3vq/mxVF5I2UM8P5rzi+NnCnQHvxHmm6Y
   WEO/y/bjCh99OV8Ba5iUbykqbmeIA2BdcygfkQdCzBB/H3CtiHkH28BHf
   NyP5egnhCTtn7eRDuuBWD2F3z5M4ROM5hoEN1BDB9Ebvon5T7zaV3biGX
   o4k9oSexeuVG5GF3LGaAWJSvn1WKvYJNAsTFOetPAjKaJKGMb3EoPX8dp
   ZQrF/mLz4M4DnqE1++620GD6OP16kXBKRFvv3U10ufv+OTIP+F3vr6tL0
   t9AKXZt2IRZKg6k4yteF9TGi3+EZLpajtMhAuO+gsHP4NAolpNc/4OEeo
   Q==;
X-CSE-ConnectionGUID: NjYxp6a0TXKx/IMvtpX3mA==
X-CSE-MsgGUID: pMvb0BE+Tk2/Z2eX8tbORw==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="21332431"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="21332431"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 03:46:49 -0700
X-CSE-ConnectionGUID: XNN6K6wDRrKoPfzASYsCsg==
X-CSE-MsgGUID: bh69zq9mStOf+2YnLKjdKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="70445009"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jul 2024 03:46:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQPPp-000UrQ-02;
	Sun, 07 Jul 2024 10:46:45 +0000
Date: Sun, 7 Jul 2024 18:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Nagalla <hnagalla@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 25/42]
 drivers/remoteproc/ti_k3_dsp_remoteproc.c:101: warning: Function parameter
 or member 'shut_comp' not described in 'k3_dsp_rproc'
Message-ID: <202407071834.cVQqBwiP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   fb89cd4d622ce6cc1b7b254ae21298570d437a08
commit: ad1343ca42653d9262860d721cd5186bb456a133 [25/42] remoteproc: k3-dsp: support for graceful shutdown of remote cores
config: arm64-randconfig-001-20240707 (https://download.01.org/0day-ci/archive/20240707/202407071834.cVQqBwiP-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071834.cVQqBwiP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407071834.cVQqBwiP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/ti_k3_dsp_remoteproc.c:101: warning: Function parameter or member 'shut_comp' not described in 'k3_dsp_rproc'
   drivers/remoteproc/ti_k3_dsp_remoteproc.c:111: warning: Function parameter or member 'core' not described in 'is_core_in_wfi'
   drivers/remoteproc/ti_k3_dsp_remoteproc.c:111: warning: Excess function parameter 'kproc' description in 'is_core_in_wfi'


vim +101 drivers/remoteproc/ti_k3_dsp_remoteproc.c

6edbe024ba1777 Suman Anna   2020-07-21   69  
6edbe024ba1777 Suman Anna   2020-07-21   70  /**
6edbe024ba1777 Suman Anna   2020-07-21   71   * struct k3_dsp_rproc - k3 DSP remote processor driver structure
6edbe024ba1777 Suman Anna   2020-07-21   72   * @dev: cached device pointer
6edbe024ba1777 Suman Anna   2020-07-21   73   * @rproc: remoteproc device handle
6edbe024ba1777 Suman Anna   2020-07-21   74   * @mem: internal memory regions data
6edbe024ba1777 Suman Anna   2020-07-21   75   * @num_mems: number of internal memory regions
6edbe024ba1777 Suman Anna   2020-07-21   76   * @rmem: reserved memory regions data
6edbe024ba1777 Suman Anna   2020-07-21   77   * @num_rmems: number of reserved memory regions
6edbe024ba1777 Suman Anna   2020-07-21   78   * @reset: reset control handle
6edbe024ba1777 Suman Anna   2020-07-21   79   * @data: pointer to DSP-specific device data
6edbe024ba1777 Suman Anna   2020-07-21   80   * @tsp: TI-SCI processor control handle
6edbe024ba1777 Suman Anna   2020-07-21   81   * @ti_sci: TI-SCI handle
6edbe024ba1777 Suman Anna   2020-07-21   82   * @ti_sci_id: TI-SCI device identifier
6edbe024ba1777 Suman Anna   2020-07-21   83   * @mbox: mailbox channel handle
6edbe024ba1777 Suman Anna   2020-07-21   84   * @client: mailbox client to request the mailbox channel
6edbe024ba1777 Suman Anna   2020-07-21   85   */
6edbe024ba1777 Suman Anna   2020-07-21   86  struct k3_dsp_rproc {
6edbe024ba1777 Suman Anna   2020-07-21   87  	struct device *dev;
6edbe024ba1777 Suman Anna   2020-07-21   88  	struct rproc *rproc;
6edbe024ba1777 Suman Anna   2020-07-21   89  	struct k3_dsp_mem *mem;
6edbe024ba1777 Suman Anna   2020-07-21   90  	int num_mems;
6edbe024ba1777 Suman Anna   2020-07-21   91  	struct k3_dsp_mem *rmem;
6edbe024ba1777 Suman Anna   2020-07-21   92  	int num_rmems;
6edbe024ba1777 Suman Anna   2020-07-21   93  	struct reset_control *reset;
6edbe024ba1777 Suman Anna   2020-07-21   94  	const struct k3_dsp_dev_data *data;
6edbe024ba1777 Suman Anna   2020-07-21   95  	struct ti_sci_proc *tsp;
6edbe024ba1777 Suman Anna   2020-07-21   96  	const struct ti_sci_handle *ti_sci;
6edbe024ba1777 Suman Anna   2020-07-21   97  	u32 ti_sci_id;
6edbe024ba1777 Suman Anna   2020-07-21   98  	struct mbox_chan *mbox;
6edbe024ba1777 Suman Anna   2020-07-21   99  	struct mbox_client client;
ad1343ca42653d Hari Nagalla 2024-07-02  100  	struct completion shut_comp;
6edbe024ba1777 Suman Anna   2020-07-21 @101  };
6edbe024ba1777 Suman Anna   2020-07-21  102  

:::::: The code at line 101 was first introduced by commit
:::::: 6edbe024ba17777b065e0d0b8aeca9789a4d880b remoteproc: k3-dsp: Add a remoteproc driver of K3 C66x DSPs

:::::: TO: Suman Anna <s-anna@ti.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

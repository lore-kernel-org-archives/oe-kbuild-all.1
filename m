Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15902E3389
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 13:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958265; cv=none; b=Wlm5KSkbCW68ZFdLw7Lf7XCR7EUXLRgR2jXK0ow7547IeeNLy6ADbiD7osMdxQ8MQC6N/HC2PTshbeh11Wvbz/dWE00hBpQnV/aJ9FARyGZMAV+Nx/pXREmf+EUDAaxNP6Z07aY5n7pnwYiaT2WY8R7IC9tiClSDjT0g/os4BMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958265; c=relaxed/simple;
	bh=Zv9OhPd6zNOopFvmKCeoKlbt23nf02IeHIyeJQxI/cM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PfrbEj9uSBn2gluGz2+ldB4077tkM/mdQfLMZretZTWdkIrGU2BgUwC0f9sP2CYM1oeoNDV12C5HkjVgiNfCpXhUT6H7tVBEZqFEsvoWtaDmHTsvBpHpFNYNpOfDhWxcOnTIzDVDc+2nm3IK7s9iLyhehBxsPFEKc5q3p/JX1Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hm38SoMN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hm38SoMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741958264; x=1773494264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zv9OhPd6zNOopFvmKCeoKlbt23nf02IeHIyeJQxI/cM=;
  b=Hm38SoMNlPdqH4mOqapJcKItYLADKkjesJMEo5q07657EVTd1N1LLgfi
   cnpBEHEH17ix8WwXQzAI3AVedL3/Hy2m2Z6K+v+5kD44qT7M7xW8tjKYj
   7wJufGkwwq68JiWSFA/RMzaPNp8qDowclT+UMvoJiQS6py06LqqeMGHey
   7tZIQwAPfm9NBQymsecsK6xkzVxZALnZDt07DQYiriYVAhLiVmk/25Wgm
   2Moz5c9b5FcGvr7lYLODYe7I8DUtZBwECCAnCyCx17lZGvwtn3U2neRV+
   xevqW2AJ0MS5urCVxrjkDCKzrzCsuZKNYIcZHnQrCzcB2BD2OXldwKxqG
   Q==;
X-CSE-ConnectionGUID: lfeO9rPQS5CMWdYRplASpg==
X-CSE-MsgGUID: 1O+jbdj+QeaFFVS/fhqqIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="47005042"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="47005042"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 06:17:37 -0700
X-CSE-ConnectionGUID: EW8cUTz8R9OgVg2kT9+DmQ==
X-CSE-MsgGUID: P7DMvKCkQsehtUX5oCwZTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121994939"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 14 Mar 2025 06:17:35 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt4uq-000ATl-2J;
	Fri, 14 Mar 2025 13:17:32 +0000
Date: Fri, 14 Mar 2025 21:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 10933/11207]
 drivers/remoteproc/imx_dsp_rproc.c:129: warning: Function parameter or
 struct member 'run_stall' not described in 'imx_dsp_rproc'
Message-ID: <202503142125.IE33sCto-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da920b7df701770e006928053672147075587fb2
commit: 0184b4fdbad1eafbdab385af8ce8a0e68af88dbb [10933/11207] imx_dsp_rproc: Use reset controller API to control the DSP
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250314/202503142125.IE33sCto-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503142125.IE33sCto-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503142125.IE33sCto-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/imx_dsp_rproc.c:129: warning: Function parameter or struct member 'run_stall' not described in 'imx_dsp_rproc'


vim +129 drivers/remoteproc/imx_dsp_rproc.c

ec0e5549f3586d2 Shengjiu Wang 2021-10-11   95  
ec0e5549f3586d2 Shengjiu Wang 2021-10-11   96  /**
ec0e5549f3586d2 Shengjiu Wang 2021-10-11   97   * struct imx_dsp_rproc - DSP remote processor state
ec0e5549f3586d2 Shengjiu Wang 2021-10-11   98   * @regmap: regmap handler
ec0e5549f3586d2 Shengjiu Wang 2021-10-11   99   * @rproc: rproc handler
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  100   * @dsp_dcfg: device configuration pointer
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  101   * @clks: clocks needed by this device
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  102   * @cl: mailbox client to request the mailbox channel
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  103   * @cl_rxdb: mailbox client to request the mailbox channel for doorbell
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  104   * @tx_ch: mailbox tx channel handle
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  105   * @rx_ch: mailbox rx channel handle
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  106   * @rxdb_ch: mailbox rx doorbell channel handle
ccd946889a37543 Ulf Hansson   2024-01-30  107   * @pd_list: power domain list
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  108   * @ipc_handle: System Control Unit ipc handle
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  109   * @rproc_work: work for processing virtio interrupts
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  110   * @pm_comp: completion primitive to sync for suspend response
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  111   * @flags: control flags
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  112   */
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  113  struct imx_dsp_rproc {
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  114  	struct regmap				*regmap;
0184b4fdbad1eaf Daniel Baluta 2025-03-11  115  	struct reset_control			*run_stall;
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  116  	struct rproc				*rproc;
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  117  	const struct imx_dsp_rproc_dcfg		*dsp_dcfg;
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  118  	struct clk_bulk_data			clks[DSP_RPROC_CLK_MAX];
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  119  	struct mbox_client			cl;
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  120  	struct mbox_client			cl_rxdb;
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  121  	struct mbox_chan			*tx_ch;
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  122  	struct mbox_chan			*rx_ch;
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  123  	struct mbox_chan			*rxdb_ch;
ccd946889a37543 Ulf Hansson   2024-01-30  124  	struct dev_pm_domain_list		*pd_list;
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  125  	struct imx_sc_ipc			*ipc_handle;
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  126  	struct work_struct			rproc_work;
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  127  	struct completion			pm_comp;
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  128  	u32					flags;
ec0e5549f3586d2 Shengjiu Wang 2021-10-11 @129  };
ec0e5549f3586d2 Shengjiu Wang 2021-10-11  130  

:::::: The code at line 129 was first introduced by commit
:::::: ec0e5549f3586d2cb99a05edd006d722ebad912c remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX

:::::: TO: Shengjiu Wang <shengjiu.wang@nxp.com>
:::::: CC: Mathieu Poirier <mathieu.poirier@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

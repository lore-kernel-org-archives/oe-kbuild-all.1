Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD8A288D5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 17:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjuujbM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704390492; x=1735926492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Amfzu4mgPjNkQwiwrhDfEPGa8vjJGCFpAorbiJi9Pv0=;
  b=WjuujbM79/Ss7rNuLTH3kClz5N+tJKY0SybIkF0EIgzy16YYDlAR5PBP
   Ej+KP0Pg0FmNuEER8i0w+ZecyjjPm81srneHcvEZAB2bu8Xj185LDmRNr
   eMVU0o7fK1Sm0GlSKE62A7s/nsOu2vN8BYo+4n5fuXmWsFT5EOcrWOh0A
   zjEd9Hb3EGQnUQvbCMkHgX9T2N8cXeBYTygRKNQ5f2sxCzNvJkOgqNaoO
   1R4UZfAC0UwiVmzLDXNDCnEKS1bifLkAycNlDty8lGEt5sA5TQ45/6ak5
   vEm+QvHmJhnZEhsydJtzP9mjYDi7NdwGwXBf0q8gA1rhmD63wwaBhx7iq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="461617271"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="461617271"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 09:48:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="953689313"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="953689313"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Jan 2024 09:48:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLRpA-0000I8-1E;
	Thu, 04 Jan 2024 17:48:08 +0000
Date: Fri, 5 Jan 2024 01:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Abel Vesa <abel.vesa@linaro.org>
Subject: [krzk-github:n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
 16454/16521] drivers/mailbox/qcom-cpucp-mbox.c:46: warning: Function
 parameter or struct member 'num_chan' not described in 'qcom_cpucp_mbox'
Message-ID: <202401050127.VJWSI3Dy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
head:   a793d03eceb5f77a083fbe3513016239b281fb0c
commit: 391f455feb268821a2dadc021a1438208cbd382d [16454/16521] mailbox: Add support for QTI CPUCP mailbox controller
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240105/202401050127.VJWSI3Dy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401050127.VJWSI3Dy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401050127.VJWSI3Dy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/qcom-cpucp-mbox.c:46: warning: Function parameter or struct member 'num_chan' not described in 'qcom_cpucp_mbox'


vim +46 drivers/mailbox/qcom-cpucp-mbox.c

    28	
    29	/**
    30	 * struct qcom_cpucp_mbox - Holder for the mailbox driver
    31	 * @chans:			The mailbox channel
    32	 * @mbox:			The mailbox controller
    33	 * @tx_base:			Base address of the CPUCP tx registers
    34	 * @rx_base:			Base address of the CPUCP xx registers
    35	 * @dev:			Device associated with this instance
    36	 * @irq:			CPUCP to AP irq
    37	 */
    38	struct qcom_cpucp_mbox {
    39		struct mbox_chan chans[APSS_CPUCP_IPC_CHAN_SUPPORTED];
    40		struct mbox_controller mbox;
    41		void __iomem *tx_base;
    42		void __iomem *rx_base;
    43		struct device *dev;
    44		int irq;
    45		int num_chan;
  > 46	};
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

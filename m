Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47A22C6A1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 20:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Foy1G/wr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704400639; x=1735936639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DZ9N3vgjmVb6VD3EBHQiZyTs+rbq5hvnx33VnaWjEfc=;
  b=Foy1G/wrew97gI9KmxmfpYWVQp53PqQ4Rpvd/GNPCNf4lxDTLsAUb4U9
   GBOsot54TmTTw8iFt1z/N3tcJuVGlsoyqnvIKCCbYKpnaW+8HqMNGlvvo
   y7C8R7mz/MOG/RuyqCl37ZdVkLKOeQsI5E4PvuByoRxdMNYYUCYEiDPIC
   RcK8BcIQFTiK9cr7C/rgxzmQzIDhTIiPGs966c9zlGMoTfBl4Yj+My1/F
   NKZryTTDCZu0IDFsilOEemUSTEZ4RmoSVTzG7MvynjsygJtKcwL1yywlR
   6HlFjE79Fbxkij7c+ENFxEJeDsZ5ZhBO79lXtIGIFQ57cboF7tSJEAli+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4465728"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="4465728"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 12:37:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="22618048"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jan 2024 12:37:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLUSo-0000Ox-38;
	Thu, 04 Jan 2024 20:37:14 +0000
Date: Fri, 5 Jan 2024 04:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Abel Vesa <abel.vesa@linaro.org>
Subject: [krzk-github:n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
 16454/16521] drivers/mailbox/qcom-cpucp-mbox.c:55:18: error: implicit
 declaration of function 'readq'; did you mean 'readl'?
Message-ID: <202401050446.ManicaWd-lkp@intel.com>
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
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240105/202401050446.ManicaWd-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401050446.ManicaWd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401050446.ManicaWd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mailbox/qcom-cpucp-mbox.c: In function 'qcom_cpucp_mbox_irq_fn':
>> drivers/mailbox/qcom-cpucp-mbox.c:55:18: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
      55 |         status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
         |                  ^~~~~
         |                  readl
>> drivers/mailbox/qcom-cpucp-mbox.c:62:25: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
      62 |                         writeq(status, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
         |                         ^~~~~~
         |                         writel
   cc1: some warnings being treated as errors


vim +55 drivers/mailbox/qcom-cpucp-mbox.c

    47	
    48	static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
    49	{
    50		struct qcom_cpucp_mbox *cpucp = data;
    51		u64 status;
    52		u32 val;
    53		int i;
    54	
  > 55		status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
    56	
    57		for (i = 0; i < cpucp->num_chan; i++) {
    58			val = 0;
    59			if (status & ((u64)1 << i)) {
    60				val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD + (i * 8) + APSS_CPUCP_MBOX_CMD_OFF);
    61				mbox_chan_received_data(&cpucp->chans[i], &val);
  > 62				writeq(status, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
    63			}
    64		}
    65	
    66		return IRQ_HANDLED;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

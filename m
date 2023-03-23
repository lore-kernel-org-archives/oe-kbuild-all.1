Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D616F8F4A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 20:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679604046; x=1711140046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HpCplmt4T5FQc4+S+61dFD2N7LX3G8/Et4ePIc4DYnc=;
  b=dkeCmPNnyKvGI0NGjnQGkDZ1nWjyS3d/08U9H6jFmjZi4xHLWHDPSGT5
   kJZUys7pykyH7wxu5fikP1NEKIoi4GuDygmuf0Z8BfUJYj2W428F2RYpJ
   +fKbRqXtiKAJX5QO93BqnB7KXO6K+6c0W2oSH89ajJjWxmWA3WlUtiWFv
   xvBU5uepQq58wH23M4O5QSGSI4ZvYfKfvq+3r3EkXQZA1KfV3p0yowDGS
   wjfgms2CfzkB66vi4DpLUIPf8QHLeh+F69gwodcSqribFhMPGonMXGg0X
   xJqPRvub2JL89hDh8Chp1pqCHl1ybj7VCZ+XUD/YrM+gsK5LREyzDioyi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404529567"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="404529567"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 13:37:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="806412450"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="806412450"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Mar 2023 13:37:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfRgs-000EgW-0D;
	Thu, 23 Mar 2023 20:37:42 +0000
Date: Fri, 24 Mar 2023 04:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Houlong Wei <houlong.wei@mediatek.com>,
	HS Liao <hs.liao@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	Ting Shen <phoenixshen@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 2701/9999]
 drivers/mailbox/mtk-cmdq-mailbox.c:83:9: sparse: sparse: cast removes
 address space '<asn:2>' of expression
Message-ID: <202303240458.5TJlzUSe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: ee72897d85812a81f1e964d1fbe431b29867d815 [2701/9999] FROMGIT: mailbox: mediatek: Add Mediatek CMDQ driver
config: m68k-randconfig-s043-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240458.5TJlzUSe-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/ee72897d85812a81f1e964d1fbe431b29867d815
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout ee72897d85812a81f1e964d1fbe431b29867d815
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash drivers/devfreq/event/ drivers/mailbox/ fs/ net/bluetooth/ sound/core/ sound/pci/hda/ sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240458.5TJlzUSe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mailbox/mtk-cmdq-mailbox.c:83:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:86:15: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:89:13: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:89:13: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:101:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:107:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:115:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:116:13: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:116:13: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:130:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:136:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:136:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:187:16: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:196:13: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:196:13: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:224:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:235:20: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:236:9: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:244:15: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:254:19: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:287:22: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:376:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:377:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:379:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:380:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:381:17: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:384:27: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:385:26: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:398:33: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:410:33: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mailbox/mtk-cmdq-mailbox.c:417:17: sparse: sparse: cast removes address space '<asn:2>' of expression

vim +83 drivers/mailbox/mtk-cmdq-mailbox.c

    78	
    79	static int cmdq_thread_suspend(struct cmdq *cmdq, struct cmdq_thread *thread)
    80	{
    81		u32 status;
    82	
  > 83		writel(CMDQ_THR_SUSPEND, thread->base + CMDQ_THR_SUSPEND_TASK);
    84	
    85		/* If already disabled, treat as suspended successful. */
    86		if (!(readl(thread->base + CMDQ_THR_ENABLE_TASK) & CMDQ_THR_ENABLED))
    87			return 0;
    88	
    89		if (readl_poll_timeout_atomic(thread->base + CMDQ_THR_CURR_STATUS,
    90				status, status & CMDQ_THR_STATUS_SUSPENDED, 0, 10)) {
    91			dev_err(cmdq->mbox.dev, "suspend GCE thread 0x%x failed\n",
    92				(u32)(thread->base - cmdq->base));
    93			return -EFAULT;
    94		}
    95	
    96		return 0;
    97	}
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

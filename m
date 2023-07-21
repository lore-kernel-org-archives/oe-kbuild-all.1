Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0607FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 06:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689922010; x=1721458010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VhTenoYowptewe4x/caMgYtNVJPU28S672GSlw8JpgE=;
  b=T9tA1YuOch+S0RDWxAX+8ssxZ0A2H3b56rLFKHsOqQq62FJXtkH/WYhB
   KNmlovbtfDWW6oW7vThVc3x+CFHrWWwtwt/rxFH/NTqN2ajjZFEHXmYsq
   7cQlJywm+yQsuzdJ3YT36PHCNhJfpHVlmUfbGGPaQN0aBW65ocwe+7HgM
   NKOzYIzdBkpCOWM2+eMFT8jSNU0YlR4T5qGB+h7EnePvLhusTGmRmlr0m
   vj23p6QCBloIRR2BZOwa4vDeghNyIhqCFQxShIDsfhIb9dnjvrA1ZE9j8
   LwpL7JZ+lWrqAFcY9bmR+aDQCkLWj4c38vhBy6unqQJmN9FFgdAHz3GG1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="370554038"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="370554038"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 23:46:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="790087194"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="790087194"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jul 2023 23:46:46 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMjuW-0006z7-2X;
	Fri, 21 Jul 2023 06:46:44 +0000
Date: Fri, 21 Jul 2023 14:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
	alexander.stein@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 8/8] firmware: imx: scu-irq: support identifying SCU
 wakeup source from sysfs
Message-ID: <202307211455.rru56Ub2-lkp@intel.com>
References: <20230720094128.536388-9-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720094128.536388-9-peng.fan@oss.nxp.com>

Hi Peng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.5-rc2 next-20230721]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/firmware-imx-scu-change-init-level-to-subsys_initcall_sync/20230720-174508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20230720094128.536388-9-peng.fan%40oss.nxp.com
patch subject: [PATCH 8/8] firmware: imx: scu-irq: support identifying SCU wakeup source from sysfs
config: arm64-randconfig-r003-20230720 (https://download.01.org/0day-ci/archive/20230721/202307211455.rru56Ub2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307211455.rru56Ub2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307211455.rru56Ub2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/imx/imx-scu-irq.c: In function 'wakeup_source_show':
>> drivers/firmware/imx/imx-scu-irq.c:179:16: warning: variable 'size' set but not used [-Wunused-but-set-variable]
     179 |         int i, size;
         |                ^~~~


vim +/size +179 drivers/firmware/imx/imx-scu-irq.c

   175	
   176	static ssize_t wakeup_source_show(struct kobject *kobj,
   177						struct kobj_attribute *attr, char *buf)
   178	{
 > 179		int i, size;
   180	
   181		for (i = 0; i < IMX_SC_IRQ_NUM_GROUP; i++) {
   182			if (!scu_irq_wakeup[i].wakeup_src)
   183				continue;
   184	
   185			if (scu_irq_wakeup[i].valid)
   186				size = sprintf(buf, "Wakeup source group = %d, irq = 0x%x\n",
   187					       i, scu_irq_wakeup[i].wakeup_src);
   188			else
   189				size = sprintf(buf, "Spurious SCU wakeup, group = %d, irq = 0x%x\n",
   190					       i, scu_irq_wakeup[i].wakeup_src);
   191		}
   192	
   193		return strlen(buf);
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

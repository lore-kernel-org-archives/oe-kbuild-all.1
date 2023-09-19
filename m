Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7923B784
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695135383; x=1726671383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LHrlqSonm9QimiEHisXj0ptWKJJKWXogrkTeKut83LM=;
  b=KFH34D9p5Ge0eUoL8sGY4Hzu83dTJjMkoOSKuRuhOPhin5XS/B3MQAZ7
   zxsTvw0DvEohRj+YKDNlBEFgda7Cp6ZlNFeGJG+6pFrG/F2u4YG9msmBm
   JMhI10oqA2+zXwrCwoVo2vG/E91wdx1ASW2kM4XC74sv0ragMi9FpQ1hS
   4uGMOhJCN1VsLgs3HTheZotumlX51xNR1Jl5eaScwmkIVVLXTHJj/mkoc
   AQuRXpnzbelCAUsBnwD3BldYp/k5EBfcX90Mei6skmisbKubBjSL+gV99
   Qk89XtyGhqPCX1xWJKOB9qFLkm0mVA3hhcb7+juoxkh2/ddLnI8mbBm7P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="377274447"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="377274447"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 07:56:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781328849"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="781328849"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Sep 2023 07:56:20 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qic9C-0007US-0c;
	Tue, 19 Sep 2023 14:56:18 +0000
Date: Tue, 19 Sep 2023 22:55:23 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-unionfs@vger.kernel.org
Subject: [mszeredi-vfs:statmount 2/3] namespace.c:undefined reference to
 `show_path'
Message-ID: <202309192237.5R2xaVOm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git statmount
head:   519d04c265dadbaf8c742e3af3141b7caf673412
commit: 6ece52ce99c69f998a436fbd735a0dafe1391eeb [2/3] add statmount(2) syscall
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230919/202309192237.5R2xaVOm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192237.5R2xaVOm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309192237.5R2xaVOm-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/namespace.o: in function `stmt_mnt_root':
>> namespace.c:(.text+0x7db): undefined reference to `show_path'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

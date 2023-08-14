Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0168CA4B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 19:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692042238; x=1723578238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U6umYAs3BltW9Dy36IIUG45Yt7VPx2Fr/kEbW2VPk78=;
  b=ETlwzVW4fJOSEBjguN4HmOmRP/IuR7rLPpeGH3t8Y1pPEbjR95cAw090
   ZLJE+nbWzQV/cvYtc4uSqfYohYc43YGbVnLlClYmWDaJSnUTHKDL0xTgW
   SM7gy0a7k7KQgz4/tOF18xsIx+mQvzWBK86jXTTgDBI7dkeLewUWoQ0eo
   OAAlcoFtOVIx1JGavTRY0WorRfIpJXYK6oChr60cxsWcjgCF5g02j/b1W
   POS/NZicqSPLTToXVCtRWZ78erKNytCM/WbAj89XoTIqpsvFYTcJbmd+n
   WA0DrR3dU5x2Zn58nHxzy6Zz8hHw1ufERftE1r7JMg26/OvpbAVL/ohlQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="369597716"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="369597716"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 12:43:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="798928650"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="798928650"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Aug 2023 12:43:52 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVdTk-0000NJ-0v;
	Mon, 14 Aug 2023 19:43:52 +0000
Date: Tue, 15 Aug 2023 03:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Huisong Li <lihuisong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Wei Xu <xuwei5@hisilicon.com>
Subject: [hisilicon-hisi:next/drivers 2/3] kunpeng_hccs.c:undefined reference
 to `mbox_send_message'
Message-ID: <202308150322.KsFx4iAm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/hisilicon/linux-hisi next/drivers
head:   b51022b416f5be113cd5345a2cab287d78e6b74c
commit: 47f7a25533cea268e663be7b84fef933e40692c4 [2/3] soc: hisilicon: add sysfs entry to query information of HCCS
config: loongarch-randconfig-r023-20230815 (https://download.01.org/0day-ci/archive/20230815/202308150322.KsFx4iAm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150322.KsFx4iAm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150322.KsFx4iAm-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/soc/hisilicon/kunpeng_hccs.o: in function `hccs_pcc_cmd_send':
>> kunpeng_hccs.c:(.text+0x1d0): undefined reference to `mbox_send_message'
>> loongarch64-linux-ld: kunpeng_hccs.c:(.text+0x2c0): undefined reference to `mbox_client_txdone'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

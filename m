Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212A86FBB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 18:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674930408; x=1706466408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KkMIWzlHLM2S1t7xJAAlp5w9TZ/S45eX+DEfjXi28rI=;
  b=D6zOAs+io24SCkYkIuBzakiXqcN7Ro5RM16R1oW74EuN8E+h2IPAXRZ3
   ZW+YFIE2AHK0Xv1dt/E3GmeYEKczcXk+FAMu3EjprAlDQr7ed6IVgTwrx
   ZhL4F3ieaoGY51lnz2mauw6z+4p9T3yqD8hWuQOk/6SPZIgXPdsOibcBz
   WBnFLIyWDzeql7EutFdqlmoMC8QL3YeTFYxFFRUdUi27LeA+65PbtCvY/
   +M1I74zIj50NIGvZbdqfpqZHBriJpRtSyl5M3IPgwiXfy0XL0hT1jrdnN
   AJ/Iyc87QH7maO2yMzSPleeuFLvhAKxi5o4xK/793awszNF6BD9oV9aH0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="306969654"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="306969654"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 10:26:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="992421345"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="992421345"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2023 10:26:46 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLpuX-0000zE-2W;
	Sat, 28 Jan 2023 18:26:45 +0000
Date: Sun, 29 Jan 2023 02:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: Huazhong Tan <tanhuazhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c:127:25: warning:
 'strncpy' specified bound depends on the length of the source argument
Message-ID: <202301290217.W2iKgXb9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Huazhong,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5af6ce7049365952f7f023155234fe091693ead1
commit: 77e9184869c9fb00a482357ea8eef3bd7ae3d45a net: hns3: refactor dump bd info of debugfs
date:   1 year, 9 months ago
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20230129/202301290217.W2iKgXb9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=77e9184869c9fb00a482357ea8eef3bd7ae3d45a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 77e9184869c9fb00a482357ea8eef3bd7ae3d45a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/ethernet/hisilicon/hns3/ fs/nfsd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In function 'hns3_dbg_fill_content',
       inlined from 'hns3_dbg_rx_bd_info' at drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c:358:2:
>> drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c:127:25: warning: 'strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
     127 |                         strncpy(pos, items[i].name, strlen(items[i].name));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'hns3_dbg_fill_content',
       inlined from 'hns3_dbg_rx_bd_info' at drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c:367:3:
   drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c:125:25: warning: 'strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
     125 |                         strncpy(pos, result[i], strlen(result[i]));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'hns3_dbg_fill_content',
       inlined from 'hns3_dbg_tx_bd_info' at drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c:432:2:
>> drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c:127:25: warning: 'strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
     127 |                         strncpy(pos, items[i].name, strlen(items[i].name));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'hns3_dbg_fill_content',
       inlined from 'hns3_dbg_tx_bd_info' at drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c:441:3:
   drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c:125:25: warning: 'strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
     125 |                         strncpy(pos, result[i], strlen(result[i]));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +127 drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c

   114	
   115	static void hns3_dbg_fill_content(char *content, u16 len,
   116					  const struct hns3_dbg_item *items,
   117					  const char **result, u16 size)
   118	{
   119		char *pos = content;
   120		u16 i;
   121	
   122		memset(content, ' ', len);
   123		for (i = 0; i < size; i++) {
   124			if (result)
   125				strncpy(pos, result[i], strlen(result[i]));
   126			else
 > 127				strncpy(pos, items[i].name, strlen(items[i].name));
   128	
   129			pos += strlen(items[i].name) + items[i].interval;
   130		}
   131	
   132		*pos++ = '\n';
   133		*pos++ = '\0';
   134	}
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

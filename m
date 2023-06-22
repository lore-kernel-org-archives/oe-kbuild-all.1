Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD2117E0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 05:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687410151; x=1718946151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OTAXLy75u5X+llynqnAfrlMMmn5bpcvWvwTCRRfwU2s=;
  b=eC1JRXfIkBUnMjDrqTsqClBjkIvXNEHpeg08qPd3Ak90Yr9REL7KirvM
   rk+/vrsQ73ilHaAlE88hbNJTwVxXx3iQgwORkNtpm8jHwHYVskagRhSO7
   e+tAEyAP52UHhGQaZNYfN3mQ+SoQ7hIiMK3Jk/jezp1nkNwRnUIrOwl2f
   ZYTJq8aPZfCjO1gd4TKGz5hVlaQEraLxTGfMRQiJe+ryNIH6R2BBdHC8h
   dYytlBoaXIbpd3cvH3+CP0omRRtQVM66qKW4LYWvz1CzO3+KdBL1KTik7
   YxjI/neQq2DJC2zr2cV4Z07DIuvuGglztvARWWH9nhoeRjwyMos5VZxeT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="339996119"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="339996119"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 22:02:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="888950290"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="888950290"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Jun 2023 22:02:30 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCCSj-0007L5-1X;
	Thu, 22 Jun 2023 05:02:29 +0000
Date: Thu, 22 Jun 2023 13:02:00 +0800
From: kernel test robot <lkp@intel.com>
To: Huazhong Tan <tanhuazhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c:90:25:
 warning: 'strncpy' specified bound depends on the length of the source
 argument
Message-ID: <202306221218.d8gEgeI8-lkp@intel.com>
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
head:   dad9774deaf1cf8e8f7483310dfb2690310193d2
commit: 1556ea9120ffcf4faf7ac6b62a6e28216f260a23 net: hns3: refactor dump mac list of debugfs
date:   2 years, 1 month ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230622/202306221218.d8gEgeI8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221218.d8gEgeI8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306221218.d8gEgeI8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c: In function 'hclge_dbg_fill_content.constprop':
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c:90:25: warning: 'strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
      90 |                         strncpy(pos, items[i].name, strlen(items[i].name));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c:88:25: warning: 'strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
      88 |                         strncpy(pos, result[i], strlen(result[i]));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +90 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c

    77	
    78	static void hclge_dbg_fill_content(char *content, u16 len,
    79					   const struct hclge_dbg_item *items,
    80					   const char **result, u16 size)
    81	{
    82		char *pos = content;
    83		u16 i;
    84	
    85		memset(content, ' ', len);
    86		for (i = 0; i < size; i++) {
    87			if (result)
    88				strncpy(pos, result[i], strlen(result[i]));
    89			else
  > 90				strncpy(pos, items[i].name, strlen(items[i].name));
    91			pos += strlen(items[i].name) + items[i].interval;
    92		}
    93		*pos++ = '\n';
    94		*pos++ = '\0';
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

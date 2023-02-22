Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C571C17
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 05:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677045359; x=1708581359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NlB455V1nbWXJtyJI69HAU0gYPgx+bRXboiMHriICfA=;
  b=l2M+rc5/CcK5PL0a2vEvGROkCGMFN7894rKMoKRZwvAE7koXC9GcVnoh
   ZCldZIYxB8F57Cvc0y+u1QgGkMUa0A1nEhMro6AlFnX6aBIH+Pqs668B7
   LnUS6jWUPrb+4Z1cbARzhQaOEte2v9kznHmS2Q9rRaYIKOywfxB3ewDSC
   5YO33F97AMG4ahTMTEM+T+WoOp4p3YPYgqesoV2dbx04YpmkaqUurMzOm
   rXV8wJTpHbB4RH7ymUig3juxZeaxSXapXL0e8IlDU9sdEJBq1iafVASo7
   h4VkUgzBt6SvAkNtVwNxLXrWGBYfZ0zAmZhlfo262Y9YP7ayID86G7Fax
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="397529906"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="397529906"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 21:55:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814795099"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="814795099"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2023 21:55:57 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUi6e-00002v-2i;
	Wed, 22 Feb 2023 05:55:56 +0000
Date: Wed, 22 Feb 2023 13:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: Huazhong Tan <tanhuazhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c:90:25:
 warning: 'strncpy' specified bound depends on the length of the source
 argument
Message-ID: <202302221354.9qkB7bev-lkp@intel.com>
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
head:   5b7c4cabbb65f5c469464da6c5f614cbd7f730f2
commit: 1556ea9120ffcf4faf7ac6b62a6e28216f260a23 net: hns3: refactor dump mac list of debugfs
date:   1 year, 9 months ago
config: ia64-randconfig-r024-20230222 (https://download.01.org/0day-ci/archive/20230222/202302221354.9qkB7bev-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1556ea9120ffcf4faf7ac6b62a6e28216f260a23
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1556ea9120ffcf4faf7ac6b62a6e28216f260a23
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/net/ethernet/hisilicon/hns3/hns3pf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302221354.9qkB7bev-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/ia64/include/asm/pgtable.h:154,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:33,
                    from include/linux/bvec.h:14,
                    from include/linux/skbuff.h:17,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.h:7,
                    from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c:6:
   arch/ia64/include/asm/mmu_context.h: In function 'reload_context':
   arch/ia64/include/asm/mmu_context.h:127:48: warning: variable 'old_rr4' set but not used [-Wunused-but-set-variable]
     127 |         unsigned long rr0, rr1, rr2, rr3, rr4, old_rr4;
         |                                                ^~~~~~~
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
https://github.com/intel/lkp-tests

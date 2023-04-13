Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1D626
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 16:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681403457; x=1712939457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TtrQ5cBLH1tOZuhzKbYuidF6Hh2gW2nAl2PwTTzqMGU=;
  b=nooXLz10Hv/gmnpy8WVAuFOrJVcGCcemdAMIPpQPUVAuvGB58ewehqUI
   0d608VD2RRCSM6NniKBvnaDHpD2frTWk49T4dRui5HAUszNNbWEsXV2Wt
   qqJJ+j5fOnpxVEyDM/IbsXlUBlKQq0slgSBY5fy1jbo/8Q7yPb8YIYSz9
   bEBuD3cnCs7ECcUvPekW1EhJuBGV7Ym90CGRMwFIrFsuR8IeUYnfHBwBQ
   oAB2PjxzE8cF+bzl5T1+rtumNgqve09IhAx+IgmyIgQUHn4LDGGsbCKhX
   lDDh+nw4wKpQyyFdigh9Yf/B7YXscQC50hX2a52dzLWH8W+wPXtp5De45
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="430520584"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="430520584"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 09:30:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="754073719"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="754073719"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Apr 2023 09:30:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmzqY-000Yon-2g;
	Thu, 13 Apr 2023 16:30:54 +0000
Date: Fri, 14 Apr 2023 00:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 27/36]
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:148:40: warning: variable
 'res' set but not used
Message-ID: <202304140025.JDd41CCB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   44452e4236561f6e36ec587805a52b683e2804c9
commit: ba11d449cc75d38642771c4254d9ac6cca0dab30 [27/36] FROMLIST: mt76: mt7921: fix kernel panic by accessing unallocated eeprom.data
config: arc-randconfig-r043-20230409 (https://download.01.org/0day-ci/archive/20230414/202304140025.JDd41CCB-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout ba11d449cc75d38642771c4254d9ac6cca0dab30
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash M=drivers/net/wireless/mediatek/mt76/mt7921

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140025.JDd41CCB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7921/mcu.c: In function 'mt7921_mcu_parse_eeprom':
>> drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:148:40: warning: variable 'res' set but not used [-Wunused-but-set-variable]
     148 |         struct mt7921_mcu_eeprom_info *res;
         |                                        ^~~


vim +/res +148 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c

da3e3b87f8dd3d4 Sean Wang 2021-01-28  144  
da3e3b87f8dd3d4 Sean Wang 2021-01-28  145  static int
da3e3b87f8dd3d4 Sean Wang 2021-01-28  146  mt7921_mcu_parse_eeprom(struct mt76_dev *dev, struct sk_buff *skb)
da3e3b87f8dd3d4 Sean Wang 2021-01-28  147  {
da3e3b87f8dd3d4 Sean Wang 2021-01-28 @148  	struct mt7921_mcu_eeprom_info *res;
da3e3b87f8dd3d4 Sean Wang 2021-01-28  149  
da3e3b87f8dd3d4 Sean Wang 2021-01-28  150  	if (!skb)
da3e3b87f8dd3d4 Sean Wang 2021-01-28  151  		return -EINVAL;
da3e3b87f8dd3d4 Sean Wang 2021-01-28  152  
da3e3b87f8dd3d4 Sean Wang 2021-01-28  153  	skb_pull(skb, sizeof(struct mt7921_mcu_rxd));
da3e3b87f8dd3d4 Sean Wang 2021-01-28  154  
da3e3b87f8dd3d4 Sean Wang 2021-01-28  155  	res = (struct mt7921_mcu_eeprom_info *)skb->data;
da3e3b87f8dd3d4 Sean Wang 2021-01-28  156  
da3e3b87f8dd3d4 Sean Wang 2021-01-28  157  	return 0;
da3e3b87f8dd3d4 Sean Wang 2021-01-28  158  }
da3e3b87f8dd3d4 Sean Wang 2021-01-28  159  

:::::: The code at line 148 was first introduced by commit
:::::: da3e3b87f8dd3d44e83c7ab744bd1ad6ab9f8468 UPSTREAM: mt76: mt7921: add MCU support

:::::: TO: Sean Wang <sean.wang@mediatek.com>
:::::: CC: Commit Bot <commit-bot@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

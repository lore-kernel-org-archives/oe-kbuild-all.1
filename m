Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FAB33990
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 23:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBJAw4BA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696720906; x=1728256906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yGkg57+9OSRQbVDylYzXeI84jQ+j0uTOCH3Vpr4F7bk=;
  b=bBJAw4BAMMyb6suCScWMydHjJMamJUejZn4K7/Draw3g9mKlDkAgu/Pe
   /2EmJL/5Rbk5X839UdYaWBcUK91lYCNpzFTMYUwZ1B3u7PXS6cDLgUHqo
   2/Ty7tqvW594dyrGWjgrqcuTsROJHPbD3tsqOkR61XfQqbxwXzBlsUk5+
   433bds9uDMBRh7Hnv6TJxhJ7aEE7Gg4/0MKjnOpz3JYaYRBGj8sqrzuEt
   bxy7RXSiHDS2VFOdtTAOpSrQoiXVebO2UQfF+4eXf0X8ZsTAE7BaPAMDj
   D19vpMgsw2CZMtREq6bhXW2nbmZe8W8EYH2aJLjJvjvZGx4o3yCaRS6h7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="364253214"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="364253214"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 16:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="818435441"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="818435441"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Oct 2023 16:21:42 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpGc2-0004uW-2F;
	Sat, 07 Oct 2023 23:21:34 +0000
Date: Sun, 8 Oct 2023 07:21:22 +0800
From: kernel test robot <lkp@intel.com>
To: Avraham Stern <avraham.stern@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1126:5-8: Unneeded
 variable: "ret". Return "  0" on line 1154
Message-ID: <202310080743.rx2s9fDg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b9ddbb0cde2adcedda26045cc58f31316a492215
commit: 057381ddac0593c6e4ca8f58732830d8542b9c4e wifi: iwlwifi: pcie: avoid a warning in case prepare card failed
date:   7 weeks ago
config: x86_64-randconfig-101-20230927 (https://download.01.org/0day-ci/archive/20231008/202310080743.rx2s9fDg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231008/202310080743.rx2s9fDg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310080743.rx2s9fDg-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1126:5-8: Unneeded variable: "ret". Return "  0" on line 1154

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

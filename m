Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F4A1B85EE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 01:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725671190; cv=none; b=NVK2fVcdG0pTeiImoagyKQ1fSgRTJIdiZiy3jZ9Nqs8w4y9+70QabVUagNrp0Fyw+tbFEn+4JI27biDS4VVKVMJRIGKVxe8aC+TU+x5pNyg1hQGf1sk7azS0RmCXc92absHGChjjvJhjkv/hMEugrX/YzBigqNOZom79wYiaq08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725671190; c=relaxed/simple;
	bh=EAztM1eKmKP/AE3NuinWO+M8FoVbtAJFMkWkDXlaK9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K0UlL14KNK+K/KaiadcCAuxGK3GVO/to+Q0x8O+RWr3EwYkFVvE1gox0lY86TdeIV//dlFyR3PZRo4+stZam6XCQmobVJVAxf6GiDEhMratb1Il3LThKXZyUFlzVy+ozoSkZhJQaYcPqVSz3DMLm0Ga6c9o4d0A34Bnn93OZBeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISHrWfmP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISHrWfmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725671188; x=1757207188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EAztM1eKmKP/AE3NuinWO+M8FoVbtAJFMkWkDXlaK9c=;
  b=ISHrWfmPKISbhk3PAJwyK+euNBYIJ8j7ELxSaPzhTQXUQKBaUcdnldGv
   UuRHiYNKY4gcaOoZryh1YieFJRhju6thguLbnOKDAshNai0yNHIHy9F2I
   5RMYqyuweUT+KjFJ1UrurbHGsfX5oKlqEeOu0BED2lvxuOu+ql0gRixi6
   CsZKOab1chC1CakgAXJjHEotRJrB5nr0YT2z6mNxQGIN6kWNOnJP4ySth
   0OeEMH621BZQPRaP26AM6pP3uBDXmhf0z75CB0+SOcCFSpvax/NOlnmMl
   7qe3a3aVcOyfrzw32wxvqOTAkeBYyWKb1hGNkKYsns8QO9Wmj2z2ktP6V
   g==;
X-CSE-ConnectionGUID: /edqbDyURDiPNIIk/y1HBQ==
X-CSE-MsgGUID: U7JpVAfLSXu/mR+XnurtTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35587249"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="35587249"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 18:06:27 -0700
X-CSE-ConnectionGUID: BxFWvV8sTweeHN+SfMf0EQ==
X-CSE-MsgGUID: RhJTf1kfSaCmDu7iRbO4yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="70694318"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Sep 2024 18:06:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smjuC-000C09-0H;
	Sat, 07 Sep 2024 01:06:24 +0000
Date: Sat, 7 Sep 2024 09:06:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 2828/23701]
 drivers/net/wireless/mediatek/mt76/mt76x2_mac_common.c:297:17: sparse:
 sparse: dubious: x & !y
Message-ID: <202409070807.ESq0nR8U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   13b424f97ef548612c760cfd0892f96de96707e0
commit: 9baadf685a5618364776aed92067526bb40c137d [2828/23701] build_bug.h: remove most of dummy BUILD_BUG_ON stubs for Sparse
config: x86_64-randconfig-121-20240906 (https://download.01.org/0day-ci/archive/20240907/202409070807.ESq0nR8U-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409070807.ESq0nR8U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409070807.ESq0nR8U-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/mediatek/mt76/mt76x2_mac_common.c:297:17: sparse: sparse: dubious: x & !y
   drivers/net/wireless/mediatek/mt76/mt76x2_mac_common.c:481:16: sparse: sparse: dubious: x & !y
--
   drivers/net/wireless/mediatek/mt76/mt76x0/mac.c:166:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/net/wireless/mediatek/mt76/mt76x0/mac.c:166:16: sparse:     expected unsigned short
   drivers/net/wireless/mediatek/mt76/mt76x0/mac.c:166:16: sparse:     got restricted __le16 [usertype]
   drivers/net/wireless/mediatek/mt76/mt76x0/mac.c:175:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] tx_rate @@     got unsigned short @@
   drivers/net/wireless/mediatek/mt76/mt76x0/mac.c:175:23: sparse:     expected restricted __le16 [usertype] tx_rate
   drivers/net/wireless/mediatek/mt76/mt76x0/mac.c:175:23: sparse:     got unsigned short
>> drivers/net/wireless/mediatek/mt76/mt76x0/mac.c:409:16: sparse: sparse: dubious: x & !y

vim +297 drivers/net/wireless/mediatek/mt76/mt76x2_mac_common.c

b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  280  
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  281  int mt76x2_mac_wcid_set_key(struct mt76x2_dev *dev, u8 idx,
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  282  			    struct ieee80211_key_conf *key)
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  283  {
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  284  	enum mt76x2_cipher_type cipher;
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  285  	u8 key_data[32];
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  286  	u8 iv_data[8];
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  287  
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  288  	cipher = mt76x2_mac_get_key_info(key, key_data);
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  289  	if (cipher == MT_CIPHER_NONE && key)
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  290  		return -EOPNOTSUPP;
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  291  
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  292  	mt76_rmw_field(dev, MT_WCID_ATTR(idx), MT_WCID_ATTR_PKEY_MODE, cipher);
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  293  	mt76_wr_copy(dev, MT_WCID_KEY(idx), key_data, sizeof(key_data));
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  294  
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  295  	memset(iv_data, 0, sizeof(iv_data));
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  296  	if (key) {
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31 @297  		mt76_rmw_field(dev, MT_WCID_ATTR(idx), MT_WCID_ATTR_PAIRWISE,
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  298  			       !!(key->flags & IEEE80211_KEY_FLAG_PAIRWISE));
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  299  		iv_data[3] = key->keyidx << 6;
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  300  		if (cipher >= MT_CIPHER_TKIP)
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  301  			iv_data[3] |= 0x20;
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  302  	}
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  303  
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  304  	mt76_wr_copy(dev, MT_WCID_IV(idx), iv_data, sizeof(iv_data));
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  305  
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  306  	return 0;
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  307  }
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  308  EXPORT_SYMBOL_GPL(mt76x2_mac_wcid_set_key);
b9c45e1c42b7d7 Lorenzo Bianconi 2018-07-31  309  

:::::: The code at line 297 was first introduced by commit
:::::: b9c45e1c42b7d709ade99b6ae243065a832e87aa mt76: add mt76x2_mac_common to mt76x2-common module

:::::: TO: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

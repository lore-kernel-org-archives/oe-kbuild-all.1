Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DCE1353EB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706712659; cv=none; b=UEREMVtO/HWnlUQkIaeJUf5ySvyKEBL3JP9u5+9lykCu1bhIGUKPa22awdeSICH9LUfafiazgG3UW7V6X2SP6h3YnDa/CHlj2C+nxZ5r4M+SneTU80155yP3RarinxZqDWz7eJXAhyh9NNF5OiTzlU+CPtkrsB2wZQJarz+/aBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706712659; c=relaxed/simple;
	bh=JP6xlFYB/ltR8khBBkHTdkTjsjKKCQJOug4BA9UQBp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BORxX3Hfdlz6BInuzLuECwWo/CchuKIKUZd5SDKGZtVEn7QJtMfADnWvbQ81qRZp7wFPzJc0ymJVEAND6iPNaYSM3kJ5Ys5QknteUsTYr/SoCIzGEYELKZ1yXpJ+ffLQmvh9PsYFU/ViOMX4R+hvswtjWETu+a3eWzxe7e2s8TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3lqn9vQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3lqn9vQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706712651; x=1738248651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JP6xlFYB/ltR8khBBkHTdkTjsjKKCQJOug4BA9UQBp8=;
  b=E3lqn9vQqikfkF4vhPSF6hxigjHiAFuCuJ4x56g6ckjXKzA+weufTJt5
   99VQl4FON8WZiKMowmL99ytIwwGVyEuSDNv94qILnD2WnWoshLA1h8Myj
   +kNHZerqtzF8hQDeDI+wNp6Pj5JTR3W/9u+086TZmCuu2csRXWrfNEEo8
   5lTpXaEIaTly1EzSKy0M6SbSEzVbZ7X7TBUdB6dJ3KnK1XM8FSdGmfW4s
   L/bDWv77qjd5Q38qpuse3Nu/7kELkHu1sXMlXQSowu1deQwcdWt6VQdwt
   o2To1w1Jify0rRLNAA5myDgxFPFISP3AjNF1OWPrKp77/eO12n+R3pKmd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10253493"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10253493"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 06:50:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="30521772"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jan 2024 06:50:36 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVBv6-0001eS-2l;
	Wed, 31 Jan 2024 14:50:33 +0000
Date: Wed, 31 Jan 2024 22:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 11394/26476]
 drivers/net/wireless/mediatek/mt76_new/mt76x02_util.c:300:72: error: cast to
 smaller integer type 'unsigned int' from 'struct ieee80211_txq *'
Message-ID: <202401312237.CxqRox6b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: 181fd8ff4a9feb40a391eea4957a79274eda157e [11394/26476] mt76x02: add debug print for possible NULL pointer dereference
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240131/202401312237.CxqRox6b-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401312237.CxqRox6b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401312237.CxqRox6b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76_new/mt76x02_util.c:300:72: error: cast to smaller integer type 'unsigned int' from 'struct ieee80211_txq *' [-Werror,-Wpointer-to-int-cast]
     300 |         printk(KERN_ALERT "DEBUG: Passed %s %d 0x%x \n",__FUNCTION__,__LINE__,(unsigned int)vif->txq);
         |                                                                               ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +300 drivers/net/wireless/mediatek/mt76_new/mt76x02_util.c

   287	
   288	static void
   289	mt76x02_vif_init(struct mt76x02_dev *dev, struct ieee80211_vif *vif,
   290			 unsigned int idx)
   291	{
   292		struct mt76x02_vif *mvif = (struct mt76x02_vif *)vif->drv_priv;
   293		struct mt76_txq *mtxq;
   294	
   295		memset(mvif, 0, sizeof(*mvif));
   296	
   297		mvif->idx = idx;
   298		mvif->group_wcid.idx = MT_VIF_WCID(idx);
   299		mvif->group_wcid.hw_key_idx = -1;
 > 300		printk(KERN_ALERT "DEBUG: Passed %s %d 0x%x \n",__FUNCTION__,__LINE__,(unsigned int)vif->txq);
   301		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
   302		mtxq->wcid = &mvif->group_wcid;
   303	
   304		mt76_txq_init(&dev->mt76, vif->txq);
   305	}
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

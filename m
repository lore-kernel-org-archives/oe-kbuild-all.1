Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3902B3209
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 06:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598032; cv=none; b=Iqh2SyuXA4IsZd8q3hpieYZkqzRIWAviwDdCrO8hI9dSQSMWrhnuNnGxWUdbxIih16x0M52GSOFh4K5QNQnrbDZtUNiSykheqJ6As+iVdQXcXz0BEUW/rONhGaDdf0+T7AGxhQsP1rVX4FecRraEVIMNmvUHI3F7IS5RqQTMGA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598032; c=relaxed/simple;
	bh=gIBFpUcdpTEqET201boe5OeaEhR1cNbJ+GzsTMz0LeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8v8e5o01HxWzmlCtk+u5u5b9jWYcpbeZeS0fvlz7lK4ni3lzRZw8Yh/R4HkLgI1Sm9TtUWwOvst7rYUJ6V4caE6YGf++B76zctBBhrX1iqWa9VX1BOe/sRfr6QYviv+DnWvo2bbyNZjDHubCdJmWzHWt5YUH3hKHf7zsdIVTNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CL2b5FsX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CL2b5FsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746598031; x=1778134031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gIBFpUcdpTEqET201boe5OeaEhR1cNbJ+GzsTMz0LeE=;
  b=CL2b5FsX5kQQm8ma9CDWfyTocuN85Vk1j+1ykwWNaHhACvWBqphqf5uT
   fWqmeO+kR2HcdVUnEbNcdTadx1o110RDZgd3iQldGjvoi26M/6DmTT6cC
   Zbt9gI+jBBwFAS5Up/KZnhj9kVXyffTQ+llTN5JPs/zPLu/syc2qOoyjX
   SBn1IiM5mV6SGMmLVNSIXScNCY/r9sOtg45exoFksjQ55IEtJRr7zMrWC
   IZfir//7hhEJVsQoPzR1/5o2HqF5o6cMRkiMftJWwGyg9YzLgjjjwAh4p
   d4QCiQ+vjojLUEsnGe+IdXdbp51BgYthTFUkUioQbgROYP6QjgWg+/ePW
   A==;
X-CSE-ConnectionGUID: k3C9nqSnQGC9TSjZHgUuGQ==
X-CSE-MsgGUID: tw7HPbi6Qv+vlLtdcLAS8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48452756"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48452756"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:07:07 -0700
X-CSE-ConnectionGUID: 3COYIDj7RFWGpAPNHlNk4Q==
X-CSE-MsgGUID: bnvAyUhlSGW0RCQMAk2f0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136252149"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 May 2025 23:07:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXvq-00079N-3B;
	Wed, 07 May 2025 06:07:02 +0000
Date: Wed, 7 May 2025 14:06:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rory Little <rory@candelatech.com>, nbd@nbd.name, lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: oe-kbuild-all@lists.linux.dev, shayne.chen@mediatek.com,
	sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76 v2 1/4] wifi: mt76: mt7996: Add per-radio phy
 debugfs directories.
Message-ID: <202505071352.R4Bb2GN1-lkp@intel.com>
References: <20250430232225.3943242-2-rory@candelatech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430232225.3943242-2-rory@candelatech.com>

Hi Rory,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.15-rc5 next-20250506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rory-Little/wifi-mt76-mt7996-Add-per-radio-phy-debugfs-directories/20250501-072345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20250430232225.3943242-2-rory%40candelatech.com
patch subject: [PATCH mt76 v2 1/4] wifi: mt76: mt7996: Add per-radio phy debugfs directories.
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250507/202505071352.R4Bb2GN1-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071352.R4Bb2GN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071352.R4Bb2GN1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c: In function 'mt7996_init_debugfs':
>> drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c:851:52: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     851 |         snprintf(fname, sizeof(fname), "radio_phy%d", phy->mt76->band_idx);
         |                                                    ^
   In function 'mt7996_init_radio_phy_debugfs',
       inlined from 'mt7996_init_debugfs' at drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c:900:9:
   drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c:851:9: note: 'snprintf' output between 11 and 13 bytes into a destination of size 12
     851 |         snprintf(fname, sizeof(fname), "radio_phy%d", phy->mt76->band_idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +851 drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c

   841	
   842	DEFINE_DEBUGFS_ATTRIBUTE(fops_rf_regval, mt7996_rf_regval_get,
   843				 mt7996_rf_regval_set, "0x%08llx\n");
   844	
   845	static int
   846	mt7996_init_radio_phy_debugfs(struct mt7996_phy *phy)
   847	{
   848		struct dentry *dir;
   849		char fname[12];
   850	
 > 851		snprintf(fname, sizeof(fname), "radio_phy%d", phy->mt76->band_idx);
   852		dir = debugfs_create_dir(fname, phy->dev->debugfs_dir);
   853	
   854		if (IS_ERR_OR_NULL(dir))
   855			return -ENOMEM;
   856	
   857		phy->debugfs_dir = dir;
   858	
   859		return 0;
   860	}
   861	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

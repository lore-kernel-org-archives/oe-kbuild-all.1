Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071DA12B6B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 17:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPHdFF6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703870272; x=1735406272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EWnVnWGK8V8I8IQRek2oJoGIwrjv55cRUDiSImSeAnc=;
  b=IPHdFF6nInHTMEZrpP1FEEekBh306JzYlgZC7F531iOeBW98xFaA3jxr
   BMaTnKPBlN0R2Vmv4oeKjfRK05nv98YGAvjXPjP29jDfvlUUCzPktN7wK
   u2MR39zC3V3SLBiK7IMEgELegPDcPh5Du7e3YDCxIjNsxmo+Cb2qojZL0
   SHj21JCI9SYPZ2G7iTARtgDhMiSUlcXV4LdgqVivHw1oU8eu0kAxoJYo6
   wtfxX4bYanuxKNH9RcjJAPqTit7nW/mDBLfwEDUChcwr4zl+bMI/wvNpF
   g2BgZcjuC454TgBnfbWevcEmun1ep08ibLxgENb7djk58EASrARVbHGmG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="10252085"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="10252085"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 09:17:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="849257134"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="849257134"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Dec 2023 09:17:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJGUV-000Hd1-1j;
	Fri, 29 Dec 2023 17:17:47 +0000
Date: Sat, 30 Dec 2023 01:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [intel-lts:4.19/android_s 2228/30000]
 drivers/mmc/core/block.c:1274:6-13: WARNING opportunity for kmemdup
Message-ID: <202312300134.1nwdMu6L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   2b69ccfcb3117ca97de0f8d4e752e4776133afb8
commit: 8f02ee6abbdb2dea963bb051d86b6a6cefd083d4 [2228/30000] mmc: block: register RPMB partition with the RPMB subsystem
config: nios2-randconfig-r054-20231229 (https://download.01.org/0day-ci/archive/20231230/202312300134.1nwdMu6L-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300134.1nwdMu6L-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mmc/core/block.c:1274:6-13: WARNING opportunity for kmemdup

vim +1274 drivers/mmc/core/block.c

  1269	
  1270	static int mmc_blk_rpmb_set_dev_id(struct rpmb_ops *ops, struct mmc_card *card)
  1271	{
  1272		char *id;
  1273	
> 1274		id = kmalloc(sizeof(card->raw_cid), GFP_KERNEL);
  1275		if (!id)
  1276			return -ENOMEM;
  1277	
  1278		memcpy(id, card->raw_cid, sizeof(card->raw_cid));
  1279		ops->dev_id = id;
  1280		ops->dev_id_len = sizeof(card->raw_cid);
  1281	
  1282		return 0;
  1283	}
  1284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

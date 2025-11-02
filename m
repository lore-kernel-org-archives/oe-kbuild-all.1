Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940D923B609
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762074244; cv=none; b=DUMqtpzT6340D94cHxdc9QJXIE8DjDemvvIBWncrKBL09/kKSaZHtpFlICpB/2ulbdX3xEFMQD1m5/K2pPErgVKu94IQNz4bEh6SZjdw9gzSFL8RXYNUay4zupveTEUX+eTMHCnIIUUQwnrh4RhEBCLzbeIhBflsUc1bGjjhZUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762074244; c=relaxed/simple;
	bh=xFafGH9pV9xVGQS0Mk9/NOydKQelsIiSPqy/EAkETx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=beHsxO/CQhPoqmOwGHx75kGQKA4kGSuORfpWIgBrjPdHExvj0vHaJBjX8qMPmH649hGNbDCCQtkYlF4UnbW/0lIdvmAUJM6QtlM1nMpmoN0WKs2Lk5aZvD0I/cHjEU9Osa9h/G4AE2hfDxXVjLkTpJ06iJlH/6UwbkcLoDS200g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XADsW10D; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XADsW10D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762074242; x=1793610242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xFafGH9pV9xVGQS0Mk9/NOydKQelsIiSPqy/EAkETx0=;
  b=XADsW10DvFGcf7vVne5NdKpZpr79BUWIXkUstzgDRnLuCCSgr7FIPb6v
   oiib5YXeJfjxbNPBNjBXu4IegiVqj9CMakz7xpBV25x+UmRnpDHsX8Ua3
   B8wiTvkdeuwj1n7eLoPrNArQBODfzwCuAT+7TE6VzimK7IpxYwjB6NNxB
   D3PpLbs2P1bqkG+PJXfQiHJjzoxrEeWRtNfgzDovODjJtlZLaS6TyOx8o
   fXGXhrQTMDfJemyBSPmbYBzdJFWwNBaUXLDeZFJ/0E10H4EDbgC92GdiV
   ESVSIuHxkqujLabDwgp/+7QPjCsW5KlW7/taKdVil0Nnsu9EMxuA9P6Yn
   g==;
X-CSE-ConnectionGUID: Qo6vH9L0S3aeTHMnGpA1nQ==
X-CSE-MsgGUID: rGYLLCakTmalEAaVxtnXsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="68037844"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="68037844"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 01:04:01 -0800
X-CSE-ConnectionGUID: Z1Vr07zCRlyS2I4vs9Vi0w==
X-CSE-MsgGUID: nRTGxcawSRSLIZnTFJGJEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="186759430"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Nov 2025 01:04:00 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFU09-000P6O-2P;
	Sun, 02 Nov 2025 09:03:55 +0000
Date: Sun, 2 Nov 2025 17:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3083/3083]
 drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c:1988:47: warning: '%s'
 directive output may be truncated writing up to 95 bytes into a region of
 size 32
Message-ID: <202511021602.OMQuliZc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5394cae209c4a4990d81be436ba17ae56fb09d16
commit: 2048b5b7f264f56a4d9e73079e790e13c8596aaf [3083/3083] net: wangxun: txgbe: add support for wangxun 10G/25G/40G
config: loongarch-randconfig-001-20251102 (https://download.01.org/0day-ci/archive/20251102/202511021602.OMQuliZc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511021602.OMQuliZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511021602.OMQuliZc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c:14:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h: In function 'txgbe_misc_isb':
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c: In function 'txgbe_set_priv_flags':
   drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c:1861:14: warning: variable 'reset_needed' set but not used [-Wunused-but-set-variable]
    1861 |         bool reset_needed = 0;
         |              ^~~~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c: In function 'txgbe_get_strings':
>> drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c:1988:47: warning: '%s' directive output may be truncated writing up to 95 bytes into a region of size 32 [-Wformat-truncation=]
    1988 |                 snprintf(p, ETH_GSTRING_LEN, "%s",
         |                                               ^~
   In function 'txgbe_get_priv_flag_strings',
       inlined from 'txgbe_get_strings' at drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c:2044:3:
   drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c:1988:17: note: 'snprintf' output between 1 and 96 bytes into a destination of size 32
    1988 |                 snprintf(p, ETH_GSTRING_LEN, "%s",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1989 |                          txgbe_gstrings_priv_flags[i].flag_string);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1988 drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c

  1981	
  1982	static void txgbe_get_priv_flag_strings(struct net_device *netdev, u8 *data)
  1983	{
  1984		char *p = (char *)data;
  1985		unsigned int i;
  1986	
  1987		for (i = 0; i < TXGBE_PRIV_FLAGS_STR_LEN; i++) {
> 1988			snprintf(p, ETH_GSTRING_LEN, "%s",
  1989				 txgbe_gstrings_priv_flags[i].flag_string);
  1990			p += ETH_GSTRING_LEN;
  1991		}
  1992	}
  1993	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

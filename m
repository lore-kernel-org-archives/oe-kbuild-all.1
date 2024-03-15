Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4567317BCB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 08:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710491707; cv=none; b=SkD35FpTHNvB1BJo3OhwWQd/oN8rVZp0YyCUWvtJt7s6rd1X9idaGxDc0p9HRd6w3hmpWW3k/96sy/s1noLS5C+JKG0gDdJmEYEvhUanTfNDmIlo2Hff4kKQtwudahkl3ousFNZGiJxHcJS93ROu/OymnP1P0cmVZ8e2vW4+cp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710491707; c=relaxed/simple;
	bh=01vevNAmaEKBfEkYMOncWP/T/EHo8eYhOTXpmk63GUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B6GoZ643mDY7k4oBn9WdxlC3wqekwJyy45p7nnngwJia7WRsEmud6pJlwDQw0ngwayuO1agMuara7AODOEV4ULX0i5rtOZZ4fz4/T0wADd56hBzINtBpNCgkoxI9wQYt964qlN8nJBMmYpxagxTgSjNWDkwCxFeNQdKcLWxOVXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URmeeNHK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URmeeNHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710491704; x=1742027704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=01vevNAmaEKBfEkYMOncWP/T/EHo8eYhOTXpmk63GUs=;
  b=URmeeNHKRipGXwCoRt9b/k6VNwN13GpwNmoiscOwjOTVZbDAMv5Db6np
   OVAtEw0U+z2j8Bd9KW3jTsRHwiP4dI6CrKbvn9/K+O0hLIq/RB8v5lAUJ
   jEWFu6jCXj3xPc2i0P4WNo67ugSXESiYYMRrbOBS6VsNRyRdx4w81etid
   3IVyHx0Xccdx9LyMEKocRZ7hT1SQPP83JS+/m3mA9mqNixCu43Sps02Z/
   0sfmNA/aOBi9SAwrDn893lGsS5TpznXu6vuwPjwe8NcYRPGCu2qy65XD5
   sVUF9MvrGjKZapGKDmsOo//SPs9XSxkg4vWPjeYHwefbhas+XNlk0sEZr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22811239"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="22811239"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 01:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="43497046"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Mar 2024 01:35:03 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl31o-000EGm-0X;
	Fri, 15 Mar 2024 08:35:00 +0000
Date: Fri, 15 Mar 2024 16:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Intel ChromeOS bot <linuxwifi@intel.com>
Subject: [jfern:sched/dlserver.debug.mar3.2024 28515/30000]
 drivers/net/wireless/iwl7000/iwlwifi/mvm/fw.c:1619:52: error: 'struct
 iwl_mvm' has no member named 'phy_filters'; did you mean 'rx_filters'?
Message-ID: <202403151610.TpbrsVCN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/dlserver.debug.mar3.2024
head:   6890cea305eadbebc9f3fcf8d31c6672af797ee5
commit: c7aacce2216be329acb2a6c01543caed73ac395f [28515/30000] CHROMIUM: iwl7000: read SAR tables from UEFI
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240315/202403151610.TpbrsVCN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151610.TpbrsVCN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151610.TpbrsVCN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/iwl7000/iwlwifi/mvm/fw.c: In function 'iwl_mvm_get_bios_tables':
>> drivers/net/wireless/iwl7000/iwlwifi/mvm/fw.c:1619:52: error: 'struct iwl_mvm' has no member named 'phy_filters'; did you mean 'rx_filters'?
    1619 |         iwl_acpi_get_phy_filters(&mvm->fwrt, &mvm->phy_filters);
         |                                                    ^~~~~~~~~~~
         |                                                    rx_filters


vim +1619 drivers/net/wireless/iwl7000/iwlwifi/mvm/fw.c

c7aacce2216be3 Miri Korenblit 2023-11-05  1564  
c7aacce2216be3 Miri Korenblit 2023-11-05  1565  void iwl_mvm_get_bios_tables(struct iwl_mvm *mvm)
7804c96fab9aa5 Luca Coelho    2021-12-28  1566  {
7804c96fab9aa5 Luca Coelho    2021-12-28  1567  	int ret;
7804c96fab9aa5 Luca Coelho    2021-12-28  1568  
5a77ded3b9eefd Miri Korenblit 2023-10-30  1569  	iwl_acpi_get_guid_lock_status(&mvm->fwrt);
5a77ded3b9eefd Miri Korenblit 2023-10-30  1570  
7804c96fab9aa5 Luca Coelho    2021-12-28  1571  	/* read PPAG table */
c1be1fe6ce5d6e Matt Chen      2021-12-03  1572  	ret = iwl_acpi_get_ppag_table(&mvm->fwrt);
7804c96fab9aa5 Luca Coelho    2021-12-28  1573  	if (ret < 0) {
7804c96fab9aa5 Luca Coelho    2021-12-28  1574  		IWL_DEBUG_RADIO(mvm,
7804c96fab9aa5 Luca Coelho    2021-12-28  1575  				"PPAG BIOS table invalid or unavailable. (%d)\n",
7804c96fab9aa5 Luca Coelho    2021-12-28  1576  				ret);
7804c96fab9aa5 Luca Coelho    2021-12-28  1577  	}
7804c96fab9aa5 Luca Coelho    2021-12-28  1578  
7804c96fab9aa5 Luca Coelho    2021-12-28  1579  	/* read SAR tables */
c7aacce2216be3 Miri Korenblit 2023-11-05  1580  	ret = iwl_bios_get_wrds_table(&mvm->fwrt);
7804c96fab9aa5 Luca Coelho    2021-12-28  1581  	if (ret < 0) {
7804c96fab9aa5 Luca Coelho    2021-12-28  1582  		IWL_DEBUG_RADIO(mvm,
7804c96fab9aa5 Luca Coelho    2021-12-28  1583  				"WRDS SAR BIOS table invalid or unavailable. (%d)\n",
7804c96fab9aa5 Luca Coelho    2021-12-28  1584  				ret);
7804c96fab9aa5 Luca Coelho    2021-12-28  1585  		/*
7804c96fab9aa5 Luca Coelho    2021-12-28  1586  		 * If not available, don't fail and don't bother with EWRD and
7804c96fab9aa5 Luca Coelho    2021-12-28  1587  		 * WGDS */
7804c96fab9aa5 Luca Coelho    2021-12-28  1588  
c7aacce2216be3 Miri Korenblit 2023-11-05  1589  		if (!iwl_bios_get_wgds_table(&mvm->fwrt)) {
7804c96fab9aa5 Luca Coelho    2021-12-28  1590  			/*
7804c96fab9aa5 Luca Coelho    2021-12-28  1591  			 * If basic SAR is not available, we check for WGDS,
7804c96fab9aa5 Luca Coelho    2021-12-28  1592  			 * which should *not* be available either.  If it is
7804c96fab9aa5 Luca Coelho    2021-12-28  1593  			 * available, issue an error, because we can't use SAR
7804c96fab9aa5 Luca Coelho    2021-12-28  1594  			 * Geo without basic SAR.
7804c96fab9aa5 Luca Coelho    2021-12-28  1595  			 */
7804c96fab9aa5 Luca Coelho    2021-12-28  1596  			IWL_ERR(mvm, "BIOS contains WGDS but no WRDS\n");
7804c96fab9aa5 Luca Coelho    2021-12-28  1597  		}
7804c96fab9aa5 Luca Coelho    2021-12-28  1598  
7804c96fab9aa5 Luca Coelho    2021-12-28  1599  	} else {
c7aacce2216be3 Miri Korenblit 2023-11-05  1600  		ret = iwl_bios_get_ewrd_table(&mvm->fwrt);
7804c96fab9aa5 Luca Coelho    2021-12-28  1601  		/* if EWRD is not available, we can still use
7804c96fab9aa5 Luca Coelho    2021-12-28  1602  		* WRDS, so don't fail */
7804c96fab9aa5 Luca Coelho    2021-12-28  1603  		if (ret < 0)
7804c96fab9aa5 Luca Coelho    2021-12-28  1604  			IWL_DEBUG_RADIO(mvm,
7804c96fab9aa5 Luca Coelho    2021-12-28  1605  					"EWRD SAR BIOS table invalid or unavailable. (%d)\n",
7804c96fab9aa5 Luca Coelho    2021-12-28  1606  					ret);
7804c96fab9aa5 Luca Coelho    2021-12-28  1607  
7804c96fab9aa5 Luca Coelho    2021-12-28  1608  		/* read geo SAR table */
7804c96fab9aa5 Luca Coelho    2021-12-28  1609  		if (iwl_sar_geo_support(&mvm->fwrt)) {
c7aacce2216be3 Miri Korenblit 2023-11-05  1610  			ret = iwl_bios_get_wgds_table(&mvm->fwrt);
7804c96fab9aa5 Luca Coelho    2021-12-28  1611  			if (ret < 0)
7804c96fab9aa5 Luca Coelho    2021-12-28  1612  				IWL_DEBUG_RADIO(mvm,
7804c96fab9aa5 Luca Coelho    2021-12-28  1613  						"Geo SAR BIOS table invalid or unavailable. (%d)\n",
7804c96fab9aa5 Luca Coelho    2021-12-28  1614  						ret);
7804c96fab9aa5 Luca Coelho    2021-12-28  1615  				/* we don't fail if the table is not available */
7804c96fab9aa5 Luca Coelho    2021-12-28  1616  		}
7804c96fab9aa5 Luca Coelho    2021-12-28  1617  	}
310702e6a00272 Johannes Berg  2023-02-01  1618  
310702e6a00272 Johannes Berg  2023-02-01 @1619  	iwl_acpi_get_phy_filters(&mvm->fwrt, &mvm->phy_filters);
7804c96fab9aa5 Luca Coelho    2021-12-28  1620  }
7804c96fab9aa5 Luca Coelho    2021-12-28  1621  

:::::: The code at line 1619 was first introduced by commit
:::::: 310702e6a002726160502141e51908cd49f698d6 CHROMIUM: iwl7000: implement WPFC ACPI table loading

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Intel ChromeOS bot <linuxwifi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

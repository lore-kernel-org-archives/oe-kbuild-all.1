Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5471514DC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 16:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762101810; cv=none; b=H7TMR5F5KtijvgWUvm4xIieb3X+uonETWzrkT8YZxz0eAZ9uOTmTcgdn+mXInVXSVR2ao7ZPPjE8L7I8g+qBLUkd8AZ3GTQp7jq2YFXpZa+TzUQ4UiX/fZov1zJ+oDsYjzv8Lcgoyt/V16ris51zTbr+x03y58Xsf5ETyXkdeRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762101810; c=relaxed/simple;
	bh=3p3sP5Xc/dABlYCa30oygHjf7aTVRfhkm8yNCR7181A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkejCysF98mKQZOVD7lD/ujy9VAqCY992nQK1CNM07mjHd0yr3EtgnSEr6q0NVKh21Smp3QN7ZvXdWkuzv14qYmDADgHC9b0EOk2p2HupDNrcQk2MbzSlOmg4WlmqCKDrIGNncwhdGRzkp4uaDWXVjbZwn9EYbtFnHrZ8MQLBLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZSdigaB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZSdigaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762101808; x=1793637808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3p3sP5Xc/dABlYCa30oygHjf7aTVRfhkm8yNCR7181A=;
  b=CZSdigaBe0u07bQ4AE6zpbulfrCqJJma2+ty8OnbDa29txEFHPdgTG6M
   T0gfW2VKKrcPeSVMkvCAWu7seL8w2nkLFldhzynPdOuVnWZ9RLHxvykT5
   UOBGL66Kj1GhMQQbf0mIKHDcOqtcSO5nbTdIJrYCn9JnC4MK3AZJSpVCV
   +mAulgZY6b2SpNYnW91OyxrErYbTwTNMiDPNa0AdRRmFpsjpeGvEGf1nH
   KTEW6hMTt6O0eX1nW1q2RXx8Z1VWV7eoxTBP4/pG6PJeUVJNtUZBCbuo9
   Aa/s85U75qfMwOd2sYr91eVttWG0c0zvec8hISvvwcFYB1/u/AH7xmWJs
   A==;
X-CSE-ConnectionGUID: JbYmJZ8wRaG/URRZ6P/Ifg==
X-CSE-MsgGUID: h7Uodp9HSr6RfBHQLZ8Cqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="74869274"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="74869274"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 08:43:27 -0800
X-CSE-ConnectionGUID: BsuNrU29Qx+CIVXMMg24gg==
X-CSE-MsgGUID: BnYBzTNuSAywKJVzLTvbrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="191012564"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Nov 2025 08:43:26 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFbAq-000POY-0A;
	Sun, 02 Nov 2025 16:43:24 +0000
Date: Mon, 3 Nov 2025 00:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3083/3083]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:5632:59:
 warning: '%s' directive output may be truncated writing up to 63 bytes into
 a region of size 43
Message-ID: <202511030047.dmhj97Bf-lkp@intel.com>
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
commit: 468b0cd7b1e1c131b3ee7d2ea8b96521d3faad8b [3083/3083] net:nebula-matrix:Add S1000 SNIC driver support
config: x86_64-buildonly-randconfig-005-20251102 (https://download.01.org/0day-ci/archive/20251103/202511030047.dmhj97Bf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030047.dmhj97Bf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030047.dmhj97Bf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: In function 'nbl_serv_handle_tx_timeout':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:1378:33: warning: variable 'vector' set but not used [-Wunused-but-set-variable]
    1378 |         struct nbl_serv_vector *vector;
         |                                 ^~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: In function 'nbl_serv_remove_txrx_queues':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:3025:35: warning: variable 'ring_mgt' set but not used [-Wunused-but-set-variable]
    3025 |         struct nbl_serv_ring_mgt *ring_mgt;
         |                                   ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: In function 'nbl_serv_rep_start_xmit':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:4002:29: warning: variable 'adapter' set but not used [-Wunused-but-set-variable]
    4002 |         struct nbl_adapter *adapter;
         |                             ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: In function 'nbl_serv_set_wake':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:4552:43: warning: variable 'net_resource_mgt' set but not used [-Wunused-but-set-variable]
    4552 |         struct nbl_serv_net_resource_mgt *net_resource_mgt;
         |                                           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: In function 'nbl_serv_load_p4':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:5726:22: warning: variable 'name' set but not used [-Wunused-but-set-variable]
    5726 |         u8 *strtab, *name, *product_code = NULL;
         |                      ^~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: In function 'nbl_serv_form_p4_name.constprop':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:5632:59: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 43 [-Wformat-truncation=]
    5632 |                 snprintf(name, len, "nbl/snic_v3r1/m181xx_%s_port_p4_%s", eth_num, ver);
         |                                                           ^~              ~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:5632:17: note: 'snprintf' output between 31 and 157 bytes into a destination of size 64
    5632 |                 snprintf(name, len, "nbl/snic_v3r1/m181xx_%s_port_p4_%s", eth_num, ver);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +5632 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c

  5598	
  5599	static void nbl_serv_form_p4_name(struct nbl_common_info *common, int type, char *name,
  5600					  u16 len, u32 version)
  5601	{
  5602		char eth_num[NBL_P4_NAME_LEN] = {0};
  5603		char ver[NBL_P4_NAME_LEN] = {0};
  5604	
  5605		switch (NBL_COMMON_TO_ETH_MODE(common)) {
  5606		case 1:
  5607			snprintf(eth_num, sizeof(eth_num), "single");
  5608			break;
  5609		case 2:
  5610			snprintf(eth_num, sizeof(eth_num), "dual");
  5611			break;
  5612		case 4:
  5613			snprintf(eth_num, sizeof(eth_num), "quad");
  5614			break;
  5615		default:
  5616			nbl_err(common, NBL_DEBUG_CUSTOMIZED_P4, "Unknown P4 type %d", type);
  5617			return;
  5618		}
  5619	
  5620		switch (version) {
  5621		case 0:
  5622			snprintf(ver, sizeof(ver), "lg");
  5623			break;
  5624		case 1:
  5625			snprintf(ver, sizeof(ver), "hg");
  5626			break;
  5627		}
  5628	
  5629		switch (type) {
  5630		case NBL_P4_DEFAULT:
  5631			/* No need to load default p4 file */
> 5632			snprintf(name, len, "nbl/snic_v3r1/m181xx_%s_port_p4_%s", eth_num, ver);
  5633			break;
  5634		default:
  5635			nbl_err(common, NBL_DEBUG_CUSTOMIZED_P4, "Unknown P4 type %d", type);
  5636		}
  5637	}
  5638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

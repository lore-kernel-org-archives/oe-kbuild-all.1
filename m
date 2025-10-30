Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFA33FFD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 00:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761782898; cv=none; b=k3T11sUopLo88O2gPzvhsdzs3ZgXeFKpspR3m9or/CkZVIDGeKneXFN7IUo6zIPvawk87H/dYxMat5rRB9E+0yLEbRmlqXtbtZmhhsFL7u8mTZW96Q8xCrja22MbW4vr2e3xzvkNZx9L59AMGCJSsdPI0F9X+SUm5KcuZNwjQ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761782898; c=relaxed/simple;
	bh=n1R6wGKSswVLZXqOItW5OzPcer7oEeZDg1beMbGmIDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i5Ir11TuCQ28NUhXw0jChr3wtUEYyNWJAHLYHQU5rakIqkrF+SggOw4ioobk66T7lxAcNm75Th+n4Uju4Zru+EqrgyR4ERaFUSkA740NSEEIH4j5OVqeYN2YtPNn6nM6XTvAO4Pw3Cmnw40g89J907XYEhrqjz/WdpWJp3QnIbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9d/sEUB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9d/sEUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761782897; x=1793318897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n1R6wGKSswVLZXqOItW5OzPcer7oEeZDg1beMbGmIDs=;
  b=C9d/sEUBC7JsDQvDbrVUy1/16CE7O1K75iQCak+KZUfp8lmMv0K+5E40
   cEe6URQSWHiEnldEBxYbr2uHyrc6Y7NccJlvD3X6vp/wuqDFAgiu3aZxh
   uycvJxt7kKAgi+IMpuOoR/FugGtudY68YXlKoWRLrZqCYzaImcstu5Deq
   0Gb98iHNgfoD7nf2U9rVPp4duxmWJH05bAkTV7A8GzAx6kt8PmRpl+cuS
   0hgk1d8XPaUiJ+CKl8Aseo0tYoz7UYwXXMP58Tycgtv7bPyRCEtHrm0tx
   YxQAUl0VUL7PiAkoqhP2kDxxtXEEz5cTwfPBvxGIP55DJ7+/4pWBV2toF
   Q==;
X-CSE-ConnectionGUID: zEc4hi2TQnKPg3ew0x7Tsg==
X-CSE-MsgGUID: 9+ODNyR0Qey6Sx8ITuMdag==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67778500"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="67778500"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 17:08:16 -0700
X-CSE-ConnectionGUID: Js7NfNGnSki2Z3aVQhzfdA==
X-CSE-MsgGUID: tixjHiqtTSKP/ZLSbSYKfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="185002505"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2025 17:08:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEGD6-000LIG-2X;
	Thu, 30 Oct 2025 00:08:12 +0000
Date: Thu, 30 Oct 2025 08:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3257/3257]
 drivers/net/ethernet/nebula-matrix/m1600/ethtool.h:131:19: warning:
 'nbl_priv_flags' defined but not used
Message-ID: <202510300807.ZZO1csL8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5860abf4ca1c1e5ced0d4787886db4195a9c54ea
commit: 01e6e2075c432fde7fb5a66202b41bbd469de620 [3257/3257] Net: m1600: Add m1600-driver for nebula-matrix m1600 series smart NIC.
config: x86_64-randconfig-121-20251030 (https://download.01.org/0day-ci/archive/20251030/202510300807.ZZO1csL8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300807.ZZO1csL8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300807.ZZO1csL8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/nebula-matrix/m1600/main.c:155:6: warning: no previous prototype for 'nbl_service_task2_schedule' [-Wmissing-prototypes]
     155 | void nbl_service_task2_schedule(struct nbl_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/m1600/main.c:436:6: warning: no previous prototype for 'nbl_check_and_set_module_info' [-Wmissing-prototypes]
     436 | void nbl_check_and_set_module_info(struct nbl_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/nebula-matrix/m1600/main.c:22:
>> drivers/net/ethernet/nebula-matrix/m1600/ethtool.h:131:19: warning: 'nbl_priv_flags' defined but not used [-Wunused-const-variable=]
     131 | static const char nbl_priv_flags[][ETH_GSTRING_LEN] = {
         |                   ^~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/m1600/ethtool.h:116:19: warning: 'nbl_gstrings_test' defined but not used [-Wunused-const-variable=]
     116 | static const char nbl_gstrings_test[][ETH_GSTRING_LEN] = {
         |                   ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/m1600/ethtool.h:57:39: warning: 'nbl_gstrings_stats' defined but not used [-Wunused-const-variable=]
      57 | static const struct nbl_ethtool_stats nbl_gstrings_stats[] = {
         |                                       ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/m1600/ethtool.h:13:18: warning: 'nbl_regs_dump_list' defined but not used [-Wunused-const-variable=]
      13 | static const u32 nbl_regs_dump_list[] = {
         |                  ^~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/nebula-matrix/m1600/ethtool.c:507:5: warning: no previous prototype for 'nbl_get_eeprom_len' [-Wmissing-prototypes]
     507 | int nbl_get_eeprom_len(struct net_device *netdev)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/m1600/ethtool.c:643:5: warning: no previous prototype for 'nbl_query_link_speed' [-Wmissing-prototypes]
     643 | u32 nbl_query_link_speed(struct nbl_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/nebula-matrix/m1600/mailbox.c:15:
>> drivers/net/ethernet/nebula-matrix/m1600/ethtool.h:131:19: warning: 'nbl_priv_flags' defined but not used [-Wunused-const-variable=]
     131 | static const char nbl_priv_flags[][ETH_GSTRING_LEN] = {
         |                   ^~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/m1600/ethtool.h:116:19: warning: 'nbl_gstrings_test' defined but not used [-Wunused-const-variable=]
     116 | static const char nbl_gstrings_test[][ETH_GSTRING_LEN] = {
         |                   ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/m1600/ethtool.h:57:39: warning: 'nbl_gstrings_stats' defined but not used [-Wunused-const-variable=]
      57 | static const struct nbl_ethtool_stats nbl_gstrings_stats[] = {
         |                                       ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/m1600/ethtool.h:13:18: warning: 'nbl_regs_dump_list' defined but not used [-Wunused-const-variable=]
      13 | static const u32 nbl_regs_dump_list[] = {
         |                  ^~~~~~~~~~~~~~~~~~

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/nebula-matrix/m1600/main.c:155:6: sparse: sparse: symbol 'nbl_service_task2_schedule' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/m1600/main.c:436:6: sparse: sparse: symbol 'nbl_check_and_set_module_info' was not declared. Should it be static?

vim +/nbl_priv_flags +131 drivers/net/ethernet/nebula-matrix/m1600/ethtool.h

   130	
 > 131	static const char nbl_priv_flags[][ETH_GSTRING_LEN] = {
   132		"sriov-ena",
   133	};
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

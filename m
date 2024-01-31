Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ECC22619
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 11:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706700007; cv=none; b=UijfkXnBoNSiU5VtxBYQm6oEI22PsfzxRdowHknL+XH+sHeEa60KegKnzqn+07VtJ+nx4Ol1pZ35YdBNPBjQurCLOeoVooYx2s8ibJIm+8u4FhkVKo5K4hn1+uTmPvnJYyD9h4O+OOA9596SUIJaGUpS8Xe0lMWyb4/sACwioBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706700007; c=relaxed/simple;
	bh=wkqM41kCLv4584mpAZPTdazH3NiA7WXPErpFgLhKtIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HaChbQdKPJ++6JgJiiyLuigUY5pqebPSMKtwPUK3dT1cudN94dFc0MoBtGHa0nxdVMQGFmx7Lrd2+H2Soiws5WSAp7esF3bHNEr97j1XiJXAXHHzcScqcPJN8AoiIlyDtzoPiyCW7kCzwb7k95ntS55iNuAx1/K5ixYPEA6bmIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HEpgesLi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEpgesLi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706700007; x=1738236007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wkqM41kCLv4584mpAZPTdazH3NiA7WXPErpFgLhKtIM=;
  b=HEpgesLi+hAgXJaas9Orftz+jyAj2Cr7a+B2kGcgTGMiAAgPc68ZCoGU
   Rs4NoE2YkS2ZbUMQa8A9r7BNf+eMqh7AjEiLJbxsXUad9w6y3sd1/rkev
   Vyzos3lsRuKIK0bIvHIFg695wZ0MdZhXQvPBbMoX6vz2qBDEO2JhRnujm
   YDCje3QjvFMKvXViluerr/AXFyDqmaS+TUjrfEOZut13NEpl+/69M7gt+
   I9y0nwE2CRcaIuQSHewdM5T8G9I/9fuM5ZEF8np66BeNcHgywZikHt+85
   82nlqW8qUVfZ/idQcZBonKF6JiPpcj5SEhb8Ig1eTxWjaT0J7jbqBtj25
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10941702"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10941702"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 03:20:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911757354"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="911757354"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 31 Jan 2024 03:20:04 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV8dO-0001V2-0s;
	Wed, 31 Jan 2024 11:20:02 +0000
Date: Wed, 31 Jan 2024 19:19:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhengchao Shao <shaozhengchao@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 647/2888] drivers/net/bonding/bond_sysctl.c:9:25:
 sparse: sparse: symbol 'bond_broadcast_arp_or_nd_table_header' was not
 declared. Should it be static?
Message-ID: <202401311905.C8vnDbJH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f6f9abf1a5ef2fc559630c77b3570346dcd19d40
commit: 6263012c995d0e8dbc33b8e4d8929550ba237b23 [647/2888] anolis: bond: broadcast ARP or ND messages to all slaves
config: x86_64-randconfig-121-20240131 (https://download.01.org/0day-ci/archive/20240131/202401311905.C8vnDbJH-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311905.C8vnDbJH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311905.C8vnDbJH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/bonding/bond_sysctl.c:9:25: sparse: sparse: symbol 'bond_broadcast_arp_or_nd_table_header' was not declared. Should it be static?

vim +/bond_broadcast_arp_or_nd_table_header +9 drivers/net/bonding/bond_sysctl.c

     8	
   > 9	struct ctl_table_header *bond_broadcast_arp_or_nd_table_header;
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

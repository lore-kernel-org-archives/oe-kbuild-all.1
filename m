Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2561A166F3D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 20:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733171808; cv=none; b=kdgAGsHB/+qkEXK9D6RLewaM1r8AcEernkaZHNsbsIuPPdNq42K3WDbuZA/+WA5W2eRy66QIgMWTcOn8L7gnWjrztTPWdm6uHc70en8VfR+L9XCZ1guOscAmhUBIVfcJ+KCOo9LXPcCJ9p4YzKPdGjiEK0Yp8wv0XwCxmDJUPfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733171808; c=relaxed/simple;
	bh=L6j0FAYWeFXszz/n1qMw34QhZ/STyR4W1Uzcn7vhiYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KAN/gKFLUCDwboIqB5Q181vktcpYFzZQ/MO/ShLeccbzN3FVjlT8rrpJJ6zNTVJdDb6a0s2ktyFSMcsZsYO5x4TpaiUZqMOuya0Yml/Hhid5mF+DekpDhh3EOH2FWxwReX92EdYm/y1vDquVTBy0I5n+7NH/TH2AHJ1TyEIN6Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YvFPvj8o; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvFPvj8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733171806; x=1764707806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L6j0FAYWeFXszz/n1qMw34QhZ/STyR4W1Uzcn7vhiYU=;
  b=YvFPvj8oZtg+u9gue4x7W9Ax0WtXuLAS47OY6bJRuYKN1sn1/R8gJ8ws
   eIA0XrC4jiIySJCLIY2ct25cQoO5nCww2ZyiT66So65CVqzdjl1bv4xZr
   rR6h3Fxfk/71FSLgNjDilSQaZ79XG3dcRrQOiUg8A0ekI3kizailxtK0f
   XYMiWuKU2BFteroT3A3nlEV13kRTdSgK/FgmWvU1IvEPXa0QdjaIPPFCx
   L5KL4ihGa/rHcC4tQJ9YqRNQB9Vkc1tU/TXarQhDMYC33LvAxknos23vH
   k2/yHLjmjf2GuWLSav2bgt/KILZBLUMn42NeeC1HUBlZyDe2STjZiZ7kb
   g==;
X-CSE-ConnectionGUID: h5/Qys8DSjKntl72cbPsfA==
X-CSE-MsgGUID: IzGbjLXbRbykbXC+yg6qkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="32709457"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="32709457"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 12:36:45 -0800
X-CSE-ConnectionGUID: V6+jxiZ1QX+9fellRCDY7A==
X-CSE-MsgGUID: MQhAzhIEQpu1ROtg7NBpSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93616287"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Dec 2024 12:36:45 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tID9Z-0002sB-08;
	Mon, 02 Dec 2024 20:36:24 +0000
Date: Tue, 3 Dec 2024 04:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 drivers/ub/urma/ubcore/ubcore_umem.c:227:21: warning: no previous prototype
 for 'ubcore_umem_get'
Message-ID: <202412030455.2cb7zJmc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   929a9df37c1b7dec73fd417d79a116d02a8f9380
commit: f6206cf05e28a7f455850a4e2de8162890f50073 [2516/2516] ub: add memory map api in ubcore
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241203/202412030455.2cb7zJmc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030455.2cb7zJmc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030455.2cb7zJmc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_umem.c:227:21: warning: no previous prototype for 'ubcore_umem_get' [-Wmissing-prototypes]
     227 | struct ubcore_umem *ubcore_umem_get(struct ubcore_device *dev, uint64_t va, uint64_t len,
         |                     ^~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_umem.c:245:6: warning: no previous prototype for 'ubcore_umem_release' [-Wmissing-prototypes]
     245 | void ubcore_umem_release(struct ubcore_umem *umem)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/ubcore_umem_get +227 drivers/ub/urma/ubcore/ubcore_umem.c

   226	
 > 227	struct ubcore_umem *ubcore_umem_get(struct ubcore_device *dev, uint64_t va, uint64_t len,
   228					    union ubcore_umem_flag flag)
   229	{
   230		struct page **page_list;
   231		int ret;
   232	
   233		ret = umem_verify_input(dev, va, len, flag);
   234		if (ret < 0)
   235			return ERR_PTR(ret);
   236	
   237		page_list = (struct page **)__get_free_page(GFP_KERNEL);
   238		if (page_list == 0)
   239			return ERR_PTR(-ENOMEM);
   240	
   241		return ubcore_get_target_umem(dev, va, len, flag, page_list);
   242	}
   243	EXPORT_SYMBOL(ubcore_umem_get);
   244	
 > 245	void ubcore_umem_release(struct ubcore_umem *umem)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

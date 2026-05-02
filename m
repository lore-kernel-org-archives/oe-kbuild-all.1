Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC422BD0B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 11:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777720127; cv=none; b=ueWMhGx6Ye86DflRilHR7/x5HarHp+NJoj8PkYvQN5q6zfw34XvIQTzyzz4Yxzw1onR8/RxrpLrz6zW30DzwpYXYbQBtuOWs7mRExb5iH+pPUNlSAXO6dwPRaw/GvT3PDjaQ8GKg90HDvyxL7noLN/p9KhGQoZUWYXdFfY4BKBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777720127; c=relaxed/simple;
	bh=oGptbtoWlrKWZr4yrUZUeISDuBd5rXFWrvIa7Z7e0PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kM/wZtRPRu0Tl8Qfh44Vb2HveSRzePCLihShbuUkClrMWWeAZ2cJPUKGVBtZGFHpz/txdyv5xvGlDhT1MyyqMrXvR1NzhPozc0SsWVpWYk+v5bYAxUKe4f/HBU5OCZygYeno+VchLG5Bd+GULD5gTXHTSStwnWdx6LaoQpVZJik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oe5X9yih; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oe5X9yih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777720126; x=1809256126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oGptbtoWlrKWZr4yrUZUeISDuBd5rXFWrvIa7Z7e0PI=;
  b=Oe5X9yihD19n/dbqVr/uBWqVKnnSBM7LNWBWcT6/KcrkdYlhphECIYIA
   BOI8rZs7CtKvCBjucnrT/9WrGcun4QGl3mUqJbgrvnl4jC15IVaVmCg4M
   TDLz7iqWc6FG6UbyhYCN2+hI8ire7v51uKLzKKUfNC3woscoD41onTssL
   Tzub+LYuGIOZHo7b/1w1YEbGX3wBhvV0mSjplzUzi2nsX+iFOKhrHZFeH
   JS71L0RLS3M0zTbRYenZe38zN71k3DgBaHm3wrZlg9EIuc+qKDilGyuVI
   0L5bUOlWYHL7TiXh7X8ntXEPA+FwLAOkNHIvWEj+ojHq4Xd7K9I/l/pFC
   g==;
X-CSE-ConnectionGUID: TgGEHCQkTcq7QkOoBnPsPQ==
X-CSE-MsgGUID: a+Rhj91PSj2QjIasE62m0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78686701"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="78686701"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 04:08:45 -0700
X-CSE-ConnectionGUID: xs/pF1p5QaCOLvqy2VNn+w==
X-CSE-MsgGUID: FiPSDNvaSPCwlxzs5w/Lwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="273179978"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2026 04:08:44 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ8DB-000000001LJ-1aJc;
	Sat, 02 May 2026 11:08:41 +0000
Date: Sat, 2 May 2026 19:08:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] xen/swiotlb: avoid arch_sync_dma_* on per-device DMA
 memory
Message-ID: <202605021905.fOno6YnM-lkp@intel.com>
References: <20260415-xen-swiotlb-v1-1-de24eda3c0fd@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-xen-swiotlb-v1-1-de24eda3c0fd@nxp.com>

Hi Peng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 66672af7a095d89f082c5327f3b15bc2f93d558e]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/xen-swiotlb-avoid-arch_sync_dma_-on-per-device-DMA-memory/20260416-135556
base:   66672af7a095d89f082c5327f3b15bc2f93d558e
patch link:    https://lore.kernel.org/r/20260415-xen-swiotlb-v1-1-de24eda3c0fd%40nxp.com
patch subject: [PATCH RFC] xen/swiotlb: avoid arch_sync_dma_* on per-device DMA memory
config: x86_64-randconfig-161-20260502 (https://download.01.org/0day-ci/archive/20260502/202605021905.fOno6YnM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021905.fOno6YnM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605021905.fOno6YnM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/xen/swiotlb-xen.c: In function 'dev_has_private_dma_pool':
>> drivers/xen/swiotlb-xen.c:200:26: error: 'struct device' has no member named 'dma_mem'
     200 |         return dev && dev->dma_mem;
         |                          ^~
>> drivers/xen/swiotlb-xen.c:201:1: warning: control reaches end of non-void function [-Wreturn-type]
     201 | }
         | ^


vim +200 drivers/xen/swiotlb-xen.c

   197	
   198	static inline bool dev_has_private_dma_pool(struct device *dev)
   199	{
 > 200		return dev && dev->dma_mem;
 > 201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

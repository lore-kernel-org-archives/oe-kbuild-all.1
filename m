Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A3821B90B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 23:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746142214; cv=none; b=db/4qYRH4WVi5RUHwcg/oBDdiDOOirYWEWSXDWX4DSXfvdk+6Mf/meq3r364VgzSM/L1GTy0TsT1E6cKpJHvd75XWuHqfoVs2iRp1buAUHyILAuZqq7ZvB0YBQUOmcCWcnMCWTbAjeokPP51/sUSDAZT7tb4iLmOx4PmgTMlS/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746142214; c=relaxed/simple;
	bh=4UItjmcnotLkZjIuaDTV0eH10lNLs30kjJbvcIzANr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YzFcOWXSakJ3fCyaq3SXvhmZ3NC1j6z3iPzm1zARAuwPAsoD3ZonekV5ulfWsKSQL2u7ABimjAst0c+tKd3BldjHgpeSm/oF/2xDRJ5QhFV9vXxulkqF1EKS0WuVXEtBZ3kfg7akiKcmAw9tk/pJ3ZuvaMayvImyrOuL5gOoKzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpQ3cZEu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpQ3cZEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746142211; x=1777678211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4UItjmcnotLkZjIuaDTV0eH10lNLs30kjJbvcIzANr4=;
  b=hpQ3cZEuyNwx8kExfP3+G6W3CXv/lHNQWo18x0T2HVgI/eAgymFDoQtj
   CpnL3OKNEvYu8Rw2q1e0+SA3ERkfRONx9lsnarmvoaloPIErZbONxVHWL
   ItszgKPxLbUcNMTMyABlfE4qVOWnOzdc9f5LbPNYsngN/KVY6/YBk49QE
   +KI58DZcamc7aKk3wB34YUhX3Sbfvy054To/eI7dbWpGcnlG1RunuH3MG
   R1gyZ5MLB0b3oKq/9n4QCKdzkuOlkUyIws/n4CCu3rwOpwvXnk9TRTQYE
   eAdjp/Nk6D9gTuIbeWcJIoqhDywpERRWVDt5pmQIOrc54UB5PztW+OMQp
   A==;
X-CSE-ConnectionGUID: DOgxpJUVQpKdqfbOEDyWHQ==
X-CSE-MsgGUID: vuxRLxovTxamqf4P5uD0lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="70329524"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="70329524"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 16:30:10 -0700
X-CSE-ConnectionGUID: mLYdzqPzQUWbKjAfJuYv8A==
X-CSE-MsgGUID: CRpYOWkHS7+yOQjzhIqZDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="135034353"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 May 2025 16:30:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAdLy-0004RD-2t;
	Thu, 01 May 2025 23:30:06 +0000
Date: Fri, 2 May 2025 07:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882]
 drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:2327:6: sparse: sparse:
 symbol 'mcp251xfd_tx_obj_write_sync' was not declared. Should it be static?
Message-ID: <202505020705.McaLXQv7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   46abe407b020831448331eea487e07c883e95836
commit: b4eaf3e808dc2abcab55bc72df3b0d15961f33f0 [2882/2882] can: mcp251xfd: fix infinite loop when xmit fails
config: x86_64-randconfig-123-20250502 (https://download.01.org/0day-ci/archive/20250502/202505020705.McaLXQv7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020705.McaLXQv7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020705.McaLXQv7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:2327:6: sparse: sparse: symbol 'mcp251xfd_tx_obj_write_sync' was not declared. Should it be static?

vim +/mcp251xfd_tx_obj_write_sync +2327 drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c

  2326	
> 2327	void mcp251xfd_tx_obj_write_sync(struct work_struct *work)
  2328	{
  2329		struct mcp251xfd_priv *priv = container_of(work, struct mcp251xfd_priv,
  2330				tx_work);
  2331		struct mcp251xfd_tx_obj *tx_obj = priv->tx_work_obj;
  2332		struct mcp251xfd_tx_ring *tx_ring = priv->tx;
  2333		int err;
  2334	
  2335		err = spi_sync(priv->spi, &tx_obj->msg);
  2336		if (err)
  2337			mcp251xfd_tx_failure_drop(priv, tx_ring, err);
  2338	}
  2339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

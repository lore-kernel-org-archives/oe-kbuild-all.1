Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5911C4A21
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729766152; cv=none; b=GZsAJMsGz9hbJYRuXxo4efrg9BYe9wa3mwuKlm40uUfH0rdZqcUy4P8H25QXkfUAbwjkzD1evlJa+a9assS8EudcYKFzFNznfdUcGbk1ZheLRqmbgRdJ8/QTVgMfoN3w7XMSYm1kfOQiZFBNJIy6viknoNSyxNNjgmlcmxN5Ib0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729766152; c=relaxed/simple;
	bh=TsVN4caaclHz+0nAWuRb+YFw07gjOl33hTWH0yYAA5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EGqpXofrBGKmz0da0LDdlZ1Xjrj/d/sfusqwdl7Pu1Rex2IeDgcIqTw/lYF59fsZOmU4JrX1f9B4/kuygJns+hXCCHg+YSZmTmK4viUu46/WMycGM3c1ZdIxY452e7+vbE99qqmlDzZGu1V2eUBJ5D3/5sHNetniUKCrWhIOWwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SxgNkNHq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SxgNkNHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729766150; x=1761302150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TsVN4caaclHz+0nAWuRb+YFw07gjOl33hTWH0yYAA5E=;
  b=SxgNkNHqQ1ZnjMMSLUPkewJRcqvvoc827kD9B6HY6U7kfByARSWGo3zd
   9YfpIg3Ng9APF5+KuJat1vX3vS0y5VzmlIBcTNTgNhoDTVp2wy3TL8JFW
   LH4n4G7H7Rj8UDWwpNC/gMuy3dqewkH3M0DHY19M+WcrQlMKgiqCP4buK
   0wyb4cZG7GyMTB7h3YZ5wnsTaJxjSg0JXYP1mXmMTe7d9Vpn4C76OOlxg
   SwMxDjDBfF6y+lz/ByjjaVfa4WfyUslW22WQXZ/pEvpnqISwtpEyxwRd4
   UOdmxwy4XURjINcKlb+WCCKnetVZIU0xo5ONtSfeXC0yYIaqbzV1/9nHG
   Q==;
X-CSE-ConnectionGUID: Xre1WRLGSoWYVrlHTIa6ag==
X-CSE-MsgGUID: AS8zcD3FTJqVSpYtQSq/cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="39999283"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="39999283"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 03:35:49 -0700
X-CSE-ConnectionGUID: HNvxK5PmTzmLirLRN6RaxA==
X-CSE-MsgGUID: vfyR8aQ7R42GDXY2w/C2mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80541002"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Oct 2024 03:35:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3vBx-000WH4-23;
	Thu, 24 Oct 2024 10:35:45 +0000
Date: Thu, 24 Oct 2024 18:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28544/30000]
 drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:2327:6: warning: no previous
 prototype for 'mcp251xfd_tx_obj_write_sync'
Message-ID: <202410241814.11iTrBh6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vitor,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   52e62ae625fcfe934330b24239cf61af5b5ce33f
commit: b4eaf3e808dc2abcab55bc72df3b0d15961f33f0 [28544/30000] can: mcp251xfd: fix infinite loop when xmit fails
config: x86_64-buildonly-randconfig-006-20241024 (https://download.01.org/0day-ci/archive/20241024/202410241814.11iTrBh6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241814.11iTrBh6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241814.11iTrBh6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:2327:6: warning: no previous prototype for 'mcp251xfd_tx_obj_write_sync' [-Wmissing-prototypes]
    2327 | void mcp251xfd_tx_obj_write_sync(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


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

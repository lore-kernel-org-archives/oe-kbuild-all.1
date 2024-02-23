Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4191E370
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708698659; cv=none; b=p40XMqiV/uhQRTAAf5q65YPPLjrgki9LHa6sbK5lW+HWGNjmoYKH8xYUQtUHRC1qxOXVeCGR9OgD6xJTMqxKV1PxzmOb6eaSriHUHM+LlbYTcv7C+oGHoGVfkEf6BCvYCFE8am4FG1C6fauDC25IglVMDT2lmbQcXGXdChOXrdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708698659; c=relaxed/simple;
	bh=nprHxi7nRQyqDbjjUxQ6Dhy9HlAav5TOboMpuCzehdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S0uso0dRJOUm8nrjmvvRH8hsE08oqGcgsxB75RdUYn2vcHbDszF4H+x7GBccMxW7kMtVLK1Td16upd0bt4vt5khc/vidTVOGpd5BhpL5iekv8lTE6caKnsOu0qRoCXrpBxJ4Je7LpCxQT/OW9xBGiMNr4BEEx+5M22ZgstK7vm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/AEHiQR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/AEHiQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708698658; x=1740234658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nprHxi7nRQyqDbjjUxQ6Dhy9HlAav5TOboMpuCzehdM=;
  b=l/AEHiQRUrLZQab3A8S+4X/zPbILyS4lpe9ylESylFhEX1nYuEAruwm9
   Gl7O9sKRO0p6AL1J6dxOlwQovwprWWJHvH74bub5OSJWb6TGDeRH/Anek
   cpGI/RttgY9D/8nRjOA6Ji44vA+5lAUGE0qpXdO514+RCP67ORtPr1atB
   oxWEHoqysmHTHjMO9yTMpHhOCg65L3t7fyR32vL3dTWsr9+IMC+TCWUhr
   VfOAgthiwfd4ElFYFdveFk+j4ndxftYVFy09wZ0VcAn2pLS8ITvBINYf4
   Ldm0G82RpfoEZmN1K+YwAt15T/yrlghBG88SizsaIr7UE9jElytEExr83
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="3142897"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="3142897"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 06:30:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6401487"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Feb 2024 06:30:56 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdWZh-0007aK-26;
	Fri, 23 Feb 2024 14:30:53 +0000
Date: Fri, 23 Feb 2024 22:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie-new 69/69]
 drivers/net/ethernet/intel/idpf/idpf_xsk.c:17: warning: Function parameter
 or struct member 'bpf' not described in 'idpf_xsk_pool_setup'
Message-ID: <202402232216.bltgkIYD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   25ff57bb2413a883d28d963dcb65bf104615c47c
commit: 2bb79d2c23d6957a101a3af2b5e5c383f66954cf [69/69] idpf: add XSk pool initialization
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240223/202402232216.bltgkIYD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402232216.bltgkIYD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402232216.bltgkIYD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_xsk.c:17: warning: Function parameter or struct member 'bpf' not described in 'idpf_xsk_pool_setup'
>> drivers/net/ethernet/intel/idpf/idpf_xsk.c:17: warning: Excess function parameter 'xdp' description in 'idpf_xsk_pool_setup'
--
>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:1181: warning: expecting prototype for idpf_qp_ena(). Prototype was for idpf_qp_enable() instead


vim +17 drivers/net/ethernet/intel/idpf/idpf_xsk.c

     8	
     9	/**
    10	 * idpf_xsk_pool_setup - set up an XSk pool
    11	 * @vport: current vport of interest
    12	 * @xdp: pointer to the pool data
    13	 *
    14	 * Return: 0 on success, -errno on failure.
    15	 */
    16	int idpf_xsk_pool_setup(struct idpf_vport *vport, struct netdev_bpf *bpf)
  > 17	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

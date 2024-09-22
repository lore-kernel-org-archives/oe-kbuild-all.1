Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0688780025
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 23:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727047521; cv=none; b=UsviHEMM6a5oKSVZFIrs6CqmQAyFnxMrQdUY1IUdzch6bRwOnEAX8vUzvtu0c79JBH3tF9JfQsELzo3kH1vTFltwidS6AklGGEeGw3biCXjRMVyx4RUEPvRtqUjYYtO7/KbhRrJdJqUEBNN42faWGGxPNQT2t1tPYTx8yD4mB0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727047521; c=relaxed/simple;
	bh=NxMcBu7+GBjrjyOfU3IGCdIMCuF8ZxWegGA469wuO/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ekvbO5exUsNn3d1A8aTSpmWBryGvLqc7B8QXcKL2ZTfjk63zaS5bdtojOWgC4KLC6l4vZJwbqUOAWadEltGJklZTvqWsBXctCeQbwjeMY1QW/n+eQEIlPuuHcJ/0prGBsleHmNo+yeVjnlu5Qv13nt3m60paxVwS5EfLk6ZB6dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHA+pMHV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHA+pMHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727047519; x=1758583519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NxMcBu7+GBjrjyOfU3IGCdIMCuF8ZxWegGA469wuO/E=;
  b=hHA+pMHVTjZ1zW9xgLzhzHktGQ0DJMP8oBhzpOhiGk6Gt1DPmo7NHpbS
   4b0Lrj+PVUzgk9aWL4c8L/dlatLh5T1LNhiTVaRncS19dVk2ZqbLFrmaV
   cFkSdgsh7lxG/pQlyC+CmyIytDK8pY4JcEvJkTS3S9ctAOy8r2NDdDEMw
   srTUJ1VcLGreDg2iBn5jazoT9Aw6rgdxJjlBYC3Jy/TsMewst3ew1Lh0H
   ZSVFcLTrn5B5IDElhu1rbDFwiDL4lBx0TDPXlhq2lfD+S0fk8f6Ik4DNS
   S1n10u+08yVGu3WQWgSCIf/XwojkVtw2OaH1N9u2ghjXbw4pyA57FcUvc
   Q==;
X-CSE-ConnectionGUID: /RfTSeslSFuY/3qhsAlEFw==
X-CSE-MsgGUID: TFRnvU5OS3qiYzoWIDA7lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36554357"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="36554357"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 16:25:17 -0700
X-CSE-ConnectionGUID: A0ENXGNKQEGFKZID32XxjA==
X-CSE-MsgGUID: SvFr5JmIRiuswkjix4Ks1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="101735250"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Sep 2024 16:25:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssVx2-000Gja-19;
	Sun, 22 Sep 2024 23:25:12 +0000
Date: Mon, 23 Sep 2024 07:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg_trace_v4_5c 69/99]
 drivers/net/bonding/bond_3ad.c:860:9: sparse: sparse: Initializer entry
 defined twice
Message-ID: <202409230701.XVpUDpN3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyndbg_trace_v4_5c
head:   215f1e90281215ee6e5cddaa1a4fbe1dbb4e4c9b
commit: 523772afc85127a8125cbe2b14e99a4b9e0756a7 [69/99] dyndbg: move flags field to a new structure
config: i386-randconfig-062-20240922 (https://download.01.org/0day-ci/archive/20240923/202409230701.XVpUDpN3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409230701.XVpUDpN3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409230701.XVpUDpN3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/bonding/bond_3ad.c:860:9: sparse: sparse: Initializer entry defined twice
   drivers/net/bonding/bond_3ad.c:860:9: sparse:   also defined here
--
   drivers/infiniband/hw/cxgb4/cq.c: note: in included file:
>> drivers/infiniband/hw/cxgb4/iw_cxgb4.h:296:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:296:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:228:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:228:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:280:17: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:280:17: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/cq.c:418:36: sparse: sparse: context imbalance in 'c4iw_flush_hw_cq' - unexpected unlock
   drivers/infiniband/hw/cxgb4/cq.c:946:9: sparse: sparse: context imbalance in 'c4iw_poll_cq_one' - different lock contexts for basic block
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:568:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:568:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/cq.c: note: in included file (through include/linux/smp.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   drivers/infiniband/hw/cxgb4/mem.c: note: in included file:
>> drivers/infiniband/hw/cxgb4/iw_cxgb4.h:296:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:296:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:228:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:228:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:280:17: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:280:17: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here
--
   drivers/infiniband/hw/cxgb4/qp.c: note: in included file (through drivers/infiniband/hw/cxgb4/t4.h, drivers/infiniband/hw/cxgb4/iw_cxgb4.h):
   drivers/infiniband/hw/cxgb4/t4fw_ri_api.h:558:17: sparse: sparse: array of flexible structures
   drivers/infiniband/hw/cxgb4/t4fw_ri_api.h:559:17: sparse: sparse: array of flexible structures
   drivers/infiniband/hw/cxgb4/t4fw_ri_api.h:575:17: sparse: sparse: array of flexible structures
   drivers/infiniband/hw/cxgb4/t4fw_ri_api.h:576:17: sparse: sparse: array of flexible structures
   drivers/infiniband/hw/cxgb4/t4fw_ri_api.h:610:17: sparse: sparse: array of flexible structures
   drivers/infiniband/hw/cxgb4/t4fw_ri_api.h:611:17: sparse: sparse: array of flexible structures
   drivers/infiniband/hw/cxgb4/qp.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   drivers/infiniband/hw/cxgb4/qp.c: note: in included file (through drivers/infiniband/hw/cxgb4/iw_cxgb4.h):
>> drivers/infiniband/hw/cxgb4/t4.h:608:25: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/t4.h:608:25: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/t4.h:613:25: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/t4.h:613:25: sparse:   also defined here
>> drivers/infiniband/hw/cxgb4/t4.h:608:25: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/t4.h:608:25: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/t4.h:613:25: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/t4.h:613:25: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/t4.h:633:25: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/t4.h:633:25: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/t4.h:638:25: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/t4.h:638:25: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/qp.c:1615:39: sparse: sparse: context imbalance in '__flush_qp' - different lock contexts for basic block
   drivers/infiniband/hw/cxgb4/qp.c: note: in included file:
>> drivers/infiniband/hw/cxgb4/iw_cxgb4.h:296:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:296:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:228:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:228:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:280:17: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:280:17: sparse:   also defined here
>> drivers/infiniband/hw/cxgb4/iw_cxgb4.h:296:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:296:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:228:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:228:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:280:17: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:280:17: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:568:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:568:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:568:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:568:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:568:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:568:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:568:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:568:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/qp.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   drivers/infiniband/hw/cxgb4/qp.c: note: in included file:
>> drivers/infiniband/hw/cxgb4/iw_cxgb4.h:296:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:296:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:228:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:228:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:280:17: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:280:17: sparse:   also defined here
>> drivers/infiniband/hw/cxgb4/iw_cxgb4.h:296:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:296:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:228:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:228:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:280:17: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:280:17: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:568:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:568:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:568:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:568:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here
   drivers/infiniband/hw/cxgb4/qp.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   drivers/infiniband/hw/cxgb4/qp.c: note: in included file:
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/cxgb4/iw_cxgb4.h:220:9: sparse:   also defined here

vim +860 drivers/net/bonding/bond_3ad.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  837  
^1da177e4c3f41 Linus Torvalds      2005-04-16  838  /**
^1da177e4c3f41 Linus Torvalds      2005-04-16  839   * __update_lacpdu_from_port - update a port's lacpdu fields
^1da177e4c3f41 Linus Torvalds      2005-04-16  840   * @port: the port we're looking at
^1da177e4c3f41 Linus Torvalds      2005-04-16  841   */
^1da177e4c3f41 Linus Torvalds      2005-04-16  842  static inline void __update_lacpdu_from_port(struct port *port)
^1da177e4c3f41 Linus Torvalds      2005-04-16  843  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  844  	struct lacpdu *lacpdu = &port->lacpdu;
3b5b35d0226458 Holger Eitzenberger 2008-12-17  845  	const struct port_params *partner = &port->partner_oper;
^1da177e4c3f41 Linus Torvalds      2005-04-16  846  
3bf2d28a2d7112 Veaceslav Falico    2014-01-08  847  	/* update current actual Actor parameters
3bf2d28a2d7112 Veaceslav Falico    2014-01-08  848  	 * lacpdu->subtype                   initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16  849  	 * lacpdu->version_number            initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16  850  	 * lacpdu->tlv_type_actor_info       initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16  851  	 * lacpdu->actor_information_length  initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16  852  	 */
^1da177e4c3f41 Linus Torvalds      2005-04-16  853  
d3bb52b0948cf1 Al Viro             2007-08-22  854  	lacpdu->actor_system_priority = htons(port->actor_system_priority);
^1da177e4c3f41 Linus Torvalds      2005-04-16  855  	lacpdu->actor_system = port->actor_system;
d3bb52b0948cf1 Al Viro             2007-08-22  856  	lacpdu->actor_key = htons(port->actor_oper_port_key);
d3bb52b0948cf1 Al Viro             2007-08-22  857  	lacpdu->actor_port_priority = htons(port->actor_port_priority);
d3bb52b0948cf1 Al Viro             2007-08-22  858  	lacpdu->actor_port = htons(port->actor_port_number);
^1da177e4c3f41 Linus Torvalds      2005-04-16  859  	lacpdu->actor_state = port->actor_oper_port_state;
17720981964ac5 Jarod Wilson        2019-06-07 @860  	slave_dbg(port->slave->bond->dev, port->slave->dev,
17720981964ac5 Jarod Wilson        2019-06-07  861  		  "update lacpdu: actor port state %x\n",
17720981964ac5 Jarod Wilson        2019-06-07  862  		  port->actor_oper_port_state);
^1da177e4c3f41 Linus Torvalds      2005-04-16  863  
^1da177e4c3f41 Linus Torvalds      2005-04-16  864  	/* lacpdu->reserved_3_1              initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16  865  	 * lacpdu->tlv_type_partner_info     initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16  866  	 * lacpdu->partner_information_length initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16  867  	 */
^1da177e4c3f41 Linus Torvalds      2005-04-16  868  
3b5b35d0226458 Holger Eitzenberger 2008-12-17  869  	lacpdu->partner_system_priority = htons(partner->system_priority);
3b5b35d0226458 Holger Eitzenberger 2008-12-17  870  	lacpdu->partner_system = partner->system;
3b5b35d0226458 Holger Eitzenberger 2008-12-17  871  	lacpdu->partner_key = htons(partner->key);
3b5b35d0226458 Holger Eitzenberger 2008-12-17  872  	lacpdu->partner_port_priority = htons(partner->port_priority);
3b5b35d0226458 Holger Eitzenberger 2008-12-17  873  	lacpdu->partner_port = htons(partner->port_number);
3b5b35d0226458 Holger Eitzenberger 2008-12-17  874  	lacpdu->partner_state = partner->port_state;
^1da177e4c3f41 Linus Torvalds      2005-04-16  875  
^1da177e4c3f41 Linus Torvalds      2005-04-16  876  	/* lacpdu->reserved_3_2              initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16  877  	 * lacpdu->tlv_type_collector_info   initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16  878  	 * lacpdu->collector_information_length initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16  879  	 * collector_max_delay                initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16  880  	 * reserved_12[12]                   initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16  881  	 * tlv_type_terminator               initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16  882  	 * terminator_length                 initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16  883  	 * reserved_50[50]                   initialized
^1da177e4c3f41 Linus Torvalds      2005-04-16  884  	 */
^1da177e4c3f41 Linus Torvalds      2005-04-16  885  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  886  

:::::: The code at line 860 was first introduced by commit
:::::: 17720981964ac5dd2a501c2e8a63da21046eb89b bonding/802.3ad: convert to using slave printk macros

:::::: TO: Jarod Wilson <jarod@redhat.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

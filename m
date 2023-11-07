Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D226D328D4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzQboQw4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699374623; x=1730910623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LaOj0UMjIBVnSbmK+cV1dPycguI9g55EJn4/5eP4td8=;
  b=AzQboQw4C/kw+ekyRi0DIg6JcDJ3VH8WeTS6QNxqt2hodlly/yK+ebDB
   01nlx/LGvLklD6ivI6muzggHqFg/c7kUiYXrS9Ay3aIRFWNoU+Uu4t4Sf
   H3ffnN6P43xQLW/TkCPs8/FlooUQrb1lk14O8LZhQa8jdl7GDLbBkz7fq
   0qcmb4sSS6zSfItWEq67cOUt2Z02kqxNanoGIcjMPcQ23O0yGnxkEF2iN
   9uFjKKwowUfNY23cY/wcbx0qE9/51+Py2IM6z98KnWkKqkUXeX1SE3izR
   DHVQLVQE2H5gAh6UTgZtQ18c70FcV8vBLYwOWPcinuVNfoiNfQ2pGsqec
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="379942832"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="379942832"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 08:30:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="886346683"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="886346683"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Nov 2023 08:30:22 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Oy3-0007DU-38;
	Tue, 07 Nov 2023 16:30:19 +0000
Date: Wed, 8 Nov 2023 00:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/start-BRA-support 27/36]
 drivers/soundwire/generic_bandwidth_allocation.c:91:27: warning: variable
 'ch' set but not used
Message-ID: <202311072357.R1Xg8jUW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/start-BRA-support
head:   323f5fb8f3c77e92ea00a9662b7ac1c569ceff66
commit: 53cbd7080008f2f8a6263dd4ce78226a8f1afe57 [27/36] soundwire: stream: special-case the bus compute_params() routine
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231107/202311072357.R1Xg8jUW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311072357.R1Xg8jUW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311072357.R1Xg8jUW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soundwire/generic_bandwidth_allocation.c: In function 'sdw_compute_slave_dp0_ports':
>> drivers/soundwire/generic_bandwidth_allocation.c:91:27: warning: variable 'ch' set but not used [-Wunused-but-set-variable]
      91 |         unsigned int bps, ch;
         |                           ^~
   drivers/soundwire/generic_bandwidth_allocation.c: In function 'sdw_compute_dp0_master_ports':
   drivers/soundwire/generic_bandwidth_allocation.c:122:22: warning: variable 'ch' set but not used [-Wunused-but-set-variable]
     122 |         unsigned int ch;
         |                      ^~
--
>> drivers/soundwire/generic_bandwidth_allocation.c:478: warning: Function parameter or member 'bpt_stream' not described in 'sdw_compute_params'


vim +/ch +91 drivers/soundwire/generic_bandwidth_allocation.c

    83	
    84	static void sdw_compute_slave_dp0_ports(struct sdw_master_runtime *m_rt,
    85						struct sdw_transport_data *t_data)
    86	{
    87		struct sdw_slave_runtime *s_rt = NULL;
    88		struct sdw_port_runtime *p_rt;
    89		int port_bo;
    90		int sample_int;
  > 91		unsigned int bps, ch;
    92	
    93		port_bo = t_data->block_offset;
    94		ch = 1;
    95		bps = m_rt->bus->params.col - 1;
    96		sample_int = m_rt->bus->params.col;
    97	
    98		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
    99			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
   100				sdw_fill_xport_params(&p_rt->transport_params,
   101						      p_rt->num, false,
   102						      SDW_BLK_GRP_CNT_1,
   103						      sample_int, port_bo, port_bo >> 8,
   104						      t_data->hstart,
   105						      t_data->hstop,
   106						      SDW_BLK_PKG_PER_PORT, 0x0);
   107	
   108				sdw_fill_port_params(&p_rt->port_params,
   109						     p_rt->num, bps,
   110						     SDW_PORT_FLOW_MODE_ISOCH,
   111						     SDW_PORT_DATA_MODE_NORMAL);
   112			}
   113		}
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

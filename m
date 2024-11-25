Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB582AD17
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732529741; cv=none; b=kPcA4oFUyT81n4WGNzx77Y72B81ooK6utHbLnaf8Tj18UycbP9r/b9NIqLeB2Nvpx4tbSxytLxHGDtn9FUmSat63krPaxT2KXzQNEHDFKQh6m9CZsdjvs2biRgnkaLiz7B4NJJuseTZv2NhTrzRnK5lEi3+er86u71N4tFXvdUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732529741; c=relaxed/simple;
	bh=6gHkv/+m93bJC54oB/TUSHwpMuPLU34ULPsu42YDt+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f027Z1UvtEQEyDXxiD8N9akLZlzBo964S8Z3Od9yQKdpq6qjkXveXGNc+asTOhLT3hlPDYRD5WzJ14akkZJ6UMmKguwy2EM4zrvnHaSy/r4eLteHCf7N2XspKS6A9pk65DaT5MiYlhS1eFjYI+c544XyedSjdwizAsi9V6UwKbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TObeORXu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TObeORXu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732529739; x=1764065739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6gHkv/+m93bJC54oB/TUSHwpMuPLU34ULPsu42YDt+o=;
  b=TObeORXuxrs6OHIzGLxLpudfojX9PTAuwrtYKn1Hrzg5GrKdR6PjVTSd
   zO0PqnswSIDjZeXlykjKfbJmq4KR6XcwxeiTSGPy4YVYPVvj9f9WZe2k9
   E/BhCeZddbNy3ICp4eCo0MgBWcNZlC+666K8sHfnl1b/zHOjkDMAHYxP8
   Dy5SlVO5cxw4YKYFus7/rP6xQHQyztUfpxX77CTNEU48Ewnwt9GBm9qhr
   Jirh+/racaMkUjeRiOmDSIBeJ19NOD5cCDslNh3ztQk6cyLez4kNYJXXh
   e3eECP7M99QQEInJK/v8cE0JGunoq+5ObkLQHzFhqHjcD4YmEkqvov4+x
   w==;
X-CSE-ConnectionGUID: rQcYxXeRRACm7MA1lr1RVQ==
X-CSE-MsgGUID: K/DvFrTXQSOfCDWgRgortQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32775355"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="32775355"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 02:15:37 -0800
X-CSE-ConnectionGUID: LraswzpYS+SkL62oLOwUKw==
X-CSE-MsgGUID: LaHUSUs8QSWVY06WO+8t8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91636258"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2024 02:15:37 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFW7y-00068n-23;
	Mon, 25 Nov 2024 10:15:34 +0000
Date: Mon, 25 Nov 2024 18:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Junxian Huang <huangjunxian6@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 07/12] RDMA/siw: Remove deliver net device event
Message-ID: <202411251727.RFxtcpiI-lkp@intel.com>
References: <20241122105308.2150505-8-huangjunxian6@hisilicon.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122105308.2150505-8-huangjunxian6@hisilicon.com>

Hi Junxian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rdma/for-next]
[cannot apply to linus/master v6.12 next-20241125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Junxian-Huang/RDMA-core-Add-ib_query_netdev_port-to-query-netdev-port-by-IB-device/20241125-101856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/20241122105308.2150505-8-huangjunxian6%40hisilicon.com
patch subject: [PATCH RFC 07/12] RDMA/siw: Remove deliver net device event
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241125/202411251727.RFxtcpiI-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251727.RFxtcpiI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251727.RFxtcpiI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/infiniband/sw/siw/siw_verbs.c: In function 'siw_query_port':
>> drivers/infiniband/sw/siw/siw_verbs.c:186:52: error: 'struct siw_device' has no member named 'ndev'; did you mean 'netdev'?
     186 |         attr->state = ib_get_curr_port_state(sdev->ndev);
         |                                                    ^~~~
         |                                                    netdev


vim +186 drivers/infiniband/sw/siw/siw_verbs.c

   170	
   171	int siw_query_port(struct ib_device *base_dev, u32 port,
   172			   struct ib_port_attr *attr)
   173	{
   174		struct siw_device *sdev = to_siw_dev(base_dev);
   175		int rv;
   176	
   177		memset(attr, 0, sizeof(*attr));
   178	
   179		rv = ib_get_eth_speed(base_dev, port, &attr->active_speed,
   180				 &attr->active_width);
   181		attr->gid_tbl_len = 1;
   182		attr->max_msg_sz = -1;
   183		attr->max_mtu = ib_mtu_int_to_enum(sdev->netdev->mtu);
   184		attr->active_mtu = ib_mtu_int_to_enum(sdev->netdev->mtu);
   185		attr->port_cap_flags = IB_PORT_CM_SUP | IB_PORT_DEVICE_MGMT_SUP;
 > 186		attr->state = ib_get_curr_port_state(sdev->ndev);
   187		attr->phys_state = attr->state == IB_PORT_ACTIVE ?
   188			IB_PORT_PHYS_STATE_LINK_UP : IB_PORT_PHYS_STATE_DISABLED;
   189		/*
   190		 * All zero
   191		 *
   192		 * attr->lid = 0;
   193		 * attr->bad_pkey_cntr = 0;
   194		 * attr->qkey_viol_cntr = 0;
   195		 * attr->sm_lid = 0;
   196		 * attr->lmc = 0;
   197		 * attr->max_vl_num = 0;
   198		 * attr->sm_sl = 0;
   199		 * attr->subnet_timeout = 0;
   200		 * attr->init_type_repy = 0;
   201		 */
   202		return rv;
   203	}
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

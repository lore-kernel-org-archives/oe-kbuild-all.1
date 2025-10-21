Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889451C8611
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 23:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761090517; cv=none; b=TYCMZlhbKmgrmtToUUFVUwDm3i0IYSYTw4oTh5Xp6z91xmMtWCHmFpg+G2/u3K1V10MMqqcb8q0GW/3o8O+aiKn0YsNkrPnhMxvnfWn7f2WVL6C1iERRjNaQIyVBes/OPgrW4wJARkPXMpEr6iSPaCf5C2KXMbFXmwblaK9Gduc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761090517; c=relaxed/simple;
	bh=dcV8dFTzJ4V0uPx0dvcKlVCI2vddLUhDfO9MCHIj3fY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L4m2sGC53TYpqDu4LDZNP3CewcaDdcRW2IDFPvQUF9tDxN3NMO2rY2z98c8qjsVevwJBr+WdwvjU13B0aLD+dYqi/u7HctvXgme/FfKHSkAdU1yQrio6b7JAIWYpoGD833nQHWZyV5n7mVacNQLpTu1bL5W8dZHCo4Vr4GGf7/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMqCyrdq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMqCyrdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761090516; x=1792626516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dcV8dFTzJ4V0uPx0dvcKlVCI2vddLUhDfO9MCHIj3fY=;
  b=lMqCyrdqOAM4tZx6aiBClHj3q9V2+3qLR4RwzVQCKP7466GRR/iRlmAL
   0sqECX4CYsFvFMxDwOpW1IF5PHs+92O8EhLjWPQOMMJGi5sWAxd5IMxqa
   jyes3bptXxSedr6h6sbqZgNaQCSBLQiH881QrW/iL1b4zdu+IPPF+1owi
   50ZiUrFw3rekgJbMvezjCwS9Ix60aFq17HLfp2T3BmZ74JNd/w3CRRW8/
   bSE2ia5232uxS1y3tUu0GCeCW8iVP+bmJsDfYnIyx2dWHW5cdpwXd5FDI
   t8ffWuBjo69axY04Jn1ldZHqvozJgvV8DoJUmn83lKos56UT+9wJKVxwp
   g==;
X-CSE-ConnectionGUID: kCqtNoPxQDq7zhIQgaLDUg==
X-CSE-MsgGUID: uMTa5mySTNWJSZuhV4mIaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74666932"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="74666932"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 16:48:35 -0700
X-CSE-ConnectionGUID: Qj4eOTR4Q7uAyjPqhB7MhQ==
X-CSE-MsgGUID: iqAt+lHVQD6d9ZG6jqWxIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="183750468"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 21 Oct 2025 16:48:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBM5f-000Bpt-2q;
	Tue, 21 Oct 2025 23:48:31 +0000
Date: Wed, 22 Oct 2025 07:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:libeth 7/7] ld:
 drivers/net/ethernet/intel/ice/ice_switch.o:(.rodata+0x1da0): multiple
 definition of `ice_queue_mgmt_ops';
 drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined
 here
Message-ID: <202510220715.pi4OTktd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux libeth
head:   cb251653bf74723c653ae96a5b5a97e57dcc7b18
commit: cb251653bf74723c653ae96a5b5a97e57dcc7b18 [7/7] ice: implement Rx queue management ops
config: x86_64-buildonly-randconfig-005-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220715.pi4OTktd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220715.pi4OTktd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220715.pi4OTktd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/net/ethernet/intel/ice/ice_switch.o:(.rodata+0x1da0): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_base.o:(.rodata+0x60): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_lib.o:(.rodata+0x420): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_txrx_lib.o:(.rodata+0x20): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_txrx.o:(.rodata+0x0): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_irq.o:(.rodata+0x20): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_vsi_vlan_ops.o:(.rodata+0x80): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_vsi_vlan_lib.o:(.rodata+0x0): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_ethtool_fdir.o:(.rodata+0x80): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_idc.o:(.rodata+0x0): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/devlink/devlink.o:(.rodata+0x1160): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/devlink/port.o:(.rodata+0x640): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_sf_eth.o:(.rodata+0x400): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_fw_update.o:(.rodata+0x940): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_lag.o:(.rodata+0x220): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_ethtool.o:(.rodata+0x1700): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_repr.o:(.rodata+0x5c0): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_tc_lib.o:(.rodata+0x6c0): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_sriov.o:(.rodata+0xc0): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/virt/fdir.o:(.rodata+0x440): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/virt/queues.o:(.rodata+0x20): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/virt/virtchnl.o:(.rodata+0x320): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_vf_lib.o:(.rodata+0x60): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_dcb_nl.o:(.rodata+0x2e0): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_dcb_lib.o:(.rodata+0x80): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_xsk.o:(.rodata+0x0): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here
   ld: drivers/net/ethernet/intel/ice/ice_gnss.o:(.rodata+0x40): multiple definition of `ice_queue_mgmt_ops'; drivers/net/ethernet/intel/ice/ice_main.o:(.rodata+0x1400): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

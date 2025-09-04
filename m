Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204583314C2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 17:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757008423; cv=none; b=fD93Qc+GNbcqK+PwXH/btgYPnnmgL/Qek0IPJrKlNmJ6++bNCdiZi00ittKQGQCKXIczT1MKPExPS23KOnVKnJwVhLVK8kd46abbCg22lh+n/B/gswKCr+TYpGetTvjVWTlKZGUvDFQRfCENvY32rTDIG2WURqu5nu81vLX4iUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757008423; c=relaxed/simple;
	bh=JlgvOsLBEGNZdVik86vD72io0XPzFAMX1kVftnD9V4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bhPdV+p2rndvTEh68gyiHGuttMIxVT9C8V5srVApuv7e5sAA4KU/9L2QylHX/9a6ER+Ie97hvWgIi92U0vglwdDc6DgXqqfOkaveRr9wB9Uq8uqyf8HwODo+2Mett4iDMmLa9pQoXHi1lel2z3bBz+AWUC+Q9k3plgp9M62iNCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxjbTLku; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxjbTLku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757008422; x=1788544422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JlgvOsLBEGNZdVik86vD72io0XPzFAMX1kVftnD9V4g=;
  b=UxjbTLkuabfukthxiKyhcGzA6LNZqus3AI2BFWdvc8oCa5QljZV0dXmt
   OnRdFmCpJb2AIYpJQEpZegKiQrW1iW3EzhvQqhotkRqnbJw07+FpzGn/e
   jQl9MOx1uMBy4IS01JAE3XbbUBJYt7RReCzf88QR9p51l1ZP6BqJOIE3C
   f240mLituJS8MWU1rX0jcfKvsm3bXcIxLvlyQ8f5b6pwyQ1ZKVXTAbQqY
   TA9J4gX0lPNXxXsBqxI7VsVk660M1LEG/3xDhGNJQ8/rgjQVvrPVebjLC
   wRvnXw4nGoT9X/3eIy1gflJZjFTRuchEIbr/T57l2NnuGp0Mdwv/BDXBV
   w==;
X-CSE-ConnectionGUID: IQrKSvbkQ+q+TBwWfYTjpw==
X-CSE-MsgGUID: XccbLS3/R1yuKvJqT1PYNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="58571585"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="58571585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 10:53:41 -0700
X-CSE-ConnectionGUID: KvDeaxpmQKSG7fJmf1oEmw==
X-CSE-MsgGUID: sZkfqS0qQFy+BvTRDCF7Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="176292586"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Sep 2025 10:53:41 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuE8i-0005Zz-1V;
	Thu, 04 Sep 2025 17:52:57 +0000
Date: Fri, 5 Sep 2025 01:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2853/2853]
 drivers/net/ethernet/motorcomm/yt6801/yt6801_main.c:751:23: error: use of
 undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
Message-ID: <202509050145.rJ98GKyh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4eddc7e6b3a11653b493da4617c18cdc2e6e6777
commit: 6460d9d3c42d1357c8292d7be5c26cb7b84e84d7 [2853/2853] yt6801: Add Motorcomm yt6801 PCIe driver
config: loongarch-randconfig-001-20250905 (https://download.01.org/0day-ci/archive/20250905/202509050145.rJ98GKyh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509050145.rJ98GKyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509050145.rJ98GKyh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/motorcomm/yt6801/yt6801_main.c:751:23: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
     751 |                 min_t(unsigned int, IEEE_8021QAZ_MAX_TCS, priv->rx_q_count);
         |                                     ^
   drivers/net/ethernet/motorcomm/yt6801/yt6801_main.c:752:8: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
     752 |         ppq = IEEE_8021QAZ_MAX_TCS / prio_queues;
         |               ^
   drivers/net/ethernet/motorcomm/yt6801/yt6801_main.c:753:14: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
     753 |         ppq_extra = IEEE_8021QAZ_MAX_TCS % prio_queues;
         |                     ^
   drivers/net/ethernet/motorcomm/yt6801/yt6801_main.c:1715:35: warning: variable 'mac_hfr2' set but not used [-Wunused-but-set-variable]
    1715 |         unsigned int mac_hfr0, mac_hfr1, mac_hfr2, mac_hfr3;
         |                                          ^
   1 warning and 3 errors generated.


vim +/IEEE_8021QAZ_MAX_TCS +751 drivers/net/ethernet/motorcomm/yt6801/yt6801_main.c

   742	
   743	static void fxgmac_config_queue_mapping(struct fxgmac_pdata *priv)
   744	{
   745		unsigned int ppq, ppq_extra, prio_queues;
   746		unsigned int __maybe_unused prio;
   747		unsigned int reg, val, mask;
   748	
   749		/* Map the 8 VLAN priority values to available MTL Rx queues */
   750		prio_queues =
 > 751			min_t(unsigned int, IEEE_8021QAZ_MAX_TCS, priv->rx_q_count);
   752		ppq = IEEE_8021QAZ_MAX_TCS / prio_queues;
   753		ppq_extra = IEEE_8021QAZ_MAX_TCS % prio_queues;
   754	
   755		reg = MAC_RQC2R;
   756		for (u32 i = 0, prio = 0; i < prio_queues;) {
   757			val = 0;
   758			mask = 0;
   759			for (u32 j = 0; j < ppq; j++) {
   760				mask |= (1 << prio);
   761				prio++;
   762			}
   763	
   764			if (i < ppq_extra) {
   765				mask |= (1 << prio);
   766				prio++;
   767			}
   768	
   769			val |= (mask << ((i++ % MAC_RQC2_Q_PER_REG) << 3));
   770	
   771			if ((i % MAC_RQC2_Q_PER_REG) && i != prio_queues)
   772				continue;
   773	
   774			fxgmac_io_wr(priv, reg, val);
   775			reg += MAC_RQC2_INC;
   776		}
   777	
   778		/* Configure one to one, MTL Rx queue to DMA Rx channel mapping
   779		 * ie Q0 <--> CH0, Q1 <--> CH1 ... Q7 <--> CH7
   780		 */
   781		val = fxgmac_io_rd(priv, MTL_RQDCM0R);
   782		val |= (MTL_RQDCM0R_Q0MDMACH | MTL_RQDCM0R_Q1MDMACH |
   783			MTL_RQDCM0R_Q2MDMACH | MTL_RQDCM0R_Q3MDMACH);
   784		fxgmac_io_wr(priv, MTL_RQDCM0R, val);
   785	
   786		val = fxgmac_io_rd(priv, MTL_RQDCM0R + MTL_RQDCM_INC);
   787		val |= (MTL_RQDCM1R_Q4MDMACH | MTL_RQDCM1R_Q5MDMACH |
   788			MTL_RQDCM1R_Q6MDMACH | MTL_RQDCM1R_Q7MDMACH);
   789		fxgmac_io_wr(priv, MTL_RQDCM0R + MTL_RQDCM_INC, val);
   790	}
   791	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

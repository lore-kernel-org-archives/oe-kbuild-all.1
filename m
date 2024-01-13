Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37051208C1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 11:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MokEWpta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705144247; x=1736680247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c9hmsv6Z3USNDwn8ImaW88RTBeqzmhiNLMrGN2wdQMY=;
  b=MokEWptafBcJWF4x2xYaBa7w3Op6AHnZ2l78zs3R4svm7mD7Ai3XF5Iv
   uf1YSTx+KRbz5AHGwjrM98FM16VWTtfHwVufP9Fm558lmXdscySW7dTnS
   z1hrmNgoF49baExBtiZPnFT2wPLOkdqWlgTpp9F9WotnKZ8Nf7H5zrqyo
   q96z1IJIq/7zW9DRUejg4mnZQkb+J2Vbm5HY2eQh+QHqaJUrDaeXv3F+B
   Ct30dA4fhapWulVpROYnfgFKEabXzL8Mu9hJ20CtzAaZOOJ3sESx4K/sY
   aows/7KoYpP0wqL5Tv47p7zAWJPbgCKbT8vr+nD92Q2Y27lXHiBCUX07q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="403136654"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="403136654"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 03:10:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="902245713"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="902245713"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2024 03:10:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rObuV-000AOa-0P;
	Sat, 13 Jan 2024 11:10:43 +0000
Date: Sat, 13 Jan 2024 19:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4456/17888]
 drivers/soc/fsl/dpio/qbman-portal.c:564: warning: Function parameter or
 member 'respond_success' not described in 'qbman_eq_desc_set_orp'
Message-ID: <202401131950.VVi1nVAq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: 38bfd641673c080db0b295d4341b49e3e0a5c206 [4456/17888] soc: fsl: dpio: Add Support for Order Restoration
config: arm64-randconfig-001-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131950.VVi1nVAq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131950.VVi1nVAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131950.VVi1nVAq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/fsl/dpio/qbman-portal.c:564: warning: Function parameter or member 'respond_success' not described in 'qbman_eq_desc_set_orp'
>> drivers/soc/fsl/dpio/qbman-portal.c:564: warning: Excess function parameter 'response_success' description in 'qbman_eq_desc_set_orp'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]


vim +564 drivers/soc/fsl/dpio/qbman-portal.c

   551	
   552	/**
   553	 * qbman_eq_desc_set_orp() - Set order-restoration in the enqueue descriptor
   554	 * @d: the enqueue descriptor.
   555	 * @response_success: 1 = enqueue with response always; 0 = enqueue with
   556	 * rejections returned on a FQ.
   557	 * @oprid: the order point record id.
   558	 * @seqnum: the order restoration sequence number.
   559	 * @incomplete: indicates whether this is the last fragments using the same
   560	 * sequence number.
   561	 */
   562	void qbman_eq_desc_set_orp(struct qbman_eq_desc *d, int respond_success,
   563				   u16 oprid, u16 seqnum, int incomplete)
 > 564	{
   565		d->verb |= (1 << QB_ENQUEUE_CMD_ORP_ENABLE_SHIFT);
   566		if (respond_success)
   567			d->verb |= enqueue_response_always;
   568		else
   569			d->verb |= enqueue_rejects_to_fq;
   570		d->orpid = cpu_to_le16(oprid);
   571		d->seqnum = cpu_to_le16((!!incomplete << 14) | seqnum);
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

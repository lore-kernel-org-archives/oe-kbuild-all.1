Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D058281E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 00:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540771; cv=none; b=CC+rrfPyGm7pqimdItbbZ6g8LtO9L7IYfaOvmDTKkqekkdFKCni9Es6wzXLNMd7qFt04foi6KbWlycYmuUaDppNkE/0nTHw8W3wHgzRivc+17Pk20Wu0WwOB54mRPjeVzhLPo+zSHLNrYwQ3HvF9lEzb1luEXgTT2pL0nY1d0UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540771; c=relaxed/simple;
	bh=Awi/poQdSATz3W1naLjySCMayop3HKDfX5afV+j1278=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W8sXFozbQmaePfyIxyx5U/pl/U//uRJhLNGxzEaXhK780MiP5wJomqdUY0HQlgrCfqgHkvx0dKeMXkuF6kVRGP/HxPL7QK8hNdt0PFchiTb41i0oqX1Ohs3A4KqmRzBFtEsY/3AnSV6Ko2zjHssxx1n476nY36zhDgjeeEYIbxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHGhHAup; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHGhHAup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745540769; x=1777076769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Awi/poQdSATz3W1naLjySCMayop3HKDfX5afV+j1278=;
  b=UHGhHAupuJzLrlcnpiNpu1Fcd2uhd+4KJmudN9C+QCJieZ0zuc8f+1Lq
   Rw28pSbANZjccGuSGiXrFoFn3CULJs/OL/1g9b+tSpcrQCJXmrZqudAJG
   xfRQwf74gqeleH4IkV0hDt6Wtl7+GbvRaWWdM1qHv+rjFS9Iu+8bvUsNd
   NVYIwFwh9SiPEefNJlpvpQdobtek02w0y30sAkQe8ifeFP4NM1mnNsmAs
   V/UNaKHXafFimmpcLSBPZWNBkeCP4r0Ob1DLxmr8taz0vDC7v9sqnKXZZ
   m5f8fM/7kTok/WnvhAgdEQ+dTL5JZZ1mJLpc7v0RcSNzQufCdV0jbkhGR
   w==;
X-CSE-ConnectionGUID: sRxn8+AQRRCfWdBXt0oQ5A==
X-CSE-MsgGUID: T48pkNXmThq45hJtT7ZUUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="64724702"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="64724702"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 17:26:09 -0700
X-CSE-ConnectionGUID: eirHkCcIRnG9/X3V+87bKQ==
X-CSE-MsgGUID: xquB7dADRmuWt76WXR6QZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="133072673"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Apr 2025 17:26:08 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u86tK-0004gO-0S;
	Fri, 25 Apr 2025 00:26:06 +0000
Date: Fri, 25 Apr 2025 08:25:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1593/1593] block/genhd.c:525: warning:
 Function parameter or member 'devt' not described in 'blk_invalidate_devt'
Message-ID: <202504250827.FCNrED1Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   08111f03f1ec65598372cfe9bf64f366d575671e
commit: 56b5af39e17ef421c545d43ca4d07995c30c93da [1593/1593] block: fix use-after-free on gendisk
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250425/202504250827.FCNrED1Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250827.FCNrED1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250827.FCNrED1Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/genhd.c:525: warning: Function parameter or member 'devt' not described in 'blk_invalidate_devt'


vim +525 block/genhd.c

   520	
   521	/**
   522	 *	We invalidate devt by assigning NULL pointer for devt in idr.
   523	 */
   524	void blk_invalidate_devt(dev_t devt)
 > 525	{
   526		if (MAJOR(devt) == BLOCK_EXT_MAJOR) {
   527			spin_lock_bh(&ext_devt_lock);
   528			idr_replace(&ext_devt_idr, NULL, blk_mangle_minor(MINOR(devt)));
   529			spin_unlock_bh(&ext_devt_lock);
   530		}
   531	}
   532	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

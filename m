Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE8628DB4D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 15:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747927021; cv=none; b=mPhRM1HcjAJtBF42EoCGIQs4tCjut9CQErfo/b+sDX6pb3xmoAgvAdbdVSlJMYUXXvd1vFG+d00Z3tCy7A/HoCBj4GQK7Fb2MVN/UwrnSqw8CE73BkTgxvhiWieTw39V9qxUXRX3K2ZocEl/DUWJldc3nBEKrGDBK9I2LRCrU3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747927021; c=relaxed/simple;
	bh=vVe79465iQGiU2u6AtYFaZu9aFcjbPka8ngvBL8VvHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JzNlUzn5aNBS8EsH8T1lgOs6N0h4OVG/9XYKAmcStgWvxFRugiqFv/B+x2Pj5SiOvp037FzRcCXQnGL9LX/+Q59mw6PbxICV219MDqeniiinQOpLK9XPAcT0NFMUlsB3STGjmdlFA5DUpLwYiFTlrPSDgAI+wX8ANAwMRVG9OwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azf4xNA6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azf4xNA6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747927020; x=1779463020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vVe79465iQGiU2u6AtYFaZu9aFcjbPka8ngvBL8VvHI=;
  b=azf4xNA6aDdcrrAd1Tjqt8qhV2jR8FwTMXTR8x0lyKGUqNkzM9z+hVca
   xmq6J4FG1fIVWTff/ruCm82feMh0wPqXnQMLle+P+nShlllZhc5f6ptcE
   jqAj330LkYQNfx40nqJ6Zs/ZCUAQUbOP6Mq2mWsMCPHiJU6QHfEhKstIe
   2SRH4Pb92kkypWJaYPRed8lRk48bvoHBjdYnLxb0xUEPMVNAnJ1QIKSt3
   RN8xceMxSZd65vlsAfy2RWxXl20mcPPu/xCefxcu+qy2C0QeEjQOXBHQJ
   8kI8UzJAjfjzbuY/YpsQOK7BolJdc+k9jWbcb9xWyXtY0EHppkBlNA+qZ
   Q==;
X-CSE-ConnectionGUID: JTYIRucqQ2SN9UAEwUn1xg==
X-CSE-MsgGUID: 95mRlOpvSAqfe6WZIB+ncg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53623180"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="53623180"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 08:16:59 -0700
X-CSE-ConnectionGUID: LsL5gp3ZTvGbgOWNU47Nyw==
X-CSE-MsgGUID: yUC9Ff8sSWWDiWxWJh41aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="144606891"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 May 2025 08:16:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI7fD-000PSO-20;
	Thu, 22 May 2025 15:16:55 +0000
Date: Thu, 22 May 2025 23:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kbusch:block-copy-offload 1/5] block/blk-lib.c:381: warning:
 Function parameter or struct member 'bdev' not described in 'blkdev_copy'
Message-ID: <202505222333.iUZqHP41-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git block-copy-offload
head:   800a843f4b4f96a8b43f11bcbdc33e87f2aaf2a9
commit: 17d31d395330deac8effb0b1e11ca684f8462e11 [1/5] block: new sector copy api
config: arc-randconfig-001-20250522 (https://download.01.org/0day-ci/archive/20250522/202505222333.iUZqHP41-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505222333.iUZqHP41-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505222333.iUZqHP41-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-lib.c:381: warning: Function parameter or struct member 'bdev' not described in 'blkdev_copy'


vim +381 block/blk-lib.c

   371	
   372	/**
   373	 * blkdev_copy - copy source sectors to a destination on the same block device
   374	 * @dst_sector:	start sector of the destination to copy to
   375	 * @src_sector:	start sector of the source to copy from
   376	 * @nr_sects:	number of sectors to copy
   377	 * @gfp:	allocation flags to use
   378	 */
   379	int blkdev_copy(struct block_device *bdev, sector_t dst_sector,
   380			sector_t src_sector, sector_t nr_sects, gfp_t gfp)
 > 381	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

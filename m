Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1266D3F4C4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKY3Huww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697557362; x=1729093362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bwUxNyPHAlvxJuhQ+abNRmVmPBDIFivaxaY40bdm3VM=;
  b=hKY3HuwwJDmJ1vFuwl1CbmggEBk//8WyoDTfbbCRwkZmKbObaQ1x0iBy
   o/NZC39oNr90mZrjvAaOtTK+1A+RO6Q91wfMYeNnaJ504Vi5e1U2RWa02
   IunaMzD99MRLNHKS78Q4B8cDDKC8MGXRvYlNnztJwLFCcRKzbZtZUCh3L
   A9CsRVFvymYoGhJhsOVeUsnQKCmuzK91OBieNgNt23sQTuoOYdqZSGE7x
   uK1gkv6o35NkJqHJDw3gdMHL90fvk419Bie8wl7nRGOs2/gkjk9OcV1Lp
   Lm6d8upYxnUwqFvSLHniOwPhQVyA/+lgnsdTxESwEX1WmL9zYRhnn+BQo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="385649176"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="385649176"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 08:42:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="846871767"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="846871767"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Oct 2023 08:42:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsmDN-0009kl-0g;
	Tue, 17 Oct 2023 15:42:37 +0000
Date: Tue, 17 Oct 2023 23:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: drivers/scsi/mpi3mr/mpi3mr_transport.c:695: warning: Function
 parameter or member 'port_id' not described in 'mpi3mr_get_hba_port_by_id'
Message-ID: <202310172303.u91HpHDR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sreekanth,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
commit: 125ad1e6b445e8538e50d77d9c82ec811e98895e scsi: mpi3mr: Add helper functions to retrieve device objects
date:   1 year, 2 months ago
config: x86_64-randconfig-x063-20230716 (https://download.01.org/0day-ci/archive/20231017/202310172303.u91HpHDR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310172303.u91HpHDR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310172303.u91HpHDR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/mpi3mr/mpi3mr_transport.c:695: warning: Function parameter or member 'port_id' not described in 'mpi3mr_get_hba_port_by_id'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +695 drivers/scsi/mpi3mr/mpi3mr_transport.c

   684	
   685	/**
   686	 * mpi3mr_get_hba_port_by_id - find hba port by id
   687	 * @mrioc: Adapter instance reference
   688	 * @port_id - Port ID to search
   689	 *
   690	 * Return: mpi3mr_hba_port reference for the matched port
   691	 */
   692	
   693	struct mpi3mr_hba_port *mpi3mr_get_hba_port_by_id(struct mpi3mr_ioc *mrioc,
   694		u8 port_id)
 > 695	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

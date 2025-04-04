Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC77113D539
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 17:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743787488; cv=none; b=VmtXYutScr4tBYpedsIWB7/0h3unL5Xyfu6SWwzC06fkbREDSP+4NInGxohclG4RvtJLG1EOVo+JqIEl++NesdKLWG/D5nkYmiRwHJRrdRMyhhEv3JOBXb/LrZ1z7jdKqG/FCyczpYmGE8xz5L1HE0Qm1i9WKvo7XVr8IhJ41LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743787488; c=relaxed/simple;
	bh=ndAQcWlankOjE/MTbpHioDrbPpoO/Lec/2elSBkD6wM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nJ9sM4i9g5DsT1cSSKmeq3NGKxJmKqkqvoISwRPsJyfxBMY1Ws7vDKbx38mpcSgu0PXSKOybjGJarTMhr+EDvtuz8rtoBo+wWuMZeC6zEPENlxiVpVhPmxlBRnFcp6bsJVMopKPiHACNbAr5iB8UyOK8YlxMjiyWW4oaUOVe8Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maYZoq5p; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maYZoq5p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743787487; x=1775323487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ndAQcWlankOjE/MTbpHioDrbPpoO/Lec/2elSBkD6wM=;
  b=maYZoq5pU87GDK+3u3fqc/f1xxu5Pn16K1xDpd8TdJwRrz43iFLnSb6l
   VxomFm0PioaGL/5TC7Reh92k0OaTzu+u+Uhl4bw5USYjHochB5ggzcFCX
   YST8StktzFYjLx6Gh+LyY3cwNASoTbd5F6j5Uv7OLJ+AaCDg4V+id+0Qw
   8qZ7gBxtL/TJy36z6Nl59V5JrCAM4FGqWgVCDugd1BP/xcU2RMo5W8Adj
   dw5lhkJ+z94kdh5JhP7UHN9fwnzvQnIY8+h3cJajafjHCKtWTShFahvw2
   l7YGOr5HTYVo5K5K8kpT0jaO4/O4gn9m9L0KG1EYbEzOC9tnSWa44v+Ul
   w==;
X-CSE-ConnectionGUID: mhn6eM+HQOGxViwU/pA52g==
X-CSE-MsgGUID: Osi3t9vdRbivf8WG7q8HJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45325985"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="45325985"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 10:24:46 -0700
X-CSE-ConnectionGUID: 5CgG+WbbQgG1eiUgV+2Szg==
X-CSE-MsgGUID: gklP56+IR8WOTzAdlHJE9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127880514"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Apr 2025 10:24:45 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0kmY-0001Q1-2k;
	Fri, 04 Apr 2025 17:24:42 +0000
Date: Sat, 5 Apr 2025 01:24:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:ufs-lrbp-as-priv-data 6/25] drivers/scsi/scsi.c:208:
 warning: Function parameter or struct member 'host' not described in
 'scsi_host_update_can_queue'
Message-ID: <202504050126.gla8wYKS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux ufs-lrbp-as-priv-data
head:   64402c397d056783699e6297d4631c9185a14c04
commit: ea8688494a0addd615787accc07b434f4686e20a [6/25] scsi: core: Introduce scsi_host_update_can_queue()
config: i386-buildonly-randconfig-004-20250404 (https://download.01.org/0day-ci/archive/20250405/202504050126.gla8wYKS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050126.gla8wYKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050126.gla8wYKS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/scsi.c:208: warning: Function parameter or struct member 'host' not described in 'scsi_host_update_can_queue'
>> drivers/scsi/scsi.c:208: warning: Function parameter or struct member 'can_queue' not described in 'scsi_host_update_can_queue'


vim +208 drivers/scsi/scsi.c

   200	
   201	/**
   202	 * scsi_host_update_can_queue - Modify @host->can_queue
   203	 *
   204	 * @host->__devices must be empty and I/O must have been quiesced before this
   205	 * function is called.
   206	 */
   207	int scsi_host_update_can_queue(struct Scsi_Host *host, int can_queue)
 > 208	{
   209		struct blk_mq_tag_set prev_set;
   210		int prev_can_queue, ret;
   211	
   212		if (!list_empty(&host->__devices))
   213			return -EINVAL;
   214	
   215		prev_can_queue = host->can_queue;
   216		prev_set = host->tag_set;
   217		host->can_queue = can_queue;
   218		ret = scsi_mq_setup_tags(host);
   219		if (ret) {
   220			host->can_queue = prev_can_queue;
   221			return ret;
   222		}
   223		blk_mq_free_tag_set(&prev_set);
   224		return 0;
   225	}
   226	EXPORT_SYMBOL_GPL(scsi_host_update_can_queue);
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

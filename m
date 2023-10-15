Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87B0EDB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 00:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dx3RyM5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697328069; x=1728864069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+YSy1eVhHG82i0nZ/uzGYszbfnSuzGnXHIojB+m3x5E=;
  b=Dx3RyM5M/aGkSiH1QzbOqHS/PejmoiMB8+XuaSb2YTSOrgRXYY4tRZF+
   NMSCwpnlxHs3KOn+5sVvXH7g+7n937pyic7+zWBBXPCzrJ7UUAaYHdnRX
   5DV6zDQTxVdrw0kI7g7htYgSqBZwfkaQ63eYvoycENUIzTN1AvkQE+6iE
   8Od0cM5FZhx2HU8Tz/gaX0pOCc3AZ2NtWl6MTUcM/sL+n3uDrC+enPQL+
   cnewRX1x+Jjg0zehfJupLiyii0VQXcEp7k4ApuC4j1PxRSJEwWTvDyXdO
   I75AcGE1rQ5kohPnXObBSrzDVGPhmPltMlTiN5A6BsZIemdnXOvyZsy+W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="451832996"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="451832996"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 17:01:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="748802352"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="748802352"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2023 17:01:07 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qroZ7-0006pg-1b;
	Sun, 15 Oct 2023 00:01:05 +0000
Date: Sun, 15 Oct 2023 08:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-10132023-yi 81/85]
 checkpatch: WARNING: else is not generally useful after a break or return
Message-ID: <202310150707.zcErxD2W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-10132023-yi
head:   3f226b487e64cd6f04258236e83eb403526d3d0a
commit: 8351869b3bef4832c727b84b22348680f93cc415 [81/85] iommufd: Support attach/replace for SIOV virtual device {dev, pasid}
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150707.zcErxD2W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150707.zcErxD2W-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#48: FILE: drivers/iommu/iommufd/device.c:885:
+		return iommufd_device_change_pt(idev, pt_id, &data);
+	} else {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555AA1D52A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Dec 2023 06:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4UO7eqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703054269; x=1734590269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bh5scw8pATeryugZTyoTL++cxokNIZfmT8f0Hy4mxjQ=;
  b=c4UO7eqrUrrwdFfbHBFsYhG9i1/lreQQNJ4W7QL7l6g5mu3DXyJ+MUAv
   TV7o1iwjNyDYiqi2If08eJeYoU8+LHt9wj7lyUWO5RsnCUd/dAqX1eCls
   LGQ1R5MUDuzsBssVxQI5rfXqymaSaRZGqavHx9J+Srk1KIeUWVY81OSrI
   zWxHKV23Qp80E/rqwMAF9wdq1k20dL5qB105wHdHmY+ATg6jdGK28M9Hl
   KwLI5ncdZsm3GbwgFehJDgk2SKeAbCTwTFSheqmUDm8ZJraz5IcqFxPx3
   iDaTQHxeiE1eBMW++ukttdJTSW6RQxzPOW+9tYmgXsi4iWZxMpE+jqpAJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9149186"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="9149186"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 22:37:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="1023383638"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="1023383638"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 19 Dec 2023 22:37:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFqDB-0006WR-01;
	Wed, 20 Dec 2023 06:37:45 +0000
Date: Wed, 20 Dec 2023 14:37:33 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Stitt <justinstitt@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Kees Cook <keescook@chromium.org>, Hannes Reinecke <hare@suse.de>
Subject: [linux-next:master 7125/9096] drivers/scsi/fcoe/fcoe_sysfs.c:283
 store_ctlr_mode() warn: unsigned 'ctlr->mode' is never less than zero.
Message-ID: <202312201409.y5nmYEx3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa4db8324c4d0e67aa4670356df4e9fae14b4d37
commit: edc22a7c86888d1f2442e359c3b33a861045e9cd [7125/9096] scsi: fcoe: Use sysfs_match_string() over fcoe_parse_mode()
config: x86_64-randconfig-161-20231220 (https://download.01.org/0day-ci/archive/20231220/202312201409.y5nmYEx3-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312201409.y5nmYEx3-lkp@intel.com/

smatch warnings:
drivers/scsi/fcoe/fcoe_sysfs.c:283 store_ctlr_mode() warn: unsigned 'ctlr->mode' is never less than zero.

vim +283 drivers/scsi/fcoe/fcoe_sysfs.c

   260	
   261	static ssize_t store_ctlr_mode(struct device *dev,
   262				       struct device_attribute *attr,
   263				       const char *buf, size_t count)
   264	{
   265		struct fcoe_ctlr_device *ctlr = dev_to_ctlr(dev);
   266	
   267		if (count > FCOE_MAX_MODENAME_LEN)
   268			return -EINVAL;
   269	
   270	
   271		switch (ctlr->enabled) {
   272		case FCOE_CTLR_ENABLED:
   273			LIBFCOE_SYSFS_DBG(ctlr, "Cannot change mode when enabled.\n");
   274			return -EBUSY;
   275		case FCOE_CTLR_DISABLED:
   276			if (!ctlr->f->set_fcoe_ctlr_mode) {
   277				LIBFCOE_SYSFS_DBG(ctlr,
   278						  "Mode change not supported by LLD.\n");
   279				return -ENOTSUPP;
   280			}
   281	
   282			ctlr->mode = sysfs_match_string(fip_conn_type_names, buf);
 > 283			if (ctlr->mode < 0 || ctlr->mode == FIP_CONN_TYPE_UNKNOWN) {
   284				LIBFCOE_SYSFS_DBG(ctlr, "Unknown mode %s provided.\n",
   285						  buf);
   286				return -EINVAL;
   287			}
   288	
   289			ctlr->f->set_fcoe_ctlr_mode(ctlr);
   290			LIBFCOE_SYSFS_DBG(ctlr, "Mode changed to %s.\n", buf);
   291	
   292			return count;
   293		case FCOE_CTLR_UNUSED:
   294		default:
   295			LIBFCOE_SYSFS_DBG(ctlr, "Mode change not supported.\n");
   296			return -ENOTSUPP;
   297		}
   298	}
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

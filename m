Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB1013C667
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713351581; cv=none; b=EedgIS/FXWm3L1ByB6dFvCnK0AIWHLcVj0ZMuKi8024MLd1s0xxktHTCXRW1aT/kmVVHiAiWUXJKs1/0VLGgmgs8p8/UzU0gU4prNiEcUOQUw+D4Ibi5RCP4xG5PMv6huaOyiMVpwRv8DXBr/nclKJ7IB27Irfuq6GV4Eg0dAJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713351581; c=relaxed/simple;
	bh=yVv/S7FMnMF23edba2O06ooMn3OVaO1gUFNnHZ+/1+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XbOYU3FIA6sS77f2ryUQLsbQebL9doMUT1SwWsusXJbkZjUL9eKxEMr5r2ryWTCuIYnacK7jRxS5SbcIKOkl56Qhv5NIsXOmzIqlo0BGflZhNLjK7m/Z2G2T3yTy9xHMmm+TuTUgDszLg072NxCbG2w3XF+Tzdj7ZIgqLFz8Np8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RcfTwxK6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RcfTwxK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713351580; x=1744887580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yVv/S7FMnMF23edba2O06ooMn3OVaO1gUFNnHZ+/1+Q=;
  b=RcfTwxK6nYs6vEJA+RCuI9E9dplJPkPDsRVgi5PIXdkKmtWU1dg7XMUC
   LUVNn9c73m5gTEWDGATJjsKrIidtQiGJexXWIxA9h54kMIGQL+aS3HKRR
   MvPLfBUrRKIQqbZ+QfJGf1H6KxNZfUfEP5TmmQk0oafjflfi7/KBVrmcv
   86axAl4az5rvfCE5+kr3Tto2WzpQLocVhQNIHuo+iB8xAbgzNBjrO3tD9
   NGdqJw3+VHf4ykCIDcWbdYmYppPoTASfCSEWwKRZBoa4Q3BsffVpbEReo
   e8hZDctGMeWvWVEuw4fIi17UOZMYhWpgtdbh/G9PxfqAIpd1wlYRqdZjH
   w==;
X-CSE-ConnectionGUID: SI7x1VVUT3WhyUQzlMjQAQ==
X-CSE-MsgGUID: ZR2IFiUKQ5eB7sg8k/WR9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9386631"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9386631"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 03:59:39 -0700
X-CSE-ConnectionGUID: zV+iTkg1QJmKE+8S3w+Riw==
X-CSE-MsgGUID: pW5j+h1XRuKPNGNtZGwUEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="53541740"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Apr 2024 03:59:38 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx30m-0006Vo-2c;
	Wed, 17 Apr 2024 10:59:34 +0000
Date: Wed, 17 Apr 2024 18:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 139/438]
 drivers/gpu/drm/i915/display/intel_display_debugfs.c:1553:29: error:
 'i915_bigjoiner_enable_write' undeclared here (not in a function); did you
 mean 'i915_bigjoiner_enable_fops'?
Message-ID: <202404171817.GwewaGwS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   fe753ea36f846c5a5638f1db502ba023e76132ae
commit: 9020e25b8425de074eee13a7ef3e54ffcb585d73 [139/438] drm/i915: convert to read/write iterators
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20240417/202404171817.GwewaGwS-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171817.GwewaGwS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171817.GwewaGwS-lkp@intel.com/

Note: the axboe-block/rw_iter HEAD fe753ea36f846c5a5638f1db502ba023e76132ae builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from include/drm/drm_debugfs.h:36,
                    from drivers/gpu/drm/i915/display/intel_display_debugfs.c:8:
>> drivers/gpu/drm/i915/display/intel_display_debugfs.c:1553:29: error: 'i915_bigjoiner_enable_write' undeclared here (not in a function); did you mean 'i915_bigjoiner_enable_fops'?
    1553 | DEFINE_SHOW_STORE_ATTRIBUTE(i915_bigjoiner_enable);
         |                             ^~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:220:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     220 |         .write          = __name ## _write,                             \
         |                           ^~~~~~
>> drivers/gpu/drm/i915/display/intel_display_debugfs.c:1436:16: warning: 'i915_bigjoiner_enable_write_iter' defined but not used [-Wunused-function]
    1436 | static ssize_t i915_bigjoiner_enable_write_iter(struct kiocb *iocb,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1553 drivers/gpu/drm/i915/display/intel_display_debugfs.c

d4d17377e01f01 Swati Sharma        2023-03-09  1435  
9020e25b8425de Jens Axboe          2024-04-09 @1436  static ssize_t i915_bigjoiner_enable_write_iter(struct kiocb *iocb,
9020e25b8425de Jens Axboe          2024-04-09  1437  						struct iov_iter *from)
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1438  {
9020e25b8425de Jens Axboe          2024-04-09  1439  	struct seq_file *m = iocb->ki_filp->private_data;
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1440  	struct intel_connector *connector = m->private;
9020e25b8425de Jens Axboe          2024-04-09  1441  	size_t len = iov_iter_count(from);
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1442  	struct drm_crtc *crtc;
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1443  	bool bigjoiner_en = 0;
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1444  	int ret;
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1445  
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1446  	crtc = connector->base.state->crtc;
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1447  	if (connector->base.status != connector_status_connected || !crtc)
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1448  		return -ENODEV;
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1449  
9020e25b8425de Jens Axboe          2024-04-09  1450  	ret = kstrtobool_from_iter(from, len, &bigjoiner_en);
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1451  	if (ret < 0)
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1452  		return ret;
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1453  
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1454  	connector->force_bigjoiner_enable = bigjoiner_en;
9020e25b8425de Jens Axboe          2024-04-09  1455  	iocb->ki_pos += len;
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1456  
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1457  	return len;
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1458  }
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1459  
d4d17377e01f01 Swati Sharma        2023-03-09  1460  static int i915_dsc_output_format_open(struct inode *inode,
d4d17377e01f01 Swati Sharma        2023-03-09  1461  				       struct file *file)
d4d17377e01f01 Swati Sharma        2023-03-09  1462  {
d4d17377e01f01 Swati Sharma        2023-03-09  1463  	return single_open(file, i915_dsc_output_format_show, inode->i_private);
d4d17377e01f01 Swati Sharma        2023-03-09  1464  }
d4d17377e01f01 Swati Sharma        2023-03-09  1465  
d4d17377e01f01 Swati Sharma        2023-03-09  1466  static const struct file_operations i915_dsc_output_format_fops = {
d4d17377e01f01 Swati Sharma        2023-03-09  1467  	.owner = THIS_MODULE,
d4d17377e01f01 Swati Sharma        2023-03-09  1468  	.open = i915_dsc_output_format_open,
9020e25b8425de Jens Axboe          2024-04-09  1469  	.read_iter = seq_read_iter,
d4d17377e01f01 Swati Sharma        2023-03-09  1470  	.llseek = seq_lseek,
d4d17377e01f01 Swati Sharma        2023-03-09  1471  	.release = single_release,
9020e25b8425de Jens Axboe          2024-04-09  1472  	.write_iter = i915_dsc_output_format_write
d4d17377e01f01 Swati Sharma        2023-03-09  1473  };
d4d17377e01f01 Swati Sharma        2023-03-09  1474  
680c1e31a59b22 Swati Sharma        2023-11-10  1475  static int i915_dsc_fractional_bpp_show(struct seq_file *m, void *data)
680c1e31a59b22 Swati Sharma        2023-11-10  1476  {
77bdb83f0dbc8d Jani Nikula         2023-12-05  1477  	struct intel_connector *connector = m->private;
77bdb83f0dbc8d Jani Nikula         2023-12-05  1478  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
77bdb83f0dbc8d Jani Nikula         2023-12-05  1479  	struct intel_encoder *encoder = intel_attached_encoder(connector);
680c1e31a59b22 Swati Sharma        2023-11-10  1480  	struct drm_crtc *crtc;
680c1e31a59b22 Swati Sharma        2023-11-10  1481  	struct intel_dp *intel_dp;
680c1e31a59b22 Swati Sharma        2023-11-10  1482  	int ret;
680c1e31a59b22 Swati Sharma        2023-11-10  1483  
680c1e31a59b22 Swati Sharma        2023-11-10  1484  	if (!encoder)
680c1e31a59b22 Swati Sharma        2023-11-10  1485  		return -ENODEV;
680c1e31a59b22 Swati Sharma        2023-11-10  1486  
77bdb83f0dbc8d Jani Nikula         2023-12-05  1487  	ret = drm_modeset_lock_single_interruptible(&i915->drm.mode_config.connection_mutex);
680c1e31a59b22 Swati Sharma        2023-11-10  1488  	if (ret)
680c1e31a59b22 Swati Sharma        2023-11-10  1489  		return ret;
680c1e31a59b22 Swati Sharma        2023-11-10  1490  
77bdb83f0dbc8d Jani Nikula         2023-12-05  1491  	crtc = connector->base.state->crtc;
77bdb83f0dbc8d Jani Nikula         2023-12-05  1492  	if (connector->base.status != connector_status_connected || !crtc) {
680c1e31a59b22 Swati Sharma        2023-11-10  1493  		ret = -ENODEV;
680c1e31a59b22 Swati Sharma        2023-11-10  1494  		goto out;
680c1e31a59b22 Swati Sharma        2023-11-10  1495  	}
680c1e31a59b22 Swati Sharma        2023-11-10  1496  
77bdb83f0dbc8d Jani Nikula         2023-12-05  1497  	intel_dp = intel_attached_dp(connector);
680c1e31a59b22 Swati Sharma        2023-11-10  1498  	seq_printf(m, "Force_DSC_Fractional_BPP_Enable: %s\n",
680c1e31a59b22 Swati Sharma        2023-11-10  1499  		   str_yes_no(intel_dp->force_dsc_fractional_bpp_en));
680c1e31a59b22 Swati Sharma        2023-11-10  1500  
680c1e31a59b22 Swati Sharma        2023-11-10  1501  out:
77bdb83f0dbc8d Jani Nikula         2023-12-05  1502  	drm_modeset_unlock(&i915->drm.mode_config.connection_mutex);
680c1e31a59b22 Swati Sharma        2023-11-10  1503  
680c1e31a59b22 Swati Sharma        2023-11-10  1504  	return ret;
680c1e31a59b22 Swati Sharma        2023-11-10  1505  }
680c1e31a59b22 Swati Sharma        2023-11-10  1506  
9020e25b8425de Jens Axboe          2024-04-09  1507  static ssize_t i915_dsc_fractional_bpp_write(struct kiocb *iocb,
9020e25b8425de Jens Axboe          2024-04-09  1508  					     struct iov_iter *from)
680c1e31a59b22 Swati Sharma        2023-11-10  1509  {
9020e25b8425de Jens Axboe          2024-04-09  1510  	struct seq_file *m = iocb->ki_filp->private_data;
77bdb83f0dbc8d Jani Nikula         2023-12-05  1511  	struct intel_connector *connector = m->private;
77bdb83f0dbc8d Jani Nikula         2023-12-05  1512  	struct intel_encoder *encoder = intel_attached_encoder(connector);
77bdb83f0dbc8d Jani Nikula         2023-12-05  1513  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
680c1e31a59b22 Swati Sharma        2023-11-10  1514  	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
680c1e31a59b22 Swati Sharma        2023-11-10  1515  	bool dsc_fractional_bpp_enable = false;
9020e25b8425de Jens Axboe          2024-04-09  1516  	size_t len = iov_iter_count(from);
680c1e31a59b22 Swati Sharma        2023-11-10  1517  	int ret;
680c1e31a59b22 Swati Sharma        2023-11-10  1518  
680c1e31a59b22 Swati Sharma        2023-11-10  1519  	if (len == 0)
680c1e31a59b22 Swati Sharma        2023-11-10  1520  		return 0;
680c1e31a59b22 Swati Sharma        2023-11-10  1521  
680c1e31a59b22 Swati Sharma        2023-11-10  1522  	drm_dbg(&i915->drm,
680c1e31a59b22 Swati Sharma        2023-11-10  1523  		"Copied %zu bytes from user to force fractional bpp for DSC\n", len);
680c1e31a59b22 Swati Sharma        2023-11-10  1524  
9020e25b8425de Jens Axboe          2024-04-09  1525  	ret = kstrtobool_from_iter(from, len, &dsc_fractional_bpp_enable);
680c1e31a59b22 Swati Sharma        2023-11-10  1526  	if (ret < 0)
680c1e31a59b22 Swati Sharma        2023-11-10  1527  		return ret;
680c1e31a59b22 Swati Sharma        2023-11-10  1528  
680c1e31a59b22 Swati Sharma        2023-11-10  1529  	drm_dbg(&i915->drm, "Got %s for DSC Fractional BPP Enable\n",
680c1e31a59b22 Swati Sharma        2023-11-10  1530  		(dsc_fractional_bpp_enable) ? "true" : "false");
680c1e31a59b22 Swati Sharma        2023-11-10  1531  	intel_dp->force_dsc_fractional_bpp_en = dsc_fractional_bpp_enable;
680c1e31a59b22 Swati Sharma        2023-11-10  1532  
9020e25b8425de Jens Axboe          2024-04-09  1533  	iocb->ki_pos += len;
680c1e31a59b22 Swati Sharma        2023-11-10  1534  
680c1e31a59b22 Swati Sharma        2023-11-10  1535  	return len;
680c1e31a59b22 Swati Sharma        2023-11-10  1536  }
680c1e31a59b22 Swati Sharma        2023-11-10  1537  
680c1e31a59b22 Swati Sharma        2023-11-10  1538  static int i915_dsc_fractional_bpp_open(struct inode *inode,
680c1e31a59b22 Swati Sharma        2023-11-10  1539  					struct file *file)
680c1e31a59b22 Swati Sharma        2023-11-10  1540  {
680c1e31a59b22 Swati Sharma        2023-11-10  1541  	return single_open(file, i915_dsc_fractional_bpp_show, inode->i_private);
680c1e31a59b22 Swati Sharma        2023-11-10  1542  }
680c1e31a59b22 Swati Sharma        2023-11-10  1543  
680c1e31a59b22 Swati Sharma        2023-11-10  1544  static const struct file_operations i915_dsc_fractional_bpp_fops = {
680c1e31a59b22 Swati Sharma        2023-11-10  1545  	.owner = THIS_MODULE,
680c1e31a59b22 Swati Sharma        2023-11-10  1546  	.open = i915_dsc_fractional_bpp_open,
9020e25b8425de Jens Axboe          2024-04-09  1547  	.read_iter = seq_read_iter,
680c1e31a59b22 Swati Sharma        2023-11-10  1548  	.llseek = seq_lseek,
680c1e31a59b22 Swati Sharma        2023-11-10  1549  	.release = single_release,
9020e25b8425de Jens Axboe          2024-04-09  1550  	.write_iter = i915_dsc_fractional_bpp_write
680c1e31a59b22 Swati Sharma        2023-11-10  1551  };
680c1e31a59b22 Swati Sharma        2023-11-10  1552  
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12 @1553  DEFINE_SHOW_STORE_ATTRIBUTE(i915_bigjoiner_enable);
00c3959d63ae52 Stanislav Lisovskiy 2024-02-12  1554  

:::::: The code at line 1553 was first introduced by commit
:::::: 00c3959d63ae52e98b8e6776c9dba65291f8d137 drm/i915: Add bigjoiner force enable option to debugfs

:::::: TO: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
:::::: CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

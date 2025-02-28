Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DED849C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 06:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740723279; cv=none; b=R+NxnLeGwqFvcSxV9v85xCQZlx7o0BY2Lav+EyX56Zff+gmAq8ym/+FPxQ4vSJTfHiVSvF/zx/GRns2BTyVSMe4oAsNiLR0OhnMSnQ42RvzmRgEhDrCwybarAyjqAJBRZlKnUevZqX3DT0SHVmAm6FBs+lEBM5EMQjL4hqbwhxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740723279; c=relaxed/simple;
	bh=H2XroP2jLLzd5oDPLy4zQD9RNULqRrxyr6M9eJepVkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=anpi6AdjEn5zW00z+hLZkWv52e7Y780uit+Jh4wlr+hOw3jrJkePxbQbDLOtVuMIMVt84Jqiw04ylYU5rySZbDUiTR/HIZvkkm+RG4TKmErn2UTxtqjWae+xGmQUjNzaGmBiUGkeIxpu2xj6OLe+YY9ArIea03L7vJJgfUS6JKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dd8IXa1a; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dd8IXa1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740723278; x=1772259278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H2XroP2jLLzd5oDPLy4zQD9RNULqRrxyr6M9eJepVkQ=;
  b=Dd8IXa1a/QgapbOZVSpQe4z1Ty9Mvv/dN7+b2ZWFk5QQv7tki9UyJ8ME
   U1FfLrc4KEqYjF9bdpo/j/shWOknBoC7qHqWGfrRg8121ScqKsOJ4BB4E
   2hYjgXBNkt0YV8NW7rvaOX16mbGHooiEnVPWU/GRjK7EnNg+CrtWEJcBY
   RUTWp+CM0oDp5rtryWsCCxWZIyu2z+IxZDre4T4bTM/vVfo/4IDunGrf/
   lLsMFcmVhYVQ67jYWjoLWKSpOHEQOp3g1ygGklBGo9gZ1YdA7UNPfwPd6
   yDFjxbuz6i78XNoCIdxyGSDnKvCA2HsVWf5kRVcXLnkfBm+NgzL7Vc85U
   w==;
X-CSE-ConnectionGUID: TMGiNKuBSKuQXgoODTQP+A==
X-CSE-MsgGUID: 0ln4oynpRraLkbQXAOqfOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41489712"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="41489712"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 22:14:35 -0800
X-CSE-ConnectionGUID: bd3bX78CRfGAu7dtcEB6/A==
X-CSE-MsgGUID: Vb5S6eBWSF2QGfLjz6by2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="148065199"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Feb 2025 22:14:34 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tntdc-000EUs-0t;
	Fri, 28 Feb 2025 06:14:24 +0000
Date: Fri, 28 Feb 2025 14:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 2/2] drivers/cxl/aliscm.c:513:5:
 warning: no previous prototype for 'cxl_aliscm_send_cmd'
Message-ID: <202502281408.qABDZGVF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   3f4a1c56702ff1c8fc29efeaf5b07b6e9821f19a
commit: 0570776059de9549b00ed0b0d2ffc7807f1c6688 [2/2] anolis: driver/cxl: Add a custom module for AliSCM
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20250228/202502281408.qABDZGVF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502281408.qABDZGVF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502281408.qABDZGVF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/aliscm.c:513:5: warning: no previous prototype for 'cxl_aliscm_send_cmd' [-Wmissing-prototypes]
     513 | int cxl_aliscm_send_cmd(struct cxl_aliscm_dev *aliscm, struct cxl_send_command __user *s)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/cxl/aliscm.c:607:24: warning: no previous prototype for 'devm_cxl_add_aliscm' [-Wmissing-prototypes]
     607 | struct cxl_aliscm_dev *devm_cxl_add_aliscm(struct device *host)
         |                        ^~~~~~~~~~~~~~~~~~~


vim +/cxl_aliscm_send_cmd +513 drivers/cxl/aliscm.c

   512	
 > 513	int cxl_aliscm_send_cmd(struct cxl_aliscm_dev *aliscm, struct cxl_send_command __user *s)
   514	{
   515		struct device *dev = &aliscm->dev;
   516		struct cxl_send_command send;
   517		struct aliscm_cmd cmd;
   518		int rc;
   519	
   520		dev_dbg(dev, "Send IOCTL to AliSCM\n");
   521	
   522		if (copy_from_user(&send, s, sizeof(send)))
   523			return -EFAULT;
   524	
   525		if (send.rsvd == ALISCM_DOE_ID) {
   526			rc = doe_validate_cmd_from_user(&cmd, aliscm, &send);
   527			if (rc)
   528				return rc;
   529	
   530			rc = handle_aliscm_doe_cmd_from_user(aliscm, &cmd, send.out.payload,
   531								&send.out.size, &send.retval);
   532			if (rc)
   533				return rc;
   534		} else if (send.rsvd == ALISCM_GET_CXL_REG_ID) {
   535			rc = get_cxl_reg_validate_cmd_from_user(&cmd, aliscm, &send);
   536			if (rc)
   537				return rc;
   538	
   539			rc = handle_aliscm_get_cxl_reg_cmd_from_user(aliscm, &cmd, send.out.payload,
   540								&send.out.size, &send.retval);
   541			if (rc)
   542				return rc;
   543		} else {
   544			dev_warn(dev, "Unsupported command type: %x\n", send.rsvd);
   545			return -EINVAL;
   546		}
   547	
   548		if (copy_to_user(s, &send, sizeof(send)))
   549			return -EFAULT;
   550	
   551		return 0;
   552	}
   553	
   554	static long __cxl_aliscm_ioctl(struct cxl_aliscm_dev *aliscm, unsigned int cmd,
   555					   unsigned long arg)
   556	{
   557		switch (cmd) {
   558		case CXL_MEM_SEND_COMMAND:
   559			return cxl_aliscm_send_cmd(aliscm, (void __user *)arg);
   560		default:
   561			return -ENOTTY;
   562		}
   563	}
   564	
   565	static long cxl_aliscm_ioctl(struct file *file, unsigned int cmd,
   566					 unsigned long arg)
   567	{
   568		struct cxl_aliscm_dev *aliscm = file->private_data;
   569		int rc = -ENXIO;
   570	
   571		down_read(&cxl_aliscm_rwsem);
   572		if (aliscm)
   573			rc = __cxl_aliscm_ioctl(aliscm, cmd, arg);
   574		up_read(&cxl_aliscm_rwsem);
   575	
   576		return rc;
   577	}
   578	
   579	static int cxl_aliscm_open(struct inode *inode, struct file *file)
   580	{
   581		struct cxl_aliscm_dev *aliscm =
   582			container_of(inode->i_cdev, typeof(*aliscm), cdev);
   583	
   584		get_device(&aliscm->dev);
   585		file->private_data = aliscm;
   586	
   587		return 0;
   588	}
   589	
   590	static int cxl_aliscm_release_file(struct inode *inode, struct file *file)
   591	{
   592		struct cxl_aliscm_dev *aliscm =
   593			container_of(inode->i_cdev, typeof(*aliscm), cdev);
   594	
   595		put_device(&aliscm->dev);
   596	
   597		return 0;
   598	}
   599	
   600	static const struct file_operations cxl_aliscm_fops = {
   601		.owner = THIS_MODULE,
   602		.unlocked_ioctl = cxl_aliscm_ioctl,
   603		.open = cxl_aliscm_open,
   604		.release = cxl_aliscm_release_file,
   605	};
   606	
 > 607	struct cxl_aliscm_dev *devm_cxl_add_aliscm(struct device *host)
   608	{
   609		struct cxl_aliscm_dev *aliscm;
   610		struct device *dev;
   611		struct cdev *cdev;
   612		int rc;
   613	
   614		aliscm = cxl_aliscm_alloc(host, &cxl_aliscm_fops);
   615		if (IS_ERR(aliscm)) {
   616			dev_warn(host, "cxl_aliscm_alloc failed\n");
   617			return NULL;
   618		}
   619	
   620		dev = &aliscm->dev;
   621		rc = dev_set_name(dev, "aliscm%d", aliscm->id);
   622		if (rc)
   623			goto err;
   624	
   625		cdev = &aliscm->cdev;
   626		rc = cdev_device_add(cdev, dev);
   627		if (rc) {
   628			dev_dbg(host, "cdev_device_add failed\n");
   629			goto err;
   630		}
   631	
   632		dev_set_drvdata(host, aliscm);
   633	
   634		return aliscm;
   635	
   636	err:
   637		put_device(dev);
   638		return NULL;
   639	}
   640	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0E733065D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 17:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765905983; cv=none; b=ASUPPFU1y+BWDu1rxXipFKTQswbASpT3AUxM4m6YhllbB4wzbmG4nqNurBNxIsbG/V6unsxnhmCi+wLKxzqS4GvpjfmjrgTbxcEcPs1veo4RTPbUHwV5fW7PvkNqRkNjucdKVNHEDX2qZWp4A9UggS0dsI+18Zki9RZeIY7LFxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765905983; c=relaxed/simple;
	bh=qxLx/BD6TydjQySVcRheFgbTGjMXXzUxOsvO+nCTSqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a1t9X/Byu46VXywxDosS2WVGQ8NlQllDd76c5/cQNvwa2UeQaLgjsg/KWtTIOxX3y6b3IL5Vev3WaMMXpTEih0hQH9PWgA+yWbk58is6oVOIpiWxcEG7PV2Js7KoUdyhLAaLiwGWAK3MxfTI7HfgsWOhKflUAifkp3sjlDfXHBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APxTNwWz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APxTNwWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765905981; x=1797441981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qxLx/BD6TydjQySVcRheFgbTGjMXXzUxOsvO+nCTSqA=;
  b=APxTNwWzh9oASiUJHOQRpp/ulambjgJIYe6zBxmoePvvpyKUNZXynUts
   3dgQtLeYjzGnDco6mVpmWCicAaU6ZVh9o3sVmyb/AmWIzC2aCcZGYZjbG
   tViav2yjwGWXkpOomsl8tKQK2xWd4Urn7X4Gk+9bRYJvYs9WzUIOTUYSp
   fBKboDY8ofC31N4rvFB8JBPdx6/8nyt2XZn4urjS1MGcKefumGpngjAap
   DXMPBw19wjwV3+qNEUuu/28qr1xwKFALD9T8si4hmcR35KntkBb2Tx0pP
   beHaHwHZt0/UCw6JRc1ObnrtBmBB0vdiLSWh5wC1I3q6laOhK/tQY5IT7
   w==;
X-CSE-ConnectionGUID: tklH6tbxSTGNxN+GwgEx+Q==
X-CSE-MsgGUID: 7BNoThIRR5aR6CVKrxcEiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71688619"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="71688619"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 09:26:19 -0800
X-CSE-ConnectionGUID: 9ge0c1D2TAikISIex0LTAQ==
X-CSE-MsgGUID: TvOMnw3bR92jUAUbp5ryKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="235467647"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2025 09:26:18 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVYoI-000000003e4-0JW2;
	Tue, 16 Dec 2025 17:26:07 +0000
Date: Wed, 17 Dec 2025 01:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] drivers/cxl/aliscm.c:607:24:
 warning: no previous prototype for 'devm_cxl_add_aliscm'
Message-ID: <202512170151.LasVckgI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   8021645c122892ec7df09270bcd640dc4c766f82
commit: b332886ddf0e8d9bd286f9d57eb4e110d094cb2f [50/50] anolis: driver/cxl: Add a custom module for AliSCM
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251217/202512170151.LasVckgI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170151.LasVckgI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170151.LasVckgI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cxl/aliscm.c:513:5: warning: no previous prototype for 'cxl_aliscm_send_cmd' [-Wmissing-prototypes]
     513 | int cxl_aliscm_send_cmd(struct cxl_aliscm_dev *aliscm, struct cxl_send_command __user *s)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/cxl/aliscm.c:607:24: warning: no previous prototype for 'devm_cxl_add_aliscm' [-Wmissing-prototypes]
     607 | struct cxl_aliscm_dev *devm_cxl_add_aliscm(struct device *host)
         |                        ^~~~~~~~~~~~~~~~~~~


vim +/devm_cxl_add_aliscm +607 drivers/cxl/aliscm.c

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

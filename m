Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67371917F9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 May 2025 05:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746942975; cv=none; b=btz8+4OSC3dfgVwaUCM22TVH9kD85x1u0Mr159cOwo2Aj0eSUG5J91h7fuL3EAp//SGbfeahInEra1GL42+E/5UFX0i4BR3H477LaScL7a8xT5mSYQrKeY53wxymK1NiPRZ/odsTQ5eYiGlu/SWutnwC6tl4y0lkWg42odpTFaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746942975; c=relaxed/simple;
	bh=eS5b5MdnnytHLkh7vrXxNSBcvmGmoaC+MQlVog5egzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qEtgdnsDBLsNHjNSJG5HliWS7ekWsPL6THG86zzZ7npGSfdjuiazYVB0dU6TvzWNM8WftMSkGJ5so4xNSHJxmIbJRg5HFtFImX/MlLBu83kUmnS725aYt6kwyv4T2UtNuSi17Er+RaVE+S9JbCkKnNwFHYvlKCcR8UfBj0QhwCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iehZugsN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iehZugsN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746942973; x=1778478973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eS5b5MdnnytHLkh7vrXxNSBcvmGmoaC+MQlVog5egzg=;
  b=iehZugsN8FkZgQ1hSbp/Q6PvE4BYzdO9Kutcy0ABvpKUJsR9uqwf5wbC
   H+2rohKZxQqGFZBrsSROGZRyb6XFkIaUJWRcYXjS/uk1Swc4BI95IRI0a
   HtmsmZ/u2se5RQt1ZJJdMSvF9VFcohzuUcdr/CdnZSY6n88BnqCHrvcdw
   MH/1BMhKitnPylxbu/7ITjvTtLwaG+fXc/whN8ojQckaCDYH5WpFryLrN
   Vp7i18DK0+2ivo2e3VxB7W4vD/7mWsW5ND6lY9jEYfM5zbwnT0QvV412u
   e1QjnI/kbvBg/zIk4aDHcuarZIDJsOY1HrqIOQYbFp/p0bmUpszvODN7c
   A==;
X-CSE-ConnectionGUID: myPBCBdJRPmRKXDypfddww==
X-CSE-MsgGUID: 48gaj+DCSGOBguC2wsSnQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="48672734"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="48672734"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 22:56:12 -0700
X-CSE-ConnectionGUID: ETN0P4lVR/CAottalMki2g==
X-CSE-MsgGUID: Qcfqu5hzRGaGchMPYJNgAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="142148436"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 May 2025 22:56:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDzfU-000DcV-2H;
	Sun, 11 May 2025 05:56:08 +0000
Date: Sun, 11 May 2025 13:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/94] drivers/cxl/aliscm.c:513:5:
 warning: no previous prototype for function 'cxl_aliscm_send_cmd'
Message-ID: <202505111334.MdCLuFWD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   5b7daba404993131fe0d699e5acdccaa5bc3a017
commit: 6884fb205baf3aafb093d16c7519a4bc2eb900a3 [0/94] anolis: driver/cxl: Add a custom module for AliSCM
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250511/202505111334.MdCLuFWD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505111334.MdCLuFWD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505111334.MdCLuFWD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/aliscm.c:513:5: warning: no previous prototype for function 'cxl_aliscm_send_cmd' [-Wmissing-prototypes]
     513 | int cxl_aliscm_send_cmd(struct cxl_aliscm_dev *aliscm, struct cxl_send_command __user *s)
         |     ^
   drivers/cxl/aliscm.c:513:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     513 | int cxl_aliscm_send_cmd(struct cxl_aliscm_dev *aliscm, struct cxl_send_command __user *s)
         | ^
         | static 
>> drivers/cxl/aliscm.c:607:24: warning: no previous prototype for function 'devm_cxl_add_aliscm' [-Wmissing-prototypes]
     607 | struct cxl_aliscm_dev *devm_cxl_add_aliscm(struct device *host)
         |                        ^
   drivers/cxl/aliscm.c:607:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     607 | struct cxl_aliscm_dev *devm_cxl_add_aliscm(struct device *host)
         | ^
         | static 
   2 warnings generated.


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

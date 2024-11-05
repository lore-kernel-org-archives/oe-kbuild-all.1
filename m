Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007401D5162
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 11:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730807313; cv=none; b=BPGMdZ+MgQGL+w9Xs1zTFQzzOWXfn9Ik/klux4WpHtxzfCVa5OyHCrqlQhOeWSlToDMK0/houjDM0TtSP+GImz3XUITpU3zcN1DFRUzt8me7Qt2kzzUpAhFsoBfhI9IVYsnTcf4tS7Kqa2CgAzrXjdwvQE3Ha3frk5F7xIdGlFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730807313; c=relaxed/simple;
	bh=hiUq2sVnPhg76M8IvpJs38/0oD/YGufX8iX0UgQvGpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TIm26Li47X2dxA4FVxXk/R5AFyjl1euaZXeHph6UxqpzDWMTOFN+fBEovb+UD+68ScEiG/XPKTR+GvwDog8MgdyXUd+rxss+cp19dr7eRfIWjz8AQxZV75S0h97cnAic+DFW2aiV6iPP32j6/TlTOo+tX7R+h9mJDbSV9/OoaPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RMPKSW6c; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RMPKSW6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730807311; x=1762343311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hiUq2sVnPhg76M8IvpJs38/0oD/YGufX8iX0UgQvGpM=;
  b=RMPKSW6cEhtTmCHWDUS6ZrEGlgJtiYgq7kaAz5UOuiEIUYGwaspCcR+9
   BbxeJ4onBWBLMcaKKXasFibnqAh4TP5iyQSBqBmCsVes0ORC/pLsEIjFp
   yxTyHXTFncXRhwDwB4CHnR69pgNXzGEMu7Mzolx6z6U0KrMlkP1V0epjg
   MAZsKpKObBn+qnsGzZouwDFTcgOA6RGS3iNCExb+bnit6BGeWmwH//I8V
   IzhWYRh3bmbvaVjYw0aI7qgKT+suoF5t290TmurFdNIrnY6qqL09TCfP3
   mbdiEF2vqo6Ue5LvXNwKkouHt5Y+i9tVbYKskAMkwCJ8mv5v8kAhikE/J
   Q==;
X-CSE-ConnectionGUID: 2USWUmYWSNuKlOkn5REqDg==
X-CSE-MsgGUID: jviZpYbyRtOYssdSRqUMFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41945707"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="41945707"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 03:48:26 -0800
X-CSE-ConnectionGUID: TXDcEUSPTiC8Lgh2uDC5qA==
X-CSE-MsgGUID: dFelcvuWRWy1YSE8tw1CFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84801345"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Nov 2024 03:48:25 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8I2p-000lzt-0i;
	Tue, 05 Nov 2024 11:48:23 +0000
Date: Tue, 5 Nov 2024 19:47:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ed Tsai <ed.tsai@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [linux-next:master 7954/9328]
 drivers/ufs/host/ufs-mediatek.c:1789:65: error: 'struct scsi_device' has no
 member named 'reqeust_queue'; did you mean 'request_queue'?
Message-ID: <202411051918.MgUqfXhm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   850f22c42f4b0a14a015aecc26f46f9948ded6dd
commit: 1b55fc24d50fc5c752b8d6b594998c6f96445d2c [7954/9328] scsi: ufs: ufs-mediatek: Configure individual LU queue flags
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241105/202411051918.MgUqfXhm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051918.MgUqfXhm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051918.MgUqfXhm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ufs/host/ufs-mediatek.c: In function 'ufs_mtk_config_scsi_dev':
>> drivers/ufs/host/ufs-mediatek.c:1789:65: error: 'struct scsi_device' has no member named 'reqeust_queue'; did you mean 'request_queue'?
    1789 |                 blk_queue_flag_set(QUEUE_FLAG_SAME_FORCE, sdev->reqeust_queue);
         |                                                                 ^~~~~~~~~~~~~
         |                                                                 request_queue

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +1789 drivers/ufs/host/ufs-mediatek.c

  1782	
  1783	static void ufs_mtk_config_scsi_dev(struct scsi_device *sdev)
  1784	{
  1785		struct ufs_hba *hba = shost_priv(sdev->host);
  1786	
  1787		dev_dbg(hba->dev, "lu %llu scsi device configured", sdev->lun);
  1788		if (sdev->lun == 2)
> 1789			blk_queue_flag_set(QUEUE_FLAG_SAME_FORCE, sdev->reqeust_queue);
  1790	}
  1791	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

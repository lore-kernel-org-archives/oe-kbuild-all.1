Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA38156F40
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 21:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712699347; cv=none; b=SlcgaAZ0wxpD6mwHBaQXB9Lmy6ZKDl+GlrTUd9RAquT7rNF+pMeG68ltzIdvVdEEIqKgjxpxS5X48hginrBXYEZR0C2m6MbT1GkuadQZKI7ubLtg57g2+cCfc31yToQRMgjyjp9mCDqwJ1nQtXUEtSm91zUiQ5lOUUMPqMG5gek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712699347; c=relaxed/simple;
	bh=m5h+6waFLD0AkHOvpDNoZ/JEadymNLUldkcD1INsqQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dSRkTfHDo9iEtwNHWdVBhw59ryBSvHzW/pQtmzLKwlo41ZxwA1yjFwU4fSdLqGFxR9y1av+Xh1OHHYV5sahZXN+LPgBhB8P0S39P75wQG03sWdb+b6SYNQQI8jni1mrmxx2INVFcEgJmfzfRmnD9n7DZqgvze8E+x2D7e53/0qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAQ6apk/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAQ6apk/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712699346; x=1744235346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m5h+6waFLD0AkHOvpDNoZ/JEadymNLUldkcD1INsqQ8=;
  b=AAQ6apk/LSjfaUqobem1sbRrs3Ad3fclWIy5V+6UK3IiW9bngPPVqUuD
   gWcGGl8ISaIbbz6MCZ1/GN1j+wluzo1XGoz/kEGVxC8NFiF3fy0XlmHeS
   qi14Ia/ER4cOEz2xrUpKYgqmMtq+MvJiDpHM/PD/uS25izulV83aIpp9/
   YOWyDMmf2YPH+DcjDWXC/vqYEr1Zd1Ehrbx4d/JVZxVI9xJmXQm/KrP6j
   GDmqdEOh1wD8RBEF3G2URNPKFkvMFipS69sOq53+OfeljKO2uC1CPCJD8
   6ddjkhMycufQTFAVceLPOeZqgiQ8bMAu5QENioQ6MfKrxOTDNpOLl7pK8
   w==;
X-CSE-ConnectionGUID: q8/JA9s5QJWxlHKtG1+o0w==
X-CSE-MsgGUID: l/DiGCH0QB6L34wjqKtt1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18754652"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="18754652"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 14:49:05 -0700
X-CSE-ConnectionGUID: T5kKeraoQJGmOGkppG/D0Q==
X-CSE-MsgGUID: dAc+b6xeSMGs6JJLNsNOiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20304470"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Apr 2024 14:49:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruJKw-0006Xk-0a;
	Tue, 09 Apr 2024 21:49:02 +0000
Date: Wed, 10 Apr 2024 05:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:clk-reset-stuff 6/6] drivers/reset/reset-mpfs.c:162:14:
 warning: assignment to 'struct auxiliary_device *' from 'int' makes pointer
 from integer without a cast
Message-ID: <202404100536.HhCUMZEB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git clk-reset-stuff
head:   a12f281d2cb869bcd9a6ffc45d0c6a0d3aa2e9e2
commit: a12f281d2cb869bcd9a6ffc45d0c6a0d3aa2e9e2 [6/6] clock, reset: microchip: move all mpfs reset code to the reset subsystem
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240410/202404100536.HhCUMZEB-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100536.HhCUMZEB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100536.HhCUMZEB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/reset/reset-mpfs.c: In function 'mpfs_reset_adev_release':
   drivers/reset/reset-mpfs.c:154:9: error: implicit declaration of function 'kfree'; did you mean 'vfree'? [-Werror=implicit-function-declaration]
     154 |         kfree(adev);
         |         ^~~~~
         |         vfree
   drivers/reset/reset-mpfs.c: In function 'mpfs_reset_adev_alloc':
   drivers/reset/reset-mpfs.c:162:16: error: implicit declaration of function 'kzalloc'; did you mean 'vzalloc'? [-Werror=implicit-function-declaration]
     162 |         adev = kzalloc(sizeof(*adev), GFP_KERNEL);
         |                ^~~~~~~
         |                vzalloc
>> drivers/reset/reset-mpfs.c:162:14: warning: assignment to 'struct auxiliary_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     162 |         adev = kzalloc(sizeof(*adev), GFP_KERNEL);
         |              ^
   cc1: some warnings being treated as errors


vim +162 drivers/reset/reset-mpfs.c

   156	
   157	static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_dev)
   158	{
   159		struct auxiliary_device *adev;
   160		int ret;
   161	
 > 162		adev = kzalloc(sizeof(*adev), GFP_KERNEL);
   163		if (!adev)
   164			return ERR_PTR(-ENOMEM);
   165	
   166		adev->name = "reset-mpfs";
   167		adev->dev.parent = clk_dev;
   168		adev->dev.release = mpfs_reset_adev_release;
   169		adev->id = 666u;
   170	
   171		ret = auxiliary_device_init(adev);
   172		if (ret) {
   173			kfree(adev);
   174			return ERR_PTR(ret);
   175		}
   176	
   177		return adev;
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

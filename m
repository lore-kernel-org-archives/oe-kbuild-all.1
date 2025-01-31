Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F0D8467
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 16:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340253; cv=none; b=pc8R899IjuIE9j5+hTfXGQM7cYieuToQ9ynGDK3etNBSqQ+iTKh70GAYLESQYolADVAxGVB+0edB0eBr7TqaktCg8fb0toVtXiJlMv0vHWxBA8gh43sTMAT+nRgKPl26leXQA9XO18autrbORAygVcgYIF5omJBakyHGBaED16E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340253; c=relaxed/simple;
	bh=CX8XWmlcUPcWN04gaJBCqBHRqJL43Hm1YOPIGOoL+GA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b7gkX9VI0KN2FqiMb/NnDScJvv+zbimOccJo4XdX/gqe+cXho4Ul1MyfEU3jcM8lAyNc5j5bCYwUEJxwKXTM/DnN26EQ6guNlJj+IgF1Idd5tVCByoNB+49E1zqI90YogXSSIg+yPUud/VMaTjl9SW0V8T56yH8IOZByy73XS10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUC4sGAk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUC4sGAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738340252; x=1769876252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CX8XWmlcUPcWN04gaJBCqBHRqJL43Hm1YOPIGOoL+GA=;
  b=cUC4sGAkHflkFammXd4nhkTUekEzaQ0XhSYOALduZa/J8Mu5Psp9cDTa
   AJP0X5aH7ETPspISGfoIRLOQ8PC3BqOfugbgUjxuXmUF+H74UMG+d9c/G
   MjNw9IoqBnYpB5g6IwI/TCQuXqlxwaThLOEoXXR2/N13IbDr8hvqkH1Zl
   SDdvYrXy/Ajo64ln1SAp21dNJ8d1qrNDg1jd7tfl8JzIYsIl95XZFRQPf
   tVw4jJO0pYA/xU9tyHHa0cr3jjJFaWO8f17ScNyjDROLcKxvKZa9hjM5Y
   QwxwytMXgiORV8Sn0EjrrLTXOVA3zPotZVOyXV+HwSWtDoFkw+mbvjk54
   w==;
X-CSE-ConnectionGUID: suulkSEDQYy3ZPreoTVT2A==
X-CSE-MsgGUID: TNH/sOoKTi2D611aWu7rdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39071328"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="39071328"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 08:17:31 -0800
X-CSE-ConnectionGUID: keVrDeodRzSnqEvU0lw/3A==
X-CSE-MsgGUID: PRmVYGAMSz6Qz7dKJZRaZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="110239611"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jan 2025 08:17:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdthw-000mZk-11;
	Fri, 31 Jan 2025 16:17:28 +0000
Date: Sat, 1 Feb 2025 00:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/zen-sauce 2/31] drivers/scsi/vhba/vhba.c:192:23: error:
 variable 'vhost' set but not used
Message-ID: <202502010020.dlXHLcHO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/zen-sauce
head:   ae96db84281e1b10aee61ef832aabd0941743e99
commit: f9b71a07f5071c27d40a84a19588128df45565c7 [2/31] ZEN: Add VHBA driver
config: nios2-randconfig-r113-20250131 (https://download.01.org/0day-ci/archive/20250201/202502010020.dlXHLcHO-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250201/202502010020.dlXHLcHO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010020.dlXHLcHO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/vhba/vhba.c: In function 'vhba_device_queue':
>> drivers/scsi/vhba/vhba.c:192:23: error: variable 'vhost' set but not used [-Werror=unused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^~~~~
   drivers/scsi/vhba/vhba.c: At top level:
   drivers/scsi/vhba/vhba.c:1087:15: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Wincompatible-pointer-types]
    1087 |     .remove = vhba_remove,
         |               ^~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:1087:15: note: (near initialization for 'vhba_platform_driver.remove')
   cc1: all warnings being treated as errors


vim +/vhost +192 drivers/scsi/vhba/vhba.c

   189	
   190	static int vhba_device_queue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
   191	{
 > 192	    struct vhba_host *vhost;
   193	    struct vhba_command *vcmd;
   194	    unsigned long flags;
   195	
   196	    vhost = platform_get_drvdata(&vhba_platform_device);
   197	
   198	    vcmd = vhba_alloc_command();
   199	    if (!vcmd) {
   200	        return SCSI_MLQUEUE_HOST_BUSY;
   201	    }
   202	
   203	    vcmd->cmd = cmd;
   204	
   205	    spin_lock_irqsave(&vdev->cmd_lock, flags);
   206	#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 15, 0)
   207	    vcmd->metatag = scsi_cmd_to_rq(vcmd->cmd)->tag;
   208	#else
   209	    vcmd->metatag = vcmd->cmd->request->tag;
   210	#endif
   211	    list_add_tail(&vcmd->entry, &vdev->cmd_list);
   212	    spin_unlock_irqrestore(&vdev->cmd_lock, flags);
   213	
   214	    wake_up_interruptible(&vdev->cmd_wq);
   215	
   216	    return 0;
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

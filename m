Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EC4390C9E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 22:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326239; cv=none; b=QE7NgFnmOsjrOGaoX3WPjJMgtJXXdZQQh857qYFgxDDvFVpZ0musQhiVk5OAg9tUZdfpyoY+l0BHTSk4p4bHPKnP08JnG2cxxhnKgr855X7vFQA8k/TXoV0HYQN69Ve7AUgMnDKVSJlenjDyr8IiKLpK4LPpHmnzcwxL24pEvEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326239; c=relaxed/simple;
	bh=E30MeUsNQFuC4L3dwgHEtlZYr3Ow0Gzx3r/IJPBvxyQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QtXH0SL1+vk8wKLR01U/enRgJq/T7trmZstqHsUA7majkaRXEXbddXLaldn05ypgyUzLAupfUyyXDHOV3EXpdnklmDDfJ0P+1k+ZF2jpEtjGWz/48QNKPncq1McfD2XJi+IjXcBTpcKqIg/VZprwAQ4ZIJrZjpXeJ1v5ZDQAwjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/S74I4E; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/S74I4E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791326238; x=1822862238;
  h=date:from:to:cc:subject:message-id;
  bh=E30MeUsNQFuC4L3dwgHEtlZYr3Ow0Gzx3r/IJPBvxyQ=;
  b=G/S74I4Eqw8CqX1oPiP9P82YFWgkHPaLwD1CitFw+jbY1b57b+KMvTpS
   87rwsF12t/QaKrQseqS79mKhyJ0cpHKRW1KSurjee76yXvLdS9tzIHc0P
   hu4eM0ZSx46IsaE+wrtei7eC2nlOwvhEjknvJzUGY5QifO1YTa+w/uTre
   FyceZnBqJcr0TQB6Z8cIbAkaFgDKx/eQ2x64eHHmmU6mngSEtKSTPNA6F
   w2e0liwQswrXrxs4FhrZ9LCzBQkQvn2AT2uA8etXB8RFPLVtCQpP+9Riq
   dsQY4QIIbTC8sywc+8riRqm5Z13SUPPmNVBRoGdSOa5CsjcI6MQTw1aJ9
   Q==;
X-CSE-ConnectionGUID: dmY2aRyUSqmihMjSP6NoWA==
X-CSE-MsgGUID: /jOkzHuqQ2OlwPMHGtRUjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="87753"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="87753"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 15:37:18 -0700
X-CSE-ConnectionGUID: 1eSPg3Q9SheimZIKbyQncg==
X-CSE-MsgGUID: RxKyCC9wQsOgF+H6V0+l/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280513636"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Oct 2026 15:37:16 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEDmb-000000002Cs-3XVG;
	Tue, 06 Oct 2026 22:37:13 +0000
Date: Wed, 07 Oct 2026 06:37:03 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/zen-sauce 2/26] drivers/scsi/vhba/vhba.c:192:23:
 error: variable 'vhost' set but not used
Message-ID: <202610070650.Fph8PoOZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/zen-sauce
head:   8bcb1c874de78e8dd720a698e1b823084a00b899
commit: 429980f9a64cd983a4ad0c636518e1a4217c7303 [2/26] ZEN: Add VHBA driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20261007/202610070650.Fph8PoOZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070650.Fph8PoOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070650.Fph8PoOZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/vhba/vhba.c: In function 'vhba_device_queue':
>> drivers/scsi/vhba/vhba.c:192:23: error: variable 'vhost' set but not used [-Werror=unused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^~~~~
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

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5F2ECF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 19:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728759737; cv=none; b=kku80cir8n/fuOLLDH0r7bQroxT4ND8X/MbfTxM2RsvqFok7aAtbzHhPcO1ox5djmG6M3gOe5Ber0SKTtHm3FKw01Hua2Hd+WgDYJVMGA3Cslc4GtPDH+I8EywR0CGAqx/grvc2d1TIypxzunUjuOk9/SOuoE73GnmxxjwmF8Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728759737; c=relaxed/simple;
	bh=ABayGUv9wOKowB4bDRagJ8C2+eBURmF6j2f03U7J6Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IURJmRnlM4ubIDBdUAuqFmvzCtXuFj/GGVhS2DIZALyRFs2gFkzurszq0+ChdxAi+Ef6sWWwGSfN9M0jQd4a28TLHJxXB9iOuS/E+TgJLUQKHuby0aoXk8YDxNlo3O+vRE9/k8PyFoxkL22ajYxxsGsbNamqig9tp5EqOXNBRVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPip5SUm; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPip5SUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728759736; x=1760295736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ABayGUv9wOKowB4bDRagJ8C2+eBURmF6j2f03U7J6Yo=;
  b=PPip5SUmFdlmsL5BuZF22LOTOYYCH5hHUABiRFClJnfYq9nOKkoc2rwL
   niW0xFjCfUGOH7X+DIvQg/3Emwt/rz94OAd28ICTDcFe/wJ0kfKF60Jb6
   yZQCXv17tzuz+FON+DqT1D6faDf1KX1V0ysVTxyu9sLcx+C1WbHgpy4Hq
   C2T0y0DVmlAK3mG5pxwHh0whgZ2UgnSmsGhe6b1eZx0qN2VpuEHSmkk0S
   DMM53nhRvCFtxbbh/Rni78OeF6134a+blRzX9zvUz7bTUIunB9gCCXSaS
   V1GDNjwkCCn/i2/Xq3v2Q23oLcvw4R8nwsXSQHC313+P6hYg3uM9JxsUv
   g==;
X-CSE-ConnectionGUID: AaKkZ8BbSTucfxWwv2tp6w==
X-CSE-MsgGUID: 3x1snD5PR7SR5zDNcB4L0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27589622"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="27589622"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 12:02:15 -0700
X-CSE-ConnectionGUID: TPtWlAQHTQWB/Qpnf66xkg==
X-CSE-MsgGUID: uJv/1XJZTM6L3dAGi9LzHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="77210702"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Oct 2024 12:02:14 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szhNT-000Dd1-17;
	Sat, 12 Oct 2024 19:02:11 +0000
Date: Sun, 13 Oct 2024 03:02:01 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [staging:staging-next 88/94]
 drivers/staging/gpib/pc2/pc2_gpib.c:465:56: warning: suggest braces around
 empty body in an 'if' statement
Message-ID: <202410130202.QtO23GD0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
head:   728b72f4d40e1cdb5e27a187c5d89a05f8000747
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b [88/94] staging: gpib: Add KBUILD files for GPIB drivers
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20241013/202410130202.QtO23GD0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410130202.QtO23GD0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130202.QtO23GD0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/gpib/pc2/pc2_gpib.c: In function 'pc2_detach':
>> drivers/staging/gpib/pc2/pc2_gpib.c:465:56: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     465 |                         free_dma(nec_priv->dma_channel);
         |                                                        ^
   drivers/staging/gpib/pc2/pc2_gpib.c: In function 'pc2a_common_detach':
   drivers/staging/gpib/pc2/pc2_gpib.c:599:56: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     599 |                         free_dma(nec_priv->dma_channel);
         |                                                        ^
   In file included from drivers/staging/gpib/include/nec7210.h:17,
                    from drivers/staging/gpib/pc2/pc2_gpib.c:16:
   drivers/staging/gpib/include/nec7210_registers.h: At top level:
   drivers/staging/gpib/include/nec7210_registers.h:21:18: warning: 'nec7210_num_registers' defined but not used [-Wunused-const-variable=]
      21 | static const int nec7210_num_registers = 8;
         |                  ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/gpib/include/gpib_types.h:16,
                    from drivers/staging/gpib/include/nec7210.h:16:
   drivers/staging/gpib/uapi/gpib_user.h:344:18: warning: 'request_service_bit' defined but not used [-Wunused-const-variable=]
     344 | static const int request_service_bit = 0x40;
         |                  ^~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/uapi/gpib_user.h:264:18: warning: 'gpib_addr_max' defined but not used [-Wunused-const-variable=]
     264 | static const int gpib_addr_max = 30;    /* max address for primary/secondary gpib addresses */
         |                  ^~~~~~~~~~~~~
   drivers/staging/gpib/uapi/gpib_user.h:212:22: warning: 'gpib_command_mask' defined but not used [-Wunused-const-variable=]
     212 | static const uint8_t gpib_command_mask = 0x7f;
         |                      ^~~~~~~~~~~~~~~~~
   drivers/staging/gpib/uapi/gpib_user.h:53:18: warning: 'board_status_mask' defined but not used [-Wunused-const-variable=]
      53 | static const int board_status_mask = ERR | TIMO | END | CMPL | SPOLL |
         |                  ^~~~~~~~~~~~~~~~~
   drivers/staging/gpib/uapi/gpib_user.h:52:18: warning: 'device_status_mask' defined but not used [-Wunused-const-variable=]
      52 | static const int device_status_mask = ERR | TIMO | END | CMPL | RQS;
         |                  ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/if +465 drivers/staging/gpib/pc2/pc2_gpib.c

0dc1ad1c0051c2 Dave Penkler 2024-09-18  456  
0dc1ad1c0051c2 Dave Penkler 2024-09-18  457  void pc2_detach(gpib_board_t *board)
0dc1ad1c0051c2 Dave Penkler 2024-09-18  458  {
0dc1ad1c0051c2 Dave Penkler 2024-09-18  459  	struct pc2_priv *pc2_priv = board->private_data;
0dc1ad1c0051c2 Dave Penkler 2024-09-18  460  	struct nec7210_priv *nec_priv;
0dc1ad1c0051c2 Dave Penkler 2024-09-18  461  
0dc1ad1c0051c2 Dave Penkler 2024-09-18  462  	if (pc2_priv) {
0dc1ad1c0051c2 Dave Penkler 2024-09-18  463  		nec_priv = &pc2_priv->nec7210_priv;
0dc1ad1c0051c2 Dave Penkler 2024-09-18  464  		if (nec_priv->dma_channel)
0dc1ad1c0051c2 Dave Penkler 2024-09-18 @465  			free_dma(nec_priv->dma_channel);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  466  		gpib_free_pseudo_irq(board);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  467  		if (pc2_priv->irq)
0dc1ad1c0051c2 Dave Penkler 2024-09-18  468  			free_irq(pc2_priv->irq, board);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  469  		if (nec_priv->iobase) {
0dc1ad1c0051c2 Dave Penkler 2024-09-18  470  			nec7210_board_reset(nec_priv, board);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  471  			release_region((unsigned long)(nec_priv->iobase), pc2_iosize);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  472  		}
0dc1ad1c0051c2 Dave Penkler 2024-09-18  473  		if (nec_priv->dma_buffer) {
0dc1ad1c0051c2 Dave Penkler 2024-09-18  474  			dma_free_coherent(board->dev, nec_priv->dma_buffer_length,
0dc1ad1c0051c2 Dave Penkler 2024-09-18  475  					  nec_priv->dma_buffer, nec_priv->dma_buffer_addr);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  476  			nec_priv->dma_buffer = NULL;
0dc1ad1c0051c2 Dave Penkler 2024-09-18  477  		}
0dc1ad1c0051c2 Dave Penkler 2024-09-18  478  	}
0dc1ad1c0051c2 Dave Penkler 2024-09-18  479  	free_private(board);
0dc1ad1c0051c2 Dave Penkler 2024-09-18  480  }
0dc1ad1c0051c2 Dave Penkler 2024-09-18  481  

:::::: The code at line 465 was first introduced by commit
:::::: 0dc1ad1c0051c29eaca6202e08d0d5787d296649 staging: gpib: Add pc2 GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

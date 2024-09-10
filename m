Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB9246444
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 10:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725964388; cv=none; b=W1NbEk7rbUVlNxyExMTuLsPuiVnW70rSPhdfGOrs0ad3p3T2MTAjB2drtxTInweAhafn0LTojseQTUwRoVHOnx322UWnHiec5uKfu3TMlG4M1hyp8mfjZIFTO7pSzTIYJHmp9FL2blzeQembeet6D6EnTlDdK7RG1S6rR7y+tLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725964388; c=relaxed/simple;
	bh=dIS8Uy4dBTkqsIU9uRKOkKbW0X2LIHsh+ouI0YlvOW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ENmYpQP+77Qu+m+eFOpacMIDcDZnYGtq/0tzwdrnlPBchFZPOJvtB5SEjV74Idm69a0c16AYFGm1BSMvpw8S//1uLQYhH94b6tL+wCbxrYpk60bvEB3yHGnev9IKdfwN5U7+Gev5EQ7qYDG3VOWhVVfrtoIYc0fWON5TJmOb21k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hi/jtFKf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hi/jtFKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725964386; x=1757500386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dIS8Uy4dBTkqsIU9uRKOkKbW0X2LIHsh+ouI0YlvOW8=;
  b=Hi/jtFKfdV517n2zm96OITNX9kyNUHj8YsoAK6dh3Pim6lBKsI6fSk6P
   ipnxgWxBxb+Vq6f5LG8tGueUswUKAbQrMTj8ttRFohmUnbK9Cjyh2jJIb
   klXGoN54dDokqGhsOoBQkviths2zTFOQbCnj1MKqp14eQGNgIvikvxW/V
   esNBCbC43Do1L7ZnnKnQik3KYuH4Pt9cyrw175puv2YZgKa0ZMOzyQL0v
   ykfQc1tF3RoFdlxjyvQvE7aXnm98XIZPz4/PJ1CiO7rKQDrl2mKnsnfyj
   4BFinxLagA9q+QpDCr1Otf1YKrzAzgtVslqM3w0U8ijDDEE5J/1RMJmpv
   A==;
X-CSE-ConnectionGUID: xoaytmnVRAKp0nlY4uLEuw==
X-CSE-MsgGUID: /3p+/u4zQHeHZ7l8Aki0ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24846308"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="24846308"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 03:32:56 -0700
X-CSE-ConnectionGUID: 7n1mqbsxSeiiQJ94kkCilA==
X-CSE-MsgGUID: NENEu7zIQI65tX4f3DnLvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="97683511"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2024 03:32:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snyB3-0001Xv-07;
	Tue, 10 Sep 2024 10:32:53 +0000
Date: Tue, 10 Sep 2024 18:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip 7711/9999]
 drivers/net/ethernet/pensando/ionic/ionic_main.c:420:9: warning: 'strncpy'
 output truncated copying 31 bytes from a string of length 32
Message-ID: <202409101813.nDWqv9uA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   a73978e16f87d704893e4b3a637be257420d43f3
commit: 2332f07a324fd78d7c7436deeed23cd7db441ea7 [7711/9999] CIP: Add a number to the version suffix
config: riscv-randconfig-002-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101813.nDWqv9uA-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409101813.nDWqv9uA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101813.nDWqv9uA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/pensando/ionic/ionic_main.c: In function 'ionic_identify':
>> drivers/net/ethernet/pensando/ionic/ionic_main.c:420:9: warning: 'strncpy' output truncated copying 31 bytes from a string of length 32 [-Wstringop-truncation]
     420 |         strncpy(ident->drv.driver_ver_str, UTS_RELEASE,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     421 |                 sizeof(ident->drv.driver_ver_str) - 1);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +420 drivers/net/ethernet/pensando/ionic/ionic_main.c

fbfb8031533c924 Shannon Nelson 2019-09-03  409  
fbfb8031533c924 Shannon Nelson 2019-09-03  410  int ionic_identify(struct ionic *ionic)
fbfb8031533c924 Shannon Nelson 2019-09-03  411  {
fbfb8031533c924 Shannon Nelson 2019-09-03  412  	struct ionic_identity *ident = &ionic->ident;
fbfb8031533c924 Shannon Nelson 2019-09-03  413  	struct ionic_dev *idev = &ionic->idev;
fbfb8031533c924 Shannon Nelson 2019-09-03  414  	size_t sz;
fbfb8031533c924 Shannon Nelson 2019-09-03  415  	int err;
fbfb8031533c924 Shannon Nelson 2019-09-03  416  
fbfb8031533c924 Shannon Nelson 2019-09-03  417  	memset(ident, 0, sizeof(*ident));
fbfb8031533c924 Shannon Nelson 2019-09-03  418  
fbfb8031533c924 Shannon Nelson 2019-09-03  419  	ident->drv.os_type = cpu_to_le32(IONIC_OS_TYPE_LINUX);
1fcbebf115d9ce0 Shannon Nelson 2020-03-06 @420  	strncpy(ident->drv.driver_ver_str, UTS_RELEASE,
fbfb8031533c924 Shannon Nelson 2019-09-03  421  		sizeof(ident->drv.driver_ver_str) - 1);
fbfb8031533c924 Shannon Nelson 2019-09-03  422  
fbfb8031533c924 Shannon Nelson 2019-09-03  423  	mutex_lock(&ionic->dev_cmd_lock);
fbfb8031533c924 Shannon Nelson 2019-09-03  424  
fbfb8031533c924 Shannon Nelson 2019-09-03  425  	sz = min(sizeof(ident->drv), sizeof(idev->dev_cmd_regs->data));
fbfb8031533c924 Shannon Nelson 2019-09-03  426  	memcpy_toio(&idev->dev_cmd_regs->data, &ident->drv, sz);
fbfb8031533c924 Shannon Nelson 2019-09-03  427  
fbfb8031533c924 Shannon Nelson 2019-09-03  428  	ionic_dev_cmd_identify(idev, IONIC_IDENTITY_VERSION_1);
fbfb8031533c924 Shannon Nelson 2019-09-03  429  	err = ionic_dev_cmd_wait(ionic, DEVCMD_TIMEOUT);
fbfb8031533c924 Shannon Nelson 2019-09-03  430  	if (!err) {
fbfb8031533c924 Shannon Nelson 2019-09-03  431  		sz = min(sizeof(ident->dev), sizeof(idev->dev_cmd_regs->data));
fbfb8031533c924 Shannon Nelson 2019-09-03  432  		memcpy_fromio(&ident->dev, &idev->dev_cmd_regs->data, sz);
fbfb8031533c924 Shannon Nelson 2019-09-03  433  	}
fbfb8031533c924 Shannon Nelson 2019-09-03  434  	mutex_unlock(&ionic->dev_cmd_lock);
fbfb8031533c924 Shannon Nelson 2019-09-03  435  
a21b5d49e77a2ec Shannon Nelson 2020-10-01  436  	if (err) {
a21b5d49e77a2ec Shannon Nelson 2020-10-01  437  		dev_err(ionic->dev, "Cannot identify ionic: %dn", err);
a21b5d49e77a2ec Shannon Nelson 2020-10-01  438  		goto err_out;
a21b5d49e77a2ec Shannon Nelson 2020-10-01  439  	}
fbfb8031533c924 Shannon Nelson 2019-09-03  440  
a21b5d49e77a2ec Shannon Nelson 2020-10-01  441  	err = ionic_lif_identify(ionic, IONIC_LIF_TYPE_CLASSIC,
a21b5d49e77a2ec Shannon Nelson 2020-10-01  442  				 &ionic->ident.lif);
a21b5d49e77a2ec Shannon Nelson 2020-10-01  443  	if (err) {
a21b5d49e77a2ec Shannon Nelson 2020-10-01  444  		dev_err(ionic->dev, "Cannot identify LIFs: %d\n", err);
a21b5d49e77a2ec Shannon Nelson 2020-10-01  445  		goto err_out;
a21b5d49e77a2ec Shannon Nelson 2020-10-01  446  	}
fbfb8031533c924 Shannon Nelson 2019-09-03  447  
fbfb8031533c924 Shannon Nelson 2019-09-03  448  	return 0;
fbfb8031533c924 Shannon Nelson 2019-09-03  449  
a21b5d49e77a2ec Shannon Nelson 2020-10-01  450  err_out:
fbfb8031533c924 Shannon Nelson 2019-09-03  451  	return err;
fbfb8031533c924 Shannon Nelson 2019-09-03  452  }
fbfb8031533c924 Shannon Nelson 2019-09-03  453  

:::::: The code at line 420 was first introduced by commit
:::::: 1fcbebf115d9ce077c2ba5ecfb521cc1eedcb467 ionic: drop ethtool driver version

:::::: TO: Shannon Nelson <snelson@pensando.io>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

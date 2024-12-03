Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF73E18871D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 06:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733209195; cv=none; b=SI6JOQKfJVVlVUAOh1+RqfnCdKT0fwMGvuILxvr1A67aTfxiXAm0krhs5qLVKVmxFGz6Fgu1EjywsDMGWbpET+JYvAoCJstTo6xF+5N3C3SmkzWyJqG1dPv2MeFZefo17F6lm7ruU6seYVTDfUKsaW6rP7wZmB2xBJ5sURBISZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733209195; c=relaxed/simple;
	bh=feEAa6key/8aqdzoio/EDcscGiwPJYH+RH753Faj3gU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=azK3SlJ5bXh66/S4thPhzXD1DLaaYlYg0AEooadzOPViaPVrrf72zWBwkXvqVkX/4/st5ulQcuzsy1v93yxPMwfPpQOYWHHf9na+F9InPafn8hTM3uAddtJIDUduyqiuDnq0qFW4wZ6t8lc82DHXQ2GBc4Lx6ULcC571+U6LXzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJrpAiXo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJrpAiXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733209194; x=1764745194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=feEAa6key/8aqdzoio/EDcscGiwPJYH+RH753Faj3gU=;
  b=RJrpAiXo4SDpGHhJk0884Vqe7AnbP40ClH/bxgRX/8ZdPUshUMwTKm1G
   Nn74W3qr9d6xRh6x8OIcS4logbPpoUtD1NbBeSUm/3yDX80GUHdEruxhF
   diPm7i1q0ixEHuPqlenBvAxWRblG4Ba2jXcC90rhLqwedv84f30T6mjnY
   V5UBbc6/5mGNyTXYEvbBJtrBGgaj/Wrr6GbiZG4+ZN8RXbf8YNtoUHJD+
   b9Cxia8j97Uud67X+gl56jz0BoJ3+ooaE1gkB/FXhI3qkQzRTmK+Eb58a
   qh5YRRy/OYD/+2R+ocAxCNQaKfk5M3zq3yhR1KqRLFvMCVmzDjYfidX9G
   Q==;
X-CSE-ConnectionGUID: EYISbKCIQ1OBpKRRC3yJ5w==
X-CSE-MsgGUID: JApmR006Rk+EQEzmysnEgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33537214"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33537214"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 22:59:53 -0800
X-CSE-ConnectionGUID: 9l5vDfyMRT6hdCL1KNkioQ==
X-CSE-MsgGUID: pUmx+9hFQ6ivFjojGG0plA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93747604"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Dec 2024 22:59:52 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIMsv-0000Fi-2C;
	Tue, 03 Dec 2024 06:59:49 +0000
Date: Tue, 3 Dec 2024 14:58:52 +0800
From: kernel test robot <lkp@intel.com>
To: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: drivers/usb/typec/mux/intel_pmc_mux.c:664:43: warning: '%d'
 directive output may be truncated writing between 1 and 3 bytes into a
 region of size 2
Message-ID: <202412031437.vX580pxx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rajat,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: 0a453dc9f260281e3a063e07b526a7e494e496fe usb: typec: intel_pmc_mux: Expose IOM port status to debugfs
date:   1 year, 6 months ago
config: x86_64-buildonly-randconfig-002-20240106 (https://download.01.org/0day-ci/archive/20241203/202412031437.vX580pxx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031437.vX580pxx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031437.vX580pxx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/typec/mux/intel_pmc_mux.c: In function 'pmc_usb_probe':
>> drivers/usb/typec/mux/intel_pmc_mux.c:664:43: warning: '%d' directive output may be truncated writing between 1 and 3 bytes into a region of size 2 [-Wformat-truncation=]
     664 |         snprintf(name, sizeof(name), "port%d", port->usb3_port - 1);
         |                                           ^~
   In function 'pmc_mux_port_debugfs_init',
       inlined from 'pmc_usb_probe' at drivers/usb/typec/mux/intel_pmc_mux.c:723:3:
   drivers/usb/typec/mux/intel_pmc_mux.c:664:38: note: directive argument in the range [-1, 254]
     664 |         snprintf(name, sizeof(name), "port%d", port->usb3_port - 1);
         |                                      ^~~~~~~~
   drivers/usb/typec/mux/intel_pmc_mux.c:664:9: note: 'snprintf' output between 6 and 8 bytes into a destination of size 6
     664 |         snprintf(name, sizeof(name), "port%d", port->usb3_port - 1);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +664 drivers/usb/typec/mux/intel_pmc_mux.c

   658	
   659	static void pmc_mux_port_debugfs_init(struct pmc_usb_port *port)
   660	{
   661		struct dentry *debugfs_dir;
   662		char name[6];
   663	
 > 664		snprintf(name, sizeof(name), "port%d", port->usb3_port - 1);
   665	
   666		debugfs_dir = debugfs_create_dir(name, port->pmc->dentry);
   667		debugfs_create_file("iom_status", 0400, debugfs_dir, port,
   668				    &port_iom_status_fops);
   669	}
   670	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

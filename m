Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DBA14BF8B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 21:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727473667; cv=none; b=VKpDfzqi6H75w0mHDoa8L5yOIq5HdCNncpdYQXoZvMDSmHa+Y4iESQGHT46WAn6MKqsUx158+udf0uZAsDh5dLK00axd1eBSOfnKdzeCApcJ97sZt1WkLqPNjKJ5vQzbv10FvFNIXASQ95H2jVAt9uEAR7uzl1jaGBkZlpLsMvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727473667; c=relaxed/simple;
	bh=6Aa7ZSrSKrL68Se9FgKkUVxlRus8cRAiicK/+PoVkls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HE/ERj6tnDXUHI0HvpvxV5AvVmxhA2+/dk13kMwKrGN6Ktj+a0tPEr19NXqihoNnkTBRBi/yNoPU6JMedUdcpnl6rprsGhJ5uYrdRULkHpvfJLZyUwCKjW29mE58y/xvj4oyvhCb9gYaykc5tKPRYauk6eAibP1jPzlkI+c80vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbybbcZR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbybbcZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727473666; x=1759009666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Aa7ZSrSKrL68Se9FgKkUVxlRus8cRAiicK/+PoVkls=;
  b=QbybbcZRXNuJKbeoQr60DkfeI7jdh9f9a2I8FWqwGQU3yAwDYGxy9U9B
   TZ+QeBOC+Xn5FV+fqOnCXJiGOqmEaGjO+ZoEgN+MYthn/XGFv5hY93HwH
   mwh+nSJVgiUcE7gg+UHvT6JBcLVFSvkiwbIvPQCpC7U1dGDM0yPzikt0h
   TlzA57ghZkopMXYozbhzTffBbyjWLJVHyfkWZR+JZHy8V9rKuzw1g4A38
   XCU3+So2TJiJ/pn4DxLF4i8zS6NxwHZXaAFtu3zGYG9MkQc7gwBY05vBO
   zBIQh+VNi+J/agUNAyYv8W2moW7A4+GWw0jz8mZGf4WtcY9eEsyQjIjGH
   g==;
X-CSE-ConnectionGUID: /UhGosfuScKNdrwTQD9lvA==
X-CSE-MsgGUID: VDl7281rTmW0G6zUs4Lv+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30338092"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="30338092"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 14:47:45 -0700
X-CSE-ConnectionGUID: TtvNger5SRmLU7/IwiWd6A==
X-CSE-MsgGUID: QpcbzkfpQEmwO8k5Xea/ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72238517"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Sep 2024 14:47:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suIoP-000Meb-1X;
	Fri, 27 Sep 2024 21:47:41 +0000
Date: Sat, 28 Sep 2024 05:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiongmengbiao <xiongmengbiao@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13560/14216] include/linux/psp-hygon.h:257:1:
 error: conflicting types for 'vpsp_try_do_cmd'; have 'int(int,  phys_addr_t,
  struct vpsp_ret *)' {aka 'int(int,  long long unsigned int,  struct
 vpsp_ret *)'}
Message-ID: <202409280518.YiZdECth-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c9fe32fed709da98069e8215f6ecf39ea63f5355
commit: 3ce4cb81ef2b148f6c830c7debb4405e26cded1c [13560/14216] drivers/crypto/ccp: support TKM run on CSV
config: x86_64-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280518.YiZdECth-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280518.YiZdECth-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280518.YiZdECth-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/svm/svm.c:25:
>> include/linux/psp-hygon.h:257:1: error: conflicting types for 'vpsp_try_do_cmd'; have 'int(int,  phys_addr_t,  struct vpsp_ret *)' {aka 'int(int,  long long unsigned int,  struct vpsp_ret *)'}
     257 | vpsp_try_do_cmd(int cmd, phys_addr_t phy_addr,
         | ^~~~~~~~~~~~~~~
   include/linux/psp-hygon.h:253:1: note: previous definition of 'vpsp_try_do_cmd' with type 'int(uint32_t,  int,  void *, struct vpsp_ret *)' {aka 'int(unsigned int,  int,  void *, struct vpsp_ret *)'}
     253 | vpsp_try_do_cmd(uint32_t vid, int cmd,
         | ^~~~~~~~~~~~~~~
   include/linux/psp-hygon.h:285:5: warning: no previous prototype for 'psp_register_cmd_notifier' [-Wmissing-prototypes]
     285 | int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/psp-hygon.h:286:5: warning: no previous prototype for 'psp_unregister_cmd_notifier' [-Wmissing-prototypes]
     286 | int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +257 include/linux/psp-hygon.h

   247	
   248	static inline int
   249	vpsp_try_get_result(uint8_t prio,
   250			uint32_t index, phys_addr_t phy_addr, struct vpsp_ret *psp_ret) { return -ENODEV; }
   251	
   252	static inline int
   253	vpsp_try_do_cmd(uint32_t vid, int cmd,
   254			void *data, struct vpsp_ret *psp_ret) { return -ENODEV; }
   255	
   256	static inline int
 > 257	vpsp_try_do_cmd(int cmd, phys_addr_t phy_addr,
   258			struct vpsp_ret *psp_ret) { return -ENODEV; }
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

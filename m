Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D08163
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 04:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676264108; x=1707800108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wcyCpbEiuCaeYLoQ/37PshCohKqhBRCr9dbLSBPjo0s=;
  b=D88TspACPjybSegOKMrE8M9qFPHWPMilM/e3YPrY/ysOa8KOZYH2NwOj
   ZNr+hcar2Q4pcc/UdFQ42M7yj3Ot/kdENXO9O5brqb+z2lkVHgB/CQvt7
   F+as2IAacHod76DCXy6TvV1DdKKTO+TaJeGcypHl99so/6ytzpfm4iPcG
   DBXqUCcx4GwG0t+FThnDLysG28L31L5PXvbn6NjwLv6FOCPPzIE73UPpm
   coyrAzFDIxtrcbZkmFTUIkDr6b/MPU6N6cK+3qdt8jVMo5i4H42rU3t3t
   t5k27hL6cWdNSedW8dssObBxjon4pVHi2Jh4FSuucBev/9L5c4Kr2jsU7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="395419146"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="395419146"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 20:55:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="699050495"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="699050495"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Feb 2023 20:55:06 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRQrp-0007ZB-1r;
	Mon, 13 Feb 2023 04:55:05 +0000
Date: Mon, 13 Feb 2023 12:54:48 +0800
From: kernel test robot <lkp@intel.com>
To: Suman Anna <s-anna@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-5.10.y 2177/9999]
 drivers/remoteproc/remoteproc_core.c:2104 rproc_boot() warn: inconsistent
 indenting
Message-ID: <202302131202.a9Tto3Pl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   221424b9d0cea049e58d5ad93fcec93c90511744
commit: f84f01271e4e4deffc108645bc543ff9ced6960d [2177/9999] remoteproc: add infrastructure support for userspace driven loading
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230213/202302131202.a9Tto3Pl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131202.a9Tto3Pl-lkp@intel.com/

smatch warnings:
drivers/remoteproc/remoteproc_core.c:2104 rproc_boot() warn: inconsistent indenting
drivers/remoteproc/remoteproc_core.c:2108 rproc_boot() error: uninitialized symbol 'firmware_p'.

vim +2104 drivers/remoteproc/remoteproc_core.c

4eb45c11141832 Suman Anna       2018-01-15  2049  
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2050  /**
1b0ef9068f053d Suman Anna       2017-07-20  2051   * rproc_boot() - boot a remote processor
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2052   * @rproc: handle of a remote processor
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2053   *
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2054   * Boot a remote processor (i.e. load its firmware, power it on, ...).
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2055   *
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2056   * If the remote processor is already powered on, this function immediately
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2057   * returns (successfully).
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2058   *
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2059   * Returns 0 on success, and an appropriate error value otherwise.
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2060   */
1b0ef9068f053d Suman Anna       2017-07-20  2061  int rproc_boot(struct rproc *rproc)
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2062  {
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2063  	const struct firmware *firmware_p;
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2064  	struct device *dev;
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2065  	int ret;
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2066  
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2067  	if (!rproc) {
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2068  		pr_err("invalid rproc handle\n");
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2069  		return -EINVAL;
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2070  	}
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2071  
b5ab5e24e960b9 Ohad Ben-Cohen   2012-05-30  2072  	dev = &rproc->dev;
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2073  
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2074  	ret = mutex_lock_interruptible(&rproc->lock);
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2075  	if (ret) {
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2076  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2077  		return ret;
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2078  	}
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2079  
2099c77d4af7d1 Sarangdhar Joshi 2017-01-23  2080  	if (rproc->state == RPROC_DELETED) {
2099c77d4af7d1 Sarangdhar Joshi 2017-01-23  2081  		ret = -ENODEV;
2099c77d4af7d1 Sarangdhar Joshi 2017-01-23  2082  		dev_err(dev, "can't boot deleted rproc %s\n", rproc->name);
2099c77d4af7d1 Sarangdhar Joshi 2017-01-23  2083  		goto unlock_mutex;
2099c77d4af7d1 Sarangdhar Joshi 2017-01-23  2084  	}
2099c77d4af7d1 Sarangdhar Joshi 2017-01-23  2085  
0f9dc562b721aa Mathieu Poirier  2020-07-14  2086  	/* skip the boot or attach process if rproc is already powered up */
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2087  	if (atomic_inc_return(&rproc->power) > 1) {
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2088  		ret = 0;
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2089  		goto unlock_mutex;
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2090  	}
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2091  
0f9dc562b721aa Mathieu Poirier  2020-07-14  2092  	if (rproc->state == RPROC_DETACHED) {
0f9dc562b721aa Mathieu Poirier  2020-07-14  2093  		dev_info(dev, "attaching to %s\n", rproc->name);
0f9dc562b721aa Mathieu Poirier  2020-07-14  2094  
978f5ec648b16f Mathieu Poirier  2021-03-12  2095  		ret = rproc_attach(rproc);
0f9dc562b721aa Mathieu Poirier  2020-07-14  2096  	} else {
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2097  		dev_info(dev, "powering up %s\n", rproc->name);
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2098  
f84f01271e4e4d Suman Anna       2021-04-21  2099  		if (!rproc->skip_firmware_load) {
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2100  			/* load firmware */
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2101  			ret = request_firmware(&firmware_p, rproc->firmware, dev);
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2102  			if (ret < 0) {
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2103  				dev_err(dev, "request_firmware failed: %d\n", ret);
400e64df6b237e Ohad Ben-Cohen   2011-10-20 @2104  			goto downref_rproc;
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2105  			}
f84f01271e4e4d Suman Anna       2021-04-21  2106  		}
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2107  
400e64df6b237e Ohad Ben-Cohen   2011-10-20 @2108  		ret = rproc_fw_boot(rproc, firmware_p);
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2109  
f84f01271e4e4d Suman Anna       2021-04-21  2110  		if (!rproc->skip_firmware_load)
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2111  			release_firmware(firmware_p);
0f9dc562b721aa Mathieu Poirier  2020-07-14  2112  	}
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2113  
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2114  downref_rproc:
fbb6aacb078285 Bjorn Andersson  2016-10-02  2115  	if (ret)
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2116  		atomic_dec(&rproc->power);
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2117  unlock_mutex:
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2118  	mutex_unlock(&rproc->lock);
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2119  	return ret;
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2120  }
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2121  EXPORT_SYMBOL(rproc_boot);
400e64df6b237e Ohad Ben-Cohen   2011-10-20  2122  

:::::: The code at line 2104 was first introduced by commit
:::::: 400e64df6b237eb36b127efd72000a2794f9eec1 remoteproc: add framework for controlling remote processors

:::::: TO: Ohad Ben-Cohen <ohad@wizery.com>
:::::: CC: Ohad Ben-Cohen <ohad@wizery.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

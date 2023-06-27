Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7699017FE5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 15:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687878179; x=1719414179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jR6lUgVVq0V4eDSh7iu3DS0vZlusC4uGNZ4j+ZxHt1g=;
  b=WMhS1YRGsLQJYttnIeT0r8qH7uD+vcakLwyTuztOKhEygak419/jXd6F
   ntRfqIj26F3WD+LC7QhcsPAqz4Vrvye+5oVwkx1m8+52k/2xEeJOV+u4t
   YaylkkCZxjkEaf0L8eWIYqIdWRwHKpYrQPXGJuH3pmCuZyMXK1eBDFAHX
   bVCFcJwMesnX5hql+VyYeaAsibQbT2DYf44wdPmNoC+2MAOD14cQr8HUy
   gy5/3C1ja0hr7Rk16xgG//HXXwbrM3L/nKRGOaK1Cy2Gv4nxXgefU3Fqv
   +xnI83LSD+c4+ktJki2E8gNFc7TrrwwUOPNvZCS8a+ZiCEcr5tfiDM5IY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="364141738"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="364141738"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 08:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="840717253"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="840717253"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Jun 2023 08:02:10 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEACn-000C0Z-2m;
	Tue, 27 Jun 2023 15:02:09 +0000
Date: Tue, 27 Jun 2023 23:02:05 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/hybrid-allocation-take3 9/11]
 drivers/soundwire/bus.c:809:19: warning: variable 'dev_num' is uninitialized
 when used here
Message-ID: <202306272357.eUCxRjrQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/hybrid-allocation-take3
head:   48e0a8216e56a2d27bb5a9f021b7f16b2738898a
commit: 089b994687a657df9134732b0fedb3fcd161795b [9/11] soundwire: bus: add helper to force re-enumeration
config: arm-randconfig-r031-20230627 (https://download.01.org/0day-ci/archive/20230627/202306272357.eUCxRjrQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306272357.eUCxRjrQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306272357.eUCxRjrQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soundwire/bus.c:809:19: warning: variable 'dev_num' is uninitialized when used here [-Wuninitialized]
     809 |         slave->dev_num = dev_num;
         |                          ^~~~~~~
   drivers/soundwire/bus.c:785:13: note: initialize the variable 'dev_num' to silence this warning
     785 |         int dev_num;
         |                    ^
         |                     = 0
   1 warning generated.


vim +/dev_num +809 drivers/soundwire/bus.c

   775	
   776	/**
   777	 * sdw_slave_redo_enumeration() - Clear current device number, force the device to drop off
   778	 * the bus and reenumerate
   779	 * @slave: SDW Slave
   780	 *
   781	 */
   782	int sdw_slave_redo_enumeration(struct sdw_slave *slave)
   783	{
   784		struct sdw_bus *bus = slave->bus;
   785		int dev_num;
   786		int ret = 0;
   787	
   788		mutex_lock(&bus->bus_lock);
   789	
   790		/* only deal with already enumerated device */
   791		if (!slave->dev_num)
   792			goto unlock;
   793	
   794		dev_dbg(&slave->dev, "%s: device %d forcing reset to redo enumeration\n",
   795			__func__, slave->dev_num);
   796	
   797		ret = sdw_write_no_pm(slave, SDW_SCP_CTRL,  SDW_SCP_CTRL_FORCE_RESET);
   798		if (ret < 0) {
   799			dev_err(bus->dev, "device_num %d force reset failed: %d\n",
   800				dev_num, ret);
   801			goto unlock;
   802		}
   803	
   804		/* clear the existing allocation */
   805		clear_bit(slave->dev_num, bus->assigned);
   806		if (bus->ops && bus->ops->put_device_num)
   807			bus->ops->put_device_num(bus, slave);
   808	
 > 809		slave->dev_num = dev_num;
   810		slave->dev_num_sticky = dev_num;
   811	
   812	unlock:
   813		mutex_unlock(&bus->bus_lock);
   814		return ret;
   815	}
   816	EXPORT_SYMBOL(sdw_slave_redo_enumeration);
   817	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

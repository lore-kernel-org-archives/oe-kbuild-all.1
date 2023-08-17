Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D95613AD4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 12:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692275092; x=1723811092;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iKBCqatyz5OFlVMcI6EVQkDabdGLK7b87dQ9GHwXC7A=;
  b=fkDS55Pua/erZAci9rrUQALw/6GwSQFe54hYzluekvdnl3+xsmmBNB7O
   tcqY+d/xV+7CSzSHZodXd8VSlicYQAEYCfwPRpZ223WV8szvbus6B1KKn
   G7eiiD8nv4V4DNiHza3M+X3lRv3OwPzc/HflMRmqOq3HCHegFXdS+1DDY
   IeT24+Xs8Xs/aaC/R9eUqdEJg9fIpxRegnIPwPzw23qIBXNDn7Uruq+w0
   Fv+EtBcBtkYiQq2i+sCi4qjSmBXwH/YqsS9OeTpHk25mm/kGq3M1BUVK1
   A7NGtxsuVBnx3qkaZnbtNttbE9nYCFHLhBrhbr0lldviafJDZwsdJkLaA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436699152"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="436699152"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 05:24:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="728109193"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="728109193"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Aug 2023 05:24:50 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWc31-00017p-08;
	Thu, 17 Aug 2023 12:24:29 +0000
Date: Thu, 17 Aug 2023 20:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 68/89] drivers/base/power/runtime.c:1152:
 warning: Function parameter or member 'ign_usage_count' not described in
 'pm_runtime_get_if_active'
Message-ID: <202308172029.mesaR827-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   526800c1cc4597346abc427d878f6e15bd0a4429
commit: b32fc94a27815cdd8b1a637880d6bb398288ddff [68/89] PM: runtime: Add pm_runtime_get_if_active()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230817/202308172029.mesaR827-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172029.mesaR827-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172029.mesaR827-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/power/runtime.c:347: warning: Excess function parameter 'dev' description in '__rpm_callback'
   drivers/base/power/runtime.c:973: warning: Function parameter or member 'timer' not described in 'pm_suspend_timer_fn'
   drivers/base/power/runtime.c:973: warning: Excess function parameter 'data' description in 'pm_suspend_timer_fn'
>> drivers/base/power/runtime.c:1152: warning: Function parameter or member 'ign_usage_count' not described in 'pm_runtime_get_if_active'


vim +1152 drivers/base/power/runtime.c

5e928f77a09a07 Rafael J. Wysocki 2009-08-18  1130  
a436b6a19f5765 Rafael J. Wysocki 2015-12-17  1131  /**
b32fc94a27815c Sakari Ailus      2020-02-25  1132   * pm_runtime_get_if_active - Conditionally bump up the device's usage counter.
a436b6a19f5765 Rafael J. Wysocki 2015-12-17  1133   * @dev: Device to handle.
a436b6a19f5765 Rafael J. Wysocki 2015-12-17  1134   *
a436b6a19f5765 Rafael J. Wysocki 2015-12-17  1135   * Return -EINVAL if runtime PM is disabled for the device.
a436b6a19f5765 Rafael J. Wysocki 2015-12-17  1136   *
b32fc94a27815c Sakari Ailus      2020-02-25  1137   * Otherwise, if the device's runtime PM status is RPM_ACTIVE and either
b32fc94a27815c Sakari Ailus      2020-02-25  1138   * ign_usage_count is true or the device's usage_count is non-zero, increment
b32fc94a27815c Sakari Ailus      2020-02-25  1139   * the counter and return 1. Otherwise return 0 without changing the counter.
b32fc94a27815c Sakari Ailus      2020-02-25  1140   *
b32fc94a27815c Sakari Ailus      2020-02-25  1141   * If ign_usage_count is true, the function can be used to prevent suspending
b32fc94a27815c Sakari Ailus      2020-02-25  1142   * the device when its runtime PM status is RPM_ACTIVE.
b32fc94a27815c Sakari Ailus      2020-02-25  1143   *
b32fc94a27815c Sakari Ailus      2020-02-25  1144   * If ign_usage_count is false, the function can be used to prevent suspending
b32fc94a27815c Sakari Ailus      2020-02-25  1145   * the device when both its runtime PM status is RPM_ACTIVE and its usage_count
b32fc94a27815c Sakari Ailus      2020-02-25  1146   * is non-zero.
b32fc94a27815c Sakari Ailus      2020-02-25  1147   *
b32fc94a27815c Sakari Ailus      2020-02-25  1148   * The caller is resposible for putting the device's usage count when ther
b32fc94a27815c Sakari Ailus      2020-02-25  1149   * return value is greater than zero.
a436b6a19f5765 Rafael J. Wysocki 2015-12-17  1150   */
b32fc94a27815c Sakari Ailus      2020-02-25  1151  int pm_runtime_get_if_active(struct device *dev, bool ign_usage_count)
a436b6a19f5765 Rafael J. Wysocki 2015-12-17 @1152  {
a436b6a19f5765 Rafael J. Wysocki 2015-12-17  1153  	unsigned long flags;
a436b6a19f5765 Rafael J. Wysocki 2015-12-17  1154  	int retval;
a436b6a19f5765 Rafael J. Wysocki 2015-12-17  1155  
a436b6a19f5765 Rafael J. Wysocki 2015-12-17  1156  	spin_lock_irqsave(&dev->power.lock, flags);
b32fc94a27815c Sakari Ailus      2020-02-25  1157  	if (dev->power.disable_depth > 0) {
b32fc94a27815c Sakari Ailus      2020-02-25  1158  		retval = -EINVAL;
b32fc94a27815c Sakari Ailus      2020-02-25  1159  	} else if (dev->power.runtime_status != RPM_ACTIVE) {
b32fc94a27815c Sakari Ailus      2020-02-25  1160  		retval = 0;
b32fc94a27815c Sakari Ailus      2020-02-25  1161  	} else if (ign_usage_count) {
b32fc94a27815c Sakari Ailus      2020-02-25  1162  		retval = 1;
b32fc94a27815c Sakari Ailus      2020-02-25  1163  		atomic_inc(&dev->power.usage_count);
b32fc94a27815c Sakari Ailus      2020-02-25  1164  	} else {
b32fc94a27815c Sakari Ailus      2020-02-25  1165  		retval = atomic_inc_not_zero(&dev->power.usage_count);
b32fc94a27815c Sakari Ailus      2020-02-25  1166  	}
ec16798e9085aa Michał Mirosław   2020-01-04  1167  	trace_rpm_usage_rcuidle(dev, 0);
a436b6a19f5765 Rafael J. Wysocki 2015-12-17  1168  	spin_unlock_irqrestore(&dev->power.lock, flags);
b32fc94a27815c Sakari Ailus      2020-02-25  1169  
a436b6a19f5765 Rafael J. Wysocki 2015-12-17  1170  	return retval;
a436b6a19f5765 Rafael J. Wysocki 2015-12-17  1171  }
b32fc94a27815c Sakari Ailus      2020-02-25  1172  EXPORT_SYMBOL_GPL(pm_runtime_get_if_active);
a436b6a19f5765 Rafael J. Wysocki 2015-12-17  1173  

:::::: The code at line 1152 was first introduced by commit
:::::: a436b6a19f57656a6557439523923d89eb4a880d PM / runtime: Add new helper for conditional usage count incrementation

:::::: TO: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

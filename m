Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4776218CC00
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 21:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731535064; cv=none; b=hEZbj4e471TQxyhoi/gC+gxVBGTCVcOaLiczatwyExbx31vthr87jtlnH2Ifv5Cm61S8Dlgj0RP6jrk7aJT8/si/w025DKTvV8jAS8U6pnMszOg9t57MevCy5/gOEtfqtjnwBqX2MR6V5lY4Q1HVWbMvUYJIDCKS2qqxicyL5gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731535064; c=relaxed/simple;
	bh=0RcyhwaPn7hJ9QquLWwePu3Suqjj+fhRAzswEIuIKUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDYf1uZf4dOem/ZrG08y6Pbix0Z0mC+RxoAtgdnBmLqoa8+0UU5yTHJ2kjsypxVGblR3dCbQlhfRcw4hRJIN+cPJk0BuqeEyXu8brg3SxGQ8oyYm//TXJZMUyPhq0nHHmXjmMQFe0dOqdQQOSINQrEuySI1ov+VZTUXmWnkNNh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTKKvQFS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTKKvQFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731535063; x=1763071063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0RcyhwaPn7hJ9QquLWwePu3Suqjj+fhRAzswEIuIKUA=;
  b=kTKKvQFSYnywn+feNUEll4Vay6YdA2m7R01y/V/dMFEqbcMHDmYfeyZp
   slr5PP8vSgWvOHxSeBOcIScnuanfL1Fr3AI3LB/angEq6nqmko0Co04J/
   qId6bQbgq78sEXAXSFQhtO0DlKImre8jzuDQlHe5Grk7fs/rHGaO9sHHq
   rlJC28bHm3rsEvoysVef33s+Pg59djDvARTFmYEuqSd4OdlKI441jkIYH
   tILFt5wukMG78aBl/lDdMEvSDpJEO+EAGeHvT/UYpH876aThe8tkraOwN
   qps9GFXOJlPipMyKvkW3iqpmC6Ta/wQDBPm9Jjj0SvUEhYDqcMr+1UtrL
   A==;
X-CSE-ConnectionGUID: J2sq0YOrQ0W5NVy/rnSnGA==
X-CSE-MsgGUID: aH/li1RFSmGEab0i/opAXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="35246075"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="35246075"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 13:57:43 -0800
X-CSE-ConnectionGUID: 1R49eukpRn6n7Q0SU5HsXQ==
X-CSE-MsgGUID: NnT8HpQiT1ifmysPqBXnUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="92941487"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2024 13:57:41 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBLMo-0000l9-1e;
	Wed, 13 Nov 2024 21:57:38 +0000
Date: Thu, 14 Nov 2024 05:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: Len Brown <lenb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC/RFT PATCH] PM: sleep: Ignore device driver suspend()
 callback return values
Message-ID: <202411140555.yyX5JXly-lkp@intel.com>
References: <7e3092234617e8479d3020e5fed7ff47ac750014.1731522552.git.len.brown@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e3092234617e8479d3020e5fed7ff47ac750014.1731522552.git.len.brown@intel.com>

Hi Len,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge amd-pstate/linux-next amd-pstate/bleeding-edge linus/master v6.12-rc7 next-20241113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Len-Brown/PM-sleep-Ignore-device-driver-suspend-callback-return-values/20241114-023709
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/7e3092234617e8479d3020e5fed7ff47ac750014.1731522552.git.len.brown%40intel.com
patch subject: [RFC/RFT PATCH] PM: sleep: Ignore device driver suspend() callback return values
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241114/202411140555.yyX5JXly-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140555.yyX5JXly-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140555.yyX5JXly-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/power/main.c: In function 'device_suspend':
>> drivers/base/power/main.c:1681:5: warning: "CONFIG_PM_SLEEP_LEGACY_CALLBACK_ABORT" is not defined, evaluates to 0 [-Wundef]
    1681 | #if CONFIG_PM_SLEEP_LEGACY_CALLBACK_ABORT
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/CONFIG_PM_SLEEP_LEGACY_CALLBACK_ABORT +1681 drivers/base/power/main.c

  1576	
  1577	/**
  1578	 * device_suspend - Execute "suspend" callbacks for given device.
  1579	 * @dev: Device to handle.
  1580	 * @state: PM transition of the system being carried out.
  1581	 * @async: If true, the device is being suspended asynchronously.
  1582	 */
  1583	static int device_suspend(struct device *dev, pm_message_t state, bool async)
  1584	{
  1585		pm_callback_t callback = NULL;
  1586		const char *info = NULL;
  1587		int error = 0;
  1588		DECLARE_DPM_WATCHDOG_ON_STACK(wd);
  1589	
  1590		TRACE_DEVICE(dev);
  1591		TRACE_SUSPEND(0);
  1592	
  1593		dpm_wait_for_subordinate(dev, async);
  1594	
  1595		if (async_error) {
  1596			dev->power.direct_complete = false;
  1597			goto Complete;
  1598		}
  1599	
  1600		/*
  1601		 * Wait for possible runtime PM transitions of the device in progress
  1602		 * to complete and if there's a runtime resume request pending for it,
  1603		 * resume it before proceeding with invoking the system-wide suspend
  1604		 * callbacks for it.
  1605		 *
  1606		 * If the system-wide suspend callbacks below change the configuration
  1607		 * of the device, they must disable runtime PM for it or otherwise
  1608		 * ensure that its runtime-resume callbacks will not be confused by that
  1609		 * change in case they are invoked going forward.
  1610		 */
  1611		pm_runtime_barrier(dev);
  1612	
  1613		if (pm_wakeup_pending()) {
  1614			dev->power.direct_complete = false;
  1615			async_error = -EBUSY;
  1616			goto Complete;
  1617		}
  1618	
  1619		if (dev->power.syscore)
  1620			goto Complete;
  1621	
  1622		/* Avoid direct_complete to let wakeup_path propagate. */
  1623		if (device_may_wakeup(dev) || device_wakeup_path(dev))
  1624			dev->power.direct_complete = false;
  1625	
  1626		if (dev->power.direct_complete) {
  1627			if (pm_runtime_status_suspended(dev)) {
  1628				pm_runtime_disable(dev);
  1629				if (pm_runtime_status_suspended(dev)) {
  1630					pm_dev_dbg(dev, state, "direct-complete ");
  1631					goto Complete;
  1632				}
  1633	
  1634				pm_runtime_enable(dev);
  1635			}
  1636			dev->power.direct_complete = false;
  1637		}
  1638	
  1639		dev->power.may_skip_resume = true;
  1640		dev->power.must_resume = !dev_pm_test_driver_flags(dev, DPM_FLAG_MAY_SKIP_RESUME);
  1641	
  1642		dpm_watchdog_set(&wd, dev);
  1643		device_lock(dev);
  1644	
  1645		if (dev->pm_domain) {
  1646			info = "power domain ";
  1647			callback = pm_op(&dev->pm_domain->ops, state);
  1648			goto Run;
  1649		}
  1650	
  1651		if (dev->type && dev->type->pm) {
  1652			info = "type ";
  1653			callback = pm_op(dev->type->pm, state);
  1654			goto Run;
  1655		}
  1656	
  1657		if (dev->class && dev->class->pm) {
  1658			info = "class ";
  1659			callback = pm_op(dev->class->pm, state);
  1660			goto Run;
  1661		}
  1662	
  1663		if (dev->bus) {
  1664			if (dev->bus->pm) {
  1665				info = "bus ";
  1666				callback = pm_op(dev->bus->pm, state);
  1667			} else if (dev->bus->suspend) {
  1668				pm_dev_dbg(dev, state, "legacy bus ");
  1669				error = legacy_suspend(dev, state, dev->bus->suspend,
  1670							"legacy bus ");
  1671				goto End;
  1672			}
  1673		}
  1674	
  1675	 Run:
  1676		if (!callback && dev->driver && dev->driver->pm) {
  1677			info = "driver ";
  1678			callback = pm_op(dev->driver->pm, state);
  1679		}
  1680	
> 1681	#if CONFIG_PM_SLEEP_LEGACY_CALLBACK_ABORT
  1682		error = dpm_run_callback(callback, dev, state, info);
  1683	#else
  1684		dpm_run_callback(callback, dev, state, info);
  1685	#endif
  1686	
  1687	 End:
  1688		if (!error) {
  1689			dev->power.is_suspended = true;
  1690			if (device_may_wakeup(dev))
  1691				dev->power.wakeup_path = true;
  1692	
  1693			dpm_propagate_wakeup_to_parent(dev);
  1694			dpm_clear_superiors_direct_complete(dev);
  1695		}
  1696	
  1697		device_unlock(dev);
  1698		dpm_watchdog_clear(&wd);
  1699	
  1700	 Complete:
  1701		if (error) {
  1702			async_error = error;
  1703			dpm_save_failed_dev(dev_name(dev));
  1704			pm_dev_err(dev, state, async ? " async" : "", error);
  1705		}
  1706	
  1707		complete_all(&dev->power.completion);
  1708		TRACE_SUSPEND(error);
  1709		return error;
  1710	}
  1711	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

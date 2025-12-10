Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CB31C6B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765362221; cv=none; b=MlrAiSzhiXMPBJgYgK2CQUeVJ7o4TcUHDtLlyRzw6TqyGuRxn1gA30PNf4m5YttENNrzq8841jVh/G5yHdeu1DCaNGMTIRSrbLG0Wj016IaT2eKhNAuPJYQlkEHMqHDocB+/DBtVNsrhXmLT8ANysQPEuPsvew3EXVjsT+ijV4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765362221; c=relaxed/simple;
	bh=HHFQtbzvnRp8WyFvQggJDeYYT24CRAkLUsn0cc+qPOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d2RgKeUNw/vWFVH8tgDkdCRpIa8KyU/mfWv/SvhxbsbkjJqBMkiHMfGVBQoWWvgom3+YMZlVZFfSpxbol2dQvDyDPlKz+Ytoud+M40q32GDi3RAiZDmcPFjHmDgV/QPscGh0Mrt14D8BcIq49F6VP1v/7kcqjtewPjt3ShbQSs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SxMKUGbr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SxMKUGbr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765362220; x=1796898220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HHFQtbzvnRp8WyFvQggJDeYYT24CRAkLUsn0cc+qPOA=;
  b=SxMKUGbr9xgMGBrnXP1ELgKpFh+85JYwy6OSL4N/J9fTLUqHSQMHmt+o
   /au13sqCA+pB4Lykf4wuOYg4EqMPRbdM6Et6l9wzIzUzXdHtUitRM6P7O
   uw6Z4vCY57wLuSonZZRwLzQGI9wNTVLXAKUmPw4qArBdozTDUz3Pz/FhC
   SdXFu03RyDmqE5EzUpEluSepWEl1CDxiTqf1HCQBeJga/60RH1uwx/7Ji
   Xrkd0AuRlnr597lruStMQBRWGnLDyshEe4Lfc7alesdjrcR5LIwinIiVN
   h5DpCMrsA9JmlEs5zCCWVqO/6LU8e4+pPfTrd8UbtXWvyPjbsC5sZcOId
   g==;
X-CSE-ConnectionGUID: jA/qRD7kR0GzI5U579jF3w==
X-CSE-MsgGUID: jR1BfevdRW21Vy135XQE4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77947512"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="77947512"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 02:23:24 -0800
X-CSE-ConnectionGUID: +u/rdbdITsqGa+lRmEEc7Q==
X-CSE-MsgGUID: cv0IKwGnSdOtCMbIEn3x5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="196230100"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 10 Dec 2025 02:23:21 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTHLr-000000000ZK-3MUF;
	Wed, 10 Dec 2025 10:23:19 +0000
Date: Wed, 10 Dec 2025 11:22:28 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] htmldocs:
 ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work'
 description in 'wiphy_delayed_work_flush'
Message-ID: <202512101158.SZfSVzDP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   413c8958a89da414e792cff13c7ddb1217f8a693
commit: 394bc797fb96f1eda8dac440dd97e673115d7c78 [3508/3508] wifi: cfg80211: fix kernel-doc for wiphy_delayed_work_flush()
reproduce: (https://download.01.org/0day-ci/archive/20251210/202512101158.SZfSVzDP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101158.SZfSVzDP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/of_graph.h
   Error: Cannot open file ./include/linux/of_device.h
   Error: Cannot open file ./include/linux/of_device.h
   Error: Cannot open file ./include/linux/of_platform.h
   Error: Cannot open file ./include/linux/of_platform.h
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
>> ./include/net/cfg80211.h:5891: warning: Excess function parameter 'work' description in 'wiphy_delayed_work_flush'
   Error: Cannot open file ./include/linux/aperture.h
   Error: Cannot open file ./include/linux/aperture.h
   Error: Cannot open file ./include/linux/auxiliary_bus.h
   Error: Cannot open file ./include/linux/auxiliary_bus.h
   Error: Cannot open file ./include/linux/auxiliary_bus.h


vim +5891 ./include/net/cfg80211.h

a3ee4dc84c4e9d Johannes Berg 2023-06-06  5853  
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5854  /**
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5855   * wiphy_delayed_work_queue - queue delayed work for the wiphy
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5856   * @wiphy: the wiphy to queue for
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5857   * @dwork: the delayable worker
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5858   * @delay: number of jiffies to wait before queueing
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5859   *
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5860   * This is useful for work that must be done asynchronously, and work
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5861   * queued here has the special property that the wiphy mutex will be
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5862   * held as if wiphy_lock() was called, and that it cannot be running
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5863   * after wiphy_lock() was called. Therefore, wiphy_cancel_work() can
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5864   * use just cancel_work() instead of cancel_work_sync(), it requires
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5865   * being in a section protected by wiphy_lock().
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5866   */
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5867  void wiphy_delayed_work_queue(struct wiphy *wiphy,
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5868  			      struct wiphy_delayed_work *dwork,
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5869  			      unsigned long delay);
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5870  
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5871  /**
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5872   * wiphy_delayed_work_cancel - cancel previously queued delayed work
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5873   * @wiphy: the wiphy, for debug purposes
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5874   * @dwork: the delayed work to cancel
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5875   *
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5876   * Cancel the work *without* waiting for it, this assumes being
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5877   * called under the wiphy mutex acquired by wiphy_lock().
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5878   */
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5879  void wiphy_delayed_work_cancel(struct wiphy *wiphy,
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5880  			       struct wiphy_delayed_work *dwork);
a3ee4dc84c4e9d Johannes Berg 2023-06-06  5881  
8137a638e642a1 Johannes Berg 2023-11-23  5882  /**
394bc797fb96f1 Johannes Berg 2023-11-23  5883   * wiphy_delayed_work_flush - flush previously queued delayed work
8137a638e642a1 Johannes Berg 2023-11-23  5884   * @wiphy: the wiphy, for debug purposes
8137a638e642a1 Johannes Berg 2023-11-23  5885   * @work: the work to flush
8137a638e642a1 Johannes Berg 2023-11-23  5886   *
8137a638e642a1 Johannes Berg 2023-11-23  5887   * Flush the work (i.e. run it if pending). This must be called
8137a638e642a1 Johannes Berg 2023-11-23  5888   * under the wiphy mutex acquired by wiphy_lock().
8137a638e642a1 Johannes Berg 2023-11-23  5889   */
8137a638e642a1 Johannes Berg 2023-11-23  5890  void wiphy_delayed_work_flush(struct wiphy *wiphy,
8137a638e642a1 Johannes Berg 2023-11-23 @5891  			      struct wiphy_delayed_work *dwork);
8137a638e642a1 Johannes Berg 2023-11-23  5892  

:::::: The code at line 5891 was first introduced by commit
:::::: 8137a638e642a1f9d6511c3d2cb8d90bcfe45367 wifi: cfg80211: add flush functions for wiphy work

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Zheng Zengkai <zhengzengkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

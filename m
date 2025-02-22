Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0504A05
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 03:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740195708; cv=none; b=FJxXm4p3u/Ik3OwTNU/lj9KT6CnQsuGjGEbBx5YHsiTGJhCvcoLsnFNYynrDDgbDkXzcUvwKAE0Zs0t653tRJgs1I0Ov4y7zI2jp7D9wj+4wRuaJr2VEygHy0B9P/Lb8yaEiV0HxfgGy1PQPFltUeioXDHJIn8k3gGaTkcg1iCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740195708; c=relaxed/simple;
	bh=1pIQli5yX5TLQa8vO+yxFp6bgV32bNbZld5SseY5aho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WOpRGbxKMkwiSbkHF3lBXuKlx2dzFEpB8rk/lDg5ce3fSR3R0kgN1TcrTrJh5Sc1o8I9QawdSMAxccAD5mnl5gh9s+51r5YzT3Myu9XSepM/pEoswd7eZGjgnxKIh4P3JVmmgiq30B7deEHuq2Wo6Vln/VLX+dPQgzps5oA4LxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDerlatj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDerlatj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740195706; x=1771731706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1pIQli5yX5TLQa8vO+yxFp6bgV32bNbZld5SseY5aho=;
  b=KDerlatjsmL0JTRHWA3YOyWsbNnc0Y+1HF57IXQ2+fbE1rJpiQXaA4AT
   NnS55Aa+20bvZ0PNnNML4IFWDs+TLjDsrjIsDQBF7UGAIDdwge0b1L/vs
   tSWOGhNxEjyJY2MbZP4xpU4yWgQqJLUlavKGQ07sYzny+4wo6OugUqrYU
   rialzfimAPVQMzs58OHnk+2LK2AHDVTvT1XEbjUD/erPHJrf0kHk8WNpd
   EpzUfsHxiUdubUtcuINuAbBqxyfk5OkNmjvkz275AK+poERq1oLOs2EMV
   4eUAvd01qgbl4+zMTZu+yRvNCYxVAZPtN98ChbRoBStPnNhNk9q2h5tne
   A==;
X-CSE-ConnectionGUID: 28r8UCmHR8y8qXPiXYHxSw==
X-CSE-MsgGUID: nZYp5S99QKiZkp1+/jH3RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44935363"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="44935363"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 19:41:46 -0800
X-CSE-ConnectionGUID: q0fgMa92RQSDmQG8sLCSBw==
X-CSE-MsgGUID: /xpFUttySQmq+tPejtj0uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="116172867"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Feb 2025 19:41:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlgOX-0006HR-0g;
	Sat, 22 Feb 2025 03:41:38 +0000
Date: Sat, 22 Feb 2025 11:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: [tnguy-next-queue:40GbE 7/39] wx_lib.c:undefined reference to
 `ptp_schedule_worker'
Message-ID: <202502221148.uKcTIWhU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git 40GbE
head:   bb3bb6c92e5719c0f5d7adb9d34db7e76705ac33
commit: 06e75161b9d4833518a7c266310a0635eab50616 [7/39] net: wangxun: Add support for PTP clock
config: i386-buildonly-randconfig-005-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221148.uKcTIWhU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221148.uKcTIWhU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221148.uKcTIWhU-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/wangxun/libwx/wx_lib.o: in function `wx_clean_tx_irq':
>> wx_lib.c:(.text+0x3334): undefined reference to `ptp_schedule_worker'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ptp.o: in function `wx_ptp_stop':
>> wx_ptp.c:(.text+0xaa0): undefined reference to `ptp_clock_unregister'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ptp.o: in function `wx_ptp_init':
>> wx_ptp.c:(.text+0x104e): undefined reference to `ptp_clock_register'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LIBWX
   Depends on [m]: NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PTP_1588_CLOCK_OPTIONAL [=m]
   Selected by [y]:
   - NGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

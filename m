Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22AC1C69A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 03:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727147162; cv=none; b=kvu4NsV/eunY1FRzj/D06vwO71U9EM1FwOrho+ZhEG5NEpwS0Et2ItARSfdPB9Ja5L53Zm8q8LRIA8WilY+yEqp4h2uCjDlRy7dIRANxwf+WerBT90nsoEmpumgQDSUqcNUE4aXDNr6o7X1areU0usMR6fQ+5Q6TDPNMM8cPpF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727147162; c=relaxed/simple;
	bh=q4RSoFAKMPxJaaqeKWWeC+1v04GigarT+XDj/EpFb0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vz90rx7UHXd5OMdBRQMGC8EYNGNn+YccqeGbUgyGYWMhie5kuoRkp9B0LYmSNDHZ1396Fm+evHax2E6Nxgndt06vAyEfrFUCzX197sCdtqFVbTUEBGUG5dl8UyQ+8J99zywnLCUNjeERf2fabJaZ58HE3nGQMKdSe2mu1Pu2w4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IoD+fdJq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IoD+fdJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727147160; x=1758683160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q4RSoFAKMPxJaaqeKWWeC+1v04GigarT+XDj/EpFb0c=;
  b=IoD+fdJqZsUSzxcLR0bs85QyHHrtWaGsXOtnao0La5+4KUhktiwD6PQe
   ad/rxgjEawKfXB8kh+njoT9Pf3BqWTLR0z8qj9x+T9nLWMgffE0ZIr3YN
   JcnaUY3ojv8iC1Fgk4/5O0X/QZcjbgg9gWyDFZPmL9kFKq6TyyAv/yQX8
   1Bej19BcwY7Iin8k3Fw4veVMXh19/+0ilPcB38NJ5sZZe7XSwYAxgcAlZ
   d6ovufp+gxViTNQDH4Y3exwaY2wpKxhqqp6W8pwZHqBxJfSjrWeUHxAJ0
   g3NMnQaG6/KN3cRkpEKPxGdL2wf7tatkNMryvmbBQR2pYYNiVBgzWD45D
   g==;
X-CSE-ConnectionGUID: IVMyyFY0QY2I6yIi4ZJtzg==
X-CSE-MsgGUID: LtbGBOy1TpOf64sI9kU9Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25987590"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="25987590"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 20:05:58 -0700
X-CSE-ConnectionGUID: g3I/EwquSjqUrJbUtkD5dQ==
X-CSE-MsgGUID: A0jxh/oWSMWf4CCsz+CmyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="75663870"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2024 20:05:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssvs8-000Hqb-3C;
	Tue, 24 Sep 2024 03:05:52 +0000
Date: Tue, 24 Sep 2024 11:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1744/2441]
 kernel/irq/manage.c:2796: warning: Function parameter or member 'val' not
 described in 'irq_set_auxdata'
Message-ID: <202409241002.mvzMDDsN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 93a5b0469ab4a697ac6e69879dff736e9a381502 [1744/2441] genirq: Set auxiliary data for an interrupt
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240924/202409241002.mvzMDDsN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241002.mvzMDDsN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241002.mvzMDDsN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/manage.c:2796: warning: Function parameter or member 'val' not described in 'irq_set_auxdata'
>> kernel/irq/manage.c:2796: warning: Excess function parameter 'auxval' description in 'irq_set_auxdata'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - X86 [=y]


vim +2796 kernel/irq/manage.c

  2785	
  2786	/**
  2787	 * irq_set_auxdata - Set auxiliary data
  2788	 * @irq:	Interrupt to update
  2789	 * @which:	Selector which data to update
  2790	 * @auxval:	Auxiliary data value
  2791	 *
  2792	 * Function to update auxiliary data for an interrupt, e.g. to update data
  2793	 * which is stored in a shared register or data storage (e.g. IMS).
  2794	 */
  2795	int irq_set_auxdata(unsigned int irq, unsigned int which, u64 val)
> 2796	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38CD83CD3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 21:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715637360; cv=none; b=kB0fcX5yi8zFLBbsu7d3xAKiN4Bl2oqs0qzFRhHHv4CK8HvJzZA66U6hs5xzU9ayu+rGTT0tSj8CA59bf23tSmZR+PCqjVHOcxNJ4s5Lr0aiN6/BWgFebT9jig8MoNas4Txqt9FxkO/YrSI6T7YFnMfbCM07Xg6LG70vnqPu+nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715637360; c=relaxed/simple;
	bh=+q4aC9aBs3fCSbDVh6YqOfw/NGgHwoAcdFij/yBFFjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m+dcc3VepdXnB8sIDzTqnOig7DiP+B27kRXouSGxeXae8yPr3UPgRWP2n5G9qYXcrfxQnsepC1JSdOFPwDdTnYkzs9lLLYMfMWq40QY9MMutNIq1b8kehBxl5LDjqZYJWWsUCKUi3WEW6+uMfDvpmQw64HO5Qn40kXHVLsbAr2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0nMBnMR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0nMBnMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715637359; x=1747173359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+q4aC9aBs3fCSbDVh6YqOfw/NGgHwoAcdFij/yBFFjw=;
  b=H0nMBnMRqMSw2f9AP//KhHOqlwQn+dotckQJwtw6SwvptmAAeMotkTwB
   wKdGPmkJTHBms4qWY+s5AScynVmzk8Gim1k08LpDaGjK3WdQONW7p7hZk
   ETXljyxsxmIldGdN+f56yzmIyDWUw9pPUo5MopQwDkvb+vM9WNAqBoydT
   IJ2yPzZ5VDSOo2hPAPqOQnks1urqM0vU85LjEe3KR5rmlHEJHXQ73Z3Sn
   lWG/MgEZ22pLoObkyKvXUjpX1sRw764d0tLZON4VW5OHWrdM8G3a+kbLf
   esh3XQy9/J7xTXhR0HthpPQSOzIn8FwtyrZxIAZmiWvjU7B+QTmMVm1/7
   w==;
X-CSE-ConnectionGUID: n7HUZHWnRjy+TYswDJRUKQ==
X-CSE-MsgGUID: bm/Et7iTRSydtXXLqQe6Ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11416691"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11416691"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 14:55:58 -0700
X-CSE-ConnectionGUID: 4XwgD2aCTZGP46BcyfNneA==
X-CSE-MsgGUID: K7+9RYWaRl6pKt8+yryz2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="34970937"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 May 2024 14:55:56 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6deD-000AjH-2U;
	Mon, 13 May 2024 21:55:53 +0000
Date: Tue, 14 May 2024 05:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: Murali Karicheri <m-karicheri2@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Ravi Gunasekaran <r-gunasekaran@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 2/5] net/hsr/hsr_device.c:502:3-4:
 Unneeded semicolon
Message-ID: <202405140507.hbovyy3s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   36746b42badc0d5707b84ccc34c5ea166c9573b2
commit: 7c2c6221d29ba79f1333ef18be4296f0ad542556 [2/5] net: hsr: Add VLAN CTAG filter support
config: x86_64-randconfig-101-20240513 (https://download.01.org/0day-ci/archive/20240514/202405140507.hbovyy3s-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405140507.hbovyy3s-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/hsr/hsr_device.c:502:3-4: Unneeded semicolon
   net/hsr/hsr_device.c:526:3-4: Unneeded semicolon

vim +502 net/hsr/hsr_device.c

   469	
   470	static int hsr_ndo_vlan_rx_add_vid(struct net_device *dev,
   471					   __be16 proto, u16 vid)
   472	{
   473		struct hsr_port *port;
   474		struct hsr_priv *hsr;
   475		int ret = 0;
   476	
   477		hsr = netdev_priv(dev);
   478	
   479		hsr_for_each_port(hsr, port) {
   480			if (port->type == HSR_PT_MASTER)
   481				continue;
   482	
   483			ret = vlan_vid_add(port->dev, proto, vid);
   484			switch (port->type) {
   485			case HSR_PT_SLAVE_A:
   486				if (ret) {
   487					netdev_err(dev, "add vid failed for Slave-A\n");
   488					return ret;
   489				}
   490				break;
   491	
   492			case HSR_PT_SLAVE_B:
   493				if (ret) {
   494					/* clean up Slave-A */
   495					netdev_err(dev, "add vid failed for Slave-B\n");
   496					vlan_vid_del(port->dev, proto, vid);
   497					return ret;
   498				}
   499				break;
   500			default:
   501				break;
 > 502			};
   503		}
   504	
   505		return 0;
   506	}
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

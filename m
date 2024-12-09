Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E5D155751
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717710; cv=none; b=Ja7QuEENQ3W/3M2y8a/vJMgfxImULPOYbPdQqTmCw4r4pSiVL9cSLmuGiiILs9IWrfynWnC47hh9unt3mCykPZEqu5LGLu1LZBjwAGHuvwQktOSiE1NVOXHeXCedk5aqAZBP0XBYt3vDx16m/WJGdd8uhauWPW1J8hKMXn4Ve6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717710; c=relaxed/simple;
	bh=gD9SaiWn/weY9+EGG7ma0oaEkANmw5t7wEMX3zV1d+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K8l8M4JgTtPRI8FJmpoWVDhZm6VyAw5WFIycd19xkB/X5kM2gPgjOQiJBAIFZwpUaI3At4Xp494yo+2y9TVQlQnBkNHdn8JNqMIpdsF7nVMgWWLY1/hVgjfobk1eiQvqmc/84DddRElMD7i/koanc+EVSR9McS6RsbqSCL9yzGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GyKUk9HT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GyKUk9HT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717709; x=1765253709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gD9SaiWn/weY9+EGG7ma0oaEkANmw5t7wEMX3zV1d+Y=;
  b=GyKUk9HTr+h+3zdCJ6sCcMMx+YGxTvMIOQLuOAd8sKqjAZ1ZvxmPzsPB
   G+NMBsYZE+LHCom5+m/aD0TivpSkyJRdgYhP8HrsngrbG6EynDtKB4j4r
   9o/ePtM40HQCpzlf6Jyq8cd3LyUA7hwqb3lXF0/gThKEnst4mwZj/x2nQ
   rqE0zhE3b5Ku4qwWKrfGlDrPiM7mM9G/pok7xhYvvGJzrPdgc08sMaIYP
   4L2SIr0u1+Nb+gbzN0FqDY4yjkAspbDa7GsfeJceiB5WkFjVYrRVnjONn
   exSqvvdKEkU+9b7tsXa9lEmI1y3E3RTNhehvPx0SC9+R09GCrT63/yjir
   Q==;
X-CSE-ConnectionGUID: mXumKBxZSf+CdAGcpiBIPg==
X-CSE-MsgGUID: a1QuXGavQrK65L2C3dWd7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33915625"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33915625"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:15:09 -0800
X-CSE-ConnectionGUID: 9kE8jldQSze0mbbuJOlP4A==
X-CSE-MsgGUID: 48Pei4+sSKeksZSL7RqDdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95299790"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Dec 2024 20:15:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVAo-0003on-0K;
	Mon, 09 Dec 2024 04:15:06 +0000
Date: Mon, 9 Dec 2024 12:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:syscon-rework-2 2/11]
 drivers/mailbox/mailbox-mpfs.c:254:5-11: inconsistent IS_ERR and PTR_ERR on
 line 255.
Message-ID: <202412071737.nVkRQVKt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git syscon-rework-2
head:   9f279391fc4ab2693ea0fe60dca080c7db2691e0
commit: 6692ff5a8ee2df1c83af1c1d1a0dce7bc947d2a2 [2/11] mailbox: mpfs: support new, syscon based, devicetree configuration
config: m68k-randconfig-r054-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071737.nVkRQVKt-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071737.nVkRQVKt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mailbox/mailbox-mpfs.c:254:5-11: inconsistent IS_ERR and PTR_ERR on line 255.

vim +254 drivers/mailbox/mailbox-mpfs.c

   242	
   243	static inline int mpfs_mbox_syscon_probe(struct mpfs_mbox *mbox, struct platform_device *pdev)
   244	{
   245		mbox->control_scb = syscon_regmap_lookup_by_compatible("microchip,mpfs-control-scb");
   246		if (IS_ERR(mbox->control_scb))
   247			return PTR_ERR(mbox->control_scb);
   248	
   249		mbox->sysreg_scb = syscon_regmap_lookup_by_compatible("microchip,mpfs-sysreg-scb");
   250		if (IS_ERR(mbox->sysreg_scb))
   251			return PTR_ERR(mbox->sysreg_scb);
   252	
   253		mbox->mbox_base = devm_platform_ioremap_resource(pdev, 0);
 > 254		if (IS_ERR(mbox->ctrl_base))
 > 255			return PTR_ERR(mbox->mbox_base);
   256	
   257		return 0;
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

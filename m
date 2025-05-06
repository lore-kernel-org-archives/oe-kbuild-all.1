Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D3C372
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 07:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746518150; cv=none; b=SbwX8IQ2AzYEDzAIZHTDchlHrzl5VAE/mES/DfAp+zX3podnkpzoRae+LMN7HrBBUqsIMBDnG7C0LactxL9izw/y6u6m0C+rogXxCO/hIkQRkmI/u7YBrYYvBOzNE+RPUBUh6YEPWdV2ZH5QalL5SL8hL8w6RkaRrawRhhg2uPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746518150; c=relaxed/simple;
	bh=Ytfd7F6lk2yMdhQ47Jw6+c84Ko2VPYhFemvZZUsvrN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dSTn2bzrFKQQZb5nG3x2Nq8LHbk9P+05ah9pfn+wPsP7F4acR0JMTfwyrtyMcB/3HKZwpclEtYNHXpq7OaLpFNF6EABL9rYuHpMzKsNBGP78+mCXawvWmUoEwA4yKOAM2ATT+i3ypnn5prrQ0n9nN9e5NExcnJoNCkFPyuuaIzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjTJI19P; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjTJI19P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746518149; x=1778054149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ytfd7F6lk2yMdhQ47Jw6+c84Ko2VPYhFemvZZUsvrN8=;
  b=XjTJI19PCLBbYpNrZCYz9JLxaFWCnNB23DtrbZ4169n5+WIjFEAvB81D
   z0m301stLoqBB757BMvKgfoY+LYiGqabUQnoBzNbq+6RUONyXxB2e7Wsb
   tbhq2N7VYvTS2c9i36lkSeGogkZ22KMV98JFpR9akIsR7CGlIXMLGouxq
   2+/fQEhXAzzdvzUeyjhUQpR2LeIZKw75vaMXoh1fOAXI4iHFOm2DTWEb3
   Ao/sxiPClGDE0yYztodh6Z7MGALyFMNTLKN1pggJ3M6Wyt1nM8aS4NLiQ
   8TBrTfo++Yx3DF8Ui77ciSJE2FnuDcbfx8COgCC6jxajEnVrHrmXP5SqP
   Q==;
X-CSE-ConnectionGUID: awELXnxOR2WV74wGIV4dSg==
X-CSE-MsgGUID: SQqx8GwWQ3uQgzjWv4s3iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="51987775"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="51987775"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 00:55:48 -0700
X-CSE-ConnectionGUID: in+ibJlcRX6Fal+Aj3Im3A==
X-CSE-MsgGUID: 9xIcWnQoRfWqmb9Zvc4y5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="139579993"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 May 2025 00:55:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCD9U-0006Nd-35;
	Tue, 06 May 2025 07:55:44 +0000
Date: Tue, 6 May 2025 15:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for CAN_RX_OFFLOAD when selected by
 GKI_HIDDEN_MCP251XFD_CONFIGS
Message-ID: <202505061558.0ZFKnBvp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   e20c2e5ba70ac5fd2f1157f57a8ee53e07b671b5
commit: 39f48f66f74cdfa79f254376442a07663ab58335 [2/2] ANDROID: GKI: Add GKI_HIDDEN_MCP251XFD_CONFIGS
config: i386-kismet-CONFIG_CAN_RX_OFFLOAD-CONFIG_GKI_HIDDEN_MCP251XFD_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250506/202505061558.0ZFKnBvp-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250506/202505061558.0ZFKnBvp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061558.0ZFKnBvp-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD when selected by GKI_HIDDEN_MCP251XFD_CONFIGS
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
     Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
     Selected by [y]:
     - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

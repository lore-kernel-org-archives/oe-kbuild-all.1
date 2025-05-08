Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CEC4B1E78
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746701690; cv=none; b=F65nnNIqa6H9Px8v7/j9YDhF09hbdRehYd6Oro1OrPzyA2q3iHRcpve3y9y6r5ykvbSrX1el28hLhTqSP/bxzUSNwcJI4NAQOVhV++h5s9sV9eJQ5JDuKsiG8FaDjKFBAleXlEoynkHC+gExAULaCmADh6y8XMER5mapfoyl3eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746701690; c=relaxed/simple;
	bh=VGNFSjQ9r/Tb6d/JC4PjSuhu3twWwzW+Ils9gX56TQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eBA1Yv8DwIYFi/PhzoZ/LKf5c8Aqiust0GvBEY1oowamCxIgfWr140u+5A4Q5Lwg+Jh7XjKqE/9OyVoszD94m/SdbM1sY4R8zJNvlFWsz8Qu+uguAtJubTXpoUvQQCPGpFD9Qu7roXOdmPRdPMI40dxSTUNFAGpksgLd4+TtM24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJjINSiD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJjINSiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746701689; x=1778237689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VGNFSjQ9r/Tb6d/JC4PjSuhu3twWwzW+Ils9gX56TQE=;
  b=CJjINSiDbhscrPUf+edkQH7XsCjYsZpcVK7sSLulbwCukT7f6FEYZE5U
   423Sus3ftQJjfpAfE9f0rnaIRNb8fmBcsLjE2XhDV+LIiAXZiqpxqUAvq
   pmBWdbp7aeYetGINcdtAOpvSEQDdmo6ax5LwO78K8hDuYjCDIlhrlgjKK
   z4yUX9Hj8KEBYD1pEpOHKfZnPDY1sOhGUOubNIB70Y/HdcPRv2BkKAOoQ
   8x7ZucS7Te4ItTg6tbh0PjWZoqVCfB4maGyRNOM/SVDxIr+dp71tBgbjl
   Uo2lNZNHtPUgVX6uMKAboABZ1WkzvWcoippCyNMUJHjHsBkFG9IkWhL+b
   g==;
X-CSE-ConnectionGUID: 6TN9BCV5SQyNGYGwrT0M3g==
X-CSE-MsgGUID: +gRsHO3xQGWDszNYA/yyMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48625871"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48625871"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 03:54:48 -0700
X-CSE-ConnectionGUID: +AgXAcEyTnK8AMi1qQkbWQ==
X-CSE-MsgGUID: DQlKldvDRMC3IWDLk7SCuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="137248789"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 May 2025 03:54:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCytp-000AtH-12;
	Thu, 08 May 2025 10:54:45 +0000
Date: Thu, 8 May 2025 18:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-02 1/1] kismet: WARNING: unmet
 direct dependencies detected for DEBUG_MAPLE_TREE when selected by
 TEST_MAPLE_TREE
Message-ID: <202505081803.cnP2dL9R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-02
head:   30a9c932ac88484e9976b647a161971cc850ad41
commit: 120b116208a0877227fc82e3f0df81e7a3ed4ab1 [1/1] maple_tree: reorganize testing to restore module testing
config: arm64-kismet-CONFIG_DEBUG_MAPLE_TREE-CONFIG_TEST_MAPLE_TREE-0-0 (https://download.01.org/0day-ci/archive/20250508/202505081803.cnP2dL9R-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250508/202505081803.cnP2dL9R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081803.cnP2dL9R-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE when selected by TEST_MAPLE_TREE
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
     Depends on [n]: DEBUG_KERNEL [=n]
     Selected by [y]:
     - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

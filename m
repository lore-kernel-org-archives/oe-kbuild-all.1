Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66CC2C21DD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 05:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785476516; cv=none; b=eljEDHAXXdrCNE8NEMaaChpbxDsH3kM4jFfrvDtAknP99E5bH1NsO+rHXLJenBz9FgSmgR66PK3XmA9mIwte5vhq6KzzUkRsXcWRojvmpKYYVvuyVrsOUjgCBLDJuDK4Err5MuAiVKrv1Jj3X5aIN+iIRYUiI9HQ32K0J3SUI3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785476516; c=relaxed/simple;
	bh=Yo3Ww0gdV/RYEjeRLmWtfSA5K8BVkWOU0dIxz6emFX0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MeW+pUwgZfF0cO4Cgzo5MArulDJMSkHuIqC97B+kDtzfwWzeE9zNRsx7ULL8xnSZLkvwnIufYg/XMAbd0l3FbY35Apnrmr0LIXUDLkGBWc24DlaOC/zAZC6SxCQhFlb+zuD859fFo+jKUoauHTN0x9TxnunHM0P3pB/KC0tuvX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2mV7c5l; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2mV7c5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785476514; x=1817012514;
  h=date:from:to:cc:subject:message-id;
  bh=Yo3Ww0gdV/RYEjeRLmWtfSA5K8BVkWOU0dIxz6emFX0=;
  b=J2mV7c5lphtB+G3tQikEvfdBGHahavPYs/RjwokBJs4DwuRdSECuDiL5
   BLpAyZLoxWeW4s3ea/s7JzSitErZXR3gRMGhzxbWn3KwgGF7T0zkLLsBz
   0QgbC0m8pKs7UxC1g0c9tpgww+mXESSxsyr4py7zOPQZKHvDxlw28khfy
   AZurrCkBkX+XJQI2GJzoDlzj0GKWG+ARAuzOUmmvYl/cuEQvm8bP/fcEc
   VfDE979BSd9FBDhe4oYAQYW+gqHeQYd/VZb5Y4Zll/uUMORaBvLKrrnYt
   sfAlpRW+VLwjWr8NevDYZfcZR0dcVS4rX3saosO9P0bUkZTfSUyWLx5qx
   Q==;
X-CSE-ConnectionGUID: LMNJHGRmTlqF+d4Bdh/3bA==
X-CSE-MsgGUID: zg1wmXpQSVm1egRg2cpR9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96761021"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="96761021"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 22:41:53 -0700
X-CSE-ConnectionGUID: lMJgv80wRJKoqm8k+Y7Tng==
X-CSE-MsgGUID: eoD8O34bS7+OvY5yfdAdJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="265559438"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jul 2026 22:41:52 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpg0D-000000000A1-2sGp;
	Fri, 31 Jul 2026 05:41:49 +0000
Date: Fri, 31 Jul 2026 13:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/node_features_v6
 33/37] Warning: mm/memory_hotplug.c:1716 function parameter 'np' not
 described in '__add_memory_driver_managed'
Message-ID: <202607311324.ulE9sfWn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gregory,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/node_features_v6
head:   2a91be748ebcfd653985fa1c6c41371d45953e93
commit: d6f3a0259bf5c5a29a0909ad6a7d9f212765ff5c [33/37] mm/memory_hotplug: online/offline private memory nodes
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607311324.ulE9sfWn-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311324.ulE9sfWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311324.ulE9sfWn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/memory_hotplug.c:1716 function parameter 'np' not described in '__add_memory_driver_managed'
>> Warning: mm/memory_hotplug.c:1716 function parameter 'np' not described in '__add_memory_driver_managed'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

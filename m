Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07343153BE1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 17:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713807278; cv=none; b=PyT803Lpdxw8lgUx+NmZZufMfI8cegIf/QNi4DHcKTWCtpGPZm1SA9g2aAzw5e+fAQSj6hkpX87I7z5FswtFoPxIwey3lmb4cd+AzriFqjq/P0vvbRniyyn605uKqeLhtxtgXDwgSy/4ebijZOVBPKXmzaOwxEf8AWX8g1ZdvFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713807278; c=relaxed/simple;
	bh=knrcv7kEWvwXLWUJCbi4uw29JtRQU2C4ia7F6pqq1Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m9cyFL2btyZVXFOBxh6vDtHepaM2NxgCFvUr4pnbP+jVGb+CjZprBoIRo/vZbfgBn7MaIaNNM/mEuEqKLe3yzaRarp4oODvtcKBl+rLjgGZ166o17rH5aZMRpuoVFo0RNUKpqzU+qLcnnPNrsBMH5gUioId2MqE19UtghwI91gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kw6k5WNZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kw6k5WNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713807275; x=1745343275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=knrcv7kEWvwXLWUJCbi4uw29JtRQU2C4ia7F6pqq1Q4=;
  b=Kw6k5WNZMtvjXbzy15clIjaMH2NkwWI8ccx9feewf7Dn1I0gVFH2yhFE
   +vo4riUGSKqLycZv15XckfeLDdRe8px3tZKCObzMLLHZKKE7yJr+5OEha
   w5vHA6cjL3VXEEuFfXgqlrahbVB1EwyAt23FkiKK6OZKS33RRcxodE4NH
   ulvLu0LEhXFY57MUnadng8vpKZM1/LnLB6Dj9UMsxmViQydcYpSh7M0AV
   RbXpQhBo1/g0x++i+cXeNZOq0I02i59G1k4vfI4XGYTEwqhQrIg6MKbwa
   B5jh0KfhS7NMvN0So1F+imMiAm8VNqRYooIiaNTaYIDQmnqYS/J6N8T51
   w==;
X-CSE-ConnectionGUID: FJonENBmSVe7w+1bJwXqRg==
X-CSE-MsgGUID: EeZE3n2zSe6O+p4UujMlTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="19912517"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="19912517"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 10:34:35 -0700
X-CSE-ConnectionGUID: kskbUqNnSOSNwgLKb6ejSQ==
X-CSE-MsgGUID: EO1Co84LR9y3NuNyOoEn7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="28899725"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Apr 2024 10:34:36 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryxYn-000092-0p;
	Mon, 22 Apr 2024 17:34:33 +0000
Date: Tue, 23 Apr 2024 01:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17815/22166]
 drivers/edac/.tmp_i10nm_base.o: warning: objtool: missing symbol for section
 .exit.text
Message-ID: <202404230151.AOKJ44d0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   aaa8e73e6e85e82e5b0425d2039e1cbc57089fea
commit: 3b7ad71a0a415eb51fb41ddc01ef538a7e163de4 [17815/22166] Intel: EDAC, i10nm: Add a driver for Intel 10nm server processors
config: x86_64-buildonly-randconfig-003-20240422 (https://download.01.org/0day-ci/archive/20240423/202404230151.AOKJ44d0-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404230151.AOKJ44d0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404230151.AOKJ44d0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/.tmp_i10nm_base.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

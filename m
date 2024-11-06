Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A462C80
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 05:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730872273; cv=none; b=Czhx5Be5EZbTO3uWcsBnZZwW8wIdt+sRlvEFkwPnLjsIiDzcjJvFURNnLaCGXMlzQmerPDq8302GQEl6Hw3NBkJIDAH8bOu/Q2rJHiOnG9SIIXWuWJsnsaacuJ6NxbXaooVMhJ80DOlwORVgaMvl1xVpBBgSnvu6rLkvvFKaUNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730872273; c=relaxed/simple;
	bh=wG9AbTsP3dUGf2hW8jRUjYGBrxa84hbQ6kUMY4bkuls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jRrJym5EKdWqKwc/dgVGnbY8vXhUg8YxhMJP6bkFx6zcz3KixIhWjTSXWLNlljVG9CCa8XjBMiX/s60JLx54sC7A/fDkXPJO0t+FwIPJrUHGRprztNZByS7OdqhNqdkCUY4akWGsekeH8LuL5oAdQYnFmV5+3548X0dVVyt0tdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5tgP2yZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5tgP2yZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730872270; x=1762408270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wG9AbTsP3dUGf2hW8jRUjYGBrxa84hbQ6kUMY4bkuls=;
  b=e5tgP2yZ1dhdEs+tneXRPbaUfsnfVbTSCABHaxelOhPvGY4rMzFhnoxs
   lykkupP/54wdiqB96AeXlh3uY1lrSjMMFHYmhHDgcNLKGPVfyzywhmml8
   bG3GKV7jVy8GIJ8Y9q0VOcpVj0MQhKlUzq5iPFpIxzasgBtcFqIEMYFr3
   C7pS5/jauWFq0OaGuDAVoJZbW36eOknSZIrg4jPHgO/a9Qe8ElQeLEGFP
   Ju3ucLFcwq+LYVrXWo4dFmYmrWCuAE8rftm/oFdYU13ngN0UWNEmrrL85
   5He5LPvPoKf26/O75u5ym9vJGlCaXUOYgZcx8nMyguQBPqwq+idC1q/um
   g==;
X-CSE-ConnectionGUID: MHG2AM69Twan3saJtjaakw==
X-CSE-MsgGUID: BjfI0zfoQZqUQrEM7ruNbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30068162"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="30068162"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 21:51:10 -0800
X-CSE-ConnectionGUID: a06ZT1mwRdqw2Mqh/s89rA==
X-CSE-MsgGUID: QJrt8WsaQaecUB2/Q94GDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84001416"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Nov 2024 21:51:08 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Ywc-000myG-2f;
	Wed, 06 Nov 2024 05:51:06 +0000
Date: Wed, 6 Nov 2024 13:50:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1218/1218] drivers/pci/pcie/dpc.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202411061521.R0Vz05vu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e33ed48bc600febcdca9e71e43cf224934dadc4f
commit: 58d584102f06f870f118644f1022c751e015e7bb [1218/1218] PCI: portdrv: Initialize service drivers directly
config: x86_64-buildonly-randconfig-006-20241024 (https://download.01.org/0day-ci/archive/20241106/202411061521.R0Vz05vu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061521.R0Vz05vu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061521.R0Vz05vu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pcie/dpc.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

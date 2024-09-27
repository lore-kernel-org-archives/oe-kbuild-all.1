Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D872F2E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 05:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727413740; cv=none; b=rlnMmSaI9avTlQWSELzztNqub8BS+TxOIOS9MtGq7qgj7Nsusd5sWgd0C0UkYynBJ7ADe9/0s48nongwCKb5/Ei/+pQUL9mM7rE+jiNiuvrPIpj8KF/ZA8qqw+CnyY3EweF4L1fcm7G4tYyQdUpRDkClYbtd1PfqRwPWIOA1QOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727413740; c=relaxed/simple;
	bh=srXTv477U8eni5+YFAogyZfh8XjT5mBwK7SXCVkxDbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y20P6MwB5X/vNiaG1sEp+XEim20v07+QgZ9wPEpZ/KvV71a3NVQYHzqdoNUjVB2dx9jvrU7+z8zHBCFNfnyBRgSg2nURApw7wiDdMzDvFDM4rIvoaCzO2egdGnKdjq6UNSMrQgLwGfgqTZeXF8LjgCY823EJonKVRBZwa9zKuWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hVYtuA0M; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVYtuA0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727413738; x=1758949738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=srXTv477U8eni5+YFAogyZfh8XjT5mBwK7SXCVkxDbc=;
  b=hVYtuA0Ms7oi7RBMTV1FHqC9Vraaf+QVgVBCPAjLOfjqxTIqGqo73zqA
   jtYVhe0kH+VFU3KA+PgAf/VAcWU0BYvwwpWjRMC/8Fj+TMb7WAFIP3tgx
   sQCZL77vU0sNsH90KAlFRhcVoyCaaqFzvjyKynJ2j0xrh6v28klkzR+as
   LqH/Dz7EdFQy196HvJdiMkQxsPaWXyJlyylwJyPB2Ou5RR0y+uX6FoggQ
   JZ29/6trq+87+PBsDNxWs/BEiyfSYoDdkI7dux/0Plz4gOu+vF2GRechu
   q10Sfb1RdQnwxFl+qP9jVtlwapWnwsdwxU4RX4FeN0O8SQlAi+3+zB5oy
   w==;
X-CSE-ConnectionGUID: LOqjAT4LSMK+HCvtcdTwFQ==
X-CSE-MsgGUID: c8A/OgifRSS7VwOhFOprWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26055997"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26055997"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 22:08:58 -0700
X-CSE-ConnectionGUID: sNxQ9awQQxy+5tzeIVSycA==
X-CSE-MsgGUID: T36oCI1GSGi5wKjWKHaABA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="73201920"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Sep 2024 22:08:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su3Dq-000LVF-0X;
	Fri, 27 Sep 2024 05:08:54 +0000
Date: Fri, 27 Sep 2024 13:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17806/23779]
 drivers/powercap/intel_rapl_msr.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202409271226.X7vYNpq3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   f9510969035e796a27375a80d9d6489440e17a1a
commit: 0ea5d304521b68fb459c57e55f3f1bd853127bc7 [17806/23779] intel_rapl: abstract RAPL common code
config: x86_64-buildonly-randconfig-001-20240926 (https://download.01.org/0day-ci/archive/20240927/202409271226.X7vYNpq3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271226.X7vYNpq3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271226.X7vYNpq3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/powercap/intel_rapl_msr.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

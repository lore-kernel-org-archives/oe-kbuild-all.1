Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00F220DD48
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 04:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761711383; cv=none; b=dSlgm3/YXcolDLsB/9PZrWtDXGHUjdwhypnhz4zteZ4t/7OnqX6hAC/IJ8OVLNVS6minsLkve4JrjZQxji71CbDerxk1vxyc5BSKy5ghAekc7llaJ2ZPSLI4qigSWhzAt1eAXs+ZMgAgLzwNeaJVpmD5bUzjy3o/5Oq1t1tbGSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761711383; c=relaxed/simple;
	bh=UI5GlAGDkhne9KC80jJAGWLqLyZuGRfrdZhZt9Y0T00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TCFFFsOrHAzR0up7EDiFZCM+YN0inSJxbwqFXcSSkfnhyv9hkIuySEoaQf198ORUJkt+ISh0VxEgimN9pTlJXTHedoKwy9mYDx1z+7ZqkXUKqMLelxINVvklmxi1TYPCWlY55D2nogvPQ4Kot1XbmvqnFg9wdTPJSnhNS6I89tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCBUXAuz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCBUXAuz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761711381; x=1793247381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UI5GlAGDkhne9KC80jJAGWLqLyZuGRfrdZhZt9Y0T00=;
  b=eCBUXAuzOW6UyIvywttpIrST72jea4x8oRKNJ/sBbHrpWilecxYKfUvY
   WGyxbdyxXBOUO7qqfhAEnyGEC8omEEcbMSyyOMfHB7nbuUxx/6LEcgVpH
   iehQVs9trD0E60jQuxGU3Z6tSkMFFXaDZBWhqrCLbnZ+IUPCa2wyBYs0L
   QWUgU2l9w7X+VXtR5HZD0sXkCssL1zO8DSCA4IBbQ3oKa3/df2nyS5g2D
   FpslalQinYm95Ki6azw8FqhEjI4z5TNqGHneWpOtw0zFj60sCBY7AQRjG
   C383HgSZxAGBTrf6rJ9zQrwq71uC+GLEQ2IvHPTZZ7H7sfYhFm+8MiDne
   A==;
X-CSE-ConnectionGUID: 2MkqhqsDT8uv+Sjw05blyQ==
X-CSE-MsgGUID: vcHaPr9zR2CXkjuGpZiaxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63918708"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="63918708"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 21:16:20 -0700
X-CSE-ConnectionGUID: 5ZfP0U9tQRSV3wJRVi+l3g==
X-CSE-MsgGUID: 2KEfhUGqTPix73KZXxBVTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185176927"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 21:16:19 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDxbH-000K8T-05;
	Wed, 29 Oct 2025 04:16:01 +0000
Date: Wed, 29 Oct 2025 12:15:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, y00878127 <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3058/3058]
 include/linux/virtcca_cvm_domain.h:69:51: warning: 'struct pci_dev' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202510291251.SHQAixz5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi yxk,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3ecf87d6cde5142e8e8620915713663346d033fe
commit: c5161d7e11a7e30755b2ec55aaebfd500193cbbc [3058/3058] virtCCA supports SR-IOV in CoDA scenarios.
config: x86_64-randconfig-001-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291251.SHQAixz5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291251.SHQAixz5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291251.SHQAixz5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/sunrpc/sched.c:24:
>> include/linux/virtcca_cvm_domain.h:69:51: warning: 'struct pci_dev' declared inside parameter list will not be visible outside of this definition or declaration
      69 | static inline int virtcca_add_coda_pci_dev(struct pci_dev *pdev)
         |                                                   ^~~~~~~


vim +69 include/linux/virtcca_cvm_domain.h

    68	
  > 69	static inline int virtcca_add_coda_pci_dev(struct pci_dev *pdev)
    70	{
    71		return 0;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59D717C91
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 01:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065092; cv=none; b=Ktj4eBOZUQ6Gie78rtsxgDKpPXfM+CdgqzeKTKiJQ+ZjDyVX4rocr6sdUtrJvgyzcPn0RjoN+zKCtAzgDNLOS9TTiUOrkCVthB3y21KgDsMtlgA8uqfH07aJLUhXhCmvyrEYkvXdnAhompxMasS17OnajL7lXUGFwPeHeyp9v5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065092; c=relaxed/simple;
	bh=UHF0Ui1670aBF+9cMv4irN6Tmu48tBnplqTRKWNtaIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CJgOjfepRp1xoJ047FKRMWmAcLGQgavyzklpXl49kf+c0D13CDom2hoI+dkSt2DVlOOqBw0ZDZrZwOyCIGSDDc1Rf711gQYmmTHwPz6M+ZM3UB/MyMO2lIvg6bTenPlAe7KOrbiL7xQCriRwX+Pafupu+u7NuYY5tltlrKxDWi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nj0yly81; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nj0yly81"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732065091; x=1763601091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UHF0Ui1670aBF+9cMv4irN6Tmu48tBnplqTRKWNtaIs=;
  b=nj0yly81dBtYr+u9wtaR74BgrIPF48Df9I37/nGkoOWSBsTqJ2ENMOmy
   8/Af6+IRpd9YYDNViPFG2330V6MHVgfWmHaFuGgKm4mxLDi7PLjlv4xmb
   Ek1u/b5J0g7tTeb+a+c+LcjCrZ39AUMQyx74/Ru6hgNjyz7FWRpxRVy9m
   4m87l8fSZls/8TCEsmGQA59r6L3vYy8gLSslJvH3GZDbuJ+FMpDeLbTud
   ENlpHH4ovShh+qs+wATKHcRVHWO6doHy0ddD4QStlk6ENGvXsRjgCll4y
   /bUpQ12Ba/Y4o/l7hFu8aA3IA5Yr6dPKTUQP3hE3Mb7TMl5Nw1WDsHCEK
   A==;
X-CSE-ConnectionGUID: ocMXYZvdQAqvuf30Ww/fhg==
X-CSE-MsgGUID: w4NQXmrURBGOo8bKeessPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31851265"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="31851265"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:11:29 -0800
X-CSE-ConnectionGUID: xSrZHGJBQtSNmWnndxEQdg==
X-CSE-MsgGUID: CZHWCi/pRwiEDxOQFVfquQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="90572464"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Nov 2024 17:11:28 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZFd-0000O2-1b;
	Wed, 20 Nov 2024 01:11:25 +0000
Date: Wed, 20 Nov 2024 09:11:14 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-v2 7/21] include/xen/xen-ops.h:10:10: fatal
 error: asm/xen/interface.h: No such file or directory
Message-ID: <202411191921.5LGplBvj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-v2
head:   702c1af18bf513f8297bfbb99b859c37b7b900ab
commit: eed15d60367a3ec63f468407781a3f91bae76fae [7/21] virtio-msg: Add DMA OPs support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241119/202411191921.5LGplBvj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191921.5LGplBvj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191921.5LGplBvj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/virtio/virtio_msg_dma_ops.c:19:
>> include/xen/xen-ops.h:10:10: fatal error: asm/xen/interface.h: No such file or directory
      10 | #include <asm/xen/interface.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +10 include/xen/xen-ops.h

e04d0d0767a9c2 Isaku Yamahata     2008-04-02   4  
e04d0d0767a9c2 Isaku Yamahata     2008-04-02   5  #include <linux/percpu.h>
cd979883b9ede9 Stanislaw Gruszka  2014-02-26   6  #include <linux/notifier.h>
be81c8a1da2428 Daniel Kiper       2014-06-30   7  #include <linux/efi.h>
251e90e7e346a2 Juergen Gross      2022-06-22   8  #include <linux/virtio_anchor.h>
f030aade916508 Juergen Gross      2018-08-28   9  #include <xen/features.h>
7892f6928d0cd9 Ian Campbell       2012-10-16 @10  #include <asm/xen/interface.h>
4ccefbe597392d Stefano Stabellini 2015-11-05  11  #include <xen/interface/vcpu.h>
e04d0d0767a9c2 Isaku Yamahata     2008-04-02  12  

:::::: The code at line 10 was first introduced by commit
:::::: 7892f6928d0cd9ef9200a193183c2033b3143dab xen: correctly use xen_pfn_t in remap_domain_mfn_range.

:::::: TO: Ian Campbell <ian.campbell@citrix.com>
:::::: CC: Ian Campbell <ian.campbell@citrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

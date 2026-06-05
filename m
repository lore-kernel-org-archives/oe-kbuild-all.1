Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85083B14B2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670140; cv=none; b=YZjtLZf7WDpo0XRbCHLd7ocAx5wOzy18c5Kw3cKut+hLyxlbzbShDK1crur9N0gtoiF6h4a2wnkULAhPtLfrnYiwqlgL4ZxKwdxpp463KRnx0Hv1SY1Au9as54WJgP76vi2iG3LSJggIFmlMa4LrFLQqScOnfVQSgeFlRVuyyyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670140; c=relaxed/simple;
	bh=M9407ua6lu/sD8kPFzHcw5LIFMRU3p5r/oz4PY1llRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWlsCzhtZyF5d5WD+uR784lMYrJngfX1C1dqHnkd0n0cFU2WZ3xS3lFOB8YwcXEbuUzmQWQYsvdx4ak9Pq2RYx1c2F3sjzr9PqPJWHpHM8w53nzD/p25hUyh95rj3TaCeRfc35uZazBPayJOtav5gcUl2UGOXL9LPprxM2nZ5jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmwkvktY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmwkvktY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780670138; x=1812206138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M9407ua6lu/sD8kPFzHcw5LIFMRU3p5r/oz4PY1llRU=;
  b=ZmwkvktY4L20IIDsJpU7oz+4wALMU8E60jnnUDFYkn3A0WrGmc29JiwM
   aIJDWDch94zs7pDo98IHm+guX6+so92wlfZtnFFiXruH4xcSTgQTzPygJ
   9WcIz3isTDaYYB8tdzNjwiwqrw/nIWV/lOb3jmk5tbHTSJLUSEtDh6Y5Q
   jI/COE9mLZQHvr9Di2XmiQNLUpUKiage+FqLQjgvTuVXHxqQySvmMC7+m
   5Had7z4ds56G6a0WHZbvHKS+6zt+JJleUUvi6hzpVBUw5ULA6EHe6+yYL
   u6o7ZVb/I/Pvhl9noMND0dXtDQZubf8OMZ/4ouoZoCrnTq35QYZKGgxqm
   w==;
X-CSE-ConnectionGUID: bc9i2g31R/mtzuO3hbnmXw==
X-CSE-MsgGUID: /QUiK+IaR5SePjyfsuo7BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92990891"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="92990891"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 07:35:17 -0700
X-CSE-ConnectionGUID: C9uhMZD+Qoi0qS8I8NpKPA==
X-CSE-MsgGUID: IGgYNY0HRBSt7npojFNwug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="268549446"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jun 2026 07:35:16 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVVdi-000000002aj-200o;
	Fri, 05 Jun 2026 14:35:14 +0000
Date: Fri, 5 Jun 2026 16:35:07 +0200
From: kernel test robot <lkp@intel.com>
To: "muliang.shou" <muliang.shou@sjtu.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 3/3] KVM: x86: add DSM APIC forwarding ioctls
Message-ID: <202606051652.UmzRAJBQ-lkp@intel.com>
References: <20260605100031.834938-4-muliang.shou@sjtu.edu.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605100031.834938-4-muliang.shou@sjtu.edu.cn>

Hi muliang.shou,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on kvm/next mst-vhost/linux-next linus/master v7.1-rc6 next-20260604]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/muliang-shou/KVM-x86-add-DSM-IRQ-forwarding-ABI-and-state/20260605-180536
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20260605100031.834938-4-muliang.shou%40sjtu.edu.cn
patch subject: [RFC PATCH v2 3/3] KVM: x86: add DSM APIC forwarding ioctls
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260605/202606051652.UmzRAJBQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051652.UmzRAJBQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051652.UmzRAJBQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: include/uapi/linux/kvm.h: leak CONFIG_KVM_DSM_IRQ_FORWARD to user-space

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

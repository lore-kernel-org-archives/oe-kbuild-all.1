Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A2C1FF7C5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 19:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750880941; cv=none; b=Iyqd6b4DTxo9HB41tGeiHW5crp0vKfXVq0hLoDrU7Jy1Ks4cANmSbdpU9RFgLyGAEAeAgYLEpKu/m+IJJvJst9faY9OvB7WqTTa3e7fCOiZKKhHFvG7xRq5jjYD2hgvlgyYyqzvUUzm4ZQdX1DDs1VjmgzbDvDLhiJnoj3Fo9y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750880941; c=relaxed/simple;
	bh=CsIf7z1ha95jv/26uSFxVFQVlkJT224wxcEghaSo0N8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nMKPz7DTSa8EnRHAQkOjBqsKek1EOg66E5U0ocGyvZ9PCY+4Sy8MnWpoE6qmBb4F9dn/8X2T7QigAfyIev8fx62xbuWsdLv2eSMWICfUGsZee9TDGi4DgZ/UGb505Fy+0Tctv/GCUhRYVCLd3z7tVEqubvwnzHOOXiHzsYve6HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ls/oBKhj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ls/oBKhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750880939; x=1782416939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CsIf7z1ha95jv/26uSFxVFQVlkJT224wxcEghaSo0N8=;
  b=Ls/oBKhjSRZOj8LAV+t9SiIgEmmuUfM41qTNjfMz9pKQyvXnF/BviQQd
   xNrsl6LoF7nM+qIR7x3x8F22sRILqjEDeOfpiI1Q436r7T4Bl5NyAOF1N
   9yzjTqBLuse5KSjUp9QMAY2URnXiGmT/XgAtQdqhMgZZlNeSthZjG9DE9
   J/t3klfpHn6iAG+S3yqhfjrXEfc2PCCKW4R24CUkgOz+4nzb5PBDFCHQV
   sZ5wv/RRs7SEw7HZiuOF7In5ylmE9kZgbHghL74Lum9mdalfz52PgAU6t
   rMpPUY/+cTuRITAlLZ+Q3tB2jbvwBH1BOlUprKQo/XGdIyTI+r6PRTyCf
   w==;
X-CSE-ConnectionGUID: gn5wsj5KSCCq3iz3RSNlqQ==
X-CSE-MsgGUID: ztDxnBWkSQi7UISuba9tmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63853720"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="63853720"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 12:48:58 -0700
X-CSE-ConnectionGUID: /062zILUSeGbllPAqrt/+w==
X-CSE-MsgGUID: qZ8/B8ETTu2z1ix0shnGdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="152080019"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 25 Jun 2025 12:48:57 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUW74-00004J-3C;
	Wed, 25 Jun 2025 19:48:54 +0000
Date: Wed, 25 Jun 2025 21:48:45 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195] kernel/irq/proc.c:334:13: warning: no
 previous prototype for 'register_irqchip_proc'
Message-ID: <202506260330.9iB3xJD8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: 3053668e6b211924bb67c19d791a5a532eca2ad8 [2195/2195] arm64: Introduce Xint software solution
config: x86_64-randconfig-2005-20250501 (https://download.01.org/0day-ci/archive/20250626/202506260330.9iB3xJD8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260330.9iB3xJD8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260330.9iB3xJD8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/proc.c:334:13: warning: no previous prototype for 'register_irqchip_proc' [-Wmissing-prototypes]
     334 | void __weak register_irqchip_proc(struct irq_desc *desc, void *irqp) { }
         |             ^~~~~~~~~~~~~~~~~~~~~
>> kernel/irq/proc.c:335:13: warning: no previous prototype for 'unregister_irqchip_proc' [-Wmissing-prototypes]
     335 | void __weak unregister_irqchip_proc(struct irq_desc *desc) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/register_irqchip_proc +334 kernel/irq/proc.c

   333	
 > 334	void __weak register_irqchip_proc(struct irq_desc *desc, void *irqp) { }
 > 335	void __weak unregister_irqchip_proc(struct irq_desc *desc) { }
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

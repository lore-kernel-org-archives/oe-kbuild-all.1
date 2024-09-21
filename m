Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6311547DA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726910082; cv=none; b=HkXE1rwM655FvxYeKVEPhYg5PCOzOB/7h3rBAn8D7lpApWyMz3Lox9IgzXF32NZMa6Yu1AVqd0wi6/ZQrARDV6SV/mNqnt/mcbR89VLiyB9KGagYi6dj5T6//waAxPirKFbUfGnvPd9xyl2B+qk9Y6/fbVa9rDFRIkLLQy4OBFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726910082; c=relaxed/simple;
	bh=d1LqkBE4qWbLUI5yz9UWvZR2+pL2IQw+g69VJL5xm2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ENFMnvCYkCEkuB4QShhdqgWDBbV7+xdNhNiQm7CKwMGWrV1fjvvTGR6QEeJ5WIZd2UBT7ldqxdFlgYTR0kPOIi1wEwxusMNsiV31oEQhZ+01umpJShgy6XC0SaPVMf4yIOAQUG3+fevcd0PifLowx/evFtVWSqxQ7utF2MkcktM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCN3sFxb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCN3sFxb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726910080; x=1758446080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d1LqkBE4qWbLUI5yz9UWvZR2+pL2IQw+g69VJL5xm2w=;
  b=DCN3sFxb6XgfaENLaN1evquqGLApgIpvWpEfIRYgLPqAS92ojTvm9KIK
   wRIh4VVjwjYmUhBYB6BntL6PyFm5i5o1/lusgaKGfNJkxJLHGrPlLOYON
   SaBM0CLG7+jpzN3PZBEQ9QymXwO47adB9cSIVsEkSPjBzbfdLOfXs2riO
   sIHx11BJ/D39zS2PWbYlJkzhZPt01xZid6BE6+uZ3zfDYgHLXd+P5i2Cm
   gbpIlvAqpESRGaGqAP9WN8Aw94j2LzbyTMDUxkFKWKJARKDfVVIA9qVdh
   uC5ctuy6Q5vvoN0/TkzAOJdJnmaq/pB54T3Fh+VZvaoliT/N8NNRp5m85
   A==;
X-CSE-ConnectionGUID: HJeg13TfQu2cnJN8yTJqZw==
X-CSE-MsgGUID: PTM+qQ9DRyOey8vv/zGsmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="26068370"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="26068370"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 02:14:40 -0700
X-CSE-ConnectionGUID: 9ZjDPv3QRTO0QdhMZrLQdQ==
X-CSE-MsgGUID: Q0FXbeZlRsqVTXrdltLDRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="75107249"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Sep 2024 02:14:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srwCK-000FIZ-1r;
	Sat, 21 Sep 2024 09:14:36 +0000
Date: Sat, 21 Sep 2024 17:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 6891/30000] arch/arm64/kernel/ipi_nmi.c:40:9:
 error: implicit declaration of function 'printk_safe_exit'; did you mean
 'printk_nmi_exit'?
Message-ID: <202409211722.HQb4h8VT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9728eb343bf95f638ebe53d7bf78063c87131b7d
commit: f86d165bfe5f6248743774bb07af0bd7cff12443 [6891/30000] arm64: Add non nmi ipi backtrace support
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240921/202409211722.HQb4h8VT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409211722.HQb4h8VT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409211722.HQb4h8VT-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/ipi_nmi.c: In function 'ipi_cpu_backtrace':
   arch/arm64/kernel/ipi_nmi.c:38:9: error: implicit declaration of function 'printk_safe_enter'; did you mean 'printk_nmi_enter'? [-Werror=implicit-function-declaration]
      38 |         printk_safe_enter();
         |         ^~~~~~~~~~~~~~~~~
         |         printk_nmi_enter
>> arch/arm64/kernel/ipi_nmi.c:40:9: error: implicit declaration of function 'printk_safe_exit'; did you mean 'printk_nmi_exit'? [-Werror=implicit-function-declaration]
      40 |         printk_safe_exit();
         |         ^~~~~~~~~~~~~~~~
         |         printk_nmi_exit
   cc1: some warnings being treated as errors


vim +40 arch/arm64/kernel/ipi_nmi.c

    35	
    36	static void ipi_cpu_backtrace(void *info)
    37	{
  > 38		printk_safe_enter();
    39		nmi_cpu_backtrace(get_irq_regs());
  > 40		printk_safe_exit();
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

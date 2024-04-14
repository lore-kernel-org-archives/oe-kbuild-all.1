Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402EEEACE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Apr 2024 06:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713077445; cv=none; b=tep2dTo/qqRMJcgK4k6XOud3VMYIbAeOKwt8xFLlr1l7gjPr4xOk7toZ0nJUlxXBUo5T+vypuskW0ww/YAib28s4DVAX4vqJ5qaurIbck4OGyETx8N0H+14htIKxBe9xPRevIhqgVkqw7vT9c7YTkkRT0bUalVnC8dQSsPrVD8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713077445; c=relaxed/simple;
	bh=pSMpG2jhBf6+ckXWxoSRR3n18AeZLvvSXNU9nt0Ykq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CJBhcXaW+dJkIyV69t4hcwavr40Ys2QOo+7lH8PkplKE5UJUjkOSZN5AsvT5BMCrp/MMxEJBHYquyoQd6jV3KyV5eyMCnFVJkQZJB51QdHl0saZ1q8PtME6mhdS3usLbvA5zzoFTi6DZ1HQBX6mNibDwvt8APCNg5cvwKjtiNsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0tWgn5a; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0tWgn5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713077443; x=1744613443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pSMpG2jhBf6+ckXWxoSRR3n18AeZLvvSXNU9nt0Ykq0=;
  b=F0tWgn5aYEZQsFCKTcJNA6/F+FDLZw1QY8+UZiA/WhRcg/MRvSksiWPR
   4LcflYPTNpkiG7zUJq5nIRA/ekx5zxxlcizyd36LCrIeP/ckJgsg2kPkq
   +QCiBRGdwKMh0IbHX+V7OIsBBcMHV9haoo+5SFb+CJwxvxNvSxMr/YQhz
   1nLZAnuoHMNDznK3EIbXdXGyUrZqVuPP28HBAewjwWTH06W9E3gl9v1Xv
   iwGOZs5YnugNpKTRLW+mDw57D5/1R911jxoIV/z5TkvlrhdVpNAEnNrrm
   l5jOSwM8rQFEr2RN3UwKjlF/w++nYEUOjKbz3vfrK1QTJkQ1nw+jzo0fI
   w==;
X-CSE-ConnectionGUID: DkQJ7OitS6qmuvkmSgOHvw==
X-CSE-MsgGUID: ToGqwezTQgWPhzq7IrHnEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="8339730"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="8339730"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 23:50:43 -0700
X-CSE-ConnectionGUID: MpTzmkHzR6GdTBUVHEK3/g==
X-CSE-MsgGUID: M0ONO5C+SiWfLedCaCTxEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="22191832"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 13 Apr 2024 23:50:42 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvthH-0003Re-04;
	Sun, 14 Apr 2024 06:50:39 +0000
Date: Sun, 14 Apr 2024 14:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 11501/30000] arch/arm64/kernel/ipi_nmi.c:38:9:
 error: implicit declaration of function 'printk_safe_enter'; did you mean
 'printk_nmi_enter'?
Message-ID: <202404141450.VgXyPZBP-lkp@intel.com>
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
head:   4134526a9cfd552230ec7a66a1738a9066d9a0c6
commit: f86d165bfe5f6248743774bb07af0bd7cff12443 [11501/30000] arm64: Add non nmi ipi backtrace support
config: arm64-randconfig-004-20240414 (https://download.01.org/0day-ci/archive/20240414/202404141450.VgXyPZBP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240414/202404141450.VgXyPZBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404141450.VgXyPZBP-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/ipi_nmi.c: In function 'ipi_cpu_backtrace':
>> arch/arm64/kernel/ipi_nmi.c:38:9: error: implicit declaration of function 'printk_safe_enter'; did you mean 'printk_nmi_enter'? [-Werror=implicit-function-declaration]
      38 |         printk_safe_enter();
         |         ^~~~~~~~~~~~~~~~~
         |         printk_nmi_enter
>> arch/arm64/kernel/ipi_nmi.c:40:9: error: implicit declaration of function 'printk_safe_exit'; did you mean 'printk_nmi_exit'? [-Werror=implicit-function-declaration]
      40 |         printk_safe_exit();
         |         ^~~~~~~~~~~~~~~~
         |         printk_nmi_exit
   cc1: some warnings being treated as errors


vim +38 arch/arm64/kernel/ipi_nmi.c

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

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C451DE2CF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728391886; cv=none; b=kvWIKO/+aPYEfIC8d1yMPiE2IpvXFrn02fxuhfqdmJPUIrHdlv/i9cEEJ7gS3vtH5zHhaclatd6tcQqwGpi60a5WG09wpGkueW5G3koVbAPFq0w0RFZguz7dFdPuhL96ORD6qVbSqLcm4Gtgl7mCm6pY+e5mTQsijmjA98V9zSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728391886; c=relaxed/simple;
	bh=/PhxmL5EghQqE5iNvPgNLl29466Tpxj2uD+XtvMULww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VcxR0D6ZkamDIDVqWBvCeCEEa8uuTYJtXvcuzeR9Q9aOQtZK9HTYgdjYMCkVCeKJjll7CtVfN5uh7itLKIygCJjEis/91AJ/QI9JAX2EhYub4mcRBnvk1wzTyYQ8F0+BmKrGMdU/naB8Ou3V71D4OWtiMtC9+smzw2nPFgJURFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPlIbkKr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPlIbkKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728391884; x=1759927884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/PhxmL5EghQqE5iNvPgNLl29466Tpxj2uD+XtvMULww=;
  b=YPlIbkKrPWj5slrb32Y6rMEpruwIvaAyJBUV3t+98DcrL58QiaulZH3l
   9+qNgs2SXl28ANUiyxt+Kje+4aDVYvBukrTleNoxhJJ3GvaDsLK0Iu8Mz
   y7x3OSlbEo+r9Xh63qSUi6aed5WAD1tBByAC2ARr5a4xy4deVdxeo8rlC
   /UnVJqQvMH0VhhZakR918WCszXn6nDjExv2D3pl5rx278UE5PYGfWElft
   /vIzJoTJxSIP6v+2bwhtqOQ9DakCZjKSduFrqUMbrUmP2FztU/a9MVPGz
   lrDbMb7HScaq7VwDpVlZk8/x5M5FcfT7OvlIImKFGjTGG3L/45ja6osaW
   w==;
X-CSE-ConnectionGUID: gwI50XomTZ6kaciOXAFDVQ==
X-CSE-MsgGUID: SFxcgRJZQCOlUp1owHzg/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38948853"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="38948853"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 05:51:22 -0700
X-CSE-ConnectionGUID: Z1FkwYTwQ0G2XUkoe5EQfA==
X-CSE-MsgGUID: uzcrInQWQd6kJQOwkeedrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="75698568"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Oct 2024 05:51:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy9gM-00077J-2a;
	Tue, 08 Oct 2024 12:51:18 +0000
Date: Tue, 8 Oct 2024 20:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 6710/30000] arch/arm64/kernel/ipi_nmi.c:40:9:
 error: implicit declaration of function 'printk_safe_exit'; did you mean
 'printk_nmi_exit'?
Message-ID: <202410082021.GasFl3wK-lkp@intel.com>
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
head:   fe7027c3c730b443c2d88e476ad16b966b144366
commit: f86d165bfe5f6248743774bb07af0bd7cff12443 [6710/30000] arm64: Add non nmi ipi backtrace support
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20241008/202410082021.GasFl3wK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410082021.GasFl3wK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410082021.GasFl3wK-lkp@intel.com/

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
    38		printk_safe_enter();
    39		nmi_cpu_backtrace(get_irq_regs());
  > 40		printk_safe_exit();
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

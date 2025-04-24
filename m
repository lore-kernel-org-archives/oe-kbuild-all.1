Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D92214813
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492162; cv=none; b=OFeJKTnJ4ALumgprqDWm/agIahJMH5PrFXdgEeMMuE3Iw/BCthUTeS8Dc9zgkLhf9MgWAIqdHi85ydojCXKY5X9eQ1RdzopR1MyXtHNpjxLTwLlGe+qo1tabQbIeyCp5VUGyHucS2vdtmDlTa0uSZOz1zj7c5wpbmpaumxmL0Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492162; c=relaxed/simple;
	bh=E8ODazevlTfiZBik4hKWtfm09zqbOzoKHhSsFqUmHy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z+QimpE102yycp6jtlWRyNzg49zF1l6DWpdj8sRhfHjGwSK0fnGz5BBYgjKb7FUcMx6NI8/RRmnaVmUc5+pV6CtQg0L22QPMII9mRMfwwqxKFoAzcBsv+todd9auKn3wpV+3W3eZMbu1pB3/3IU+lA81gfcJ2KzmiBWDRTYLE0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RjiP8obr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RjiP8obr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745492161; x=1777028161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E8ODazevlTfiZBik4hKWtfm09zqbOzoKHhSsFqUmHy0=;
  b=RjiP8obrqzN4USDNS8Q9b/xLxeznywYkzDtuK1FxZdkRggdlz3GH38ck
   4QkMPas2IOFAAKZ36Kncca8ArOEhKYOJpv9xlT66q3YBpSbREwyX75bCn
   8vUNZWLJGsvyRFtMCA3Yo/Zbo8HwhF/ATO0NRqTLkCNbcL7wylh+sQnWU
   J/ZlQS/Hz3q9NGz9ziGdKP9UMeg0M0bdXX/nyPOfTl+RnyFzdrRUcBfaF
   yaXGzwrEtzMVnlxi80oOxSg5NW15mvF8km+xirf0KXq+RcaFvuPz5a61i
   X/OYrbV3L7D91G0ueBEiqc+88gi0//tUwOD54VowMHbrGfNRjUb48X35a
   w==;
X-CSE-ConnectionGUID: KH2S4OJRRV+FjXtuxf6M4g==
X-CSE-MsgGUID: FBmIfYheQheAr0txVUYo1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50779555"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="50779555"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 03:56:01 -0700
X-CSE-ConnectionGUID: OLFE6FFkRkWFfml+8b02ZQ==
X-CSE-MsgGUID: jpgsg23sRCmiphcdScEaBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="137754457"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Apr 2025 03:55:59 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7uFI-00046F-2b;
	Thu, 24 Apr 2025 10:55:56 +0000
Date: Thu, 24 Apr 2025 18:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1592/1592] ld.lld: error: undefined
 symbol: init_net
Message-ID: <202504241856.ApFHkRye-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhao,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   08111f03f1ec65598372cfe9bf64f366d575671e
commit: 6636f4434a9c5c9c645694db206188ee5a6626dd [1592/1592] ext4: report error to userspace by netlink
config: x86_64-buildonly-randconfig-002-20250424 (https://download.01.org/0day-ci/archive/20250424/202504241856.ApFHkRye-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504241856.ApFHkRye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504241856.ApFHkRye-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: init_net
   >>> referenced by super.c
   >>>               fs/ext4/super.o:(ext4_init_fs) in archive built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF2B3921D5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912108; cv=none; b=XVqEX04nudp19re3vIYgagDUdD/PlcE0pblYYnppt5XiGCV0pXVkCOWlJYu/rqnx//WK7s95/t8LhYstlI94G6TX0WVI94/eF2/jsiuuH5Nx1IPbXNw500062L4hnaubfudKKco3drHi/inKoVgoSRZ25IKmrd0vb1DdBECScTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912108; c=relaxed/simple;
	bh=0Y7RUxN9co6Rzwa2KBgNlh1Y555VGvGafdJCR0AM5oY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hTY+/fkccK/rKJrE/pOxlxOMP4aEKVVMvvcs35fAFFVNmPZG2v9PSgno/YLo4EPhSTIhgymUpmY86pdDRXOy+RFrUMPwi0klv8Op0ne8uG891JnS1DuKtICO8/Ax+U2tDXzuIi6hN6jw7PtqvI87zmPW4X6poFRF3iuvKtlp0uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpTupqFn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpTupqFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787912105; x=1819448105;
  h=date:from:to:cc:subject:message-id;
  bh=0Y7RUxN9co6Rzwa2KBgNlh1Y555VGvGafdJCR0AM5oY=;
  b=lpTupqFnzO7hWsLF21YJLXVHQvnmmSKagb3DvOiIzlAoGSUlVHPDFkvB
   ViZI5jvQt1D8gom6ii93vLM8agxqEcYr5S+hFMmN63fGqJRdCkS+7yYGS
   upvAq1Wxoelauu333G8GeGqQIizxDeNlrV3GPHeWv6buX7yPwu1TMa1tq
   ASRtTcP6gXj18HIOn1FLUyxqae8jisO6MbQqny09dgRoxpm7UvD3t8KuU
   QAsesT2n4lw3jSRu+4u92b8Q3JqP9BbsrWZvizlnOHMNAyMeY8toKKpKI
   QIhVzW79JI9Ze4JMbhAq+aGXlCn8Y4KMomBqpEQSoEM7GabJMQJ5i03H2
   w==;
X-CSE-ConnectionGUID: XyI4QlQ0TnutdPLpSeo6Vg==
X-CSE-MsgGUID: lXtz5HZ8SNS3xheRSK66zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99580305"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="99580305"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 03:15:04 -0700
X-CSE-ConnectionGUID: ub1zx+CvRmeBmGGUUG4Apw==
X-CSE-MsgGUID: y1F5SXrzQny5m89BilZM7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="273378202"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 28 Aug 2026 03:15:03 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wztbx-0000000013x-0gmn;
	Fri, 28 Aug 2026 10:15:01 +0000
Date: Fri, 28 Aug 2026 12:14:48 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] kismet: WARNING: unmet
 direct dependencies detected for IOMMU_IO_PGTABLE_LPAE when selected by
 GKI_HIDDEN_QCOM_CONFIGS
Message-ID: <202608281212.TbjTy7lL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   92378ced66f1faad5aa0211129792fcbca45a282
commit: 0c8ec66904ac0a02c5ca7d0498308d90356f81c7 [1/1] ANDROID: Switch CONFIG_QCOM_PDC CONFIG_QCOM_SCM and CONFIG_ARM_SMMU to be loaded as modules
config: arm64-kismet-CONFIG_IOMMU_IO_PGTABLE_LPAE-CONFIG_GKI_HIDDEN_QCOM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260828/202608281212.TbjTy7lL-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260828/202608281212.TbjTy7lL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608281212.TbjTy7lL-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE when selected by GKI_HIDDEN_QCOM_CONFIGS
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
     Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])
     Selected by [y]:
     - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

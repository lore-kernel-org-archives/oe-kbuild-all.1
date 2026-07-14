Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40852E414
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 14:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038357; cv=none; b=B97jpJD57LT9b6TiUVbtsuBkJa4x5iVOlIXm3B5/3ANpIhd1r5MfcmDpfwCioh5TbGSP/7sayb4hnbRNfy4lcFnSHndfpzxwEvyW/3Se095T+fK7xMbJSRmce0bxiRNmhFuMCZYVQHaeL0gjR/dv8CCA4aWEWs1gUsWJb+umZwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038357; c=relaxed/simple;
	bh=3i7knSQ3IAMWxr+nxqGY6BkieDEm/0bAiWohiJHYapw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ceQXBVIu4xo+KOzjx+WiB/fAhL8fKH5onYj6O9S5qUCyWIZpNNua/M+0z3GQtAKpOlzn8dIHVAL5t9QTEeO+jlN5RsUfD/4vazrzDX0VggArhGnvPyy0o2MtvAKMgwpC7HwlNta4MQziiyxIvGklUZt4+Ik0DaPOrLKtlKHXMdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEqqiYP8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEqqiYP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784038355; x=1815574355;
  h=date:from:to:cc:subject:message-id;
  bh=3i7knSQ3IAMWxr+nxqGY6BkieDEm/0bAiWohiJHYapw=;
  b=iEqqiYP8OCDql9zaWK55X+qRVQSW4I6NbX7YYzqmX1wUpyU6hYPWb+ZW
   y9x5vu3FRloyjKT/mvplNxWwlxYUiuTvjPMJZn1yh6OK+vK8YPmvBCvNJ
   V1rmtlTIBLZmuXbbLhGzTFwY4R2gm7lA2wLAV3/sIfs5wov7/qzy4bkwC
   /BcDmRSW68x5sg+W9e6kD/IL4zzfgrEoFYanz6SgIIx0u5skqTKpp24+m
   8UlkpOp7baOc6OGHoHMkZAK2LmSDom51LUYyNJ4Vd8KBX9A52PNx9Wv4m
   jMrOtpOZZdznZHRGtfvsmhdJp3F5u4j/XlHDaTLJtdfPLOCYUyKbQex1p
   g==;
X-CSE-ConnectionGUID: avOpL1ZjRoClIEF37fBapA==
X-CSE-MsgGUID: g4331WZvQFW1+1MmEFr0Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="95261243"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="95261243"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 07:12:35 -0700
X-CSE-ConnectionGUID: TdTNkv+tS++mc0Gp3lOZ8w==
X-CSE-MsgGUID: L3K6EdGVRIKu/6bI+8mGgQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jul 2026 07:12:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjds7-00000000Mhk-1Jo8;
	Tue, 14 Jul 2026 14:12:31 +0000
Date: Tue, 14 Jul 2026 22:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [qcom:drivers-for-7.3 38/38] ERROR: modpost: "devm_ioremap"
 [drivers/firmware/qcom/qcom-scm.ko] undefined!
Message-ID: <202607142225.VAFLGsnR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux drivers-for-7.3
head:   7bd52a0d456eef0243f508fc712e59c612ee7d45
commit: 7bd52a0d456eef0243f508fc712e59c612ee7d45 [38/38] firmware: qcom: scm: Add minidump SRAM support
config: um-randconfig-002-20260714 (https://download.01.org/0day-ci/archive/20260714/202607142225.VAFLGsnR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607142225.VAFLGsnR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607142225.VAFLGsnR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_ioremap" [drivers/firmware/qcom/qcom-scm.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

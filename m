Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375C318BC3A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 17:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725384027; cv=none; b=Cpp56ocEyzqR0pUOr1ynB7uyB1Ah6V8DyPNRvyo9wLi3fWeap639/N2OrkV8b/E6LVIc8ldx73SjMHsPQA1hYjg1v5xDDnNNyX/8m5OX/Xmldvq1kir1jD26U3Hmnfsj9N4uCnXX59atOIMFGtVJkRKvvfSxJVyEAHZaUdzDD2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725384027; c=relaxed/simple;
	bh=MfW42w4uMaAFZF38ANlxnAF2MVcvSYgg7Bjjc9ZSZPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JtgvBZhlBGYtumtNFOiSbGLsb1WC6sxSTbmtsjDchp8TfQsW1UE1gj0m4LECmwRSdWmnx0hQBY45nL7abiB9c49qvb2Fasbl3boNieyOiLRR1Qg2iU5C0ucJyBXAc7YvgyrgePifGdlaAW7ZjUgP2TLWavQpx7Asuvj8X608fvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEoRUHli; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEoRUHli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725384025; x=1756920025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MfW42w4uMaAFZF38ANlxnAF2MVcvSYgg7Bjjc9ZSZPs=;
  b=gEoRUHliqp9rYP6ZYLAjPOtHzwSsQYwiDgXz/oB552AGeBBajxwvLwtu
   k3khOCwfvt9vF9dR6XI81edjRVL7uzhCUKdFuaRKboMhZnJcPfdoOYth2
   nelEKvTJVQlaacP7WkKj5kzjveMoDXthzoOOx/5coayjbsLpV3ksbnVIv
   yRf+hN+k3LIfsOzcASAw6ceR08L2qyiK6oEq/FrvreH/q2zKHy0/OP9AN
   RcliAUgbRkFXa85jKo6gEgkc113fXHM2FTe2zrS9AtFmpuAyPMJIOmuqg
   tZ4O41hsgk9YIqQIWLhszvU3Pyypw7ps6EfZySwEII+hOSIbsS5cPssqe
   w==;
X-CSE-ConnectionGUID: TxglRUWyTKC8n0D5QqqeIQ==
X-CSE-MsgGUID: Bz+VLMcpRVGFNEs6ThtuhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34664142"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="34664142"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 10:20:23 -0700
X-CSE-ConnectionGUID: MLuCc2qeSR6Tao1rawdtNQ==
X-CSE-MsgGUID: 7E9iAvwCSTSYYBdst3BGMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69840875"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2024 10:20:22 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slXCV-0006xG-1I;
	Tue, 03 Sep 2024 17:20:19 +0000
Date: Wed, 4 Sep 2024 01:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: [linux-next:master 8272/8795] ERROR: modpost: "drm_dsc_get_bpp_int"
 [drivers/gpu/drm/msm/msm.ko] undefined!
Message-ID: <202409040129.rqhtRTeC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6804f0edbe7747774e6ae60f20cec4ee3ad7c187
commit: ca097d4d94d808409386fde414370900cc41adad [8272/8795] drm/display: split DSC helpers from DP helpers
config: sparc64-randconfig-r012-20230210 (https://download.01.org/0day-ci/archive/20240904/202409040129.rqhtRTeC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040129.rqhtRTeC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040129.rqhtRTeC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
>> ERROR: modpost: "drm_dsc_get_bpp_int" [drivers/gpu/drm/msm/msm.ko] undefined!
>> ERROR: modpost: "drm_dsc_flatness_det_thresh" [drivers/gpu/drm/msm/msm.ko] undefined!
WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation failed, symbol will not be versioned.
Is "_mcount" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2118131E49
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 13:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769347154; cv=none; b=X9dQsOnCQ0aR4Xcv1So7kdv7o1yVNdUrG43+3yG9veNfXK1bM6iq4o/BcjT0dTLkFHme1iiAW6f9PziJUNIFWQhvSPP92Wvkh4+77DrYmbZk78j5/hwus7s3SBk5nZSM0lBlC4onD+T0q9uG3ewzJLzH7vUUAWfsr7OP5cJbQOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769347154; c=relaxed/simple;
	bh=BLU0W6BPZXPPwFPN+6cXqDLTaDKrJs+/CybO5Qao+dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCf3mHm/Lcj1oPno2mYZzNxboTRxnsDXQL9fsgRMnA2HChD3VdHngs88RHVdUJT1wmAT2ODdp3Skl7CwBFeUrBCamWhPBrpnC/2c8MgTkIGPMtShumiZHv+Rt+YWCGeL80BbxjtpoVNMH8jPUj8xr2HKXKIw+fyQ4IyP8G64u04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfquE/s1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfquE/s1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769347152; x=1800883152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BLU0W6BPZXPPwFPN+6cXqDLTaDKrJs+/CybO5Qao+dg=;
  b=hfquE/s1uf1/NiJvWjkU11os6uGulSO1btO2JGIcBeUbzo4EKILc2dVH
   zZqkB6dOz0CojKPO59c2QYkCCq5BE8qzPpPlAc2ta03cz/3TBxkZmNWal
   +DdRmQ54BoUdbMwreOBwhZMefc0lc1muHv04dGDOvWE0bVIQsrpyTtK1Z
   ghiYBhkXhRW/k4sgiYi6J6Cm0xATNpHBQ47PJQbbYjzjMPWUfn7c355Xd
   qw+A9ro0JoshLGsP7DDjYEf++A4FhjdihnDs2wR1YC2alpceXPJrAaKAE
   msrkILV9UcT2YJHA18jve12EUxQMWVZfaP+A2h9ukd40Lgxcu1gzrRHKW
   w==;
X-CSE-ConnectionGUID: HG1d0xxhRPKRz9ZVDBAwiQ==
X-CSE-MsgGUID: wuTmfiKFScqp1/FgSU6YHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70444844"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70444844"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 05:19:12 -0800
X-CSE-ConnectionGUID: CaqnikshROqL7U7yRmPVAQ==
X-CSE-MsgGUID: G3nN8htLSOKTCiA+ke4OMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="212446726"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 25 Jan 2026 05:19:09 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk01C-000000001G9-2x6o;
	Sun, 25 Jan 2026 13:19:06 +0000
Date: Sun, 25 Jan 2026 14:18:57 +0100
From: kernel test robot <lkp@intel.com>
To: Mingyou Chen <qby140326@gmail.com>, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, cryolitia.pukngae@linux.dev,
	Mingyou Chen <qby140326@gmail.com>
Subject: Re: [PATCH v3] platform/x86: tongfang-mifs-wmi: Add new Tongfang
 MIFS WMI driver
Message-ID: <202601251425.LsolyF4U-lkp@intel.com>
References: <20260125071501.12616-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125071501.12616-1-qby140326@gmail.com>

Hi Mingyou,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20260123]
[cannot apply to v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mingyou-Chen/platform-x86-tongfang-mifs-wmi-Add-new-Tongfang-MIFS-WMI-driver/20260125-151740
base:   linus/master
patch link:    https://lore.kernel.org/r/20260125071501.12616-1-qby140326%40gmail.com
patch subject: [PATCH v3] platform/x86: tongfang-mifs-wmi: Add new Tongfang MIFS WMI driver
reproduce: (https://download.01.org/0day-ci/archive/20260125/202601251425.LsolyF4U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251425.LsolyF4U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/wmi/devices/tongfang-mifs-wmi.rst:61: WARNING: Literal block expected; none found. [docutils]
>> Documentation/wmi/devices/tongfang-mifs-wmi.rst:69: WARNING: Title underline too short.
--
   WMI Methods (MICommonInterface)
   ============================== [docutils]
>> Documentation/wmi/devices/tongfang-mifs-wmi.rst:69: WARNING: Title underline too short.


vim +61 Documentation/wmi/devices/tongfang-mifs-wmi.rst

    59	
    60	
  > 61	Reverse-Engineering the EC WMI interface
    62	========================================
    63	
    64	The OEM software can be download from `this link <https://iknow.lenovo.com.cn/detail/429447>`_
    65	
    66	Nothing is obfuscated, In this case, `ILSpy <https://github.com/icsharpcode/ILSpy>`_ could be helpful.
    67	
    68	WMI Methods (MICommonInterface)
  > 69	==============================
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

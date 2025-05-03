Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE4F42A8F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 May 2025 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746264544; cv=none; b=fuM4duwk2tHUSAVi1cS9YIVU8sA1NhGR9t9D31IvTGqDx28nMrmce7lZ5BOCcE3oe4HB7cJdjecEJ3PJaf0bhMDYshUcRgr+LHmrv85nWHlduTiGflWwE54/Kiy3E1aDnNDeUcex+BECx0vD8ViXa0xS/Ral1Eeivj+WoP8FsVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746264544; c=relaxed/simple;
	bh=iwQ9QFkGgELfOBcR+lSOqWIdIblcnh575E3UsWeAH/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSWbc+kCZyd4GgljgonV19NBIefJpwXuZL7CsR6ZV3/HFw9BZQZKkKjleJYnhTQX7nNa6mez0ffnmJ6ali0qejVKWGrNCRKgdqoRatXJNQLrjJFWoYSdUr0LLyCwn+wYzz7yxb4ipH71Wlf00FazlzyXUefDHBeUZXH40PHJFkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixmSmgVt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixmSmgVt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746264542; x=1777800542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iwQ9QFkGgELfOBcR+lSOqWIdIblcnh575E3UsWeAH/o=;
  b=ixmSmgVtHMkrHiynKm9+EHzv4BOsE50Beo/Ln8ytteuv3TEjLIAYefci
   r044BOGmIFMpiBtIfWbwfzJdEGsYPN9MPagyfp+n2+09xBo224XvF8d1w
   7lygNvQLllorR1DLSj0LtNwxJpPPD1po6ljdoP0Jq41jh01LPlYCvZdzq
   Za1ZWNg/jeUXR6BYbeRciWDIvydYKE9wI9AHxeSdl+OD2aIaluSr/ETaR
   pR4VuC0nfirZzsxPoz6tOWBWTcZ5OL0wrHK3V3gB3HaKtwImHPY52jeBR
   YdbArIrwhnfCVZq4ZTuq0TcvSjhVwO6MP7c/uXkuG9S/1pLgEhEZ8vrMi
   Q==;
X-CSE-ConnectionGUID: BNZYwCsySA+iJ0S0hDn8XA==
X-CSE-MsgGUID: A/5TziuCRBCCqkjoHNdUAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58145395"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="58145395"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2025 02:29:01 -0700
X-CSE-ConnectionGUID: pwyyTDNPSfa/YHM2QVSIGA==
X-CSE-MsgGUID: kteVOkToTT6TSAwW8c1pKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="165743790"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 May 2025 02:29:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uB9B3-0005Hd-2t;
	Sat, 03 May 2025 09:28:57 +0000
Date: Sat, 3 May 2025 17:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 01/23] drm/sched: Add some scheduling quality unit tests
Message-ID: <202505031601.l3Lhvxjc-lkp@intel.com>
References: <20250502123256.50540-2-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502123256.50540-2-tvrtko.ursulin@igalia.com>

Hi Tvrtko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on next-20250502]
[cannot apply to tj-cgroup/for-next linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.15-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Add-some-scheduling-quality-unit-tests/20250502-203539
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250502123256.50540-2-tvrtko.ursulin%40igalia.com
patch subject: [RFC 01/23] drm/sched: Add some scheduling quality unit tests
config: csky-randconfig-002-20250503 (https://download.01.org/0day-ci/archive/20250503/202505031601.l3Lhvxjc-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505031601.l3Lhvxjc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505031601.l3Lhvxjc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "__divdi3" [drivers/gpu/drm/scheduler/tests/drm-sched-tests.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

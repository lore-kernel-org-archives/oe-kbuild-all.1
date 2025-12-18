Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342C0303CB6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 20:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766090657; cv=none; b=chR3A4G9VtYyUGraaANZqdAJgyy6Mrrf/o8SpfgZOfXaMuA5eP8ljTuEBUVpaTYZemf/+JgJELbSsQ6Cu5+PuaKBUw1KJTv+ObJ9X9Tu5448Eqf48mHG09fZxJozxWhgbQoUsWqOjYyvmbDNrbsW2e6ukmMzlJ7UuwK+Bt2/cnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766090657; c=relaxed/simple;
	bh=bgrY2sRvqIVvrmALSUvXWyQs75W3UgRq1LsDdoHYw1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ul661qfAeWgrubOspAu3tdEZqZFW18ItD6r8MFHb5MaCfnEfIL5fi1oDS+tejREt2hhIwM7to9FNRGA44V0n9yDlRrVYD0KGQ7HPugsA1z09JFwfKSmL4/y+et4W+d8wtYoNe+Oee3h42l9afHnhVINm/wqPc0n0nvX77gZwfpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvD+vCic; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvD+vCic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766090656; x=1797626656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bgrY2sRvqIVvrmALSUvXWyQs75W3UgRq1LsDdoHYw1g=;
  b=FvD+vCicbTKiW9gZuBYyYfOfd3jVsz4Eqm4OpSaNQ3WYJ0+5nbKC0fGp
   6HwbUpoCGGb5YuSBoOke8Lwc8s3l+pjyKN/eijZDaGcKUjQrf1C/KjhJP
   b+WsQO1cmSNSzcwfaSBvhOpNCikFpgAIEYonAyHIqtKjI8PdZ4ITHp9rg
   IsqpA8I9wXxHW0dKQM7A49arS+XJS8bPPAE/45j8fb5mlQv0kdV3Vra0b
   9FpfcZcNPFIbwV0r9uaR+Apl+WjscV1sHToh6nJuHfhAl13fyZIRZ1Isb
   Ukc4O0TjoDHkaUH8tLyHROKAiESQ3p8UXW4bl1yBc9Fow5VZLT5sU58dC
   w==;
X-CSE-ConnectionGUID: YtzAcJmtSyGZAA+RwWmzsA==
X-CSE-MsgGUID: sbmdYQCZR2Om908Hgd/5Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68129516"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="68129516"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 12:44:15 -0800
X-CSE-ConnectionGUID: 2tD7XLImR86oj5rZZKcLtg==
X-CSE-MsgGUID: 11VMzHbmSEyZ8GAb/zfVGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198692884"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 18 Dec 2025 12:44:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWKr6-0000000043w-1BkJ;
	Thu, 18 Dec 2025 20:44:12 +0000
Date: Thu, 18 Dec 2025 21:43:36 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] dt-extract-compatibles: error:
 unrecognized arguments: -d
Message-ID: <202512182109.2hLJDUSP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   5d719013902eb006756873427de3fc5cc5566531
commit: e20861fb88ee3302349370c595e2498122732f3a [50/50] kselftest: Add new test for detecting unprobed Devicetree devices
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251218/202512182109.2hLJDUSP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512182109.2hLJDUSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512182109.2hLJDUSP-lkp@intel.com/

All errors (new ones prefixed by >>):

   usage: dt-extract-compatibles [-h] [-H] [cfile ...]
>> dt-extract-compatibles: error: unrecognized arguments: -d

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226FD41AAB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Mar 2024 22:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711836785; cv=none; b=rvHr1n0acwp5og9V5DtskbFY+GIvn8sSpjstZJHA418f5j3sDWYvNEQrB0bIxDeVEfzVvQCCdFmFq1l/q69RX2zElc3HZkpGG0gXKGrPVjTQiaQBZAUbjTyMaSKVkJB0CnLhuJ1RSLXFeyzZWJD6jlL+iNszWetXDkQkXDg28BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711836785; c=relaxed/simple;
	bh=AHGDLLeVTDMVNcacVwm7crMo//elh+sqcAPwH3K2+94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qLwaS16IgmsKcwGGsWajV9tUaGjhw7RssZ/GZq69cF9CYR65HGcreHA0EQcm96UgXuzU8klVIEBSleIi9FensYW4zUj2GPYIkmlynva42PtN1jtXHKLcdlW4safZa4VCiED31/Tm53aKBpmtKD1kK6WSmoDbvjOebvMi4gutmew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYNGzLBG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYNGzLBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711836783; x=1743372783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AHGDLLeVTDMVNcacVwm7crMo//elh+sqcAPwH3K2+94=;
  b=jYNGzLBG7yGn/qA+cATD7gT/Hr40yaYVov0eN6nfTm15dt/DhGuH7C0I
   qLqnBNyr6v1kudL8hjUcXYs1uGMxqj4lCV1P43gwxLF6gxdGNhUfym7O8
   DVbN8kn7IDPcKlx2qBk/iIcShHsWBm/HqgPCqQwjxuH+ewGtYOUk4yiNm
   +22Dcbdr5FU5Qz9gq9E3T92fWkaKx2U9X/XGjdFP+gmYy2wptkL/eiySH
   k+qsiY5ckCmFidH1C1888ig0x7iG/v+26FJokYq7WJ6RKU+C3VPmtos3R
   TcYZzo04zDn17wr+68vSvM+PuMOsB5/nxB+NXMwkNjqmx/jU65xVBIK5m
   A==;
X-CSE-ConnectionGUID: CiUAwa+BRvqa8RvqN5mKXg==
X-CSE-MsgGUID: Qial1CkZSzWpSsv+WD8DTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="29476044"
X-IronPort-AV: E=Sophos;i="6.07,168,1708416000"; 
   d="scan'208";a="29476044"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 15:13:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,168,1708416000"; 
   d="scan'208";a="17351516"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Mar 2024 15:13:02 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqgwd-0000SA-1j;
	Sat, 30 Mar 2024 22:12:59 +0000
Date: Sun, 31 Mar 2024 06:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 3/32] .meta_changes/M9DezupS: warning: ignored by one
 of the .gitignore files
Message-ID: <202403310657.0az9Pf4T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   694c5d0b7f0af673991cf9d6c834acd9819cc41b
commit: c775b94618c181ff6ba088361cfdc5cd64c7407c [3/32] === temporal fixes ===
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240331/202403310657.0az9Pf4T-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403310657.0az9Pf4T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403310657.0az9Pf4T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .meta_changes/M9DezupS: warning: ignored by one of the .gitignore files
   .meta_changes/README: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

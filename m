Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9256B4A21
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 12:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743078566; cv=none; b=hXIlEWN1Iu+qchgf0CvzWBKSYP4nfHDLJrbmdRKkV+OJbzidKZPh4CEIJc0k2mdvxzCJ6omb0ZWl/tfueMisXvRtuBcM96NsRFmyKABaLbYlzmpILH2CsdrI6sSW2VpNYUryNa0Wc0RVVSvFjM1ProEB1xcGCgvzm2nHkZ71tB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743078566; c=relaxed/simple;
	bh=k0NpObhIGqTJDw4SFC19fyTtLl1iK0ZviXAt8alM4fY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JfmhsDvkOSugEYItNPqTTjOZMDe144LWKRaDeM1lHxr0IjvsJzp9oCYYgoYFSH9Z+IagM3OUM7yJcnD36Y9RQ9Szc5+QgSqPWknwtLcewgaSf2jXjQqTCQsD7Qg4WbSLsOT/HEzo03sgTdvh8o4Ijwa3Ggimr38l13PXwfS5Cqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3QTAQld; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3QTAQld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743078564; x=1774614564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k0NpObhIGqTJDw4SFC19fyTtLl1iK0ZviXAt8alM4fY=;
  b=d3QTAQlduDbKtHhsS8psaPoVMi1JKmhiS6NIe9PnvkGMUS/KMyJQnpZx
   HovMM49LSjDkIWBKrkFnGr0yTjYcs/8jcz4S9QxEYEuqTcDUJW7tnzAEv
   kx2WYJ54BA8j2+VFWuxppbEMdAo+O5uEM18h7uQyMogUJq7X/DeeR6HUW
   DQKJt8SqFtvNT0hKPc3UmBT5A9np5FTPK6E/ah74PyTm3opRGQeDB+klR
   bRe4lRqNB+pvriMILiCyU8AvE4eeYG4iZnAT5UN8utxA3qJouv5h527+t
   mZlLcXLLRTWd6Dvmt+rkah0UQXIMOz/FYOf+YnRkQkl2CmM8hbmPTk5Qw
   g==;
X-CSE-ConnectionGUID: 3mbCrk7mTOG5VxWCkkySkg==
X-CSE-MsgGUID: apZRyricR5yWJUMZ3uR8rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43561194"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="43561194"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 05:29:13 -0700
X-CSE-ConnectionGUID: caZlC1NnSJCujK6NSsG4aQ==
X-CSE-MsgGUID: Fr2FNomfTneFfYfpXSEPTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="129809902"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2025 05:29:12 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txmM9-0006e3-25;
	Thu, 27 Mar 2025 12:29:09 +0000
Date: Thu, 27 Mar 2025 20:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1523/1523] fs/.tmp_select.o: warning:
 objtool: poll_select_finish()+0x1aa: can't find switch jump table
Message-ID: <202503272038.iOCRCuV8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Oleg,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   69d39b683755039471781fee8dc7ed96952f771b
commit: 44ae3d3e5f1f99c0fd5f040e4da88b0c5b3ec76b [1523/1523] select: shift restore_saved_sigmask_unless() into poll_select_copy_remaining()
config: x86_64-buildonly-randconfig-004-20250327 (https://download.01.org/0day-ci/archive/20250327/202503272038.iOCRCuV8-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503272038.iOCRCuV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503272038.iOCRCuV8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/.tmp_select.o: warning: objtool: poll_select_finish()+0x1aa: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

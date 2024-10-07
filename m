Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE6F1D043A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 10:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728297293; cv=none; b=ptlNBVH3ebntDyoYJdadWHnxCobXSV8F0VsIwzPzGsh65dJg9MmOaxTjNIi2f56SyLi2JaX1IHWNrsvHuG01GohagDbYSCYxg9dKWKj6DVCIQ7tdHDwLlqA1Lfk4MCurj9UVc++tcF97dQk70yC7/WgIPJ3za10z+Askx15W2+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728297293; c=relaxed/simple;
	bh=8h7Vgrp7E+vCeAdiZU3xkEa0BoT3Rdyb+9Qu3cSN6gA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AB8V/6BMVgoADzmnJDo+C3IZSOp9Yu9BrB4T4xW54s9DeBFOVnEU7+st5dd7AVOIjyO43wLMpbAoMVS+WXozdW5wlML/BZmKIBirWix9JuKPYAzAChQgWXUe3evdkrtMqgBSKoqDDJ1j/5GV6k41CVDHFMWfCM8AtkfvENbsg6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHzXC9yG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHzXC9yG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728297292; x=1759833292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8h7Vgrp7E+vCeAdiZU3xkEa0BoT3Rdyb+9Qu3cSN6gA=;
  b=LHzXC9yG3DjzBr6BbKMWgdR6BHRbi+Ew9drfo9upOmX1okVgY0cbOHKK
   7b4v8hUiJYxpe2QrkKSW4OB/Ek5/n2ph/ov4GyzzKTrieFf0GBaxPumPl
   y7JGuyW5ji3IpIchF98bjXokuii7krsBi2GowJkVyapp35YER8Qx6P2mB
   vzbGeECspm1w0d48tSUFfwUg7dtKVdGxryZ2Ls7RqbciuKp+f9CG6gT1E
   768QJUnVJNDye3SjlLvMFHPjqnQMBp4ztuEodGHksQlOEVIXFlpevdq5t
   8UMqzhX1+MhenWZTKrvpNOIc2Qhnltp3IsQyp3tDZTQYY+Ph7OD43+L/B
   A==;
X-CSE-ConnectionGUID: hQ4tuwUjQROIUHmWT3+L1w==
X-CSE-MsgGUID: uLWeZ7XHSqynSu8oTqnUJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38566562"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="38566562"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 03:34:46 -0700
X-CSE-ConnectionGUID: dta4Xg6GSYq8IeWLGEF6BA==
X-CSE-MsgGUID: hPIeht8RSd6ia7M3A38maA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75677971"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Oct 2024 03:34:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxl4c-0004su-0D;
	Mon, 07 Oct 2024 10:34:42 +0000
Date: Mon, 7 Oct 2024 18:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:buffered-iomap 12/12] ERROR: modpost: "iomap_read_end_io"
 [fs/btrfs/btrfs.ko] undefined!
Message-ID: <202410071824.tpmmKIQv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux buffered-iomap
head:   edc8da1d3d6c5a09662a7a788dc17c963f50dfab
commit: edc8da1d3d6c5a09662a7a788dc17c963f50dfab [12/12] btrfs: switch to iomap for buffered reads
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241007/202410071824.tpmmKIQv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410071824.tpmmKIQv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410071824.tpmmKIQv-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "iomap_read_end_io" [fs/btrfs/btrfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

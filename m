Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFCF239E61
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 02:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755658692; cv=none; b=VCBvE9S68Vg9xYfhcbY+sBw3gGZNqQH6+ESNWhxfIDI9XyAgbG+Y0mgAtLwDIWvIiwUYMfkWXQMMrU/oonnARoAnL5WWVpqhG9FWHCa8sC1Upqf7FTiD7QZ4DvKUof4Ke3tUKD6hCySaJqYreTAnVXS5+qhjn45XQ0xic8TIXvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755658692; c=relaxed/simple;
	bh=Dzl2qvkDnYhf6MZRTqFExRxSjsDsEdg2kudtrRMe3Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M1tx3clWFiAW0ySxJ7SA8S+ELUgzAOOfKXcK1lf23gePnnWuTKjc+PLJcewHaTFUl+u+lsb+KasTo8jhdig4UfidmTVmMqRl4ji9HSOPp1czCcwd7bAAXYbUmfoM7y73OP/898Rvcp8MHZPF/pfcC1++ncnrLzW5bvogoYXpVRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WER1vkT+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WER1vkT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755658691; x=1787194691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dzl2qvkDnYhf6MZRTqFExRxSjsDsEdg2kudtrRMe3Ww=;
  b=WER1vkT+Y23GN6RMn1jhy2CAWNik0mG4Div3CvQ8ppnVozypkyGeYU/Y
   O6yp1NJJK2Nn3Ocn+PciNcV53+jcRRmGfseYK51HTOw7+moiD8ycVncWQ
   BBwBpECCjL0EQk+D+3Ft0iIehXclNzZCv/ZSWuiA2RA+k6+W6JDBPqsRJ
   dxa7s9DFi3F2jTiHYgJwNoivo5KmjaMoyWydr+4VzXxbg33tQwPy45RTh
   cRxK3cxhnc4lpagx38QRNswnOykQjVydyukrt5Y86sf5Ocl5zaPNKdWyC
   Mi3Ol9V+P9lPSLjkjqk3SGooxM0krphLSCYaXgtQmKhC3psSdgZp2ZXYV
   A==;
X-CSE-ConnectionGUID: T4DbT47wRGaZmIiDlEIWrA==
X-CSE-MsgGUID: dyOGweEVQheRJzvjzKnjJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57846686"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57846686"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 19:58:10 -0700
X-CSE-ConnectionGUID: q4MNlbFyQKOstZlZG4SAig==
X-CSE-MsgGUID: aoDsc0lQQfWX8Y6ihP4tBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="199006259"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Aug 2025 19:58:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoZ1a-000I1n-2p;
	Wed, 20 Aug 2025 02:58:06 +0000
Date: Wed, 20 Aug 2025 10:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-cache 41/63] ld.lld: error: undefined symbol:
 fuse_backing_close
Message-ID: <202508201011.ZxE5AHQK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-cache
head:   3dc844fb9d8e17b6bf801ac080192c845a12467e
commit: 504d8153779fcd3d9505bc0a79096edc54b0e5b4 [41/63] fuse: move the passthrough-specific code back to passthrough.c
config: s390-randconfig-002-20250820 (https://download.01.org/0day-ci/archive/20250820/202508201011.ZxE5AHQK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508201011.ZxE5AHQK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508201011.ZxE5AHQK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: fuse_backing_close
   >>> referenced by dev.c:2643 (fs/fuse/dev.c:2643)
   >>>               fs/fuse/dev.o:(fuse_dev_ioctl) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: fuse_backing_open
   >>> referenced by dev.c:2629 (fs/fuse/dev.c:2629)
   >>>               fs/fuse/dev.o:(fuse_dev_ioctl) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

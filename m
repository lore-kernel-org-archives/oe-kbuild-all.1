Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B642CA2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 22:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710109874; cv=none; b=j/87tSmDbOx8GCMe3QSgDGL2xKVkU6x3O3LKrYArBv1tFFgqk0a8iWOrDAjs39jjU/6aeRUwu5OHlYZ+WQ9l6aM1VPUX2qdc2wYQe4+nZxz4nCNl1DrO7y2hkJfzPXKhFkwVRdUL4G5+5z3fH777qsL4uti0vR+FSXE99IcjlKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710109874; c=relaxed/simple;
	bh=JTUsglKzFiXe1Cu3CPvdQarFo3EvZXsjcWAxb2aCwUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mpc2qHUQNqpN/iOda/9Kphr8RJBvCWgVlSfFQDRSnR4PSvOEBCVEfx4SjRbsc3tzRRLAFWlfgDDep+V22p60wcS2eUuROuz5ugucKF3keyA9s+sdSDevuuCIRr6/2u5s57GtWJwE6AxQ5U4NcK3ukqQny6xLVWO0sT1lxjhfNCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GkJZZz6w; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GkJZZz6w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710109872; x=1741645872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JTUsglKzFiXe1Cu3CPvdQarFo3EvZXsjcWAxb2aCwUo=;
  b=GkJZZz6w3aghuyka9dZh8OvgzxcrI4nhtMCJQeGkZEvJqazZKSrDQnR5
   HNBnOu/9LnB8MLdO1+oBzkPW5F0nFIuFZVrs5VV5qwlLzzSZ4hwXc4XS9
   0CHn+dFxvImhU1GkQGJvAU20MMcZe3uMLodQWEJ2ABRKbLChhHffR92+p
   OvPggY177ld3fFZZ/FaNQDDQMjbBHyTOkCjoPA3h4zL+J0GBhGXA2tSEi
   aIMai/toaiLy0po2DCK/xY3c/wTIzXF2GgtYcICBV5pCQORZZcB3xT5//
   /nRMpYPkN/+X7ZJus+iZEYpJ8C51jX7W0TfePcNs+jNHMlhUS3dRdtDDd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="27232621"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="27232621"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 15:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15690714"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Mar 2024 15:31:11 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjRhE-0008fD-08;
	Sun, 10 Mar 2024 22:31:08 +0000
Date: Mon, 11 Mar 2024 06:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/3] ld.lld: error: undefined symbol:
 uhid_hid_driver
Message-ID: <202403110614.yjquLkdn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   4782f1c2337058218098c472c95af1b6cbb727ec
commit: 6804500c16a5ba86b57c9976fc1491fa0efc2132 [2/3] ANDROID: HID; Over-ride default maximum buffer size when using UHID
config: x86_64-randconfig-015-20240310 (https://download.01.org/0day-ci/archive/20240311/202403110614.yjquLkdn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110614.yjquLkdn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110614.yjquLkdn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: uhid_hid_driver
   >>> referenced by hid-core.c:1777 (drivers/hid/hid-core.c:1777)
   >>>               hid/hid-core.o:(hid_report_raw_event) in archive drivers/built-in.a
   >>> referenced by hid-core.c:293 (drivers/hid/hid-core.c:293)
   >>>               hid/hid-core.o:(hid_add_field) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

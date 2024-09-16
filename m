Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800B739AD6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 06:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726467183; cv=none; b=SExnxNY/Oo1PemSy6i8oqM/q8RzydHGkI+ZLcIdS7mdxFa4Fyavt916b19gocXjaIHP/0SH5lzj7w9ILuBFtZ0p+bsbzlZwu+MGStGFEkBJ2BlI5pmxYkJmyFFQtFity1A294OOn6+LsumenRB+hyduHNfN4TnfRhh4LtWH5yYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726467183; c=relaxed/simple;
	bh=crr31HwnB6YjRI7uT+gU9mVw3AVwXUML1jw0v0AgUwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D8EKgZ+YlQyjLJss2cpsicz+HE/qW0QaPtN+V3nD12kmJwAZOKy1tu0lE/i+Wu7iU2i/lAdBvJ6vdNlmmdcIX9MYWPeVENfiP20SIEMj83yn2DUOoQK/8u/LrVvVmaeMm9lXrOkQCUf7GCyy7x3W0MnXJbXi9iB/FHA2ex4Eo30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFi6bjc2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFi6bjc2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726467178; x=1758003178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=crr31HwnB6YjRI7uT+gU9mVw3AVwXUML1jw0v0AgUwE=;
  b=XFi6bjc2RBqCR+f0yD50aBqMUVLy8WUo3VpVTU5dQgwnmplz04BtiZvq
   iYBYNlh0p5rPhMdpNjgj0u9V2xoqjVbxwdzeAGalhZZ8hRLYCsQTeiZos
   zk9q01af7UeYH/z8hsxwDNq7AOxQfcnXyT/ThAyNtGxvQzVYdw1sq7Mlu
   VmxnDBxYumodOlMA3+S5dEwhelaVv+t4r2do/PwQ3oSqwKmDRGVrGGSdy
   Dlb8AprRXoV3mFVBkA89oiARPttBPqTZf7Ez7RYgQuxKpRURYG7CqCFl/
   ce0jOedubMOZKw0s2MuUcIqcwPkOIAJj5F+mIYqZ8ZfXLmxUwZJ6v1oR/
   g==;
X-CSE-ConnectionGUID: xi8bvhqZRXuQtc1N3eZrpQ==
X-CSE-MsgGUID: tx5wUwHXRYOEPIetTEX+uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="47798048"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="47798048"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 23:12:56 -0700
X-CSE-ConnectionGUID: FdCWZbpRSGC5MIB1ylalcA==
X-CSE-MsgGUID: p3r8AOs+RnmS8mZzOBWF6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68395026"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Sep 2024 23:12:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq4yi-0009Rq-0x;
	Mon, 16 Sep 2024 06:12:52 +0000
Date: Mon, 16 Sep 2024 14:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 2962/23714] fs/pstore/inode.o: warning:
 objtool: missing symbol for section .exit.text
Message-ID: <202409161416.tZCUlfeW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 68bc9e8812a24c4a04fd18a9e1ede123eaff0420 [2962/23714] pstore: Centralize init/exit routines
config: x86_64-buildonly-randconfig-006-20240915 (https://download.01.org/0day-ci/archive/20240916/202409161416.tZCUlfeW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161416.tZCUlfeW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161416.tZCUlfeW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/pstore/inode.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

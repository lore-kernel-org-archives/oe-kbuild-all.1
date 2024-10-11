Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90095210C11
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644055; cv=none; b=fnM8W4b9mA4gg+HnOgI4yiddklO+WoA9Yz7GN2H18y+lIr3W7qakD9XShvFYxx+S05IMQM9KXk0vxH7c73WBfyi2VhzmsmukIATt0aimRncBXtsGPNPgiXh8P5zvBiaoJE0yiEcrkr4AJB7UnCKHYNax+6mpqHt3VOMWMD4KEWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644055; c=relaxed/simple;
	bh=PILWCgpelD1vdfFK12Av+Qp4XSGaWEFEcSUKWS7llA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YsC73Skoe/JS2+tFGyko0iBWuLlGOhqSwsjqsmb4z+jRtkRKKPqyZVQDBK9GfhX3pCzjWLKRw3o3BkroLCwdmnXy1rbh5QmL8BAn/7z2l7+NVy07h3tGOUkExYvMLCpHkfbstpgio4/P8VCMBkLL+RFEEA/B7DOBRqUvPy5L0xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Viw/NT3F; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Viw/NT3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728644054; x=1760180054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PILWCgpelD1vdfFK12Av+Qp4XSGaWEFEcSUKWS7llA0=;
  b=Viw/NT3FS4WOlcgxD1GElCldA7HkfTXNdN4LmaSjaTdzVLaxl8fw61aU
   aIrZ+RkhaN845DxFJuZZaDnRDlh9C00hKqoVtav71yPlF7NvwefPRW7Rt
   ftoEFf/LCNW/O1kOWKoX6wFQ58P/vS7M7wJAGfcTUfbIYRMleDLOlcamQ
   LaPcLIS8Zeo+n7hQlHxh3HoeZmk9RXatSnzML7NDLnW2kJlzadmoh+XfG
   g2KXZ47qoLfG8eL5lf5tvKSZSFneDXY3SaFJaZGMAA/TrPZCNBeZYhmTi
   A5BSzYazpaMZWuO5cu+om6td8695jBnf3iacOqkj297dwrlfcg3uHpmX4
   w==;
X-CSE-ConnectionGUID: 19qTGUtISim8e7OPREwyTQ==
X-CSE-MsgGUID: ko/GoRKFR0mCYkopfLzGQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31834760"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="31834760"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 03:54:14 -0700
X-CSE-ConnectionGUID: YOn1MvcOT4qxlaPfIsdaQQ==
X-CSE-MsgGUID: z9Tm1XjLSr6Q51/erylqDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="80887906"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Oct 2024 03:54:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szDHd-000CCb-2E;
	Fri, 11 Oct 2024 10:54:09 +0000
Date: Fri, 11 Oct 2024 18:53:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 2962/23827] fs/pstore/inode.o: warning:
 objtool: missing symbol for section .exit.text
Message-ID: <202410111843.JeVyH5TZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9b2f1457c730cd7915663ac5d9ccb849f2657714
commit: 68bc9e8812a24c4a04fd18a9e1ede123eaff0420 [2962/23827] pstore: Centralize init/exit routines
config: x86_64-buildonly-randconfig-005-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111843.JeVyH5TZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111843.JeVyH5TZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111843.JeVyH5TZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/pstore/inode.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

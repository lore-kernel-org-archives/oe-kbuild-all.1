Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E65E13D889
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 12:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438905; cv=none; b=kwYdOu5uRKmmBh1tPzpz0Idr3f4qFkagK8A0W0rETE/ilVt+gOmYfYl4lzMoi9pdYqA07r/HuCvgxzEJNh4GFsgCGanD7lACamsbLoaSEpNdA7BHZILp4doP8sFEEdim1Y6cGOu9pcQP8z5dGI5uISxNoZJvv9phtiKIDPGVsUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438905; c=relaxed/simple;
	bh=FNqCgVB7VLuN10tWcediBZJg8kuASpMP+feAy7VTca0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SbuJ+gd0uLx1l3AfHvLOreAJERwHhEjH73m4c6oHhvJsb860HgP2rl2NY61cCuczXsT64swo+KwUojSQeHznKVYskfnDQm+e5dNne4p4RhkgcSMJ9lr38ynI+09C6/5qeBYR5EE7VIBvn5VbDpFctZxaI2NkDWF6vpKLNN7G0TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arsOrkwS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arsOrkwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727438904; x=1758974904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FNqCgVB7VLuN10tWcediBZJg8kuASpMP+feAy7VTca0=;
  b=arsOrkwSxVXCOP8iHqJqHqPsRqqwOwULpK6m7SZw11wpaC5UdQQyT0+F
   p0Hg7O5kyI8FMzPP7AYpNcyJE2hg6OG47sx1A5xoriq0tTA9U/f+8RfxH
   Si77YZGyNkvW0rohogTeWxHrOsrlGYikJiWcv4cg58+9re8ycWAbLscd1
   qQEly70nPxO/yuK//MTJt/3jEZAGY9dRdtM2GFFHwr1Kj2aVwiWEUrZoN
   987PVkAiyTFwG4kVmj9R8G4w4i+vcFm7zKf5mlnbwGsKrH02IN618FAp/
   W2bjzqfcUTIPjt1fZdSvUieJNB/722SD0CaAQIuk8qWPCc5AJFHYsyTBH
   w==;
X-CSE-ConnectionGUID: QVwsSVWNSO26TqJ/IWrdhw==
X-CSE-MsgGUID: Ex6wKSiQRLir3fPJWBr91Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26745784"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26745784"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 05:08:16 -0700
X-CSE-ConnectionGUID: SHhIadBYQ5m3sg2/f/SGFw==
X-CSE-MsgGUID: ypBj5TRIRReiH7BnxcJFOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="103308571"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Sep 2024 05:08:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su9lc-000Lsd-00;
	Fri, 27 Sep 2024 12:08:12 +0000
Date: Fri, 27 Sep 2024 20:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17809/23796]
 drivers/powercap/intel_rapl_common.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202409271931.90b1jljj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: 74c448a8b8ad8801c117e98ccd0e399413c063bb [17809/23796] Intel: intel_rapl: Fix module autoloading issue
config: x86_64-buildonly-randconfig-001-20240926 (https://download.01.org/0day-ci/archive/20240927/202409271931.90b1jljj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271931.90b1jljj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271931.90b1jljj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/powercap/intel_rapl_common.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

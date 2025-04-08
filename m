Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37153230BF9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 18:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744138485; cv=none; b=ZRoq7KKlMhqbe6N2uxUlpcEi9pRkf2UwrLDKoGTBaYidzYFlMEZpceC2B+yg0kqzLf2irDOmBtJQSe9RpSSEGSrVwZNf4SMlp/FyO4DjABE6fCPqU8ONN6KeoApVwRUGXGEHTD1uFXuft6pMqM2KUYYEwHzAuljpZrb0vsFJb2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744138485; c=relaxed/simple;
	bh=r8RB/jxPGr0zDvnV+n1dl3n2zTtme7fTYFFoQi3YtmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LMDOfQeLuW19ByHa+qYx1YEi9yoZ+RaJUlgkWDSB+TmGm8tichgrBvYxbC3LxuhvCc8YAO8yeM0LvmHvvw6MnLcI5WyI0/0CIKAD7KiXzylvXEVwIV4AmVpk3+YnA3/iVAz+QFPFttEhT1BLnBDPUvPFrwsnsnsO07zxKTgZ2i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4cu60aO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4cu60aO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744138484; x=1775674484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r8RB/jxPGr0zDvnV+n1dl3n2zTtme7fTYFFoQi3YtmU=;
  b=c4cu60aOXm1Mjz1dnR+h6o1SLHJxu+/oS+2IpLG6IlH8pmv1is18bQtV
   yeBAaGU88qRnYwUoLdMFkAQtNvgJ2vzw7OJ0pMHchLu6r+92n/sf9mOlE
   Q/4+76L2N++7hWc26lJFwJ389oukTX3ksF7oCUywO7/mGlousjMfH1jdg
   eMmhqAr11ABzX2qOA23kvqtD8IQEWqsxOKsxws0B781KP59ZjKNVMfRob
   qIKpyEX7IABDA57KVXaQpVJICoCOymaNPV+2eS89bwDE65LtsCWF+BAco
   47/AlFZlCGiDsmsNy6hQbCtyT3njiCARWonyXvid46CifJ5PyV/Hp6Dpw
   w==;
X-CSE-ConnectionGUID: JrIBHfuyRMqNNbuS9zxKhg==
X-CSE-MsgGUID: hXQHdnhiRsKr9Q8mMguPNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45478255"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45478255"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 11:54:44 -0700
X-CSE-ConnectionGUID: hDRm2K34QhC9vgpCRHvr/Q==
X-CSE-MsgGUID: eUVn0kYqSDWHOOAA5mRh7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="132487509"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Apr 2025 11:54:42 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2E5o-0007tP-2N;
	Tue, 08 Apr 2025 18:54:40 +0000
Date: Wed, 9 Apr 2025 02:54:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1546/1546]
 net/netfilter/nft_chain_filter.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202504090250.JNCrFcpX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bf266d800949a86365ca698efe637ca1256d1706
commit: d209df3e7f7002d9099fdb0f6df0f972b4386a63 [1546/1546] netfilter: nf_tables: fix register ordering
config: x86_64-buildonly-randconfig-006-20250401 (https://download.01.org/0day-ci/archive/20250409/202504090250.JNCrFcpX-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090250.JNCrFcpX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090250.JNCrFcpX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nft_chain_filter.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

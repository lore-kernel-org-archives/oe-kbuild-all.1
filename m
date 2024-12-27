Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D041F37D4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 13:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735307061; cv=none; b=rKgya0yQRmfr4xj4WiZEbXRIIcjujns3+hkxcod1t7y1OZUupxZEj768ddMALL+28N1TX9Pk1urCnXWoJiGP/TYhz8yVb8pFHHQbikmZsaoFXXAgf5x6sG4Brrg+xh48fZbCoiqP4rImDH402DKOCstTQN0+TdnCwYx9avAy44o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735307061; c=relaxed/simple;
	bh=J8KKw734FtDYJi24UwuXtO+d80snnRWQ755cL5JWsX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jxUxUmS491TnBxxxvm2tRm6tjjOu/LFhvRD4gLTNWjQXR76JI3N0ABG0oQtxeKBkSVLhHN5WVHTfNgQwR92xxt4kIihC8hHHi/voutcwXgHCTNYyI8hFSRIl8DsgdCRAGHSekm3IRy6yKp967mE9gvxsRVZjjgg1hEShKE0uw+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Viu2l9ke; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Viu2l9ke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735307059; x=1766843059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J8KKw734FtDYJi24UwuXtO+d80snnRWQ755cL5JWsX4=;
  b=Viu2l9kecJlOY864yj8oIZndcehlNIwMBBqAyVly9eQhAXA7s5pjQ0Vn
   zUCaL+GkUC9TQGy2xvfCLSbzUVUj06IqYPXAvQE8vYSSQbWkhveILgd7X
   9mcWh1fcnREfjttj+uVJDGUJiizwndr5nU0pH7SxrleSG4N36JEJZJRFp
   4TcrwlLCsqgf5OM+W1h9Nh4aJfKADJ29MkLHZJg/QiaMxlfuXyBYKOLzd
   NPsIlf1uKXGvWFvV25B2QOwzbI4NyNOdwHUnXnQ4OTAU4Dq8OCa6BWndI
   w2+HUMmdFqVQR6jXenqMfIVT+MCn2TSw+KX60eAAa1muzAfA0RRq+5nfc
   A==;
X-CSE-ConnectionGUID: L8zqBRBYQb2XaXgvAQ0YNA==
X-CSE-MsgGUID: F+k8uaaDQt2pbDnnKXWyYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35614541"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35614541"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 05:44:17 -0800
X-CSE-ConnectionGUID: DJqI2OoNShS3xMLZYNSBSg==
X-CSE-MsgGUID: tA5RlVV0QYC6QE1d4H55vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104788353"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2024 05:44:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRAdS-0003D8-2g;
	Fri, 27 Dec 2024 13:44:14 +0000
Date: Fri, 27 Dec 2024 21:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2589/2589] mm/page_alloc.o: warning: objtool:
 __drain_all_pages()+0x235: unreachable instruction
Message-ID: <202412272117.9LTbAHTs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   053a6b6f8e4c86200cdb20bc80c063c3bb119859
commit: e037ee4a8deaff7c579618c0aba1f066d6d14b11 [2589/2589] mm, page_alloc: disable pcplists during memory offline
config: x86_64-buildonly-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241227/202412272117.9LTbAHTs-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412272117.9LTbAHTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412272117.9LTbAHTs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.o: warning: objtool: __drain_all_pages()+0x235: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

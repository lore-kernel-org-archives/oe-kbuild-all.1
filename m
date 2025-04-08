Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8271F13CFB6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 20:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744145339; cv=none; b=Rb4fTKyEIgFT63rGULBlKa2GEh7lWJwhqt6p5vD/S/Zmg9M6VSWrI1iN1R62H1qjLMVKywGEn0OZdutKWSyqi0AW6bCmPELidqrFCZwq89jxL6u9YjE1sQpuxxT4v4EZo2pxcn2uXyw+dVUzAC+pJ9rxxOduJOLYQILFfkWaVfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744145339; c=relaxed/simple;
	bh=2m4mqK+hDk58hPs2wUEW69MpUt8uReBY40WbKmjbwAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DsZRX9CpRpDBlRH/HcEQwoXGfyA1TWTL9uSrFfBxkJLeLrO5/Whhu6VOA8rnuw7A9tSh9EmN2mjQR9zfhx0yzG5iX6qXHUGM4lUwcrxN959xRkykaR/Q+Q3Zf0cHYrPZ0/L3hmGEZYqQnCXsdjrNbPdYP4lvXwh2cEBgoQ5h8So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A1YAjN4R; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A1YAjN4R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744145337; x=1775681337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2m4mqK+hDk58hPs2wUEW69MpUt8uReBY40WbKmjbwAo=;
  b=A1YAjN4RA1O5wiL1yCavIvRxstK/8//uDyPHcGWvSiC44epLxcUbzuVs
   pUf/PLh3v20Nh1ufn/5b3CKr/T3nn3C96+lQ4liyboZdV1/9ucdIu7R14
   a6hSCBcbBgIVp7rrfFXmZIAV4kSfS2QO69PDR/tJoODaMaSB1HUI28wzV
   h60U3ZjyUBYAjIVRX2G3kZ/twRvA10HEvxOSMkSPMRRkcD5tU79PFomyi
   7WsjPfQC4UYYcuhA81+KNZgNx404TEbDy5F95S+9SL2omCiwVDzjd8XvC
   56wO03oe2vEatJUlJ4DZlFvpvMEwl5WeJ7bfDMZVrwjdnG2TIiwy3nBY6
   Q==;
X-CSE-ConnectionGUID: RiXnm9edSq+ny7zn8PUY/g==
X-CSE-MsgGUID: lrCdk2MkTtu8eJzOWTSUJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45762076"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="45762076"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 13:48:56 -0700
X-CSE-ConnectionGUID: Ka/zM7j/QrWDqDyDhm/Y2Q==
X-CSE-MsgGUID: cMAaDdfXQw+kFgNvo2pKrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="128371266"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Apr 2025 13:48:55 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2FsK-0007yK-0h;
	Tue, 08 Apr 2025 20:48:52 +0000
Date: Wed, 9 Apr 2025 04:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1571/1571]
 drivers/usb/typec/tps6598x.o: warning: objtool: tps6598x_probe()+0x1ed:
 can't find switch jump table
Message-ID: <202504090456.GrQ4Fosx-lkp@intel.com>
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
commit: 10379cc2b54aefd096d8f00b7e3bd25b3dc6632d [1571/1571] drivers/usb/typec/tps6598x.c: fix portinfo width
config: x86_64-buildonly-randconfig-002-20250408 (https://download.01.org/0day-ci/archive/20250409/202504090456.GrQ4Fosx-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090456.GrQ4Fosx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090456.GrQ4Fosx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/tps6598x.o: warning: objtool: tps6598x_probe()+0x1ed: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222493FE4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 06:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735800784; cv=none; b=s9mMyofJ3ZllM/5HUYKHnPW4YHdOlOeHcDN5v+R4euDDGjOlbHzqCCGmIejjy2gSDiNugWB52JumbRKyIKkHYdMsCeMtKZnicIBiuVx088itygl5KcESE+LqtBu3nrnpOBCQa1Hwu0/6NWLr2uCgMr/p+1lv0vvUOGURBbg0xEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735800784; c=relaxed/simple;
	bh=LfcnVuzE7J1EYRkxnzjcpkWMlpZxeh8e904gCSDdW3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X1nHz9pbPKYLV/Bt7XjTVt43RGsdRh4h6UZfx17GZ+aV42z0WHG57NLyRBcs46UrItyNOsI7Z0Ux5d4E0KNByw5kWHzZ+hqiMHpVn7Ha04aD/Oz3Xi+8XfrpVU7PY4Vlgwxsdu6RlitPVq/mpcZLU+X8MoomU+g4S8TeSCf0giA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlJRsjKs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlJRsjKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735800782; x=1767336782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LfcnVuzE7J1EYRkxnzjcpkWMlpZxeh8e904gCSDdW3o=;
  b=XlJRsjKsTUjQgFSdTDBrqQEz99GIBB/qSohpfz6FOsfXDHteWNpYSTK8
   0zqt5qzhkwuW79CahzajBAywb46h/ggb+k4Fga9/XbJA9PaM8lAl4wrnN
   kwd0UYVxx7XSWDfkFZkhNJFizjq7nmtAPVY84kxENpsYM+4LtBcwQDE4u
   Wlq5H9ue/g7ZDp7aGxBvm3A/QCUKlgJCRJrEW5Lif17pnpOdPHzEfzI4a
   Gz1D6+MvYJbDW5XLRRCL2oJPtojWgPGzzqOWRIg0w22yqhEUwZY73iQKz
   Cf5Yk0jnXPbevYTckeHtdN5tcEn5Z/670cN+5JMWxm0Eeo8vYqOtmK0MK
   Q==;
X-CSE-ConnectionGUID: IRSr2TwiTLaOXXTQiwDk1w==
X-CSE-MsgGUID: KNmK3nNCR9++gIwmaMH76A==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35932541"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; 
   d="scan'208";a="35932541"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 22:53:01 -0800
X-CSE-ConnectionGUID: 9aK/1d+zTFqmNAnVPEdFiA==
X-CSE-MsgGUID: 8wGUjXlfSam+qRKiANlmrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="106473367"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Jan 2025 22:53:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTF4k-0008Hn-0D;
	Thu, 02 Jan 2025 06:52:58 +0000
Date: Thu, 2 Jan 2025 14:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuntao Liu <liuyuntao12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1688/1688] vmlinux.o: warning: objtool:
 .text+0x10: unreachable instruction
Message-ID: <202501021432.vNizIixw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b6753fb2dc636195b639779963ae1e9fdbde0088
commit: f04c0f3eb9b49427c273cd3e4d5a2ff895855b4b [1688/1688] make OPTIMIZE_INLINING config editable
config: x86_64-buildonly-randconfig-001-20250102 (https://download.01.org/0day-ci/archive/20250102/202501021432.vNizIixw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021432.vNizIixw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021432.vNizIixw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .text+0x10: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x14: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x15: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x1c: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x21: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x28: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x2f: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x32: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x37: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x38: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x3a: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x3c: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x3e: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x40: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x42: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

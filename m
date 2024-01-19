Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0958154BCF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705679469; cv=none; b=dvtMcIkrOPjIueFtYOa7woSqW5IuTDiZpnGGVBwRu0BJ8R5axNZbFrLF5Vuqg53YUJfrzg5/hwYtFINTVK0fbv/2VlNUlEk9ucLIy8ET5XObfMa5O1fN5PmgnKvrtB6DBqDWBZCjbeLT1/XVbBcXbqQM24a+vRVJsrnK3jNczOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705679469; c=relaxed/simple;
	bh=OZMjsxEhUNXTkfp33vr0Yv1IsXk+b59OU+4dA1De/+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ez4Qp3Yb/0nGir47xDvpcLaSiiSGXvXOER99sFyEk4N95b9xyD30XMmXjK+hvwso7j6lTznkNEQykfvYaYXA9kZBpHEmQmTiYw5d6mVCON9n6rX8vMDW0AGkHKoTwL846qFuOCeVYs805wKjAe73xJKPBMhASsWcsoeT0ZOYmJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eg7Gn9iZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eg7Gn9iZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705679468; x=1737215468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OZMjsxEhUNXTkfp33vr0Yv1IsXk+b59OU+4dA1De/+g=;
  b=eg7Gn9iZiO8yyhbJ0jgbf2GSg0QE5HFkSBtBAHnZxf+x+LNLsQBmmss/
   CC1o8oUExkLi0WnojZJ8Q5P+UTgWuMuq+sGA13cfl+026A22cc8nm7yzX
   xnjC98TbgUZR46rBFjqdAHij6DBc9+JH3VOrXe7Uu37aIOhVZ6fd9Tgvr
   WKNDK7DjOD/kN7ztUJaYDDIzC+Ar1L7lQG+2vNrrCSNIIje9nZkqLs30s
   DorjhV1CiNbYv+t56QvEoRRdNt2pXxeVjnqxQSsjRqqY+5g+0j8EZ+2Yj
   T/i5NCy5IXUm7D5SUS03KMCEJNvrq46Ufjlv0Q8l7d4tSEZqmHLRsCqZY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19352031"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="19352031"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 07:51:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="621607"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jan 2024 07:51:07 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQr95-0004Ce-2V;
	Fri, 19 Jan 2024 15:51:03 +0000
Date: Fri, 19 Jan 2024 23:50:15 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [linux-next:master 13664/13959] ld.lld: error: undefined symbol:
 csum_ipv6_magic
Message-ID: <202401192357.WU4nPRdN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ad5c60d66016e544c51ed98635a74073f761f45d
commit: 6f4c45cbcb00d649475a3099235e5b4fce569b4b [13664/13959] kunit: Add tests for csum_ipv6_magic and ip_fast_csum
config: hexagon-randconfig-r054-20240119 (https://download.01.org/0day-ci/archive/20240119/202401192357.WU4nPRdN-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401192357.WU4nPRdN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401192357.WU4nPRdN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: csum_ipv6_magic
   >>> referenced by checksum_kunit.c
   >>>               lib/checksum_kunit.o:(test_csum_ipv6_magic) in archive vmlinux.a
   >>> referenced by checksum_kunit.c
   >>>               lib/checksum_kunit.o:(test_csum_ipv6_magic) in archive vmlinux.a
   >>> referenced by checksum_kunit.c
   >>>               lib/checksum_kunit.o:(test_csum_ipv6_magic) in archive vmlinux.a
   >>> referenced 13 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53BA1DD9AD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215998; cv=none; b=NB48btrko7cyY+LOMQnlYJVAuKsLhzt4JB1pEWF3SmcmvnPEqpnLDuX5BjvRpqY2G+Rt+HEXaQeCuFi6n00IwY7c6BmswVJrnx/9GIwqwR86q8H+sQEc9Ys092AY5StwyFPL77v77opG6L5r4+A3hUrYVRza2CPEgny536gt9nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215998; c=relaxed/simple;
	bh=CU0IWkNSCr2UWoykW713NKlpUMFA+dXgB79oDBWgSXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GTqSs10d7pWsnQHEbooMMKv6Y1jmZxQSK/lIZD6r7hPrcAOGGlQmw6uWeVWYOFOgrfavjZ/EvMsm/Huix7XFTwURy+k1xgmm8WcPj+WHWudfVsOe80Gc5n2/RKZ8vgU9ljMHO9Y3H5Fa41q8kg2gm0G1OGCgURCwtt28eFGZrt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPE1qjEj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPE1qjEj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733215997; x=1764751997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CU0IWkNSCr2UWoykW713NKlpUMFA+dXgB79oDBWgSXo=;
  b=DPE1qjEjpqsv86t3knnhKVxIQ7Bqj8usps1Q0J93gPzzA/osuVga+WzF
   Jau9uP8+I46ilV9rXgT1Zlv8lgKWZTM4rVWrBVlJ4sSnwFZoF268oU2mw
   lUxmd49+KZyKCvydUE0kxTFI4lCNPTGW3QadCVH6uk9XAzs7OcaBLJip6
   Wqm8STcolDneepmBvKAKVBxQKx3LfME34iXG9KJAdd5FZe6af2DB8OkEu
   TQGIIR3WdyFcOXv/AKWrdZ8McJlU5paliMoYK5OUNg3L6PYhV/lBn9/3J
   V/Eip9wWTBFfM8yzgDN2Y9YRXo+jafPtmpUtIxaqzhvYI0tKK4BwjxbtI
   g==;
X-CSE-ConnectionGUID: l4G9ziqbS2q1yQMNPTfuCw==
X-CSE-MsgGUID: 5y5dEfNjQ2SW38jhRjxfFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33337522"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33337522"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 00:53:15 -0800
X-CSE-ConnectionGUID: ittYTnFSSOm0xOwa0vDwwQ==
X-CSE-MsgGUID: dBFeScKkSwqRnxFFtH5o3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93566422"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Dec 2024 00:53:13 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIOec-0000QX-1Y;
	Tue, 03 Dec 2024 08:53:10 +0000
Date: Tue, 3 Dec 2024 16:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jakob Koschel <jkl820.git@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: sound/pci/oxygen/snd-virtuoso.o: warning: objtool:
 .text.hdmi_write_command: unexpected end of section
Message-ID: <202412031607.GdxibPdr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: 349fde599db65d4827820ef6553e3f9ee75b8c7c arch: enable HAS_LTO_CLANG with KASAN and KCOV
date:   1 year, 4 months ago
config: x86_64-randconfig-121-20241113 (https://download.01.org/0day-ci/archive/20241203/202412031607.GdxibPdr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031607.GdxibPdr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031607.GdxibPdr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/pci/oxygen/snd-virtuoso.o: warning: objtool: .text.hdmi_write_command: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

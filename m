Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65292DF9E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705604311; cv=none; b=pFcAuFx8R4VTzMWM3rV40dAxGUIIswKXwwL+MAQ3ajsR+/+OEKa52ZQzqirPP/rlrlsThnE/epG0plnFwDId6PiHDZFX0Vet7ebtdwXCxXRHpIM381+7etjtX+Gg34Us3s926jGGgdgr/P4YkVOn5F/eXtzqcdpEGiyWhvKvOUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705604311; c=relaxed/simple;
	bh=gwCSBz2q7+4KY2u0I2eJYAhUP9qpwgkihhMvKqnL6k8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SESjfInzow9jyxh9jFZKV56+tLfH4OgG5ZymDWHSfiyqezJNqRhBwDIIg0I18Tlg03DB4jvT4qJrcLXr/eUhQ5xor7G1Vh2AJTqoy2PjmjhcsJxZvvfrVRIcxs+hKM3kc4FWln6PlX2b/KW1JbgHft7vL9SXaBK79W0nFsf5hsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4ChfZbX; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4ChfZbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705604309; x=1737140309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gwCSBz2q7+4KY2u0I2eJYAhUP9qpwgkihhMvKqnL6k8=;
  b=b4ChfZbXumEyx6SwM7+obpTVk4panQZoPzD3+ZazQTI7kx4ebgI47VVV
   vuzeRRJQ7nvYxgI2VnWypeOc5UxiRnWCNIsLiwvowpdpDCLnorNq0R6Cl
   W2ud1hKbVW+GJCbfBdjY4Zgqjatd8dPojGVKCFTDHyIpeL9xOrshksoQP
   vN4+F+qIcki6ryT92lEeZ9pGKiGKZyrqM93XOxbRXAwgqkqddyTTNR4/6
   yH2gIdXhC11SXJSRza6VcZAYsAqikWQbse/C52fxDE8W4jqJrx8Lr6c0j
   OfDkQK8AjUGG2syfS1GlVtOI/l8SCuX9ovPbLGOqt9ftMagx2VDT5OcXY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="390985797"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="390985797"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 10:58:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="855088045"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="855088045"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2024 10:58:27 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQXar-0003FA-1d;
	Thu, 18 Jan 2024 18:58:25 +0000
Date: Fri, 19 Jan 2024 02:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:mlx5_wc 5/10] arch/arm64/kernel/io.c:40:1: warning:
 'inline' is not at beginning of declaration
Message-ID: <202401190231.07hVFZdn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux mlx5_wc
head:   75d97676a69279a7b9ab70452bd1e97c0a5df3f9
commit: 451662b713a99d59070de953332b72e8ee585f2f [5/10] arm64/io: Provide a WC friendly __iowrite64_copy()
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240119/202401190231.07hVFZdn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190231.07hVFZdn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401190231.07hVFZdn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/io.c:40:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
      40 | static void __always_inline __memcpy_toio_by64(const u64 *from,
         | ^~~~~~


vim +/inline +40 arch/arm64/kernel/io.c

    39	
  > 40	static void __always_inline __memcpy_toio_by64(const u64 *from,
    41						       volatile u64 __iomem *to,
    42						       size_t count)
    43	{
    44		const u64 *end_from = from + ALIGN_DOWN(count, 8);
    45	
    46		for (; from != end_from; from += 8, to += 8)
    47			__memcpy_toio64_64(from, to);
    48		if ((count % 8) >= 4) {
    49			__memcpy_toio64_32(from, to);
    50			from += 4;
    51			to += 4;
    52		}
    53		if ((count % 4) >= 2) {
    54			__memcpy_toio64_16(from, to);
    55			from += 2;
    56			to += 2;
    57		}
    58		if (count % 2)
    59			__raw_writeq(*from, to);
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

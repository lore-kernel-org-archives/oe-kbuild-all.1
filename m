Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169FC3FFD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Oct 2026 02:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791082425; cv=none; b=SgYFOnC5UeXWn0wDwRrTsW3ujwRZKqqYkfvKvhk9FuZHqcfY+Vja64beRAI3SK+ZJHz7OHaX0aUnvAXc9ToaATOEHkYLbuof/Gd6r/GstCTfn6XWQxxqyYNxA+QqMXnJ9BwOxhh2qRyFsuoM0hgLuisYMUlm1HozyMzRFwh6iXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791082425; c=relaxed/simple;
	bh=l1cFXtJwCCVPpLd+8CBUqz7lCrQSjQhsP4aepPK6Ug8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dg4/NtV9n5g/KjV3nz//yjgD6VyGglFcH1N7Rwu6e+aEBrMElHV2Bq0+LZbhz1p8Q0keDvvgH6wKcNQf0YXC49JLlR5sqZmm7J6q8y0IRZtH8diHqxQaqFuc6y+7GXOpUvufR63ymg44+HCZnuIoGXOtrxn9DeGq5ynjd9kF+dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvZC+sBp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvZC+sBp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791082423; x=1822618423;
  h=date:from:to:cc:subject:message-id;
  bh=l1cFXtJwCCVPpLd+8CBUqz7lCrQSjQhsP4aepPK6Ug8=;
  b=TvZC+sBpPZ0AF4zCcFDNIT7m+ZjSUWXmmEJHPBeGirxw+rGlz7tcAc9k
   AvUmrgdpUs+eJWRpbY+X3gfuSJsDHpoAn6eN4yTD2CmvNIcb9JtscHpa0
   Y0Y4Y/4adrpNBjfk49nn++lHD8Hi0XcJUKHrZE1gAlJRHd1Kn1dolCHMM
   k/JgESXXExxYc7Y0OmU5EeFWpunybhkYGaATWLN4kXXStXXoFjaFI7QzG
   WOHEeLwMGchNxZgiHu0lNARGjZ6rPSjTQfHOBnOHfX6d3Tpt3FLxrj3Eh
   9N18255JIN0BSXBNhZJP8QWk6de9CjKad3mqrGiOzgeEppeOKO0WDibZN
   w==;
X-CSE-ConnectionGUID: K9jLKen6TYqM8gh+kVsABg==
X-CSE-MsgGUID: ZIWumrYHR9uAHEzniVK0ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91003851"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="91003851"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 19:53:43 -0700
X-CSE-ConnectionGUID: 7YGupKd4RFWJP9GBvXw4Vw==
X-CSE-MsgGUID: no3LQSO8TG6NXoj1etyFSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="314536715"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Oct 2026 19:53:41 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDCM6-00000000UOV-2up0;
	Sun, 04 Oct 2026 02:53:38 +0000
Date: Sun, 04 Oct 2026 10:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
 Fuad Tabba <fuad.tabba@linux.dev>
Subject: [linux-next:master 13847/14185] Warning:
 arch/arm64/kvm/hyp/nvhe/alloc.c:45 struct member 'data' not described in
 'chunk_hdr'
Message-ID: <202610041002.Yvw5qUrt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f0406245cb9855e6318335a8a223551354291a46
commit: c8d7834c9c219a9a0e3969986e90c5c444b9d98d [13847/14185] KVM: arm64: Add a heap allocator for the pKVM hyp
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261004/202610041002.Yvw5qUrt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041002.Yvw5qUrt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610041002.Yvw5qUrt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/arm64/kvm/hyp/nvhe/alloc.c:45 struct member 'data' not described in 'chunk_hdr'
>> Warning: arch/arm64/kvm/hyp/nvhe/alloc.c:45 struct member 'data' not described in 'chunk_hdr'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

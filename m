Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6161DD548
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 17:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729186124; cv=none; b=bQps7Kp0lHgZXSZxBxvM9+povDkC1tkv2/gOG+jB3UT5SFFuORzKZdwcFfDDTIVqXd7+Ch0Hs/vqqMUu++GgafEf39bWOa/sbuLVoN+uw9BQKJUG8XZCLdW/64u8FdjoFGZLr64Ebh6qQNps7WQgtiwW4qB1kjw9PyHkeZC9Qjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729186124; c=relaxed/simple;
	bh=eeHUJTxLlOxU6qydSEwORan2fZEr0FoTIsRr2fXVn/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHRUrGUKZ5e7liGlgfK989VgBjYSHMY88XSUHG6WuExoO6L52i6hXoQDS3f59Ti7pLcR/759iMtd64gHP3Mt5+54xWvfXI042Heve2vt+M80XogDHc3kYmDogiG6T3cd7gIkyr4cD/L464bZ0PcbtaKkCcv3MA83F2nvf2duJZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nuBISOOO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nuBISOOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729186119; x=1760722119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eeHUJTxLlOxU6qydSEwORan2fZEr0FoTIsRr2fXVn/s=;
  b=nuBISOOO/4LZb2THNJpqsj7AgIeI2x+7/y3kBFadwDQ7e4TScFSTrHit
   /YdMweA5s2ZcNzdaXezwXgyfluBoBG7yFr2zgXAOS3QL2bwll0tBHnbHX
   /9JqKRDVRWU/0hOm9B6oxgpkvAvpLUH+buUNFAfLZvCDgcswb3VPpBnA5
   eLp00VmTbjfglFSsZTWm4bS07lC9W/pRrkFOrRSxFHtFfVs9qy3g933vK
   ytceavAAHLwCznvSuE/N7fhAoNIm0Bjoq+wcZtJeGu7+F2UDY/rTjGqor
   HcBeUeZnqwl+sTJe4n8qyp6l3GaLm21fWpJ2ZR6nfm/6AAtwTzj2Oeo2V
   Q==;
X-CSE-ConnectionGUID: VnfEWc/9SSa9ph+SG3poyw==
X-CSE-MsgGUID: Fnkp1x59Q0KXryB3DyjU4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51234119"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51234119"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 10:28:39 -0700
X-CSE-ConnectionGUID: WON3iauEQAWJOiwYIN38Bw==
X-CSE-MsgGUID: NDTzDksxSkm9jOAhzOPiXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="78507476"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Oct 2024 10:28:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1UId-000Mfb-1m;
	Thu, 17 Oct 2024 17:28:35 +0000
Date: Fri, 18 Oct 2024 01:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>
Subject: [linux-next:master 4569/5321] WARNING: modpost: vmlinux: section
 mismatch in reference: ip6_mr_cleanup+0x0 (section: .text) -> 0xffffffff
 (section: .init.rodata)
Message-ID: <202410180139.B3HeemsC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7df1e7189cecb6965ce672e820a5ec6cf499b65b
commit: 3ac84e31b33e2051e59245b8ceb25d707fa0e553 [4569/5321] ipmr: Use rtnl_register_many().
config: mips-db1xxx_defconfig (https://download.01.org/0day-ci/archive/20241018/202410180139.B3HeemsC-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410180139.B3HeemsC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410180139.B3HeemsC-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: ip6_mr_cleanup+0x0 (section: .text) -> 0xffffffff (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: ip6_mr_cleanup+0x14 (section: .text) -> ip6mr_rtnl_msg_handlers (section: .init.rodata)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

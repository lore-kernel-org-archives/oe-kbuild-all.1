Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8099F8614E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 21:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732311866; cv=none; b=TDTKaHyXDEZFZ0+GrR2qRoIDLKUAE48UFEdAB6K2CKposwlhsCIi/NUgTAZrj0MqtyFy7jxIRjTNrfDNSTjX5tczMQU5I4K0/A8N+pIQWuEc2ujQ8YJxRGo/Y+oxEUiRvfqu0EeqiiifNO7VRA/hlnqbCoceHmeRpSEGcNlNpg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732311866; c=relaxed/simple;
	bh=+YiAqfXxoTzGUwXix7J4zcMavd+7rM6bohqwdPgTrG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUPSfhcbBHGRHhucYHxX9XQPYNBQYzmnCPI2cdaPOuprtpNnurMIJhRNz7gtcdeGbJDbEqZdUjvRdlcaVIs7s5mwz5BwpCIpw0mbL35LrdD7fBw0DDnt4G529MB3NZRkPTsekVsLMdDMp61M0w69NO9VaEbFRK0GK6usgCFJsA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgzInx+S; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgzInx+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732311864; x=1763847864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+YiAqfXxoTzGUwXix7J4zcMavd+7rM6bohqwdPgTrG0=;
  b=IgzInx+SZrvNVoKPsJpZmhGyO73c1mrQykqW0jN5Ik+uTPQcbAj0JSjm
   fGTMZahbTNKyDb6eDL8SKUUHPhQeJPGnTNU0d+2eGJayHmZU0AeETZ74x
   AAWYMcRHs74+syJq9ymdK5h+nDPpr4P8ZnByhV7g/KX9+wjhz0k5eSfAA
   NsnBaPtd2s2BEliCXA0Abk7slFC8hA4LXq4gQ6mrEw8eFVFjaltZ5/QGQ
   yPdXvmy+BgRdIrrku+XBNKGdUeIufjvGLGEkvXFjwLsC38DyGljWu2q/b
   oOWnmiG5vs+CwN6JGoqvygi2ocZENxi4j7FqZKEJcdKzzDYEXyGyYKKLl
   w==;
X-CSE-ConnectionGUID: +lTDF7iKSGWVGR3/Is442g==
X-CSE-MsgGUID: bMvYIvmSRLe4VzS1gOGosw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="31868362"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="31868362"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 13:44:21 -0800
X-CSE-ConnectionGUID: yx+KRAVpT9i6V+d0wTIAAQ==
X-CSE-MsgGUID: B6i+XKiiTT6EPzM/jpLuzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="95744472"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Nov 2024 13:44:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEbRp-0004EV-1a;
	Fri, 22 Nov 2024 21:44:17 +0000
Date: Sat, 23 Nov 2024 05:43:25 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug 5/17] (.text.relocate_kernel+0x154): undefined
 reference to `saved_context'
Message-ID: <202411230543.RxT6V0gK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug
head:   82a5c5d637f1fbf912942eeb06069f111f7b3223
commit: bd9290d2ada17ca6e2417d85b8494744443e5a26 [5/17] x86/kexec: Use linker script for relocate_kernel page layout
config: x86_64-buildonly-randconfig-001-20241123 (https://download.01.org/0day-ci/archive/20241123/202411230543.RxT6V0gK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230543.RxT6V0gK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230543.RxT6V0gK-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/relocate_kernel_64.o: in function `virtual_mapped':
>> (.text.relocate_kernel+0x154): undefined reference to `saved_context'
>> ld: (.text.relocate_kernel+0x15b): undefined reference to `saved_context_gdt_desc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418CB1AB6FF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693423; cv=none; b=t3Huhh98MvpChaRkq+I7UgAm3bl0oZF3M0LdJzZ1iRHVLvoPdPCrI3VOb9W/gRycrcfAir+KrWTGYAK584IDnTxBC41UIdrSadRO2OTQiIkfZ+bQnwt+e46StvQu5Wvch85b1Pxe3jD73k7yUoWJKHWY9xjsdtvMUrs4gSDD+hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693423; c=relaxed/simple;
	bh=M56st4XR3iiBFn4KaV1V9SU7mWjjl32KE3MXcdR8aEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SoMxdIUMmpPaKwJSbmfRDUGVOmhoDHg5e6yoXEBvbnqW86R5HsHH1LaT9y2Q9QN73dq4+1GbqXVQMiF+IWbUr/fKIlpIcM+jfdEbeD9v4b1jhnALcYvIAxaMeeNISFQzmj6cC/z6yhGss0H52dk5tKK4pKn4d6mapc3xI3RqqJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJ6J2qXf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJ6J2qXf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729693421; x=1761229421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M56st4XR3iiBFn4KaV1V9SU7mWjjl32KE3MXcdR8aEI=;
  b=HJ6J2qXfyKGabXou3m8MiY3OhZUxXH/fHj1R5jcqTHcq6kpJSniCXhp3
   nogaTtcx1spvYuhy5ep9XDuvEsvKSCS4zu0iS71dEDjf/a3NLtggiiW4v
   F99ei14RMBzecZuLvmq6JggSJEmVJw9MJ83/KDLmvq6LMTXI9XwoIMm9q
   0AONl23CwJXLH+w5n6BIuzAeIml9OW90+enkk4/f5IemeaWbk7HPSsXrO
   eDf2XO6GqGCvd9aDPZ2u3kB8pQgpTeq0x9Alr3+hYhgnFFrl7HN1Af+5n
   W8Oab0SFWmE+GGYflh8Rqt5ldK/Kc+9XbxzHdcDAYiB8+5T9yAu57BlIr
   Q==;
X-CSE-ConnectionGUID: 81ADyWVpS/29RY/Ws6hDYw==
X-CSE-MsgGUID: 7s6/YIO5TIiW5xVlMoUR9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="32139578"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="32139578"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 07:23:40 -0700
X-CSE-ConnectionGUID: EDhuSORASVeWt5fL4N3ySg==
X-CSE-MsgGUID: ZWF78SqDRzqtlqf6LY5bVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="80244451"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2024 07:23:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3cGv-000V1S-17;
	Wed, 23 Oct 2024 14:23:37 +0000
Date: Wed, 23 Oct 2024 22:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:crc32-lib-v1 27/30] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_CHACHA20 when selected by BCACHEFS_FS
Message-ID: <202410232254.ogS6Em2d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib-v1
head:   df44c9de0d037caccc2bce95125af64a941c4419
commit: 7290ac04d052de4256b4089db93f26194018aa81 [27/30] lib/crc32: make crc32c() go directly to lib
config: nios2-kismet-CONFIG_CRYPTO_CHACHA20-CONFIG_BCACHEFS_FS-0-0 (https://download.01.org/0day-ci/archive/20241023/202410232254.ogS6Em2d-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241023/202410232254.ogS6Em2d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410232254.ogS6Em2d-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_CHACHA20 when selected by BCACHEFS_FS
   WARNING: unmet direct dependencies detected for CRYPTO_CHACHA20
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - BCACHEFS_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - BCACHEFS_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_POLY1305
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - BCACHEFS_FS [=y] && BLOCK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171DE16E88B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719063531; cv=none; b=n+9I0TcPjLoXNiQQraSlNORn50kU/us5e/qFpwf3b/zLVBBMlLodeTy35iv8wDUzNsdmYmx07qpupjFsxET5I2XlSwKLD0ZVJHe1JtNWkTGaFH9iEHBZtV7qoqnINsUXa7tPr0WpQXSYDngwKRh/MPryeRanzE23R9T43gEBlWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719063531; c=relaxed/simple;
	bh=g0sfr6UI+IIRgZI9zhOUqsg63f+f5JVmQpJX5gOT/Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Slud7oJ0e5moRkzajb0D85dlcEdQYi6QfYDabJtLQ0sUXY8xisjmbY2XXof2qtz90FXDWp26E5O4WIVxvNGW67vZsVDFHe/OJUVh1UnyczEX/UyAoa1YWG4NEYHyh3tmGzUkOpNYOKunbXTRue4oI0/5HGgLR8RtZw2o+89Xf4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQYXSZMb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQYXSZMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719063529; x=1750599529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g0sfr6UI+IIRgZI9zhOUqsg63f+f5JVmQpJX5gOT/Ac=;
  b=OQYXSZMbSBEUAbnprw2wHa0dmD6k0DS0BLfrKACdcdNd7NT64pkrNsK9
   UO8BqtcMgKSrgvWy1UPPIqWIv4BVqPA8EP9HzqSY6dDGf8fUbXpz6IN3X
   tspvYwCXY9k6eKuUS6tbjomKNLXbLFAw0r3Z6gPhnexZhP2TZbBULxqL4
   uFw3oZbBl9CPz82ScuXLy1/oGke6nCL241kAjYjYBLMstVKW+A0DoS7Vl
   JGRvnQAVCHiRxzBOY5TJg8ni9MaIJYtICLQLbM66fOMptChZnvkewZFXX
   oE2ZUNs0tC4NyUOtXsIfEbxJn0vlK7uKFj0pZCz7BLKLwwr/vHC64xG9A
   g==;
X-CSE-ConnectionGUID: /5Hot6ofRSCpHmDeuR0VKQ==
X-CSE-MsgGUID: Mr/yp9ovSneguyYkSWcg0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="16229915"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="16229915"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 06:38:48 -0700
X-CSE-ConnectionGUID: yD7iGQTyTFGufX2/DhsBig==
X-CSE-MsgGUID: TXLa6OVIT7aIJ1cf5R7QrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="47300948"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jun 2024 06:38:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sL0x3-0009fG-0k;
	Sat, 22 Jun 2024 13:38:45 +0000
Date: Sat, 22 Jun 2024 21:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 6/17] undefined reference to `tcp_recvmsg'
Message-ID: <202406222140.yO0PTPaS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   e1d705ecf1cbeeaa9091d3d2f0504acfbb18475f
commit: a7542a0bfa7ee95a543b0dd9a781a0876f480270 [6/17] io_uring: add io_recvzc request
config: x86_64-buildonly-randconfig-004-20240622 (https://download.01.org/0day-ci/archive/20240622/202406222140.yO0PTPaS-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406222140.yO0PTPaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406222140.yO0PTPaS-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `io_zcrx_recv':
>> (.text+0xc0dce2): undefined reference to `tcp_recvmsg'
>> ld: (.text+0xc0ddac): undefined reference to `tcp_read_sock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AA5143C4B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 19:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708716523; cv=none; b=lYPx7ua6bo5WuYo0hZ8mJ+V1X24WTtUelu3D6GsL6YK8szo0y0epIO76BtZ8YVp5XWTfIxf4pFUB5V5fNx6lzfnDtdzHoPfQU8YP1y9TJRI6pUHRM5IM+jh3MZS5ZsGcP7ixjixVCqr9J24toTH7Q9uCx630G8HLqEZQnPRpT/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708716523; c=relaxed/simple;
	bh=m4oATiFHPmrTyBQg7XV6dpKNGtj6pwcXZRd5vGhpkvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kecQSZCy0VZLCay3cYdmUmvYGxYgutar7lC04UoKCmEboNj1ZHV4/ZkJNuG3nq+oAaIViWc/R7X6gxSYZ2Q+N05dQr2hFeeWxMMP+BBYiFEFS6OA9H513y+OyPAyL9Ega7rCJNjXGiXdUA+KHm6VriLduYqfU5rYgwuAw7NGnPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEvUrE2Y; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEvUrE2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708716521; x=1740252521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m4oATiFHPmrTyBQg7XV6dpKNGtj6pwcXZRd5vGhpkvc=;
  b=QEvUrE2YNlLBia1x3AIk23ZX9su0dE+NsVg2Pu6CstjKOn26ICO9NrZW
   Vpmooar884xBPS9KTEbzZh8xbrmWOl6QWiMejJ8qdHwemeZdPV/YC7iJS
   dgN+CAOEAxUgfzjh77pSiiN2OGp9+4aprTO+LOS++44eXLziHzW+Yp3mH
   kr9xR2VAJdkn2rjtGoZgcz1SD/uRx6fr9AeiDI6ljRpwLLrsYZE3fSIK7
   Z8QD5MNzix1KFHPQ9IgmqBxn0kj+XE3e8Y2IF8b/A30FUvurasdcZkLPW
   FiokftwpaPtFtLWefNVB8mQJCCHAzXfs/qFZgUchhcQHnmFYPG8IK/Cu3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="3191511"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="3191511"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 11:28:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6483731"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Feb 2024 11:28:39 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdbDp-0007pY-0E;
	Fri, 23 Feb 2024 19:28:37 +0000
Date: Sat, 24 Feb 2024 03:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-latest 12/15] alpha-linux-ld:
 io_uring/net.c:1056:undefined reference to `io_zc_rx_recv'
Message-ID: <202402240331.fOEhz42s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-latest
head:   422e699712a532c85e16c4e6afda9d4d4164bdf3
commit: f511e9239c22c8e0ef7cb773efb144aff2afeadc [12/15] io_uring: add io_recvzc request
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240224/202402240331.fOEhz42s-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240331.fOEhz42s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240331.fOEhz42s-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: io_uring/net.o: in function `io_recvzc':
   io_uring/net.c:1056:(.text+0x29a4): undefined reference to `io_zc_rx_recv'
>> alpha-linux-ld: io_uring/net.c:1056:(.text+0x29b0): undefined reference to `io_zc_rx_recv'
   alpha-linux-ld: io_uring/net.c:1056:(.text+0x2b88): undefined reference to `io_zc_rx_recv'
   alpha-linux-ld: io_uring/net.c:1056:(.text+0x2b90): undefined reference to `io_zc_rx_recv'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

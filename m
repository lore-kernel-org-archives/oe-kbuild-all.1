Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD8367E6C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709281424; cv=none; b=JYxrGzAxBZJxTH4CrBaQIjiPxP44bvBTaRaOt/kyA3mstRkl8zFdRTONPDeGq5ccOfIILbJPlC/0tPLpxpEGA4jhm8SLFdYmr/geP3bvaURmxoZv0HskLRRwTW2j8qRsIqUh4gv4cCyPDnYmaKajUQkC7u21jMW1EK/W+9e1jn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709281424; c=relaxed/simple;
	bh=H0D6r3dS36fDdj1CTWsE9Tr5mk9sm+q/XVqjCoJL6g4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YuNABrYP9NZG63gbzPHj8ueH6FqTYMvLGPu702euocpH8tjvO+7sWNpVaxBP7wpbDxD2mKGR57SPwyZDserV0SyayPsmUth+ckPrG3bAHA31L8bPbdg4Hzzmi4PXFfmKgR0QIj7EGtme+LGseeueo0vcQCa4KHTtNBUl9+r38uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isKMqoO3; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="isKMqoO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709281422; x=1740817422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H0D6r3dS36fDdj1CTWsE9Tr5mk9sm+q/XVqjCoJL6g4=;
  b=isKMqoO3cR2vjI91DNz5WjSe2R9r2DQLDw4tUmceHBXfc4jyKe7kulVo
   APFk3cKkwu9vfzPMYMz49L5oShYtrE9whcz5emSMGavjlMAVZIgngQ4vt
   30HMso1MWql8oipoYPSuENdl1dEqOK4+IGEp4gVaUWBbEIY/XYDML0H8V
   lSrDlbX48nWh63QoOFaWdur5PtlIYdMpwJXxs9Rcpmb4pYkgsGgt4p2ec
   1kyj6j99XTn3+hMCKdNb/ArsFPuL9GAv5iYHKyFutOCQQZzToYiIXaUOL
   RR5+6iFfqWbD5X7zBWGx5i/FKTQ/1Wyw6XesIf2RBwOcT7zF1J9AL8l+o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3979873"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3979873"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 00:23:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8271371"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Mar 2024 00:23:39 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfyB7-000DfJ-0M;
	Fri, 01 Mar 2024 08:23:37 +0000
Date: Fri, 1 Mar 2024 16:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-v4-dmamap 914/923] io_uring/zc_rx.c:224:13: error:
 implicit declaration of function 'io_file_need_scm'
Message-ID: <202403011641.JSfilvH0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-v4-dmamap
head:   a25700398698f032509948d0bdc60ad210a8590a
commit: ab1d3b45c1a77979ac37c8c1ed6db2cfc14cc217 [914/923] io_uring/zcrx: implement socket registration
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240301/202403011641.JSfilvH0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011641.JSfilvH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011641.JSfilvH0-lkp@intel.com/

Note: the isilence/zc/rx-v4-dmamap HEAD a25700398698f032509948d0bdc60ad210a8590a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   io_uring/zc_rx.c: In function 'io_register_zc_rx_sock':
>> io_uring/zc_rx.c:224:13: error: implicit declaration of function 'io_file_need_scm' [-Werror=implicit-function-declaration]
     224 |         if (io_file_need_scm(file)) {
         |             ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/io_file_need_scm +224 io_uring/zc_rx.c

   196	
   197	int io_register_zc_rx_sock(struct io_ring_ctx *ctx,
   198				   struct io_uring_zc_rx_sock_reg __user *arg)
   199	{
   200		struct io_uring_zc_rx_sock_reg sr;
   201		struct io_zc_rx_ifq *ifq;
   202		struct socket *sock;
   203		struct file *file;
   204		int ret = -EEXIST;
   205		int idx;
   206	
   207		if (copy_from_user(&sr, arg, sizeof(sr)))
   208			return -EFAULT;
   209		if (sr.__resv[0] || sr.__resv[1])
   210			return -EINVAL;
   211		if (sr.zc_rx_ifq_idx != 0 || !ctx->ifq)
   212			return -EINVAL;
   213	
   214		ifq = ctx->ifq;
   215		if (ifq->nr_sockets >= ARRAY_SIZE(ifq->sockets))
   216			return -EINVAL;
   217	
   218		BUILD_BUG_ON(ARRAY_SIZE(ifq->sockets) > IO_ZC_IFQ_IDX_MASK);
   219	
   220		file = fget(sr.sockfd);
   221		if (!file)
   222			return -EBADF;
   223	
 > 224		if (io_file_need_scm(file)) {
   225			fput(file);
   226			return -EBADF;
   227		}
   228	
   229		sock = sock_from_file(file);
   230		if (unlikely(!sock || !sock->sk)) {
   231			fput(file);
   232			return -ENOTSOCK;
   233		}
   234	
   235		idx = ifq->nr_sockets;
   236		lock_sock(sock->sk);
   237		if (!sock->zc_rx_idx) {
   238			unsigned token;
   239	
   240			token = idx + (sr.zc_rx_ifq_idx << IO_ZC_IFQ_IDX_OFFSET);
   241			WRITE_ONCE(sock->zc_rx_idx, token);
   242			ret = 0;
   243		}
   244		release_sock(sock->sk);
   245	
   246		if (ret) {
   247			fput(file);
   248			return ret;
   249		}
   250		ifq->sockets[idx] = file;
   251		ifq->nr_sockets++;
   252		return 0;
   253	}
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

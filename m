Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CB616FF3A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709289061; cv=none; b=k7rEOytxXqokvcmJ6PTRYF/tbFKnWneIyXK1i87nzvavtf5D2f7sFo+kgRonmIWZ1S0aTafurlGfrY2HYv69cbfcSnjlXwYoxjC0jWuz3Q2wWblutGniwfU1uSdngFGbA9Y4uBKP5i8s/JsvX8Q/BaxdRlfxWGWyeB9TARlidTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709289061; c=relaxed/simple;
	bh=wMwubyVN54UZ/N+d3ZmQxqgsA4jzx4FPRpq6DubH86U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AeqmR6gL+9qaW8rOJOTTe4/q1fj92PLmrJIb1g1WsC89s8HTf6g4P3McXFxcLEZwOirOovL8DBdLapgTClbK/rlwVUPwxVB7xWNy/BA72XsiCPQyS5DaenwnX91vC9KXH/D452vzUzGVbppRdKgsupe4wHfXqI3AAPdC68k51sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YroM1Mlz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YroM1Mlz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709289059; x=1740825059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wMwubyVN54UZ/N+d3ZmQxqgsA4jzx4FPRpq6DubH86U=;
  b=YroM1MlzilEHo4TO4eIg7E/gGisT0cW/pO+YORulbnYk44mpuU8fR5Fx
   vnTfkVuWivsx2P/0jQjnKbfUFn/3uw/KWZZn3g+qmocpEVUGDxR9//GAH
   py37WvxpoMnYlL4ZvqWsPgbhGx3aIZ6dtO80n0f/uepMteI5MaE5XbHrv
   owJbq9Ct0niZCHH7B4Gxw9p+dn7jNN3R6HDRoscDdacSpxzObB+m1BKDW
   B8j/UxmJB5OpUC+y1OmGrYgnkOA3Zwqq/CtLqLhBGREAiT6EbUCnGF5tF
   2u8O190S5bCcq7H0VoIPpzyXucEO/OmfHRNNpZac+UXiwnRJm1fcnHLc7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14460010"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="14460010"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 02:30:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="12761918"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Mar 2024 02:30:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rg0AJ-000Dn5-2i;
	Fri, 01 Mar 2024 10:30:55 +0000
Date: Fri, 1 Mar 2024 18:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-v4-dmamap 914/923] io_uring/zc_rx.c:224:6: error:
 implicit declaration of function 'io_file_need_scm' is invalid in C99
Message-ID: <202403011840.Q402C3TQ-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240301/202403011840.Q402C3TQ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011840.Q402C3TQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011840.Q402C3TQ-lkp@intel.com/

Note: the isilence/zc/rx-v4-dmamap HEAD a25700398698f032509948d0bdc60ad210a8590a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> io_uring/zc_rx.c:224:6: error: implicit declaration of function 'io_file_need_scm' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (io_file_need_scm(file)) {
               ^
   1 error generated.


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

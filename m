Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A295120330
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 06:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720073975; cv=none; b=BGXDnML4aLNvU3mtAuHCsKK23h3xbXmPSPrpJFKvVHUcILBCf7qWQoFIYJpr+jG3weOXZlGkLjxCdY/2JWmr7wdwuU76lQamYR9R5IbmWkcokMGcdWJoaigMku2FB6fhDQnzGJHv7Dm2jVJ8/meSxfXP+yk3p3FSMJCBIVL3mAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720073975; c=relaxed/simple;
	bh=kT/jwocNhrSqtfRLikNGWSWAyqE6z1s60kL9pzAzpBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lsxMuNC/QP7AZAk1E5oVrgEwHp+u3BYiyZ8AUlA+VUBcgWFNYBJ1SfPhfYMXKg1KBYOr8dWSDngZnfJEBzOhEDkeHip8AG+M3+fcMrBRG83U5UQA7pBhtpbOrf428Aho+13GgL7Criuza8WeF4DEOuBQq3gsf6nN4Dybri8prE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DT5+rxDU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DT5+rxDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720073973; x=1751609973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kT/jwocNhrSqtfRLikNGWSWAyqE6z1s60kL9pzAzpBo=;
  b=DT5+rxDUvU9LAdsAcyKBg9BW5VVeNRG1v55FlI1c2Hxr6Yi+ST+WAH+S
   ydy0kfxDf00A7JP5vkZtAILnUTQWdCB7UfuIjw++iKJqboTk1gQUPLOjB
   Ls97ORngrqw96FkOAGjeD5hYAZw2zwBLXiBSRK+Qtt7MrgKfxunRYIL9F
   NYHATQPP43++eOPJh015cjedCCtuWLYWsfGKhQXpQ68DV8EiAh1HuAlrr
   Say/WxYjetmMCWdtSx2FqMD2EdhW/z54sB1ztC+xbtwpClkFAxv1JsOjH
   MPk1XImUlRsdvTonIVUTQwSpuok5ugdlEIP8HS1CaDcYEiy83UhX8ZnmV
   w==;
X-CSE-ConnectionGUID: oJrN1GOkSBGBqnN8+w3K0A==
X-CSE-MsgGUID: Mb/0xy2IQGi1LN4CVRKbEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="21141507"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="21141507"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 23:19:33 -0700
X-CSE-ConnectionGUID: 85LKvXvuSuqXvR/ljJOREQ==
X-CSE-MsgGUID: r0GPS2CeTmaKyORD3KWcvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46380956"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jul 2024 23:19:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPFoY-000Qe9-0B;
	Thu, 04 Jul 2024 06:19:30 +0000
Date: Thu, 4 Jul 2024 14:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [uml:pending 6/33] arch/um/os-Linux/file.c:530:18: sparse: sparse:
 Variable length array is used.
Message-ID: <202407041459.3SYg4TEi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux pending
head:   9828ed5dd7c1064a6c90030f13778287a0d228f2
commit: 0aeae40caf0be447610aabab50a03e3c2f8f511c [6/33] um: generalize os_rcv_fd
config: um-randconfig-r132-20240703 (https://download.01.org/0day-ci/archive/20240704/202407041459.3SYg4TEi-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041459.3SYg4TEi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041459.3SYg4TEi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/um/os-Linux/file.c:478:32: sparse: sparse: Using plain integer as NULL pointer
>> arch/um/os-Linux/file.c:530:18: sparse: sparse: Variable length array is used.

vim +530 arch/um/os-Linux/file.c

   514	
   515	/**
   516	 * os_rcv_fd_msg - receive message with (optional) FDs
   517	 * @fd: the FD to receive from
   518	 * @fds: the array for FDs to write to
   519	 * @n_fds: number of FDs to receive (@fds array size)
   520	 * @data: the message buffer
   521	 * @data_len: the size of the message to receive
   522	 *
   523	 * Receive a message with FDs.
   524	 *
   525	 * Returns: the size of the received message, or an error code
   526	 */
   527	ssize_t os_rcv_fd_msg(int fd, int *fds, unsigned int n_fds,
   528			      void *data, size_t data_len)
   529	{
 > 530		char buf[CMSG_SPACE(sizeof(*fds) * n_fds)];
   531		struct cmsghdr *cmsg;
   532		struct iovec iov = {
   533			.iov_base = data,
   534			.iov_len = data_len,
   535		};
   536		struct msghdr msg = {
   537			.msg_iov = &iov,
   538			.msg_iovlen = 1,
   539			.msg_control = buf,
   540			.msg_controllen = sizeof(buf),
   541		};
   542		int n;
   543	
   544		n = recvmsg(fd, &msg, 0);
   545		if (n < 0)
   546			return -errno;
   547	
   548		cmsg = CMSG_FIRSTHDR(&msg);
   549		if (!cmsg ||
   550		    cmsg->cmsg_level != SOL_SOCKET ||
   551		    cmsg->cmsg_type != SCM_RIGHTS)
   552			return n;
   553	
   554		memcpy(fds, CMSG_DATA(cmsg), cmsg->cmsg_len);
   555		return n;
   556	}
   557	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

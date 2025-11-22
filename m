Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575BC83A14
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 12:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763813799; cv=none; b=UeJCfQfgwruMw4iNBIdDbLq+j6+GcGY/VqxkPaMkXjNNSAQkLaQ6ZfQHZ83s8LCAmXz9+4lzz/qOQkb3ez5ROz1bsf6Wps2eHghvgrOUEoNqunpII5nTugUr+pNudwPIZOFwazajA0RRThS/YHnZGys9XwjnQhtL6OimYVsp3QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763813799; c=relaxed/simple;
	bh=nXbgEfrEqXw7RVfJBviIqRsnNCqu5NUlO4PSwnD+E28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FT2O1OV+W/UIRHEOY18h+L46rvjLUmzV9B8JDYY6kaW9YgFdIRT1LviSWNarK9VqY8rkGyFOSmb6EehcUJuNNT2VXqvywHRNAuSFLT1RFZkPlGvHAc25mocYKyAmUQ23lOfw1YurrIIs6SM5OAq12dQLTonUvcqPVCq86wBg0Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxTAqOD5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxTAqOD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763813797; x=1795349797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nXbgEfrEqXw7RVfJBviIqRsnNCqu5NUlO4PSwnD+E28=;
  b=XxTAqOD5MbHUScrfdPnBNHO8/Yf5Xd2np+KloeZSNXvPRzTP5ogKdrzo
   HKMon/GwOtu/D0VhcjtgPKZhpQfC/Ac8HrHWJYL9K13bf8YY7GuFWSnqv
   T3ZQLoH3xszOlH4WglxdmWby2la8gzSoDjhoKBmkjOIxtVgz2de2W+rCv
   HExzxmgex+3Rm63Kp/4w8P4Kmz/8rV4NxvkYsNIPVUIXoe1iBMISMkWYh
   GtiNPXZR14I3IGWVAVeWP9hdnSLO57ZTIv291Ck7xZNUy6A/CxUStURhg
   x8w2b8fq8HJ0KoEFogyrP2OzyQ1FMGx76KM10dlmF1lXGK1ACGX2yNY5a
   Q==;
X-CSE-ConnectionGUID: ZXPPvb7vRFSAR9zIwiv1Mw==
X-CSE-MsgGUID: KoLuiNxKTPajYHX2qFMXkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65077759"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65077759"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 04:16:36 -0800
X-CSE-ConnectionGUID: ohV1ZI3eSQWlnCPbHuciFQ==
X-CSE-MsgGUID: MJELXicdS6eHaED52nAopA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="192694404"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2025 04:16:36 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMmXZ-0007UZ-21;
	Sat, 22 Nov 2025 12:16:33 +0000
Date: Sat, 22 Nov 2025 20:16:16 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 10/16] net/vmw_vsock/af_vsock.c:2210
 vsock_sendmsg_shmem() warn: unsigned 'desc.fd' is never less than zero.
Message-ID: <202511222003.62hGRPdx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   8d6b7b623852a5bc1d39af5ab57eac793f854123
commit: 32138a86d9919ca28e597d5568784c5c26d4ce95 [10/16] vsock: Add shared-memory support for virtio and loopback
config: parisc-randconfig-r073-20251122 (https://download.01.org/0day-ci/archive/20251122/202511222003.62hGRPdx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511222003.62hGRPdx-lkp@intel.com/

New smatch warnings:
net/vmw_vsock/af_vsock.c:2210 vsock_sendmsg_shmem() warn: unsigned 'desc.fd' is never less than zero.

Old smatch warnings:
net/vmw_vsock/af_vsock.c:2391 vsock_connectible_sendmsg() warn: inconsistent returns 'sk'.

vim +2210 net/vmw_vsock/af_vsock.c

  2189	
  2190	static int vsock_sendmsg_shmem(struct vsock_sock *vsk, struct msghdr *msg)
  2191	{
  2192		const struct vsock_transport *transport = vsk->transport;
  2193		struct vsock_shmem_desc desc;
  2194		struct cmsghdr *cmsg;
  2195		int err;
  2196	
  2197		if (!transport || !transport->send_shmem)
  2198			return -EOPNOTSUPP;
  2199	
  2200		for (cmsg = CMSG_FIRSTHDR(msg); cmsg; cmsg = CMSG_NXTHDR(msg, cmsg)) {
  2201			if (cmsg->cmsg_level != SOL_VSOCK ||
  2202			    cmsg->cmsg_type != SCM_VSOCK_SHMEM)
  2203				return -EINVAL;
  2204	
  2205			if (cmsg->cmsg_len < CMSG_LEN(sizeof(desc)))
  2206				return -EINVAL;
  2207	
  2208			memcpy(&desc, CMSG_DATA(cmsg), sizeof(desc));
  2209	
> 2210			if (desc.fd < 0)
  2211				return -EINVAL;
  2212	
  2213			if (transport == transport_local)
  2214				err = vsock_sendmsg_shmem_lb(vsk, &desc);
  2215			else
  2216				err = vsock_sendmsg_shmem_dmabuf(vsk, &desc);
  2217	
  2218			if (err)
  2219				return err;
  2220		}
  2221	
  2222		return 0;
  2223	}
  2224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

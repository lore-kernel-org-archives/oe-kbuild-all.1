Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9755E1BE842
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 04:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726202918; cv=none; b=FlENFJnKzDkbeV9LvbVbnKdUzga83DGF8MSKjVrIYlAqOZ2TFLI+eb5smLb/a4OI2Y4vlxt9fin+bb2zxVK65wI0wu7p2lu6gFFwK8aABCHmPQbSsuAUy+jvYbkEybnDB+cg/8LXJ87n2va/qlOvnZ4nAK8oPw6i5/hosr/aCBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726202918; c=relaxed/simple;
	bh=boFXt8zbNNBXQNB8mdMxmZAxfDWrXgRPTpDY9TV3BJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDLSaZ+ZjwJGUkNimPBu5F9/0ON5YQiqqEvGLtMwZIBSaIQVqqej/dM98ncj7LXYxAZk8EIPCbPj4KzFzRHeCNhsf/p07HZvwhDpD+PwMf+GeUQ2WdC0KRD4wB4aPMJRqU6zHn4j+NM9rgW3xyfn6iweE+fpHgOoZhpN35aJUHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QP4h5jMW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QP4h5jMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726202917; x=1757738917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=boFXt8zbNNBXQNB8mdMxmZAxfDWrXgRPTpDY9TV3BJ0=;
  b=QP4h5jMWE2ej+NavothBSjAiXRYI9rprKaTVYYg3lDh/aD7lPXdmV4iX
   JariTH/fyyqpba00eJvLA5jXuwBNPpARyvMinTYU3P1leFudPlgrSN8nf
   rRSNbTQK8FRMzbpp1CuKXAzsrZXyZwLqasjy3xJzuzIpz1McABL6GeRZZ
   xwq+1FYtGaTp2nyTlZ1kn+3/DFx7ZZxotGpi8PLxrvlYTTY+oaXVW78tJ
   X/0bv18ujT8zc5WmkQXN9RSMr8LULw+I+QjPdDsUSg8WWTg8/khP/m2ne
   poQE7wJwoAXF7GYjy00aMARoMS+kwjeziD21TlssltIkYlMYgyiklqeoC
   g==;
X-CSE-ConnectionGUID: beSd7Ws7Qs+7FZByHJvkwg==
X-CSE-MsgGUID: YPMvIDMkR7qMd5Ukj1jjNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25242655"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25242655"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 21:48:36 -0700
X-CSE-ConnectionGUID: Ebxm/OMvSaqrAJXJQmerRw==
X-CSE-MsgGUID: EdL5OZNfTsyrxKaQlcRHDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="67864643"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Sep 2024 21:48:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soyES-00061i-0x;
	Fri, 13 Sep 2024 04:48:32 +0000
Date: Fri, 13 Sep 2024 12:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mina Almasry <almasrymina@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Kaiyuan Zhang <kaiyuanz@google.com>,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: [wpan-next:staging 20/43] undefined reference to
 `__tracepoint_page_pool_state_hold'
Message-ID: <202409131239.ysHQh4Tv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-next.git staging
head:   3cfb5aa10cb78571e214e48a3a6e42c11d5288a1
commit: 0f921404689398943257793f7240db239a23b609 [20/43] memory-provider: dmabuf devmem memory provider
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240913/202409131239.ysHQh4Tv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131239.ysHQh4Tv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131239.ysHQh4Tv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `mp_dmabuf_devmem_alloc_netmems':
>> (.text+0xc37286): undefined reference to `__tracepoint_page_pool_state_hold'
>> ld: (.text+0xc3729a): undefined reference to `__SCT__tp_func_page_pool_state_hold'
>> ld: vmlinux.o:(__jump_table+0x10c48): undefined reference to `__tracepoint_page_pool_state_hold'
>> ld: vmlinux.o:(.static_call_sites+0xb824): undefined reference to `__SCK__tp_func_page_pool_state_hold'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

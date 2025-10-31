Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E022B9B7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 18:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761937003; cv=none; b=NM+NguVz4GKo8vK7ul3sXVe/wv2T/9kBbJNjeD7olkTTt3RAlazjPX/ukJm2ZmizqIopV1Sb4BlgtFp7sPfV6Rjm/4RdMQfCIFBkISwHgGEGPPTWD2o0Y1V1JPqlHej3uUz3lM0HKdkJz5pKw0ZfTJJzDTZ64Do+kB6344dGU9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761937003; c=relaxed/simple;
	bh=dLn+F3GEuG4pwB5h1n3IV7Q1LxoTiaUNSSpWJfbGN4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kwKtmA5fEbF/xd59xU3R7xQzkDnkYDTyi8DJ87XTFwA8RoNqKYoRcf+2pdBxaj8BOrOFB0DL+T6YgyUiunZ966/5uNLzoTmAWmbAtN/V9Q5jxfPDW1XcAQ0JcyFNhKr4TcuL5GwIToziQnDPTBb181mtW/BiZ1FigeoF3MUWVAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLwqlXWb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLwqlXWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761937002; x=1793473002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dLn+F3GEuG4pwB5h1n3IV7Q1LxoTiaUNSSpWJfbGN4c=;
  b=QLwqlXWbdBvCj7PYeJkFmpDewK4WfujCK6UFoeRaybTHx3TjfueBVRiT
   npJHCuwrZLxSsvFqcvF6qalM3/knRRCRsecDXMKfzr8kxaPuTN/a/W+LP
   ZsrQw89Mgm7eKcrWA5IpLN5n/2lDQrSxiUAFyhTS83qwlo9amdQYosRlC
   Dh4zPOoCADx3MVanUz7e1L1rDQijJ5GU3uUXq+k4jz5cQdKQq9KlaQgDo
   F1JmlU5+BRd/6JZ5ZYpngE6NmVsKWXoOg+nPXrwxP7zJJs0fxQ1rhAwdB
   d+0pp794Ovvotkw2NJryVgNzsuFN3di92ACd8RqRW4rL6pUb8KboNRpSj
   Q==;
X-CSE-ConnectionGUID: Fh01b2ffQJWPe/3nbSd8UA==
X-CSE-MsgGUID: TAEjJzX5Q66xpcPnv/hkRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63801362"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="63801362"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 11:56:41 -0700
X-CSE-ConnectionGUID: RULJLFFORo2HrIV2OihMnw==
X-CSE-MsgGUID: wAl0vB6CRgiDZ9i5c5OWmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="223546245"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 Oct 2025 11:56:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEuIg-000NZx-1D;
	Fri, 31 Oct 2025 18:56:38 +0000
Date: Sat, 1 Nov 2025 02:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 10/17] virtio_msg_loopback.c:(.text+0x75c):
 multiple definition of `virtio_msg_ffa_heap_create';
 drivers/virtio/virtio_msg.o:virtio_msg.c:(.text+0xf18): first defined here
Message-ID: <202511010206.LmLaywhF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   94d3d88b1da7e37623fae3c98ecdfebb1fa540d7
commit: 7155ab4d05c12fed195478a0905d0808b3452db5 [10/17] virtio-msg: ffa: Add DMA Heap
config: nios2-randconfig-002-20251101 (https://download.01.org/0day-ci/archive/20251101/202511010206.LmLaywhF-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010206.LmLaywhF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010206.LmLaywhF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/virtio/virtio_msg.c:28:
>> drivers/virtio/virtio_msg_internal.h:98:6: warning: no previous prototype for 'virtio_msg_ffa_heap_create' [-Wmissing-prototypes]
    void virtio_msg_ffa_heap_create(struct device *dev) {}
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 52
   drivers/virtio/virtio_msg_user.o: in function `virtio_msg_ffa_heap_create':
   virtio_msg_user.c:(.text+0x26c): multiple definition of `virtio_msg_ffa_heap_create'; nios2-linux-ld: DWARF error: could not find abbrev number 34
   drivers/virtio/virtio_msg.o:virtio_msg.c:(.text+0xf18): first defined here
   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 1583017
   drivers/virtio/virtio_msg_loopback.o: in function `virtio_msg_ffa_heap_create':
>> virtio_msg_loopback.c:(.text+0x75c): multiple definition of `virtio_msg_ffa_heap_create'; drivers/virtio/virtio_msg.o:virtio_msg.c:(.text+0xf18): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5297920C001
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 23:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730245599; cv=none; b=XBpAM9Ia++X9wKLMie2wR+OM7PeDaCxsWOnBU2q8fVagoPwHPRIiTr35Cfss0rWaESyqymXkPU7RbjYM5s1xodueQcgZTYt7eDlLFfQm2eb4rjfNMxZYAIcfmF573AKEaGhRGyAJFVJNoCQmBfE1PY4U+/pbUuEZzjwOsrzgjdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730245599; c=relaxed/simple;
	bh=LZlTEkx5zMjCYIgHCcflwArwgEntKztjPe+dqBwoBtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I8kcFuJtXK8BDvxcxWkuGfKXxsNHIynflZCVpIzQaN0uDIwej//s/J7HaaJQIdWcxm5bGYsPkNGOpkyVWyux3GBu9Hdzvt1SEFIODvW/peq2gKACxMXLZwsF+EkCjnpCtinZCFZPy0JBEo/Hi9Wit4uRTPVhlTSpcTZWwc+pRcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qfn+PTpX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qfn+PTpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730245597; x=1761781597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LZlTEkx5zMjCYIgHCcflwArwgEntKztjPe+dqBwoBtY=;
  b=Qfn+PTpXEcUonlvcuhcJIFknR73mApkciXa9X4QsxJEQNJ1RFc6Ceiyw
   dDpM70ji908kzvOeNlbEOlaXSnp9H/x0XPJzgubmRZUN5UNPcKumAwpOB
   wvnu+uwkrGVnO46ZxzVXYEhhNPqDiSxu6AoqQDIfJJDXisGYmHz5yT7th
   mPlGDqReDhhWZGwf0z2bPpm63DbmFuASaR+coZrNCxKNto5ufh0VaWBx9
   M5Qddw4YMolHn7knY/wTM92LDJNTVDWgkCK8wpVJw2QxNQ7FWe5pnQEuH
   dO6btldcLQRBGrkcuqJbdGJ/wvGCqHS4vDYmL0RpROw49y/XDn5ghqkBB
   w==;
X-CSE-ConnectionGUID: F/MIWphNRHOFfjHwSMIBlw==
X-CSE-MsgGUID: O7r+ax8/RyWleO/yPz1zHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30023651"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="30023651"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 16:46:36 -0700
X-CSE-ConnectionGUID: sXN1BOpjTfKp1G0jqdIJ2w==
X-CSE-MsgGUID: dchhTvwuQi+vPCwJk+maFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="105448345"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Oct 2024 16:46:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5vuz-000eHA-2F;
	Tue, 29 Oct 2024 23:46:33 +0000
Date: Wed, 30 Oct 2024 07:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg 5/10] drivers/virtio/virtio_msg_ffa.c:63:2:
 warning: 'memcpy' will always overflow; destination buffer has size 20, but
 size argument is 40
Message-ID: <202410300705.sZIh3GJ4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg
head:   4cdd999c9cdc0ddc577311c6fd904523176a1832
commit: a78a83e56caebd26ff17419594602354408db171 [5/10] virtio: FFA: Updates
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241030/202410300705.sZIh3GJ4-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300705.sZIh3GJ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300705.sZIh3GJ4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/virtio/virtio_msg_ffa.c:20:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/virtio/virtio_msg_ffa.c:20:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/virtio/virtio_msg_ffa.c:20:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/virtio/virtio_msg_ffa.c:20:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/virtio/virtio_msg_ffa.c:63:2: warning: 'memcpy' will always overflow; destination buffer has size 20, but size argument is 40 [-Wfortify-source]
      63 |         memcpy(&ffa_data, request, VIRTIO_MSG_MAX_SIZE);
         |         ^
   drivers/virtio/virtio_msg_ffa.c:86:12: warning: unused function 'vmsg_ffa_bus_error' [-Wunused-function]
      86 | static int vmsg_ffa_bus_error(struct virtio_msg_ffa_device *vmfdev)
         |            ^~~~~~~~~~~~~~~~~~
   9 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/memcpy +63 drivers/virtio/virtio_msg_ffa.c

    56	
    57	static int vmsg_ffa_send(struct ffa_device *ffa_dev, void *request,
    58				 void *response)
    59	{
    60		struct ffa_send_direct_data ffa_data;
    61		int ret;
    62	
  > 63		memcpy(&ffa_data, request, VIRTIO_MSG_MAX_SIZE);
    64	
    65		ret = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &ffa_data);
    66		if (ret) {
    67			pr_err("Unable to send direct FFA message: %d\n", ret);
    68			return ret;
    69		}
    70	
    71		if (response)
    72			memcpy(response, &ffa_data, VIRTIO_MSG_MAX_SIZE);
    73	
    74		return 0;
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

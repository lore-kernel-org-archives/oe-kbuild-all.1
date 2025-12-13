Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD1C1D5178
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765630243; cv=none; b=Wg7v/BSWNZzBMNFYQEl32eFQ9puBijr1bS5V3D1jGAxXqp17qU2qPtF6yhWEr0tkw6pe4m/bcuILem+ZgZxJk0cAcv0UMvqF3WcF4I3z4gOLwJPqiJ62keoKSxWeO3NSmxnDWXdtE5jhrbExrS/0wwuiEVUOw6PvBViN3i9w1hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765630243; c=relaxed/simple;
	bh=jvVMGzE4fpejXoNCBM+oX9UxGW6s/VpwwLEhgprcRyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ViZJEJzBG0PxgBi9FCmHwqtpIvfEWDQMs6hbOjfZwqj2gxjUFbtdU4dxYzoijJXHesGc/XTJCUHNzNPWI+Nbrt6ya+OK3jd+Yoq/2T3jEUowN6iedmLnTOKTU0ZkoBvyIA476cHXp3SP2LtcIeDoT5On9GZu2hPwp4YcS28x83A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YX2drbJb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YX2drbJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765630242; x=1797166242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jvVMGzE4fpejXoNCBM+oX9UxGW6s/VpwwLEhgprcRyQ=;
  b=YX2drbJbkPRF8pV+nXNBS6tcj198Onv5vQXK4JXUldr+A7oGjGvpyWGg
   c2sLv0HhRq730TNHyRCgXzIdWYMu7WwVhDsNTgvhlyaV5YT/3RODpsx2E
   ZCJ9jtHca3p4RU0UUEYcBqo8pnQd0krjm5OIHiJ2wp+/FP6Uy1CtgRL+e
   O9BS4rbwxLnC2pHPJmOuz3lBztMdg8cQDT5/YzBMnKmpOZ6+g0FKcpeoT
   uDUTMTuGhiEOgGi2y3BdqBbGAtTlLQSPYfhRCD/PO0FRCkeoJm946H78H
   qbfMz3l93pi4IYOE5staV93TCyHLhHlmZA1wDIh4iAhKqefYaILY4+Z1g
   Q==;
X-CSE-ConnectionGUID: aKCFLH0PRcal91gOZbl5TA==
X-CSE-MsgGUID: dbfbhDt/TSWJVd0SlRGwYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78981990"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78981990"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 04:50:41 -0800
X-CSE-ConnectionGUID: szKPTIJ7SbOQeoXLYjATTg==
X-CSE-MsgGUID: jHtI/85NSv+6vlPTVldlVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197579797"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 04:50:40 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUP54-000000007e5-2Iyj;
	Sat, 13 Dec 2025 12:50:38 +0000
Date: Sat, 13 Dec 2025 20:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 11/18]
 net/vmw_vsock/virtio_transport_common.c:560:41: sparse: sparse: incorrect
 type in argument 1 (different base types)
Message-ID: <202512132029.vcvwOogX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   e70cc743402c47048f65c4f9d065c129d5293fd5
commit: 407a5624a9b1cc526f870f725057ac1748cef2da [11/18] vsock: Add shared-memory support for virtio and loopback
config: riscv-randconfig-r134-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132029.vcvwOogX-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132029.vcvwOogX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132029.vcvwOogX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/vmw_vsock/virtio_transport_common.c:560:41: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long [usertype] size @@     got restricted __le32 [usertype] len @@
   net/vmw_vsock/virtio_transport_common.c:560:41: sparse:     expected unsigned long [usertype] size
   net/vmw_vsock/virtio_transport_common.c:560:41: sparse:     got restricted __le32 [usertype] len
>> net/vmw_vsock/virtio_transport_common.c:560:41: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long [usertype] size @@     got restricted __le32 [usertype] len @@
   net/vmw_vsock/virtio_transport_common.c:560:41: sparse:     expected unsigned long [usertype] size
   net/vmw_vsock/virtio_transport_common.c:560:41: sparse:     got restricted __le32 [usertype] len
>> net/vmw_vsock/virtio_transport_common.c:560:41: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long [usertype] size @@     got restricted __le32 [usertype] len @@
   net/vmw_vsock/virtio_transport_common.c:560:41: sparse:     expected unsigned long [usertype] size
   net/vmw_vsock/virtio_transport_common.c:560:41: sparse:     got restricted __le32 [usertype] len
>> net/vmw_vsock/virtio_transport_common.c:567:46: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected int len @@     got restricted __le32 [usertype] len @@
   net/vmw_vsock/virtio_transport_common.c:567:46: sparse:     expected int len
   net/vmw_vsock/virtio_transport_common.c:567:46: sparse:     got restricted __le32 [usertype] len

vim +560 net/vmw_vsock/virtio_transport_common.c

   555	
   556	static int virtio_transport_receive_shmem(struct vsock_sock *vsk,
   557						  struct sk_buff *skb)
   558	{
   559		struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
 > 560		struct vsock_shmem_desc *desc = kmalloc(hdr->len, GFP_KERNEL);
   561		int err;
   562	
   563		if (!desc)
   564			return -ENOMEM;
   565	
   566		/* copy payload after the virtio_vsock_hdr */
 > 567		err = skb_copy_bits(skb, 0, desc, hdr->len);
   568		if (err) {
   569			pr_err("vsock: failed to copy shmem desc\n");
   570			goto out;
   571		}
   572	
   573		/* parse payload into vsock_shmem_desc and hand up */
   574		if (le32_to_cpu(hdr->len) != desc->len) {
   575			err = -EINVAL;
   576			goto out;
   577		}
   578	
   579		/* Pass the descriptor to AF_VSOCK */
   580		vsock_shmem_received(vsk, desc);
   581		return 0;
   582	
   583	out:
   584		kfree(desc);
   585		return err;
   586	}
   587	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

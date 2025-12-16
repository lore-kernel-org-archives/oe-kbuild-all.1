Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C0D3644A3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 15:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765899552; cv=none; b=ff9BzIaM8DVcU+ABLUlp2/Vehzzd9DGqHUvcI4+j/U96pVdFGHxouV8yAg0VsCa7awNGZtD8aqE7qUizL9AIR/imAqpX1YdyfOS2KHWHvM93USChoHsJFaB1pacXrIq3qvT8ZzNA/2g6MECuP9FC/VTj3w90uNcmd7+fJ2iS0X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765899552; c=relaxed/simple;
	bh=Ik1njkR+ahs0Chm4ocLjqUHotqcCzsPBksKVGRQjCcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YaO8bxw6m1JIGd7VgePeofsgnkOlbIeS3NYfxlJm2chcyP7977CH8cDVZyYJ/kH5dN/OR8UUVWWJGoz2+1dPt6i51kBaCDuC67cSBdMuVeO+QJGde9u0JeDNQ1MwE1sEUVP27ddi2+sH173fuIj5carNBrJ1CH8QKIJqs8oRNPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jm54MRjb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jm54MRjb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765899551; x=1797435551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ik1njkR+ahs0Chm4ocLjqUHotqcCzsPBksKVGRQjCcU=;
  b=Jm54MRjbni0MjOG1tw2x8uMJV3k2QoEt/TzQ3Q2MSdQNdyBSnxTNhYEz
   Ws9wDa7/o0/o2/bF4bMErOkHy2pyjh6EtWj7hkIYha7iP0mlz2HrqSrJw
   HurmezaNow76mgywDsRAxWMDQaIMZWQP12HQBcsSOqt62Ubvr+lwzWhqs
   ocltyl2xP83CB4HLaSkKQB8qX+3glLZgoAdL3Y/KypqGwCdhuo6U4tuut
   RfUZ7tTTxG3ZXIzJz6Kfo/BCBCx8Yrb8cM0nzxZLTFjslKuNfY2u4YvfP
   Az9i93QzPkVbo+S4DkALrz3BEMzETUTGCzsm52YR8UfNGR+Y6QvtWzdEq
   A==;
X-CSE-ConnectionGUID: W3ZrP8kTSGO6HKyv0FtgMg==
X-CSE-MsgGUID: jTDNhZtoRNe9h4ToQtmjLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67702362"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67702362"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 07:39:10 -0800
X-CSE-ConnectionGUID: w+Q40GIrTumQlE60qeiazg==
X-CSE-MsgGUID: cdbIQ1shS7SzK6JyFpEp6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="228727401"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Dec 2025 07:39:09 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVX8l-000000003Rg-033Q;
	Tue, 16 Dec 2025 15:39:07 +0000
Date: Tue, 16 Dec 2025 23:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 11/17] net/vmw_vsock/af_vsock.c:2168:3:
 error: cannot jump from this goto statement to its label
Message-ID: <202512162356.u71swpos-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   65cdd8c8f400a4b344102c227a81027cad2d7684
commit: 5f340ea7b7d9e8069bbfd712560fa9ccbd997690 [11/17] vsock: Add shared-memory support for virtio and loopback
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251216/202512162356.u71swpos-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162356.u71swpos-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162356.u71swpos-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/vmw_vsock/af_vsock.c:2168:3: error: cannot jump from this goto statement to its label
    2168 |                 goto free_dbuf;
         |                 ^
   net/vmw_vsock/af_vsock.c:2172:27: note: jump bypasses initialization of variable with __attribute__((cleanup))
    2172 |         struct vsock_shmem_desc *desc __free(kfree) =
         |                                  ^
   net/vmw_vsock/af_vsock.c:2163:3: error: cannot jump from this goto statement to its label
    2163 |                 goto free_dbuf;
         |                 ^
   net/vmw_vsock/af_vsock.c:2172:27: note: jump bypasses initialization of variable with __attribute__((cleanup))
    2172 |         struct vsock_shmem_desc *desc __free(kfree) =
         |                                  ^
   2 errors generated.


vim +2168 net/vmw_vsock/af_vsock.c

  2149	
  2150	static int vsock_sendmsg_shmem_dmabuf(struct vsock_sock *vsk,
  2151					      struct vsock_shmem_user_desc *udesc)
  2152	{
  2153		struct dma_buf *dbuf = dma_buf_get(udesc->fd);
  2154		int err;
  2155	
  2156		/* The fd must belong to a dma-buf */
  2157		if (IS_ERR(dbuf))
  2158			return PTR_ERR(dbuf);
  2159	
  2160		if (udesc->subop != VSOCK_SHMEM_SUBOP_OFFER &&
  2161		    udesc->subop != VSOCK_SHMEM_SUBOP_RECLAIM) {
  2162			err = -EINVAL;
  2163			goto free_dbuf;
  2164		}
  2165	
  2166		if (!dbuf->ops->shmem_data) {
  2167			err = -EOPNOTSUPP;
> 2168			goto free_dbuf;
  2169		}
  2170	
  2171		/* Allocate a big enough descriptor */
  2172		struct vsock_shmem_desc *desc __free(kfree) =
  2173			kmalloc(sizeof(*desc) + VSOCK_SHMEM_PAYLOAD_SIZE_MAX,
  2174				GFP_KERNEL);
  2175	
  2176		if (!desc) {
  2177			err = -ENOMEM;
  2178			goto free_dbuf;
  2179		}
  2180	
  2181		desc->subop = udesc->subop;
  2182	
  2183		/* Get shmem metadata in `desc` from dmabuf */
  2184		err = dbuf->ops->shmem_data(dbuf, desc);
  2185		if (err)
  2186			goto free_dbuf;
  2187	
  2188		/* send SHMEM control pkt (out-of-band) */
  2189		err = vsk->transport->send_shmem(vsk, desc);
  2190		if (err < 0)
  2191			goto free_dbuf;
  2192	
  2193		err = 0;
  2194	
  2195	free_dbuf:
  2196		dma_buf_put(dbuf);
  2197		return err;
  2198	}
  2199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F9128DB49
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 19:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763840602; cv=none; b=klSomzvE+xQdL9S0TeL9lpRWQ93QmvbNWkjD2qsofHp2T8c4MBuQ8yj2fszxuX5eizn22McQG12ovUfcJUEmz97x/kQ99OHO3tH1pGRG+qZMfMm9GU2MeoX7zB7bYxLMkDY3pbxo9tSz8aU9elUmDXn5xsM+gKDJ0pBT58AdAiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763840602; c=relaxed/simple;
	bh=tTtVvyKSz5JlcSrUbJsvhyguJ8y4uVarqw6a46W0uQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mLsAVgsw8yuFVfnmSFZZgSd9zyoU3pNDyl7sNajqqE3q4pn+QFSZfHQb7CVyPtOwDBXOlTWWqwZSg1glJur/jxOn4Wsf6ns9qbhfjQW4JmDdtN7awg/s9NwRTaBtfTOmIk85FtvQIo65yg1frLzTZsnlZOoLatWyeZRLScXkMsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hA9wejZ9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hA9wejZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763840600; x=1795376600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tTtVvyKSz5JlcSrUbJsvhyguJ8y4uVarqw6a46W0uQ8=;
  b=hA9wejZ9Fukq099EpYWEKCSCkcLmzaKS7SOzjggK1h6tHciY//QUZy4b
   C8bPcVcAITUJvtWlsvZCEdS9qQU22xftJvR/8QVGEkrybTI5xUgucT81j
   xglxtwAZDp6uay420MoLpY9/DnYvH9mgnm8aqyenDaqNzCZmU5cNUiOpt
   ThXnNzL4/WHpFlOyOSzVyHQsUJ49kMATn6Xkl85GUgAAKol5JvdCdYOUC
   fPbhbbzRuhUp1gqDkgtmnOL6NhFkatac/rHLe1Dj7JSxJ62ooa0iug5fB
   ltZjd67N/xdORvRJQOwny988VElkSAQi2puU3IuirzwHprlZIHSr/4eRm
   Q==;
X-CSE-ConnectionGUID: YaIUKUC1QgqvfJz5SjoKEg==
X-CSE-MsgGUID: rhLaETPOSoud9H3FE2gQWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="83522550"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="83522550"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 11:43:20 -0800
X-CSE-ConnectionGUID: kyBy5Yv5S6aB59ZJzvPfiA==
X-CSE-MsgGUID: vxlgBhcNSNaN4rt6AIeVtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="215328068"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2025 11:43:19 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMtVs-0007nH-2V;
	Sat, 22 Nov 2025 19:43:16 +0000
Date: Sun, 23 Nov 2025 03:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 10/16] net/vmw_vsock/af_vsock.c:2156:3-8:
 WARNING: NULL check before some freeing functions is not needed.
Message-ID: <202511230327.tTEh3myF-lkp@intel.com>
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
config: riscv-randconfig-r052-20251123 (https://download.01.org/0day-ci/archive/20251123/202511230327.tTEh3myF-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230327.tTEh3myF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/vmw_vsock/af_vsock.c:2156:3-8: WARNING: NULL check before some freeing functions is not needed.

vim +2156 net/vmw_vsock/af_vsock.c

  2117	
  2118	static int vsock_sendmsg_shmem_dmabuf(struct vsock_sock *vsk,
  2119					      struct vsock_shmem_desc *desc)
  2120	{
  2121		struct dma_buf *dbuf = dma_buf_get(desc->fd);
  2122		struct vsock_shmem_desc *entry, *old;
  2123		int err;
  2124	
  2125		/* The fd must belong to a dma-buf */
  2126		if (IS_ERR(dbuf))
  2127			return PTR_ERR(dbuf);
  2128	
  2129		if (!dbuf->ops->shmem || !dbuf->ops->unshmem) {
  2130			err = -EOPNOTSUPP;
  2131			goto out;
  2132		}
  2133	
  2134		if (desc->subop == VSOCK_SHMEM_SUBOP_OFFER) {
  2135			/* Share memory and get metadata in `desc` from dmabuf */
  2136			err = dbuf->ops->shmem(dbuf, desc);
  2137			if (err)
  2138				goto out;
  2139	
  2140			entry = kmemdup(desc, sizeof(*desc), GFP_KERNEL);
  2141			if (!entry) {
  2142				err = -ENOMEM;
  2143				goto out;
  2144			}
  2145	
  2146			/* Save a copy of descriptor by FD */
  2147			old = xa_store(&vsock_shmem_xa, desc->fd, entry, GFP_KERNEL);
  2148			if (xa_is_err(old)) {
  2149				kfree(entry);
  2150				err = xa_err(old);
  2151				goto out;
  2152			}
  2153	
  2154			/* Token used previously ? */
  2155			if (old)
> 2156				kfree(old);
  2157		} else if (desc->subop == VSOCK_SHMEM_SUBOP_REVOKE) {
  2158			entry = xa_erase(&vsock_shmem_xa, desc->fd);
  2159			if (!entry) {
  2160				err = -EINVAL;
  2161				goto out;
  2162			}
  2163	
  2164			/* Copy the metadata */
  2165			memcpy(&desc->reserved, &entry->reserved,
  2166			       sizeof(desc->reserved));
  2167			kfree(entry);
  2168		} else {
  2169			err = -EINVAL;
  2170			goto out;
  2171		}
  2172	
  2173		/* Don't leak kernel's FD */
  2174		desc->fd = -1;
  2175	
  2176		/* send SHMEM control pkt (out-of-band) */
  2177		err = vsk->transport->send_shmem(vsk, desc);
  2178		if (err < 0)
  2179			goto out;
  2180		err = 0;
  2181	
  2182		if (desc->subop == VSOCK_SHMEM_SUBOP_REVOKE)
  2183			dbuf->ops->unshmem(dbuf);
  2184	
  2185	out:
  2186		dma_buf_put(dbuf);
  2187		return err;
  2188	}
  2189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

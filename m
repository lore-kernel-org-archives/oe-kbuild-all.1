Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAB3352923
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 06:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769667213; cv=none; b=WxYUj16jebXibf1RLizTQoqywhNrrlOR2k0+Z7gxHO/05OUSljMoeUclW4jzcJplWvgzKc1gc17QDW/3YDOzklYoHhLFAPfXROYvHaWBljxIPUz3fHQ4tMqgpfGuqZt16JIZZ9XgHpKJNQ715MFSlh4axUDA6UcEme0iIQT9s1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769667213; c=relaxed/simple;
	bh=LJuz1vPPNNozGVlFY+YXvEcmeKRHoE/h0SB40wfH75s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NJqXoeX9lioJrW9YisoKLmW8u/wGXWfqCsVCMV2pI7N0vUbGLeF0+eFlo1GwAEUdTbiZZeHyuZZOutRyEH/EdWo9vYRPlGFe7mV86oGEVQ7aPwYe1/qqN/6Fe0TAfvYIOfyOcEP/TSv6adDFiP/HTw83i2LVP+e3Um4Ob7MaFpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ADXQJ8qM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADXQJ8qM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769667212; x=1801203212;
  h=date:from:to:cc:subject:message-id;
  bh=LJuz1vPPNNozGVlFY+YXvEcmeKRHoE/h0SB40wfH75s=;
  b=ADXQJ8qMSQM+t0qYAIsxP7lJSfWQ2S/YXUobzjAASxX7krdsDPQDsqvr
   lvQNHDGqKfmexF4hcv2BHtdNFtPmwj75ZX07DcyhOdKWApJYiOh73QYwt
   FoanlkDtdI6vJ4UiacJeo6giDOsOVsfGH8CDjfMbdvl+uYDl3GaDHQS61
   BvGoadsA5X8dUN269gLIERvp9c8wTOJ8XFRRFMpxllzaDOS3UXEtE6/o9
   xdpsSZzfSEugdRjTHtIdhmCJ51BQn9owpHgvKGN71GhPgNCZTPZRxeRnI
   9f1Dhq/t6u0fewSjXXFryrvNWA0H8rIqwbk/dMLvY7MZdX7IYtFVIp6I1
   g==;
X-CSE-ConnectionGUID: UAQ1okChQVCox3BPFiIX5Q==
X-CSE-MsgGUID: NxIKr9cJRPC+U/2M/ixDnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="93556247"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="93556247"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 22:13:31 -0800
X-CSE-ConnectionGUID: EhwV6dH+Q4ye05dtUGTpOA==
X-CSE-MsgGUID: TbAdcbC3TdCPJhj5mAR3ig==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jan 2026 22:13:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlLHT-00000000b9o-2Jzm;
	Thu, 29 Jan 2026 06:13:27 +0000
Date: Thu, 29 Jan 2026 14:13:14 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 11/17]
 net/vmw_vsock/af_vsock.c:2229:2-7: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202601291448.40RXZEjy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   76427c94d00817c6ba0956ffa50ece35759aa37c
commit: 08cfd9134af6f556554cdedba40f97c5952d7561 [11/17] vsock: Add shared-memory support for virtio and loopback
config: alpha-randconfig-r052-20260129 (https://download.01.org/0day-ci/archive/20260129/202601291448.40RXZEjy-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291448.40RXZEjy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/vmw_vsock/af_vsock.c:2229:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +2229 net/vmw_vsock/af_vsock.c

  2160	
  2161	static int vsock_sendmsg_shmem_dmabuf_map(struct vsock_sock *vsk,
  2162						  struct vsock_shmem_user_desc *udesc)
  2163	{
  2164		struct vsock_shmem_desc_payload_dma_buf *payload;
  2165		struct vsock_shmem_desc_payload_dma_buf_sg *sgs;
  2166		struct vsock_shmem_dbuf *data, *old;
  2167		struct vsock_shmem_desc *desc;
  2168		struct vsock_dma_buf *vdbuf;
  2169		struct dma_buf *dmabuf;
  2170		struct scatterlist *sg;
  2171		struct sg_table *sgt;
  2172		int err, plen, i;
  2173	
  2174		if (!vsk->transport->map_dma_buf)
  2175			return -EOPNOTSUPP;
  2176	
  2177		/* The fd must belong to a dma-buf */
  2178		dmabuf = dma_buf_get(udesc->fd);
  2179		if (IS_ERR(dmabuf))
  2180			return PTR_ERR(dmabuf);
  2181	
  2182		vdbuf = vsk->transport->map_dma_buf(dmabuf);
  2183		if (IS_ERR(vdbuf)) {
  2184			err = PTR_ERR(vdbuf);
  2185			goto free_dmabuf;
  2186		}
  2187	
  2188		sgt = vdbuf->sg_table;
  2189	
  2190		if (!sgt->nents) {
  2191			err = -EINVAL;
  2192			goto unmap_dma_buf;
  2193		}
  2194	
  2195		plen = sizeof(*payload) + sizeof(*sgs) * sgt->nents;
  2196	
  2197		data = kzalloc(sizeof(*data) + plen, GFP_KERNEL);
  2198		if (!data) {
  2199			err = -ENOMEM;
  2200			goto unmap_dma_buf;
  2201		}
  2202	
  2203		data->vdbuf = vdbuf;
  2204		desc = &data->desc;
  2205		desc->subop = udesc->subop;
  2206		desc->type = udesc->type;
  2207		desc->len = sizeof(*desc) + plen;
  2208		payload = (struct vsock_shmem_desc_payload_dma_buf *)desc->payload;
  2209		payload->nents = sgt->nents;
  2210		sgs = payload->sgs;
  2211	
  2212		for_each_sg(sgt->sgl, sg, sgt->nents, i) {
  2213			sgs[i].addr = sg_dma_address(sg);
  2214			sgs[i].len = sg_dma_len(sg);
  2215		}
  2216	
  2217		err = vsk->transport->send_shmem(vsk, desc);
  2218		if (err < 0)
  2219			goto free_data;
  2220	
  2221		old = xa_store(&vsock_shmem_xa, udesc->fd, data, GFP_KERNEL);
  2222		if (xa_is_err(old)) {
  2223			err = xa_err(old);
  2224			goto free_data;
  2225		}
  2226	
  2227		/* Token used previously ? */
  2228		if (old)
> 2229			kfree(old);
  2230	
  2231		return 0;
  2232	
  2233	free_data:
  2234		kfree(data);
  2235	unmap_dma_buf:
  2236		vsk->transport->unmap_dma_buf(vdbuf);
  2237	free_dmabuf:
  2238		dma_buf_put(dmabuf);
  2239		return err;
  2240	}
  2241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

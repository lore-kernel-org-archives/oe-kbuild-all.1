Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483B237F8AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 12:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768394386; cv=none; b=Y+nHg0S3z4qIpOXoQrq+JwpGAMYbp2+YOgaHhFJt3jCWblV/ZvuUHTgRiV0o+5dHLpNa+lwj5YN2bhfrhn8JryqdfCp1d7eZoxSGJxJzgP1y+kld/gngC01E5IKUwGDSeJvSbdt4zFLOcOLnGFWA4fgzenS6pOkN+a0wwoaoMyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768394386; c=relaxed/simple;
	bh=GzaFdH8PfTUWFQurhptvdmYWPqb7+AO0GQ5YMLvXSzA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UdI1lzzDYpq8SdxtcRwlVpADDsL0TnmMpwBuDRBJ9Vg17qtvMv6qqDkZ/GphrPNuxk7RDqEUtg0iyDtlI9iwt2vq6O3NvJjcLH/3i0+hPmmD8h48hj/zNuZVbgXvixZnkG7E2nA6QxJIdPsLGCHh7fNG9tpNhD8roa3ed/Q4zFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=luSQyEmf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="luSQyEmf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768394384; x=1799930384;
  h=date:from:to:cc:subject:message-id;
  bh=GzaFdH8PfTUWFQurhptvdmYWPqb7+AO0GQ5YMLvXSzA=;
  b=luSQyEmfWf0D3/FeVL/Xg5hRIr8INSVuNGH1KZq1m8Eq2O9MaQ2cj7vs
   003hQoil0CabfBmQqok2hZ/+wZe9LclkQUSNkAxsEBzMe9s7cZK7pGRlc
   xC/dKl6xUrcEcK8fMv2xSohOIWwPuTDbc7A71WQHJ4JXvf6rHCXyZ5jiK
   SFa9DkDxaslrGXZfgooDyT4MBO3Dyho3xi/sBD8vc/cyORaXwUU+V5JP9
   oC5pGBzQeHWFYh8tpK2VIPedsPA9OsENd+5jDcNHq0Fmn0h5T1CuRPtZn
   Pr7OL8Kwd08CtRECP3gCs58IDcT0lhOA3KI24S3ABEsrIPz6F2Nm0E4sG
   g==;
X-CSE-ConnectionGUID: DB6mjXQTS6WRJb0SSTzLUQ==
X-CSE-MsgGUID: 7mL0ooWoTVG8nkPLNcB7jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="57246466"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="57246466"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:39:43 -0800
X-CSE-ConnectionGUID: 8mjgV98pTECejSgnYMVqXA==
X-CSE-MsgGUID: KnYZPYAdQLGdkIctcHuvfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204294618"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jan 2026 04:39:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg09z-00000000GNc-3JdL;
	Wed, 14 Jan 2026 12:39:39 +0000
Date: Wed, 14 Jan 2026 20:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 23/23]
 drivers/virtio/virtio_ring.c:863:17: sparse: sparse: cast from restricted
 __virtio16
Message-ID: <202601142018.7J3VRYlq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   9f03fb7d9fa1cb50683fa639e6ccbdc94628f8e6
commit: 7bb22c4701b3639ef7e7aa8434d807c60b6fe8f9 [23/23] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: sh-randconfig-r134-20260114 (https://download.01.org/0day-ci/archive/20260114/202601142018.7J3VRYlq-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601142018.7J3VRYlq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601142018.7J3VRYlq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_ring.c:863:17: sparse: sparse: cast from restricted __virtio16
>> drivers/virtio/virtio_ring.c:863:17: sparse: sparse: cast from restricted __virtio16
>> drivers/virtio/virtio_ring.c:863:17: sparse: sparse: cast from restricted __virtio16
>> drivers/virtio/virtio_ring.c:863:17: sparse: sparse: cast from restricted __virtio16
>> drivers/virtio/virtio_ring.c:863:17: sparse: sparse: cast to restricted __virtio16
   drivers/virtio/virtio_ring.c:952:9: sparse: sparse: cast from restricted __virtio16
   drivers/virtio/virtio_ring.c:952:9: sparse: sparse: cast from restricted __virtio16
   drivers/virtio/virtio_ring.c:952:9: sparse: sparse: cast from restricted __virtio16
   drivers/virtio/virtio_ring.c:952:9: sparse: sparse: cast from restricted __virtio16
   drivers/virtio/virtio_ring.c:952:9: sparse: sparse: cast to restricted __virtio16
>> drivers/virtio/virtio_ring.c:1785:17: sparse: sparse: cast from restricted __le16
>> drivers/virtio/virtio_ring.c:1785:17: sparse: sparse: cast from restricted __le16
>> drivers/virtio/virtio_ring.c:1785:17: sparse: sparse: cast from restricted __le16
>> drivers/virtio/virtio_ring.c:1785:17: sparse: sparse: cast from restricted __le16
>> drivers/virtio/virtio_ring.c:1785:17: sparse: sparse: cast to restricted __le16

vim +863 drivers/virtio/virtio_ring.c

0a8a69dd77ddbd Rusty Russell      2007-10-22  814  
138fd25148638a Tiwei Bie          2018-11-21  815  static void *virtqueue_get_buf_ctx_split(struct virtqueue *_vq,
138fd25148638a Tiwei Bie          2018-11-21  816  					 unsigned int *len,
5a08b04f637921 Michael S. Tsirkin 2017-02-07  817  					 void **ctx)
0a8a69dd77ddbd Rusty Russell      2007-10-22  818  {
0a8a69dd77ddbd Rusty Russell      2007-10-22  819  	struct vring_virtqueue *vq = to_vvq(_vq);
0a8a69dd77ddbd Rusty Russell      2007-10-22  820  	void *ret;
0a8a69dd77ddbd Rusty Russell      2007-10-22  821  	unsigned int i;
3b720b8c865098 Rusty Russell      2012-01-12  822  	u16 last_used;
0a8a69dd77ddbd Rusty Russell      2007-10-22  823  
0a8a69dd77ddbd Rusty Russell      2007-10-22  824  	START_USE(vq);
0a8a69dd77ddbd Rusty Russell      2007-10-22  825  
5ef827526fc018 Rusty Russell      2008-05-02  826  	if (unlikely(vq->broken)) {
5ef827526fc018 Rusty Russell      2008-05-02  827  		END_USE(vq);
5ef827526fc018 Rusty Russell      2008-05-02  828  		return NULL;
5ef827526fc018 Rusty Russell      2008-05-02  829  	}
5ef827526fc018 Rusty Russell      2008-05-02  830  
138fd25148638a Tiwei Bie          2018-11-21  831  	if (!more_used_split(vq)) {
0a8a69dd77ddbd Rusty Russell      2007-10-22  832  		pr_debug("No more buffers in queue\n");
0a8a69dd77ddbd Rusty Russell      2007-10-22  833  		END_USE(vq);
0a8a69dd77ddbd Rusty Russell      2007-10-22  834  		return NULL;
0a8a69dd77ddbd Rusty Russell      2007-10-22  835  	}
0a8a69dd77ddbd Rusty Russell      2007-10-22  836  
2d61ba95034f1a Michael S. Tsirkin 2009-10-25  837  	/* Only get used array entries after they have been exposed by host. */
a9a0fef7790748 Rusty Russell      2013-03-18  838  	virtio_rmb(vq->weak_barriers);
2d61ba95034f1a Michael S. Tsirkin 2009-10-25  839  
e593bf9751566e Tiwei Bie          2018-11-21  840  	last_used = (vq->last_used_idx & (vq->split.vring.num - 1));
e593bf9751566e Tiwei Bie          2018-11-21  841  	i = virtio32_to_cpu(_vq->vdev,
e593bf9751566e Tiwei Bie          2018-11-21  842  			vq->split.vring.used->ring[last_used].id);
e593bf9751566e Tiwei Bie          2018-11-21  843  	*len = virtio32_to_cpu(_vq->vdev,
e593bf9751566e Tiwei Bie          2018-11-21  844  			vq->split.vring.used->ring[last_used].len);
0a8a69dd77ddbd Rusty Russell      2007-10-22  845  
e593bf9751566e Tiwei Bie          2018-11-21  846  	if (unlikely(i >= vq->split.vring.num)) {
0a8a69dd77ddbd Rusty Russell      2007-10-22  847  		BAD_RING(vq, "id %u out of range\n", i);
0a8a69dd77ddbd Rusty Russell      2007-10-22  848  		return NULL;
0a8a69dd77ddbd Rusty Russell      2007-10-22  849  	}
cbeedb72b97ad8 Tiwei Bie          2018-11-21  850  	if (unlikely(!vq->split.desc_state[i].data)) {
0a8a69dd77ddbd Rusty Russell      2007-10-22  851  		BAD_RING(vq, "id %u is not a head!\n", i);
0a8a69dd77ddbd Rusty Russell      2007-10-22  852  		return NULL;
0a8a69dd77ddbd Rusty Russell      2007-10-22  853  	}
0a8a69dd77ddbd Rusty Russell      2007-10-22  854  
138fd25148638a Tiwei Bie          2018-11-21  855  	/* detach_buf_split clears data, so grab it now. */
cbeedb72b97ad8 Tiwei Bie          2018-11-21  856  	ret = vq->split.desc_state[i].data;
138fd25148638a Tiwei Bie          2018-11-21  857  	detach_buf_split(vq, i, ctx);
0a8a69dd77ddbd Rusty Russell      2007-10-22  858  	vq->last_used_idx++;
a5c262c5fd83ec Michael S. Tsirkin 2011-05-20  859  	/* If we expect an interrupt for the next entry, tell host
a5c262c5fd83ec Michael S. Tsirkin 2011-05-20  860  	 * by writing event index and flush out the write before
a5c262c5fd83ec Michael S. Tsirkin 2011-05-20  861  	 * the read in the next get_buf call. */
e593bf9751566e Tiwei Bie          2018-11-21  862  	if (!(vq->split.avail_flags_shadow & VRING_AVAIL_F_NO_INTERRUPT))
788e5b3a5da24c Michael S. Tsirkin 2015-12-17 @863  		virtio_store_mb(vq->weak_barriers,
e593bf9751566e Tiwei Bie          2018-11-21  864  				&vring_used_event(&vq->split.vring),
788e5b3a5da24c Michael S. Tsirkin 2015-12-17  865  				cpu_to_virtio16(_vq->vdev, vq->last_used_idx));
a5c262c5fd83ec Michael S. Tsirkin 2011-05-20  866  
4d6a105eb534b8 Tiwei Bie          2018-11-21  867  	LAST_ADD_TIME_INVALID(vq);
e93300b1afc7cd Rusty Russell      2012-01-12  868  
0a8a69dd77ddbd Rusty Russell      2007-10-22  869  	END_USE(vq);
0a8a69dd77ddbd Rusty Russell      2007-10-22  870  	return ret;
0a8a69dd77ddbd Rusty Russell      2007-10-22  871  }
138fd25148638a Tiwei Bie          2018-11-21  872  

:::::: The code at line 863 was first introduced by commit
:::::: 788e5b3a5da24cc8d93ce2f7c6508181cd7d7fb6 virtio_ring: use virt_store_mb

:::::: TO: Michael S. Tsirkin <mst@redhat.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

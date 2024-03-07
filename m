Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE32810A34
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 03:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709782849; cv=none; b=AUagBt3uzUNdv9iDzIxpvfVG/PTqZtld4Gi7Kgayu4k6PY0PiYtvOzrikRJXQLb/cyt2WMysD+o3+lIElSSPcAVvW7/WY6tAw3gjgnMEuvpScY05CMOyc6FmeS+BW35ak5BL9DKdVmi2jaLLVlacf2LbZW+UXNkqbz/zATyi3pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709782849; c=relaxed/simple;
	bh=NNpZb1JGi8BdQxmhtCLZfL9/ZIEGqrAIgwjk80B8054=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R9fTb6IHWSmapIJ9RCKQOrYFKBMm1AjgAdDFSm83HuKxnenTAjQ9a4u+UQ2bLtys8cMjS2n2bIRWE1VEd/Gf7FT11pFmLFSxPOIXyB8NOA0wrLn6QTH1pr6Z7/DhCnvSPZj+GOhDsB1tdB5rRIt5v/kyidmxbXqe8fX8LLb6P7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D077H6nt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D077H6nt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709782848; x=1741318848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NNpZb1JGi8BdQxmhtCLZfL9/ZIEGqrAIgwjk80B8054=;
  b=D077H6ntMp3gNSFqPSDWe4bmAvvUfSAm99G7ITyv07SiaKm7QaoNKzTw
   NgT9iJQU09VfYr1XZm7OEkd/sGarvQV3EbFYuW18xoVkmEm4erjieVfca
   ChjmDEk7KuxhQEOyPi0BEfskkby+EB+JHaYVFJt8OggdP8FRdTL55LP3D
   VeZ1ezZl2mtJJvgq0N/XSP0+uRcXFbKjuN05bovZvg77yUgGeTNedCyAb
   TqrBkp58S5aijZDwTSyB/VoOC6PFG2dR0H2DUKAGN1go7Fno4RYI1Tnjm
   64+iTFETnb3+nkSLZJb3XhvLVPKPL95HkT9rSM85THr7/LnqalNCMJ6YT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="21884959"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="21884959"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 19:40:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9893745"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2024 19:40:43 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri4ca-0004lV-0B;
	Thu, 07 Mar 2024 03:40:40 +0000
Date: Thu, 7 Mar 2024 11:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 24881/27434]
 drivers/virtio/virtio_balloon.c:161:5: sparse: sparse: symbol
 'virtballoon_free_page_report' was not declared. Should it be static?
Message-ID: <202403071134.503Mycfx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 5624b6f64dffb17eb72a2c6277e78ae5e55a5cfb [24881/27434] virtio-balloon: add support for providing free page reports to host
config: x86_64-randconfig-r113-20240305 (https://download.01.org/0day-ci/archive/20240307/202403071134.503Mycfx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403071134.503Mycfx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403071134.503Mycfx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_balloon.c:161:5: sparse: sparse: symbol 'virtballoon_free_page_report' was not declared. Should it be static?
   drivers/virtio/virtio_balloon.c:597:71: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __virtio32 [usertype] val @@     got unsigned int @@
   drivers/virtio/virtio_balloon.c:597:71: sparse:     expected restricted __virtio32 [usertype] val
   drivers/virtio/virtio_balloon.c:597:71: sparse:     got unsigned int
   drivers/virtio/virtio_balloon.c:596:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __virtio32 [usertype] cmd_id_active @@     got unsigned int @@
   drivers/virtio/virtio_balloon.c:596:27: sparse:     expected restricted __virtio32 [usertype] cmd_id_active
   drivers/virtio/virtio_balloon.c:596:27: sparse:     got unsigned int

vim +/virtballoon_free_page_report +161 drivers/virtio/virtio_balloon.c

   160	
 > 161	int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_info,
   162					   struct scatterlist *sg, unsigned int nents)
   163	{
   164		struct virtio_balloon *vb =
   165			container_of(pr_dev_info, struct virtio_balloon, pr_dev_info);
   166		struct virtqueue *vq = vb->reporting_vq;
   167		unsigned int unused, err;
   168	
   169		/* We should always be able to add these buffers to an empty queue. */
   170		err = virtqueue_add_inbuf(vq, sg, nents, vb, GFP_NOWAIT | __GFP_NOWARN);
   171	
   172		/*
   173		 * In the extremely unlikely case that something has occurred and we
   174		 * are able to trigger an error we will simply display a warning
   175		 * and exit without actually processing the pages.
   176		 */
   177		if (WARN_ON_ONCE(err))
   178			return err;
   179	
   180		virtqueue_kick(vq);
   181	
   182		/* When host has read buffer, this completes via balloon_ack */
   183		wait_event(vb->acked, virtqueue_get_buf(vq, &unused));
   184	
   185		return 0;
   186	}
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

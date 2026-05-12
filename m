Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98233314D37
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 08:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574786; cv=none; b=lh2idGfPiDUo68ciGPbu9yVWE0+EtY9snieDylU1SQJn9e2kp3GKl2z1ywhL0GwaW3pOa6HeTeBAtI7q/2BdZ077UsJ7oWzpM1DZsm2BPYqRPqDazR2SjufZkyA8gGtgP/tsLt5pmT+h2Q9oyfz/r8uEnCVef2hEpOTA6AjfONU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574786; c=relaxed/simple;
	bh=9IvBKOTVZQg8Vjtk21TyLwvwBYZaWvPiOhx3W0rcygo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fNJMfs1nrnz0F6NtbW8NtYuJFXr1F6CKhvv+xNmLqBckfWQd9wbigRvN4fW/8o5ka4JKtml3wPLj0O1FJSbgtQPF1yXF6Hq1yJAGzHkBpJxmKNLbl20laj+7VWFCxzf2FLs6+SgjeUK8iBMpxyE0xx+tfBJd7F36c3RDBy1oILo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1kAb+QK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1kAb+QK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778574784; x=1810110784;
  h=date:from:to:cc:subject:message-id;
  bh=9IvBKOTVZQg8Vjtk21TyLwvwBYZaWvPiOhx3W0rcygo=;
  b=d1kAb+QKhD+NgiThMW7TtYvZ1ElF9lXYBjME9Zusq87j/ewRyb7zk/XU
   exOtYVsWnc8S4oYJ9MJdJDQBJT99mySFWz9umGO6riFbVIPOGFGgnqTrY
   xC0Tze7Nwm6aw6/ZKuanl36XA3zaUCizQE4uu9iyRNXW6bhb+tu92rUA9
   FeIQ8Mc0HlmfsOi8/0sWq/yXNpsaPmnPJBjzcCbz+Z9LhDwgut/n87DDh
   yll8M16xwq4q4nEPs/Q1tpxfv+tJ6SG2Jxn+mYP5+JZ+3f8SgOGudGaCN
   MtoEhW90NaqptAWDXHlW7VS90h22he/7moe5++eXxbGM3JNdJbOmVF5gN
   g==;
X-CSE-ConnectionGUID: V4mIsH9NRxOOPYLQnimfQQ==
X-CSE-MsgGUID: SQ1KflwNQlqUpVXboD6mNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79337233"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79337233"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:33:04 -0700
X-CSE-ConnectionGUID: vG+ixOhyTECnZzBd5Jzq2A==
X-CSE-MsgGUID: WisLCIU1TmO6t8+tZ708Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="231310360"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 May 2026 01:33:02 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMiY0-000000001r6-1tLs;
	Tue, 12 May 2026 08:33:00 +0000
Date: Tue, 12 May 2026 16:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 39/178]
 drivers/gpu/drm/apple/afk.c:815:27: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202605121640.aB7IxA0Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Janne,

First bad commit (maybe != root cause):

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   4b1d0b029fb1b7f93e72be2d9553a358b8054d7c
commit: efc2ec7cad4b235a76d79a7cf3340b733d3c076a [39/178] drm: apple: afk: Use linear array of services
config: arm64-randconfig-r132-20260512 (https://download.01.org/0day-ci/archive/20260512/202605121640.aB7IxA0Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121640.aB7IxA0Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121640.aB7IxA0Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/apple/afk.c:815:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] inline_len @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/apple/afk.c:815:27: sparse:     expected restricted __le32 [usertype] inline_len
   drivers/gpu/drm/apple/afk.c:815:27: sparse:     got restricted __le16 [usertype]

vim +815 drivers/gpu/drm/apple/afk.c

3d5dce3b744d97e Sven Peter 2023-02-12  693  
3d5dce3b744d97e Sven Peter 2023-02-12  694  int afk_send_epic(struct apple_dcp_afkep *ep, u32 channel, u16 tag,
3d5dce3b744d97e Sven Peter 2023-02-12  695  		  enum epic_type etype, enum epic_category ecat, u8 stype,
3d5dce3b744d97e Sven Peter 2023-02-12  696  		  const void *payload, size_t payload_len)
3d5dce3b744d97e Sven Peter 2023-02-12  697  {
3d5dce3b744d97e Sven Peter 2023-02-12  698  	u32 rptr, wptr;
3d5dce3b744d97e Sven Peter 2023-02-12  699  	struct afk_qe *hdr, *hdr2;
3d5dce3b744d97e Sven Peter 2023-02-12  700  	struct epic_hdr *ehdr;
3d5dce3b744d97e Sven Peter 2023-02-12  701  	struct epic_sub_hdr *eshdr;
3d5dce3b744d97e Sven Peter 2023-02-12  702  	unsigned long flags;
3d5dce3b744d97e Sven Peter 2023-02-12  703  	size_t total_epic_size, total_size;
3d5dce3b744d97e Sven Peter 2023-02-12  704  	int ret;
3d5dce3b744d97e Sven Peter 2023-02-12  705  
3d5dce3b744d97e Sven Peter 2023-02-12  706  	spin_lock_irqsave(&ep->lock, flags);
3d5dce3b744d97e Sven Peter 2023-02-12  707  
3d5dce3b744d97e Sven Peter 2023-02-12  708  	dma_rmb();
3d5dce3b744d97e Sven Peter 2023-02-12  709  	rptr = le32_to_cpu(ep->txbfr.hdr->rptr);
3d5dce3b744d97e Sven Peter 2023-02-12  710  	wptr = le32_to_cpu(ep->txbfr.hdr->wptr);
3d5dce3b744d97e Sven Peter 2023-02-12  711  	trace_afk_send_rwptr_pre(ep, rptr, wptr);
3d5dce3b744d97e Sven Peter 2023-02-12  712  	total_epic_size = sizeof(*ehdr) + sizeof(*eshdr) + payload_len;
3d5dce3b744d97e Sven Peter 2023-02-12  713  	total_size = sizeof(*hdr) + total_epic_size;
3d5dce3b744d97e Sven Peter 2023-02-12  714  
3d5dce3b744d97e Sven Peter 2023-02-12  715  	hdr = hdr2 = NULL;
3d5dce3b744d97e Sven Peter 2023-02-12  716  
3d5dce3b744d97e Sven Peter 2023-02-12  717  	/*
3d5dce3b744d97e Sven Peter 2023-02-12  718  	 * We need to figure out how to place the entire headers and payload
3d5dce3b744d97e Sven Peter 2023-02-12  719  	 * into the ring buffer:
3d5dce3b744d97e Sven Peter 2023-02-12  720  	 * - If the write pointer is in front of the read pointer we just need
3d5dce3b744d97e Sven Peter 2023-02-12  721  	 *   enough space inbetween to store everything.
3d5dce3b744d97e Sven Peter 2023-02-12  722  	 * - If the read pointer has already wrapper around the end of the
3d5dce3b744d97e Sven Peter 2023-02-12  723  	 *   buffer we can
3d5dce3b744d97e Sven Peter 2023-02-12  724  	 *    a) either store the entire payload at the writer pointer if
3d5dce3b744d97e Sven Peter 2023-02-12  725  	 *       there's enough space until the end,
3d5dce3b744d97e Sven Peter 2023-02-12  726  	 *    b) or just store the queue entry at the write pointer to indicate
3d5dce3b744d97e Sven Peter 2023-02-12  727  	 *       that we need to wrap to the start and then store the headers
3d5dce3b744d97e Sven Peter 2023-02-12  728  	 *       and the payload at the beginning of the buffer. The queue
3d5dce3b744d97e Sven Peter 2023-02-12  729  	 *       header has to be store twice in this case.
3d5dce3b744d97e Sven Peter 2023-02-12  730  	 * In either case we have to ensure that there's always enough space
3d5dce3b744d97e Sven Peter 2023-02-12  731  	 * so that we don't accidentally overwrite other buffers.
3d5dce3b744d97e Sven Peter 2023-02-12  732  	 */
3d5dce3b744d97e Sven Peter 2023-02-12  733  	if (wptr < rptr) {
3d5dce3b744d97e Sven Peter 2023-02-12  734  		/*
3d5dce3b744d97e Sven Peter 2023-02-12  735  		 * If wptr < rptr we can't wrap around and only have to make
3d5dce3b744d97e Sven Peter 2023-02-12  736  		 * sure that there's enough space for the entire payload.
3d5dce3b744d97e Sven Peter 2023-02-12  737  		 */
3d5dce3b744d97e Sven Peter 2023-02-12  738  		if (wptr + total_size > rptr) {
3d5dce3b744d97e Sven Peter 2023-02-12  739  			ret = -ENOMEM;
3d5dce3b744d97e Sven Peter 2023-02-12  740  			goto out;
3d5dce3b744d97e Sven Peter 2023-02-12  741  		}
3d5dce3b744d97e Sven Peter 2023-02-12  742  
3d5dce3b744d97e Sven Peter 2023-02-12  743  		hdr = ep->txbfr.buf + wptr;
3d5dce3b744d97e Sven Peter 2023-02-12  744  		wptr += sizeof(*hdr);
3d5dce3b744d97e Sven Peter 2023-02-12  745  	} else {
3d5dce3b744d97e Sven Peter 2023-02-12  746  		/* We need enough space to place at least a queue entry */
3d5dce3b744d97e Sven Peter 2023-02-12  747  		if (wptr + sizeof(*hdr) > ep->txbfr.bufsz) {
3d5dce3b744d97e Sven Peter 2023-02-12  748  			ret = -ENOMEM;
3d5dce3b744d97e Sven Peter 2023-02-12  749  			goto out;
3d5dce3b744d97e Sven Peter 2023-02-12  750  		}
3d5dce3b744d97e Sven Peter 2023-02-12  751  
3d5dce3b744d97e Sven Peter 2023-02-12  752  		/*
3d5dce3b744d97e Sven Peter 2023-02-12  753  		 * If we can place a single queue entry but not the full payload
3d5dce3b744d97e Sven Peter 2023-02-12  754  		 * we need to place one queue entry at the end of the ring
3d5dce3b744d97e Sven Peter 2023-02-12  755  		 * buffer and then another one together with the entire
3d5dce3b744d97e Sven Peter 2023-02-12  756  		 * payload at the beginning.
3d5dce3b744d97e Sven Peter 2023-02-12  757  		 */
3d5dce3b744d97e Sven Peter 2023-02-12  758  		if (wptr + total_size > ep->txbfr.bufsz) {
3d5dce3b744d97e Sven Peter 2023-02-12  759  			/*
3d5dce3b744d97e Sven Peter 2023-02-12  760  			 * Ensure there's space for the  queue entry at the
3d5dce3b744d97e Sven Peter 2023-02-12  761  			 * beginning
3d5dce3b744d97e Sven Peter 2023-02-12  762  			 */
3d5dce3b744d97e Sven Peter 2023-02-12  763  			if (sizeof(*hdr) > rptr) {
3d5dce3b744d97e Sven Peter 2023-02-12  764  				ret = -ENOMEM;
3d5dce3b744d97e Sven Peter 2023-02-12  765  				goto out;
3d5dce3b744d97e Sven Peter 2023-02-12  766  			}
3d5dce3b744d97e Sven Peter 2023-02-12  767  
3d5dce3b744d97e Sven Peter 2023-02-12  768  			/*
3d5dce3b744d97e Sven Peter 2023-02-12  769  			 * Place two queue entries to indicate we want to wrap
3d5dce3b744d97e Sven Peter 2023-02-12  770  			 * around to the firmware.
3d5dce3b744d97e Sven Peter 2023-02-12  771  			 */
3d5dce3b744d97e Sven Peter 2023-02-12  772  			hdr = ep->txbfr.buf + wptr;
3d5dce3b744d97e Sven Peter 2023-02-12  773  			hdr2 = ep->txbfr.buf;
3d5dce3b744d97e Sven Peter 2023-02-12  774  			wptr = sizeof(*hdr);
3d5dce3b744d97e Sven Peter 2023-02-12  775  
3d5dce3b744d97e Sven Peter 2023-02-12  776  			/* Ensure there's enough space for the entire payload */
3d5dce3b744d97e Sven Peter 2023-02-12  777  			if (wptr + total_epic_size > rptr) {
3d5dce3b744d97e Sven Peter 2023-02-12  778  				ret = -ENOMEM;
3d5dce3b744d97e Sven Peter 2023-02-12  779  				goto out;
3d5dce3b744d97e Sven Peter 2023-02-12  780  			}
3d5dce3b744d97e Sven Peter 2023-02-12  781  		} else {
3d5dce3b744d97e Sven Peter 2023-02-12  782  			/* We have enough space to place the entire payload */
3d5dce3b744d97e Sven Peter 2023-02-12  783  			hdr = ep->txbfr.buf + wptr;
3d5dce3b744d97e Sven Peter 2023-02-12  784  			wptr += sizeof(*hdr);
3d5dce3b744d97e Sven Peter 2023-02-12  785  		}
3d5dce3b744d97e Sven Peter 2023-02-12  786  	}
3d5dce3b744d97e Sven Peter 2023-02-12  787  	/*
3d5dce3b744d97e Sven Peter 2023-02-12  788  	 * At this point we're guaranteed that hdr (and possibly hdr2) point
3d5dce3b744d97e Sven Peter 2023-02-12  789  	 * to a buffer large enough to fit the queue entry and that we have
3d5dce3b744d97e Sven Peter 2023-02-12  790  	 * enough space at wptr to store the payload.
3d5dce3b744d97e Sven Peter 2023-02-12  791  	 */
3d5dce3b744d97e Sven Peter 2023-02-12  792  
3d5dce3b744d97e Sven Peter 2023-02-12  793  	hdr->magic = cpu_to_le32(QE_MAGIC);
3d5dce3b744d97e Sven Peter 2023-02-12  794  	hdr->size = cpu_to_le32(total_epic_size);
3d5dce3b744d97e Sven Peter 2023-02-12  795  	hdr->channel = cpu_to_le32(channel);
3d5dce3b744d97e Sven Peter 2023-02-12  796  	hdr->type = cpu_to_le32(etype);
3d5dce3b744d97e Sven Peter 2023-02-12  797  	if (hdr2)
3d5dce3b744d97e Sven Peter 2023-02-12  798  		memcpy(hdr2, hdr, sizeof(*hdr));
3d5dce3b744d97e Sven Peter 2023-02-12  799  
3d5dce3b744d97e Sven Peter 2023-02-12  800  	ehdr = ep->txbfr.buf + wptr;
3d5dce3b744d97e Sven Peter 2023-02-12  801  	memset(ehdr, 0, sizeof(*ehdr));
3d5dce3b744d97e Sven Peter 2023-02-12  802  	ehdr->version = 2;
3d5dce3b744d97e Sven Peter 2023-02-12  803  	ehdr->seq = cpu_to_le16(ep->qe_seq++);
3d5dce3b744d97e Sven Peter 2023-02-12  804  	ehdr->timestamp = cpu_to_le64(0);
3d5dce3b744d97e Sven Peter 2023-02-12  805  	wptr += sizeof(*ehdr);
3d5dce3b744d97e Sven Peter 2023-02-12  806  
3d5dce3b744d97e Sven Peter 2023-02-12  807  	eshdr = ep->txbfr.buf + wptr;
3d5dce3b744d97e Sven Peter 2023-02-12  808  	memset(eshdr, 0, sizeof(*eshdr));
3d5dce3b744d97e Sven Peter 2023-02-12  809  	eshdr->length = cpu_to_le32(payload_len);
3d5dce3b744d97e Sven Peter 2023-02-12  810  	eshdr->version = 3;
3d5dce3b744d97e Sven Peter 2023-02-12  811  	eshdr->category = ecat;
3d5dce3b744d97e Sven Peter 2023-02-12  812  	eshdr->type = cpu_to_le16(stype);
3d5dce3b744d97e Sven Peter 2023-02-12  813  	eshdr->timestamp = cpu_to_le64(0);
3d5dce3b744d97e Sven Peter 2023-02-12  814  	eshdr->tag = cpu_to_le16(tag);
3d5dce3b744d97e Sven Peter 2023-02-12 @815  	eshdr->inline_len = cpu_to_le16(0);
3d5dce3b744d97e Sven Peter 2023-02-12  816  	wptr += sizeof(*eshdr);
3d5dce3b744d97e Sven Peter 2023-02-12  817  
3d5dce3b744d97e Sven Peter 2023-02-12  818  	memcpy(ep->txbfr.buf + wptr, payload, payload_len);
3d5dce3b744d97e Sven Peter 2023-02-12  819  	wptr += payload_len;
3d5dce3b744d97e Sven Peter 2023-02-12  820  	wptr = ALIGN(wptr, 1 << BLOCK_SHIFT);
3d5dce3b744d97e Sven Peter 2023-02-12  821  	if (wptr == ep->txbfr.bufsz)
3d5dce3b744d97e Sven Peter 2023-02-12  822  		wptr = 0;
3d5dce3b744d97e Sven Peter 2023-02-12  823  	trace_afk_send_rwptr_post(ep, rptr, wptr);
3d5dce3b744d97e Sven Peter 2023-02-12  824  
3d5dce3b744d97e Sven Peter 2023-02-12  825  	ep->txbfr.hdr->wptr = cpu_to_le32(wptr);
3d5dce3b744d97e Sven Peter 2023-02-12  826  	afk_send(ep, FIELD_PREP(RBEP_TYPE, RBEP_SEND) |
3d5dce3b744d97e Sven Peter 2023-02-12  827  			     FIELD_PREP(SEND_WPTR, wptr));
3d5dce3b744d97e Sven Peter 2023-02-12  828  	ret = 0;
3d5dce3b744d97e Sven Peter 2023-02-12  829  
3d5dce3b744d97e Sven Peter 2023-02-12  830  out:
3d5dce3b744d97e Sven Peter 2023-02-12  831  	spin_unlock_irqrestore(&ep->lock, flags);
3d5dce3b744d97e Sven Peter 2023-02-12  832  	return ret;
3d5dce3b744d97e Sven Peter 2023-02-12  833  }
3d5dce3b744d97e Sven Peter 2023-02-12  834  

:::::: The code at line 815 was first introduced by commit
:::::: 3d5dce3b744d97ece8a7dffcae8ee883efd99a65 drm: apple: DCP AFK/EPIC support

:::::: TO: Sven Peter <sven@svenpeter.dev>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

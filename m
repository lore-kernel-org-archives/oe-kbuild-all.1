Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E15817E019
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 03:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738121950; cv=none; b=OBVsZLsaR1x5mf6As31QQIQ8uxm6g6mSFny5o0WJW0eIwNXz/OauAjzwRW/9kY19TXABGI5BnawQEZ9oy95fjUqNx5dvEbll19wkeT3hldK2oSWdHpzGof4H5Ye732+m+aIXZwPd55EqJSSdk+rGoT03GYJpOYZhsvUDVVjac74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738121950; c=relaxed/simple;
	bh=fKA+8T/bUr3x/cu5lc/BjQeCTYFsox67xb9kze14ezU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U9ptRgUbriVeScAQ7sAkir6EAkhsISokP5GqM0+RusTLp7YoCwY5gUUIbK68L7AGp3WRePXE0rjtNxoEAabZeM2nioTeUozcX0WtnINO/m3oKdOC0bXwhRMD1K4OI0B6exGl5MOjH4kxkFizJ5acWfxqyc6F2LpYAYo2VY9gawE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPIrQTdJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPIrQTdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738121948; x=1769657948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fKA+8T/bUr3x/cu5lc/BjQeCTYFsox67xb9kze14ezU=;
  b=lPIrQTdJvnZ8h++/qVO6RklpZFc1jmpMaJdIRabIhwKPUXW5ZxbAvjn8
   MlJXzXDiThz4DJFcEJ1QAERa4f9ScSACgkD5m0zFmtypBx9SGEQJ7yy1L
   nX9N/NixSp6rZWhNgqId8hpYtVZgFaOlocDE9CPga2CCGITkI/92Xg+vA
   Q3ms8SlA3/BXfs4WlrJdeCmu86i6OdtSvfLvIkcXzXLhpWb7Zhjw/hCTT
   /2Qjc2dviQynwa3T2gjuv5oExAK7iPyjkzFXY2PwAIrAQOEYTmw0cahWn
   /SBPa8V8WWaby0N7P1JU04KfXewrhXY3k1MAd/qHqA53VqCy9Ir34Jgrk
   g==;
X-CSE-ConnectionGUID: 7glswKgtQlSBfEReyNqIJg==
X-CSE-MsgGUID: zDt8EqJuQUGcDCgwEOakdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="26225988"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="26225988"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 19:39:07 -0800
X-CSE-ConnectionGUID: i7BGIbBkT6OjcNm0C6oEgA==
X-CSE-MsgGUID: CbLq7unsREiLKt1GmO9BfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="139810534"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jan 2025 19:39:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcyuu-000iX5-0J;
	Wed, 29 Jan 2025 03:39:04 +0000
Date: Wed, 29 Jan 2025 11:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 130/246]
 drivers/gpu/drm/apple/afk.c:815:27: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202501291128.FjzDehEr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Janne,

First bad commit (maybe != root cause):

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   09b61104494bf97a1f57e4b6a55ec8a96bb380c5
commit: c04742c6b2dd28dec679bc2877699a151806e431 [130/246] drm: apple: afk: Use linear array of services
config: arm64-randconfig-r121-20250129 (https://download.01.org/0day-ci/archive/20250129/202501291128.FjzDehEr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250129/202501291128.FjzDehEr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501291128.FjzDehEr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/apple/afk.c:815:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] inline_len @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/apple/afk.c:815:27: sparse:     expected restricted __le32 [usertype] inline_len
   drivers/gpu/drm/apple/afk.c:815:27: sparse:     got restricted __le16 [usertype]

vim +815 drivers/gpu/drm/apple/afk.c

47b04122de727e Sven Peter 2023-02-12  693  
47b04122de727e Sven Peter 2023-02-12  694  int afk_send_epic(struct apple_dcp_afkep *ep, u32 channel, u16 tag,
47b04122de727e Sven Peter 2023-02-12  695  		  enum epic_type etype, enum epic_category ecat, u8 stype,
47b04122de727e Sven Peter 2023-02-12  696  		  const void *payload, size_t payload_len)
47b04122de727e Sven Peter 2023-02-12  697  {
47b04122de727e Sven Peter 2023-02-12  698  	u32 rptr, wptr;
47b04122de727e Sven Peter 2023-02-12  699  	struct afk_qe *hdr, *hdr2;
47b04122de727e Sven Peter 2023-02-12  700  	struct epic_hdr *ehdr;
47b04122de727e Sven Peter 2023-02-12  701  	struct epic_sub_hdr *eshdr;
47b04122de727e Sven Peter 2023-02-12  702  	unsigned long flags;
47b04122de727e Sven Peter 2023-02-12  703  	size_t total_epic_size, total_size;
47b04122de727e Sven Peter 2023-02-12  704  	int ret;
47b04122de727e Sven Peter 2023-02-12  705  
47b04122de727e Sven Peter 2023-02-12  706  	spin_lock_irqsave(&ep->lock, flags);
47b04122de727e Sven Peter 2023-02-12  707  
47b04122de727e Sven Peter 2023-02-12  708  	dma_rmb();
47b04122de727e Sven Peter 2023-02-12  709  	rptr = le32_to_cpu(ep->txbfr.hdr->rptr);
47b04122de727e Sven Peter 2023-02-12  710  	wptr = le32_to_cpu(ep->txbfr.hdr->wptr);
47b04122de727e Sven Peter 2023-02-12  711  	trace_afk_send_rwptr_pre(ep, rptr, wptr);
47b04122de727e Sven Peter 2023-02-12  712  	total_epic_size = sizeof(*ehdr) + sizeof(*eshdr) + payload_len;
47b04122de727e Sven Peter 2023-02-12  713  	total_size = sizeof(*hdr) + total_epic_size;
47b04122de727e Sven Peter 2023-02-12  714  
47b04122de727e Sven Peter 2023-02-12  715  	hdr = hdr2 = NULL;
47b04122de727e Sven Peter 2023-02-12  716  
47b04122de727e Sven Peter 2023-02-12  717  	/*
47b04122de727e Sven Peter 2023-02-12  718  	 * We need to figure out how to place the entire headers and payload
47b04122de727e Sven Peter 2023-02-12  719  	 * into the ring buffer:
47b04122de727e Sven Peter 2023-02-12  720  	 * - If the write pointer is in front of the read pointer we just need
47b04122de727e Sven Peter 2023-02-12  721  	 *   enough space inbetween to store everything.
47b04122de727e Sven Peter 2023-02-12  722  	 * - If the read pointer has already wrapper around the end of the
47b04122de727e Sven Peter 2023-02-12  723  	 *   buffer we can
47b04122de727e Sven Peter 2023-02-12  724  	 *    a) either store the entire payload at the writer pointer if
47b04122de727e Sven Peter 2023-02-12  725  	 *       there's enough space until the end,
47b04122de727e Sven Peter 2023-02-12  726  	 *    b) or just store the queue entry at the write pointer to indicate
47b04122de727e Sven Peter 2023-02-12  727  	 *       that we need to wrap to the start and then store the headers
47b04122de727e Sven Peter 2023-02-12  728  	 *       and the payload at the beginning of the buffer. The queue
47b04122de727e Sven Peter 2023-02-12  729  	 *       header has to be store twice in this case.
47b04122de727e Sven Peter 2023-02-12  730  	 * In either case we have to ensure that there's always enough space
47b04122de727e Sven Peter 2023-02-12  731  	 * so that we don't accidentally overwrite other buffers.
47b04122de727e Sven Peter 2023-02-12  732  	 */
47b04122de727e Sven Peter 2023-02-12  733  	if (wptr < rptr) {
47b04122de727e Sven Peter 2023-02-12  734  		/*
47b04122de727e Sven Peter 2023-02-12  735  		 * If wptr < rptr we can't wrap around and only have to make
47b04122de727e Sven Peter 2023-02-12  736  		 * sure that there's enough space for the entire payload.
47b04122de727e Sven Peter 2023-02-12  737  		 */
47b04122de727e Sven Peter 2023-02-12  738  		if (wptr + total_size > rptr) {
47b04122de727e Sven Peter 2023-02-12  739  			ret = -ENOMEM;
47b04122de727e Sven Peter 2023-02-12  740  			goto out;
47b04122de727e Sven Peter 2023-02-12  741  		}
47b04122de727e Sven Peter 2023-02-12  742  
47b04122de727e Sven Peter 2023-02-12  743  		hdr = ep->txbfr.buf + wptr;
47b04122de727e Sven Peter 2023-02-12  744  		wptr += sizeof(*hdr);
47b04122de727e Sven Peter 2023-02-12  745  	} else {
47b04122de727e Sven Peter 2023-02-12  746  		/* We need enough space to place at least a queue entry */
47b04122de727e Sven Peter 2023-02-12  747  		if (wptr + sizeof(*hdr) > ep->txbfr.bufsz) {
47b04122de727e Sven Peter 2023-02-12  748  			ret = -ENOMEM;
47b04122de727e Sven Peter 2023-02-12  749  			goto out;
47b04122de727e Sven Peter 2023-02-12  750  		}
47b04122de727e Sven Peter 2023-02-12  751  
47b04122de727e Sven Peter 2023-02-12  752  		/*
47b04122de727e Sven Peter 2023-02-12  753  		 * If we can place a single queue entry but not the full payload
47b04122de727e Sven Peter 2023-02-12  754  		 * we need to place one queue entry at the end of the ring
47b04122de727e Sven Peter 2023-02-12  755  		 * buffer and then another one together with the entire
47b04122de727e Sven Peter 2023-02-12  756  		 * payload at the beginning.
47b04122de727e Sven Peter 2023-02-12  757  		 */
47b04122de727e Sven Peter 2023-02-12  758  		if (wptr + total_size > ep->txbfr.bufsz) {
47b04122de727e Sven Peter 2023-02-12  759  			/*
47b04122de727e Sven Peter 2023-02-12  760  			 * Ensure there's space for the  queue entry at the
47b04122de727e Sven Peter 2023-02-12  761  			 * beginning
47b04122de727e Sven Peter 2023-02-12  762  			 */
47b04122de727e Sven Peter 2023-02-12  763  			if (sizeof(*hdr) > rptr) {
47b04122de727e Sven Peter 2023-02-12  764  				ret = -ENOMEM;
47b04122de727e Sven Peter 2023-02-12  765  				goto out;
47b04122de727e Sven Peter 2023-02-12  766  			}
47b04122de727e Sven Peter 2023-02-12  767  
47b04122de727e Sven Peter 2023-02-12  768  			/*
47b04122de727e Sven Peter 2023-02-12  769  			 * Place two queue entries to indicate we want to wrap
47b04122de727e Sven Peter 2023-02-12  770  			 * around to the firmware.
47b04122de727e Sven Peter 2023-02-12  771  			 */
47b04122de727e Sven Peter 2023-02-12  772  			hdr = ep->txbfr.buf + wptr;
47b04122de727e Sven Peter 2023-02-12  773  			hdr2 = ep->txbfr.buf;
47b04122de727e Sven Peter 2023-02-12  774  			wptr = sizeof(*hdr);
47b04122de727e Sven Peter 2023-02-12  775  
47b04122de727e Sven Peter 2023-02-12  776  			/* Ensure there's enough space for the entire payload */
47b04122de727e Sven Peter 2023-02-12  777  			if (wptr + total_epic_size > rptr) {
47b04122de727e Sven Peter 2023-02-12  778  				ret = -ENOMEM;
47b04122de727e Sven Peter 2023-02-12  779  				goto out;
47b04122de727e Sven Peter 2023-02-12  780  			}
47b04122de727e Sven Peter 2023-02-12  781  		} else {
47b04122de727e Sven Peter 2023-02-12  782  			/* We have enough space to place the entire payload */
47b04122de727e Sven Peter 2023-02-12  783  			hdr = ep->txbfr.buf + wptr;
47b04122de727e Sven Peter 2023-02-12  784  			wptr += sizeof(*hdr);
47b04122de727e Sven Peter 2023-02-12  785  		}
47b04122de727e Sven Peter 2023-02-12  786  	}
47b04122de727e Sven Peter 2023-02-12  787  	/*
47b04122de727e Sven Peter 2023-02-12  788  	 * At this point we're guaranteed that hdr (and possibly hdr2) point
47b04122de727e Sven Peter 2023-02-12  789  	 * to a buffer large enough to fit the queue entry and that we have
47b04122de727e Sven Peter 2023-02-12  790  	 * enough space at wptr to store the payload.
47b04122de727e Sven Peter 2023-02-12  791  	 */
47b04122de727e Sven Peter 2023-02-12  792  
47b04122de727e Sven Peter 2023-02-12  793  	hdr->magic = cpu_to_le32(QE_MAGIC);
47b04122de727e Sven Peter 2023-02-12  794  	hdr->size = cpu_to_le32(total_epic_size);
47b04122de727e Sven Peter 2023-02-12  795  	hdr->channel = cpu_to_le32(channel);
47b04122de727e Sven Peter 2023-02-12  796  	hdr->type = cpu_to_le32(etype);
47b04122de727e Sven Peter 2023-02-12  797  	if (hdr2)
47b04122de727e Sven Peter 2023-02-12  798  		memcpy(hdr2, hdr, sizeof(*hdr));
47b04122de727e Sven Peter 2023-02-12  799  
47b04122de727e Sven Peter 2023-02-12  800  	ehdr = ep->txbfr.buf + wptr;
47b04122de727e Sven Peter 2023-02-12  801  	memset(ehdr, 0, sizeof(*ehdr));
47b04122de727e Sven Peter 2023-02-12  802  	ehdr->version = 2;
47b04122de727e Sven Peter 2023-02-12  803  	ehdr->seq = cpu_to_le16(ep->qe_seq++);
47b04122de727e Sven Peter 2023-02-12  804  	ehdr->timestamp = cpu_to_le64(0);
47b04122de727e Sven Peter 2023-02-12  805  	wptr += sizeof(*ehdr);
47b04122de727e Sven Peter 2023-02-12  806  
47b04122de727e Sven Peter 2023-02-12  807  	eshdr = ep->txbfr.buf + wptr;
47b04122de727e Sven Peter 2023-02-12  808  	memset(eshdr, 0, sizeof(*eshdr));
47b04122de727e Sven Peter 2023-02-12  809  	eshdr->length = cpu_to_le32(payload_len);
47b04122de727e Sven Peter 2023-02-12  810  	eshdr->version = 3;
47b04122de727e Sven Peter 2023-02-12  811  	eshdr->category = ecat;
47b04122de727e Sven Peter 2023-02-12  812  	eshdr->type = cpu_to_le16(stype);
47b04122de727e Sven Peter 2023-02-12  813  	eshdr->timestamp = cpu_to_le64(0);
47b04122de727e Sven Peter 2023-02-12  814  	eshdr->tag = cpu_to_le16(tag);
47b04122de727e Sven Peter 2023-02-12 @815  	eshdr->inline_len = cpu_to_le16(0);
47b04122de727e Sven Peter 2023-02-12  816  	wptr += sizeof(*eshdr);
47b04122de727e Sven Peter 2023-02-12  817  
47b04122de727e Sven Peter 2023-02-12  818  	memcpy(ep->txbfr.buf + wptr, payload, payload_len);
47b04122de727e Sven Peter 2023-02-12  819  	wptr += payload_len;
47b04122de727e Sven Peter 2023-02-12  820  	wptr = ALIGN(wptr, 1 << BLOCK_SHIFT);
47b04122de727e Sven Peter 2023-02-12  821  	if (wptr == ep->txbfr.bufsz)
47b04122de727e Sven Peter 2023-02-12  822  		wptr = 0;
47b04122de727e Sven Peter 2023-02-12  823  	trace_afk_send_rwptr_post(ep, rptr, wptr);
47b04122de727e Sven Peter 2023-02-12  824  
47b04122de727e Sven Peter 2023-02-12  825  	ep->txbfr.hdr->wptr = cpu_to_le32(wptr);
47b04122de727e Sven Peter 2023-02-12  826  	afk_send(ep, FIELD_PREP(RBEP_TYPE, RBEP_SEND) |
47b04122de727e Sven Peter 2023-02-12  827  			     FIELD_PREP(SEND_WPTR, wptr));
47b04122de727e Sven Peter 2023-02-12  828  	ret = 0;
47b04122de727e Sven Peter 2023-02-12  829  
47b04122de727e Sven Peter 2023-02-12  830  out:
47b04122de727e Sven Peter 2023-02-12  831  	spin_unlock_irqrestore(&ep->lock, flags);
47b04122de727e Sven Peter 2023-02-12  832  	return ret;
47b04122de727e Sven Peter 2023-02-12  833  }
47b04122de727e Sven Peter 2023-02-12  834  

:::::: The code at line 815 was first introduced by commit
:::::: 47b04122de727e7999f664c0bf1493b1a8cf350a drm: apple: DCP AFK/EPIC support

:::::: TO: Sven Peter <sven@svenpeter.dev>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

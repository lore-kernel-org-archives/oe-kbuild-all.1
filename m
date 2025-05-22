Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D981547F2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 03:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747884294; cv=none; b=mnbIvSBIkyuisImbroFBDuEuGA9AKB5nK8zYurjf6z99vd/NKiyqjCxoUJxUt3IELMeSoj/uLOhvkDuau0BgscI++SCbNF9TK2YJWLSX3wnyyw+Oj+SRaIba5mI4FQJUDSwKhC/Ec0AUlHpoPGiKfJmPU9NjEahV7s8ubev0OBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747884294; c=relaxed/simple;
	bh=L+7TBPIkTfui3it7InxOMm0w/DrEMOms4ewMRJMvIIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B2uE7vM71STi8dxTdAIB3l/ybXBV11EFPGZ+b7IcTIZQXAsTqWjiLRLFm/rksAaq7MtOVMRX/N1tzy87o9BJ2HdpoH9RokCLFzF1Tm2FSN94KE5b4WjDCR/0TKvZlmt+1CXOQzNwJ7fhtks6S1BF2oMZN/xnU+dn+4L5QEVTSpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+FqZAcZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+FqZAcZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747884293; x=1779420293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L+7TBPIkTfui3it7InxOMm0w/DrEMOms4ewMRJMvIIc=;
  b=n+FqZAcZUETVNAjGwIIFXEEzuav1DCu5vYSqDy7hQ5SNl4t9qOGm7vqn
   24w5CrLZPZxgSZ+rOifQBhBBkHI/F0KoOVdUY85WKr/SUSIY9Gt3hM9It
   +pCB7KtlarRIk97L77W623uhimXevcA1J1hpK5hl3fo3xntVEEXB1eUR2
   Iqh7ICAJ0zmRu/43cPadobNUF+1Zc46Jsk4zEwc840+F/4WzcsDDzhYiF
   tZ6uSBZgNruouez7LfPqRmyZWJA8BaqNVdPKo1CYLndHHlnsNO8F42tft
   PFSD8ffoR//wFYT9N5/iLRowIHbB46anq9/YT9G+o1/QZPcNiwDdMKMCY
   A==;
X-CSE-ConnectionGUID: Qf5LFW4IT2WBtY5mwuwbAQ==
X-CSE-MsgGUID: xTBtI5G9RMGs5pQr6hBOjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53696224"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="53696224"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 20:24:53 -0700
X-CSE-ConnectionGUID: xd7+eJbVTY6F+v+s52H0Pg==
X-CSE-MsgGUID: b1kzJrhVTiWWOvilvoYKEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="145107106"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2025 20:24:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHwY5-000Osq-0b;
	Thu, 22 May 2025 03:24:49 +0000
Date: Thu, 22 May 2025 11:23:50 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Kubiak <michal.kubiak@intel.com>
Subject: [alobakin:libeth 31/33] drivers/net/ethernet/intel/idpf/xsk.c:112:
 warning: expecting prototype for idpf_xsk_clean_xdpq(). Prototype was for
 idpf_xsk_sq_clean() instead
Message-ID: <202505221105.XO4tGKp1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux libeth
head:   902e1400f831488f8fdaa0e59fb2a9cf6c13639a
commit: d321536c0622b0237c6ab555d297d7d3d18b18d8 [31/33] idpf: implement XSk xmit
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250522/202505221105.XO4tGKp1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221105.XO4tGKp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221105.XO4tGKp1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/xsk.c:112: warning: expecting prototype for idpf_xsk_clean_xdpq(). Prototype was for idpf_xsk_sq_clean() instead


vim +112 drivers/net/ethernet/intel/idpf/xsk.c

   106	
   107	/**
   108	 * idpf_xsk_clean_xdpq - clean an XSk Tx queue
   109	 * @xdpq: XSk Tx queue
   110	 */
   111	void idpf_xsk_sq_clean(struct idpf_tx_queue *xdpq)
 > 112	{
   113		struct libeth_xdpsq_napi_stats ss = { };
   114		u32 ntc = xdpq->next_to_clean;
   115		struct xdp_frame_bulk bq;
   116		struct libeth_cq_pp cp = {
   117			.dev	= xdpq->pool->dev,
   118			.bq	= &bq,
   119			.xss	= &ss,
   120		};
   121		u32 xsk_frames = 0;
   122	
   123		xdp_frame_bulk_init(&bq);
   124		rcu_read_lock();
   125	
   126		while (ntc != xdpq->next_to_use) {
   127			struct libeth_sqe *sqe = &xdpq->tx_buf[ntc];
   128	
   129			if (sqe->type)
   130				libeth_xdp_complete_tx(sqe, &cp);
   131			else
   132				xsk_frames++;
   133	
   134			if (unlikely(++ntc == xdpq->desc_count))
   135				ntc = 0;
   136		}
   137	
   138		xdp_flush_frame_bulk(&bq);
   139		rcu_read_unlock();
   140	
   141		if (xsk_frames)
   142			xsk_tx_completed(xdpq->pool, xsk_frames);
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA62F2556E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 01:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738201941; cv=none; b=dFQJZonx4ZSG1uLy69JR5eL54EZqTmBct8EX6VI5MrQYWZl1pnZ398W0GWplogwxq+3FJT8806XLnY4u/4w0G/bJEyCpegghB/Kvjzf8dus7XBABnEclJrm2iNGz2Gcr8QY23SwUrhuzU8Hxngv4tT9aDcRJmnsas78Fa85G4h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738201941; c=relaxed/simple;
	bh=aOyhAQ1rIiqSWXuskDFsSCGRxyVN+loypSduKZfchQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NO2e7CpeULI69xRD71dLDIYsbx756oxAdETKULzTTJ2NwtVdLa0lJQ9GN77B7mC0k5xF709iNto7ul3+mTz/vmUu9/g+k541i2N/rlw5QlBUxB9/TfD9z6OeREII83779xFIwZULINUKH1EjT/0AJnlHx7rFaBEwxdwQTQOtnpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAuXUfTN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAuXUfTN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738201939; x=1769737939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aOyhAQ1rIiqSWXuskDFsSCGRxyVN+loypSduKZfchQY=;
  b=RAuXUfTNZJaqw3vgMaIDCm8VnbTsLIiX55VDrxBlm4iZKB/2EUXAOvBO
   VeYyzdnHN0vxEO/mhCzWs4Mcw4CfWNJ8rRo1WQIn8Lv21LfJ6h9cxOzgL
   KrcCvl6yEBf16rCwgVXaHX3xuAPZkOE09mBkLr6nahtr1bokWBgQey0R8
   zd2IEQmjhGDN3BssAJnlw/BZ8qnKJ4AHjQJ99u0qJsouaDv8z8iLZEMP0
   oj8mtje4/Gm4kUGJBKxuteiXxQF3+paSyfy+/MLGZZRwd7Qt/lsENpqhX
   CdwV3AO6UGkzPtH12SpIIfU26v6chue12Ai5gJ2RRlr/P2b+P4qWhDV/I
   Q==;
X-CSE-ConnectionGUID: ZRPI8xDGTq+5qmbt/B+Bfg==
X-CSE-MsgGUID: RgMjISC+S8CyYhhCZNKp+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="42664802"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="42664802"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 17:52:18 -0800
X-CSE-ConnectionGUID: aBagucyxRg2R/pXoctOk+A==
X-CSE-MsgGUID: FWg6cA2HR0uKA+9Px5TuGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109057076"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Jan 2025 17:52:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdJj4-000jZL-1l;
	Thu, 30 Jan 2025 01:52:14 +0000
Date: Thu, 30 Jan 2025 09:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Damato <jdamato@fastly.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 1/2] netdev-genl: Add an XSK attribute to queues
Message-ID: <202501300923.p7An8jcP-lkp@intel.com>
References: <20250129172431.65773-2-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129172431.65773-2-jdamato@fastly.com>

Hi Joe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 0ad9617c78acbc71373fb341a6f75d4012b01d69]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Damato/netdev-genl-Add-an-XSK-attribute-to-queues/20250130-012820
base:   0ad9617c78acbc71373fb341a6f75d4012b01d69
patch link:    https://lore.kernel.org/r/20250129172431.65773-2-jdamato%40fastly.com
patch subject: [RFC net-next 1/2] netdev-genl: Add an XSK attribute to queues
config: x86_64-buildonly-randconfig-002-20250130 (https://download.01.org/0day-ci/archive/20250130/202501300923.p7An8jcP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300923.p7An8jcP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501300923.p7An8jcP-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/netdev-genl.c: In function 'netdev_nl_queue_fill_one':
>> net/core/netdev-genl.c:397:63: error: 'struct netdev_rx_queue' has no member named 'pool'
     397 |                 if (nla_put_u32(rsp, NETDEV_A_QUEUE_XSK, !!rxq->pool))
         |                                                               ^~
>> net/core/netdev-genl.c:407:63: error: 'struct netdev_queue' has no member named 'pool'
     407 |                 if (nla_put_u32(rsp, NETDEV_A_QUEUE_XSK, !!txq->pool))
         |                                                               ^~


vim +397 net/core/netdev-genl.c

   366	
   367	static int
   368	netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
   369				 u32 q_idx, u32 q_type, const struct genl_info *info)
   370	{
   371		struct net_devmem_dmabuf_binding *binding;
   372		struct netdev_rx_queue *rxq;
   373		struct netdev_queue *txq;
   374		void *hdr;
   375	
   376		hdr = genlmsg_iput(rsp, info);
   377		if (!hdr)
   378			return -EMSGSIZE;
   379	
   380		if (nla_put_u32(rsp, NETDEV_A_QUEUE_ID, q_idx) ||
   381		    nla_put_u32(rsp, NETDEV_A_QUEUE_TYPE, q_type) ||
   382		    nla_put_u32(rsp, NETDEV_A_QUEUE_IFINDEX, netdev->ifindex))
   383			goto nla_put_failure;
   384	
   385		switch (q_type) {
   386		case NETDEV_QUEUE_TYPE_RX:
   387			rxq = __netif_get_rx_queue(netdev, q_idx);
   388			if (rxq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
   389						     rxq->napi->napi_id))
   390				goto nla_put_failure;
   391	
   392			binding = rxq->mp_params.mp_priv;
   393			if (binding &&
   394			    nla_put_u32(rsp, NETDEV_A_QUEUE_DMABUF, binding->id))
   395				goto nla_put_failure;
   396	
 > 397			if (nla_put_u32(rsp, NETDEV_A_QUEUE_XSK, !!rxq->pool))
   398				goto nla_put_failure;
   399	
   400			break;
   401		case NETDEV_QUEUE_TYPE_TX:
   402			txq = netdev_get_tx_queue(netdev, q_idx);
   403			if (txq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
   404						     txq->napi->napi_id))
   405				goto nla_put_failure;
   406	
 > 407			if (nla_put_u32(rsp, NETDEV_A_QUEUE_XSK, !!txq->pool))
   408				goto nla_put_failure;
   409		}
   410	
   411		genlmsg_end(rsp, hdr);
   412	
   413		return 0;
   414	
   415	nla_put_failure:
   416		genlmsg_cancel(rsp, hdr);
   417		return -EMSGSIZE;
   418	}
   419	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

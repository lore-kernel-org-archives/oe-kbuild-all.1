Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7024F30E856
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 23:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765669534; cv=none; b=RKo3qBFYYDMB9K9uPTK8kuMrcf57du2ipey/23d9qNzPgWPoSfa9jq3EdOVnPXZYuNJnbZbcgcCDgCzL0wAfbrLiZlY8Grb+HXWZ6ov8GPbKzjNLIbF8ndmxnrcpaUTK/NNri5KSDHkqe0z3jAXhQO/fXiGsqSCxx6ZlN1aolhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765669534; c=relaxed/simple;
	bh=hvpsIgnjyk/JIGfWimzsQblFWU1BfuS5oG60AXfKlzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTRMhh5MlnLAfRMoJXV2WwZkLDn6rcU42+4YO3PtaDz1E9JLDhM+AEgNvQAJ10JoKwFmUWCx9B05weuh3hvmfXXhYecB2zHNuq0q1xYWzk/PRs2hPGpJcabG63vTOAZt8dM7Lpt+u1ETAQhUGgE+wZvxH1dKB+uvjpYVJzePQMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OiBj/3GV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OiBj/3GV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765669533; x=1797205533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hvpsIgnjyk/JIGfWimzsQblFWU1BfuS5oG60AXfKlzQ=;
  b=OiBj/3GV5NzSGaSoDBWxl9ndc4Z8PPKfkYZVUiJ0Y3JZci5IxlfJfQxj
   PIEmv4wipEhSMJ3IiLgLFFG191uwXsjTI+YOOd3aCcHcgXPYm7nISZs+/
   LwhCG3GVf3ZxVq/mBF9HgDuJI4mmiyGawLVxpqfSOyCNZftN5nXoYYwMK
   +UiUKrDO1h6AHr7F9a4MVtlDf/crSnm+86hwssCHRFvMbr7c0QdxeIsxL
   PKHoRpmNWkadNOeXhH07EtCWNhHtT/kYpYF7rsNNrcfOZF6W2JA2sbDTK
   FSTr7buK/qe4K7bvSXa51OUQGIVIRIGsQKBjchRJ7l8BXIUG6MzytZ7o8
   w==;
X-CSE-ConnectionGUID: GdGsrGhhShOmw2ycNhxAaw==
X-CSE-MsgGUID: MCPOXHaqRKy75GkjkhXA+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71254502"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="71254502"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 15:45:31 -0800
X-CSE-ConnectionGUID: jF7tabeJQ+Kef/C6gUp9ig==
X-CSE-MsgGUID: R5urH4sJRF2p4HKwo+7p0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197295605"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2025 15:45:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUZIk-000000008Kb-3GL9;
	Sat, 13 Dec 2025 23:45:26 +0000
Date: Sun, 14 Dec 2025 07:45:25 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>,
	greybus-dev@lists.linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Silicon Labs Kernel Team <linux-devel@silabs.com>,
	Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Subject: Re: [PATCH 09/14] greybus: cpc: acknowledge all incoming messages
Message-ID: <202512140750.0RkH4TN6-lkp@intel.com>
References: <20251212161308.25678-10-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212161308.25678-10-damien.riegel@silabs.com>

Hi Damien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18 next-20251212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Ri-gel/greybus-cpc-add-minimal-CPC-Host-Device-infrastructure/20251213-010308
base:   linus/master
patch link:    https://lore.kernel.org/r/20251212161308.25678-10-damien.riegel%40silabs.com
patch subject: [PATCH 09/14] greybus: cpc: acknowledge all incoming messages
config: arc-randconfig-r122-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140750.0RkH4TN6-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140750.0RkH4TN6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140750.0RkH4TN6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/greybus/cpc/protocol.c:46:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] size @@     got unsigned int @@
   drivers/greybus/cpc/protocol.c:46:22: sparse:     expected restricted __le16 [usertype] size
   drivers/greybus/cpc/protocol.c:46:22: sparse:     got unsigned int

vim +46 drivers/greybus/cpc/protocol.c

    30	
    31	static void cpc_protocol_queue_ack(struct cpc_cport *cport, u8 ack)
    32	{
    33		struct gb_operation_msg_hdr *gb_hdr;
    34		struct sk_buff *skb;
    35	
    36		skb = alloc_skb(CPC_HEADER_SIZE + sizeof(*gb_hdr), GFP_KERNEL);
    37		if (!skb)
    38			return;
    39	
    40		skb_reserve(skb, CPC_HEADER_SIZE);
    41	
    42		gb_hdr = skb_put(skb, sizeof(*gb_hdr));
    43		memset(gb_hdr, 0, sizeof(*gb_hdr));
    44	
    45		/* In the CPC Operation Header, only the size and cport_id matter for ACKs. */
  > 46		gb_hdr->size = sizeof(*gb_hdr);
    47		cpc_cport_pack(gb_hdr, cport->id);
    48	
    49		cpc_protocol_prepare_header(skb, ack);
    50	
    51		cpc_hd_send_skb(cport->cpc_hd, skb);
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

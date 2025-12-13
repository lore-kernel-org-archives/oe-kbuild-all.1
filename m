Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7673202F71
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765637154; cv=none; b=JnwezMfFAxdBZnlLPJUMeYvOVsmniBxpwgECaVvo1mo1rktx4GF0Wc3immjjXU+OYX86xhd/PtzjhXDhzO0N9mOPphomZKHjiP9D8fQxPsVbzSoiQPIZSRkXKcuZnWEPM3rtYtcCrsBrPKiZeWPLoDthKMOEdxcJ54eijLCiVHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765637154; c=relaxed/simple;
	bh=gDK90N6kIzUVrg6Up9YZFrVsII/JHlVIKqa2KBpUu7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWY+ukN+FOWM3fzgi3Mz8xDhjqUTEHToyj6BMLnBZ6y4wYvAPN/YkrXfavTQFIaIePA6MNUgrGHK88PuYdE+6yALsOB/zBOp17KDYF86ddPY64SBFDYDiJCSUotFygpV64hUT5iq5wM6DVpv3b1l99didiHKF7E9dihBYBTXuhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kh+CciiM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kh+CciiM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765637153; x=1797173153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gDK90N6kIzUVrg6Up9YZFrVsII/JHlVIKqa2KBpUu7c=;
  b=Kh+CciiMjSeLxh8fuT/v5HRKYLE9N5NRRtzLD8hgbmox2CpDspqE9BN1
   YB7tGw4Pers9Kj1LCVR0xmhMcsPnatuFewVL8AMHsi0zxNr6E+WjzL5eq
   pddjlyjBotqU27HBDjbrpgBrkQKkpyMXeRTdhSP9IsCz6TcNhEx9At8g7
   Bj41eAX0lOQ6XGIW4biBBygvQY9ZI55i/ah/YMqhyxqIhvuREfZwcsPOY
   qg1QO8Yy7S1NQhfGV2HLBr1au/JdBQIDxQgUDEtV2YhUooDHWZu8s5YoA
   2Jmp6GphmvFp179fUZD6ASdY5lIWJCQ5tGARoFnO309k7ALqKGf7qnZE9
   g==;
X-CSE-ConnectionGUID: a5HHuwlRQnu5kR5UPrv0Pw==
X-CSE-MsgGUID: ZZ02mxCEQv2Hirbeob9kPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78727485"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78727485"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 06:45:51 -0800
X-CSE-ConnectionGUID: scfJH58BTXeGMiR4RoGbdg==
X-CSE-MsgGUID: HJmmkJZJRC+Bhodt9dh7PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="201502890"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Dec 2025 06:45:48 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUQsU-000000007kT-0e2h;
	Sat, 13 Dec 2025 14:45:46 +0000
Date: Sat, 13 Dec 2025 22:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>,
	greybus-dev@lists.linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Silicon Labs Kernel Team <linux-devel@silabs.com>,
	Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Subject: Re: [PATCH 09/14] greybus: cpc: acknowledge all incoming messages
Message-ID: <202512132212.2zg1V6JU-lkp@intel.com>
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
config: alpha-randconfig-r112-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132212.2zg1V6JU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132212.2zg1V6JU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132212.2zg1V6JU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/greybus/cpc/protocol.c:46:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] size @@     got unsigned long @@
   drivers/greybus/cpc/protocol.c:46:22: sparse:     expected restricted __le16 [usertype] size
   drivers/greybus/cpc/protocol.c:46:22: sparse:     got unsigned long

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

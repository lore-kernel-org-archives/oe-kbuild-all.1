Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61EF1E2838
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 22:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729549979; cv=none; b=Dje+S5SJm86gE47yvr5xVwb4mzkxCSSq43Nl+upFP+QZ41or3aRUv5LQBL+g0vjF2pOdEx2yQWCf01vqBOqPTGvhqgeu5v0/PUqo+S+W3j6lVckMK/ijFzhpH8e494DeOpfMd5MMvKq/V3k5aQACqo7lm0gW+ZQiuDUxezQyqqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729549979; c=relaxed/simple;
	bh=xcaPgMt6Eh+JAUE6Xnkx1fugjyKVgIbuhtZ3W6j70r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmvQUbrxyEx3dbWsl5LNRSd9jN824LKq4gW30SWtOFkbvDPH4NWiVXylCnuafUJKAjVZq64MOjsP0pcpWMkoGDHdeXcvlnYTyIcy35oXX85Xiw91YFgABc84IBMdFW3T2xJx95kLfjo1gNvnaynuHlFqEJ/nprQfghxG3NT+45k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcVxStV8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcVxStV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729549977; x=1761085977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xcaPgMt6Eh+JAUE6Xnkx1fugjyKVgIbuhtZ3W6j70r8=;
  b=dcVxStV8w8ybzYVAafiPFbmIwWZb2HG8jZ1AS0yE+yKHFNiT9PeYQkZa
   EZIccRs/NKZXIvyRXjcFdNiQCmSRcvysSn6+TWwS90DZUWnJcCyUXYLc+
   7ZCn9b1sbSaQTOHyM34qd8KYQ+6GZKvXFE+wo/b16y9sOzz0m0b0FReLf
   VvpftDluQSYt3hO0plACV8T5YKPx+6lTmGeNjW4MQHxwZ2VA0BWS/ei/J
   Oa6ou9UTZMGl2sZLSv45U19KGmbu6E9z+81snLx5La+MDSlytZTNZI8Qi
   BrWxsY3WVVR/r3ZYRvCH8w3nAxZKbn7AW4TZgm1Lsw2ggwbas/9ccRdin
   Q==;
X-CSE-ConnectionGUID: rrBy8N1CSk2fQWS0mF8+hg==
X-CSE-MsgGUID: 8+vx80Q6QTWGa3ApmZgaug==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="54463012"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="54463012"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 15:32:57 -0700
X-CSE-ConnectionGUID: ncZ4DteBTZmTJNx2lCew7g==
X-CSE-MsgGUID: Wi6SHKTgRaS5AI7x27aXWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="80068730"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2024 15:32:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t30xH-000Sgw-1b;
	Mon, 21 Oct 2024 22:32:51 +0000
Date: Tue, 22 Oct 2024 06:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Johnston <matt@codeconstruct.com.au>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Dung Cao <dung@os.amperecomputing.com>
Subject: Re: [PATCH net v2] mctp i2c: handle NULL header address
Message-ID: <202410220659.hh4B9jRO-lkp@intel.com>
References: <20241021-mctp-i2c-null-dest-v2-1-4503e478517c@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021-mctp-i2c-null-dest-v2-1-4503e478517c@codeconstruct.com.au>

Hi Matt,

kernel test robot noticed the following build errors:

[auto build test ERROR on cb560795c8c2ceca1d36a95f0d1b2eafc4074e37]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Johnston/mctp-i2c-handle-NULL-header-address/20241021-123741
base:   cb560795c8c2ceca1d36a95f0d1b2eafc4074e37
patch link:    https://lore.kernel.org/r/20241021-mctp-i2c-null-dest-v2-1-4503e478517c%40codeconstruct.com.au
patch subject: [PATCH net v2] mctp i2c: handle NULL header address
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241022/202410220659.hh4B9jRO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410220659.hh4B9jRO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410220659.hh4B9jRO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/mctp/mctp-i2c.c: In function 'mctp_i2c_header_create':
>> drivers/net/mctp/mctp-i2c.c:599:23: error: assignment to 'u8' {aka 'unsigned char'} from 'const unsigned char *' makes integer from pointer without a cast [-Wint-conversion]
     599 |                 llsrc = dev->dev_addr;
         |                       ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +599 drivers/net/mctp/mctp-i2c.c

   579	
   580	static int mctp_i2c_header_create(struct sk_buff *skb, struct net_device *dev,
   581					  unsigned short type, const void *daddr,
   582					  const void *saddr, unsigned int len)
   583	{
   584		struct mctp_i2c_hdr *hdr;
   585		struct mctp_hdr *mhdr;
   586		u8 lldst, llsrc;
   587	
   588		if (len > MCTP_I2C_MAXMTU)
   589			return -EMSGSIZE;
   590	
   591		if (daddr)
   592			lldst = *((u8 *)daddr);
   593		else
   594			return -EINVAL;
   595	
   596		if (saddr)
   597			llsrc = *((u8 *)saddr);
   598		else
 > 599			llsrc = dev->dev_addr;
   600	
   601		skb_push(skb, sizeof(struct mctp_i2c_hdr));
   602		skb_reset_mac_header(skb);
   603		hdr = (void *)skb_mac_header(skb);
   604		mhdr = mctp_hdr(skb);
   605		hdr->dest_slave = (lldst << 1) & 0xff;
   606		hdr->command = MCTP_I2C_COMMANDCODE;
   607		hdr->byte_count = len + 1;
   608		hdr->source_slave = ((llsrc << 1) & 0xff) | 0x01;
   609		mhdr->ver = 0x01;
   610	
   611		return sizeof(struct mctp_i2c_hdr);
   612	}
   613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

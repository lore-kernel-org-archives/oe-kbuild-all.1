Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A98419992E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729590830; cv=none; b=jinm5JVfdAkNVk2PmPvNomyMlO4Xdn4GpPLoZXGUlTtFFjYDslh72/BRxQSzPid+rbjj16oaklZ2GhXKpWRM5CGhcob6ZKhkjmuTTv7o4AEU91s2Sr1ro+u7r+xbb6zK9nB1FswoTHXcbCf1b1yZr1yG+v55CNhCICBKZ90ZCiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729590830; c=relaxed/simple;
	bh=scM++PRarp/aL6EIAnPspEEa4tB6O8OVUGdyT5ywHWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egR5cyjj2Qqy1Isy0JvuqAxNzEDtnj1Rn1nsYzFCbUEVMFdyjWlDhdoiBtsEuiIfNfhCsvsj784YWODnAz7qo5wAF/NOXD/8JtGkZt0BGHadToJsTw6Kmfc62/aTeAk8SU8FbZxATP8Qn5gBQleSol/HPB/84oxXy0UpSrawqlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTiIXQ1K; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTiIXQ1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729590828; x=1761126828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=scM++PRarp/aL6EIAnPspEEa4tB6O8OVUGdyT5ywHWg=;
  b=LTiIXQ1Kpf+rmkDaM0fto+TwgK/u9b91yRJA2ZBkk68rtYsPpUR/0YZu
   Djb7WevTFs3VUHmQGVTTidC19R/wUfvpCxexV2RUqhcpfTns36i66nPUp
   7nvlTXJpZwW5/VoD9Wb03vrmIB/GmX6nc2raOq/JRBoK6bRXtRftEqSH9
   yMD+8Y4BZeCNibh3zG4RVKurEXHZ+4B1SMJBGFtfyKNlJ09sMBGLPVOkB
   D/Bpd+bWacfUY9ygVe2lB+wX/xspwVgBt+KoiZEqjLDDyW0D6+Qo/vlH5
   girwBXr7rLHpHwMRJW+yfBpcdJqIIrDnzxx0lrmzElJ7dLe0j0lpeZadJ
   w==;
X-CSE-ConnectionGUID: gXTD0fnORdW5iCpE/cD4aQ==
X-CSE-MsgGUID: 2FNUs+gXR4ab4RIxsMpZOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29320771"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="29320771"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 02:52:34 -0700
X-CSE-ConnectionGUID: dtMF4WWlS2enATM/z7NnNw==
X-CSE-MsgGUID: V81PCzHpTli7AWTOne9nsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="110635030"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Oct 2024 02:52:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3BYy-000TPr-0b;
	Tue, 22 Oct 2024 09:52:28 +0000
Date: Tue, 22 Oct 2024 17:52:18 +0800
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
Message-ID: <202410221734.IWc5paM1-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on cb560795c8c2ceca1d36a95f0d1b2eafc4074e37]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Johnston/mctp-i2c-handle-NULL-header-address/20241021-123741
base:   cb560795c8c2ceca1d36a95f0d1b2eafc4074e37
patch link:    https://lore.kernel.org/r/20241021-mctp-i2c-null-dest-v2-1-4503e478517c%40codeconstruct.com.au
patch subject: [PATCH net v2] mctp i2c: handle NULL header address
config: alpha-randconfig-r122-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221734.IWc5paM1-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20241022/202410221734.IWc5paM1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221734.IWc5paM1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/mctp/mctp-i2c.c:599:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [assigned] [usertype] llsrc @@     got unsigned char const *dev_addr @@
   drivers/net/mctp/mctp-i2c.c:599:23: sparse:     expected unsigned char [assigned] [usertype] llsrc
   drivers/net/mctp/mctp-i2c.c:599:23: sparse:     got unsigned char const *dev_addr
   drivers/net/mctp/mctp-i2c.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

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

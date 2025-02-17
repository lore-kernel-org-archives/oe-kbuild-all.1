Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC0C224F0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739784135; cv=none; b=nnY5qrSTM9J3jYPdjsyifJ9ATRi53WvQ9dIR5Acpk19P40oYYKj1eFYm2xmAdSR4C13/vYJwOSU2SuqXUc3ZtVRae62hOe8ooPPuXnL8yeeGlJXk0TGvWPZEM9pPxfQzCxw7Gs3FlXzWHGzhmHSSurcRGoYwMxRRgpgL+CpBk6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739784135; c=relaxed/simple;
	bh=2XX7lx0oSDtKscu+XBW16BW4Ix9aCLHNW5Jxyp3an2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yfeq+Kq69DXBwOGXIIycXt72yKqgBtEvD91YuwVi7FpHRzoCJ8TeSLNLESBEy2Jt6ttoPSRltw8jKUy+d/1at1UlxR43mpmQnEJS0Oc1RjqQmrJVOAr3TvmcQDthsxuE3LbUUpjnTWwVKYNS9djylDs+6m4t+ScqICwX0llylKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccSBYQo/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccSBYQo/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739784134; x=1771320134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2XX7lx0oSDtKscu+XBW16BW4Ix9aCLHNW5Jxyp3an2c=;
  b=ccSBYQo/L5MGn9TwLnrMXOFzni2PVCiq+euRlFeadqcnuvOSQ0qh6g5a
   NmXH0A0izxJybVAkJr7TD6To58JN89JPWT3tnhd3tnAwX3/eIbE3uABmp
   z1+ohyBb5WbttVcK+nsMxYsAa1FHFlMEBIs2PmW3CJkhjtRO3gBSDt4nG
   1ip2fUC4yfDLAjDomj437hvAUfpdl0OeEp2HqjbCxANd6kVgezuYiIIqN
   GgsBOXlEyT8E1YsEzWxiMQ1e3agY6hPyomaLJ7qwZkUeOaRW6g3hEguvp
   x7sRh0nvY/UBTT3GRPh+B8FVmj0DfKE4Hg+kIUJrOiydl5EvKPDxkpWQN
   Q==;
X-CSE-ConnectionGUID: 7ZTT/0n9Qz+0pgANXg+4+Q==
X-CSE-MsgGUID: fUhzrYirTQ20rzK+FePGRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="50674661"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="50674661"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 01:22:13 -0800
X-CSE-ConnectionGUID: 2vYM8z7oQGSPPPKpIm1RLQ==
X-CSE-MsgGUID: H2wrMt0xRAWoT7LdgCnrGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137312591"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Feb 2025 01:22:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjxKM-001CtP-0G;
	Mon, 17 Feb 2025 09:22:10 +0000
Date: Mon, 17 Feb 2025 17:22:04 +0800
From: kernel test robot <lkp@intel.com>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1] mt76: mt7915: wed: add wed tx support
Message-ID: <202502171751.a72jnssS-lkp@intel.com>
References: <TYCPR01MB84374459E6D6B7BB602977CD98FB2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB84374459E6D6B7BB602977CD98FB2@TYCPR01MB8437.jpnprd01.prod.outlook.com>

Hi Shengyu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.14-rc3 next-20250217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengyu-Qu/mt76-mt7915-wed-add-wed-tx-support/20250217-133029
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/TYCPR01MB84374459E6D6B7BB602977CD98FB2%40TYCPR01MB8437.jpnprd01.prod.outlook.com
patch subject: [RFC PATCH v1] mt76: mt7915: wed: add wed tx support
config: loongarch-randconfig-002-20250217 (https://download.01.org/0day-ci/archive/20250217/202502171751.a72jnssS-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502171751.a72jnssS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502171751.a72jnssS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/wed.c: In function 'mt76_wed_offload_disable':
>> drivers/net/wireless/mediatek/mt76/wed.c:174:30: error: 'struct mtk_wed_device' has no member named 'wlan'
     174 |         dev->token_size = wed->wlan.token_start;
         |                              ^~


vim +174 drivers/net/wireless/mediatek/mt76/wed.c

   168	
   169	void mt76_wed_offload_disable(struct mtk_wed_device *wed)
   170	{
   171		struct mt76_dev *dev = container_of(wed, struct mt76_dev, mmio.wed);
   172	
   173		spin_lock_bh(&dev->token_lock);
 > 174		dev->token_size = wed->wlan.token_start;
   175		spin_unlock_bh(&dev->token_lock);
   176	}
   177	EXPORT_SYMBOL_GPL(mt76_wed_offload_disable);
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

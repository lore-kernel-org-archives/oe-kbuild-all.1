Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2095329396
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 06:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781762477; cv=none; b=EooLYofJ4tiCfDjrzwy5u2Bn4B8WOtwJqmQ7eL4fAg9P2M2HEpT52RqESXqCzqizB7dDb6sFSAgZX33/yRhp1CrDwLrSrEGb826jbN0cRDNevC1UAvfnE7LsSPBf8IpNqHZvzPXzHR3TQvDwcoTLsXfq1SpgNsurHTG3lsYroZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781762477; c=relaxed/simple;
	bh=RAsd8khCYqSW4I+iICC+jiMD6xMyMVzESx49f2X+uMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTDzTA+YmgKZBbtYh5Yzp7TdB30wIsOdffm1JCdwFsnLpJvJnyK0g98QAIuzwFW/Fip3FhopS3cXJ7ja4AC6glQrGJDykCpkA1aOrVuc07iUHoflXeaAOF8cVqVfvj1p0YRqsJ6gwvkVgA+t/Pl9BxOxev7vgcJhXvlD2ze98yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPo140X0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPo140X0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781762476; x=1813298476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RAsd8khCYqSW4I+iICC+jiMD6xMyMVzESx49f2X+uMo=;
  b=BPo140X05VF8x8E930TIfzstZlx1LY1IJ5+maq8FsfsA+wkUEBxyOS4m
   r4ravIp8wrz6hN18Y8NymAV6s4E9UhFz+u4hNAAQj08C2mqpoW7Fc1Z8/
   rPW+4fMk6JuhaGpsa6xZBBxG+t2VVNBlKkME6bRI3/+tfr5NJTbvgTo9B
   MUvyFPaPJIuxzPfWNe4x2ziiXQNP+OIHoJQZq5nS8qjRmbEP6yimyiRHV
   vYm9RSI5oDEAxL4mXWCNmuXOW28GffSwxXmHBpG9KOAhxIceAPhEck9Js
   +gPmNOWl5Do2jU8hwnlYgibXCxOUKtb1drCL4NSBRviQuf+kKOQQWFjDC
   g==;
X-CSE-ConnectionGUID: xMj6FuHRT/Ob5YIvEps5pg==
X-CSE-MsgGUID: vClnGbPKTSGc/6zywu9sUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="81572386"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="81572386"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:01:13 -0700
X-CSE-ConnectionGUID: 9U34h6lwQU2aVS/IHyvd2w==
X-CSE-MsgGUID: MuWYTk+9TF+BTPX/TDMaIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="286389922"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jun 2026 23:01:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa5oK-00000000VHa-3FLU;
	Thu, 18 Jun 2026 06:01:08 +0000
Date: Thu, 18 Jun 2026 14:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Wang <sean.wang@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Stella Liu <yu-ching.liu@mediatek.com>
Subject: Re: [PATCH] wifi: mt76: mt7925: support new WoW pattern TLV
Message-ID: <202606181323.heBYmqMQ-lkp@intel.com>
References: <20260615212137.477893-1-sean.wang@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615212137.477893-1-sean.wang@kernel.org>

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v7.1 next-20260616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Wang/wifi-mt76-mt7925-support-new-WoW-pattern-TLV/20260616-052424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260615212137.477893-1-sean.wang%40kernel.org
patch subject: [PATCH] wifi: mt76: mt7925: support new WoW pattern TLV
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260618/202606181323.heBYmqMQ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606181323.heBYmqMQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606181323.heBYmqMQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:15:13: warning: 'mt7925_mcu_wow_pattern_old_tlv' defined but not used [-Wunused-function]
      15 | static bool mt7925_mcu_wow_pattern_old_tlv(struct mt76_dev *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mt7925_mcu_wow_pattern_old_tlv +15 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c

    14	
  > 15	static bool mt7925_mcu_wow_pattern_old_tlv(struct mt76_dev *dev)
    16	{
    17		const char *fw_version = dev->hw->wiphy->fw_version;
    18		const char *build_date = strrchr(fw_version, '-');
    19	
    20		if (!is_mt7925(dev))
    21			return false;
    22	
    23		if (!build_date)
    24			return false;
    25	
    26		build_date++;
    27	
    28		return strncmp(build_date, MT7925_WOW_PATTERN_NEW_FW_DATE,
    29			       strlen(MT7925_WOW_PATTERN_NEW_FW_DATE)) < 0;
    30	}
    31	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

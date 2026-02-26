Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F262E0B58
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101779; cv=none; b=W1ueIDLTSHdRL/an7wIslpfLtHd1K41GbPPPFsQNi8IskBtvE7+IluCU0S2hzZxZdVtx0eaor1VBw9ye85yoMHlvfBMOHZlVhpd7Xg6ub8b5FNnAouvV5HEiA3oScPFfDJqYaN3QU2vVY0di54OrQA6buNo/TbS3rH4SUnsX8hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101779; c=relaxed/simple;
	bh=587btXg/pksuFB2qmSKC7x4NgEDzZdzpKT6zLzMapik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gq0yBGfTpCk3czAYgAmHMOTv9kTg2pAqEC5lhKrdlgXZOF8II0xJFwfqMcy7H3MOFZzIngG1sIc/XRtDRhsjXgyGkz1EfD+3gYgtxBJlO8Hv0q/vO59Dpn1DfhRao/mnEmCS3/w7aRvhAz2dtEcTEWAt5a7YmETgB1pVeWDI/no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjD5UReD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjD5UReD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772101778; x=1803637778;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=587btXg/pksuFB2qmSKC7x4NgEDzZdzpKT6zLzMapik=;
  b=DjD5UReDjXHjmnvD3/uAdco2Wt7l5Wi0oDO4pmGTStNPMdX4FzmHZVbE
   biQmci+GxN17lZ1DA0QOaw/0u1uNgwJ+dSjh+/Qu1kIY9e7NW/Tr3d/Jl
   8M1SM8qXwXOu2wPMztwMB3DHZH5F8oT8tE2op01F+G1ilf7YgyJUr3N2F
   ad2ir/+3FBHzhLI9CpVRgS152ETC7LdELOcScKVP3HK764NVD7Zftlyxj
   j3irZLEO47iw3BhQPyZZYxf2jyc8e7D3ptc6Nt4EyANHJcud+XSVLLuK7
   EFvHcx3iKzpF71Y7ygGDWSs3hb5x7pEEcePpzDmrbRWX9gabwOJJ05kbM
   A==;
X-CSE-ConnectionGUID: 0Ng11SUPRHKHIXXwG8Kjhg==
X-CSE-MsgGUID: AgHqRq05T4KQU3RHl2Dc2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="75761992"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="75761992"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 02:29:37 -0800
X-CSE-ConnectionGUID: sZFd+mQNSyKkVlnbOv4SVA==
X-CSE-MsgGUID: +9uUq9jDRLuGHVx0T4nL2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="214090461"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Feb 2026 02:29:34 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvYcL-0000000091Z-34qn;
	Thu, 26 Feb 2026 10:29:22 +0000
Date: Thu, 26 Feb 2026 18:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 4/4] ARM: dts: BCM5301X: AC5300: set WAN MAC from nvram
Message-ID: <202602261850.DL7ZVo3w-lkp@intel.com>
References: <20260225230827.21715-5-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225230827.21715-5-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v7.0-rc1 next-20260225]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/ARM-dts-BCM5301X-EA9200-set-WAN-MAC-from-nvram/20260226-071232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260225230827.21715-5-rosenp%40gmail.com
patch subject: [PATCHv2 4/4] ARM: dts: BCM5301X: AC5300: set WAN MAC from nvram
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260226/202602261850.DL7ZVo3w-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602261850.DL7ZVo3w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602261850.DL7ZVo3w-lkp@intel.com/

All errors (new ones prefixed by >>):

   also defined at arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts:128.10-133.5
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

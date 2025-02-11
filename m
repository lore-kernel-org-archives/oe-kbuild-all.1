Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AED924E4C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 16:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291556; cv=none; b=UwhU9MXYOZVjHT2o/9QlSQmWMyS4z2sqBlC6IEd2qotYLmvkP0mAG1xWFuXN/3U43FFlp+o8oiG3wg3Cm0h0yENT6hKbiHfKYPE86N7ezZ1hOuZ4c0LJeYyjzTPQGxZ3y74d6f5eiQ2owbHWvHISQx1gOVSugVechMT/5Muc+YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291556; c=relaxed/simple;
	bh=EoAcIgOm4uCbunqI76F8Bc030jfwEhKUCtlxmXXHpRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PL6G6Dluru45akJCZsO5lUANEDncE5UqHUaZzbTNT3Qok8Si1XK69Ejj5MV/UBxTtLVsFsR7M+bbR4JHHzomdLEyuUtgCMI28eyRXFzcIDbgtfyzvavXNjI1LGzpjNcYThb5cJzijBXV7ppF9J36zG8ALlVQXssTndl7MamjNT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHMuZ6iz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHMuZ6iz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739291555; x=1770827555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EoAcIgOm4uCbunqI76F8Bc030jfwEhKUCtlxmXXHpRM=;
  b=iHMuZ6izEAXIj33jgdeh18xbGF6wjV/wu03G95hvG9X+Df8qwhPdyhHu
   TtO6jiUgfYionwMyROEwRYtFqakA4E5Z903nq/EDTWaEyGG7WyccpE4/6
   Gh4lJjyv8yu+tBvUW3Jj310ypoqSbfVAZDohfkSAaxMMj+X0a/jL/tCGr
   wx8xNCgRnfD1Loi+EgGSSFRBC5Y8QYaL+O6sRG7lnx5YNqg7U947NV+mF
   8EpL54F7S+E8/jhsYn/7Emuftz3/6XNVYbL8uooOu8yj0xTDFXZqmNXvs
   iOLfOxrqZo1sf1C8lWfl7Be/tiwtgS2JPYiJyR7QR1UzL03R6ndrdUXWQ
   g==;
X-CSE-ConnectionGUID: dOToDmdCR7ey9AS9xjTXcA==
X-CSE-MsgGUID: 0xIfGRyER6m7u9uUoYOKqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43577365"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="43577365"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:32:34 -0800
X-CSE-ConnectionGUID: /yUwx0+bTDaOld5UIx7mDA==
X-CSE-MsgGUID: DLQdHFw4QVSERlk6O99ekQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117173617"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2025 08:32:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thtBX-0014Rj-0I;
	Tue, 11 Feb 2025 16:32:31 +0000
Date: Wed, 12 Feb 2025 00:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/6] ASoC: meson: [HACK] let AIU export its clocks
 through clk-regmap
Message-ID: <202502120049.Rf5g35MJ-lkp@intel.com>
References: <20250210150129.40248-2-vsetti@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210150129.40248-2-vsetti@baylibre.com>

Hi Valerio,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on robh/for-next linus/master v6.14-rc2 next-20250210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valerio-Setti/ASoC-meson-HACK-let-AIU-export-its-clocks-through-clk-regmap/20250210-230826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250210150129.40248-2-vsetti%40baylibre.com
patch subject: [PATCH RFC 1/6] ASoC: meson: [HACK] let AIU export its clocks through clk-regmap
config: i386-buildonly-randconfig-002-20250211 (https://download.01.org/0day-ci/archive/20250212/202502120049.Rf5g35MJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120049.Rf5g35MJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120049.Rf5g35MJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "clk_regmap_gate_ops" [sound/soc/meson/snd-soc-meson-aiu.ko] undefined!
>> ERROR: modpost: "clk_regmap_divider_ops" [sound/soc/meson/snd-soc-meson-aiu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

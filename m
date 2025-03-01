Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9555A1E3DC4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Mar 2025 21:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740865592; cv=none; b=nhqzHI/5muyQn5jWUTAnj8dpUp2yiV/NQ78/90rWD5vfMQcD2xJVw3Do8kDu4wi1/RGBgfItpqBLivrlBh6Ttxv6MZkOJGIaYbPLPncEVafi3zmaWNMwWTnrsxGdh+0L47X2iKHpjvW+Vb6/Qftfk0zWTC0RehBkBYwM/ReuAZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740865592; c=relaxed/simple;
	bh=RgENAaaQzSjYluJV2j458ER4MjJTkcFoOP18LUUpMLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMVHn2SXV52OJMichrauAROhRU30USRpRdIe8zSh5afLCTCqjjqR0GLzhAs2mkSY4zWo7uCNlgsew3LaR27ilvB0M0c2S0eW4q4Z207Wz86JCb1jOtvQL+vIa2rCa117WS1lGkVq3x76Msc8M5zBNNsAtc7WO4KO17txaI8netY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ix2RECGU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ix2RECGU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740865591; x=1772401591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RgENAaaQzSjYluJV2j458ER4MjJTkcFoOP18LUUpMLA=;
  b=ix2RECGU8dQfQ6mPfi5I2Z3oLiVR76bbzIUxet4HKw7UtLaGzBT3C+aa
   jO264MqIegJeXvPUoXPt5tFT7wO6tm4g1N+scBlYX5v0IywHmzHT2XGU4
   g7bUx9tEQpmKDOkHRr1vS7uxJgG5BQuEngSk952zmi7dz6jR0maqniUaf
   xV3LSXpW8SkJlzxNW8CytOoxXXwkTCMyfEIUQGbGF9QSlaShiymjrh6wc
   ny1iHmOigcRPlhBUIh0uvzM/VJc/lakgT6omZb4cXPzZrtOLo5BCXDZPw
   HNYJJzvN3Th9rhwuryCkJZ7aWTSQwHLbfCbbXB9C4bpFfpkZIHsrbMBqo
   w==;
X-CSE-ConnectionGUID: E1kotu8wRgCRTkjW0agxTQ==
X-CSE-MsgGUID: GSPAXTGvTzyNMW4+laSiaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="59316333"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="59316333"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 13:46:29 -0800
X-CSE-ConnectionGUID: SqPsYZo4QTOnH/rIJds/rw==
X-CSE-MsgGUID: TYqwkLJtQou03mQIShDSPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="148453165"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Mar 2025 13:46:26 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toUfA-000Gjb-0F;
	Sat, 01 Mar 2025 21:46:24 +0000
Date: Sun, 2 Mar 2025 05:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 7/8] memory: renesas-rpc-if: Add RZ/G3E xSPI support
Message-ID: <202503020521.ZJBds3LY-lkp@intel.com>
References: <20250228160810.171413-8-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228160810.171413-8-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on broonie-spi/for-next krzk-dt/for-next linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/dt-bindings-memory-Document-RZ-G3E-support/20250301-041012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250228160810.171413-8-biju.das.jz%40bp.renesas.com
patch subject: [PATCH 7/8] memory: renesas-rpc-if: Add RZ/G3E xSPI support
config: sparc64-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020521.ZJBds3LY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020521.ZJBds3LY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020521.ZJBds3LY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/memory/renesas-rpc-if: local symbol 'xspi_dirmap_read' was exported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

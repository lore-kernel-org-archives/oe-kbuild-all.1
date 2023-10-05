Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A3029418
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 18:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEAmATH+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696530603; x=1728066603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mgH9mjU70d488SDsVbeAEChvBEQGjntDusGMNaqHH8g=;
  b=IEAmATH+acflTskB7e1a0k8KJnZm5Te35J60l0Vn1jXuQ/qzBS9Azd4a
   R2bOm0aUm2kxPq8DBGRt4shPHYDGi/1x5VOfMxhYLEOsWRX1pLAf0dku/
   m88v1VvNNYMP3yvGvRMy63Hf7s/noKe1C+fG3ejBq9lImWC6XeLT6+qvU
   x5VBOWPKHN7C5f9jNE70Wt4bGd16ryQshwcyHehUfwb0jwg2vIUoExsoG
   RvCnfwZa3geEYM7iadEsonSmtaZXP5jDtyz9psX/te1BqeePR1WkaZKAu
   ftft+sIGBWQA7CM9ZoD6wijlHzWDi3cmFwlM9Dy4ubEQPxlYNfmOnDhVo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382451967"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="382451967"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 11:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="999042597"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="999042597"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Oct 2023 11:29:59 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoT6j-000LmG-0M;
	Thu, 05 Oct 2023 18:29:57 +0000
Date: Fri, 6 Oct 2023 02:29:01 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-pwm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v16 3/4] pwm: Add support for RZ/G2L GPT
Message-ID: <202310060218.5lQtUezc-lkp@intel.com>
References: <20231004111451.126195-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004111451.126195-4-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4aae44f65827f0213a7361cf9c32cfe06114473f]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/dt-bindings-pwm-Add-RZ-G2L-GPT-binding/20231004-231907
base:   4aae44f65827f0213a7361cf9c32cfe06114473f
patch link:    https://lore.kernel.org/r/20231004111451.126195-4-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v16 3/4] pwm: Add support for RZ/G2L GPT
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231006/202310060218.5lQtUezc-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060218.5lQtUezc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060218.5lQtUezc-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `kernel_entry':
   (.ref.text+0xac): relocation truncated to fit: R_MIPS_26 against `start_kernel'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x10): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x18): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0x50): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x58): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x90): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x98): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0xd0): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xd8): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x108): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x114): additional relocation overflows omitted from the output
   mips-linux-ld: drivers/pwm/pwm-rzg2l-gpt.o: in function `rzg2l_gpt_calculate_pv_or_dc':
>> pwm-rzg2l-gpt.c:(.text.rzg2l_gpt_calculate_pv_or_dc+0x138): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

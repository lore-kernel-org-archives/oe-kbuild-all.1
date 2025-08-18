Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC9D14AD0D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 23:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755561498; cv=none; b=L7FN+VAEwRAWj0Nwis2ENf4AaL2TnBFAVcD5IFLeIum1UoU4IKserccPSXHaBwroWM7PCRLrfLLENTFznQJuza82ftJSfzOHSW/nkBqiaePNXEDQnRgL8AZGvqK30vClmeYaM0fNblhXPFKJ578FwobdwdnXaSKppm1QkMihsE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755561498; c=relaxed/simple;
	bh=c76ffSU+z29EdjuvcwEaZdMVo1BGLglOk32LHUKT+8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2veSC9Axfq/WttvycZSBkY99fBZw1gIRpXTKrnc7446St2qgdDFtpyhnQZ4DbwjGAwmcQSnf+qF0f4+hgsHTGnjhuU18LJCz55gFEYUzo1YIX1ZQVvgSPt3nKkJtrdBo3W+nOGQiJuXPE8QVcEguTNCmMOom6dlJq2+UjjvNwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKmilf98; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKmilf98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755561496; x=1787097496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c76ffSU+z29EdjuvcwEaZdMVo1BGLglOk32LHUKT+8Q=;
  b=fKmilf98adjpGUkMon4+bp9Hpgt/W0NExg/bbEVEn5TH9kLpSorhzYzk
   mFw/OuEBPG4xsGbjRJyIE0RzM8aqqsnQ14odv0rpv4/wCLXnu5zuNB7u+
   cifVFO4qJ1QTjcVORUP7bfKglaXWNTQPB/Vw1AX1Bo1FS1sa9YSnXQ5gO
   LlqLaJdOW79f3Vc4cX/IBXbxah5ram0xNQESKWjYoghgZDmvywLykFjN+
   JdcKAHCegF134WSlUuDYPiL8UqNQrI7VFr96kxiWf3gaU7gvWdaLRK+g1
   JgeNxMrTZRe6QfZELiJ71Iig2QWeFXwtt3m8vIaAzdu+C2N4p/FVCQAcz
   A==;
X-CSE-ConnectionGUID: OE0L8z1CS1+6wSfDsos6Bw==
X-CSE-MsgGUID: ODna3xTsQqCvrhxg3KHwKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61609888"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="61609888"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 16:58:16 -0700
X-CSE-ConnectionGUID: 8bXpQ/8MRnerAdHif+U/Bw==
X-CSE-MsgGUID: /qIoloXhS5W34Jon6neR7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167934762"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Aug 2025 16:58:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo9js-000GJr-0M;
	Mon, 18 Aug 2025 23:58:08 +0000
Date: Tue, 19 Aug 2025 07:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Richard Cochran <richardcochran@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Qiqi Wang <qiqi.wang@mediatek.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	netdev@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com,
	jh.hsu@mediatek.com, irving-ch.lin@mediatek.com
Subject: Re: [PATCH 6/6] pmdomain: mediatek: Add power domain driver for
 MT8189 SoC
Message-ID: <202508190709.36QIqpVt-lkp@intel.com>
References: <20250818115754.1067154-7-irving-ch.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818115754.1067154-7-irving-ch.lin@mediatek.com>

Hi irving.ch.lin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next linus/master v6.17-rc2 next-20250818]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/irving-ch-lin/dt-bindings-clock-mediatek-Add-new-MT8189-clock/20250818-200449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250818115754.1067154-7-irving-ch.lin%40mediatek.com
patch subject: [PATCH 6/6] pmdomain: mediatek: Add power domain driver for MT8189 SoC
config: arm-randconfig-001-20250819 (https://download.01.org/0day-ci/archive/20250819/202508190709.36QIqpVt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508190709.36QIqpVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508190709.36QIqpVt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/mediatek/mtk-scpsys.c:219 struct member 'sram_slp_bits' not described in 'scp_domain_data'
>> Warning: drivers/pmdomain/mediatek/mtk-scpsys.c:219 struct member 'sram_slp_ack_bits' not described in 'scp_domain_data'
>> Warning: drivers/pmdomain/mediatek/mtk-scpsys.c:219 struct member 'subsys_clk_prefix' not described in 'scp_domain_data'
>> Warning: drivers/pmdomain/mediatek/mtk-scpsys.c:219 struct member 'bp_table' not described in 'scp_domain_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

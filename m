Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCB1426EA0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 17:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979803; cv=none; b=HXRprOOSvULINN/+3t3WVek9+yGMgUNYDqCNaQYY+OfB+pqBUPQW9FHn+lFSLkps2k4acauu5lsoBs6Tx+rnZZf+DylUGETrPolNvPrwvD3Mnbsqo91AK5uzSuGmPxR9rYBxahVW5EAsDq7fGjSMqjBx2JDkHZ59bqIcjn7CQ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979803; c=relaxed/simple;
	bh=TcZWBzzpqTS7aPD+ZnOCeM/2iUYCY9wQrFL9paJkYx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFSyb/KjQQ/VMEP5UG8J0V3rIF4TZwkMN/e4WblmMDej8KQImV6z6VCr1VlV3yJEw+lzBLmuu73JlIDee46zzXauc74eyoX/OjojF8UuTvZIQ3l07u/5gjvdxhyfautPakMg0XkTuKplNClpSecvG5HmdX+2rt4+tsLDwdl36EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRzGRS/c; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRzGRS/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774979801; x=1806515801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TcZWBzzpqTS7aPD+ZnOCeM/2iUYCY9wQrFL9paJkYx8=;
  b=cRzGRS/cezPGrGogxLWnNqwrP8TiQc69+vgpwEHJXbVWyHE2k5dmQUHC
   jB/pYHymDpfxOjevJ2Dnhvi2w/x1APMoHWmx39YRx6EHw8lxPdt8Y61lB
   VDaujUsRTw+5XSesrPemi0fXKeJ6TmcUQ7iF/1M/+jU+xGel3887lxYL+
   YHC1TIz/NGGoQL0SQoiU/AZVDNfBkL5wXu0eZ5JLYYWjXGpdemxmGXHLR
   ZcTNneKWCMiTAj6dN6a9e268OJYkBvYahw5TOEZmLa1iEgbBjjfuBL0yx
   K5yy/ZYCIMXXybnM6H4a6Fa4BgE659HmOU2v6p3hTSwyDj1teEq90QUoY
   Q==;
X-CSE-ConnectionGUID: PN3snA5NTfqlAB9sHlaH4A==
X-CSE-MsgGUID: 4MZEbKFzQWiLOnK49fEpgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87078492"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="87078492"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 10:56:40 -0700
X-CSE-ConnectionGUID: vgGp7BthSbC+6Z49GyWWcA==
X-CSE-MsgGUID: z3szsMWpQeymP90If8fszQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="230501581"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Mar 2026 10:56:33 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7dKI-00000000463-3PEk;
	Tue, 31 Mar 2026 17:56:30 +0000
Date: Wed, 1 Apr 2026 01:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 7/9] regulator: Add MediaTek MT6392 regulator
Message-ID: <202604010103.FzAGRPye-lkp@intel.com>
References: <20260330083429.359819-8-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330083429.359819-8-l.scorcia@gmail.com>

Hi Luca,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on broonie-regulator/for-next linusw-pinctrl/devel linusw-pinctrl/for-next lee-mfd/for-mfd-fixes linus/master v7.0-rc6 next-20260330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Leonardo-Scorcia/dt-bindings-mfd-mt6397-Add-MT6392-PMIC/20260331-081127
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20260330083429.359819-8-l.scorcia%40gmail.com
patch subject: [PATCH v4 7/9] regulator: Add MediaTek MT6392 regulator
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260401/202604010103.FzAGRPye-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010103.FzAGRPye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010103.FzAGRPye-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/mt6392-regulator.c:181:18: warning: 'ldo_volt_table1b' defined but not used [-Wunused-const-variable=]
     181 | static const u32 ldo_volt_table1b[] = {
         |                  ^~~~~~~~~~~~~~~~


vim +/ldo_volt_table1b +181 drivers/regulator/mt6392-regulator.c

   180	
 > 181	static const u32 ldo_volt_table1b[] = {
   182		1500000, 1800000, 2500000, 2800000,
   183	};
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

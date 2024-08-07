Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4EF3A1C4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 14:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723042114; cv=none; b=m0k2pGH8f6/8NW/ESacvTY+w6r9CzKlp3XAl5/HTSGLeOoUABK0DlDhJ71hx/DM/Nr73Oa5vcdRxFZaUdeBjq3NpmfZoqOkCKUSNLxFhyW4z9XBsWhXQ+1ZRLDACQtTSDWX30yTKpZ+K3FS35X24YsNT7Qc8P+lN1RHI25Hm6vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723042114; c=relaxed/simple;
	bh=yIVbjV1GxHDA1w8dOjXoM0Sg9vky/Uk1JEiXPbunnyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FX6MYwimg1ueQIjUkoIjDqiop0bCWWxqx9obVaXBE/0/LuYt2lrmFcQeL/6pG7ptkAbSMzSuYrLqsXQ/Vjj6ZnTBtS9RPzmeGTHvBsVTlKqONtvVTCksqIwHDKns8ofETOhF12aTkCJ1sSvXOkWb14mOC4O3X3CHek5QF2qvO4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nS+j/luP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nS+j/luP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723042113; x=1754578113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yIVbjV1GxHDA1w8dOjXoM0Sg9vky/Uk1JEiXPbunnyc=;
  b=nS+j/luP3sBIvbEKP7k8laAKTjRxmmU43fwf1t0ALRtgzBtk2mMhA/cy
   HMlM2HuyWitD7fH2KRZShdArZHYK7i3hCBjDrp+6EqnuHRNtQ8M/466HV
   3b9G4MKN9jqnnFla0lsfp1k46EyvJcgqIEezETy4p37xT6yCaR9LmkTa5
   yb8MIFSPZc9K+0c9gxkuzfAVdpBxpQ49bZ4OgQYUajuzf+6WOGiNQe9Sh
   dfDm71S4fuzGYzIn1E2XxzdgJGSQYp0GziTu+xoWVsnfzoDYw8k1EAgBM
   ztp7zfA/xAl+V9m1yRsnor3gDw7XVXlpU+WDW50Hw16WpubAs7FTgRjR9
   w==;
X-CSE-ConnectionGUID: P2Z8ZfApSB6+5+oL+rkVEQ==
X-CSE-MsgGUID: 4brbVVnxSJG0FJDHLXzL3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="32506678"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="32506678"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 07:48:32 -0700
X-CSE-ConnectionGUID: ysMuAww8SeyIjeouu9Ntsw==
X-CSE-MsgGUID: yEuW0fUMQ4yvnhHnk3ASHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="56821640"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 07 Aug 2024 07:48:31 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbhxg-0005TI-0H;
	Wed, 07 Aug 2024 14:48:25 +0000
Date: Wed, 7 Aug 2024 22:47:44 +0800
From: kernel test robot <lkp@intel.com>
To: Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Abel Vesa <abel.vesa@linaro.org>
Subject: [krzk-github:wip/debug/soundwire-wsa884x-interrupts 29899/30000]
 drivers/clk/qcom/videocc-x1e80100.c:106:32: warning: 'video_cc_parent_map_0'
 defined but not used
Message-ID: <202408072246.EXADaF1k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/debug/soundwire-wsa884x-interrupts
head:   77aa965762ad9c8711d005628b5c471007e0df82
commit: 7c495ed7ccac8963ac2d25b151f505a7b7d467e3 [29899/30000] fixup: clk: qcom: Add videocc driver for x1e80100
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240807/202408072246.EXADaF1k-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408072246.EXADaF1k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408072246.EXADaF1k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/qcom/videocc-x1e80100.c:106:32: warning: 'video_cc_parent_map_0' defined but not used [-Wunused-const-variable=]
     106 | static const struct parent_map video_cc_parent_map_0[] = {
         |                                ^~~~~~~~~~~~~~~~~~~~~


vim +/video_cc_parent_map_0 +106 drivers/clk/qcom/videocc-x1e80100.c

5bd6442e16cd34 Rajendra Nayak 2023-08-01  105  
5bd6442e16cd34 Rajendra Nayak 2023-08-01 @106  static const struct parent_map video_cc_parent_map_0[] = {
5bd6442e16cd34 Rajendra Nayak 2023-08-01  107  	{ P_BI_TCXO, 0 },
5bd6442e16cd34 Rajendra Nayak 2023-08-01  108  };
5bd6442e16cd34 Rajendra Nayak 2023-08-01  109  

:::::: The code at line 106 was first introduced by commit
:::::: 5bd6442e16cd347ac36f16bb9c11da32ef49862d clk: qcom: Add videocc driver for x1e80100

:::::: TO: Rajendra Nayak <quic_rjendra@quicinc.com>
:::::: CC: Abel Vesa <abel.vesa@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51B34F218
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 05:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947079; cv=none; b=YDTOTisJCMbZlcd1BGeHmQFC8hIPVXOGo7eJybZkClH9rl/dCeL17o5mmpfHFYJHTXoXTKNZRX/YNfV+9HYUL6I/4Hs4HbL7WlXYOJVr1NwO0mmrb7W34YxWPdRZZ8TsubjJ+iPZ8+FeGAWeZSHHia4bP6txptVL5gqdQSHSOtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947079; c=relaxed/simple;
	bh=seWdq8dm07SbMI/2WFSAs4KaYtGqCQJ2ko+fto/SMYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X31Q32+aqL8Guaaea7nXoXWXfx/N3rkVCp6gerzp+2yfkEtRW94exCrDqdTUBtX1pipNWyYouN1WuhG8KBSH9Tah2GF6cC8HGrUvMVXjy2XIzk4jQ9IOP0akVcPbqDhRP/ShT3WgKX+Wm9/Z77u4NgBAhWlqfkDUxU26scwNMD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+mjbr2/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+mjbr2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725947078; x=1757483078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=seWdq8dm07SbMI/2WFSAs4KaYtGqCQJ2ko+fto/SMYQ=;
  b=Y+mjbr2/wlHokVb8whla2ZDX0FjJlsVImwk8kxdRyGP6Z1BljIgTF1lG
   kxhXv4HjGg+comRReEz58S/smtPsuJRnczHLTruKbYjHzBJ3HHmEsqugp
   RX1wE5mp2KeSwRN0CRAl/SWZVdQ4WRUGN3WJD5iQ1B958uGmbSzAuprNK
   aZKVGVeJTCxKRkX2s5uj5ku53Yeuo3g4wHRqLOxiIqDsYsiohQvqCZ8SW
   jl/bT6ueaXAmUOAxqMQfvxeoEk7+7288YKI/0i17RAV26e2KWqRbRX8In
   +GkukPE7ok8+MwYZyuADm4/XqfA1AuL/wO0oCgPicO5AJiAhbKWojn6E+
   g==;
X-CSE-ConnectionGUID: moPPezYuSDyj5HhGeUTQIQ==
X-CSE-MsgGUID: XXWbrP4MRdKErVV33AQgBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28413705"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="28413705"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 22:44:37 -0700
X-CSE-ConnectionGUID: VEF1w7e+SSu2eUeOGK3/jw==
X-CSE-MsgGUID: ZMkx8mD/RQGIiCdYxgVkbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="71691521"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Sep 2024 22:44:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sntg1-00007p-0u;
	Tue, 10 Sep 2024 05:44:33 +0000
Date: Tue, 10 Sep 2024 13:43:39 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip 2/10] drivers/soc/renesas/pwc-rzv2m.c:124:34:
 warning: 'rzv2m_pwc_of_match' defined but not used
Message-ID: <202409101320.Ut4ZVybU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   d5cc54849a0b793a2413dcd5f31b45d9907066ab
commit: eec8287bdd56aedf04eb40e2a3da5482ac379f04 [2/10] soc: renesas: Add PWC support for RZ/V2M
config: i386-buildonly-randconfig-001-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101320.Ut4ZVybU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409101320.Ut4ZVybU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101320.Ut4ZVybU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/renesas/pwc-rzv2m.c:124:34: warning: 'rzv2m_pwc_of_match' defined but not used [-Wunused-const-variable=]
     124 | static const struct of_device_id rzv2m_pwc_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~


vim +/rzv2m_pwc_of_match +124 drivers/soc/renesas/pwc-rzv2m.c

   123	
 > 124	static const struct of_device_id rzv2m_pwc_of_match[] = {
   125		{ .compatible = "renesas,rzv2m-pwc" },
   126		{ /* sentinel */ }
   127	};
   128	MODULE_DEVICE_TABLE(of, rzv2m_pwc_of_match);
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

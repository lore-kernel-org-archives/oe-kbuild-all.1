Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2B56A01E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725977927; cv=none; b=ZiTBbhP6JqF4d55gQXaYuSSVAjLPF0cSmYVNVELCq6Wngf29E90d/bF6R2qPnQnaD9mAcvhKdHidXGc1Qx35B5xpm+qYUYIo82PfA6nMDgFQnl2FP0f1mz4wHrYnRgaHFYv3cWZIt4nNkRtbN7yPWWiBs+Ry+/AiM9XdshgX9q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725977927; c=relaxed/simple;
	bh=R/7FsZCnH3nZyrmQFI34PC06V1MLrOkOzaVfwenn5s4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ek99SUqkljmuhZZQHINdxTMRWDqi/IHHJv1s7irDCVB/JGpzKCQA5NKjbINUFekC7DAfu5ZCwVPByHuFfDvVNMeOTTTVi4+OmdLXQ1ek51Bmu8od/9QSGKwuvvDOOFw3ff97q4mNmF6n8HeNDXTt/hBJQGnE5ru0cbFXJS1O5Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBORWP7E; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBORWP7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725977925; x=1757513925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R/7FsZCnH3nZyrmQFI34PC06V1MLrOkOzaVfwenn5s4=;
  b=oBORWP7EJNsEcxMQ/TKWs+LIYuBA60WlYoaT1ShftoUtAjTG8YXqznnI
   u1WNfSb203NpyNR5d7r+WDxXsjWJzkOcOH8hi17wUzZe0xYJ+6hN3GjXK
   DEZ0j9HDYd6wIHo2lJ3Fwi4YFXwWcrHPFcHdBOZU1yTDgCgBpAhFmSIka
   G9CQMVXQiONJnFmt2hvlHdicwNaFoA9l1k07B3s5Ju0HL5H1J0Cd1v3eq
   R4zr5/qzCs25Kfj+EwfZ9ooXap/AjyvQ6SCGZ4UgnVrVr7gisW70k/Tq3
   a6RcRzSnquUCKv7Cp7jWEvYDeif1WIgndJONznNTpkTZvl2eGBRL+T02T
   w==;
X-CSE-ConnectionGUID: iWYR8TIvTh+lUpK7xP/yCQ==
X-CSE-MsgGUID: FcbGQNd3QNS6ECTWELTx2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24271276"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="24271276"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 07:18:45 -0700
X-CSE-ConnectionGUID: 1cA/fUmySfu01DTSI/23yQ==
X-CSE-MsgGUID: VKQvY3/GSuuardpEPciJkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="67565050"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Sep 2024 07:18:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so1hZ-0002C7-34;
	Tue, 10 Sep 2024 14:18:41 +0000
Date: Tue, 10 Sep 2024 22:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip 18/31] kismet: WARNING: unmet direct
 dependencies detected for ERRATA_ANDES_CMO when selected by ARCH_R9A07G043
Message-ID: <202409102233.q3w8K4ER-lkp@intel.com>
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
commit: c868ba37129f941bf55e6e20fd666f1bc3a27ad7 [18/31] soc: renesas: Kconfig: Select the required configs for RZ/Five SoC
config: riscv-kismet-CONFIG_ERRATA_ANDES_CMO-CONFIG_ARCH_R9A07G043-0-0 (https://download.01.org/0day-ci/archive/20240910/202409102233.q3w8K4ER-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240910/202409102233.q3w8K4ER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409102233.q3w8K4ER-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ERRATA_ANDES_CMO when selected by ARCH_R9A07G043
   WARNING: unmet direct dependencies detected for ERRATA_ANDES
     Depends on [n]: RISCV_ALTERNATIVE [=n]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]
   
   WARNING: unmet direct dependencies detected for ERRATA_ANDES_CMO
     Depends on [n]: ERRATA_ANDES [=y] && MMU [=n] && ARCH_R9A07G043 [=y]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]
   
   WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
     Depends on [n]: RISCV_DMA_NONCOHERENT [=n]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

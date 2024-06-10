Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C3E85285
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 13:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718026190; cv=none; b=SI9W6piRwkROH0ODeHzVtqy+kJUmU4pLR8/TFk+C71EP2wNV1e8oBZglCn8vvDhw/a87GgSlzEKLDqyto8coHtZiyxaWXlr1CZM8bD47RO9Z49I6Y2dt75ER0bxPCrKil+gcuNBORGbHd1n0KMxNH4QZ8dEC+Tf5LJAOtVfIMHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718026190; c=relaxed/simple;
	bh=p+XS8HhDiCtvIHu07cwXF7Szu2aHd1FBlxSmgsXcjcA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gbt3nhBBbFCtn0XPwu+qIV91XwCOPRwMGVySeyFHm4pqub6vjaxqTEr3DWlaIT/Zlor37f6YWAUYYJDesCROaV3PfbqVlCy6TNgtQqhhVFzwMFX71Z5TkI6EZ2Ap6+EODxguVA4sx1SXBtK5NJapL5VoXfDE5wYLvXrc4xIpnVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iN5BrxpM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iN5BrxpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718026189; x=1749562189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p+XS8HhDiCtvIHu07cwXF7Szu2aHd1FBlxSmgsXcjcA=;
  b=iN5BrxpMmHxH35pKTKHHKXfyV2LR9rQnkCewIfBqREGT3rOljCehyONP
   NiOmALw3t8KppZS0MGeI4BtJk15x4rRwPFfhr5jGwZVK7uBCmT4Pp/wz6
   8ueuCAiuCNDGcjzsuzU2fcmaZXDeYA4TYiTb/ChVduWprXQ0jL80mx0ot
   JwQGWzK4sbirwR6T8WRWgpR7T9XRzHx9yCQTB9MJYg77wOX7WjC1svNIx
   5iLFlEevVvitxMPqHtdFZz8TdUIess2xhln0HpuB8OHkrBl+4kZn0Cwkz
   O59Rj2uBLc7YDXY3JJ/bjYxgPFe9cVOqpwfj4tljxtZPhn30cXfAPdHXQ
   w==;
X-CSE-ConnectionGUID: sFRNFuqLSvmf90KgbJDZTA==
X-CSE-MsgGUID: m7PRes8iRu24Gj+25w7W2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26086707"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="26086707"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 06:29:46 -0700
X-CSE-ConnectionGUID: 79cb5hgrQOG2PtB0zsM2dw==
X-CSE-MsgGUID: ErJag2ajTOayBmz5ihI+5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39151399"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Jun 2024 06:29:39 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGf5d-0002AZ-1c;
	Mon, 10 Jun 2024 13:29:37 +0000
Date: Mon, 10 Jun 2024 21:28:40 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip 14/39] xtensa-linux-ld:
 drivers/irqchip/irq-renesas-rzg2l.o:undefined reference to
 `platform_irqchip_probe'
Message-ID: <202406102140.k9w0LSfX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lad,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   9b6b51fe8dad7c7e6e091bd99901171e42b1b80c
commit: 1a976563ab48d0c37e7ead6ec20f2c85bc094cfe [14/39] irqchip: Add RZ/G2L IA55 Interrupt Controller driver
config: xtensa-randconfig-001-20240610 (https://download.01.org/0day-ci/archive/20240610/202406102140.k9w0LSfX-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406102140.k9w0LSfX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406102140.k9w0LSfX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: drivers/irqchip/irq-renesas-rzg2l.o:(.data+0x0): undefined reference to `platform_irqchip_probe'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

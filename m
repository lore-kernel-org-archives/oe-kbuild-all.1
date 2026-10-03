Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35792DECC2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791044444; cv=none; b=ko7M+IHkQX/C7dovg82DDS5WjWvhqYwSNTdAAEk148yI8/LT+TrXFDK72eAs3ed834AktOEAQzfXUYmZFukZ+OjxmSlRnvpJPDq5sssCejota+M+60wQu7wI7jLRduNKfctZinHFH2/RVXQ284LmgoZte1lGFug1K82J5ZWP6lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791044444; c=relaxed/simple;
	bh=S7nJQ5MtfSRC8dm5dEjai80uxjoKX4Kuxrsg9rgN8FM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dWYSEx6KU9c39r8y/tsXVwbD/G2Zqm3ipp+9yQlZah3junl4UAyd8BkXp8+ADxGoPqAHYg9Win8yUJB9mi1lFGXheOyAMydeEoMhu3hoNdxY92HFDlFayCfYe5zy3v5ez6nkioskhA/HjDruNz9CpItQFsSXil4lbzhX3Sbp8d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oun2GEcE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oun2GEcE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791044443; x=1822580443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S7nJQ5MtfSRC8dm5dEjai80uxjoKX4Kuxrsg9rgN8FM=;
  b=Oun2GEcEvES/nERu6tB0BKk0zFWjTldCQ95HLPLBdDUGk4J+s484Gpgf
   t0lHAAFFWm86+m35JqFHgG7pnllU8TitQaNJRsbhrCzmWa4iMc7uCnS0Z
   pZtTGOFIMAQLLg/YFHvikAgGP7+QS2OfdEWMTc+Y5uDtmEpq15ZbGaIPp
   g856fyc5v2SIvsu4vrLPU2dgfldoPQHhVa+t9APPV6nQtyzwjf4CvAwrw
   BxNO5mLis4y0y5W9ZaQAdiJG68XaH8TH9ySiSCUEfBdSXqTj5YrbzK5xT
   +Ey+n0BivbcLYewIAp4/yk+GxEfMC5cSBAQkk1Z/Qguh2tfoeiGYHnf6C
   A==;
X-CSE-ConnectionGUID: +E6xgVcLQP6Wf00icUSB7A==
X-CSE-MsgGUID: zaZxjG8mQ4Kh2MIlNwj0Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91885729"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="91885729"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 09:20:42 -0700
X-CSE-ConnectionGUID: KHNyVgizTIuySwwczAW9mA==
X-CSE-MsgGUID: 2cC4SNTsRyavf1WqRv4puw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="275989038"
Received: from igk-lkp-server01.igk.intel.com (HELO 2bff737dfedc) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 03 Oct 2026 09:20:41 -0700
Received: from kbuild by 2bff737dfedc with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xD2TV-0000000003b-2awD;
	Sat, 03 Oct 2026 16:20:37 +0000
Date: Sat, 03 Oct 2026 18:19:45 +0200
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 77/142] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202610031836.3UoCiTFM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   7998b6e929bb20ed66acafa33720d8e3533e1598
commit: 4fa1d7e70e05f781c1e9a1876619ad78b3297e19 [77/142] zx29 qspi driver
reproduce: (https://download.01.org/0day-ci/archive/20261003/202610031836.3UoCiTFM-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#427: FILE: drivers/spi/spi-zx.c:300:
+		switch (op->addr.buswidth * op->addr.nbytes) {
+			case 1: ctrl2 |= (ADDR_BYTE_WIDTH_8 << ZX_QSPI_ADDR_BYTE_NUM); break;
+			case 2: ctrl2 |= (ADDR_BYTE_WIDTH_16 << ZX_QSPI_ADDR_BYTE_NUM); break;
+			case 3: ctrl2 |= (ADDR_BYTE_WIDTH_24 << ZX_QSPI_ADDR_BYTE_NUM); break;
+			case 4: ctrl2 |= (ADDR_BYTE_WIDTH_32 << ZX_QSPI_ADDR_BYTE_NUM); break;
+			default:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

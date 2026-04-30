Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0991E46AF21
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 16:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777566832; cv=none; b=StG2u+zFPs/GySup3iUno71NRo0hJOSHpJbXGKqACRvFTw0Ir4r3m3ytnQ+72peK4xz2sgMsrUXdznBUvfYwh4JUT1VoByyec1MqBjahyY/awUpp9KlbpfcDEkwsuXbk0qvjA+N2M2+TVxfiJpZrxqduqyPQfiyiim06/tUZK10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777566832; c=relaxed/simple;
	bh=8xH7hRhs9Vho/xztP9JqjMgYbeNAvmMTQcdabrGOVJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NdAgWa+SQeidNBAkYMECYZ8p6bWUJRHic6Jwp9Q3g+7OkrNYiSxUmPxwllQA9pPlGhb41ScObijVYrOPjH3K/nlM3leuH3E6OcsGtoPU+BB2XFmmv8GesdvKtFfGo7rauH0e7No+3GsVAM/NaMgVeSysr/ZLs90yOZOaSM4qV6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1isOGyy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1isOGyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777566830; x=1809102830;
  h=date:from:to:cc:subject:message-id;
  bh=8xH7hRhs9Vho/xztP9JqjMgYbeNAvmMTQcdabrGOVJ0=;
  b=a1isOGyy2ykWbl/d0QrSO49GRcbeSAo++PGYKAvUoDJjV38d/IVAp5Ae
   H6IZAtycIDEDl5tKsG/dtKeLcoDzd+tKbgNuGjHZbiwgoFLS1g4mNN6Va
   Jz/UiT8heilJe+0wKmPhV5vYnjjaFJXS5q0QS5EuDo+qhuwdl2KKa1e4p
   +vQjewdRa1TO6PeJ5pq/QFmorjXPOWh8h3MA41sGTRkloxunXTFenZFIQ
   VLLApB4PqXjzWIK2nZaH4LmoRBrR5+q4lPeY+YmXxc1HLG3fb7qWf6ljm
   CQAPtqXm9HoFJ5ritdEoLVrtH09e67MmXz1SweIRoLo889OFxE9Thvbew
   w==;
X-CSE-ConnectionGUID: omtRIvw8S96MNMhxD2nzsA==
X-CSE-MsgGUID: ROv+EtB/Q4aDm6x6M+9Q2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="103978629"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="103978629"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 09:33:49 -0700
X-CSE-ConnectionGUID: +qDk2NFVQSipt8ZPFNLLhA==
X-CSE-MsgGUID: 3bx6JJ2iS/eTbbYIhSnIiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="231981724"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Apr 2026 09:33:48 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIUKf-00000000CeY-2iQ2;
	Thu, 30 Apr 2026 16:33:45 +0000
Date: Fri, 01 May 2026 00:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-mt7622 0/3] Warning:
 drivers/spi/spi-mt65xx.c:178 struct member 'sample_sel' not described in
 'mtk_spi'
Message-ID: <202605010054.pWOKHrwq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-mt7622
head:   d8b6134553d0f268ed594061eba808fcb51257f4
commit: bfb8794f7ede7c2f2ba6e98c981a4b75a9e8b613 [0/3] drivers: spi-mt65xx: Move chip_config to driver's private data
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260501/202605010054.pWOKHrwq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010054.pWOKHrwq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605010054.pWOKHrwq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/spi/spi-mt65xx.c:178 struct member 'sample_sel' not described in 'mtk_spi'
>> Warning: drivers/spi/spi-mt65xx.c:178 struct member 'get_tick_dly' not described in 'mtk_spi'
>> Warning: drivers/spi/spi-mt65xx.c:178 struct member 'sample_sel' not described in 'mtk_spi'
>> Warning: drivers/spi/spi-mt65xx.c:178 struct member 'get_tick_dly' not described in 'mtk_spi'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

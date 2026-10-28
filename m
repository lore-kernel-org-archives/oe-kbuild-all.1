Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793177082;
	b=pUwZRxwJK/D66FobpEAma2SkGHqHdDSK+koWyfCQ4RwPAh+RqueDzxHj0j76WOwIxaP4
	 SEEHrTeDBG/AOWcOVyGp7etyYJTV/URgVui/N/g9gmoRVA1sTzmx74qoksenTFkJx0a1R
	 Z8snXZwdnE2Km9dFvmNZ30u7HG/BIeZS0fJgaM880eKYMVcdEkaRu/hWB9JU+FUHQLioq
	 +RmRCGoF4+Pg7FrENA8GrS1FAzc0WYWdcQxCOSf8gSqBqt6Tn58W4BJm/bdcixCgsnRoa
	 D6OsxBh4rIwTC4uH2FtgOUxTrFzWV5a/VdubI6tYRPkSTa3+4m3eTFYoFKTTfJjf/dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177082;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=y3PlirNwDyDuZU8D+ZMXuv/LtUxRnzt99w/RtdOZAvU=;
	b=q7hzwwrSyfi3XMvTnjuiJZw6PelBl88UWwAH0cevoewiaYV8iixcve85EStsZTSeftGp
	 v9xx1S70rxE6W4rOkIfSULmiFmWcCo+RqfazQswfGfb0B+7HGsG0GSdF3q/IrjjxdBuCx
	 5iMoWw1J3tgborGaW9rufNFgzHqdl3+TqBupgzMsFtziktcISUvGyN/5KupBNX6IRfPcl
	 0hloISJgSKnWMqqw46rCC4VzttArNEswnWPk1ADS4S+Z+MZgPdu+KgZ1wcj3bQAT17ret
	 0lve1luYkLz2fJy+lwD9EpH4qe/i2DUE8o0Y72HcEUrloXLfeGzTUGCJTlsjPru+GTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FBLVqKYf;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5887606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 08:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5887606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FBLVqKYf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793177082; x=1824713082;
  h=date:from:to:cc:subject:message-id;
  bh=JxL95t9Ekr+ATmAgsvzwSeyereFKMDVSJsh9rREVwiU=;
  b=FBLVqKYfkQR584GhUfwFOyDqUQhFSgDyz6zYctgg6nUoEJbtT6Uc3G/k
   rC5WiZwY/hkCey4zcSGdnXTazaedny8n00ZOZdCJ6vWARsJDGhal3C5mH
   8XLWBgkdXenDHFrLjLF5Gcjmv21/YU5exIuxYLrgBYlIZwQOb0nXlLzaV
   hsItUmKaQ68GsBCw2C7WSvi35Nz0bGatVGUA3tzvhhTf9FluXK4fH/5C2
   ZE6SzR1/Qxf2QToWjGZVN5Xm7GzVG2v8oJ5eTo52DDBNyrbkn1N+csQEp
   AK9xKc6lrKPi8t49XMn4OYE4HBIhj07zGbDfOdbqpWUiACu0YLPcGcXOl
   w==;
X-CSE-ConnectionGUID: 7jZcf1hzTvu0WGRZ5SASvg==
X-CSE-MsgGUID: +MFXrfcwT9WRFQCnLUaSEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1799321"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1799321"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 01:44:41 -0700
X-CSE-ConnectionGUID: RQiodzc8SISF92jyLzKjFw==
X-CSE-MsgGUID: ieFFQBYCR+C8nqwvsxYiVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5126209"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 28 Oct 2026 01:44:40 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLzGu-000000004ox-14et;
	Wed, 28 Oct 2026 08:44:36 +0000
Date: Wed, 28 Oct 2026 09:43:50 +0100
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-10-28 356/356]
 sound/soc/soc-pcm-dpcm.c:1962:27: error: 'dpcm_fe_debugfs_add' undeclared
 here (not in a function)
Message-ID: <202610280926.DyNLb66Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-28
head:   2c12c77b79ee23bdb76491d35cb04685b999c968
commit: 2c12c77b79ee23bdb76491d35cb04685b999c968 [356/356] ASoC: soc-pcm: add debugfs_add() on rtd_ops
config: nios2-randconfig-2001-20261028 (https://download.01.org/0day-ci/archive/20261028/202610280926.DyNLb66Y-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610280926.DyNLb66Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280926.DyNLb66Y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/soc-pcm-dpcm.c:1962:27: error: 'dpcm_fe_debugfs_add' undeclared here (not in a function)
    1962 |         .debugfs_add    = dpcm_fe_debugfs_add,
         |                           ^~~~~~~~~~~~~~~~~~~


vim +/dpcm_fe_debugfs_add +1962 sound/soc/soc-pcm-dpcm.c

  1958	
  1959	struct snd_soc_rtd_ops rtd_ops_dpcm_fe = {
  1960		.new_pcm	= dpcm_fe_new_pcm,
  1961		.new_compress	= dpcm_fe_new_compress,
> 1962		.debugfs_add	= dpcm_fe_debugfs_add,
  1963		.open_dynamic	= 1,
  1964	};
  1965	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

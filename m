Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC201EA7DB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Apr 2026 01:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776906109; cv=none; b=WnXy3tP4miBhE+ATDw94sOw+zJjis/MQPY+JFwCP4DTkJNkC+wzER24nU/wR3agBfCirCiAnEQiFxkrcsP2NUrIBn0CEgIFftrMIV+tZknwrZKxV8xHJwvDSh/6KG0sNT7pkHHQOjCSX7wsTRiDn6tnOxdTEadgw/QYhxCNdmG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776906109; c=relaxed/simple;
	bh=lyWioS5iKXDltEZ99wCMfGO+IOlug6PIt0fedoRX0Gk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nQzeekfxdHYcjHAwQL6IHvMHq/kGHeKIRVJre8Ce1h4DDf6IAY1BkfCb2uzlyIkxSpb/lIdGKbPHnqA/DXei8f+BiV5Eu9GxkfgLS89wrXAYbF9zyV5Xl3L41G9ttj6VP7OV+h0juyjaV/tEbCII5dJFatPaCEfFDNFYKp4Bc+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3DSQB1K; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3DSQB1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776906108; x=1808442108;
  h=date:from:to:cc:subject:message-id;
  bh=lyWioS5iKXDltEZ99wCMfGO+IOlug6PIt0fedoRX0Gk=;
  b=P3DSQB1K+OqqcCnV9ne9nql59DcRvIGMiQ1BhD2pab9BAlOAXmt/Gu9P
   lFwWYSfUO8rbGOQl4wemX9rSuh8HtglXA8EZrSV8VcXFne2HWlFITaUas
   jiRj6EvBivOjua5NFeBANmb3L1kWfnEAH9TRELiEdGI2SFff0XJSg/cyg
   sgxZs2XWsiuHN2EbRJ5KcceUk86r39FM0WdaYlR3/kCSD7psSCbxUQKZ7
   zcjcjxvsUQFMpRENjZCsqTLXw6H0ltXzR0Pag2WNUdRatt5xv9Zyyjc0B
   Gq2ySGhjW7/Sq/s+ig6+oEbFABNLKxTYMdJm6qFgLy4zx5SyNQcBZJ/E/
   A==;
X-CSE-ConnectionGUID: wtwpjOVYRoeP1yF1pFVT/w==
X-CSE-MsgGUID: DkRxil3YQPKbw6PTjSZnPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77931576"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="77931576"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 18:01:47 -0700
X-CSE-ConnectionGUID: IrgAqQD5RQWfxZ5uo+VPxw==
X-CSE-MsgGUID: d1OdM0g/Txa0EA/AErMjTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="231623471"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Apr 2026 18:01:42 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFiRm-000000001Gx-0Ia2;
	Thu, 23 Apr 2026 01:01:38 +0000
Date: Thu, 23 Apr 2026 09:00:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-04-20-2 147/147]
 sound/soc/ti/n810.c:287:20: error: 'snd_soc_card_driver' undeclared here (not
 in a function)
Message-ID: <202604230845.vlboVpd6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-04-20-2
head:   1604ab9b37c0f7145cc187f24e3aca5b4e318eb1
commit: 2307ef10ca1bc4e93bd613bc369b2322d421dede [147/147] ASoC: soc-core: use snd_soc_card_register()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260423/202604230845.vlboVpd6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604230845.vlboVpd6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604230845.vlboVpd6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/ti/n810.c:287:20: error: 'snd_soc_card_driver' undeclared here (not in a function)
     287 |         .driver = &snd_soc_card_driver,
         |                    ^~~~~~~~~~~~~~~~~~~
   sound/soc/ti/n810.c:272:35: warning: 'snd_soc_driver' defined but not used [-Wunused-variable]
     272 | static struct snd_soc_card_driver snd_soc_driver = {
         |                                   ^~~~~~~~~~~~~~
--
>> sound/soc/ti/omap3pandora.c:223:19: error: initialization of 'const char *' from incompatible pointer type 'struct snd_soc_card_driver *' [-Wincompatible-pointer-types]
     223 |         .driver = &snd_soc_card_driver,
         |                   ^
   sound/soc/ti/omap3pandora.c:223:19: note: (near initialization for 'snd_soc_card_omap3pandora.driver.name')
   sound/soc/ti/omap3pandora.c:220:65: warning: missing braces around initializer [-Wmissing-braces]
     220 | static struct snd_soc_card_platform snd_soc_card_omap3pandora = {
         |                                                                 ^
   ......
     223 |         .driver = &snd_soc_card_driver,
         |                   {
     224 | };
         | }


vim +/snd_soc_card_driver +287 sound/soc/ti/n810.c

   283	
   284	static struct snd_soc_card_platform snd_soc_n810 = {
   285		.name = "N810",
   286		.owner = THIS_MODULE,
 > 287		.driver = &snd_soc_card_driver,
   288	};
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504674;
	b=KB9nw3dnQBrn/QpS9iA2NjdBshv6WZ3tSGZq91QyF3baFZBoCJiuWwZ3lcVTLqFhipeh
	 R2YPXdn5KLJP0+o/HJSL8kXRyqNrgTJ0zaVAUP00ThKvrp5xyj4WRh0FNF74B8dPXaVqN
	 OEUok9IabfXrUo6ZEOcMoIOT082I4y8tJEMhfrprIWqvjCQTcxGHkUNhUBQzPMnIWh6Qs
	 YFPgOW+fjJxes/ToIUOfjaxkt3Iw1FGX+P1rq3DB5jfOx7QZ9rCdlCERCrRMnUqK/d0yX
	 hQB78319gfctvDFUS4RM6jS0jxmOkbNLmn38fyPK1FqOAM9k9ftmYfQTorH2SfN8d+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504674;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Ze0j81C68OaqxuP3uv6HKwihgXRE5yWXqyYqjfPb0mg=;
	b=2Mg9xPE4nsq4VQrCpV+BABVDFeHEi50E5Y0c/NNmNEkLfiMvbMR5inF4ftzraaHeI+5x
	 CF31zJqtOl5Kbb/tSjR6ta4CfDRq+v3Al/Oqlbn1CtSQcx5NauR1b9CzFmaN/Uyf8tbvw
	 8Ru1jKw1dX5S0/ZUcNAlvBSeoU2tKE54AhU0U74SvS6O+ZuSi1kGOb/JhorpIVf29NQB/
	 8OleOHw+3Hxszq08hF0Ye2XfGji4GpaKLWWnFTNx6PEFiICJpCpsQzXuPXpFEQJwLMEZm
	 siaDuJjLK09iDR7YY9TliQoRhZI/PUTMnEvMXJTxLBsVn8auyTQj4OciCJa43mcZ/+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MfUHGZ80;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505CC606A31E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 13:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 505CC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MfUHGZ80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792504673; x=1824040673;
  h=date:from:to:cc:subject:message-id;
  bh=Am6YkM86L9v5RgYyiQNsDK5EKvu5HSLRIN/NyMAZnVI=;
  b=MfUHGZ804WXWL9kUgt7+335QlrrUzb5A1Va9919L2NL4FfmbqWEavXDJ
   +CXjrlPxE2tzsUg643DEyq3bAC84X5TEL0O5Skk73XjmlHLHWuvv6S2eF
   yZ88xI0nWvasXxfP7E1KlGYVKDKDrDwSDdLDAmlaR/SJfVc1dZ+mBoweW
   tBYmmCmAV6SrYAW9+qTPOePv0RdMYnOqlx1lR78tDE2akBxgTBuJuiMgS
   +5+OxFJdbyI/F84xh21pYeDQeBs1lyGEBt3ZEtulW8oR0NNoFl10Sdjb/
   ClwafsFmLrZPBEUPIdFQu4gQLsiUpT77AVk9HPDlfO4Pnlzl0cnKeVKp+
   w==;
X-CSE-ConnectionGUID: 9T9MY9tWRnmpqMpl7HKhMw==
X-CSE-MsgGUID: T0T8uNP6TeS9InA+0rqNbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1214393"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1214393"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 06:57:52 -0700
X-CSE-ConnectionGUID: tz0tjSPPT1Oly5PZiCbf5g==
X-CSE-MsgGUID: dGfwaOkmQdiIhNvEXZ+5Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3157298"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 20 Oct 2026 06:57:50 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJALc-000000006KC-0SB5;
	Tue, 20 Oct 2026 13:57:48 +0000
Date: Tue, 20 Oct 2026 15:57:33 +0200
From: kernel test robot <lkp@intel.com>
To: Miro Kropacek <miro.kropacek@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Schmitz <schmitzmic@gmail.com>
Subject: [linux-next:master 9144/17742]
 arch/m68k/atari/config.c:959:43: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202610201504.iUGrxqnn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d229ce89862b8e82d71a9e11d6f840ca272a6d6
commit: dd22510518598ad0b0341168075b77b647954ff0 [9144/17742] m68k: Add support for SVEthLANa
config: m68k-randconfig-r2303-20261020 (https://download.01.org/0day-ci/archive/20261020/202610201504.iUGrxqnn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201504.iUGrxqnn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610201504.iUGrxqnn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/m68k/atari/config.c:959:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile *regp @@     got void [noderef] __iomem *[assigned] sv_version @@
   arch/m68k/atari/config.c:959:43: sparse:     expected void volatile *regp
   arch/m68k/atari/config.c:959:43: sparse:     got void [noderef] __iomem *[assigned] sv_version

vim +959 arch/m68k/atari/config.c

   951	
   952	#ifdef CONFIG_ATARI_SVETHLANA
   953		{
   954			int error;
   955			void __iomem *sv_version;
   956	
   957			sv_version = ioremap(ATARI_SV_VERSION_PHYS_ADDR, 4);
   958			if (sv_version) {
 > 959				if (hwreg_present(sv_version) &&
   960				    (__raw_readl(sv_version) & 0x3ff) >= 10) {
   961					error = platform_device_register(&svethlana_device);
   962					if (error && !rv)
   963						rv = error;
   964				}
   965				iounmap(sv_version);
   966			}
   967		}
   968	#endif
   969	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

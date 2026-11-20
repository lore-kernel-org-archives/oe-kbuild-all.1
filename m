Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179651;
	b=gQCYgxDESf4+zXVGd3j/24zRMNYsADPcnuUHt0Y5YFOMaFQMa+GVK46C7RA03k7/fZ/5
	 MyOxZMQb890a2J3sjWGd7696P30S31e6mOc7gvzalawUhCGnX0nZBX5dHkriCqh/oFYbM
	 Ta2sI0ESZo/aa4vI2ELgbrs6dk9VBSkDllzEc1ciMEXyHyA5mF/X2hGQVjte9Pj/VYFaQ
	 5Z1qIajZ7gV8prftWNMXa2TYe5mObOtMZZWTzLpP0C6hzQrYp+coWbNvk+x8dvLtbRhsr
	 i5vVYhOX4nN+SlCY4VIQf6J75FScrIc7EC71EzWzGzFqTnEN8tTMDQMWbkE7VZgQuCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179651;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=68NJgfoHivjsw4gjRh7zxh7fuVfgwYde4R7I6/R1KXw=;
	b=EL0bblBlQFXgx4fNFh3yjaDiPUub88LnIPcKAa0gCtXit+jakHjMraRlie1SLiYfMZZl
	 ImhHziT/et8O94yJDC2PyhJ+J5qVgAETWqhWtjODYfufGtdMATvyhpacDmvgSa+EBcFll
	 DxL1kBfr+4/oIeCGYGc538xrxvce4GxPV6aWHW8ha+28jVxtYRzwhu4AOtCAkESIIgOBr
	 kvhOgAhmeT8LmS6ZyELNYybcySL93AlYJfvxQLP+ufsGBXGZdpVtuoCoTttcz5qkkoAig
	 VlYp9/o5qpQWzSZHdwQTIpYIkneAcej8Z9FmnHbP5dHzrqsleuQrBlzMieX/hCDXO6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ks6Jv45e;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CF7606A32A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 13:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24CF7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ks6Jv45e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795179651; x=1826715651;
  h=date:from:to:cc:subject:message-id;
  bh=lvwWkDUkEhsh3D7tsxVU36nK8gw2SZzVCL4HvwoWxQ4=;
  b=Ks6Jv45esdMpnnWOPDArDRoR0fMQ0dKuDudrerFg+XybH5aiBV+cBBqh
   5Jm+0qc2pj8ryEVQUKz1Obt6Rj9/fpQBrUOm2NV+akGtrycvxDyxLcjGK
   2DLvd+nXWeJ59ZtVv7yiSr9gwtIeb7INg7BLQHbRKk570+vwp9H9tnJ4Q
   Ljvd6MrSxpRhE3TETR9qZmVeBkVA47BvTHqiySmt59/9VTKMsidQQk07t
   EacImB+MuQVtMk1fg75NAJUrcAlhGBSTYV1vLHvlH+BhJ0LrVKzSImuhN
   aarg/auDi1xmQ8Mg6aIJw17z+djiY7YgFCgXWH6IyLf6uWzYdaz+Wx4hE
   w==;
X-CSE-ConnectionGUID: RdV1iYW5SHmNJgbl+DACfg==
X-CSE-MsgGUID: /5S2bJeURFuS1rSDw9bU8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3903401"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3903401"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 05:00:50 -0800
X-CSE-ConnectionGUID: fofcR49GQ+uy2/iVAik4fQ==
X-CSE-MsgGUID: h9LvPu6aS2ehais7WbQ9dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="12685440"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 20 Nov 2026 05:00:48 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUOEQ-0000000042T-3HBi;
	Fri, 20 Nov 2026 13:00:46 +0000
Date: Fri, 20 Nov 2026 14:00:11 +0100
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [linux-next:master 4264/9862] {standard input}:54363: Error:
 operand out of range (0xffffffff not between 0 and 0x3f) `l.slli r11,r2,-1'
Message-ID: <20261120134933.rRjrKaaL-lkp@intel.com>
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
head:   adcad7f4e6332cff3d6d7165f41584899f598534
commit: adeba0f09038f1f45ebad3dbf997a493b6c7596f [4264/9862] btrfs: add a new 'stripe_len' parameter to btrfs_stripe_nr_to_offset()
config: openrisc-randconfig-r2108-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120134933.rRjrKaaL-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120134933.rRjrKaaL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120134933.rRjrKaaL-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:54363: Error: operand out of range (0xffffffff not between 0 and 0x3f) `l.slli r11,r2,-1'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

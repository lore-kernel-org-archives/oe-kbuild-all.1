Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794742819;
	b=lbs7afoVebyZSmTFvnMd+U4kqb/2lld3DNPsQ9BzvMrvY3o6UndN9TXYe+Lx3/LrIOJh
	 iPRk83o+NfDH/MZ2HziOtzrf6Ka2dRwOWc8k2ve2Tn0u+GhUgNMkC/uhiSjUzNQePLjbz
	 gF9NeyrBKavHuosG6cV8aCak/n7o+H4Ff0JY/2em1Y2VK7/2LgqfLUXmP0IrHFU9uyJVA
	 nGLZ8RDdGS3GFga1TQoMCSjfTPOLKLx6CJ1avq6Jr3/7WZjXA7PY7Lvy/KR3v76vm8ZI0
	 ljB3RRtxjjgCK3A1JjbK+GN15BKioUZBDLlGTwBz1cEJ9lFfr/iTLgwQfTNphB3LtIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794742819;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fEKTmlYSepdjnJA8RAzGfFhNMC8vsW9stKNnsd3dtIc=;
	b=U41zaCQBiVi+vZDDekxbgdutDob+ZccvVZsjP6xog21mNCsPvjp+F+dHJWGn2jM86B5C
	 +EWxUZ6aqYb+LL6LZlqN6o1AMsseqSJA4arfYM5VzZqs8rSxzEHU+kb3TyvJq4aNXQDmy
	 PNHbOmyu6IAHDn9jxHEP1Btv3I08gV9LO/cACmyUqbSf7DmfniGPkJ2TQ1yEWAlOEPY6q
	 rfdmcXN0ZPcHm95pbAVV4luYoFh4+Mc7yPWF8JvzdlW92JsHp9XO1vz6tZAbvTKtzyp5k
	 vYU+wee/1aAXJORTKDWw4SL7boiTYIyjNNJSSLbtZRcW8VqUXbA4WrlIteIsTkFcMpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EUANJfTc;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2343606A31E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 11:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2343606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EUANJfTc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794742819; x=1826278819;
  h=date:from:to:cc:subject:message-id;
  bh=wD+OvYIVXjC37JcXVNRgOqUbAVc4xJ0Uj+SDeNoDUbA=;
  b=EUANJfTcn7iDZss4MwU0Ekii9GmDK25STzaBwTgGwdK2kMLAYhynJA/n
   ihpM2UBerdu1Fya8QESMrScJFRDTv5MFr1zAejVqhi4xdTahanY9fiLHB
   aC6ygIT2/2URkrZTi/kU5vzEyXKtAgIr14KYUfAyFN61fiqCtvKDwrim8
   jKepczZA6dcGi2vvVYEXua0uZdTZ57XGM5+AjDauUff6LEtKtBjjjpg1J
   8jPy/tvfyiAMjVCQKJjuC741cU2E1xUBpfSp24JmApcplayF5gU7mK57g
   5x2PJAckf/G4d/TMESuwJpEfPZsfGKu4EimatWt+eiZSr5p0XS7Kk60vy
   g==;
X-CSE-ConnectionGUID: nG0q4iVBRKSR4pXP++GAQg==
X-CSE-MsgGUID: O4JrdCkTRHagGMSUCPmalQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3368400"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3368400"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 03:40:19 -0800
X-CSE-ConnectionGUID: EcAt361aRViP/VGz5OWSfg==
X-CSE-MsgGUID: xpXlYmhYTB6nixBGe5Uebg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9512588"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 15 Nov 2026 03:40:17 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSYal-000000002A8-13a7;
	Sun, 15 Nov 2026 11:40:15 +0000
Date: Sun, 15 Nov 2026 12:39:23 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 3/3] kismet: WARNING: unmet
 direct dependencies detected for IMS_MSI_ARRAY when selected by
 VFIO_MDEV_IDXD
Message-ID: <202611151238.Ml1yNTIQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   dc68b182b9f87e42548fb6ce886be612535b2116
commit: ed1b6dfe39ba3a1a37a242d0ef4dfb7b5ec06987 [3/3] vfio/mdev: idxd: add virtual device emulation support
config: x86_64-kismet-CONFIG_IMS_MSI_ARRAY-CONFIG_VFIO_MDEV_IDXD-0-0 (https://download.01.org/0day-ci/archive/20261115/202611151238.Ml1yNTIQ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611151238.Ml1yNTIQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151238.Ml1yNTIQ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
   WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - VFIO_MDEV_IDXD [=y] && VFIO [=y] && VFIO_MDEV [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

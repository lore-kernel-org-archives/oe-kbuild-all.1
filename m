Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793227119;
	b=bEoGk05H4ge1rr9tJLqjoKFz6TZSGwpBkhIpYdHzXPnSWHQWCezUSrxK7rCqLH2nbNTi
	 WnBaZGvJlu0MHG35i0LrGM6fKbMvXc1Fiuz6a2EyETkjPpv+U+2hULUonR2CgReX7tEyE
	 me1dl7GSKk/8IAve56g+ATD5Evl61FcqSzxMZq0vpAkyfYh6imKUcMJhR+QCPZpW/88zu
	 OThYuyP2Sea5JuraVLs9/aRLUE18Atjq7h14xuILu5w2BFuI9Fr+CicEMe4TaBt+omyIa
	 3wK6S6AtVmzpYs1aec+Sy/+YB8vHTQ+2iygxvmswLFBnc/Kc7R3Os9ley//jTqqoFdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227119;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=U3YfO3bs8WxCTBDlFk96+ErgIaFrrUGE+9IORdHDrfw=;
	b=XTDu2EavsFkKuKONNg3eapiBBxR4c7MicMkwMYlCrR4dUmrBsLQ/sIv3rPP3PvCHfUxa
	 t8Q/4kVN4gMbidHmwyRHKUghqVISMN6gzi63j1PbnJ8NPx+mdRdxtyRC6WZEGUUffvW9C
	 Eiz7gpWntSpwbvfsK0L1xnWu8sCGsL/tQvx/HnaVYYAzEDXS8JTXvIOvBc5m7qXgQ12g/
	 ZpJ3PoG0M4bvYbH6OJBm6xyrJWKbrypRraqFaN9iYXLhNtjvSSNpMmuPirCdFZc4gbZ1G
	 +b3rUlAgZVXzVKmtzKERnZgoWyIfykpS0ae0OROgt3ERC3TUeI7D5scoLowcJX82Iow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BmEHGBSe;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC04606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 22:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDC04606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BmEHGBSe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793227119; x=1824763119;
  h=date:from:to:cc:subject:message-id;
  bh=CNVVCkIBsIZQbDnZnvlhRoKO3tz+Q7mJovLPFhCtkY4=;
  b=BmEHGBSe5+RfnMNsXQqTppFsxKHzimtrmERExc8U51ImqhIcFpMhxS+X
   /1DmlB/bmi+PCsclRuv2Gouo7xxUL9OPSgVWpWitc0gaprdCAQDefZ1OV
   dkfly1mKhBR4uj9R66P2aMhBSzeHb/k6ZAo3g3Apruja2CewK3M786hPl
   5Nzi8fLS2p/dHaX4c/oqD0bVk7ujjVXKulXSX8QoMVxlasIt1YYXGo8J5
   z4dbluN1ulXNZmrhFviweHoQqPpZ3rJN7X78jFKj0FmEtrKoa/YZ8CBbW
   zt/dUqNGyroDA9oJALflnUaWWbWwzfypQdTw5hwbBSix9QWFXXtEPm3lA
   g==;
X-CSE-ConnectionGUID: O7zxsV2IT36g1qLyLblQ2A==
X-CSE-MsgGUID: 5Gfw90KfSTiD/aS3iojFNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1842901"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1842901"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 15:38:39 -0700
X-CSE-ConnectionGUID: vhbZ/K+mSc+6QxwP1weySg==
X-CSE-MsgGUID: ZvGmXcluRK6Herwvzf/0cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="6786193"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 28 Oct 2026 15:37:07 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMCGX-000000004zN-0cD9;
	Wed, 28 Oct 2026 22:37:05 +0000
Date: Wed, 28 Oct 2026 23:36:40 +0100
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-10-28 354/356] ERROR: modpost:
 sound/soc/snd-soc-core.ko: symbol 'soc_compr_dyn_ops' undefined!
Message-ID: <202610282323.MtZtSFgr-lkp@intel.com>
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
commit: f3a160e1d378e3126d7e98a1d74e115d62d6cc17 [354/356] ASoC: soc-pcm: add new_compress() on rtd_ops
config: loongarch-randconfig-2000-20261028 (https://download.01.org/0day-ci/archive/20261028/202610282323.MtZtSFgr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282323.MtZtSFgr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282323.MtZtSFgr-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: sound/soc/snd-soc-core.ko: symbol 'soc_compr_dyn_ops' undefined!
>> ERROR: modpost: sound/soc/snd-soc-core.ko: symbol 'snd_soc_basic_new_compress' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

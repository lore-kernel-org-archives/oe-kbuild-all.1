Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764B22EBB9D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Sep 2025 10:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758796080; cv=none; b=h1a+Sg7fR7IFcj1Fj5tAcWV75ufFVQHJ9p3PFqiYJ00j3bR/7reGXHDzMUmmyC7M4n+Jlt1peRhIZAT1NdOVTuxI1eVBhUHOmwLlhoQDp1VOgzRr9to+1mAc8+y227FUMQVebSomEWm7L9unennvtxl0oUnUaQVaP2oNAOyBDVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758796080; c=relaxed/simple;
	bh=Y/89HLQGQg5EHVDsLDb1+SKl7nF5BgIXWiNcl6UjSm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kp2WgGqFiecgNpDrdyr8bp/ORK8WdaDNoz7BSf3XmM55DboFZGm6u7i47xL+uKsHjqIXodPWfHTCC0sb+DqF9A/WhqEePaZZrlVlyUMJcGLSSPNGM5S7CMErdDcrXEORaQQYRuBCDNhhgx1gzW2NgX6/F0hfBszXHfnVaRllwz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evE80SAE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evE80SAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758796079; x=1790332079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y/89HLQGQg5EHVDsLDb1+SKl7nF5BgIXWiNcl6UjSm8=;
  b=evE80SAEiAmTLZTkzSWYkW2PL64t77h/5FitRZOPAXdChMyTZigMjaKR
   S4eYgkWzXHsWTXe3G4YUiQql+MPGnbMTJX2G8GuouwK3p455WbIuaooPr
   ooSiBUvdkUzu/8WnLVwJESfoYV0pIJqtTA5Wiuk5+3E48uyDw1JnJShNF
   Av9hHXdVrf8nkp3Q8kzVanLxcxPlTBSldS5/hKmVLf4xHiaK1/4FRnih+
   I06qsjcbPyy1mDv13vxc5JbmpcKidz3i/Cm/MkjgNtLXm3Dw8XZPNEpLY
   7dWgnlO15K+mMz4jH625ireG99nAs6+95dhTty5g5vJccQYVLK9l/alTB
   A==;
X-CSE-ConnectionGUID: PdDOPij8RBmI8ksHS47Ugw==
X-CSE-MsgGUID: jiS1vpx0RnGml06Tp5o3rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="72211671"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="72211671"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 03:27:58 -0700
X-CSE-ConnectionGUID: +OvOXlyuSnys/MlD7hnBEA==
X-CSE-MsgGUID: p0hcyd0gTFeiIytoJ59JYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="214426687"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Sep 2025 03:27:57 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1jCc-00058n-2E;
	Thu, 25 Sep 2025 10:27:54 +0000
Date: Thu, 25 Sep 2025 18:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thesofproject:topic/sof-dev 7661/8514] xtensa-linux-ld:
 mtk-adsp-common.c:undefined reference to `mtk_adsp_ipc_send'
Message-ID: <202509251810.FLgZrky8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   4ded0e130882fa9b59959a05694561fd9c657b05
commit: 3e55a76d727eddf6b3bad82139a6788172168a01 [7661/8514] Merge branch 'sound/upstream-20250414' into merge/sound-upstream-20250414
config: xtensa-randconfig-r133-20250925 (https://download.01.org/0day-ci/archive/20250925/202509251810.FLgZrky8-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509251810.FLgZrky8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509251810.FLgZrky8-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of drivers/pps/clients/pps-ktimer.o: defined in discarded section `.exit.text' of drivers/pps/clients/pps-ktimer.o
   `.exit.text' referenced in section `__jump_table' of drivers/pps/clients/pps-ktimer.o: defined in discarded section `.exit.text' of drivers/pps/clients/pps-ktimer.o
   xtensa-linux-ld: sound/soc/sof/mediatek/mtk-adsp-common.o: in function `mtk_adsp_stream_pcm_hw_params':
   mtk-adsp-common.c:(.text+0x18): undefined reference to `mtk_adsp_ipc_send'
   xtensa-linux-ld: sound/soc/sof/mediatek/mtk-adsp-common.o: in function `mtk_adsp_send_msg':
   mtk-adsp-common.c:(.text+0x3a): undefined reference to `mtk_adsp_ipc_send'
>> xtensa-linux-ld: mtk-adsp-common.c:(.text+0x58): undefined reference to `mtk_adsp_ipc_send'
   xtensa-linux-ld: sound/soc/sof/mediatek/mtk-adsp-common.o: in function `mtk_adsp_handle_request':
   mtk-adsp-common.c:(.text+0xa7): undefined reference to `mtk_adsp_ipc_send'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

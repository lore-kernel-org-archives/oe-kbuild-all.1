Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D317636B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 00:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752883456; cv=none; b=Z0V74lIZQyTiAHvBqY0UWyFmPNrsZTxt2TKu8k7dNpk2Fy/WQ2j5pb254Ho2cues0AQE3FhaWB7CsYkl4uznYgH6+bGVmKtDploWBfcXCXokO+P0KT1AOFH8ZZUeePR0BK7W4HrWLtdvdSR1RWTMqF5rU66rF09ugIzspoOV2jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752883456; c=relaxed/simple;
	bh=mEBq00AkSS3SUU60QJx/I2TpgV/ZNDeu4z/duoX6bNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bnckaKjSUMT/AkzeC7lzRdFD3nYolyq8PLnJl1fiQpQz9Y+4OfNh1CetLEaVntwVcLczX0G6mjDlijSwkJdKibipdXGJPZtQkk7tv5eJMZuFu2OPgtEgLY5ruZ8Xz7Jrwd/McodYmUJtiHfTVYukwtvFKpJylhpzNTLLf1MzW0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aaCDt634; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aaCDt634"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752883453; x=1784419453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mEBq00AkSS3SUU60QJx/I2TpgV/ZNDeu4z/duoX6bNk=;
  b=aaCDt634GAhP44A1BtWxnmz1hiFJGDLyTsaz0qbc9WW+XKylvyTmSUxd
   y8jtH77SLZG05p/sc40c936HbaAPm2akBGn5JinAjOZp+bocxyS/aBv2N
   pImFZdIHDN8IoKVvb7iZEgN78Pdd2pjjXSeMuWqMtNxlP2Wpicl4iNc/D
   O3WNVyXuyTq73QCABgKEWytaM96U2cR9LoaEaQAjEJXUupgYScD0/OT2Z
   AY5ex2+cCyOlkRItPyq16wkQNAoVKj2R/o2MM2wXeY7MbnhfCrkf83Jf0
   /gviFlwNFeW+Fr/fxo3ppTMLWlhnS3k+rp2ucJ7dr5TyaGk37zj+tfWVE
   g==;
X-CSE-ConnectionGUID: OsO6JdaPQuy9/g1DgC+dbw==
X-CSE-MsgGUID: eMtGr3u5RmiVprNRqaVGZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="66252233"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="66252233"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 17:04:12 -0700
X-CSE-ConnectionGUID: O0seIIDpSYGHclvmTCQjsA==
X-CSE-MsgGUID: Ys/60O8OTB67OWOQpDInug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="182058637"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jul 2025 17:04:11 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucv3g-000F9R-2t;
	Sat, 19 Jul 2025 00:04:08 +0000
Date: Sat, 19 Jul 2025 08:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 10905/11307]
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: service@4 (qcom,q6afe):
 Unevaluated properties are not allowed ('usbd' was unexpected)
Message-ID: <202507190707.dEpevroQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
commit: 1c6d7b8f96defe7b73139d6d6dbe025268428518 [10905/11307] arm64: dts: qcom: sm6350: Add q6usbdai node
config: arm64-randconfig-051-20250718 (https://download.01.org/0day-ci/archive/20250719/202507190707.dEpevroQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190707.dEpevroQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190707.dEpevroQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: service@4 (qcom,q6afe): Unevaluated properties are not allowed ('usbd' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6afe.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

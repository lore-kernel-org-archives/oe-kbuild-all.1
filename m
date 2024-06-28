Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0A81DDCE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 00:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719536193; cv=none; b=kvf944wfvgjZHOmOSH/KKAMTR8aV94S4x/tTn2WOWQe8mVZpRoNL69LLKm9FpX8TC25CEAcknf5f4iTwMJjbTtQSv4eu7rH/AxBkPKxg7Duy0DfMWrkZFxZvawMom7RWuZT3s0JEBct6BRMpOD4YJS+wWsMJpLTg6A7oENMpASs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719536193; c=relaxed/simple;
	bh=u4F3IoTkIs0ynNRjT0tAV2ysD0lJIZ9MkN/sC2MtsKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YxOjNzs3P34DoJjXA8PtauB1vYpt3DxAS1tdkSeAvnaJMlN/2ifg48mlobnUoz2G26ARFwWQ8Ywe2ZffsU18X5FOi0FGnSMrNDxkbGwK8MZSkiDMceQf7dIgz2lUq+rWizniDASiKpSF3gUKWov2w6/zlSloj9S/IDXrh5DD3LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9f6jSwa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9f6jSwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719536192; x=1751072192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u4F3IoTkIs0ynNRjT0tAV2ysD0lJIZ9MkN/sC2MtsKU=;
  b=V9f6jSwaaevQh3JikcMXRaGrcTWgRgIZGKTdx00Y9Kk+MF8d1MUjDcmA
   eTkTtDoDLGLudf2Uy9zL29oFOM1gttREGnUIfe7+lRpBfMuHuyQc9/fRx
   kJnatOvB4dXTiyVH/wjZjmGBONB0eQhro3ya8Xu3xos9+map7oDs33AbJ
   yPBlj83rlcuQh81yOLUBdAk4x1Bk0pg1wGJhkK9Ky+TDEWExselu04acC
   5o4Bfwrxmz20ryBiXARstutzBD44gCT6VbaVmxkVcXDVCXT/aBb9833hR
   gYTLsscLENZ9B5RTyo4AA9G99kbZZJyza5ONPx6tzFPASJ1CEQoZCkicW
   g==;
X-CSE-ConnectionGUID: 2QK1bUTJTp6mnnsFnZvrBg==
X-CSE-MsgGUID: pP51xOj+QmyIWesFvC/JPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="34242992"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="34242992"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 17:56:30 -0700
X-CSE-ConnectionGUID: vYzNWhPfQsetqHl2C6ABHg==
X-CSE-MsgGUID: mVwcKTdcR6adN8JZQGY4Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="49753057"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Jun 2024 17:56:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMzub-000Gfu-2S;
	Fri, 28 Jun 2024 00:56:25 +0000
Date: Fri, 28 Jun 2024 08:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Bee <knaerzche@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 7406/9027]
 arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /i2c@ff660000/codec@1c:
 failed to match any schema with compatible: ['realtek,rt5640']
Message-ID: <202406280804.Kc8B4xzn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   642a16ca7994a50d7de85715996a8ce171a5bdfb
commit: 7b4a8097e58b608638d416bd57469f8a9ab70e7b [7406/9027] arm64: dts: rockchip: Add Neardi LBA3368 board
config: arm64-randconfig-051-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280804.Kc8B4xzn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev2+g3b69bad
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280804.Kc8B4xzn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280804.Kc8B4xzn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /i2c@ff660000/codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
>> arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /mbox@ff6b0000: failed to match any schema with compatible: ['rockchip,rk3368-mailbox']
   arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: i2s-8ch@ff898000: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-i2s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

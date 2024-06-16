Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7200512E5B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718568939; cv=none; b=X5IU7UtczKvKOkhAmbZPNzcwCrwIgQ2YHEOT1HiXO9W5Zg4qD37+5mMnZGIJKiPdXzv2McBeQD+uzvOx2je5Ab/N7Ybg0CZWCQ2EQ7FlyIwtehR8howw685b9cAfsYa+Mj/y2oxOGKwsDNnu5K4Sfy5EG51X6bb+fFdqynte1KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718568939; c=relaxed/simple;
	bh=+EexCycrfwOcQyK8v04YLkW2U7nDoH7470V1Hk+nOPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KN1zb594sRTb4AU35ZqQekvc+xensNol2kG1XFFs89hqQqg1jwjdFSosB9LyTwr4QUc4yq/OwWwp2d1UkCRpPmLewx9txekRbp10KHLVg2r415UywJK/ml5DS2n8jovBjTJl9ik8eMb34Xsj3O9MRu3O/4s6LnTBSNlUaYQ1gKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERlxzOfZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERlxzOfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718568937; x=1750104937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+EexCycrfwOcQyK8v04YLkW2U7nDoH7470V1Hk+nOPA=;
  b=ERlxzOfZuWN3t3W3ztEgIyuG0edO/y08TzibAkCYng1V9WzUW1SLVk1i
   6EqHh+0+JX/NyRZ1nmrQZhlzHcdAh2xuqBx8zX/QxKIzx7usJCZd5ajVz
   bh2HvCdgS9ylNtTVDI2FByC3SWKnjE1BUIbt04St81hX7cI/lkxE6xLL3
   6aNLittUewNKhELU82XJYpr24cXfO7kWvtqjWlCeR84Lj3wBwGoXv+ikJ
   M00aGJQG9Bm3WfLRnS/jB6JAc31sb1Bx0qfk13FNVQQxhog/0hqnYqaRb
   wxtPiIIsKUgnkUomKVZkhxnbSGWKbt5BusB8Tg4jNIhfplMQ4rdYVq3Qg
   Q==;
X-CSE-ConnectionGUID: ZTUQ55Z8RDiuAfJSVFd+xA==
X-CSE-MsgGUID: cDcIe+2ARrCPOFo98FsBTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26511465"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="26511465"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 13:15:37 -0700
X-CSE-ConnectionGUID: KvVfFassT+SIQMyLCfD+fg==
X-CSE-MsgGUID: qyJI1vaNRpSlPibQYDqCyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="40944303"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Jun 2024 13:15:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIwHl-0003Er-1y;
	Sun, 16 Jun 2024 20:15:33 +0000
Date: Mon, 17 Jun 2024 04:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 4248/9999]
 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406170445.oS8G3vyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   80b2464ae89aaaa73b7a2daa3526c1ed9971ab5a
commit: 77ed2ae0b7460ff740b3590e53a0f857b2be4dbb [4248/9999] arm64: dts: renesas: Add HiHope RZ/G2H board with idk-1110wr display
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240617/202406170445.oS8G3vyo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170445.oS8G3vyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170445.oS8G3vyo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

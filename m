Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9BD15532C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 12:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719058849; cv=none; b=nkwkYI34xvhMWX6HfYVzl6vig/SjvP2A1GSZ0/hRrN01mlUy207ehOIIyMxK9TwhiqjTMYjP1npkFnqfF4ZH8BCLchkBs8nE581ha0qzTWYZVQzGSdpoWVZDY7xJQsQ09XZanoDJa9u3yfK+Kld1jQuG8RmWldoNdTyzQhDE8aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719058849; c=relaxed/simple;
	bh=HBekYBSogrctOy7ziXotRJ1Z0yZx9LxGkDOtI6U0CH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GHJrNxy5jXRjCCfbWHfL0Q0G3VIIH/NHT3L3sj6Pq9QsuUR8kL84wGdOeyt+J4kiIeW8hnD5X0EyBpTbFuF099mJVeJxZ7O22MItcZQC3eNjHhTRIKa6FhDfzPxA+jHdCSoDzHykz1rblOwu72E59E6PivM0OlsscxnUL0NXbLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNxig3Ja; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNxig3Ja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719058848; x=1750594848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HBekYBSogrctOy7ziXotRJ1Z0yZx9LxGkDOtI6U0CH8=;
  b=aNxig3JaPw7oI/gvsj0xPaYZ26Ohx2AaqMwtSQURnqboxb+YIsAR1elT
   WzFeRAjKPODDd27sXf8s+AnUMEbh2WvhU+ApwvQNlmM4Tgvu55tZB2Gsh
   mI1PbquC8RBvwOdYwc3o21SN/LFAmADSVWxkhAqTbF2uoAk8txs8Bq+Cn
   m/A7Wv/AYRi/t57k01o+0iuMbyQLrGnbRWFhTfqX02ZtA3L9qARxBacXx
   +tFa9H+OleoSStx1z2KQFygYFUXQi7ZXJtrTp3W4B3ihpLzqYGhnbFOsE
   iPRFF/YRkRq0Jb21rwG1DnW5vgr2gathRtCQRZx0ECSKNqFbosB3wAxFM
   w==;
X-CSE-ConnectionGUID: +FDFz5DEQcqKvMLgGXadPg==
X-CSE-MsgGUID: svXcTiCLQwWOvxXYx65/rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15914480"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="15914480"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 05:20:47 -0700
X-CSE-ConnectionGUID: X77lfzITSNqteMCkbe1xSQ==
X-CSE-MsgGUID: UzqbRROnSE2ZotBOJMZ+Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="47360178"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jun 2024 05:20:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKzjW-0009bi-2q;
	Sat, 22 Jun 2024 12:20:42 +0000
Date: Sat, 22 Jun 2024 20:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 5985/9999]
 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406222001.Opfw6FA0-lkp@intel.com>
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
commit: 14c3f6144fb0d2149482812401a3e9270bfffbd1 [5985/9999] arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected to HiHope RZ/G2M
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240622/202406222001.Opfw6FA0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406222001.Opfw6FA0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406222001.Opfw6FA0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

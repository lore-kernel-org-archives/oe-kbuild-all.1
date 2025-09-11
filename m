Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A76246788
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 15:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603064; cv=none; b=B2UQPU8OLxCE7Xtn75M6LFZGCVDzkLHFxRU8rIIxbYicSncGMVB/OouqrWhKKNn3HOr0Mlf2TqwhkuRm9zquNgPmvFTUpCl+AkiYQJiq8ukWHaWUVEP4nF6VPVknDcJCNAyZdMYhpE0yw/m9gB5f64AVo976VdVgy8eWnXiHxPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603064; c=relaxed/simple;
	bh=6fCX2a4NaSetYH9M/rkUXLfD1SfOG1SiDv7QkYUDVRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WF9YavQIiAJ31RvLuK3q4Xx+s2iRQTeBAXuWlozzvKhtCYWV81hpbxr4ntJudW2oN8uhzWbx77umnHr1PU/fSSR2ESNz276IKStAdgP5SgggiW/BccpvH/krUpyqoXAmBcEM9JN1S/gUKBRKpQ0YZ8fAtwklomeH1zdRnusuJDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYKBrIvo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYKBrIvo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757603062; x=1789139062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6fCX2a4NaSetYH9M/rkUXLfD1SfOG1SiDv7QkYUDVRo=;
  b=MYKBrIvo+FimZnSc3w8Q/5l2x5qp1oD10teL7r0rj20ugks/pu58PiW5
   fpAl1v9JipkUkLr7PdvMeZNxXqnGIkojXvckFAbG95Qj9I1nFRigGiue9
   Al8CF/MoU2t0VRTbqaodDvDdvQAuhRWxPmViAJ88ABQdzDlyIT6vi6L46
   kj2sKBxmDweTCsKRVxo9sZZNIy4eTBJ6denglOI5tlt64ij9iFYOlphh+
   zdfaUByARnAjPUj7UrNsHtdNEN4+owTaV35KLEffGdR+tdau0eHobmALV
   6ZLxOuY3lSxea8O/4pwl+w84Pb8ZFQyOg8J1YcCj/xdLor4D5Lvk8V02n
   g==;
X-CSE-ConnectionGUID: TKax5VPASeGHNvOF8NQ6jw==
X-CSE-MsgGUID: X+SmX0pRQ7al+MW9ELY/CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59883548"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59883548"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 08:04:20 -0700
X-CSE-ConnectionGUID: 42miDQGzT0K5CSS6Ph64CQ==
X-CSE-MsgGUID: CX7SZGCkTfi82OvFZTs9Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="174095573"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 11 Sep 2025 08:04:19 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwiq2-0000Om-30;
	Thu, 11 Sep 2025 15:04:07 +0000
Date: Thu, 11 Sep 2025 23:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8166/8263]
 arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dtb:
 displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[193, 0], [193,
 12], [193, 18], [193, 21], [193, 26]] is too short
Message-ID: <202509112310.qXbyQPpQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f21d9da46702c4d6951ba60ca8a05f42870fe8f
commit: f0026d902e5699f55c52aafed5688e0ffb546b23 [8166/8263] Merge branch 'msm-next' of https://gitlab.freedesktop.org/drm/msm.git
config: arm64-randconfig-051-20250911 (https://download.01.org/0day-ci/archive/20250911/202509112310.qXbyQPpQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509112310.qXbyQPpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509112310.qXbyQPpQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4840.27-4913.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4934.27-4988.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[193, 0], [193, 12], [193, 18], [193, 21], [193, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

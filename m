Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B79926A0E8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 20:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740689233; cv=none; b=II4QsebTcn820OY0TCAIG3Lmaqkq2TeOk2pleYCWPT2O/HXeEyIR6h9z7LFwXYm/8N32odQwu9EucoioxALIMaoF1CLqovoHf7Izu/qoYCR22J+I1FCazm3m4NMCdHv5OsvmKMsMAhzRIyOeTZlYoIQMQAnBFkHahBLqZMV/vsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740689233; c=relaxed/simple;
	bh=3FvARAE1z71pB37vXT52r07Lx2g59l624Fj6csQthXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZU6+rgQ+N3lk00LyuWnU7HVQzmlKkwjz3qK18fyBBOQ7vbh3kkEFiBI/X1lmGVzMPnGBV8T9oUL3vCx+4/BmyT/6MbnQydhDI2X1nyflH1d2fi9YX/ClXNfcy3j5WT5xVwpZiGSSPzx8BgJbdHrx9NLE4Njg2TJDifXPGkRcfHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLnQ+yon; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLnQ+yon"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740689231; x=1772225231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3FvARAE1z71pB37vXT52r07Lx2g59l624Fj6csQthXs=;
  b=TLnQ+yonWzbu5sX/2RkB7gQ1MZbZ4vVsxCdQXDtoBR2YmjcHA+MaF3pJ
   Csr7PfYqBlidhUqeAqO3qvuQQpYBTRewY0jA/379/TvPhG218Kyx4GdsV
   maem/jBdjmUeAiAOAVNIABcQ5pZwIcGnOFRokWS+JwKbj7UD7DfeEBgf7
   KKievMtXvasAHDWwYK3P82VL6CBVemBYQe6lxT5Vvi38yeCgm4WE6Zeb3
   150+SSo6BWHwpwxDrZb5Ci6wWFrTefJ+eWn/t1WtFTKlpQLiDIVw8M93x
   TFrjtGXLdXjQX6VvsmG0WZ+NsS3gMVL6WtE0GP6bxVhKJZYsUjRkQ+sIZ
   w==;
X-CSE-ConnectionGUID: bebgXYfDQoaewpZ4gff8Bg==
X-CSE-MsgGUID: ipb2k/ROTCWvnPf9oaZmdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40844745"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="40844745"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 12:47:11 -0800
X-CSE-ConnectionGUID: LiBEWbX+RtWz/0hmMuQ2ew==
X-CSE-MsgGUID: jSMNCRqdTVGEgHMnfDu3uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="117160780"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Feb 2025 12:47:09 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnkmd-000E19-2t;
	Thu, 27 Feb 2025 20:47:04 +0000
Date: Fri, 28 Feb 2025 04:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 6487/6931]
 arch/arm64/boot/dts/arm/morello-fvp.dtb: /pmu: failed to match any schema
 with compatible: ['arm,rainier-pmu']
Message-ID: <202502280448.EGEhCdEp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
commit: 759b83bf7ac69005652854fb9d7940e1436435e3 [6487/6931] arm64: dts: morello: Add support for fvp dts
config: arm64-randconfig-051-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280448.EGEhCdEp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280448.EGEhCdEp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280448.EGEhCdEp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/arm/morello.dtsi:227.38-272.5: Warning (simple_bus_reg): /soc/interrupt-controller@2c010000: simple-bus unit address format error, expected "30000000"
   arch/arm64/boot/dts/arm/morello.dtsi:296.23-313.5: Warning (simple_bus_reg): /soc/sram@45200000: simple-bus unit address format error, expected "6000000"
>> arch/arm64/boot/dts/arm/morello-fvp.dtb: /pmu: failed to match any schema with compatible: ['arm,rainier-pmu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

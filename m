Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925F51373
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 23:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751930856; cv=none; b=TLZ3NMvhhUVNXuTFcG/bB4CspXLDsYunrbR3bGqUYVyWUzpdqZm+ck9+ads3RS3bW1sCoyLq1r8hXzxf1cA5Zdv95LdjhWwc/xqgj1/cu/IGy7JkauP1XRtv1BDID6DLNGDIaA9hA71WQQasNTnERsAiMCT2qh7p9IHbvJ67hjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751930856; c=relaxed/simple;
	bh=82Tbr1XOoUltri12gTOHW1YIaR2VQSU66Rn75gOURT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NKsjGB5L+skQ+8dQRa6hGeE945lA5toYqtQcbzADeCYrZ4tizwx7E0R8nITrhYgaPHh9eN421/AbAW7qVuPlkgHOY+6VQ3JKa3KImC7Rk+GcxulVKMwUqKflOVuaiA3sZ2yjxMP3mByNaWg6q7K2WUpXGjNw2nt4OryeK/pHv1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBpgBfB+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBpgBfB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751930855; x=1783466855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=82Tbr1XOoUltri12gTOHW1YIaR2VQSU66Rn75gOURT8=;
  b=iBpgBfB+JmsBvWETR7ckF7E4I7bG3XD1xkQid/HyCVVOXi5+X5NJt+Ss
   K9Bl9kENo+C3LxyLwHZuUIm7btQsYYAsD3Uzed/mVZsz+e5isV5GHmj0K
   vFn6ZdJmBuI8+ATPOpXIXiIkIocbBtywEGajoN7xrTskPTJagW6roxXwc
   P3kILuSRTspQjOlX4eAEw8vSgUsBbspfz7F7t0s7wrszY/Ri8s3kpCuMW
   e4M42pcdqY4mzePhLmbKnzgMisPE/GI/WEXOI4Fu/FfiV2ar4coqF4sxP
   TcHgNAE7kgcvuzP3vzQB8GXLKXl6PrziJ8stIsMY2s48jOj48S+w0Vc1k
   A==;
X-CSE-ConnectionGUID: dLYnD6uPSBeTGZ1Wntmu2A==
X-CSE-MsgGUID: rvteHurzSce9Z9puVTvmFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="56772417"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="56772417"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 16:27:34 -0700
X-CSE-ConnectionGUID: 1NXgfHc5Sn+PpepzpPhGbg==
X-CSE-MsgGUID: xR2n0DPmS/6RUT6+r3/rWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="154745368"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 07 Jul 2025 16:27:32 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYvFB-0001iv-2q;
	Mon, 07 Jul 2025 23:27:29 +0000
Date: Tue, 8 Jul 2025 01:27:06 +0200
From: kernel test robot <lkp@intel.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 2595/7381]
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/camss@5c6e000: failed to
 match any schema with compatible: ['qcom,qcm2290-camss']
Message-ID: <202507080145.hLKeVkeC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
commit: 2b3aef30dd9dfd6cd2de3026126413a30028b850 [2595/7381] arm64: dts: qcom: qcm2290: Add CAMSS node
config: arm64-randconfig-2051-20250630 (https://download.01.org/0day-ci/archive/20250708/202507080145.hLKeVkeC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080145.hLKeVkeC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507080145.hLKeVkeC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1834.27-1907.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1792.11-1802.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/camss@5c6e000: failed to match any schema with compatible: ['qcom,qcm2290-camss']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

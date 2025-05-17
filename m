Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835F51367
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 17:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747503657; cv=none; b=CQZ8bWQeJaaUbpFFXwXmmD4KNZYAADtmIzgibz5mZ3gphz1nbFruRcTZdH6lCxqnx+y8RqM0YHQCw96UwePp2QPB2rTxHZMS57374IyCAouQPch7z2aTYcqnD3Z+8KncEDWeScsC0iYSJpmi8vKWKlWjhq1DGZ449WE7hUWmT8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747503657; c=relaxed/simple;
	bh=aAlKwz9TnzSCaaDXp/8+chsGC2tGl345cV5vHIJyDOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qlXc1vPS4Hr2NFhlG60C76szh7STNEMKWOR6Gp7+pJkXsdctikqW6dNh/ugc7aN7zzXvfWh5/Hl9NdUncvdpwLHzegZxKy/V5G7uX7k4XUPIsBwdGz+i37lQqa2i910fajzpWhwTdyJ5XRknPAsoV5mMnCpUvD1USNVglMDdL6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3/OyS1l; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3/OyS1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747503655; x=1779039655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aAlKwz9TnzSCaaDXp/8+chsGC2tGl345cV5vHIJyDOo=;
  b=D3/OyS1lPfgcz4SUt9rbnRRyzg2rCZVmcpzDfYkCB6NfPh5QlsVR5tkT
   lY3ADqQ9J4neSNPWcWASx246T0GqftWPIsrUuOME8QhZXM181kb+88Ag0
   H0kztWQt5ODp1a0jglZJ4RUGbTbtr5qijqjFrb808j9PEaso0MRrFrzSm
   /LlpEUCXUzjocWU9qjYgyDnnwKLYYeBbxk6PdZprvDRvqF10CgNSB3P4o
   GSLtDPt6kKo94dgiJ2R1MJswjgFud+D1xI7hrlCcyRwzWLCuIsU8syE2M
   cCWG1Ew6srT4i7Fz4VLQXYR0lEkB5wgtnQ921xGHPdkvDmyVoPWGaHpDV
   Q==;
X-CSE-ConnectionGUID: UyppUpdFTPi6WatYWIWYNA==
X-CSE-MsgGUID: xaicxa9iQzCyz+W4ylpAyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="60110836"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="60110836"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 10:40:54 -0700
X-CSE-ConnectionGUID: BKseWcMjSQurMhUJoHsM+Q==
X-CSE-MsgGUID: J6nYoeBPTG+GFYBBlUUGJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="139468066"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 May 2025 10:40:53 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGLWk-0000Zr-2q;
	Sat, 17 May 2025 17:40:50 +0000
Date: Sun, 18 May 2025 01:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>
Subject: [krzk-github:n/sm8750-audio-part-3 6/21]
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c:210:38: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202505180144.fhWsmcVh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/sm8750-audio-part-3
head:   adac035ce9cf16b4bf5bcad64478178ae722e65e
commit: 053002707bd34cee1887aa5952f4a8e573eb419b [6/21] phy: qcom: Add M31 based eUSB2 PHY driver
config: m68k-randconfig-2006-20250518 (https://download.01.org/0day-ci/archive/20250518/202505180144.fhWsmcVh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180144.fhWsmcVh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180144.fhWsmcVh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/qualcomm/phy-qcom-m31-eusb2.c: In function 'm31eusb2_phy_init':
>> drivers/phy/qualcomm/phy-qcom-m31-eusb2.c:210:38: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     210 |                                      FIELD_PREP(FSEL, data->fsel));
         |                                      ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +210 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c

   177	
   178	static int m31eusb2_phy_init(struct phy *uphy)
   179	{
   180		struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
   181		const struct m31_eusb2_priv_data *data = phy->data;
   182		int ret;
   183	
   184		ret = regulator_bulk_enable(M31_EUSB_NUM_VREGS, phy->vregs);
   185		if (ret) {
   186			dev_err(&uphy->dev, "failed to enable regulator, %d\n", ret);
   187			return ret;
   188		}
   189	
   190		ret = phy_init(phy->repeater);
   191		if (ret) {
   192			dev_err(&uphy->dev, "repeater init failed. %d\n", ret);
   193			goto disable_vreg;
   194		}
   195	
   196		ret = clk_prepare_enable(phy->clk);
   197		if (ret) {
   198			dev_err(&uphy->dev, "failed to enable cfg ahb clock, %d\n", ret);
   199			goto disable_repeater;
   200		}
   201	
   202		/* Perform phy reset */
   203		reset_control_assert(phy->reset);
   204		udelay(5);
   205		reset_control_deassert(phy->reset);
   206	
   207		m31eusb2_phy_write_sequence(phy, data->setup_seq, data->setup_seq_nregs);
   208		m31eusb2_phy_write_readback(phy->base,
   209					     USB_PHY_HS_PHY_CTRL_COMMON0, FSEL,
 > 210					     FIELD_PREP(FSEL, data->fsel));
   211		m31eusb2_phy_write_sequence(phy, data->override_seq, data->override_seq_nregs);
   212		m31eusb2_phy_write_sequence(phy, data->reset_seq, data->reset_seq_nregs);
   213	
   214		return 0;
   215	
   216	disable_repeater:
   217		phy_exit(phy->repeater);
   218	disable_vreg:
   219		regulator_bulk_disable(M31_EUSB_NUM_VREGS, phy->vregs);
   220	
   221		return 0;
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52238367
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 05:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741239671; cv=none; b=OOwjbOPiRkAFDuILKrQQuZGCNdEW//lR75MAuXN0fhwfu9XmIPleo0v7hpCmLbAkYLPY5hR67rr1i+xGwEwLPhv2H4fKthnvC1Kqk31m3v5cWDtTtovMCLVBelnLSpvevXQs4LehQpOc1BsWcQowDAa+NFPD/Y3S6iS0ttUX3uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741239671; c=relaxed/simple;
	bh=23HYYHlRlCATZ17FOk8SZsFwHbv8/qS/txkZ4+H+Xco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+EbH+xWVek/cd2Xa+ytDWqKCUcoI3DBu3nz93XlfFiYKVQXQuthvCJ5we/PUvb5zKyV/RhWgXJkFOeFgOK2qusd0TvzgNA0ZsHeHt4ddasfNsOtGQ4yUoCM4doVJLmBw6XbplEQhRj15e2KWDznkmrJUYr3g6HesR+5KDrwtMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Um5zdZr0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Um5zdZr0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741239670; x=1772775670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=23HYYHlRlCATZ17FOk8SZsFwHbv8/qS/txkZ4+H+Xco=;
  b=Um5zdZr0x5uJEfPL5/uq5O+jsArwph+cr2w8vuxkjnXTtjDCvhHY2NTx
   214QEwwA9DpaPgCXnBZXvciGvKwjaJivdnbGkR//hE8pi+OOKC3Hm8/vO
   D6r0JMBRWxB3Qd7S6XA15Y4kqBsaMLCpjhFQGaRCPEOMtX6bD4pODrCi5
   pl9DEu5y0CupYRgu0tWjgAjk+B/QeMQ8rNBIWO7Ei4GfpORnpDfe8SyFn
   2yf783lJlaqTLF1g8KoiNtBHMk3cmbQ8KqW1bkdVZmZtKEGVi1Cfmsqjg
   /3hZgVJgcmQjwx+CRgvE3x7dTk7CI4CLnxxJoGvAoTjG3Sfgnf2uODAFU
   Q==;
X-CSE-ConnectionGUID: rXPWni29RnSg57leWsgQXg==
X-CSE-MsgGUID: YpgckmpBTqq/ABk93tgdlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45041939"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="45041939"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 21:41:10 -0800
X-CSE-ConnectionGUID: j1bnIr/0Rk+DHRoBLfSCsg==
X-CSE-MsgGUID: jTkk3rnvTGuToV7h7n7CgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="123925918"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 05 Mar 2025 21:41:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq3yj-000Mas-2V;
	Thu, 06 Mar 2025 05:41:06 +0000
Date: Thu, 6 Mar 2025 13:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 6/9] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <202503061341.jnPRINny-lkp@intel.com>
References: <20250304-sm8750_usb_master-v2-6-a698a2e68e06@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-6-a698a2e68e06@quicinc.com>

Hi Melody,

kernel test robot noticed the following build errors:

[auto build test ERROR on 20d5c66e1810e6e8805ec0d01373afb2dba9f51a]

url:    https://github.com/intel-lab-lkp/linux/commits/Melody-Olvera/dt-bindings-phy-qcom-sc8280xp-qmp-usb43dp-phy-Add-SM8750-to-QMP-PHY/20250305-060056
base:   20d5c66e1810e6e8805ec0d01373afb2dba9f51a
patch link:    https://lore.kernel.org/r/20250304-sm8750_usb_master-v2-6-a698a2e68e06%40quicinc.com
patch subject: [PATCH v2 6/9] phy: qcom: Add M31 based eUSB2 PHY driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250306/202503061341.jnPRINny-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061341.jnPRINny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061341.jnPRINny-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/qualcomm/phy-qcom-m31-eusb2.c: In function 'm31eusb2_phy_init':
>> drivers/phy/qualcomm/phy-qcom-m31-eusb2.c:180:38: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     180 |                                      FIELD_PREP(FSEL, data->fsel));
         |                                      ^~~~~~~~~~


vim +/FIELD_PREP +180 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c

   147	
   148	static int m31eusb2_phy_init(struct phy *uphy)
   149	{
   150		struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
   151		const struct m31_eusb2_priv_data *data = phy->data;
   152		int ret;
   153	
   154		ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
   155		if (ret) {
   156			dev_err(&uphy->dev, "failed to enable regulator, %d\n", ret);
   157			return ret;
   158		}
   159	
   160		ret = phy_init(phy->repeater);
   161		if (ret) {
   162			dev_err(&uphy->dev, "repeater init failed. %d\n", ret);
   163			goto disable_vreg;
   164		}
   165	
   166		ret = clk_prepare_enable(phy->clk);
   167		if (ret) {
   168			dev_err(&uphy->dev, "failed to enable cfg ahb clock, %d\n", ret);
   169			goto disable_repeater;
   170		}
   171	
   172		/* Perform phy reset */
   173		reset_control_assert(phy->reset);
   174		udelay(5);
   175		reset_control_deassert(phy->reset);
   176	
   177		m31eusb2_phy_write_sequence(phy, data->setup_seq, data->setup_seq_nregs);
   178		msm_m31_eusb2_write_readback(phy->base,
   179					     USB_PHY_HS_PHY_CTRL_COMMON0, FSEL,
 > 180					     FIELD_PREP(FSEL, data->fsel));
   181		m31eusb2_phy_write_sequence(phy, data->override_seq, data->override_seq_nregs);
   182		m31eusb2_phy_write_sequence(phy, data->reset_seq, data->reset_seq_nregs);
   183	
   184		return 0;
   185	
   186	disable_repeater:
   187		phy_exit(phy->repeater);
   188	disable_vreg:
   189		regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
   190	
   191		return 0;
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

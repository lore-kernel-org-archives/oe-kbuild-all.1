Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317D31805E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Jun 2025 23:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750029595; cv=none; b=SGELrsrG9RC9UVb9gY2aUY6RiO+bUaFFCev42Q4jSGkDFVKryH2JDsrk3WlIe57KHXyKOWI6LbTxvIc9urIcGCcpdInkyrmozO96l8hZExcPA8ad/IEctaOCyk7ldQDicngaKUIAg+SQfDbE5AXe4k4VAFlY4LALNK1lqe9VWCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750029595; c=relaxed/simple;
	bh=qJ2UdVavWp8eEL14LL0LaRKu/bEJFdrYTc5l0jlclQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aszI+y40/CB5KQ8R841ZPw5IAFbf9315v25/XZSFHPRDjQCER9lq7CvwmeKgHLG4nSEdElR4wLPHI8OWWsA8JojvgMiqEUwL86j4reVhTTFdbhYy1VZqwJKMyBLq/wMF4fXP/Mo2W8n03YSR0yUU04QjKrk3JO8RId1PXu0Qua8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVWZt4kE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVWZt4kE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750029593; x=1781565593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qJ2UdVavWp8eEL14LL0LaRKu/bEJFdrYTc5l0jlclQY=;
  b=CVWZt4kELsiipGR0tHVk1x5SnutWRBDLcTC/A1qMVjQIQBi0SJBzZGKI
   Ga2r9w6/ZLnf30GF190jVyzvS+zPVcHyApTW1sGSq6AHQjtzrv3LiA5Ni
   TnUL3Q5p8odxy6BuDY5/3SmFtXYfoY0ezQqj+j03vc1KbKVxVnQc7iyfm
   ZYuPxxLdDYj4j0veQ0rUfkhVNrf+n0LfookJR5z6jGKE7hZch2atH1q9a
   7q3lXX7l2LbGIQ84kOamvtmacC47vMJQdm8+gF7Dp3jtdPDKePBYzWWIs
   ABVlGNNq88v31ApDzd+qUa5305geaVtmM5fhybjgfwkq/ZNJAgbU8Z2tS
   A==;
X-CSE-ConnectionGUID: /qeqk5rHRZqnP69SXwO6KQ==
X-CSE-MsgGUID: 3Irfv1SqTWyTnsJFwh1Spg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63578993"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="63578993"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 16:19:52 -0700
X-CSE-ConnectionGUID: WpANvP7QRWKlEmSwszDXMA==
X-CSE-MsgGUID: LyCMBwIsRfeUYxuQu7xJzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="179210635"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jun 2025 16:19:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQwdg-000EaS-1v;
	Sun, 15 Jun 2025 23:19:48 +0000
Date: Mon, 16 Jun 2025 07:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Kishon <kishon@ti.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>
Subject: [phy:next 40/47] drivers/phy/qualcomm/phy-qcom-m31-eusb2.c:210:37:
 error: implicit declaration of function 'FIELD_PREP'
Message-ID: <202506160720.RgPhvBEb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
head:   47311eaa0a3be575f7835d99e3767f5ee5940b45
commit: 9c8504861cc4102463f31fe1f5e120a6deb15c15 [40/47] phy: qcom: Add M31 based eUSB2 PHY driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250616/202506160720.RgPhvBEb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506160720.RgPhvBEb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506160720.RgPhvBEb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/qualcomm/phy-qcom-m31-eusb2.c: In function 'm31eusb2_phy_init':
>> drivers/phy/qualcomm/phy-qcom-m31-eusb2.c:210:37: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     210 |                                     FIELD_PREP(FSEL, data->fsel));
         |                                     ^~~~~~~~~~


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
   209					    USB_PHY_HS_PHY_CTRL_COMMON0, FSEL,
 > 210					    FIELD_PREP(FSEL, data->fsel));
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

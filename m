Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373F3111B0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 14:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692108241; x=1723644241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=izWgYyGZvbclOsqOoh8da70BMbSJcA4xvR918o81ihw=;
  b=VbkEZz9vpwVfpnT+L90UjIrItUcz4X54AJhAC1MOPk4w86B0P41cfpwB
   5ngjIBvJK+rK8j5FU6hO6tskIE4FRx46hAOo/etvX/OEQj+PcuYeku4TG
   HPNpV2EwPoCu1Sb1ZCsE5JcEGrCVYPeYuNm92JhwGwM1fJdRAAZZ4Gg+u
   6FuRX6TNMLdSEzHXuVduotIpZ3Gp2iFRkg9oLIpeUHHAojEBFkZ7zdOry
   pa5T46TU81R1WXXtQJBOMvJP0y8TY3lCXRgQVE8NIxjcI887KaAnmIAK4
   XkR+3L5wAhoAaJPJx9J1lHpix0G4n602gxMgrDxvZj/M8O2sZjut9Ng4q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371191782"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="371191782"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 07:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848076379"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="848076379"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2023 07:03:10 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVuda-00010n-04;
	Tue, 15 Aug 2023 14:03:10 +0000
Date: Tue, 15 Aug 2023 22:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	manivannan.sadhasivam@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, helgaas@kernel.org,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
	quic_ramkri@quicinc.com, quic_parass@quicinc.com,
	krzysztof.kozlowski@linaro.org,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 3/3] PCI: qcom: Add OPP suuport for speed based
 performance state of RPMH
Message-ID: <202308152125.sU1aQfAd-lkp@intel.com>
References: <1692102408-7010-4-git-send-email-quic_krichai@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1692102408-7010-4-git-send-email-quic_krichai@quicinc.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/for-linus]
[also build test WARNING on robh/for-next linus/master v6.5-rc6 next-20230809]
[cannot apply to pci/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-chaitanya-chundru/dt-bindings-pci-qcom-Add-binding-for-operating-points-v2/20230815-203103
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
patch link:    https://lore.kernel.org/r/1692102408-7010-4-git-send-email-quic_krichai%40quicinc.com
patch subject: [PATCH v1 3/3] PCI: qcom: Add OPP suuport for speed based performance state of RPMH
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230815/202308152125.sU1aQfAd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308152125.sU1aQfAd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308152125.sU1aQfAd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/controller/dwc/pcie-qcom.c: In function 'qcom_pcie_opp_update':
>> drivers/pci/controller/dwc/pcie-qcom.c:1368:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1368 |         int ret = 0;
         |             ^~~


vim +/ret +1368 drivers/pci/controller/dwc/pcie-qcom.c

  1360	
  1361	static void qcom_pcie_opp_update(struct qcom_pcie *pcie)
  1362	{
  1363		struct dw_pcie *pci = pcie->pci;
  1364		struct dev_pm_opp *opp;
  1365		u32 offset, status;
  1366		uint32_t freq;
  1367		int speed;
> 1368		int ret = 0;
  1369	
  1370		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
  1371		status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
  1372	
  1373		/* Only update constraints if link is up. */
  1374		if (!(status & PCI_EXP_LNKSTA_DLLLA))
  1375			return;
  1376	
  1377		speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, status);
  1378	
  1379		switch (speed) {
  1380		case 1:
  1381			freq = 2500000;
  1382			break;
  1383		case 2:
  1384			freq = 5000000;
  1385			break;
  1386		case 3:
  1387			freq = 8000000;
  1388			break;
  1389		default:
  1390			WARN_ON_ONCE(1);
  1391			fallthrough;
  1392		case 4:
  1393			freq = 16000000;
  1394			break;
  1395		}
  1396	
  1397		opp = dev_pm_opp_find_freq_exact(pci->dev, freq, true);
  1398	
  1399		if (!IS_ERR(opp)) {
  1400			ret = dev_pm_opp_get_voltage(opp);
  1401			dev_pm_opp_put(opp);
  1402		}
  1403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

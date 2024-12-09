Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581667BB1D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 05:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720988; cv=none; b=dZWYRNUcrTT3YXo6PsLHNwKjyIOQTtyM6Ir6Wb4I5nKTI4myWr2Niyl1jFMRsFgo0kTVw1yb6Ui0n5Hjde5rRzDsIpCwi1UDlJpv2z0lojAyTaJ0lk7ik0hkm0pFqC4YR05BIrgRRDDBpurtt2Xh7u0HrAmDZ7kWDmQTJDU4z30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720988; c=relaxed/simple;
	bh=mROy6++Dn7mlH/KUc2GTh0vbl+qhbcQlfQEY+6Shp0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fub1nrn6FGM/7qbIlR59HWn4C5FDaavsuFaGks9bA0aUo37b3X3MtHauIeXUMYFwhTeCdjGkqLWuUQjMP2J2zUpNOocgd6WPCj8zNBXeabrdWKx1TZUEAZxDX1PwWApf9PRCJzbJn2uDDXRG2v0OdkIJm5Vaw6rChvu0Ft+/Uac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYi9JHGW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYi9JHGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720987; x=1765256987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mROy6++Dn7mlH/KUc2GTh0vbl+qhbcQlfQEY+6Shp0c=;
  b=GYi9JHGWcsxXDtbRkqmY/kSw1KsESZAmkvj2qQ+WGOTzmjp48YHBIZAu
   Ny4UByi5Pn9ej2wvrb+2WoPqSNqiImxtB5H5d+3oZZh7IGrVavaig7PBO
   9pbLhUJhHOBWtLtqe5lfDet23UtqcpMC6NSBvzpbgTiihkaKTDJnp+NV0
   Ezl3GtE32o/2sY9vgRorLL/YwyFs4c5cSab+cc2xGwmLZUdHbkrTF1kAg
   mKt/P6L37rqfruqauOJ7qtql3zIWi+MFxYpdXfcYGUHrimvautTvvKh7b
   5KFXvykfV+IhhOKcscXLnNxrfOihRnuFFz+eztL2dJOcYjF+5GnjA/Iy9
   g==;
X-CSE-ConnectionGUID: ZlcpXrOWQOuAtgfmkS1vkA==
X-CSE-MsgGUID: RUqVEEabQjGy9iXCajdGhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37683980"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37683980"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 21:09:46 -0800
X-CSE-ConnectionGUID: 8sqBzBTOQLmf410N/6KP9A==
X-CSE-MsgGUID: 0xQ5HaRSTCejeLE9D7A09w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125806857"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Dec 2024 21:09:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKW1e-0003yI-0w;
	Mon, 09 Dec 2024 05:09:42 +0000
Date: Mon, 9 Dec 2024 13:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [linux-next:master 1007/2462]
 arch/arm64/boot/dts/qcom/qcs615-ride.dtb: usb@a6f8800: compatible:0:
 'qcom,qcs615-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3',
 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3',
 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom...
Message-ID: <202412091110.kq7tXw3J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
commit: 4b2769c7d7ce47a64f874eac92b324f3561339ab [1007/2462] arm64: dts: qcom: qcs615: Add primary USB interface
config: arm64-randconfig-051-20241204 (https://download.01.org/0day-ci/archive/20241209/202412091110.kq7tXw3J-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091110.kq7tXw3J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091110.kq7tXw3J-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'qcom,kpss-wdt' was expected
   	'qcom,scss-timer' was expected
   	'qcom,apss-wdt-qcs615' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
   	'qcom,msm-timer' was expected
   	'qcom,kpss-timer' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/watchdog@17c10000: failed to match any schema with compatible: ['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: rsc@18200000: clock-controller:compatible:0: 'qcom,qcs615-rpmh-clk' is not one of ['qcom,qdu1000-rpmh-clk', 'qcom,sa8775p-rpmh-clk', 'qcom,sar2130p-rpmh-clk', 'qcom,sc7180-rpmh-clk', 'qcom,sc7280-rpmh-clk', 'qcom,sc8180x-rpmh-clk', 'qcom,sc8280xp-rpmh-clk', 'qcom,sdm670-rpmh-clk', 'qcom,sdm845-rpmh-clk', 'qcom,sdx55-rpmh-clk', 'qcom,sdx65-rpmh-clk', 'qcom,sdx75-rpmh-clk', 'qcom,sm4450-rpmh-clk', 'qcom,sm6350-rpmh-clk', 'qcom,sm8150-rpmh-clk', 'qcom,sm8250-rpmh-clk', 'qcom,sm8350-rpmh-clk', 'qcom,sm8450-rpmh-clk', 'qcom,sm8550-rpmh-clk', 'qcom,sm8650-rpmh-clk', 'qcom,x1e80100-rpmh-clk']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/rsc@18200000/clock-controller: failed to match any schema with compatible: ['qcom,qcs615-rpmh-clk']
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: usb@a6f8800: compatible:0: 'qcom,qcs615-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3', 'qcom,x1e80100-dwc3-mp']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/usb@a6f8800: failed to match any schema with compatible: ['qcom,qcs615-dwc3', 'qcom,dwc3']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

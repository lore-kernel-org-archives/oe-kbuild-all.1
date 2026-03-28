Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC20335063
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 21:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774734073; cv=none; b=doFjhED8RE7np17HbL4X36PpcvdREPNhq3wnuF9aaaGYGca0nB+k712b/29uKCCz1IqcOXfEQ4W3IW+7f8Akr7zIE7dywIV565YLaDpXZ26RBwXWd0k4oaf3c3joJQ4heOywGdnK5WboachS3cBuA9XvBt0aWaGo+60LxTrVTVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774734073; c=relaxed/simple;
	bh=dwOLjtckIQFhWzkiAbaD8zeHE3chfh6LxKp/BijtxiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Pcu5Vx7O571lvPKtf5XcIMK10VEWDfjUOF+WjTkgcp186dHdXb8n+FD7R1vnJbcmO3wZwxEjLpUmkWK18rKLaBvQ9DkpjTSONPH8hU5VsuoZT2nX3W11bGHwU+ZMcMSwwFDOUHzIq1t9B0c6fVjhlgvesnpZOdoo51kpldule1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ksVC4YwW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ksVC4YwW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774734070; x=1806270070;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dwOLjtckIQFhWzkiAbaD8zeHE3chfh6LxKp/BijtxiE=;
  b=ksVC4YwWOKn2oZBKTXnLkylaEvBA9SbUUk0WzrTWmuGX9u+KjMwvXcRu
   H+2mMZdbr/nBYDCxLFUI+PGmV4jEOYHskXN/u+k/OzyErjLP6aGruESrS
   2yr1lcu7dfMyXP7uNdKpQmxWGhNSDk4wV3ClMv/O6bNQhuLFbCf8iK5+9
   QOeyh3ban3Rr/JneG+fW7Irm3Kd6HfO5gPawoMg8D1lVfG9xDxWpf5L0Y
   yJ14Dyahc3As+xSjkCWsv04LB48UQ+N3wDZaVpVP2CdBjZG+9c1aOm2Pe
   aeniQZTlXIN3MUsh3aQ94VcBV2XUwKC0d94KypUHzZOvOD5r4Px/q0RU2
   A==;
X-CSE-ConnectionGUID: dN/WH6V1Rl+VEISFkARdhw==
X-CSE-MsgGUID: NU0AE35TT72QMPbA78NGSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75655923"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="75655923"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 14:41:10 -0700
X-CSE-ConnectionGUID: OLxofkuPRBatSD38a5qEbQ==
X-CSE-MsgGUID: /9OIcjwGTUCsdzqJNQvjeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="256144448"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 28 Mar 2026 14:41:08 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6bOz-000000007kf-3auz;
	Sat, 28 Mar 2026 21:41:05 +0000
Date: Sat, 28 Mar 2026 22:40:34 +0100
From: kernel test robot <lkp@intel.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 8945/9801]
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: /soc@0/pinctrl@1000000: failed
 to match any schema with compatible: ['qcom,ipq5210-tlmm']
Message-ID: <202603282221.GU0d6WPk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   3b058d1aeeeff27a7289529c4944291613b364e9
commit: 6668b9bb1f0107de045ee3380ae329737a34d054 [8945/9801] arm64: dts: qc=
om: add IPQ5210 SoC and rdp504 board support
config: arm64-randconfig-2051-20260326 (https://download.01.org/0day-ci/arc=
hive/20260328/202603282221.GU0d6WPk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260328/202603282221.GU0d6WPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603282221.GU0d6WPk-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: scm (qcom,scm-ipq5210): com=
patible:0: 'qcom,scm-ipq5210' is not one of ['qcom,scm-apq8064', 'qcom,scm-=
apq8084', 'qcom,scm-glymur', 'qcom,scm-ipq4019', 'qcom,scm-ipq5018', 'qcom,=
scm-ipq5332', 'qcom,scm-ipq5424', 'qcom,scm-ipq6018', 'qcom,scm-ipq806x', '=
qcom,scm-ipq8074', 'qcom,scm-ipq9574', 'qcom,scm-kaanapali', 'qcom,scm-mdm9=
607', 'qcom,scm-milos', 'qcom,scm-msm8226', 'qcom,scm-msm8660', 'qcom,scm-m=
sm8916', 'qcom,scm-msm8937', 'qcom,scm-msm8953', 'qcom,scm-msm8960', 'qcom,=
scm-msm8974', 'qcom,scm-msm8976', 'qcom,scm-msm8994', 'qcom,scm-msm8996', '=
qcom,scm-msm8998', 'qcom,scm-qcm2290', 'qcom,scm-qcs615', 'qcom,scm-qcs8300=
', 'qcom,scm-qdu1000', 'qcom,scm-sa8255p', 'qcom,scm-sa8775p', 'qcom,scm-sa=
r2130p', 'qcom,scm-sc7180', 'qcom,scm-sc7280', 'qcom,scm-sc8180x', 'qcom,sc=
m-sc8280xp', 'qcom,scm-sdm670', 'qcom,scm-sdm845', 'qcom,scm-sdx55', 'qcom,=
scm-sdx65', 'qcom,scm-sdx75', 'qcom,scm-sm6115', 'qcom,scm-sm6125', 'qcom,s=
cm-sm6350', 'qcom,scm-sm6375', 'qcom,scm-sm7150', 'qcom,scm-sm8150', 'qcom,=
scm-sm8250', 'qcom,scm-sm8350', 'qcom,scm-sm8450', 'qcom,scm-sm8550', 'qcom=
,scm-sm8650', 'qcom,scm-sm8750', 'qcom,scm-qcs404', 'qcom,scm-x1e80100']
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
   arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: /firmware/scm: failed to ma=
tch any schema with compatible: ['qcom,scm-ipq5210', 'qcom,scm']
>> arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: /soc@0/pinctrl@1000000: fai=
led to match any schema with compatible: ['qcom,ipq5210-tlmm']
>> arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: mmc@7804000 (qcom,ipq5210-s=
dhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,ipq5210-sdhci', 'qcom,sdhci-msm-v5'] is too long
   	'qcom,ipq5210-sdhci' is not one of ['qcom,sdhci-msm-v4']
   	'qcom,ipq5210-sdhci' is not one of ['qcom,apq8084-sdhci', 'qcom,ipq4019=
-sdhci', 'qcom,ipq8074-sdhci', 'qcom,msm8226-sdhci', 'qcom,msm8953-sdhci', =
'qcom,msm8974-sdhci', 'qcom,msm8976-sdhci', 'qcom,msm8916-sdhci', 'qcom,msm=
8992-sdhci', 'qcom,msm8994-sdhci', 'qcom,msm8996-sdhci', 'qcom,msm8998-sdhc=
i']
   	'qcom,ipq5210-sdhci' is not one of ['qcom,ipq5018-sdhci', 'qcom,ipq5332=
-sdhci', 'qcom,ipq5424-sdhci', 'qcom,ipq6018-sdhci', 'qcom,ipq9574-sdhci', =
'qcom,kaanapali-sdhci', 'qcom,milos-sdhci', 'qcom,qcm2290-sdhci', 'qcom,qcs=
404-sdhci', 'qcom,qcs615-sdhci', 'qcom,qcs8300-sdhci', 'qcom,qdu1000-sdhci'=
, 'qcom,sa8775p-sdhci', 'qcom,sar2130p-sdhci', 'qcom,sc7180-sdhci', 'qcom,s=
c7280-sdhci', 'qcom,sc8280xp-sdhci', 'qcom,sdm630-sdhci', 'qcom,sdm670-sdhc=
i', 'qcom,sdm845-sdhci', 'qcom,sdx55-sdhci', 'qcom,sdx65-sdhci', 'qcom,sdx7=
5-sdhci', 'qcom,sm6115-sdhci', 'qcom,sm6125-sdhci', 'qcom,sm6350-sdhci', 'q=
com,sm6375-sdhci', 'qcom,sm7150-sdhci', 'qcom,sm8150-sdhci', 'qcom,sm8250-s=
dhci', 'qcom,sm8350-sdhci', 'qcom,sm8450-sdhci', 'qcom,sm8550-sdhci', 'qcom=
,sm8650-sdhci', 'qcom,sm8750-sdhci', 'qcom,x1e80100-sdhci']
   	'qcom,sdhci-msm-v4' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml
>> arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: /soc@0/mmc@7804000: failed =
to match any schema with compatible: ['qcom,ipq5210-sdhci', 'qcom,sdhci-msm=
-v5']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

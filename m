Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1D81D0DEE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774109140; cv=none; b=QgS9lizCA3/XC09suGs0xYCYRFiFThLjD0KnNwu7zEZ2xw3msNagYd5uLRQwwIWv/YuYiKOGRIixLbDt6WhCxphaQdLnoZd1ukKAqg8vSafaWRoSy9jE+fEyJ+w3NSYxkGBMgxg9AfWce4Kq3jhuae8gGarj+JMHBj0A2Vk6qDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774109140; c=relaxed/simple;
	bh=OMghT4tXyJUBSTXaWizZI8bzTIjZSpzwUahZhvlrEMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PvOYAUnvdry53ggnH9/Henb8QhYGSCihfn8/kyuUw8xAqfWKpHdWv4oVjh4dEDbmryA2kIWPLBRo8EkWdkk41FfH1CblXIanhJmT/PtRoipiB4gY5ggOE+PqAqGg0bspXdU29EKJqRhCL1zqWQUKFJLcmkpm1B7m7s8guMgcv9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvPyLJ/i; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvPyLJ/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774109139; x=1805645139;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OMghT4tXyJUBSTXaWizZI8bzTIjZSpzwUahZhvlrEMw=;
  b=LvPyLJ/i0oT+gX2bqgs34mC1PChjloRL2GgpnVkdq/vyTtQuSxW7BOho
   ywdh4R6z+gZHhA6CW6tkjwXad2jjS7oWEOpTYYScdYqQml5Vrchl/tax+
   E/M3UR3lKl4OJeYcBGAjfCsXhHi9Q2sz1ib/G+4/XfChqkwXYYNIDf6Kh
   7t8HCJ2UX8y9zpEDy1aJds0LV1NgPxT9MiueC2cKVivcjzLqDKcICjR8E
   X2MJ0V+WCazpjUcPYxe1TFDt3APXEIjxGbeuh46JWvNMHwACGLJDS9WyF
   W2bZoAIGddgcu2kaofh1fS4uVSGXyjTYHFlzjYyBqatigI1Y5zwh3VTuG
   g==;
X-CSE-ConnectionGUID: ZnReg/bcTk+ctk2onqxzng==
X-CSE-MsgGUID: CoqimawBTuuJsWMKjaY7+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="75200231"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="75200231"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 09:05:38 -0700
X-CSE-ConnectionGUID: JIAGVyq2SYqqCx9uxM7u0A==
X-CSE-MsgGUID: 1t4IYliVTDWGqRUgbfU1SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="222816140"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 21 Mar 2026 09:05:36 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3ypS-0000000069p-0f2L;
	Sat, 21 Mar 2026 16:05:34 +0000
Date: Sat, 21 Mar 2026 17:04:56 +0100
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6663/7971]
 arch/arm64/boot/dts/qcom/eliza-mtp.dtb: scm (qcom,scm-eliza): compatible:0:
 'qcom,scm-eliza' is not one of ['qcom,scm-apq8064', 'qcom,scm-apq8084',
 'qcom,scm-glymur', 'qcom,scm-ipq4019', 'qcom,scm-ipq5018',
 'qcom,scm-ipq5210', 'qcom,scm-ipq5332', 'qcom,sc...
Message-ID: <202603211609.srR9oaAw-lkp@intel.com>
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
head:   785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
commit: 3b11871f8e473fe399fb348ea4d0c122f4c182b1 [6663/7971] Merge branches=
 'arm32-for-7.1', 'arm64-defconfig-for-7.1', 'arm64-fixes-for-7.0', 'arm64-=
for-7.1', 'clk-fixes-for-7.0', 'clk-for-7.1', 'drivers-fixes-for-7.0' and '=
drivers-for-7.1' into for-next
config: arm64-randconfig-2051-20260319 (https://download.01.org/0day-ci/arc=
hive/20260321/202603211609.srR9oaAw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260321/202603211609.srR9oaAw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211609.srR9oaAw-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: scm (qcom,scm-eliza): compatible=
:0: 'qcom,scm-eliza' is not one of ['qcom,scm-apq8064', 'qcom,scm-apq8084',=
 'qcom,scm-glymur', 'qcom,scm-ipq4019', 'qcom,scm-ipq5018', 'qcom,scm-ipq52=
10', 'qcom,scm-ipq5332', 'qcom,scm-ipq5424', 'qcom,scm-ipq6018', 'qcom,scm-=
ipq806x', 'qcom,scm-ipq8074', 'qcom,scm-ipq9574', 'qcom,scm-kaanapali', 'qc=
om,scm-mdm9607', 'qcom,scm-milos', 'qcom,scm-msm8226', 'qcom,scm-msm8660', =
'qcom,scm-msm8916', 'qcom,scm-msm8937', 'qcom,scm-msm8953', 'qcom,scm-msm89=
60', 'qcom,scm-msm8974', 'qcom,scm-msm8976', 'qcom,scm-msm8994', 'qcom,scm-=
msm8996', 'qcom,scm-msm8998', 'qcom,scm-qcm2290', 'qcom,scm-qcs615', 'qcom,=
scm-qcs8300', 'qcom,scm-qdu1000', 'qcom,scm-sa8255p', 'qcom,scm-sa8775p', '=
qcom,scm-sar2130p', 'qcom,scm-sc7180', 'qcom,scm-sc7280', 'qcom,scm-sc8180x=
', 'qcom,scm-sc8280xp', 'qcom,scm-sdm670', 'qcom,scm-sdm845', 'qcom,scm-sdx=
55', 'qcom,scm-sdx65', 'qcom,scm-sdx75', 'qcom,scm-sm6115', 'qcom,scm-sm612=
5', 'qcom,scm-sm6350', 'qcom,scm-sm6375', 'qcom,scm-sm7150', 'qcom,scm-sm81=
50', 'qcom,scm-sm8250', 'qcom,scm-sm8350', 'qcom,scm-sm8450', 'qcom,scm-sm8=
550', 'qcom,scm-sm8650', 'qcom,scm-sm8750', 'qcom,scm-qcs404', 'qcom,scm-x1=
e80100']
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /firmware/scm: failed to match a=
ny schema with compatible: ['qcom,scm-eliza', 'qcom,scm']
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: phy@1d80000 (qcom,eliza-qmp-ufs-=
phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-qmp-ufs-phy', 'qcom,sm8650-qmp-ufs-phy'] is too long
   	'qcom,eliza-qmp-ufs-phy' is not one of ['qcom,qcs615-qmp-ufs-phy']
   	'qcom,eliza-qmp-ufs-phy' is not one of ['qcom,x1e80100-qmp-ufs-phy']
   	'qcom,eliza-qmp-ufs-phy' is not one of ['qcom,qcs8300-qmp-ufs-phy']
   	'qcom,eliza-qmp-ufs-phy' is not one of ['qcom,kaanapali-qmp-ufs-phy']
   	'qcom,eliza-qmp-ufs-phy' is not one of ['qcom,milos-qmp-ufs-phy', 'qcom=
,msm8996-qmp-ufs-phy', 'qcom,msm8998-qmp-ufs-phy', 'qcom,sa8775p-qmp-ufs-ph=
y', 'qcom,sc7180-qmp-ufs-phy', 'qcom,sc7280-qmp-ufs-phy', 'qcom,sc8180x-qmp=
-ufs-phy', 'qcom,sc8280xp-qmp-ufs-phy', 'qcom,sdm845-qmp-ufs-phy', 'qcom,sm=
6115-qmp-ufs-phy', 'qcom,sm6125-qmp-ufs-phy', 'qcom,sm6350-qmp-ufs-phy', 'q=
com,sm7150-qmp-ufs-phy', 'qcom,sm8150-qmp-ufs-phy', 'qcom,sm8250-qmp-ufs-ph=
y', 'qcom,sm8350-qmp-ufs-phy', 'qcom,sm8450-qmp-ufs-phy', 'qcom,sm8475-qmp-=
ufs-phy', 'qcom,sm8550-qmp-ufs-phy', 'qcom,sm8650-qmp-ufs-phy', 'qcom,sm875=
0-qmp-ufs-phy']
   	'qcom,sm6115-qmp-ufs-phy' was expected

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

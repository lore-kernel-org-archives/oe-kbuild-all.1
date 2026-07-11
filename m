Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C421DFDE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 03:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783740071; cv=none; b=sUeFsb66MS+lM9fuH3bvFKwwSKPbmT4c9PJB59Qu9q4vblpCeFqKSUAgN1T1aMpHRvRVfCMkRhbFeOMywaaP879QrfsiXFbzWoglMrTctROV5VGs7wSFWUTmZl8JG/0KxGpVuIuUQVKVKAUd6ZdKXO4dv5MJRBMuxKYLp4+RE9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783740071; c=relaxed/simple;
	bh=9XQNSmjLKlxib8wfX7JwT8uPamAXrFoxCIeWYYWxmWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eMm665qFRJWwOd0Cf0E94dgNy792jbYjT5cIEsl70UpxzEGe8JbcsL1N0rsIbjUjXlLWG6E50szL6csSRpVgcUuVndUfnXeTDlD18H9ToHxqyUO1fKjfL+Aie2Uq65FJ56Qv/3dEzxfdrF5+F25QuY7hvA+kAcT9Z/X1TZRDLi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8duKkUl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8duKkUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783740068; x=1815276068;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9XQNSmjLKlxib8wfX7JwT8uPamAXrFoxCIeWYYWxmWI=;
  b=a8duKkUlivzlNklcPoFHQjOqKiTfq93JmGMC+9Yt6pLSMZfqBfIZ/gvQ
   4VZLMPb/a71KP4XBvIDQvG8H+Ju4cIuzw0bFmswH46Ll2yEk8UGYaoEsO
   aUAPzIK4nL3ggxKVHJsvuEcv5hci0PCCPYtHFL3V/KmyXelPh5q3BMhsw
   09LM3utERYOpJ4zDhzgxt+rvL7Fd8EGQWl6ztOVCRRn+0KxsZZKRS6RP4
   i7LO16krDHGaY39TVzmZRNBBbmBVdhc8tgbDMlfQ4uOMSRMH/pS0icFM8
   0CieAO/Ozi9i1MHKD04/cNxyAGzpPnG2IqEOE74fiWinkm3i8JnIpNRsE
   Q==;
X-CSE-ConnectionGUID: 9pdTyCymRQOsDfh1CJCpuA==
X-CSE-MsgGUID: 2UgSefnmRS6Knz5nR+cULQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84217207"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84217207"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 20:21:07 -0700
X-CSE-ConnectionGUID: 8xirUjpyTJGTBCBeBFd25w==
X-CSE-MsgGUID: eDBz0f/tQVeiXsny682oEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279453995"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jul 2026 20:21:04 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiOH0-000000003Ht-0J2R;
	Sat, 11 Jul 2026 03:21:02 +0000
Date: Sat, 11 Jul 2026 05:20:27 +0200
From: kernel test robot <lkp@intel.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Monish Chunara <quic_mchunara@quicinc.com>,
 Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
 Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
 Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
 Xueyao An <xueyao.an@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 4380/5655]
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: scm (qcom,scm-shikra): False
 schema does not allow ['core']
Message-ID: <202607110524.UaknxioP-lkp@intel.com>
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
head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
commit: 2ef5adff2d38698cad70cb779555c9c173f24d2e [4380/5655] arm64: dts: qc=
om: Add Shikra EVK boards
config: arm64-randconfig-2055-20260710 (https://download.01.org/0day-ci/arc=
hive/20260711/202607110524.UaknxioP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260711/202607110524.UaknxioP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110524.UaknxioP-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@1c40000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: scm (qcom,scm-shikra): Fals=
e schema does not allow ['core']
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: scm (qcom,scm-shikra): Fals=
e schema does not allow [[8, 70]]
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: scm (qcom,scm-shikra): comp=
atible:0: 'qcom,scm-shikra' is not one of ['qcom,scm-apq8064', 'qcom,scm-ap=
q8084', 'qcom,scm-eliza', 'qcom,scm-glymur', 'qcom,scm-hawi', 'qcom,scm-ipq=
4019', 'qcom,scm-ipq5018', 'qcom,scm-ipq5210', 'qcom,scm-ipq5332', 'qcom,sc=
m-ipq5424', 'qcom,scm-ipq6018', 'qcom,scm-ipq806x', 'qcom,scm-ipq8074', 'qc=
om,scm-ipq9574', 'qcom,scm-ipq9650', 'qcom,scm-kaanapali', 'qcom,scm-mdm960=
7', 'qcom,scm-milos', 'qcom,scm-msm8226', 'qcom,scm-msm8660', 'qcom,scm-msm=
8916', 'qcom,scm-msm8937', 'qcom,scm-msm8953', 'qcom,scm-msm8960', 'qcom,sc=
m-msm8974', 'qcom,scm-msm8976', 'qcom,scm-msm8994', 'qcom,scm-msm8996', 'qc=
om,scm-msm8998', 'qcom,scm-nord', 'qcom,scm-qcm2290', 'qcom,scm-qcs615', 'q=
com,scm-qcs8300', 'qcom,scm-qdu1000', 'qcom,scm-sa8255p', 'qcom,scm-sa8775p=
', 'qcom,scm-sar2130p', 'qcom,scm-sc7180', 'qcom,scm-sc7280', 'qcom,scm-sc8=
180x', 'qcom,scm-sc8280xp', 'qcom,scm-sdm670', 'qcom,scm-sdm845', 'qcom,scm=
-sdx55', 'qcom,scm-sdx65', 'qcom,scm-sdx75', 'qcom,scm-sm6115', 'qcom,scm-s=
m6125', 'qcom,scm-sm6350', 'qcom,scm-sm6375', 'qcom,scm-sm7150', 'qcom,scm-=
sm8150', 'qcom,scm-sm8250', 'qcom,scm-sm8350', 'qcom,scm-sm8450', 'qcom,scm=
-sm8550', 'qcom,scm-sm8650', 'qcom,scm-sm8750', 'qcom,scm-qcs404', 'qcom,sc=
m-x1e80100']
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: /firmware/scm: failed to ma=
tch any schema with compatible: ['qcom,scm-shikra', 'qcom,scm']
   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: remoteproc (qcom,shikra-rpm=
-proc): glink-edge:rpm-requests:compatible: 'oneOf' conditional failed, one=
 must be fixed:
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-apq8084', 'qcom,rpm-mdm9607'=
, 'qcom,rpm-msm8226', 'qcom,rpm-msm8610', 'qcom,rpm-msm8909', 'qcom,rpm-msm=
8916', 'qcom,rpm-msm8917', 'qcom,rpm-msm8936', 'qcom,rpm-msm8937', 'qcom,rp=
m-msm8952', 'qcom,rpm-msm8953', 'qcom,rpm-msm8974', 'qcom,rpm-msm8976', 'qc=
om,rpm-msm8994']
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-ipq6018', 'qcom,rpm-ipq9574'=
, 'qcom,rpm-msm8996', 'qcom,rpm-msm8998', 'qcom,rpm-qcm2290', 'qcom,rpm-qcs=
404', 'qcom,rpm-sdm660', 'qcom,rpm-sm6115', 'qcom,rpm-sm6125', 'qcom,rpm-sm=
6375']
   	'qcom,smd-rpm' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,rpm-proc=
.yaml
   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: glink-edge (qcom,glink-rpm)=
: rpm-requests:compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-apq8084', 'qcom,rpm-mdm9607'=
, 'qcom,rpm-msm8226', 'qcom,rpm-msm8610', 'qcom,rpm-msm8909', 'qcom,rpm-msm=
8916', 'qcom,rpm-msm8917', 'qcom,rpm-msm8936', 'qcom,rpm-msm8937', 'qcom,rp=
m-msm8952', 'qcom,rpm-msm8953', 'qcom,rpm-msm8974', 'qcom,rpm-msm8976', 'qc=
om,rpm-msm8994']
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-ipq6018', 'qcom,rpm-ipq9574'=
, 'qcom,rpm-msm8996', 'qcom,rpm-msm8998', 'qcom,rpm-qcm2290', 'qcom,rpm-qcs=
404', 'qcom,rpm-sdm660', 'qcom,rpm-sm6115', 'qcom,rpm-sm6125', 'qcom,rpm-sm=
6375']
   	'qcom,smd-rpm' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,glink-rp=
m-edge.yaml
   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: rpm-requests (qcom,rpm-shik=
ra): compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-apq8084', 'qcom,rpm-mdm9607'=
, 'qcom,rpm-msm8226', 'qcom,rpm-msm8610', 'qcom,rpm-msm8909', 'qcom,rpm-msm=
8916', 'qcom,rpm-msm8917', 'qcom,rpm-msm8936', 'qcom,rpm-msm8937', 'qcom,rp=
m-msm8952', 'qcom,rpm-msm8953', 'qcom,rpm-msm8974', 'qcom,rpm-msm8976', 'qc=
om,rpm-msm8994']
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-ipq6018', 'qcom,rpm-ipq9574'=
, 'qcom,rpm-msm8996', 'qcom,rpm-msm8998', 'qcom,rpm-qcm2290', 'qcom,rpm-qcs=
404', 'qcom,rpm-sdm660', 'qcom,rpm-sm6115', 'qcom,rpm-sm6125', 'qcom,rpm-sm=
6375']
   	'qcom,smd-rpm' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smd-rpm.ya=
ml
   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: /remoteproc/glink-edge/rpm-=
requests: failed to match any schema with compatible: ['qcom,rpm-shikra', '=
qcom,glink-smd-rpm']
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: /soc@0/syscon@3c0000: faile=
d to match any schema with compatible: ['qcom,shikra-tcsr', 'syscon']
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: efuse@1b44000 (qcom,shikra-=
qfprom): compatible:0: 'qcom,shikra-qfprom' is not one of ['qcom,apq8064-qf=
prom', 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-qfprom',=
 'qcom,ipq5424-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom=
,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,kaanapali-qfprom', 'qcom,msm=
8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8917-qfprom', 'qcom,msm8937-q=
fprom', 'qcom,msm8960-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom'=
, 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qco=
m,qcs404-qfprom', 'qcom,qcs615-qfprom', 'qcom,qcs8300-qfprom', 'qcom,sa8775=
p-qfprom', 'qcom,sar2130p-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfpro=
m', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qc=
om,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375=
-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom',=
 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom', 'qcom,sm8750-qfprom', 'qcom,x1=
e80100-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: /soc@0/efuse@1b44000: faile=
d to match any schema with compatible: ['qcom,shikra-qfprom', 'qcom,qfprom']
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: /soc@0/sram@c11e000: failed=
 to match any schema with compatible: ['qcom,shikra-imem', 'mmio-sram']
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecess=
ary_addr_size): /soc@0/spmi@1c40000/pmic@5: unnecessary #address-cells/#siz=
e-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: scm (qcom,scm-shikra): Fals=
e schema does not allow ['core']
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: scm (qcom,scm-shikra): Fals=
e schema does not allow [[8, 70]]
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: scm (qcom,scm-shikra): comp=
atible:0: 'qcom,scm-shikra' is not one of ['qcom,scm-apq8064', 'qcom,scm-ap=
q8084', 'qcom,scm-eliza', 'qcom,scm-glymur', 'qcom,scm-hawi', 'qcom,scm-ipq=
4019', 'qcom,scm-ipq5018', 'qcom,scm-ipq5210', 'qcom,scm-ipq5332', 'qcom,sc=
m-ipq5424', 'qcom,scm-ipq6018', 'qcom,scm-ipq806x', 'qcom,scm-ipq8074', 'qc=
om,scm-ipq9574', 'qcom,scm-ipq9650', 'qcom,scm-kaanapali', 'qcom,scm-mdm960=
7', 'qcom,scm-milos', 'qcom,scm-msm8226', 'qcom,scm-msm8660', 'qcom,scm-msm=
8916', 'qcom,scm-msm8937', 'qcom,scm-msm8953', 'qcom,scm-msm8960', 'qcom,sc=
m-msm8974', 'qcom,scm-msm8976', 'qcom,scm-msm8994', 'qcom,scm-msm8996', 'qc=
om,scm-msm8998', 'qcom,scm-nord', 'qcom,scm-qcm2290', 'qcom,scm-qcs615', 'q=
com,scm-qcs8300', 'qcom,scm-qdu1000', 'qcom,scm-sa8255p', 'qcom,scm-sa8775p=
', 'qcom,scm-sar2130p', 'qcom,scm-sc7180', 'qcom,scm-sc7280', 'qcom,scm-sc8=
180x', 'qcom,scm-sc8280xp', 'qcom,scm-sdm670', 'qcom,scm-sdm845', 'qcom,scm=
-sdx55', 'qcom,scm-sdx65', 'qcom,scm-sdx75', 'qcom,scm-sm6115', 'qcom,scm-s=
m6125', 'qcom,scm-sm6350', 'qcom,scm-sm6375', 'qcom,scm-sm7150', 'qcom,scm-=
sm8150', 'qcom,scm-sm8250', 'qcom,scm-sm8350', 'qcom,scm-sm8450', 'qcom,scm=
-sm8550', 'qcom,scm-sm8650', 'qcom,scm-sm8750', 'qcom,scm-qcs404', 'qcom,sc=
m-x1e80100']
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: /firmware/scm: failed to ma=
tch any schema with compatible: ['qcom,scm-shikra', 'qcom,scm']
   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: remoteproc (qcom,shikra-rpm=
-proc): glink-edge:rpm-requests:compatible: 'oneOf' conditional failed, one=
 must be fixed:
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-apq8084', 'qcom,rpm-mdm9607'=
, 'qcom,rpm-msm8226', 'qcom,rpm-msm8610', 'qcom,rpm-msm8909', 'qcom,rpm-msm=
8916', 'qcom,rpm-msm8917', 'qcom,rpm-msm8936', 'qcom,rpm-msm8937', 'qcom,rp=
m-msm8952', 'qcom,rpm-msm8953', 'qcom,rpm-msm8974', 'qcom,rpm-msm8976', 'qc=
om,rpm-msm8994']
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-ipq6018', 'qcom,rpm-ipq9574'=
, 'qcom,rpm-msm8996', 'qcom,rpm-msm8998', 'qcom,rpm-qcm2290', 'qcom,rpm-qcs=
404', 'qcom,rpm-sdm660', 'qcom,rpm-sm6115', 'qcom,rpm-sm6125', 'qcom,rpm-sm=
6375']
   	'qcom,smd-rpm' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,rpm-proc=
.yaml
   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: glink-edge (qcom,glink-rpm)=
: rpm-requests:compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-apq8084', 'qcom,rpm-mdm9607'=
, 'qcom,rpm-msm8226', 'qcom,rpm-msm8610', 'qcom,rpm-msm8909', 'qcom,rpm-msm=
8916', 'qcom,rpm-msm8917', 'qcom,rpm-msm8936', 'qcom,rpm-msm8937', 'qcom,rp=
m-msm8952', 'qcom,rpm-msm8953', 'qcom,rpm-msm8974', 'qcom,rpm-msm8976', 'qc=
om,rpm-msm8994']
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-ipq6018', 'qcom,rpm-ipq9574'=
, 'qcom,rpm-msm8996', 'qcom,rpm-msm8998', 'qcom,rpm-qcm2290', 'qcom,rpm-qcs=
404', 'qcom,rpm-sdm660', 'qcom,rpm-sm6115', 'qcom,rpm-sm6125', 'qcom,rpm-sm=
6375']
   	'qcom,smd-rpm' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,glink-rp=
m-edge.yaml
   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: rpm-requests (qcom,rpm-shik=
ra): compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-apq8084', 'qcom,rpm-mdm9607'=
, 'qcom,rpm-msm8226', 'qcom,rpm-msm8610', 'qcom,rpm-msm8909', 'qcom,rpm-msm=
8916', 'qcom,rpm-msm8917', 'qcom,rpm-msm8936', 'qcom,rpm-msm8937', 'qcom,rp=
m-msm8952', 'qcom,rpm-msm8953', 'qcom,rpm-msm8974', 'qcom,rpm-msm8976', 'qc=
om,rpm-msm8994']
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-ipq6018', 'qcom,rpm-ipq9574'=
, 'qcom,rpm-msm8996', 'qcom,rpm-msm8998', 'qcom,rpm-qcm2290', 'qcom,rpm-qcs=
404', 'qcom,rpm-sdm660', 'qcom,rpm-sm6115', 'qcom,rpm-sm6125', 'qcom,rpm-sm=
6375']
   	'qcom,smd-rpm' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smd-rpm.ya=
ml
   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: /remoteproc/glink-edge/rpm-=
requests: failed to match any schema with compatible: ['qcom,rpm-shikra', '=
qcom,glink-smd-rpm']
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: /soc@0/syscon@3c0000: faile=
d to match any schema with compatible: ['qcom,shikra-tcsr', 'syscon']
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: efuse@1b44000 (qcom,shikra-=
qfprom): compatible:0: 'qcom,shikra-qfprom' is not one of ['qcom,apq8064-qf=
prom', 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-qfprom',=
 'qcom,ipq5424-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom=
,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,kaanapali-qfprom', 'qcom,msm=
8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8917-qfprom', 'qcom,msm8937-q=
fprom', 'qcom,msm8960-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom'=
, 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qco=
m,qcs404-qfprom', 'qcom,qcs615-qfprom', 'qcom,qcs8300-qfprom', 'qcom,sa8775=
p-qfprom', 'qcom,sar2130p-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfpro=
m', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qc=
om,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375=
-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom',=
 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom', 'qcom,sm8750-qfprom', 'qcom,x1=
e80100-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: /soc@0/efuse@1b44000: faile=
d to match any schema with compatible: ['qcom,shikra-qfprom', 'qcom,qfprom']
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: /soc@0/sram@c11e000: failed=
 to match any schema with compatible: ['qcom,shikra-imem', 'mmio-sram']
--
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: scm (qcom,scm-shikra): Fals=
e schema does not allow ['core']
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: scm (qcom,scm-shikra): Fals=
e schema does not allow [[8, 70]]
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: scm (qcom,scm-shikra): comp=
atible:0: 'qcom,scm-shikra' is not one of ['qcom,scm-apq8064', 'qcom,scm-ap=
q8084', 'qcom,scm-eliza', 'qcom,scm-glymur', 'qcom,scm-hawi', 'qcom,scm-ipq=
4019', 'qcom,scm-ipq5018', 'qcom,scm-ipq5210', 'qcom,scm-ipq5332', 'qcom,sc=
m-ipq5424', 'qcom,scm-ipq6018', 'qcom,scm-ipq806x', 'qcom,scm-ipq8074', 'qc=
om,scm-ipq9574', 'qcom,scm-ipq9650', 'qcom,scm-kaanapali', 'qcom,scm-mdm960=
7', 'qcom,scm-milos', 'qcom,scm-msm8226', 'qcom,scm-msm8660', 'qcom,scm-msm=
8916', 'qcom,scm-msm8937', 'qcom,scm-msm8953', 'qcom,scm-msm8960', 'qcom,sc=
m-msm8974', 'qcom,scm-msm8976', 'qcom,scm-msm8994', 'qcom,scm-msm8996', 'qc=
om,scm-msm8998', 'qcom,scm-nord', 'qcom,scm-qcm2290', 'qcom,scm-qcs615', 'q=
com,scm-qcs8300', 'qcom,scm-qdu1000', 'qcom,scm-sa8255p', 'qcom,scm-sa8775p=
', 'qcom,scm-sar2130p', 'qcom,scm-sc7180', 'qcom,scm-sc7280', 'qcom,scm-sc8=
180x', 'qcom,scm-sc8280xp', 'qcom,scm-sdm670', 'qcom,scm-sdm845', 'qcom,scm=
-sdx55', 'qcom,scm-sdx65', 'qcom,scm-sdx75', 'qcom,scm-sm6115', 'qcom,scm-s=
m6125', 'qcom,scm-sm6350', 'qcom,scm-sm6375', 'qcom,scm-sm7150', 'qcom,scm-=
sm8150', 'qcom,scm-sm8250', 'qcom,scm-sm8350', 'qcom,scm-sm8450', 'qcom,scm=
-sm8550', 'qcom,scm-sm8650', 'qcom,scm-sm8750', 'qcom,scm-qcs404', 'qcom,sc=
m-x1e80100']
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: /firmware/scm: failed to ma=
tch any schema with compatible: ['qcom,scm-shikra', 'qcom,scm']
   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: remoteproc (qcom,shikra-rpm=
-proc): glink-edge:rpm-requests:compatible: 'oneOf' conditional failed, one=
 must be fixed:
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-apq8084', 'qcom,rpm-mdm9607'=
, 'qcom,rpm-msm8226', 'qcom,rpm-msm8610', 'qcom,rpm-msm8909', 'qcom,rpm-msm=
8916', 'qcom,rpm-msm8917', 'qcom,rpm-msm8936', 'qcom,rpm-msm8937', 'qcom,rp=
m-msm8952', 'qcom,rpm-msm8953', 'qcom,rpm-msm8974', 'qcom,rpm-msm8976', 'qc=
om,rpm-msm8994']
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-ipq6018', 'qcom,rpm-ipq9574'=
, 'qcom,rpm-msm8996', 'qcom,rpm-msm8998', 'qcom,rpm-qcm2290', 'qcom,rpm-qcs=
404', 'qcom,rpm-sdm660', 'qcom,rpm-sm6115', 'qcom,rpm-sm6125', 'qcom,rpm-sm=
6375']
   	'qcom,smd-rpm' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,rpm-proc=
.yaml
   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: glink-edge (qcom,glink-rpm)=
: rpm-requests:compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-apq8084', 'qcom,rpm-mdm9607'=
, 'qcom,rpm-msm8226', 'qcom,rpm-msm8610', 'qcom,rpm-msm8909', 'qcom,rpm-msm=
8916', 'qcom,rpm-msm8917', 'qcom,rpm-msm8936', 'qcom,rpm-msm8937', 'qcom,rp=
m-msm8952', 'qcom,rpm-msm8953', 'qcom,rpm-msm8974', 'qcom,rpm-msm8976', 'qc=
om,rpm-msm8994']
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-ipq6018', 'qcom,rpm-ipq9574'=
, 'qcom,rpm-msm8996', 'qcom,rpm-msm8998', 'qcom,rpm-qcm2290', 'qcom,rpm-qcs=
404', 'qcom,rpm-sdm660', 'qcom,rpm-sm6115', 'qcom,rpm-sm6125', 'qcom,rpm-sm=
6375']
   	'qcom,smd-rpm' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,glink-rp=
m-edge.yaml
   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: rpm-requests (qcom,rpm-shik=
ra): compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-apq8084', 'qcom,rpm-mdm9607'=
, 'qcom,rpm-msm8226', 'qcom,rpm-msm8610', 'qcom,rpm-msm8909', 'qcom,rpm-msm=
8916', 'qcom,rpm-msm8917', 'qcom,rpm-msm8936', 'qcom,rpm-msm8937', 'qcom,rp=
m-msm8952', 'qcom,rpm-msm8953', 'qcom,rpm-msm8974', 'qcom,rpm-msm8976', 'qc=
om,rpm-msm8994']
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-ipq6018', 'qcom,rpm-ipq9574'=
, 'qcom,rpm-msm8996', 'qcom,rpm-msm8998', 'qcom,rpm-qcm2290', 'qcom,rpm-qcs=
404', 'qcom,rpm-sdm660', 'qcom,rpm-sm6115', 'qcom,rpm-sm6125', 'qcom,rpm-sm=
6375']
   	'qcom,smd-rpm' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smd-rpm.ya=
ml
   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: /remoteproc/glink-edge/rpm-=
requests: failed to match any schema with compatible: ['qcom,rpm-shikra', '=
qcom,glink-smd-rpm']
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: /soc@0/syscon@3c0000: faile=
d to match any schema with compatible: ['qcom,shikra-tcsr', 'syscon']
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: efuse@1b44000 (qcom,shikra-=
qfprom): compatible:0: 'qcom,shikra-qfprom' is not one of ['qcom,apq8064-qf=
prom', 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-qfprom',=
 'qcom,ipq5424-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom=
,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,kaanapali-qfprom', 'qcom,msm=
8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8917-qfprom', 'qcom,msm8937-q=
fprom', 'qcom,msm8960-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom'=
, 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qco=
m,qcs404-qfprom', 'qcom,qcs615-qfprom', 'qcom,qcs8300-qfprom', 'qcom,sa8775=
p-qfprom', 'qcom,sar2130p-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfpro=
m', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qc=
om,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375=
-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom',=
 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom', 'qcom,sm8750-qfprom', 'qcom,x1=
e80100-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: /soc@0/efuse@1b44000: faile=
d to match any schema with compatible: ['qcom,shikra-qfprom', 'qcom,qfprom']
>> arch/arm64/boot/dts/qcom/shikra-iqs-evk.dtb: /soc@0/sram@c11e000: failed=
 to match any schema with compatible: ['qcom,shikra-imem', 'mmio-sram']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

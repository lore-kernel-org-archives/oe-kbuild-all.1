Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D129A3A8D0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 01:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736732340; cv=none; b=tnB2BVNte/V6Lxoouk1RNj8BpeuGvajuXFkPQLezjeeBqFEB943IaLJAhJCijw3yRGL3O7qdU+EXyi29W2+3zG79aRaffti8t8ked6EhmTVV0MzyF+qnQoR98mPfiV6Xvu45uegxoTU/IQYivqWc2TEEVZ1IWp+NItyuAaERALk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736732340; c=relaxed/simple;
	bh=GO8INwrhZUpsn0XT14ZsY6oIhHAggjsgF+AOFlDDshE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g4LRQ1AQlPrh29Hl8VxluwOmLCB6XQUkoHGcUODx8VrdGyc5gRzM+L+i8AZAs115r5ZQTprJFLv0o13qW+4DdP3xaRFFNVWoU9YXPZuqxW/Dq1Q7uOVLYOal3bO6FUu/IkZ3bU0bjmsEQ0sF5Y57wkOEL70spO31/4uoSJGrQmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pxu1soI0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pxu1soI0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D0FxpN002414;
	Mon, 13 Jan 2025 01:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BB2pJXFCJM3hZXl4qevDtnhGzde/TcBJ62PwojNoakc=; b=pxu1soI0pDNjXQ1L
	Ohe0SnQHYcVLpPsyFMXlqgoPCLJ5v63haG2mSkwkk0s4SYI/zs0biO+pJ2CShlcm
	pro7bpGuwVChcx18HlQRWnzygEmxLuNITNI0ofzmgvqpxU/NudMXkg8JcDIdp5cl
	Fv9pbkx9yZlFDRBiE3q+ARzXB5ppcj73SmOJTGAQhwXBTenLPqhGil4nVkiwnLwR
	Ldp5SNHCUaQeSwc6CpX1oc3lasPIBW1PPObFEjb8ErL/yEfWFW12nCmv0o5eG9yl
	IAJF3EFA0MnC26NocagwtoT/vd09idD7HE2FR8tqInUm0ahXLl7uuIOiKQb9jRY7
	WhY8oA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hkfjubk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 01:38:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D1coKq007617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 01:38:51 GMT
Received: from [10.64.68.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 12 Jan
 2025 17:38:48 -0800
Message-ID: <04aba594-0d94-4736-b0ab-8e329a24f6ba@quicinc.com>
Date: Mon, 13 Jan 2025 09:38:46 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 6465/7860]
 arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: Unevaluated
 properties are not allowed ('compatible' was unexpected)
To: kernel test robot <lkp@intel.com>,
        Sayali Lokhande
	<quic_sayalil@quicinc.com>
CC: <oe-kbuild-all@lists.linux.dev>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <202501110205.ajKauAd7-lkp@intel.com>
From: Xin Liu <quic_liuxin@quicinc.com>
In-Reply-To: <202501110205.ajKauAd7-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Jj6-_ekLvGnedX1EH0tdmqRtGY1bOD-A
X-Proofpoint-ORIG-GUID: Jj6-_ekLvGnedX1EH0tdmqRtGY1bOD-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 adultscore=0 clxscore=1011 bulkscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501130012

Hi, all

The patch below has been reviewed-by, but it is not applied now. So it 
caused this problem.

https://lore.kernel.org/linux-arm-msm/20241216095439.531357-2-quic_liuxin@quicinc.com/

在 2025/1/11 2:41, kernel test robot 写道:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   2b88851f583d3c4e40bcd40cfe1965241ec229dd
> commit: 4b120ef62ed653f4bc05e5f68832d2d2ac548b60 [6465/7860] arm64: dts: qcom: qcs615-ride: Enable UFS node
> config: arm64-randconfig-052-20250109 (https://download.01.org/0day-ci/archive/20250111/202501110205.ajKauAd7-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> dtschema version: 2024.12.dev6+gc4da38d
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110205.ajKauAd7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501110205.ajKauAd7-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>     arch/arm64/boot/dts/qcom/qcs615-ride.dtb: dma-controller@a00000: compatible: 'oneOf' conditional failed, one must be fixed:
>     	['qcom,qcs615-gpi-dma', 'qcom,sdm845-gpi-dma'] is too long
>     	'qcom,qcs615-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
>     	'qcom,qcs615-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
>     	'qcom,qcs615-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
>     	'qcom,sm6350-gpi-dma' was expected
>     	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>     arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,qcs615-gpi-dma', 'qcom,sdm845-gpi-dma']
>     arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: compatible:0: 'qcom,qcs615-ufshc' is not one of ['qcom,msm8994-ufshc', 'qcom,msm8996-ufshc', 'qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sdm845-ufshc', 'qcom,sm6115-ufshc', 'qcom,sm6125-ufshc', 'qcom,sm6350-ufshc', 'qcom,sm8150-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc', 'qcom,sm8650-ufshc']
>     	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('compatible' was unexpected)
>     	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>     arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/ufshc@1d84000: failed to match any schema with compatible: ['qcom,qcs615-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0']
>     arch/arm64/boot/dts/qcom/qcs615-ride.dtb: pmu@90b6300: compatible: 'oneOf' conditional failed, one must be fixed:
>     	['qcom,qcs615-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
>     	'qcom,msm8998-bwmon' was expected
>     	'qcom,qcs615-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,qcs8300-cpu-bwmon', 'qcom,sa8775p-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon', 'qcom,x1e80100-cpu-bwmon']
>     	'qcom,qcs615-cpu-bwmon' is not one of ['qcom,qcs8300-llcc-bwmon', 'qcom,sa8775p-llcc-bwmon', 'qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon', 'qcom,x1e80100-llcc-bwmon']
>     	'qcom,sc7280-llcc-bwmon' was expected
>     	'qcom,sdm845-llcc-bwmon' was expected
>     	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
> 


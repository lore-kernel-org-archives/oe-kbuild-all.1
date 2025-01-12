Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F1E15C0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 00:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736641843; cv=none; b=Gv/DnPSkOPWr1Tdn6JAqkCVqSp/tx1K9ANPqJwz5g2mO77+TY1eUxNhpkoNIgAdptc91tEPZzJkuNwkLCthmH2RqQHNkzxbo+ZyWRkfsxzmynpvaPNx2AWKuMNVEqFYjKEX9mmFfTDpxScRW51Kvd2FFpAKkShm8a2jvWC+BNpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736641843; c=relaxed/simple;
	bh=iv7idb3hsxif3xYn0fatnoQxKZsQhA/gdwBpicr33BI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AbW2VNaaUsqoQ4iTufYApMh7pQ/yQ0aH4pdz/GE/buM5Zpge7gj72TlpGR60HUyJxLY7KaFKazLgsmnrhqbajW6awzis1RGxkVlnz4WrXRb0JW9AnN+2D9fB+2jt85Eca8vpCDbnfgLQD42VM7otPsCJ6Izjpy3ZtYvpfySo0po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kN6xdOd1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kN6xdOd1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50BNtl6G023331;
	Sun, 12 Jan 2025 00:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iUDPq5m6YWt4HKqaVMyBo9fzKUmR8qQVbsm4DanoiCE=; b=kN6xdOd1ONcif4Tr
	875w414Qz0bJwqrGhA4pbfGBQa3DMjuSmgmsudmhXI5Bxwy8x+ChKeDTfhzpSpd+
	FJc2JkHXtWXL73eNBSvdhtl4PrAjGLm07LMHLF44H1urRBE/jk/bQHkBV4BKq6xJ
	21mmCDYqIPhO1hE4S2JCSonB6vOHkW4Pvq/PALT/joUVEDIlzDggWyvqB1a81tWk
	2M23AOin5S+Gn6jGcR2uQULfNKmkfl84dWt0CtylR7f6hivPW8svzSib1KSruB+k
	ssYFdIxC9iyug8h5e7vw/YS3Cd0Nv9FHc/AqxZ9Vmu38HIYxaeEac7Cj8cUxvFr1
	kF696g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hhvs9q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 00:30:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50C0UZ91029603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 00:30:35 GMT
Received: from [10.216.45.202] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 11 Jan
 2025 16:30:32 -0800
Message-ID: <81cda9fc-022d-4b64-8390-a9732ebc88b6@quicinc.com>
Date: Sun, 12 Jan 2025 06:00:16 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 6498/7860]
 arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/clock-controller@3d90000:
 failed to match any schema with compatible: ['qcom,qcs8300-gpucc']
To: kernel test robot <lkp@intel.com>, Bjorn Andersson <andersson@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>
References: <202501120049.KPbtWhvh-lkp@intel.com>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <202501120049.KPbtWhvh-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0zgY3g10LMdBl3rCkuv-2XGwctCOGhxv
X-Proofpoint-GUID: 0zgY3g10LMdBl3rCkuv-2XGwctCOGhxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1011 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501120002



On 1/11/2025 10:00 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   2b88851f583d3c4e40bcd40cfe1965241ec229dd
> commit: 795255cb4cd4388cac930e3bb3524e1ca84dd0bf [6498/7860] arm64: dts: qcom: qcs8300: Add support for clock controllers
> config: arm64-randconfig-052-20250109 (https://download.01.org/0day-ci/archive/20250112/202501120049.KPbtWhvh-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> dtschema version: 2024.12.dev6+gc4da38d
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120049.KPbtWhvh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501120049.KPbtWhvh-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: crypto@1d88000: compatible:0: 'qcom,qcs8300-inline-crypto-engine' is not one of ['qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine']
>    	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>    arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/crypto@1d88000: failed to match any schema with compatible: ['qcom,qcs8300-inline-crypto-engine', 'qcom,inline-crypto-engine']
>    arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible:0: 'qcom,qcs8300-adsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
>    	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>    arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible: ['qcom,qcs8300-adsp-pas', 'qcom,sa8775p-adsp-pas'] is too long
>    	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>    arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: Unevaluated properties are not allowed ('compatible' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>    arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/remoteproc@3000000: failed to match any schema with compatible: ['qcom,qcs8300-adsp-pas', 'qcom,sa8775p-adsp-pas']
>>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/clock-controller@3d90000: failed to match any schema with compatible: ['qcom,qcs8300-gpucc']
>>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/clock-controller@abf0000: failed to match any schema with compatible: ['qcom,qcs8300-videocc']
>>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/clock-controller@ade0000: failed to match any schema with compatible: ['qcom,qcs8300-camcc']

Hi Bjorn,

These qcom,qcs8300-*cc compatible related warnings are coming because only the DT patchset has been picked into the tree and the dependent driver series [1] is not yet picked. Could you please help check and pick the dependent driver patch series as well.

[1] https://lore.kernel.org/all/20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com/

Thanks,
Imran

>    arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: interrupt-controller@b220000: compatible:0: 'qcom,qcs8300-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
>    	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
>    arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,qcs8300-pdc', 'qcom,pdc']
>    arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: watchdog@17c10000: compatible: 'oneOf' conditional failed, one must be fixed:
>    	['qcom,apss-wdt-qcs8300', 'qcom,kpss-wdt'] is too long
>    	['qcom,apss-wdt-qcs8300', 'qcom,kpss-wdt'] is too short
>    	'qcom,apss-wdt-qcs8300' is not one of ['qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250']
>    	'qcom,kpss-wdt' was expected
>    	'qcom,scss-timer' was expected
>    	'qcom,apss-wdt-qcs8300' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
> 


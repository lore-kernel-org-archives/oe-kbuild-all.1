Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E18A1F5413
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752775216; cv=none; b=uPeeKjmwZDUXMYf14c2C1PZoXjnHFMJ8yaxck6qMlCn0OMd6FXqI307DtN61ArX35nJqLs+wzoCP6AG5/BLACWC/pQ9XeNvADVPVwSMBbtHK+bUdVWwlT1F74rT6ofafYA54p9Wx0RF2yJOsxeFXoaeV739N2w8J62GWgLybTAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752775216; c=relaxed/simple;
	bh=CYpwHl39tG3yv6HUjf7LUqeazPzbCuQzQgrHPIwf5m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X4jF/eHPoWU13Zq/f5mVRAlKza/lH7loSbfAmtMKvjvGP8tXwWLJPdfx03mN55xzM6lW+Y1wirLsMsgNTi/XeDAuh3agjcA9rZlzoFyxSFE3LGD/xAXeTtp8qA6Q4ySTCskNs4sFdBpXOHYn0WCIf+VWY1RJdb9jeNbzNL626UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fD52CyBk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fD52CyBk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCNSj0008417;
	Thu, 17 Jul 2025 18:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5PADhlh0oo2a9uvwsoWrXex6nhLy54W2REokmkCxhv0=; b=fD52CyBk0cvonPAU
	ol1xbDeY6wgmASBeoVhbgMLp33KHcAMG9UhKz0OU072F8Dik+gKSFcHCErjcWATW
	C7i9G6ftyRPmofj/2GzhTtDhQD08+/SC7h1AGhRnCf62qk3Cd4jqqY/VHhlm15gI
	3Y49tD1wrr2XTsj1U1DWbA+OxFeXInOLm8Lb2YRY1qj3ywAMcQZ8jhIdufGwN+SS
	tG5/b6RZIPiF3PTwpjFaC5yRtfsOtW0zgEMF1wmJhV/zY4J94SSeY4etdkSaBi4y
	35dIb/iy+ZwWcvUO3zuWZs6dUbo0WRDktEKoNPdGmzCqcUj5/JXKHNWbC8pSHy73
	uy9tkQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca9wua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 18:00:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56HI05XN022546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 18:00:05 GMT
Received: from [10.216.29.3] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 17 Jul
 2025 11:00:03 -0700
Message-ID: <453bd020-8124-4a7d-8d0f-8180d38f1ebc@quicinc.com>
Date: Thu, 17 Jul 2025 23:30:01 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1298/7381]
 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000
 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
To: kernel test robot <lkp@intel.com>, Bjorn Andersson <andersson@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
References: <202507080613.ghzGQQEz-lkp@intel.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <202507080613.ghzGQQEz-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE1OSBTYWx0ZWRfX6xm5MY+oCufy
 C7RdRLtYJ/kGn8zH6ZHqxQYpCgdjSHJn5DuybsMdLU0caCwCcKQHyEaq4pGCvWdtVzqzCWP1QQB
 kpwUEjza5K0rQtnpxhXV10lFLgrSbPQlKANohmy0TqKfS4/lmS9r9VgsrNu0BeYALfugAakczNS
 MAdI703BFFC/BqH5K48OTlcMZO+dqErdivzJT2WS0+im7adRurcpyP2wrMxG5P6V/v7Q9iCNn+4
 hD/DBjtjmbdTv7Jtr4Iitdo14YVBQbw3UsG+9GE4oOpcOR/+ItovHcxiz6fxyWn+RYb2bHMIKs9
 mn2c9EhJQHzY2v6zqIduf11AikpFKHnNNUFPMfJHyQbZJxzW51IguUvjYhmbzmi/tUxKTOFFmNW
 L0RamrvoD2q8FxcqLoNJ1SX8P2jMCIBq7wdWIGa0AtqTRMAE4cl8shN+qRBzsugst5qrZlQx
X-Proofpoint-GUID: Zuog5zq7UxInY18Z85ApVhmxE8GApXl0
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=68793a26 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8
 a=uijFCiAGfSU60CK01F8A:9 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Zuog5zq7UxInY18Z85ApVhmxE8GApXl0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170159



On 7/8/2025 10:08 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
> commit: 1a42f4d4bb92ea961c58599bac837fb8b377a296 [1298/7381] dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
> config: arm64-randconfig-2051-20250630 (https://download.01.org/0day-ci/archive/20250708/202507080613.ghzGQQEz-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.2.0
> dtschema version: 2025.6.2.dev4+g8f79ddd
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080613.ghzGQQEz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507080613.ghzGQQEz-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[106, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3614.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3614.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3614.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8650.dtsi:5202.27-5277.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
> --
>>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
> 

Hi Bjorn,

Can you please help to pick DTS changes(patches 13-18) from below series to avoid this dt-binding warnings?

https://lore.kernel.org/all/20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com/


I posted the below patch adding minItems:1 to make the binding to be backward compatible with older
DT as well that has single power-domain, but it was not accepted and the conclusion in the thread was
to make driver backward compatible with older DTS(which it already does) and not support old DT
in schema 

https://lore.kernel.org/all/20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-0-02e83aeba280@quicinc.com/#r

Thanks,
Jagadeesh

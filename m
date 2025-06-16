Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6017F9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 07:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058856; cv=none; b=LSVxpyzsrFuVom4ChwNcxnC+msNRENgQiur+XUAcssR8/UN5PlliTehYNcg3qbyzQTb6kH0YRgS6OHuajQz5ijUojHh2EZFCjs4GTzfvGd8erHsabjN90sEUMLGNOU/WpzDhWdIHjlYdCl+uUdyiv1RuUUm6KXkq66RusYL+d/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058856; c=relaxed/simple;
	bh=IV9/sY2qo0pvFRh3PjYFf2e5r3Ke/dbu3m5PdKs6vW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jYWsvFVu6NL9nb6jyBLYlGin39d4pFcl9AklP17DfTvvIyIRsHaQeeeKvATi9Lwxcmrq2j25Df9oRy08woH39V0sEzE2NQvqHR+MQkOISSmzDtF9a/onMASxNe2I+yDqECI6hbtxn61PS4neCp5S8Hv03Nt6MiTP07IsRChd9HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fJwlx4tS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fJwlx4tS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FLZNEO028193;
	Mon, 16 Jun 2025 07:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VDDRqwPRmr0Ui9SgGXHLTcoh3Hw1GwYMeo6AYgcRxyQ=; b=fJwlx4tSUXneqEjs
	27HO83VYU+T6kTJztfLUL/aZf5R2AuqqOcxCQh9fTOMXrpzzCBGvJJFdXknt/cje
	5/5wUqD6V9fUP4jofHhqmSpLM79Xz7Jna28btWPZhYQgDpHI16UnHRY5V7S1kJtI
	gYyvxREhkpVC3dXWqRvAS7EapFCpEPuU6G3LjA84zg8RD0xq3VKrT8waJkdPnsUh
	AwtpJYvoENwUvSM8hdYQBe4lLrP0y+QqbLkGT3nwmqY1Ukgh1DQdI0zdtcoXhRVJ
	jF+kJxSc1YkxF+dn0hDwJJ69JpD5Zmv5MmwV7QVvzTwtrWa4NsXkJVXUhEINFLBl
	9TDmdA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h93ffp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 07:27:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55G7RQBL008539
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 07:27:26 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 00:27:23 -0700
Message-ID: <a13c8ffd-87ed-4821-8647-710c792f3466@quicinc.com>
Date: Mon, 16 Jun 2025 12:57:20 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1625/2468]
 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@ade0000
 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
To: kernel test robot <lkp@intel.com>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>
References: <202506151907.LcLf1RIB-lkp@intel.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <202506151907.LcLf1RIB-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tZ1OcoiBp2_QdyRGW-m1AgByUfdMyHgl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA0OCBTYWx0ZWRfX2T+bPB5rA3Ey
 uuvBo2JIwD0MkkfAN8d7Ocp9uvZZUtzvu6hepEyN7knoFul/WzBKnnsPZJh7AkI7aQxekJMwpdh
 p3l+ahzsFf25MvyvaZmZ84b1utKP46ef3PcGaFCz2dsF+kK2iln0Ih2LabMnRkimMXn1Kixz5sS
 TKaSJmnxSoGpBdOxJZTcjgNwVwKa9Zis0z/HkjaPmg7aLQUz+oMpwN1W68v95WCmIzN9qRDLNXL
 H9+6mAUY/CziWxY3s9CcK1InPTR5zSZoU7Doir2k3DtPg5ZF+KZbK5BozfZcwByXTa9/rOWVb93
 rNeQ0IKOfhVe8oA6nLQhzZ+PSbNYxjg3N02K8s1wTmAR3ZUv/VXUxPNYq8N7Abfwd9jMJobusmM
 yjaV2YAV3AyHLpfCC+iPq6y4Cn5Hb/spjh35OxtolZ3oX9YTYXBQHHaOb39rHnlfGFINpC19
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=684fc75f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=mx-J5TPsNAuDy5HuZHYA:9 a=QEXdDO2ut3YA:10
 a=mmqRlSCDY2ywfjPLJ4af:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tZ1OcoiBp2_QdyRGW-m1AgByUfdMyHgl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160048



On 6/15/2025 4:42 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   bc6e0ba6c9bafa6241b05524b9829808056ac4ad
> commit: a02a8f8cb7f6f54b077a6f9eb74ccd840b472416 [1625/2468] dt-bindings: clock: qcom,sm8450-camcc: Allow to specify two power domains
> config: arm64-randconfig-052-20250612 (https://download.01.org/0day-ci/archive/20250615/202506151907.LcLf1RIB-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> dtschema version: 2025.3.dev28+g49451a5
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506151907.LcLf1RIB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506151907.LcLf1RIB-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[106, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[106, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[98, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[98, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[98, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3614.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3614.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3614.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8650.dtsi:5202.27-5277.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>    arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>    arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> 

Hi Bjorn,

This and the below kernel test robot warning[1] is due to dt-bindings changes (patches 1-3) being applied to linux-next tree and
the corresponding DTS changes(patches 13-18) are not yet applied to linux-next in the PLL multi PD voting series[2].

I apologise for not mentioning this dependency detail in cover letter. Can you please help to pick DTS patches also from below series[2]?

[1]: https://lore.kernel.org/oe-kbuild-all/202506141133.AEQRFOWe-lkp@intel.com/  
[2]: https://lore.kernel.org/all/65828662-5352-449b-a892-7c09d488a1f4@quicinc.com/

Thanks,
Jagadeesh

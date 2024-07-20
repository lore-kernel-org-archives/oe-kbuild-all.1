Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE37323D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 05:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721453715; cv=none; b=W9Grj17iwVl8SX/z5AhYa2T1RpCS71Bf9G/LfgWGS3wws2OWZSXp2lgD8l/sjkz3B6Kb//LqlqJSEeamnOvGFFJOZF8IHbWo53V9AYcr48+pDX5mA0YO8g3ruGqu5OQQi5OoK8Ha+b6mcSaly8Hm68ujQYQmlJrOEjN+e1uQ0/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721453715; c=relaxed/simple;
	bh=vnvLC1lbPjfBdcgTBFugRK/O1FVg7slVlMU68CcV1RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j5+A6a6RddoDuCmdY31Rb+OwJFipZVI2vfDqwjleXrCUec0Xmk5aSiTyz9BDGZWPkjcPpNm5PCakGEwBxUTgmftiF8SQQ7AFGP22SkaHuwWT/TqyvfTUcnYrarNwT5krkDTZPp/QS9JhPqSAQLhxQiYdE35cxU/NvoHuPOSZ05A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cycEdxu8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cycEdxu8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46K0gqrf006304;
	Sat, 20 Jul 2024 05:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2lDXMXrlLJst6Qrgg2QXSxwlx/cHR/lUQjXT0f0Ea64=; b=cycEdxu80pfqzG92
	z5m/ebaa8jfkIE3bAi2achyUyc6V+z8rFgAnxYBmKVbhiZ0MhYMj668UqYl9GXl2
	eEF7HXSS8QaEcw3od8XxiZwVRKUhDHRH9tV8laqlnPISDdvGLAC/yeQC5oNLjFIc
	vfy3dRcbnRfQRSQRGRmY3K2TuDDe8kAPRXKCo0nMkPdCcLd3WSRMkuUWSvyrtmuR
	h1QVjkJR5hiNygdpT2WofIPU/ZCa+kWhTW/p+uUcH6qy133JdPTY/VCLUOPLjai2
	4EoXXiO1RGsxeIgzhYmfWHHNac0SDpazLk/jYVJsciSM/vDAkAMqbKmexcY8663A
	OILsjw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g2xe89e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Jul 2024 05:35:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46K5Z4p0015395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Jul 2024 05:35:04 GMT
Received: from [10.216.44.69] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Jul
 2024 22:35:01 -0700
Message-ID: <02c802ea-9ee2-439d-ae06-c1e42b64c0fb@quicinc.com>
Date: Sat, 20 Jul 2024 11:04:31 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 7769/10451]
 arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000:
 'required-opps' is a required property
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>,
        Linux Memory Management List
	<linux-mm@kvack.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vladimir
 Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <202407070147.C9c3oTqS-lkp@intel.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <202407070147.C9c3oTqS-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uZem8SsrmDF8oxFCLUEv7byAiEd-nCTB
X-Proofpoint-ORIG-GUID: uZem8SsrmDF8oxFCLUEv7byAiEd-nCTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-20_03,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407200039



On 7/6/2024 10:46 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0b58e108042b0ed28a71cd7edf5175999955b233
> commit: 0bdb730e63f6628b0f8deb3f11991b1d10f9bca5 [7769/10451] arm64: dts: qcom: sm8650: Add video and camera clock controllers
> config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240707/202407070147.C9c3oTqS-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
> dtschema version: 2024.6.dev3+g650bf2d
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407070147.C9c3oTqS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407070147.C9c3oTqS-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>     arch/arm64/boot/dts/qcom/sm8650.dtsi:3459.27-3534.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>     arch/arm64/boot/dts/qcom/sm8650.dtsi:3556.27-3612.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>     arch/arm64/boot/dts/qcom/sm8650-hdk.dts:841.9-852.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>     arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
>     	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000: 'required-opps' is a required property
>     	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000: 'required-opps' is a required property
>     	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>     arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: /wcn7850-pmu: failed to match any schema with compatible: ['qcom,wcn7850-pmu']
> --
>     arch/arm64/boot/dts/qcom/sm8650.dtsi:3556.27-3612.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>     arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
>     	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000: 'required-opps' is a required property
>     	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000: 'required-opps' is a required property
>     	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> --
>     arch/arm64/boot/dts/qcom/sm8650.dtsi:3556.27-3612.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>     arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
>     	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000: 'required-opps' is a required property
>     	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@ade0000: 'required-opps' is a required property
>     	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>     arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: /wcn7850-pmu: failed to match any schema with compatible: ['qcom,wcn7850-pmu']
> 

Posted below change to fix this warnings
https://lore.kernel.org/all/20240720052818.26441-1-quic_jkona@quicinc.com/

Thanks,
Jagadeesh

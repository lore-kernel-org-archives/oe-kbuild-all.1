Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB451D555
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 06:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733727435; cv=none; b=F+nW9AwBkqj0hP25eysT+3Et7udaaEiFkplkXwZLNWLLNtUsJVtdJsSFNY3hWGTRs0dL+ryq5rvpXus2mwfsqKbacChuIjwrlybDXaw/51lTt0K65caEQZYkyfnN3d3T6Z+cHGbQKePecAr+fQhM2QGgPo3mCmSsSZnxdctNt0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733727435; c=relaxed/simple;
	bh=MPEFIdQ8Bu/ia699SckXDn3Mrzv58kmDf8uy9Hdm77s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KidZzH+gbKF/Jo4RaHzO041hTfM7Ebq2RaMrm6AW94+mGOFjM4Gx7LvlhuGIfXoKYrbio0MYwykm8f6ymx4ZsCUlrTxDEuRmePwVfX93+WTtQlSpecykonM3f7FTbPecDGB3OJgvLCqltSYxUrn+pYn1a7a9+TrEDEvwba/MUwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PhmIsa9r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PhmIsa9r"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8NR0eT005904;
	Mon, 9 Dec 2024 06:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UPQrbwKLMc1aTxfBSst4W4YEF32HnLuWsT6LGHsy6H0=; b=PhmIsa9r7J/t6Zdb
	hUKITPEJ2H4h3mVRpcPZs+o13MoCbkczGLIVKoZm0Zyrz5+VR/EBxUE5cGdXRVD+
	AKZ/ZLgkbma+Nw4LxClCetrKMjrrNitL3kiRL7GCJ4Qwjgz/QdujDEHnIMcJioHc
	HnsPpIJit6Wg3mbx1gj1/dQPpC1TuCKXhX+dGPotcXX7r1i0H/xFUoyouoYsjlKw
	EjtQQdRpq4bqBl4pxgntNytUWc3R+tcmaUS4D1WwVWYUSqy9D2ipija88ohwfdLu
	TTqrBcLCevOXi601U3g/5lbgtFpOWSVrSm6xzoMrDeeVXbDOBgQe/B89fZrfYpeE
	iGU8Cw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cfn8uj5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 06:57:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B96v8IB015366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 06:57:08 GMT
Received: from [10.216.63.9] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Dec 2024
 22:57:06 -0800
Message-ID: <a3bdd990-70aa-4948-a70b-e6d48fcc1bc6@quicinc.com>
Date: Mon, 9 Dec 2024 12:27:03 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1007/2462]
 arch/arm64/boot/dts/qcom/qcs615-ride.dtb: usb@a6f8800: compatible:0:
 'qcom,qcs615-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3',
 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3',
 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom...
To: kernel test robot <lkp@intel.com>, Bjorn Andersson <andersson@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
References: <202412091110.kq7tXw3J-lkp@intel.com>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <202412091110.kq7tXw3J-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DcIdiAksrqkL-tqtfRCEIEfkzYjUWLnA
X-Proofpoint-ORIG-GUID: DcIdiAksrqkL-tqtfRCEIEfkzYjUWLnA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090053



On 12/9/2024 10:38 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
> commit: 4b2769c7d7ce47a64f874eac92b324f3561339ab [1007/2462] arm64: dts: qcom: qcs615: Add primary USB interface
> config: arm64-randconfig-051-20241204 (https://download.01.org/0day-ci/archive/20241209/202412091110.kq7tXw3J-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.2.0
> dtschema version: 2024.12.dev3+g93ee800
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091110.kq7tXw3J-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412091110.kq7tXw3J-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>     	'qcom,kpss-wdt' was expected
>     	'qcom,scss-timer' was expected
>     	'qcom,apss-wdt-qcs615' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
>     	'qcom,msm-timer' was expected
>     	'qcom,kpss-timer' was expected
>     	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
>     arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/watchdog@17c10000: failed to match any schema with compatible: ['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt']
>     arch/arm64/boot/dts/qcom/qcs615-ride.dtb: rsc@18200000: clock-controller:compatible:0: 'qcom,qcs615-rpmh-clk' is not one of ['qcom,qdu1000-rpmh-clk', 'qcom,sa8775p-rpmh-clk', 'qcom,sar2130p-rpmh-clk', 'qcom,sc7180-rpmh-clk', 'qcom,sc7280-rpmh-clk', 'qcom,sc8180x-rpmh-clk', 'qcom,sc8280xp-rpmh-clk', 'qcom,sdm670-rpmh-clk', 'qcom,sdm845-rpmh-clk', 'qcom,sdx55-rpmh-clk', 'qcom,sdx65-rpmh-clk', 'qcom,sdx75-rpmh-clk', 'qcom,sm4450-rpmh-clk', 'qcom,sm6350-rpmh-clk', 'qcom,sm8150-rpmh-clk', 'qcom,sm8250-rpmh-clk', 'qcom,sm8350-rpmh-clk', 'qcom,sm8450-rpmh-clk', 'qcom,sm8550-rpmh-clk', 'qcom,sm8650-rpmh-clk', 'qcom,x1e80100-rpmh-clk']
>     	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>     arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/rsc@18200000/clock-controller: failed to match any schema with compatible: ['qcom,qcs615-rpmh-clk']
>>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: usb@a6f8800: compatible:0: 'qcom,qcs615-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3', 'qcom,x1e80100-dwc3-mp']
>     	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/usb@a6f8800: failed to match any schema with compatible: ['qcom,qcs615-dwc3', 'qcom,dwc3']
> 


Seems the patch for bindings is ACKed but not merged yet:

https://lore.kernel.org/all/20241017130701.3301785-2-quic_kriskura@quicinc.com/

Regards,
Krishna,

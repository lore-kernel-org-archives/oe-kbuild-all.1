Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFA83BB2D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 04:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706761902; cv=none; b=PTry8FPLxQlVIQmsfLTAKVSXGyOH8kty0YmTZT8GAn5/MGTx/A5oQQo8hFad67xd1ENGW/0dZB6iuQ5zKydwa4CqSiO6AB3x1asitEonYDZS+VFHv4E6Gq5sNdBRrX/Ggs3tT/UCIcLjgtPK3Ju5PvIrMUI8P4aW8RItgKryeuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706761902; c=relaxed/simple;
	bh=Bow85HGj2fxLzFu4V4BVJrfp+sZIrqEEwb71uaynrqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b12HYj4v7mtA0niFlPEu0QtKZ25Fvs7Cz/eReVRkNTXxdD/D7ro1hJV8rqo4eES1qMRFNy+q2GyYk3kneL5FCBORkdr1QfUA08t9AJ92GxcJD1LgtuDEM+8YDykTLXhgyREEy1Bj1QWdhpXebYpF5kH+EPz2TyETlMMLIlgfdcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lbLAspWi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lbLAspWi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4112mZvl004382;
	Thu, 1 Feb 2024 04:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=G6e38TQkpH6OZW9trfvxgRpSiAfC5gqn8DNebRy7qnY=; b=lb
	LAspWiOunu+iiLPvhhI8MLyQ8BEZ0AcNO2afVwuHNTGey9e4J3Km4UnilK4KeNqh
	IAR5aNImOiByPtGuv93xb702KSli7YMiNUEHoucxvK2rHJTxfhVblyzg9MRgwsW+
	lTo5ncElzYvkJmAVaVnrWS5DcLm1NFDWZULycKJ3CF10KdTqg2ZCuCC11iSAtaca
	+lyLLg7d1L5FySthor22Pu/CMBQ3XWXXdvFJ76E0r2DXaANyZlvzbKqepSbt4Srt
	RPOXwkiV5HF/Vk03Ia2No1HHueMtWAde79yhGpOv5xBdoY+s7pcFoQ4V8Mb7Wgco
	W3nattYDSR0V5Fc58niQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyx6drqg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 04:31:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4114VRtv016152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Feb 2024 04:31:27 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 20:31:25 -0800
Message-ID: <a2fb59bb-6090-433f-9c3d-d35aaab93e70@quicinc.com>
Date: Thu, 1 Feb 2024 12:31:22 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvalo-ath:pending 47/100]
 drivers/net/wireless/ath/ath11k/mac.c:7949 ath11k_mac_fill_reg_tpc_info()
 error: uninitialized symbol 'eirp_power'.
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: Wen Gong <quic_wgong@quicinc.com>, <oe-kbuild-all@lists.linux.dev>,
        <ath10k@lists.infradead.org>, kernel test robot <lkp@intel.com>,
        <ath11k@lists.infradead.org>
References: <202401311243.NyXwWZxP-lkp@intel.com> <87ttmtvfx4.fsf@kernel.org>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87ttmtvfx4.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 41Ph1nP25RKy1cTXV2TrIqW6cONyWe0T
X-Proofpoint-GUID: 41Ph1nP25RKy1cTXV2TrIqW6cONyWe0T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=724
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2402010033



On 1/31/2024 8:35 PM, Kalle Valo wrote:
> + ath11k list
> 
> kernel test robot <lkp@intel.com> writes:
> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
>> head:   2c471f31297856be56f60ef29f2565dea1470800
>> commit: 92425f788feede9bf152ecf3fb7a264942ee7719 [47/100] wifi:
>> ath11k: fill parameters for vdev set tpc power WMI command
>> config: i386-randconfig-141-20240129
>> (https://download.01.org/0day-ci/archive/20240131/202401311243.NyXwWZxP-lkp@intel.com/config)
>> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202401311243.NyXwWZxP-lkp@intel.com/
>>
>> New smatch warnings:
>> drivers/net/wireless/ath/ath11k/mac.c:7949
>> ath11k_mac_fill_reg_tpc_info() error: uninitialized symbol
>> 'eirp_power'.
> 
> Baochen, could you take a look at this new warning and if it's valid
> send a fix for it, please?

I sent the patch yesterday. search
"wifi: ath11k: initialize eirp_power before use"

> 

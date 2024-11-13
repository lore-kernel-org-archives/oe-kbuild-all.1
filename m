Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA9513D8B1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 17:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731518191; cv=none; b=Drnl5wogAAfmAWnMBLWO/2181LJzixcMU6Ui1ttYbLmomTPASlYypvGHiHAjf8jot0i93WI3+2sLAC07RX9REWgTyZjIkaQti/MJgH53uRJJu6/d/E9F7NTC8VXEkhwXTXRcqqm5IzT/SHrvAsIjcIr3b65IdWscKs7R1zmz9yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731518191; c=relaxed/simple;
	bh=en7TYb6TirQTq7kkRvUmoo/k01jN6qgNnms0aJqCRAU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=O3z/5Scq4TBKpNZUeKAEw+ahhRiIEQGveZvs5oqg6rlik3rWUkLnXKx+1LSOZ4qDFkvP/pF3E+m+JoCH3/guNowjOH87OS5CjVAS4Wgkmf761D+goYQGmEv0X3STjl1KeiQKls/cu6QCxiM0qTTnYTqwKpdi92awlu/RkBaqlJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RuREIlFY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RuREIlFY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADH1OrX021966;
	Wed, 13 Nov 2024 17:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8g77kHJp6HNf9b386cn6ZLjFnZjpzGTHSTOQcBWu1m4=; b=RuREIlFY1iZhosun
	IAbc2Lmj1IMoi+DB+68FDTUf9S13WvMZ4rcsV1tLtq9O6yDFgteSRsuZu0gceIlt
	pICKky1wO/b0EhujrANwrzciXfX3rqoL9AahuF63xkE/pRmFAW/j6qQODyJnkpPr
	IF1oHFqb0y2+2u9lJCFbmRBykD28qglRFWDuB9uLDvypZWFzriRZ4RG3rAnwWg2A
	bqtzXUGyYyTd4NQNHwrFYRid/smAVNoba1VZlIdCYT+u4BoQlhg2gF3aKkZgUSZF
	DIlPbwPCwzjLmt4s9QLxKutaW7WzCbUNfdYZ9ikS9ldaiMraPKA4t148crgQ74pR
	fZmsiA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vsg5189m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 17:16:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADHGAOv007511
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 17:16:10 GMT
Received: from [10.48.243.207] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 09:16:09 -0800
Message-ID: <76d0d0d3-d21b-4ce8-b6be-9bfc1cefa748@quicinc.com>
Date: Wed, 13 Nov 2024 09:16:08 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ath:master 2/4] drivers/net/ethernet/intel/ice/ice_ptp.c:165:15:
 error: implicit declaration of function 'ice_read_sma_ctrl'; did you mean
 'ice_read_sr_word'?
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, kernel test robot <lkp@intel.com>
CC: Jakub Kicinski <kuba@kernel.org>, <oe-kbuild-all@lists.linux.dev>,
        Jeff
 Johnson <jjohnson@kernel.org>, <ath12k@lists.infradead.org>
References: <202411131838.DE0FWg8Q-lkp@intel.com> <87ldxn2yes.fsf@kernel.org>
 <e571606e-b472-4a0b-a293-6716957649f7@quicinc.com>
Content-Language: en-US
In-Reply-To: <e571606e-b472-4a0b-a293-6716957649f7@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O7FKMSoWARlOEPCxK3flpHgdfS4kCSDM
X-Proofpoint-ORIG-GUID: O7FKMSoWARlOEPCxK3flpHgdfS4kCSDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130144

On 11/13/2024 8:06 AM, Jeff Johnson wrote:
> On 11/13/2024 2:58 AM, Kalle Valo wrote:
>> kernel test robot <lkp@intel.com> writes:
>>
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
>>> head:   fc6f018eda7f9054e427f731db1e8b200f22873c
>>> commit: 33e2bcda33620fc43cc948627be525ddb342c446 [2/4] Merge branch 'ath-current'
>>> config: arc-allyesconfig
>>> (https://download.01.org/0day-ci/archive/20241113/202411131838.DE0FWg8Q-lkp@intel.com/config)
>>> compiler: arceb-elf-gcc (GCC) 13.2.0
>>> reproduce (this is a W=1 build):
>>> (https://download.01.org/0day-ci/archive/20241113/202411131838.DE0FWg8Q-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202411131838.DE0FWg8Q-lkp@intel.com/
>>>
>>> All error/warnings (new ones prefixed by >>):
>>>
>>>    drivers/net/ethernet/intel/ice/ice_ptp.c: In function 'ice_ptp_set_sma_cfg':
>>>>> drivers/net/ethernet/intel/ice/ice_ptp.c:165:15: error: implicit
>>>>> declaration of function 'ice_read_sma_ctrl'; did you mean
>>>>> 'ice_read_sr_word'? [-Werror=implicit-function-declaration]
>>>      165 |         err = ice_read_sma_ctrl(&pf->hw, &data);
>>>          |               ^~~~~~~~~~~~~~~~~
>>>          |               ice_read_sr_word
>>>>> drivers/net/ethernet/intel/ice/ice_ptp.c:187:16: error: implicit
>>>>> declaration of function 'ice_write_sma_ctrl'; did you mean
>>>>> 'ice_write_intrl'? [-Werror=implicit-function-declaration]
>>>      187 |         return ice_write_sma_ctrl(&pf->hw, data);
>>>          |                ^~~~~~~~~~~~~~~~~~
>>>          |                ice_write_intrl
>>
>> Our ath.git master branch is an integration branch of other branches and
>> it's not sent forward to other trees. Looks like we did a merge error in
> 
> By "we" Kalle means me. :)
> I did a bad conflict resolution and have locally validated the correct
> resolution and will be updating ath/{main,master} shortly
> 
>> the master branch but no action needed as it's only within ath.git.
>> We'll try to fix it the next time we update the master branch.

this issue should now be resolved



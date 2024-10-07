Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D963718BBB2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 15:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728315642; cv=none; b=vGTvZimqlhLYHHk+Zslw/k1/hiNaipw4Z7bdMPSGZvUo0Mpi5DFN65SuWPxMKYmrHS+8khTKvX5LNrurAUVsEzdRF6hraYF9UgysEFfv2/ccCVXs7NV6REr8pegGu0g2suMKHF8qvuN9X6b8DpXXlPMWzw8ohuZUbsuqAEkz62Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728315642; c=relaxed/simple;
	bh=6Ebnz4Z4eXDCuO9MKzOQarzmDTndViv7izgScfQ7X28=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=J4DePtW1rtKJj7ytmvJvieqTj93hvXUAl/qUmel+N1ljx6zd07PchHQy6nM25mtv2T4Bhi7+S2Zd1h3QSBXaSh2Rc5XrVXs4SCbpO/erQvJDPChuxzfO4kZjKOyqZa5UL7kRUTdwZcLfYmsNo/gZ3iK8NP4Q5qMibqJEitBdJNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h8/ArshJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h8/ArshJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497EQi3e026049;
	Mon, 7 Oct 2024 15:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqTxEhawrs7UQJGbNOLxNk1YbqCgjLkZUyV0nVuHG+k=; b=h8/ArshJ4Yx1TbM8
	VW7ej+9MhzF9NmKp5lvBpCt1bwYC109B1/YlbUbXpN3AEAwiol4dp067UlLJJPED
	40X7Rz+NsREP0f423jVFATS6y+0S7dn6ejnJV8MSLUDQF1SckLcqYZga9uiKu7r5
	MfgRurSvPgfqbb10g/6yP6HK4bH/CWu/utRxAvxUDGVjTQboLtBqy9dxUg4g5EaY
	oPU6sIGWFBZajO5b6RI5UXGDxQ+cA77KnkSlRGSbMFH7WuhP7YFhVctfo5GCiEZV
	A7Kv+74nSIEi7Ceulyrr3u80rkUFfpI9GlRp7i8hUTVAPfKnjrV4gegQnwv5GCIu
	iJQ/Tw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xtb4na1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 15:40:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497FeWX1012968
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 15:40:32 GMT
Received: from [10.48.240.101] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 08:40:31 -0700
Message-ID: <9db6842d-ddc6-4f0e-a818-c13298eedd8b@quicinc.com>
Date: Mon, 7 Oct 2024 08:40:30 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ath:pending 8/12]
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2515:77: warning: left
 shift count >= width of type
To: kernel test robot <lkp@intel.com>, Rajat Soni <quic_rajson@quicinc.com>
CC: <oe-kbuild-all@lists.linux.dev>, Jeff Johnson <jjohnson@kernel.org>,
        "Kalle Valo" <kvalo@kernel.org>, <ath12k@lists.infradead.org>,
        Roopni
 Devanathan <quic_rdevanat@quicinc.com>
References: <202410040200.Mwb85JzQ-lkp@intel.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <202410040200.Mwb85JzQ-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Qis-msQnFUAn6eKybd6QDmefT1srU9Zk
X-Proofpoint-GUID: Qis-msQnFUAn6eKybd6QDmefT1srU9Zk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410070110

On 10/3/2024 11:37 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
> head:   08dd5d93509f962500dc983864b4effb2600831a
> commit: f6a46bc3719cc6b445cb071a7dd6968891ffb169 [8/12] wifi: ath12k: Support DMAC Reset Stats
> config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241004/202410040200.Mwb85JzQ-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040200.Mwb85JzQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410040200.Mwb85JzQ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c: In function 'ath12k_htt_print_dmac_reset_stats_tlv':
>>> drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2515:77: warning: left shift count >= width of type [-Wshift-count-overflow]
>     2515 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->reset_time_hi_ms) << 32) |
>          |                                                                             ^~
>    drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2519:81: warning: left shift count >= width of type [-Wshift-count-overflow]
>     2519 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->disengage_time_hi_ms) << 32) |
>          |                                                                                 ^~
>    drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2523:78: warning: left shift count >= width of type [-Wshift-count-overflow]
>     2523 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->engage_time_hi_ms) << 32) |
>          |                                                                              ^~

Out of curiosity is there a way to tell if this is a 32-bit build vs a 64-bit
build? I just want to verify that the issue is that unsigned long is 32-bits
and not that the shift occurs before the typecast


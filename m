Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC7F221265
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 05:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759124644; cv=none; b=ptYoE0e5pprxgDxldtWySDKmZyEid1ASELkNzFqXsJs4bmha4ya+dLnbkeootxKuUgTY1C66E2c13Fa7U67t34tdjhLvC8RUYtIcMArGZRrchpDSIJJtwCN5bU68twXDqy1bj+Y4zTyI4eimVOLVTJIskgxenmFbdjeCvjaUFUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759124644; c=relaxed/simple;
	bh=HNiufS4QgvTOpQO6FbL535zp3vDJ1un9gKIOCDv3sjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+ft2NWpenQszDVvlW4EO8mZpuls9K4BZDz3dNQLg61HU7UkaeiIciE42Lb/S/WvqP7mTqVKQwMjlcXS556Twlaknf3bQDDWv+ndTnQcfdndJNjBaZ/x8+WSt6IRhkbHDZ1kilGZzR0T85DtcBrzXHp4uu+q97v8bCBJlzs1sAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIHEcR5x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIHEcR5x"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SLpgbu005609
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 05:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0shxXdl1M5m67yzuv0GXcdasQMNMQSFmS4e9Kkqn+q0=; b=TIHEcR5xYDni68va
	mvFrbiD3QDfdFSWmiApYHdvRZVAKo3xoMvn7BRgUZyj96EoyHLHafET5Jk1vWyiz
	j8Kiw9bRu4abl1Cd4hFfMrUIwujTUOOz4xgETwjcb3bYRxze4ZzcStp6VEJbBGTZ
	3w15+a4okVTN5AN1oWwH91AV193U8Q3+UIyr3yLd9mrVdcganr+AxTWfKebM/RlZ
	uwUyHsq7fNC4TJVow/cGF47G5uyHUAgt2MoTORl3TvCE+gsLXDoX3hLJ72u0jL+U
	Pvt7hjNYdqpXx/yePxgZbNcnYkES/Q9mG79E7vUFuFl21W3v/HHZD3xbVdPBYluZ
	AeNgJw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vqv26h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 05:44:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33428befb83so4852582a91.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Sep 2025 22:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759124640; x=1759729440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0shxXdl1M5m67yzuv0GXcdasQMNMQSFmS4e9Kkqn+q0=;
        b=ohDVREaEtSVg+QCW0wRz7XB+GGRP5eUnLxMN7zLJ5UjeFG7R59L8VTarebJ9Gcsi4O
         Rvw7+hwLvr006Wwv6dqpSXfJE/3Qg+lRiNyonwoPbtxMHilFQ4enMHN9Zo3nTGtVgZrU
         llbvT7sjUgjC+7jYvMVMFOijQBTEKEV18V5HVUf85Ave8r7ryn5ACM9h2qh/Z3l1ENaN
         GnSRrNcAerA7ZEmK5MFt8JweEmy3csRcy1n/MN5Wr2MXu3aHVIVEZyrsiSGh6/DNgkqM
         xUon40XUFikqZMvONp043YUrvx2NpdhdDA6xKRttD7qM70MB/2MCPEf41b8+zOIQWPka
         mNKA==
X-Forwarded-Encrypted: i=1; AJvYcCUY8QaRGG2sBB5i43DcSM3IoUncP9XaHZbA2V3jfW/ndeWFmdz7B4hyFbR3FYwSbhkDUiMhA7jXBf/6c+NH@lists.linux.dev
X-Gm-Message-State: AOJu0YxLb2uYCMd4zgJvszofCEpGFXyfD6sUmM2POfANkurlAmIGbvxl
	x7rhfRa2sqKhxFFvCn2H4vqZT4F305ZfRb9O3DB03DRvPc7tAGaG5QpRY9OyR1HDjtR2NE/5x++
	2Woejh79HxfQW296ni9JAkWfgTi92fMDLl2I35tJJlWW3YsdYMOu8NDWhj3I3Av2guXfB
X-Gm-Gg: ASbGncs2WN/cEZbVUPApdeZlyxNqEUwh5uDDUp1Qp7e1myCNosKzr30GybW4Z1o+fjx
	ZWdXsKcV2T9evPA2q3wN2c7qPxAYrqpxAJ0mGVPPJEXuLXjjh+fAo10GVtqw6FLBU/MIHeg6UmG
	5xCo/q60DVU3yMivZsJa2evpGMGlK5QX9Ip2un5W07jpbPEuol86P8ZUlZv4r43kz1Z+R5WvE5H
	IowlvRzD8r4us/7eGbUR3LNa2XCM6vrXsxqsSk/tpOfuu/tDVvsP5sY0gNQcrM2vzvgmmtz9a7d
	Q8D4UL85fHfdRhi9iBlKDXvOpVrB+sHgdAHn4geembidkEHVi9QvE4xxbed6g4ds3gk1J18mTjs
	x7er86VralwiBKk/caN60P51L3TAnP1RTZHM=
X-Received: by 2002:a17:90b:3852:b0:32e:24cf:e658 with SMTP id 98e67ed59e1d1-3342a22cdc9mr16537636a91.3.1759124640449;
        Sun, 28 Sep 2025 22:44:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl7IE2Pt6RQ3vYJq5zb9BDkApqE/UvUl6n0SAk0jFAYj2ocsRLqMrO3x/ZsK3UmEKV+StagQ==
X-Received: by 2002:a17:90b:3852:b0:32e:24cf:e658 with SMTP id 98e67ed59e1d1-3342a22cdc9mr16537609a91.3.1759124639982;
        Sun, 28 Sep 2025 22:43:59 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33435b4f180sm6031452a91.4.2025.09.28.22.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 22:43:59 -0700 (PDT)
Message-ID: <65338db5-d255-498f-96cf-bd037aedcc36@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 13:43:53 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ASoC: codecs: va-macro: Rework version checking
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
References: <20250924-knp-audio-v1-1-5afa926b567c@oss.qualcomm.com>
 <202509261315.O9CiiXjb-lkp@intel.com>
 <e7843f88-71d5-4f7e-9f99-df06630e02fa@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <e7843f88-71d5-4f7e-9f99-df06630e02fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BrYTWsvsL91X8esIr-VKGfUCSU78RvIO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfXxXBeQuuOChyV
 AIi4ZnehgDTAhR9wVcNrww4upuq5PP7lqYIwSDB6NzwNuGS8VOwiSEFySsJQZduLHRTjF6qmh3x
 waLWS9k+t2LDINB4M3i27wbZCslu5x3P6CnmcFd6tTiABapYST2ugMswXLgxPTL55sBk05QkHUI
 v+b6lgsvXFBU+zhK8lU/snQmOxQkt5E7bxU4rgKFYBm8EHWSKl1bfyl2haOIg4SFa9CRc704k9S
 s2nGOEXrGjA164iPAB6zYitaNsg+v7x6cqFXkR8OHWewPmwX8xfw6XKMWIQYXc1eumI/BE+q25p
 9jfyPxWPIq5RRt7XQrzpnUOe3una2UdlDRmr/ae2wZda2UtaaqwAo8Vvt75e+tmfz3jIETIbD68
 fEe07SjeyFFn1Ij2yEU0v5QLPqbsaw==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68da1ca1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=H6HILBvNmDOxdPU26TMA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: BrYTWsvsL91X8esIr-VKGfUCSU78RvIO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017



On 9/26/2025 4:50 PM, Konrad Dybcio wrote:
> On 9/26/25 7:36 AM, kernel test robot wrote:
>> Hi Jingyi,
>>
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on ae2d20002576d2893ecaff25db3d7ef9190ac0b6]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/ASoC-codecs-va-macro-Rework-version-checking/20250925-080338
>> base:   ae2d20002576d2893ecaff25db3d7ef9190ac0b6
>> patch link:    https://lore.kernel.org/r/20250924-knp-audio-v1-1-5afa926b567c%40oss.qualcomm.com
>> patch subject: [PATCH 1/5] ASoC: codecs: va-macro: Rework version checking
>> config: i386-buildonly-randconfig-001-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261315.O9CiiXjb-lkp@intel.com/config)
>> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261315.O9CiiXjb-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202509261315.O9CiiXjb-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> sound/soc/codecs/lpass-va-macro.c:1479:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>     1479 |         maj = FIELD_GET(CORE_ID_0_REV_MAJ, val);
> 
> Jingyi, could you please add:
> 
> #include <linux/bitfield.h>
> 
> when resending?
> 
> Konrad

Will add in next version.

Thanks,
Jingyi


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE91D28C5CA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 18:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745431564; cv=none; b=CvuZch5vMjyjWXNlJSwFwQCpl+li8444xSKzTQsLQzKLCERfihNRO2G/7prw0Ga4s5BLqFzHBJ7daL0Q4gIuGLWyPWsl3yVQ7sjZ0mQLzu4X/LLDtrH0Pljwwk5LTHvI8/x/DOsfgMHN3d5THGphVeLbOwUY+DRoH72jr7F02v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745431564; c=relaxed/simple;
	bh=+sZPVtVlSFQLAyBPuIDI8PsMq/i8uNZ0PcmkYsFTrrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7esHPateYX/PyJRqID6JgKUVOlhpLnyEoMjsBWTGuwJ32uw1Y4gWcaz8eYuy/kRhqpWIkNYgedpfQ8mnWgZkd6NVtwlyDz3KE0nNygsR+PhVKJCzjCqXK+V2i4yndzmcUEJ6V8mYWOpa+6gU3pjIhWQeA+B0ja9RLhG8X5wxAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzLZkDzF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzLZkDzF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAX8lD014547
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 18:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BaE3ugE5vPzSinlOeagCJcB8zCB5MqDkxFqSX7SGm5E=; b=MzLZkDzF6Gd/ZMYv
	VKlitnGJYzKA7e/Kw4n31LTEjugRCsbvh/w6VHFU4Nu7Wt4xVpKxorocveN/+YKT
	EFyp9sovYvLOrXzNGJ4hpMLIgdS+F1hsbw9ry+IypidI3wDHU8ze3oMVB6p9jPnS
	oIMzx6ohZ6c/wFK6Es6Qqp4wJ7+g5uHwL1Gc6/+43SKLI8B8kJItjcfaBhP471Wd
	nYDuG6gVbGl1Bw0DnCqHuLEQJYOUbQ6sBKpBzJO2GDM4CQGVoOiIXltjgNT0NV90
	XtAJfz/RZnNxhyBkvNtgVElKuURrcAivmd5U/7UvGhiSLcBP1KirhQNQVrrNPHrm
	3WXR9A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0k0up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 18:06:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736b22717f1so757505b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 11:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745431560; x=1746036360;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BaE3ugE5vPzSinlOeagCJcB8zCB5MqDkxFqSX7SGm5E=;
        b=uGhQt/JsiYyGavq410I/AaWUc5ezHkESI/VDSMC+lrvEabYkJznoAo8iJKaXB/Pxc6
         gpOJtOX0//i+B5DlfIYuJZsAl9ZpCdmpneCxoY09LoEie0ddVcY7Eu2IhXCgGnApWjm4
         6jDJrZdScHPmdWAZNLSKOJnkAZvn4RVu62kVYiSCO0FsrxMuJu57I4jnlmATcTvnFx4d
         tTJtCrkL1inBzU/yf8svBLW7VtYM+NbDanV8A2UCWMbnHd0N1icrD2wW86K8mcSgrQuy
         Pvvkv+RRdGb8NQiHvxPzYYHVASlhq5gt7Swb+J7EuLar4hKoUQqZdsvrjA8MTW/qCr50
         IxPg==
X-Forwarded-Encrypted: i=1; AJvYcCWr8YrdWyhl+MRmvCP6X3lPsE9I6s5fLErWeziXMyBG5gE/z6pr15bPBJOmcRNe8Hd2aQ8n3AfFbzb5NH30@lists.linux.dev
X-Gm-Message-State: AOJu0YwQRiZVIVPQwNBoREff6yUeyF2qLmn3L7I1n2yBKT5u1iHeQIle
	GnnUHkIZIfFI8wJuG68QcFKkWRwxgaw+RXrcTis6ibDL56VMC5xmZf2WWPrxMcXRl4x0+PnRayB
	OIdJtpAHPFQnb8/VcTityxgFbIDLSqG0+TRqH11vD8ph7LnRYmC41ZSPNQKBnrAVO
X-Gm-Gg: ASbGncs434lqeGa3SYHA1POb19rOrU7GgeGfMoKNKght8yYGw5UvcFaAXuxm/eR5woy
	8mShapgFcdksVZRt4qEFbsfchvUMFdc8Sv8GTsaKMihv9qdto7te/HKVhHYA7JUtDqkJUmnu+74
	IrDrlKOO9mocdnJ5DFZcK1JTbUJiUJM/mRVp/XUeSuiSHfJ5c48O5+F7/d3VB678tbyf1QvHmwM
	wMmBb/zpThNJKSWOdbv9yFGs2+r0O4ywGxfMoyU41MC8pW58FnYaFaGaO9RQLztAxhK0RIhPECg
	I97KGxzCM5OhLV0DOue8w9ry3qVPjnTrD2x0wPkOCg0iZEiEwKnRQgA2Ux9VKy9L7rQBkBkBX+Q
	HtgPm
X-Received: by 2002:a05:6a20:7350:b0:1f2:f1a8:70ca with SMTP id adf61e73a8af0-204428732fdmr222586637.5.1745431560150;
        Wed, 23 Apr 2025 11:06:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMrARP/m9bsGTLL17jz8nZcyUaPfX9EbmJw5sWgd+pENLjq2lyoM/AdSZbE+MxuS5BlOOl4w==
X-Received: by 2002:a05:6a20:7350:b0:1f2:f1a8:70ca with SMTP id adf61e73a8af0-204428732fdmr222551637.5.1745431559766;
        Wed, 23 Apr 2025 11:05:59 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13a4084sm9362325a12.32.2025.04.23.11.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 11:05:59 -0700 (PDT)
Message-ID: <99d239c6-e276-4a16-b7db-6e1f8ecc0bf6@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 11:05:58 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: allow beacon protection keys to be
 installed in hardware
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>,
        ath12k@lists.infradead.org, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org
References: <20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <202504220128.2KvxCzaG-lkp@intel.com>
 <47ea4e64-cd87-4c42-a20d-f663f197e44c@oss.qualcomm.com>
 <aAhEc8yrW4vcrE7J@rli9-mobl>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aAhEc8yrW4vcrE7J@rli9-mobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QUDi3Z1YadmvGGISe6FC9onNFWBNitM8
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=68092c09 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=mHkUAZ6zn0caESaBz8IA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: QUDi3Z1YadmvGGISe6FC9onNFWBNitM8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEyNyBTYWx0ZWRfXykZ1FweNu/+C xqeFCvMQt+hcwuQ7x4OCtm8GuwOe4EI3gf7iA+7vrAlRcyT7Qml1KDKChPRbaHjm4plE+2wgzhp eY/5Cb6nK2SGEZ3hA+aL7c8FuDdSHYveGE+yJdrhpH/puOQx9/99oNxyVShCmpEV0Ldt76OnbBN
 A1BlRtUaXq/EpzxBMN36JSTPNflXLJa3SLPSQqp+Q3NTsphN8C1ExOeLdtKCDrTJ9X4Gu471Wx7 283VmI6mNA+UAPa+Z+wJpYeXzRVbVYZE8aeBrJ5XxZ4GF6CL4TBvrzyQnvuHXj2rboD5l/CcAKr qvP0GTknuH0Gehms6dV5qrB+Y3iB6UvP4EXR85q0h2nPBEN9uccxlVAO0Jb2NCSrxoNpJRFYIoj
 nldG7KsoQNv3oEEhKEYu2rlYTWWLMTnXbynXWaGJJM/UJDPotr79EinBW+M/hD6ci/ZqfDbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_10,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=522 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230127

On 4/22/2025 6:37 PM, Philip Li wrote:
> On Mon, Apr 21, 2025 at 11:44:46AM -0700, Jeff Johnson wrote:
>> On 4/21/2025 10:16 AM, kernel test robot wrote:
>>> Hi Karthikeyan,
>>>
>>> kernel test robot noticed the following build errors:
>>>
>>> [auto build test ERROR on d33705bb41ff786b537f8ed50a187a474db111c1]
>>
>> lkp@intel.com folks:
>> This patch contains the following footer:
>>
>> base-commit: d33705bb41ff786b537f8ed50a187a474db111c1
>> Depends-on: <20250421111505.3633992-1-karthikeyan.kathirvel@oss.qualcomm.com>
>>
>> Is there a different mechanism needed to tell the robot about the dependency?
> 
> Sorry for confusion, for now if there's base-commit specified, the bot would
> only consider it as the base and apply the patch. And actually, if there's
> a dependency specified by link, the bot so far can't recognize it well.
> 
> BTW: for this case, does it mean the patch need be applied on this "Depends-on"
> patch, and this "Depends-on" patch is on top of the base-commit?

In this case the Depends-on patch is applied on top of the base patch, and
then the actual patch is applied on top of that.

/jeff

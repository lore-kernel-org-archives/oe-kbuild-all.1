Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0B23CC7CD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jul 2026 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535649; cv=none; b=NPu7aie33A58h2xYTdHWZm/aLXcCBoR0bt6wObnbhtd3EL7nqbk2tHDy+5H+fYcYC9Fj8wkXcNJsDkqawJ3BySbdTggGRtmEmW/21DWLU14Q3X3vtwGihI4hcbSptObEa+Dai9EJiKieHJBgJjCNnq1P5DFNdzCrPJ6/YTbM3/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535649; c=relaxed/simple;
	bh=3ofbHdkQLyaJmh+55j6YNCiXAkWiUYQtp4pavUy9odI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iby07nwZaOt5I0NMTRxVf0MejfxKmYzoPqCQyqDrQwIsV+cry3/cVVbMORLE2f+tQy3KM8Iy9zW7WgCrFDCpYfJwDBNJCyEOaw/xO8Ly2wHPUGojmSz6MAloJ5U/dUtfCHh5hJr+GYvwuxRqz2rdukgtpT6vGHyYOv3ofvTwjAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdXAtlMI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HpvYu37J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdXAtlMI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HpvYu37J"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RhkD1774854
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jul 2026 08:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	inZE8OtFvxAFxug6Hq6m0TktjpPKFnKAoO72GdPIGqg=; b=QdXAtlMI6p7u2NdT
	n5ZK/r+7bLwL0xU/wNNcrHl8RsBVgdjIAUzI3cZWdjYr9LFMP8DRK11e9+XbmNRJ
	QV3Rsf8YBKIrBsh5iV35MlqLCg0oTi00C5RMUOKuhtBlan2OyyzXxN+ReQF86jaw
	sdgOFKpeKjJFJ8Fk41objw0JPnGWP1Flrm3VgC9SO7eOqY511QB1cVvC0la2UFT7
	JYbBzQtjqsV1O+Q1gvEopMk0QLz9o1bYdjYgMfCv6deb9vVjqLN/3lUozgSKIf16
	LiAa4qcHKXg6j9CnBcoqXRBg+sP9WanAyMkwUXCqAli88xGpIw2o7/6NL8MBDujX
	9fH+WQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af559k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jul 2026 08:20:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5fc4c7e9so818029285a.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jul 2026 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535644; x=1785140444; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=inZE8OtFvxAFxug6Hq6m0TktjpPKFnKAoO72GdPIGqg=;
        b=HpvYu37JkzI+6/N9bY98+p9EX3eHqP76LrnuKEo+41psEiRMIQNcODVhrG1MTjY1do
         72TwJQXIC4UGTFfOFVh6xWhyUF8ZR54riNq+a1Xt9GmXRla8r72EWpcUG6YZ2u9A2PDa
         7fFZC4twDL7F4pavu/btHBln49NM2A4t95CNiY5x14vf1UoQrIxYlCCvaNkrBXbgBVZB
         dGKQGsW7zX48XFX17i1dxU3ncpTpOU5nC+cHN2GzWri9XIjgBriJ5ditxgSjWotS3QU3
         wHDd46o/W+gou5U3qZ/NnOHF+oWjobuSMfl+vX41GaZ9KKTDe9+QO1SHSTh9Jcs42Ekz
         4wTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535644; x=1785140444;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inZE8OtFvxAFxug6Hq6m0TktjpPKFnKAoO72GdPIGqg=;
        b=Hr76UP0s0AIQkWCn9xQ5WjxYxcixCsPq/RxsTNRTM7kW236+RpW6QdzXAuOoZv5Bt+
         E5jr0t7F79wmCf5ZXaFWVvdxteKycrpeet3EODLVjrRrccHryfsYhecOuHY9yabXDnaw
         uqWn8Xh+TWpli5+yW6+smfNzKd23ZS/WZtu1DB4pGf+ER0YumwBDgJGRLXjXSQg0YIXZ
         /zYPaKQ7eUsHlI4wE+AskwzDSxkzaEN6z4lCVCkRfJozXnrcFGx5C9kfMtfzOrPWK5jZ
         C6chUWlQSyufAxSXt5twiPL+sh5Wr5AXx8m/yXLAmJaa4YJ6/bOpXfQBspKmoQlEGl5F
         llpg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7DrJWxok1WkYZ9g2aiew70wlxXds9PMRWlxRxmgC8eXZGcDvPdzaWl/zqQHJ+69MyVLam/O+8K7mCsO3F@lists.linux.dev
X-Gm-Message-State: AOJu0YxIc22pE1fSyKohrylsDCbZPycldHZ5SXs0e9YTnGVTAbH1KkWs
	MnkVWaN3fxf/Sjmn+mIon7RzySQ6cuSOgqjVgvJSV2XBXOmdNJoy8qjxXAdtnTVmDHiVipauJW8
	fJfNOjt7QQsSKvG0b0DWdrrKDDEeMZ3cl8FYkXY7BGOmsdxUPQG+gy3RC0ua7V1xzaMmF
X-Gm-Gg: AfdE7ckbEDqM00xPKyoZS3j98nWyfK6+OZUihPXSALcuZZQJWW7YrQ/ElNUylhltV3G
	VGeaF2aKwKDNURKlQ6dg9vLeOf1oumFivMMqPLZNi5YAaYwuqdaP/DEG7pcA/ZczEPe0JRQIgqi
	Q4ncFOvbwh3cZTecn9NocjcOKjcMV8ip6Ya0FLnTrR1ys0jgpY7MzkLL4nirHensJgsjV8TJbPG
	U5NQNo+1qfnsi6BF9IUx1c0KdGD3tb2Y3rUz2CvWEuhUOR8Bxiq/LWEJaz8+Vaa3c/rrfCgcVso
	ynklLKG63AfTkWYsfnYTrv9bXtrKgRIw4H4tEdTH/wv7n59BkOi3eV2vA1eZqdN4B7vcKJ1oZSv
	awOODlio+lOrO6kcq7kH3JM2adas=
X-Received: by 2002:a05:622a:1e17:b0:51b:cdc2:fb99 with SMTP id d75a77b69052e-5213c7e6bc2mr113615691cf.24.1784535644348;
        Mon, 20 Jul 2026 01:20:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1e17:b0:51b:cdc2:fb99 with SMTP id d75a77b69052e-5213c7e6bc2mr113615531cf.24.1784535643925;
        Mon, 20 Jul 2026 01:20:43 -0700 (PDT)
Received: from [192.168.68.106] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1705a09a44sm421795166b.19.2026.07.20.01.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:20:43 -0700 (PDT)
Message-ID: <a157f06e-62ff-4403-a2b2-ee2949dc4464@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 09:20:42 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [srini-nvmem:for-next 28/34] drivers/nvmem/mt6323-efuse.c:6:10:
 fatal error: linux/device-id/of.h: No such file or directory
To: Roman Vivchar <rva333@protonmail.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
        Andy Shevchenko <andy@kernel.org>
References: <202607171922.uQxiA3uv-lkp@intel.com>
 <alpefxfyFTeTEXde@ashevche-desk.local>
 <wqpzujWBNKbobauUvjn9QwShJIVmu87vgzuZP1OPPa2DqdkZQnm3VgZWyuI1kbBfjnl1NXTa4Ar-PNns5x2EHOvHK2hNcmTLPh6DC0WZ19w=@protonmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <wqpzujWBNKbobauUvjn9QwShJIVmu87vgzuZP1OPPa2DqdkZQnm3VgZWyuI1kbBfjnl1NXTa4Ar-PNns5x2EHOvHK2hNcmTLPh6DC0WZ19w=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfX3AoVAernxgOc
 pcAOqL0n8rajhGtDfWHqW6sPSry4mbS72gIn+hOqcDCWrfi3ZPeVqvy5idMVduQPgJvRSl9S2va
 g3eBL3YXIDs/jGBVlvelfMt7WanJE4o=
X-Proofpoint-GUID: q6wx9etuEVeTCtr7f_iQAd3xKRWp9P7w
X-Proofpoint-ORIG-GUID: q6wx9etuEVeTCtr7f_iQAd3xKRWp9P7w
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5dda5c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=QyXUC8HyAAAA:8 a=FjwkfV7wOk5P9iMdDTAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfX1rWdQABsEYFt
 2mL5fE8pWtH7ieT+8hq3rE0gPJEnBYHyyRJ+TPtX1Avabih45VzfGU8M2ald4SgkTah9RcDpM7e
 ABKtLjjMcGSIrrc7XdBuioXYXDdi3OliZE46kQfkBdgMd/VLL6kHBFQl5/C4D3XOdMChuEToryf
 ePskaf98IBk+6zh1H14FT3l633iLlknyrqlb0y0swo9LPe3cxom2wk/i/ZzTMxSq+Rq0YI1gabr
 KEq5vR1nkt3vSAZ1tSxlmspJndH18OXhiv+Y/rJxBDfVNUxDPAbOJqHIAnHyf9K0uf8Ow0kKqrN
 U0RKtfiSb8IuTCPXOgsWAiaXPCYD/JB3+B/UIkO6JrRFaHtCe2/ojdXkDHTgHLkKK/+gu0JBtBW
 sHO72TnTHR8go9mL2GizcAxtKTmvp0WfBmFfpRX2e7+cIB2h1p+rVwS0bgFQm0MMx83Sta5OwQ7
 kIjHhf4BCDr+jUeROLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200091



On 7/18/26 4:39 PM, Roman Vivchar wrote:
> Hi,
> 
> On Friday, July 17th, 2026 at 7:55 PM, Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
> ...
>  
>>>>> drivers/nvmem/mt6323-efuse.c:6:10: fatal error: linux/device-id/of.h: No such file or directory
>>>        6 | #include <linux/device-id/of.h>
>>>          |          ^~~~~~~~~~~~~~~~~~~~~~
>>>    compilation terminated.
>>
>> This header shouldn't be included explicitly. Now platform_device.h is
>> responsible for that. TL;DR: This inclusion should be simply dropped to
>> fix this.
> 
> Oh I see. This patch was based on the next-20260708, which has the
> mod_devicetable.h refactoring. Since nvmem/for-next doesn't have those
> yet, device-id/of.h is missing and simply dropping it still breaks the
> build because platform_device.h doesn't pull necessary definitions.
> 
> I don't think sending patch to restore mod_devicetable.h and then
> dropping it later is a good idea...
> 
> Srinivas, perhaps it's possible to drop the patch from the tree?
> I will resend the patch once dependencies land (and with dropped
> explicit device-id/of.h).
Sure, I will drop the patch now.

--srini
> 
> Best regards,
> Roman


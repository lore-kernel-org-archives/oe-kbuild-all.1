Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3375A352C2B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 07:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779447; cv=none; b=LAIsESisgzY5kGL7jzJfkVp3cclF6P39hWsTHlfnsQZTVdeUR/OScE4hNFHrtLDyY+xENe1HOoGlvkqRLukmW5rmV8zzT6zuKEi2HWxKtHO1U1Wb03XITSZwKyQzIDfqON197IoyVI8d+jt7UHRI+7x0MKHJDvrNefHbEdPYPx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779447; c=relaxed/simple;
	bh=tcfRbKEmqsone2oOskoC1IUAm8HONEnjPT0IjsCWc3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2uYHoh1LdvPvvpHLoCMo3zDQMmC3gt5JAPE/zpL6M/NRhkSMKTQ1cEN+G/n0UuMyCyCuF3NBioYajSX8zqCkchtv87lD2/reQFXjf80bLY/UZAuSCDfqJvUa9XOsf1OqvQyy/oLpIzpzyv9XPQI9eo9Rs8nkZZ4z3kYAZQkmYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/ggxq53; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hH14hxdZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/ggxq53";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hH14hxdZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q6vAZl482918
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 07:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yn04dVNRew+nN+xs2TS/LsA9xv+qkCvAI160R/4Fqj8=; b=a/ggxq53RKFc8aYb
	Pj2jpCxKPBSH+Shv1TGyjDec+onDEBk8PJOjLzemGWULfod9ZbNFLKzukpSIauZP
	5Kjabw52UAxSt7QBNKvEUtPVvL5iGVK4001V4rKTaYu3X5PJp1XQdZbcbpFNDfgy
	kGlHjS54JX0C7dsGE3EuzmsSV9y2+fa/OVJz+l3rCMUXji34NKZvkqc3BCMsAcMw
	LZ22OuIiAYw/ZIYeIGStOlj7Pq3cM9J9UqAPW+h9PQyGQZx3lsZ+3dFVooVQPSnL
	BagmzrHavRX/jL+fXPtHu+yjgUU8sIWr4Rg5ePTIseb11ymPSmaR99bOIO8UdRTV
	YrgqgQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqynahqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 07:10:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516ccfa109dso83865401cf.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 00:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779779444; x=1780384244; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yn04dVNRew+nN+xs2TS/LsA9xv+qkCvAI160R/4Fqj8=;
        b=hH14hxdZKHWU4PRb6bh6aU8Gy0N1tkBQhQFBZFUj2bLO1lsWQPpgIemtRHDo2An1sS
         i4pXRDGhwt00VF+ny4atRioLw9uRqDdU/22oMumTr/IJAlU+ZpH40TTHzLkD57HkCCX9
         b/4WjOA4sss1aI/OsPdWE+nrwWVHT4If4NIZi+wN6paMcSvPQ9WXMP2VTr4f3wWL0A9M
         1ebUMfz4p6qrbzFQuRxGiULFfaNOS468cmHq8/ylWU5shRncpLm4VhZPFrswZx6PFlTx
         Ri92cr7CpBy/ZijJKWwsQBKhePT/GpTks5KkbnN+vlHlWBPNoixbIE2AUPwqdTqsIydf
         /ZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779444; x=1780384244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yn04dVNRew+nN+xs2TS/LsA9xv+qkCvAI160R/4Fqj8=;
        b=gZraX15EyQ4En6pmzweBS/zErbbmRPA83RG7vDlSkU54b2D1Tfmzjv/fTylH8Di5zm
         obxt0mAJ5XQKb6fxO6IFTAoAgpS62SvX2IpFlG30mSew5IaCIZWASihgiwQJyI3zGODM
         AlT5ZYlN2srJMtXY8ldqreYzmw3nbaHbCDFFGY2oejwYQfel25iuZhnkhFcdZHniNxfW
         o/0ELLiouiU08/yppvt3z9p3iWrxDqFWMrHA9NRWHRjY69I0F2nICUjdla9vrpYhkvmv
         fnVAD/c/2WIYGnSDeTfFOryPueLgTYRB50wo1HOcXqEgYpDHZeNvvRiXzTsNI03Bz+7s
         bFrQ==
X-Gm-Message-State: AOJu0Yx2I4mUVUzynHEV0YMxqZOy4Qun3xBPDOGq/HJpfvhk52+oqYlc
	i/IXjIE3x9N8dDLQOMf3EbI6Pv91qTL3wWPwSG5sbVL0JXSG+51kmqZrp9KNmFDr4iFjADNIvtO
	rw5+89BRqZrDLEG3S0ELAvJof0sYV5UqYv+NCRDOjwkCDnIap/r3Pc8MXy2by4ruOzcM6
X-Gm-Gg: Acq92OFriqyWpOwcWQgCBAqjBD0e/W6CUhCN1VHwpk3ghv9rr90KtMG5SVPiOiL5Wya
	aBZiWg+tTtKN1itA2byVuTzUKRkI47jPXT8VhGz/RYaberercWAQRMIBVeH/4jFBY+41onWIGb4
	2tYzQku62gCo9nWvgvcdE7rEu1win6Wp10mcOo+ANVXkLD7IZQ5OOhnQytYLnxUVR0NoNc2UYBX
	DmxcCxGpXGlcZs7QKMkLOOR6WXNh3XV3Nwo5pw+6BK1uHdE6wFIEb2UEyGSHAj4l0disVPBcUkw
	6iOs1492Qu55yKrerawvkE6mYj7kENaZdgGTBk2WGooI+M8vKBVarilQ8gdtnMyOvI8jC/upKdg
	bngiVaGGVUwoTZ/iIWkGyL2C9rvK+ajQZWaF58lQOgDMAsmuLYVi+IT8NprYdxWYfZ6rrRJWQH2
	iILdruxQ==
X-Received: by 2002:a05:622a:406:b0:516:f4f7:3325 with SMTP id d75a77b69052e-516f4f737b0mr95747201cf.35.1779779444431;
        Tue, 26 May 2026 00:10:44 -0700 (PDT)
X-Received: by 2002:a05:622a:406:b0:516:f4f7:3325 with SMTP id d75a77b69052e-516f4f737b0mr95746931cf.35.1779779444026;
        Tue, 26 May 2026 00:10:44 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:9e9:6f8d:9f1c:61e1? ([2a05:6e02:1041:c10:9e9:6f8d:9f1c:61e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428ec538sm102058435e9.23.2026.05.26.00.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:10:43 -0700 (PDT)
Message-ID: <9f099bea-a75b-4301-a5dc-cbc12e7d2c23@oss.qualcomm.com>
Date: Tue, 26 May 2026 09:10:42 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [thermal:thermal/bleeding-edge 7/19] Warning:
 drivers/firmware/meson/meson_sm.c:249 Cannot find identifier on line:
To: kernel test robot <lkp@intel.com>,
        Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Lezcano
 <daniel.lezcano@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <202605241052.GUumTryP-lkp@intel.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <202605241052.GUumTryP-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a154774 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=3y7k_OVl0vSwu2NmPbsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: GEbU5R2l0ifwohgnRiOQPcrAODDRtzvN
X-Proofpoint-ORIG-GUID: GEbU5R2l0ifwohgnRiOQPcrAODDRtzvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2MCBTYWx0ZWRfX/DR91wqf3J7E
 Y/7aqp+ZdcXevL7/J+GHaSZwqspGqIvRFDVfae+P/dHt6xGG1z5/7eAtvMj67PK/VkdFspi4zND
 Kke2QsE4yaQeyI7v/QiNwTa+yqJyWdFV43jMV4AKpOZIGGS9+omxQYVYGWJeLlnLlsgKXEK9o/4
 YZpYCAzwtEpZZf2j+F6bs19h3SewveyDyAqarl5B/8SarTCvbwt++CxEqJigJUt/KOjQzwizPMN
 exfK5t5WXY+7yPoUpd/sECbdJnlrP+9vwh0wWSAWC+dLqLW6SkZXzTvRhFReswjXm4trlQnnGec
 eRRFHojuU1RzsSOOeXj26uy9ppFpDiOeETfVJhwkgdn+fi7t+jkS+11V70IebAAu6s0uRqt8atE
 3DCqH5Pnsesx0vnKBqoDhIFwOL6CyDdvpy3LBrL+h7skbvQW17KN3R+4lJMTxwY1AwPirqFAvkT
 mXvgHHglVOsq2hrmBMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260060

On 5/24/26 04:38, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/bleeding-edge
> head:   a7652af38bb030cbc8aa5d5f9fc7242b5519c772
> commit: c0ff01e532a3b91d31dc63acad1aa68cc9989257 [7/19] firmware: meson: sm: Add thermal calibration SMC call
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260524/202605241052.GUumTryP-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241052.GUumTryP-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605241052.GUumTryP-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Warning: drivers/firmware/meson/meson_sm.c:249 Cannot find identifier on line:
>      *
>>> Warning: drivers/firmware/meson/meson_sm.c:249 Cannot find identifier on line:

No need to fix this warning, I've taken care of it

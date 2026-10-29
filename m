Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311577;
	b=Dxyq5NNQodcafCh3Bnz4EueauKlx0XtSV1iV8UvaTK7qjYqOsfB+5XUNXM2oVsanld0L
	 CPyl6d0go3clD7p0esNLU5yceIpaYIsIl7dz+OFMnhc8gNrWx13ycQDm+taRW/MjwYo2r
	 IzzomueKSupDX8rkA5etxIYVt2hxQ7UjV2BjO4Ka/lXU3dm/4ezxHQMTZ34myImClE+DZ
	 E6OHJJybzNNky9NsDQjRjtij1sLbeXHVBrno6O/X/BpjV1ai6Yzgw8lULDpC4Sftxf+XN
	 PsAq3o0srG11lziYtKDFSAFG34uGTnwQ9fFGQHqDuxXXc9ZDBfoeUKwfnJ9uytSyKVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hIXWGtv3vTjBGlEeZwThLsjKFl9jTOn5RKkkJ1kexYI=;
	b=bwiAzzY3be6R2BSpEQZOXUPoVHfusw4cEGdHVeFxj24nkQDoJCjjLtbigGLrO7BogeUs
	 O1ocKD6WyWKqlq04H5i69OpOFMIo5S3oBQlvxUozaICaLptfFgw3I6yeBEYGiZfhLmXNf
	 su2xQPJ3RZToDuEIbfr7TQ8lRsx6Q8vdT9OWpIXBObgRLy5GYLcgwMo7fBPq4NndwIkh3
	 n5HSLWcrIum7Pm1+RWUsHP9+pcxcIsGbGkTCAflJjhhgsaYim4Qz7DPK3oesqz8i7Lhdp
	 YrOdqTGYQzZxYlPz/mUoSiuM3uG9I1qkgB7hENf68XupR52ONWjeKEc7w6C4r39v70A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aMf7r9hS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="UH0oc/xX";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631E2606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 22:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 631E2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aMf7r9hS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UH0oc/xX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TLauI52372761
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 22:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hIXWGtv3vTjBGlEeZwThLsjKFl9jTOn5RKkkJ1kexYI=; b=aMf7r9hS+ZZLMfI9
	kMEUYytN/y66qnXyFTLQkKN7v+JEfgHh6ho6zFpTS+SSYxYf+IKnREgR0WwJboxf
	GX30XnbgTQQ/T+csTSzl8wEqiFXXnrxsNC2AeX1CE5HKI7M3QdnwpKPNCVDJ7Nxf
	h4n1HxnYbAu0gGJz+ge3TI+D/KHmT1LTX1iOC+DGuEO/W/uwp22SFr/+qwECKBx/
	sXi7wdbM26pd69eJzEKHmMpULtewTY0Tr9GADsjhpTebr+J02/7DIHuy9Uy+wEh3
	J4NuH2vPGRnMf6chJ2ZgUGQCVap1hxfeHPSZR9PXs3bOt8DvyUbmE9M9UShqsIFM
	GTZkWw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme75037t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 22:06:16 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c02e1df088so3885137.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 15:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793311575; x=1793916375; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hIXWGtv3vTjBGlEeZwThLsjKFl9jTOn5RKkkJ1kexYI=;
        b=UH0oc/xXsp1182QJQ4RPtZHnpcRFEQ7oJz9X4voEZXEe+EIWJGclpIzytLhssv62Op
         1W5s+TDnFh1oP2jWGQEgn+U1tybpS+fp5gc6/HengoGmOKUBqR628I64Np+RDzuxC6g+
         KfZIoI+lD683zg5M1Ho7xaqkXjLbmB9Hnrpm99uWeEWM2NqnfhRIJwcX/Doz07z0FSmD
         qtp2NhL8tjm3+ZWBB3jZAOTOfH+XuDcxE8t91QtWC6e9OLEllu/g4qeWv4h6st2QoXNh
         Eva9AQy3RuvAOu6b6Hsq50OiYeCw3Wgykdyovpe12GAD2kzYZohGmJzszxtorfGXxLsh
         iSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311575; x=1793916375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIXWGtv3vTjBGlEeZwThLsjKFl9jTOn5RKkkJ1kexYI=;
        b=pvXLbcG91cf4RPU6w7ed6u6tKvtoyqfUltgeDVIGwvwlhc85Wb++ByIhauds0KlmMe
         6tCSz6OhZ1cUddz7BjJm/cXfbiCbvnSmtO5jaVLBUVDVTJ4Sun0oYUaqgT2DnWZJIqON
         NtTC1GFwkD0z7AGUvyi4mWDRShyU166SYCwk/raVgQ2f3kB5UM6zhdEe0YMukLA98O2F
         aTDeuEZcpI4EbOwC9E8nEj/OxOXUNxswpTQJEy/PzWSDEYMyXPPVuDeq1HwB/ZmdQ1a5
         wl9qfViE+mb96K4VEDqbfenp1DWONMhV/jExCauw0BcF6xlbD24ruC5WGpZd97+fwG6p
         bn1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwgzmMGoClghBehWGxpHD7vTBx2MLjqf9ShmtjxXJOeInhXFMUtVPcrrWtJ6Rl41zfpaMe1OJGORbLDz3g5@lists.linux.dev
X-Gm-Message-State: AFq9FYLXMym2kspgCsntHBZY/Z0THbUIvSOihq/sAKOmDuzKa2OJPK+b
	2fKtwxkVvSxgRVHvl2EbyHi2FrIqelbwB3qdIQ5F436D4Du0BiVd2T8SD6W485CTEOS/EPDcpBh
	f6XgCgZKBilk6sLNZQZXzwdd/JB2qnABTnVU3oVost2hoko/pwN8JHWFj8ruet3Xxht5e
X-Gm-Gg: AYBFou3+FT1InKcRieyaTwPulIiquXgbvuvAjph0aVvNs/7lUhQgVUKuTbWYhpIoYYg
	RGqKER8uYQFLkdly4Urgz2F+6Hy1pwJQcM/Wc+QC/yaqFxUjsmpe/PWeZ62dKs9clpdwwtXqtE2
	Uv8JTXVCIkwzLnQ+UtuJ//HV84rGUNbsYSOJGP2IHKZLl0O/cTyMnkj1OS0Yy2dTVzocvk5WPQA
	3+QagXsHkBD0UBN8q1K58agfO9madKMQuNHfPZD8CepX33p/vYCF3BvQEdi86zLv+hVy6wd/TYR
	hiOPOeuff4ptIz44lgkRozja6y32aKJm7IJDwJiyYBvXgp041/1wMalRNsBnkakOouL+stja5To
	DYjuu8wDb5cJnMgp9rOdxKFm7ZQWHjYR3o228lqK/+POV4PhYH2WKcyv2xZG0I9buL16v370uu7
	TT5dokE1y3CA5OgVY75cNNRvLHvXRWHuc7pjM=
X-Received: by 2002:a05:6102:32cd:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d072d818d7mr296185137.37.1793311575402;
        Thu, 29 Oct 2026 15:06:15 -0700 (PDT)
X-Received: by 2002:a05:6102:32cd:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d072d818d7mr296170137.37.1793311574895;
        Thu, 29 Oct 2026 15:06:14 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7fbe:151a:486d:a2cc? ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e712cbf2csm9212f8f.34.2026.10.29.15.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 15:06:14 -0700 (PDT)
Message-ID: <542fea3d-c587-4077-bc75-28afdf3e543d@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 23:06:13 +0100
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi
 indirect call!
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <202610290223.iOEGeDs2-lkp@intel.com>
 <20261028202400.GA835963@ax162>
 <CAORyz2KEJ5M86-+z2zWXVTJwbNO8SY4DWjn5Y6EO_-nPhdiytw@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAORyz2KEJ5M86-+z2zWXVTJwbNO8SY4DWjn5Y6EO_-nPhdiytw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: c8Y6HXNeZpSyPynr9liYLdz9U2lU9v4y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA4NyBTYWx0ZWRfX42s1oPOhYSDQ
 RqcAnMZ+zOynIZfX9ZgK61OlbuJqvJPUDXCM0WAcgr+J/e3XM76pBshxkZJ5eqfUibqwWETT6mY
 sqm6aLn4I3aCfrpLDxGnK9myvrMahXLfDwINX1BS+ipHaCkWj68wEoYQa3/FXk5iEKwACKlyNsH
 iKuIwebDGDdzSRIfB/IIP4ed9XHFym19F1v8u8cfnuWU6gAV0IKbW/iS3NRJfbw0c/TJX/c8wKi
 d/k+dZsEYfDDj6UXkbbco9HdbrcX0gjclOXJdjeYSMzcKc9JTv+dUz1jkg18KrtoKInL3mgM6ri
 XXhME3kS+4EMyGGS2n8YcskMT7BAkN/TL3dzbmHgubJIoRCXVHvPP4RaR8n5FRGOH0N57hteaim
 xGVihLLtMI7giUhcsZ0QiMqmrHmTlrYqFx3WKKNUHxeCfKl3+CfKqaFDzeVngFwxcuOVmtw+USC
 5d55YLPKtHZU+Ahcsyg==
X-Proofpoint-ORIG-GUID: c8Y6HXNeZpSyPynr9liYLdz9U2lU9v4y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA4NyBTYWx0ZWRfX/vYCq/zh8vMV
 +7R1bZ73ZY3v13u4YBPtp1MovIqkGOMZzbfDUxjA4IqheiFpGF5Ihtgh30uRErKKafoIMuAfPxd
 AT5AYzdO00+7vfFiy9R7HYvsnCdc3I8=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae3c358 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=aSKgorFW_ocjRd5Bht4A:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290087


Hi Luca,

On 10/29/26 19:54, Luca Leonardo Scorcia wrote:
> Thank you Nathan for the analysis and suggested fix. I agree your
> patch would be useful even if the warning wasn't there, to make the
> device probe more robust.
> 
> Being a new contributor I'm not quite sure what the process is now -
> should I send out a patch with the correction, just as I did for the
> initial contribution? 

If you can send a fix that would be nice

> Or is it going to be fixed by the maintainers
> autonomously? (Obviously adding a Suggested-by tag with the rest of
> the bots' tags).
> 
> Thank you for your help


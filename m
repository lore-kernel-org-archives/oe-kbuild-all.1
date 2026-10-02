Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ED841A50B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928962; cv=none; b=KxmRto9IsWjSdEnBpMSPSIdjzumwVNUF7qfOTMD0Y4S3ChlD6iJQ2Qq/5xcZ30wZYHZVrSDWswAlCh2ciWj+IS+o8sVMfUn+jHYLQxD1gfznDZlt5jusJBn1oFLzyEvODEo1ni147Hw996Go7T1TmomXRvnXYqpYdJ4+TLyxAaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928962; c=relaxed/simple;
	bh=lbzA5jTjU6h1HO7OEXnXJIgvoOUuq8f+OLvVEZdWpKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pH5LkrtHjnrkddErbj5PlaXheqyS0U6bSoWo1BhxDXeiY7e4rJXCz0kBHY6toWfWcm6QStRc7QWoJZCPmkoo0siJYDIpFw9tAHQgekP6yfZRn7Ulxh8pgI5CBO1ovJG89V/mjLnNKwSeu14qMlT4gd+bA9OXGeu1BByWHQhZ+T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYcRAAw2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8uOCYQw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYcRAAw2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8uOCYQw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jBpi233789
	for <oe-kbuild-all@lists.linux.dev>; Fri, 2 Oct 2026 08:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UE5c7f8CX87dOF/+LAlJmrgvU8GksG7TP+HnhIGYx0=; b=aYcRAAw21OeQk1Xf
	47cf936unNxj69D9OIskOX31EEgAaZNuGfv3X5D4kHzB8EkloSJQIx8DchHjnIQa
	j7ZWbZApmimIxROx0IH2+haV9JT1yeJmkJOtDQmHZOB6m03fZP9/k7HGX2Rz+dTO
	kP2X6f3/A4Dq+oA/YwasIYAhZRArT/tikpj2xPo5BsjqudxfHbi/ZZ9zMG0MXQ2W
	Wg+4sgZZw11Q4qzf6uqmuAbKPDOkkYjngmLOvFtnv5INaC79Nk0ApvXAeu8sk7TG
	3NAusdWk3gxgwwnOrczzNRj+SSX0u2P7SbtQkInvkfnzh+rAKGDEL9QR2J9+VggD
	M5uFIg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9ab7t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Fri, 02 Oct 2026 08:15:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d84114044so7664742eec.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 02 Oct 2026 01:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790928952; x=1791533752; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UE5c7f8CX87dOF/+LAlJmrgvU8GksG7TP+HnhIGYx0=;
        b=U8uOCYQwYxNGTGFHm41dNRFF0dXYPw1O6l+f5RbK91tZkozhVnGEyoLtDZyb5OtaoF
         sLtEek6KQDRpK6CFPM25OVfjktHyT4pTTxsPq8BR4PwmcpIv0S53c1+3IgQofRgjeBCu
         um7Fq1RMZqf20Bqrzo9OOCeiVF1Im4TC8hJ8UmOZ7/ULR6KLoCLU7LEXkij8/hrTN66n
         cZZDXhKlRRc6Tyt+icuQ+k/Bt3EbXy59RxUIc2A2qr9CaOxhT8yY+syYIWuVBRKDE0mV
         FRRM92QUHiaw+BCK8brYRTYpoaUGGQlQEYOfjWcj+y0L1avwgUD9sAdPKVyFhJgGw8qm
         tbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790928952; x=1791533752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UE5c7f8CX87dOF/+LAlJmrgvU8GksG7TP+HnhIGYx0=;
        b=Yvpdf6XifRRtWpZ36xw5wbjzh8j+K6ScfSHRb6Q5GFZ5vq+1A6fGcuL7Sll2ZhWNya
         pMSGFwN8rIw5wH8VAybcflwsiLOHXGAbonq65crISIz7KJhjf0FOK9jgeEpBuIGmpwzB
         5PKns3iUzwGaQq8kEkALw/u2Lk1MLCp+s0Qzukz1w155gf4pjLDPynRWAdveDEkwdfYQ
         bixdDriyemBag/qrAOStIKSK2mZjCrLaPjU802ts+5SCBitSiMzwGasn7t+rvc4fHyGi
         MrMSGnhfykJhkke7vuMnbjZ8IR+SZElbm0Z6h3Qalm/Zf2Urfh0LJWcqWkF6iXEXc9dj
         EY+Q==
X-Gm-Message-State: AFq9FYL5y5hzo7PDK0jqFV/EfaOKXmQRXNqan6W3GlF74oegYokSTPoH
	9zMsvOnqUKWx1kdKYVANSfyQKDUUxXUl5mqvhzp0G2JwCgvx0ZPa4KznlsHzFOFohndY02lyAh6
	MTk2plyglPvMhieSM+rX9TAGF+aUjjE6BGPcVTORob1fPLRDmO2eFYhcU4eolKuNnDxuA
X-Gm-Gg: AYBFou1oCK+IyejgRVYfs9Wt33+EOCFywMlMXfSvAW4RwSZ8WgBKfva/2oitxWgMvWm
	vCYOwbGkkF3dzRkPYW3Rl+BxTwVaoHmSmSsbnay/viJiAcGF6/daVC2GDEC7+SsEnSfT+tyoMG/
	gzHpiYUGkuGuXVkBmdT7lJWAV70ga4gnonWQngjmaIrmgz9eZOjUEVEa0BtLywP7v1IWWTzgGyO
	Zp3InnfwE0Q6T3ZTwrbZYq17iVakrU/+jiXhSZaQqXAuILJIwK1B/GZrJ+pcl/+g1WTupvA4bqI
	DsdD7hHN58VIs/beKMlzM5pJvpxBAw/1zCo5TnZUsYM78tJa9uAykKHKMezhHENBdhkqEKpLSKx
	QSeoQP/aO0g0bx047cV4WkKsQYzru
X-Received: by 2002:a05:7300:d20c:b0:342:d7a0:2f40 with SMTP id 5a478bee46e88-34f150851dcmr1796113eec.7.1790928951889;
        Fri, 02 Oct 2026 01:15:51 -0700 (PDT)
X-Received: by 2002:a05:7300:d20c:b0:342:d7a0:2f40 with SMTP id 5a478bee46e88-34f150851dcmr1796090eec.7.1790928951205;
        Fri, 02 Oct 2026 01:15:51 -0700 (PDT)
Received: from [192.168.1.11] ([106.213.81.104])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fdfc58sm4041526eec.24.2026.10.02.01.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 01:15:50 -0700 (PDT)
Message-ID: <2dec0e3c-c183-4bd2-a7e0-e1f3a8b874a8@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 13:45:47 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 10928/13246] ERROR: modpost:
 drivers/media/platform/qcom/iris/qcom-iris.ko: symbol '__divdi3' undefined!
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <202610020426.oUzBZ3mH-lkp@intel.com>
Content-Language: en-US
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
In-Reply-To: <202610020426.oUzBZ3mH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzMiBTYWx0ZWRfX1Lhxiy9Hwqlf
 6J7akPhi4gKRl4NriQklX3NdpodbtiSCPs+eF2cT6Ni93Zz97JO2CScHSaMz5E8ncgzv22k68Av
 HQ3v7sPODrbbjoQx9waC4+NjjQ65eQI=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abf6839 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=C5ArshmsoreO9SDUKH+7GA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=d-QgmJI5_3-q6zUmrU4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: Gw-orkU7pkWmjibzYphO8kdZRZmqcwF2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzMiBTYWx0ZWRfXz7RQIApw6Rbr
 Qxwu+MAQLzSUPSopW7oY982cqh3/3sRseIN4HmW0MLo/jtQS1OcaEH5MbhAmhn0aRbov8jTXay8
 gbmothB00rDk0vi0w+zR/ItS88HZr1OhsIXUKTSJhbfV9TPjylCSC+VqvpkpHK1UlpFxdgX38p3
 EdREa6mMtErIflE0km30svFGeAdo8jk74yqT/yruutkAYm8G4SqrImwcb4L5tme7nQ+QqVlNiUp
 ugfmMwUfYT/WadTxxkxUytiMdnbS1+tvGNvh7bLOQwbiJi2jnfTimuLnmlPXANeBgGXqeED7qmU
 UEclG3c5adWfWTIRw1qU084icb1ZZCN9g2dSnJ3nPExmnRGWkhQZcKHwZexhE5olCVihLEcTBqb
 OJCiFi3gqhGAE3pokjQRsk6DtQuQzfVSU1JVOr266zNVG6G8aC9nNdMwfIt+mffz141fAO8fpJx
 ZWEiBg/btmlzGMVQdJw==
X-Proofpoint-GUID: Gw-orkU7pkWmjibzYphO8kdZRZmqcwF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020032



On 10/2/2026 8:10 AM, kernel test robot wrote:
> Hi Sachin,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9f24d789f03b22941b905ded43cb5ff8eea9ce62
> commit: 5f21cd9a4ae4a891b273178b40e0e9eb5b9ac650 [10928/13246] media: iris: add support for multi_slice in iris encoder
> config: xtensa-randconfig-r2104-20261001 (https://download.01.org/0day-ci/archive/20261002/202610020426.oUzBZ3mH-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020426.oUzBZ3mH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610020426.oUzBZ3mH-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> WARNING: modpost: vmlinux: section mismatch in reference: trace_initcall_level+0xa4 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
> WARNING: modpost: vmlinux: section mismatch in reference: trace_define_generic_fields+0xf4 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>>> ERROR: modpost: drivers/media/platform/qcom/iris/qcom-iris.ko: symbol '__divdi3' undefined!
> 
Thanks for the report.

The s64 bitrate control value is divided by the frame rate in
iris_set_slice_count(), which pulls in __divdi3 on 32-bit
architectures. A fix has been posted here:

https://lore.kernel.org/linux-media/20261002-iris-fix-divdi3-v1-1-b2284d7fd77b@oss.qualcomm.com/

Regards,
Sachin

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


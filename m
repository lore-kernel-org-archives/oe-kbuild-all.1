Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B91748EC9E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 20:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790885494; cv=none; b=Ag+sd6IHcdlgom07cpsOAMDaTIa3jv6eEWoRsbZ3PBLJuwklb9wXyRYK5+TgkXwjl6snLEdnKbKaqTG+7WcKMD7tqbkm2soiBn2o//uejUOevKbGvQQGoWMo0zvrkmvUHOOqjIWZJGUJSVQlLi3PUEFJo3bSWqZvrLNuD/KJur0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790885494; c=relaxed/simple;
	bh=MS1F3AOor4QckimvsJFzrtPo9jIf6wS5FOm7+xeMHlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A01rKbgQOmDBhBb0/K7DrVKMH15Nuxcpq2QrXysbpNPmSUwQrGqgow6BajsZSZnrGROs/NjEIGl2vt9s1v0tqy8SqNXS//g/nLq2+KcSVPfg9HxWdy1D0wSSChgRjUVZteaxlZhESCpti/i6c3HfHPqW4KDPCLJK769JcUDIjlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3mqjSRE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPgx1icW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3mqjSRE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPgx1icW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691FseFs3354450
	for <oe-kbuild-all@lists.linux.dev>; Thu, 1 Oct 2026 20:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ALL2BrIfwGVw48RsRuGouEKqDZPE6MaAwenRnLRRU4c=; b=j3mqjSREnTwMr8bY
	R4VPTpnq5zzoY5nvotTyr9g17KI0HY1hl/sIutF1+MFHH0t+F9eWnZBx9DSUbeUf
	gcS7ruMNUxJwA9NvxFKMvgHRGjtu/6JtGUgr1cw/Ar8apXJmvXwgY8py+3aCfLSH
	I2hbZfUzFr+rEL9wCZmWUqHWWJlL7ztB3FAsCJM3bPDy5L1X2PViWjKjaG9RbOCD
	/FtKqnV5afwg+ekT9JXkbLHMIo/87X1qUEaARyQtU3TzCu01kkFq0JJxhny4r+v/
	NEVVg+jNKXCmwT+/PaBI/zG1B7ysKFnGgZPEgKh7C7gTGsWb3PCa9/4g4jveC9Mg
	EA5uPQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nuvd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Thu, 01 Oct 2026 20:11:30 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67686ccd1b6so3519678d50.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 01 Oct 2026 13:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790885489; x=1791490289; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALL2BrIfwGVw48RsRuGouEKqDZPE6MaAwenRnLRRU4c=;
        b=TPgx1icW2l7hrIfJCCA0w71Ozshy/1CpULc3ywA9uSuqyJfEZ4CbmwVkNpgD4PoH0A
         xaLUhLKKLWzUbEYkVRhnaHxIksXQ3+8moDitBlpak1SsOYEPYVg43T/8amqy0ppv0UdK
         mkZf9xnyOaxTWLni4WUOIeOkbzAVSJ3R/D/U6+KYF013v+SKvyfjhi94uCLmf70te0mx
         TZgGreoteCRL8EFKbDIihQfqcVFYrTxeX663bN3ul8x1Dcz3xd0EC6EHpD8FbFcOce2i
         uXCMNx5R8ykvCwRlxAMexdgrWp6T6RzSYpiv19Aq7kDAXGZ6rZyxQ4ztCVQBUJLzvlEf
         ZMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790885489; x=1791490289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALL2BrIfwGVw48RsRuGouEKqDZPE6MaAwenRnLRRU4c=;
        b=raf6AeFUMLFEZu2yb/xrh68ti3oaYC5icxRNhqKZG18MBLgkV404RllQ4uEM4O9ViC
         ziPCfmCFOlAnL1GKRwy2hM9KQDWqXaZSCTS4Sj6l4KiaKdJicK31XZjpagLkv0BupAUQ
         oKcNNuJCR4M9acwpY+Obj2CttV2aLAnP6s41niXyQ5F/OodG4FYwGdIDmPSwFOUDt9JK
         faUlbTCGdVxBkArBu3ZLneN/E9KOQB3HFk/SMnnVJCsG9vBu1MiEnIaDC59FjXd+kvJx
         eh8OVBUf8IpM+K7V0ioEshvjeCrQE2j4iPPmmAm0Fsq1afQmC0tXgj54ZNMY8iOCLpXE
         4/xQ==
X-Gm-Message-State: AFq9FYLUKNT98xV2t8GRJUmB+HLR+vZaojS3oujBL1IQNgWHaiauZPDp
	f7LxbV6V6XXJiUcyyYX/LaDURh1Iz0e/K+zQXdA9iFxf4QzEZv1P6fEMifHC/2/JtIt26RTxZA8
	0a/kNi8vTYJEpe5LZ7fPnEhD2ig4aXW60Hb0fTwR14Rt5f9wM6MH1FGMYTAOJusC1wH6GvC8+KV
	p0
X-Gm-Gg: AYBFou36IxZ9GnhUwDA0HZdQ90dYubRX9dm5ap07lRVffqDOs1/AX+ip80DikE+sDnM
	2XVCF0i2u1xiAv/2V6VL430C1t9THOwE0KAFDE8zIfm2TFqB8l2dqvCtO+NVSRCqO5wjEZcfqd1
	wzUbSCsnTpLMpiMf/tWqB5otjT/aLfuh/E10P/aKrlwRXHY1Ab0er7QQ8uYLH4E7WTYcFWLOi3z
	RDbyrihn9FM1hF/3AjTri+vcIw2LxiEgDHL8/3I1IvR3Noetp0w3tqoD21GK2VeQ/0zGekekkg4
	10Kl2vQrgLjKH482EAOxPoKP9NHmSGa8Kv0LLv11n8gSY4hcXIWUMS62b2u24dXYP2dSJgUtCJp
	+X9gtd+aMk5SMF5yXui43CA==
X-Received: by 2002:a05:690e:dc9:b0:677:ac2d:8aec with SMTP id 956f58d0204a3-677ac2d90a7mr193259d50.68.1790885489519;
        Thu, 01 Oct 2026 13:11:29 -0700 (PDT)
X-Received: by 2002:a05:693c:62db:b0:33e:a173:4aab with SMTP id 5a478bee46e88-34f150ab94emr328473eec.14.1790884973938;
        Thu, 01 Oct 2026 13:02:53 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.235.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f97a5fsm884479eec.15.2026.10.01.13.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 13:02:53 -0700 (PDT)
Message-ID: <2b26023d-b39c-437e-ae18-a44527be0685@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 01:32:50 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [drm-msm:msm-next 4/25]
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c:2424:28: sparse: sparse: symbol
 'a840_limits_tbl' was not declared. Should it be static?
To: kernel test robot <lkp@intel.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <202610011141.2iXEaQS2-lkp@intel.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <202610011141.2iXEaQS2-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abebe72 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=AE3SQRS/NFwxibvl9JJKcg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=zpVsFC5t1QYOmW9KY9MA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=Vxmtnl_E_bksehYqCbjh:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4MCBTYWx0ZWRfX4IGYnjnxX6LV
 4G2pe9oF4Jd/Tw74Ui32sCvTbn3OYUhSGjrxI8dAMdY1wEHEoBKZVmW/hzSMasjIOL0XoKioNlC
 sTloS4yq4FEIsZV0Ibgemru2+KTRnZ0=
X-Proofpoint-ORIG-GUID: 2ZPynW5uLIKWjBZPN8GawCKrM_ODlZho
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4MCBTYWx0ZWRfX0vg9C5j1si/m
 9ejRvVNqmu6RSp8U8ZpU+iGdWoN2kiUcXWK+BWDcOPlHjuNgtw39r1HutWoo3KoIV40h6mvz6ZA
 sx40i+mR9vx0wpw39UbY+l/Qk6NWYayOi63mlHgOO7E7hGJSvpJ8Tustom6ECZ58XkaIIKJvduC
 mujZE8xB5j9nPxjMr6jXmJf5weWJY3KSAtGO5sjlbRcsDmiVd+LNVABBH+85s9CaoFh8bBvlzsS
 jvtLZ2W7m6XfsYyZTZ/zcJY54j4f2EMj++MSKvQzv2l63A4rP2tIB9Og3yt6nEVmzhbZumsk+85
 7ScWsG1qhMXJZpEziRugS8k7wHarPHIq7a2YqqVRtcgaJ7gtAvM3F9QRThGVqyGIF6nyc2VIv32
 8swCrHd6WzQcJFG16Vk3DdoO/ZXFZqHFwp6FokxucMW63EygNSnC1GmJouQxz9vuSntvXqUVHux
 iCHVHSc2IczELbL5E4w==
X-Proofpoint-GUID: 2ZPynW5uLIKWjBZPN8GawCKrM_ODlZho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010080



On 10/1/2026 3:22 PM, kernel test robot wrote:
> tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next
> head:   8eeca96ad1385e97c3ba4657e6f0b47773ec22da
> commit: 08d5049d9e844f114c53bba6a091ef957f4e9be2 [4/25] drm/msm/a6xx: Enable CLX feature on A840
> config: arm-randconfig-r2305-20261001 (https://download.01.org/0day-ci/archive/20261001/202610011141.2iXEaQS2-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011141.2iXEaQS2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610011141.2iXEaQS2-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1134:1: sparse: sparse: symbol 'a6xx_gpulist' was not declared. Should it be static?
>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1694:1: sparse: sparse: symbol 'a7xx_gpulist' was not declared. Should it be static?
>>> drivers/gpu/drm/msm/adreno/a6xx_catalog.c:2424:28: sparse: sparse: symbol 'a840_limits_tbl' was not declared. Should it be static?
>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c:2616:1: sparse: sparse: symbol 'a8xx_gpulist' was not declared. Should it be static?
> 
> vim +/a840_limits_tbl +2424 drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> 
>   2423	
>> 2424	struct a6xx_hfi_limits_tbl a840_limits_tbl[] = {
>   2425		{
>   2426			.feature_id = GMU_MIT_IFF,
>   2427			.domain = GMU_GX_DOMAIN,
>   2428			.feature_rev = 0,
>   2429			.cfg = {
>   2430				.enable = 1,
>   2431				.msg_path = 0,
>   2432				.lkg_en = 0,
>   2433				.mode = 0,
>   2434				.sid = 12,
>   2435				.mit_time = 5,
>   2436				.curr_limit = 6000,
>   2437			},
>   2438		},
>   2439		{
>   2440			.feature_id = GMU_MIT_IFF,
>   2441			.domain = GMU_MX_DOMAIN,
>   2442			.feature_rev = 0,
>   2443			.cfg = {
>   2444				.enable = 1,
>   2445				.msg_path = 0,
>   2446				.lkg_en = 0,
>   2447				.mode = 0,
>   2448				.sid = 9,
>   2449				.mit_time = 2000,
>   2450				.curr_limit = 6000,
>   2451			},
>   2452		},
>   2453		{
>   2454			.feature_id = GMU_MIT_PCLX,
>   2455			.domain = GMU_GX_DOMAIN,
>   2456			.feature_rev = 0,
>   2457			.cfg = {
>   2458				.enable = 1,
>   2459				.msg_path = 0,
>   2460				.lkg_en = 0,
>   2461				.mode = 0,
>   2462				.sid = 7,
>   2463				.mit_time = 3,
>   2464				.curr_limit = 30000,
>   2465			},
>   2466		},
>   2467		{
>   2468			.feature_id = GMU_MIT_PCLX,
>   2469			.domain = GMU_MX_DOMAIN,
>   2470			.feature_rev = 0,
>   2471			.cfg = {
>   2472				.enable = 0,
>   2473				.msg_path = 0,
>   2474				.lkg_en = 0,
>   2475				.mode = 0,
>   2476				.sid = 7,
>   2477				.mit_time = 3,
>   2478				.curr_limit = 6000,
>   2479			},
>   2480		},
>   2481	};
>   2482	DECLARE_ADRENO_LIMITS_TABLE(a840_limits);
>   2483	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I will send a fix.

Thanks,
Akhil

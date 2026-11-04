Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793769894;
	b=Mn6pNYTDGZUshLvHui4Mnx9pHqWhsE+G/6pmo94iZ0xloOSL0agsW/eMucDMwGoyOQuw
	 NfxXmHpZ0ts/YJps+8vP1CVLRh+eD3flOj2P8qEoLnu7ZJmlDmnLkUMpiqGd4W9IcpMMt
	 xT8u5IgTCJSvEeLsZPmCpOK70Bvu+KKJ264FcWoJF8aqkIR0S1Xs7jEeAP6QVisdhuLKo
	 4p5t7k1x2xFoRF+AWtc0x9QI6bC87kJbEPwClLH1JR/q21185nkPT7L52g7A8Egxz/D7x
	 vzrURrUyvzI/A2Q1K8BH61Dln4qyR0LtOIz7SgOH3z/RIw9kaN+sUXwBm9zUJeWfPAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793769894;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=md33AtIgZOxHAVQuAff3BEQKn+9xIRB1oN4Tai/9XIU=;
	b=RciAU7OKvF94HZtYv5/kN188BxKvVA9Y8NfUMwEnP5IWGpBG7r6zRhF7L0YdUIG9u7QA
	 nZP2J4EzqNh5P7Zk8gOjo8p7nIdB+SWSnNV1TsMyU/htLPO1zEBCOKn+1RO2I2pMUI2VX
	 l+npWBPGifanaCYYh76TpHhfk3OjoQgmfwmyGPRZilxYhaGMZTyg+bBenHIGcKOzdc2TK
	 KEahcPlUa0xz4WCpYR02p60oobC/bg2aCu1mS33RCgagKkD2HaGSwYZMyorpFTbq1cdIZ
	 vtnylmFGsjcq55axoDVX4ufa4/+dkPDVg376HLaNBSx/ucVXIPd83v5A9NX3yi8tQPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmCn6UWJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KWKVO0EQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797F6606A326
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 05:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 797F6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmCn6UWJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KWKVO0EQ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RQus3335539
	for <oe-kbuild-all@lists.linux.dev>; Wed, 4 Nov 2026 05:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	md33AtIgZOxHAVQuAff3BEQKn+9xIRB1oN4Tai/9XIU=; b=NmCn6UWJ5QAd9kRO
	+GbeO0V7OSTI7SKfo6+flMchUAmW707AK0yGXc/uos+YvcgSlsSwujZyXcE6lrWC
	erctnUUDFeddim+o3y1WNcwxgZHg+q2aH1d2jQzJgpH9vSniBoebjv2GQQwptU7O
	1sC22sn6BUFL8gGMIszQ2NgC680MEnVs/TQJK7LTj775zKN8GyIB5Uew8EuGDtR4
	VqmPMLwYw+/XCpr2gVxXI6bpM9ekQk28ECwYxuunUMq6bO+zmXB8UbzpJmHY1Wrg
	4mGO9uGqxVt1164WWqFbWQy810aawBD5VB4EwuiCafB94UmZXtaM924UIHBbm88r
	ly/A1A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbt9nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Nov 2026 05:24:52 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so976928c88.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 03 Nov 2026 21:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793769891; x=1794374691; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=md33AtIgZOxHAVQuAff3BEQKn+9xIRB1oN4Tai/9XIU=;
        b=KWKVO0EQdynW/TJX86sRD/Y9ktC9ZC30N3RXOl8Y7l+YUcuQ+5U2kckoR/VqqezLIS
         54/Ys1oYJSaOQ+9KuIi2hdXUgdi7UsH8/n0xsb2qCS02I7hSFzouIDLN4p2Pc4SvMmi9
         tCDF7y1kYi6vlAnmnskR7a5wFwyrl3fUub8o7jlik/HMOmigNs8bufmkc/ZBny5bfR73
         yeqRrvhTWWiZnB2J0+JqSC1UkWM//bx5ehmNA79Ir/mSP2sEBpBFL4MWtJeHMofHqJK1
         L2BcwQRR7M2fwdCywuXoHe33fdyetZbuWxOMwJm/m+YapduYXi6FcCg/OMjgQLcL9ZAh
         RSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793769891; x=1794374691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=md33AtIgZOxHAVQuAff3BEQKn+9xIRB1oN4Tai/9XIU=;
        b=WoysT23C2+CZNa6AhnmzOU+dMh9KHotUHipgtaD8pptRBy/1ox5+94UssfB8G6WQto
         BhwubDUYGvL158oKu/Td000pkzMzRUgi6yvZwBUlJ+AL/Zkm3AiwqlpyoUczt0zRyt4t
         xZWVAvZ5RkWz8olwlhznSDhfy8twMIRJCLtLeUYbZNwxU94sSuBIJyiSJL33I1706h7h
         4vGzaYeo/7EiT/g6a1kSzSQLcy2bBHQTzofW1vX2IfUEmNrt6d9zZCpEC5fe6mNyrd3W
         5PiOLUtGsAlwSpKJ9VKPvIGcdtBXZEKi2o6l8ma14fpBjEfi3jGVBWB08XWL0aiS/W/R
         d3FQ==
X-Gm-Message-State: APuU4Z/nqIKV+3BFm6V4VG0wU67LSbCRMIQBStJiv8bVY9I8lggbMPuR
	yRIxDCVjofN8/omBboCJrCc25WUS/snVou0omWb+pJbL9b8N5MtTZpqMgCpBzprwYoIzPQRLlVS
	/U7tQpfdystbVUQT22bJIN1LnjabJguT05gn4zZHGkyvyDtlOlSHzk/dQW6NAtMLaJKGq
X-Gm-Gg: AYBFou0oEZ8k81lHwgjKPpiVDE92KXgbNGIX4sSe2wzf6bFbfBeKCBm06QXSdJAnDP3
	yrpv2rG39kKROc1DXpXNyAF2anT7VAKJCcK5MeONLaqv3DrVde2O6FQMG7Nt/VWQqcEuNbQ1bi9
	CtlJu86fpheouACWZXJQh5gUqhKgtFk+iJdebfmsY6MxXwQiYOH2xMRoubg3IX3RyvokMMH+d09
	QMfCHigzxls6/9BXCGIZWG5zOBQ+JV7wDV6+r6BYqXNCA8F5/+q2GsmG4MWNx1bKSGarIDzcSyt
	6QeIQOa2WtJU5V/dUrmgMueQ6s0iPvVFPd48zdOYDdxFJCHa1gRSR9f+w/uOlVG++x2E7maMShw
	skyrfCAQekCQspnoUb85c5/3kI/IbJB5lwvLhjZyCboC26ZVtR4naS2AJU5VkIOdIGUQxp41Q2K
	EXa5b0ahwlkUpFJYUPHiGBiHD0aff2s4I1hr8SdqaYkAgysIIu72tL0D8/Cs+aAGSI9T/Edu+JU
	gE=
X-Received: by 2002:a05:701b:2059:10b0:1a3:87c8:7efc with SMTP id a92af1059eb24-1ac5cb186e4mr23305627c88.39.1793769891058;
        Tue, 03 Nov 2026 21:24:51 -0800 (PST)
X-Received: by 2002:a05:701b:2059:10b0:1a3:87c8:7efc with SMTP id a92af1059eb24-1ac5cb186e4mr23305596c88.39.1793769890221;
        Tue, 03 Nov 2026 21:24:50 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c127sm4387310c88.6.2026.11.03.21.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:24:49 -0800 (PST)
Message-ID: <aa665b5f-a3a9-4aeb-ade4-b9b8f04952b3@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:54:45 +0530
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
Subject: Re: [PATCH] wifi: ath12k: skip hardware rfkill setup on Surface
 Laptop 8th Edition
To: kernel test robot <lkp@intel.com>, jjohnson@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com
References: <20261103094024.1764151-1-gopikrishna.garmidi@oss.qualcomm.com>
 <202611040318.qlss0Yol-lkp@intel.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <202611040318.qlss0Yol-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZNDEeh2G9bpfhihYlrD_e8Y9AdraaHcs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMSBTYWx0ZWRfX86lDBk5v5jWO
 aOyggcC7gfpnPXvbSemZYR6YdPu2RU4TD6I1lKRqniHq76gNS8I7tNIcNilbpKRV0aVykJRggfq
 XmAxpTCID9bM6q9qlyFA5+OL0GvC9UVUUTZ3JJKnKlksSHylXOGx9P624/PwFyyUKU2lRBkiqhB
 QZn2UxDNoUD9tymToGRxqGAZkMcKkspEDKaAdPBTh9IFjsmS47T9lSz81dZFo/Vs5SW/kkmH8Bf
 6v9u8pQw4hMOZ4c7n0kuDQ4hSBaCLO8rYKPlALiTXtcOgmMBIEkemiEDtjrELS1ROz8SVX1EaEn
 0b5Z4W1ZG/MbV3lPEffwurv0F0VRpSEWy2TeUlc3tKP5ipy+WNTAvwQHh+X8EjK0Eumi0g6Mm7j
 1OsE/7cd5Dl06l12ncMN0oc4n4dMmQV+VsUEe3FgH+3V2/EXqFYFYWHa4AR4zGQ8m8npBGD/oC+
 jHw/zD801xhakWwuymg==
X-Proofpoint-ORIG-GUID: ZNDEeh2G9bpfhihYlrD_e8Y9AdraaHcs
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aeac1a4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=sEU2oqu8ip_TAauk1soA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMSBTYWx0ZWRfX4xQwRLSz6zvE
 rikPEC6DvvbyvBPZPSVjoTbp21W/2uaJsJUNCFhkASehxP/hHH69pUhb6UquqtnMlY++cTAIqa0
 CG9myg0VY4sKEV++SpMl+LrAjN1WuHc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040021



On 11/4/2026 1:18 AM, kernel test robot wrote:
> Hi Gopikrishna,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on ath/ath-next]
> [also build test ERROR on wireless-next/main linus/master next-20261030]
> [cannot apply to wireless/main v7.3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Gopikrishna-Garmidi/wifi-ath12k-skip-hardware-rfkill-setup-on-Surface-Laptop-8th-Edition/20261103-014024
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
> patch link:    https://lore.kernel.org/r/20261103094024.1764151-1-gopikrishna.garmidi%40oss.qualcomm.com
> patch subject: [PATCH] wifi: ath12k: skip hardware rfkill setup on Surface Laptop 8th Edition
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261104/202611040318.qlss0Yol-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 16.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611040318.qlss0Yol-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611040318.qlss0Yol-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/net/wireless/ath/ath12k/core.c:91:9: error: expected '}' before '{' token
>        91 |         { /* Sentinel */ }
>           |         ^
>     drivers/net/wireless/ath/ath12k/core.c:86:39: note: to match this '{'
>        86 | } ath12k_core_broken_rfkill_table[] = {
>           |                                       ^
> 
> 
> vim +91 drivers/net/wireless/ath/ath12k/core.c
> 
> defae535dd63b1 Aaradhana Sahu      2025-07-08  76
> 5949d1910f13c2 François Roux       2026-10-06  77  /*
> 5949d1910f13c2 François Roux       2026-10-06  78   * On these machines the OS cannot control the WCN7850 hardware rfkill
> 5949d1910f13c2 François Roux       2026-10-06  79   * input, which reads as "radio off", so hardware rfkill must stay
> 5949d1910f13c2 François Roux       2026-10-06  80   * disabled. Ideally this would come from the connector node of the board
> 5949d1910f13c2 François Roux       2026-10-06  81   * DT, but that binding does not exist yet.
> 5949d1910f13c2 François Roux       2026-10-06  82   */
> 5949d1910f13c2 François Roux       2026-10-06  83  static const struct ath12k_core_broken_rfkill_table {
> 5949d1910f13c2 François Roux       2026-10-06  84  	enum ath12k_hw_rev hw_rev;
> 5949d1910f13c2 François Roux       2026-10-06  85  	const char *compatible;
> 5949d1910f13c2 François Roux       2026-10-06  86  } ath12k_core_broken_rfkill_table[] = {
> 5949d1910f13c2 François Roux       2026-10-06  87  	{ ATH12K_HW_WCN7850_HW20, "microsoft,denali" },
> 5949d1910f13c2 François Roux       2026-10-06  88  	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus13" },
> 5949d1910f13c2 François Roux       2026-10-06  89  	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus15" },
> 2d169d089ae8e1 Gopikrishna Garmidi 2026-11-03  90  	{ ATH12K_HW_WCN7850_HW20, "microsoft,surface-laptop-8-13p8" }
> 5949d1910f13c2 François Roux       2026-10-06 @91  	{ /* Sentinel */ }
> 5949d1910f13c2 François Roux       2026-10-06  92  };
> 5949d1910f13c2 François Roux       2026-10-06  93
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks, fixed in v2: 
https://lore.kernel.org/all/20261104051838.2912931-1-gopikrishna.garmidi@oss.qualcomm.com/

Thanks,
Gopikrishna


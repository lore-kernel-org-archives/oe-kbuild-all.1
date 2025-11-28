Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A53286D7E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764322501; cv=none; b=tQzpf2mskBbELMKHNcxXMCkW6Vp+4p7PBw0bg7H/mPAuMUM2pshGrL1+kb+AyJMXXPErQTjhnbNkSUe2fP8eOW6fP8g/90/TI3ozHgvZCE3Dqt3dgHeYwBjF0T0xNvG5BFuvYhL0Io4W/UK/bqmd0g6VxqZguNoKeLNf9ho3nIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764322501; c=relaxed/simple;
	bh=h3ZNBDf0epiuOlk/2CQIviFQoMVthoNjNOFLW4wWEXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tgVvQkFzY4s26+ItWfidSqIO66azmxlaNQjkKlZ1RxcWY2pwdIwSwtJpH0xa90EXIzHWKNCbp4XsFfL2MR9iJMBySnMhst8uQ8VPc9iTjs9mbUlWIOYYmdaRp3dDRN/NzGPRFYH8XPQ/eF0ewyaHqnsE0iZbHy7h8su2XnbNGoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDt9q0hK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XpJzB6UA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDt9q0hK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XpJzB6UA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8P8502986541
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 09:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sKL+m3WOutgYF13OONGJXl0HxSvrXVv5l4hpsD9KEx0=; b=gDt9q0hK1gN6/swW
	eetI/8Fk15z9ktxRhKMA/ETH9nnfIaHmBoR46zLo/LloStTBs7jwkvGS1TY+Vphd
	WkFS/2qEEJtK2dczmtGxS58r4YShru+XkPEggwg2hmAz/Bgkzut7OTFO4ufuiAwg
	gEowtz9SvSLZwEnXUprkpRIXB75sMqC9jqJFHnDUr9GGlX5fWPeojo522UZfVw9N
	UFe1JN0h05WxadZD+b25fYffV8iHJIx7m/ZoF67sXc3Gi9oKZp7jcjVHGVa2MAzb
	1XgWBrstHeIhaeHj17CohCEk9gWdnWk/TvxJRIu2RU7ixbMfZSvL/ve0wGeKtEpp
	SoWvbw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmvxjtk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 09:34:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2956a694b47so22666145ad.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 01:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764322498; x=1764927298; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKL+m3WOutgYF13OONGJXl0HxSvrXVv5l4hpsD9KEx0=;
        b=XpJzB6UAZgOD9MEQtSaPNbBstwGwgMjg2OwdwhQgCHC8BVKOSJgAZpSwrkXdNgTRet
         TlRILS5rHgGli+u3cWxwlKSocGTq27UFvMaIaWdF1qDKmCi+y++e//a1w857i4I2dAz/
         NPA+WDc/0iA5F6R4YQZii70mFORxM68V/EigxK/52wpvOi6bvmDXWBNE/3L+1jIf4qzD
         29qItIy4GSM8FhfxoQ19XEjnQ1y8jQGStoqOVWa12v7BseVDkeVF+T3G9XlvkxIuMMk7
         j30elBpLxCKXKOpjaCmaLq5HuHdYq0j+xihWopOjU+YwwkmN0RJFnBB7uIu/XFXX0hWo
         0HIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764322498; x=1764927298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKL+m3WOutgYF13OONGJXl0HxSvrXVv5l4hpsD9KEx0=;
        b=d6HEbFvn7ZsGALCl47/LGtKdsmNOawTVH2ag1zmGPcA1KSCmZWD6qMODSbSAgUAkUM
         g7O7m1bMfW8GrlbI84bArNL1IDtDlOGnwXgdVDu40bNMCaQVxdmhVI8hI4XSgckvUO7D
         6iwmEkUb+0WGMbfmGxU+uMmXIwN6G95CIHxR/2aAems3rd0EqxeFtHldMS51+9Y4gdXn
         KKyCc4RMF8sP8CWFWpsNBdXFa+IUFb2D3/TnngKcQ+dIHvrCSYEtw6kKKXC/oKTFn/pY
         Puc6u0OCiBEWiQW14JkhAcRSbQV3EjEzlOU/DAwZEpV4wAoxpk/mYDwNT4B+/6731Iex
         bHVA==
X-Gm-Message-State: AOJu0YxH8FwrI/DkEHiuixQdRUe5pkHo55jhVijMlbJJUgf7lRMEBQR7
	BmEbkj062BIf6N/ghc/LfHy6k9tNBqygy6E3/wd6UFdnuGIRaVmtFBFUh+v5FRb3ZuWSdpwxbvi
	7m+he6/LpRLJJ2YlT+F4HDekE7HFMfQQKS3SXqUo/xTCv7RE1pQVGwvsdeNu7A5dD60GD
X-Gm-Gg: ASbGncuzzbeKN/6iXKx5Zfc07CUjyW5Ctz5QGD0jOQP9U8Sjv+Ytckn8+rhUAQo/VOm
	MNyIPaqRr4nRTiYptVlYcPMKe9XqdQR6jS4F1sQzkYjk+caJonsKYYaWFZ2/DAdPT8Lf4a16JN+
	vyAC7jOZ5ju11cq2Whz5Wcnib7jeDMZorXvIDimY++w/U18Yq9WN+ObbXxOA1WL9+QtGQyjvOqP
	sTkit8DMFGhi0AFY2hnGLaPSvC/kQSDiJUaJ4E54j+wgmi4B6SmmKMymFWIP25SFQY7Mto5Ndag
	NFIh+2tw/aA20qo2wQ4OwfL1jEf6Yh7y82+aFPwSlDIGjs+xe9zKs/2EWIEnm+iZNAz93g4bNnI
	J9V4FL3OGADXCLS8UfRTRNZR7QNaDVbOTVayzbQ==
X-Received: by 2002:a17:902:d548:b0:298:1013:9d11 with SMTP id d9443c01a7336-29bab1b50b2mr123968125ad.43.1764322498121;
        Fri, 28 Nov 2025 01:34:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExaWYSm30clO8JFqmCnuOkXZeeuYL49hJYAy90FwY7+VOOyFl1pNAhMDGXVuh1Rp1ko+AYEQ==
X-Received: by 2002:a17:902:d548:b0:298:1013:9d11 with SMTP id d9443c01a7336-29bab1b50b2mr123967805ad.43.1764322497516;
        Fri, 28 Nov 2025 01:34:57 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce4142f4sm41220365ad.10.2025.11.28.01.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 01:34:57 -0800 (PST)
Message-ID: <215aef75-682d-4cdb-a6b6-c2de805c4a69@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 15:04:52 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Update the clock suffix for Glymur
To: kernel test robot <lkp@intel.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com>
 <202511280306.L2l4tAmD-lkp@intel.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <202511280306.L2l4tAmD-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=69296cc2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=YF6W2t5QWlGAmZuWSUoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: kV7y7E_st8Jvv80q_EHNTjZmw0vn8xX1
X-Proofpoint-ORIG-GUID: kV7y7E_st8Jvv80q_EHNTjZmw0vn8xX1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2OSBTYWx0ZWRfX55HJUVZocRgh
 ROR1J8XOStp9cie7cJh0lpCg2AaBphuwjQvEJ3KStfwcwowolNqNHxv/yvYj10/GkdRyG8kpphz
 84Vm1cKjnthktAMfzlwG86UbBAerhH0cwuH/q/uAEUZRhHZwJBlp8ZaU4O2TexhtCKkmuAZcmwn
 bdvXRDdkxHPJLrPS6bIZynejCY2SS0bNUwNsSauxKElfZ8rKDunqs4OlzIrby/tRi8aFX1qPo5t
 NjXb7MS3XySmDmnsdh7DPSCZY6nuozANrNZmXaikV1yXN7Kdz9+e/abB3U+PK3S/FabPUrjczcJ
 G2gdYVFgUGQmIsYChVqKfu40XTheqhwLQAiuzd6/wORYx3QvmhbiqgysBZ0XfyVVG4lOlxbxi1g
 QBesi9OxE44LvxLJeL0J7jqrCrXMGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280069



On 11/28/2025 12:59 AM, kernel test robot wrote:
> Hi Taniya,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 92fd6e84175befa1775e5c0ab682938eca27c0b2]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Taniya-Das/clk-qcom-clk-rpmh-Update-the-clock-suffix-for-Glymur/20251126-021404
> base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
> patch link:    https://lore.kernel.org/r/20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f%40oss.qualcomm.com
> patch subject: [PATCH] clk: qcom: clk-rpmh: Update the clock suffix for Glymur
> config: arm64-randconfig-003-20251127 (https://download.01.org/0day-ci/archive/20251128/202511280306.L2l4tAmD-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 9.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280306.L2l4tAmD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511280306.L2l4tAmD-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/clk/qcom/clk-rpmh.c:891:21: error: 'clk_rpmh_clk3_a' undeclared here (not in a function); did you mean 'clk_rpmh_clk3_a2'?
>      891 |  [RPMH_RF_CLK3]  = &clk_rpmh_clk3_a.hw,
>          |                     ^~~~~~~~~~~~~~~
>          |                     clk_rpmh_clk3_a2
>>> drivers/clk/qcom/clk-rpmh.c:892:22: error: 'clk_rpmh_clk3_a_ao' undeclared here (not in a function); did you mean 'clk_rpmh_clk3_a2_ao'?
>      892 |  [RPMH_RF_CLK3_A] = &clk_rpmh_clk3_a_ao.hw,
>          |                      ^~~~~~~~~~~~~~~~~~
>          |                      clk_rpmh_clk3_a2_ao
>>> drivers/clk/qcom/clk-rpmh.c:893:21: error: 'clk_rpmh_clk4_a' undeclared here (not in a function); did you mean 'clk_rpmh_clk4_a2'?
>      893 |  [RPMH_RF_CLK4]  = &clk_rpmh_clk4_a.hw,
>          |                     ^~~~~~~~~~~~~~~
>          |                     clk_rpmh_clk4_a2
>>> drivers/clk/qcom/clk-rpmh.c:894:22: error: 'clk_rpmh_clk4_a_ao' undeclared here (not in a function); did you mean 'clk_rpmh_clk4_a2_ao'?
>      894 |  [RPMH_RF_CLK4_A] = &clk_rpmh_clk4_a_ao.hw,
>          |                      ^~~~~~~~~~~~~~~~~~
>          |                      clk_rpmh_clk4_a2_ao
>>> drivers/clk/qcom/clk-rpmh.c:895:21: error: 'clk_rpmh_clk5_a' undeclared here (not in a function); did you mean 'clk_rpmh_clk5_a2'?
>      895 |  [RPMH_RF_CLK5]  = &clk_rpmh_clk5_a.hw,
>          |                     ^~~~~~~~~~~~~~~
>          |                     clk_rpmh_clk5_a2
>>> drivers/clk/qcom/clk-rpmh.c:896:22: error: 'clk_rpmh_clk5_a_ao' undeclared here (not in a function); did you mean 'clk_rpmh_clk5_a2_ao'?
>      896 |  [RPMH_RF_CLK5_A] = &clk_rpmh_clk5_a_ao.hw,
>          |                      ^~~~~~~~~~~~~~~~~~
>          |                      clk_rpmh_clk5_a2_ao
> 
> 
> vim +891 drivers/clk/qcom/clk-rpmh.c
> 
> c035a9e265dd80 Taniya Das 2024-12-04  887  
> ebcb9db98bdab8 Taniya Das 2025-08-25  888  static struct clk_hw *glymur_rpmh_clocks[] = {
> ebcb9db98bdab8 Taniya Das 2025-08-25  889  	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25  890  	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25 @891  	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25 @892  	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a_ao.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25 @893  	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25 @894  	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a_ao.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25 @895  	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25 @896  	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a_ao.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25  897  };
> ebcb9db98bdab8 Taniya Das 2025-08-25  898  
> 




It is fixed in
https://lore.kernel.org/lkml/20251126-gcc_kaanapali-v3-v4-1-0fe73d6898e9@oss.qualcomm.com/
and it is pulled in the series:
https://lore.kernel.org/lkml/20251126-gcc_kaanapali-v3-v4-1-0fe73d6898e9@oss.qualcomm.com/

-- 
Thanks,
Taniya Das


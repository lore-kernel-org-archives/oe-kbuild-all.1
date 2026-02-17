Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248242D8797
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 07:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314816; cv=none; b=lcJzR3a5BZCcMxYc/2C9BuvY0D/NmlMCShVwffuBrETjLEqAGp8KhHav/ib2rJPvak89CvMYsAvL2awgqmhK2W0JNVuIEQv2DeEFJA1F9lyITzVkzsv8sU72P27jqyMUjvwzriioZWqNJ8kttaaLGOnKCuAc6jg9Rk1+OWVPNEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314816; c=relaxed/simple;
	bh=u10W0dZQkXKK92GV/cpGKMrlxzSLCDLg8iUDPQNa+Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiqmi6wcTnOAuX1N2olAfKzvuVWAmPgW4tzPHUsVI4mEXRHfyI5vSxk0ihyEuKrncE/bTsGadMFvEBg8a4QjWbQGNncl4jJ8R/nwl4HhA3lJhh9VIVPaBW+yQTQlM7LK7VhEWl/NVi6+x+ck9G7pducOp/WLkzCJTOz2f14xcWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kh/DgkVM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXdxcNle; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kh/DgkVM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXdxcNle"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GHbddv2802096
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 07:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HlyIZEog6J3u33MMe7AFXbsT
	oOYrvaz+iKp7UgWrFA0=; b=kh/DgkVMfTUv94MQxfiFtIZvNho6Sio2iEoAmdwt
	p9wU7zr1g7ZzxgGBXfXYlLjq3TPOM3hJ8D/b9aSchRwQxwjF3e1rthYMJutvF2vt
	EDvweYnq4avWV8HWeNz8wQPR0a6rjvhP/Gy9m78DqnJoDvhWhNwFPzf6cYjloITR
	WlRrIBZZkeKKGf1mPDdDqAGO1R0Pv4FdvTQ5K3zENBUVBmxKAovlQVsrsCZtT5Zr
	ZFCsnc5h5NmVAks3u2iFAGJ/DgN8EtQRvlauC9OFjC1wQ0CdmcrOqwmQf4/WAy8u
	PQcuvuH07hVls331ZoxcCkHIK7kDNjmeAsIsWRdN9UFYdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxujn2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 07:53:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ca3ef536ddso3112960385a.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 23:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314813; x=1771919613; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HlyIZEog6J3u33MMe7AFXbsToOYrvaz+iKp7UgWrFA0=;
        b=SXdxcNleKXi4vADlAiZ5nYBtxDXrj/c31oVrxdmnCC+oGuOIZYFi/ExP8zzXl11E6A
         133QU0CB86IHFjad4wd36iBREeIjv7QB8yxlakG3Wh+NTrEQlZrsh60OVt/5P9LGvwnM
         K6aHeG6CW2I66/fpIOVuT5SdHGioR84l4E2Zh5zroLUsBiO00XyJNg3OSBVDzy220QyS
         XsLOCqqXLcsjoLx5iEb8v2ZunEis5Pd92WALG+BmOng+UdZQbJGqhgFnWNkWRJ9Ddsf7
         tIbr5gXZutX8mXZ87hrcMbFGVfQ18LSJWPCLsIEeNG6XNK6ON63C9HRNJ0NqPV/TPMnq
         EAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314813; x=1771919613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlyIZEog6J3u33MMe7AFXbsToOYrvaz+iKp7UgWrFA0=;
        b=Fgz2PP3VP1qUEakETpSgUgD5FSNqnjXM5rZ4pk0p24CXDSc6zUeAph7DPhZL5JlcsA
         LtCUYbGAc2IUlFMECPy1H+7p/8vzEV7Hyf0PAPJpafBi3NYDCslXp6s+9GqTazPcp8Mo
         vZ80KO2Cz+K256LiCdPm94WTpan1rsyZyrGMRVs8RFTOC7oKcC6t5E2E5tfjdv/nvNmA
         8kW+hpQi5rorea/DMzcD9JrOI52lk6R/SkP+Oe6+oaTF5jMUY0JZtyoIH7pE0PKQfese
         dlCzUbP1em6AKVdgS0X39HVWoLx6Dmp2nZfOAQ8lIj2E3Vu/ilfJjFh2KgoypB/+GqHO
         ySOg==
X-Forwarded-Encrypted: i=1; AJvYcCVEhIhkVxeLx2ExVsmCXhAI6VbGAH6Di4aC5NcA8ZwXTb17NcQ+sDRGQqILeGsxxJEAW72UEwYFi58oje6o@lists.linux.dev
X-Gm-Message-State: AOJu0YwSS8scLW5ehtlBNSfPqU7N9NKmTTPW6rtNrzCkJyZiwro71fVp
	FHd/ZLtxDTl54MsiGLQ+IJdlVFS6fJinruDO4DK1Fke255NOBRcwTdwJGFlts0t1+ioq2aVK8By
	0JtIDCcr1ny3THiEzU8jyTcmefxwOeYcFBjauDOZkpXimBPXwP5ABT1BvsVOpCBBueGUD
X-Gm-Gg: AZuq6aK8y968YPPafpDrk1vAuKCrYJukTNO1XjRC0HD2AdCiC5UeLPwfTBQhJcniF57
	IuGVCBY3pJc0KoW57T5ix4IGV8nrr6AH0FS0UqguVDFBf61lVF9TGp7wuqSmOLPBhsmjcDkYJKO
	bONSuyU/PFuPzG+tvVfxIE0AV7uqMotYQGUcuCMkSFXqqv9JtlYV5ulux4dLSpGrG8KQI4KGdG0
	OKREx3iMgOh9SgDz+0c5SgAnSG7uGAlvYmM26uev5nIiuTAu4Av81gQzJWpGemdfwj8pRdexDXA
	7NsQqBLHqC3JXgptPx//KY/mLYLV94VDQzdgZmJB2j0/uq4Uorpz5T7sJX6MmJRwKti58TON5jv
	GPJdm/ps9SxNvmTDjB1amgX8xeicuLnYspGzh
X-Received: by 2002:a05:620a:1728:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cb4225fdb1mr1520261285a.2.1771314813334;
        Mon, 16 Feb 2026 23:53:33 -0800 (PST)
X-Received: by 2002:a05:620a:1728:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cb4225fdb1mr1520259285a.2.1771314812848;
        Mon, 16 Feb 2026 23:53:32 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm29866948f8f.33.2026.02.16.23.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:53:30 -0800 (PST)
Date: Tue, 17 Feb 2026 09:53:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: kernel test robot <lkp@intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
Message-ID: <ckfybgx4suqpm2hjkm3zgdssxh4rmy4dxxjy35yqarg2ybu6fk@fl77gdnzvnhy>
References: <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>
 <202602171002.SP54PXRC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602171002.SP54PXRC-lkp@intel.com>
X-Proofpoint-GUID: 1J3JFFWGrHIUyM6U3sSY-ZGFj71fsaw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NCBTYWx0ZWRfX3YUxx96GJMUT
 bvqViVxsabstIIx+BjoA32ucn5/NyyCGN87Q5YprxGifkGZyZZgSGoCmJK9nQexCPtdRe0Pvg1D
 OlPJCqZrgord4OmiDtI4ZvrICF+onvHGIkVSj2yQDvW2hmkTleZxex++mViSwqlKoIC81du55m+
 ElxRdpVhAjrNSK+zmlPuDtR5/+O6G8TU1qFCo+owI7cKts7YbLLF+bmQYvao2kv7vjnhefl9a0M
 SzHmvQRadgTdM49IqOp4D225p6z8eXWQ2W21IqKyP24n5HJdiROYLd9uNi7AfEnxE3Q4bnVMsAz
 fDwDj243h9IuOfXOqDv5AxOM9tegGa1PbSWqpKsmyo75rG1tMy3CwQjPIFAK+CEDGhYk9Rh0gfM
 obG5cz3uuK6DGXfiI4g48kDV0mYx8KubhoQW2rTa4UjDxR7m4MvzhHuFiLYjK5UkHCWe/V8pYOY
 piWYIq8/PMouVqY49Bg==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69941e7e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=gSbDSvPH9l2sfEXJlosA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: 1J3JFFWGrHIUyM6U3sSY-ZGFj71fsaw1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170064

On 26-02-17 10:31:45, kernel test robot wrote:
> Hi Abel,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 635c467cc14ebdffab3f77610217c1dacaf88e8c]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/dt-bindings-clock-qcom-document-the-Eliza-Global-Clock-Controller/20260216-215148
> base:   635c467cc14ebdffab3f77610217c1dacaf88e8c
> patch link:    https://lore.kernel.org/r/20260216-eliza-clocks-v3-6-8afc5a7e3a98%40oss.qualcomm.com
> patch subject: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602171002.SP54PXRC-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171002.SP54PXRC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602171002.SP54PXRC-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/qcom/tcsrcc-eliza.c:126:3: error: use of undeclared identifier 'TCSR_HDMI_CLKREF_EN'
>      126 |         [TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
>          |          ^
> >> drivers/clk/qcom/tcsrcc-eliza.c:128:3: error: use of undeclared identifier 'TCSR_PCIE_1_CLKREF_EN'
>      128 |         [TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
>          |          ^
> >> drivers/clk/qcom/tcsrcc-eliza.c:145:14: error: invalid application of 'sizeof' to an incomplete type 'struct clk_regmap *[]'
>      145 |         .num_clks = ARRAY_SIZE(tcsr_cc_eliza_clocks),
>          |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
>       11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>          |                                ^~~~~
>    3 errors generated.

Fixed in v4.

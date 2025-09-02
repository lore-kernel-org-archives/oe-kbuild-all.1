Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CAB42065
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 12:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815722; cv=none; b=aX15VgSaQ6nsmlbyWBJemyEzZZ6znzimdNSAFcno0ixtxRRxXcL0WxPi9oQqrLhbmjdOjxh+k4GVJPJk8W9i86FHDsDUIJH93cJlE2pI7WsEHifxOHladsO3FVYEkAophnfyZMYAIZALnDAzaUupxBA78/i4M3QB+e/FE6+OraI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815722; c=relaxed/simple;
	bh=ap3kBXpxvyJ7Lb20rKEK5xpWR0asUl3cXM4pqomtyeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzr8mmE/upzdJG0DBSfuiSY6DC3qwsZFEkIWHU3kAWp4AmdRwNc9FdUbT/BTAZWjni83djIbSUCNvR6LnGyGIYmNwCcSeXhs+ryo/D1gwT7Asj9aRrVoCBTzlM0xEpBRwrSQKUGcriGQ3ioJBjDPpl6RvTfz65BuweWjV89aVro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnOqo/4O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnOqo/4O"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582Aeq6P030068
	for <oe-kbuild-all@lists.linux.dev>; Tue, 2 Sep 2025 12:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GdDcm1pPA+690g+TUeCkBcNloEFTwRmM8eHgs04Vf+E=; b=VnOqo/4ORtqBxRxu
	dHeScBQBuYdbLYZnx/DhTH92bz9d1ZQhOEL+jpx/WYq5PEk8Vp2morLRjXoJN4lS
	By5lxcTSfVSZHenAg3lAux58/+oreiC3xlGL1gwki6VFbA2Bu+UedTNwqLZJFXCc
	4y5OqBmNzRqVlTLr0o3Kuad0uDzqqYhfPV534+YjF4XBX3QpXff1mgr/RTAvORYb
	dFgDZS/e0m+Sw4unQP1cDDWcFbtUBDdPRGji/lxXgk6aOmNQo3lnTY5G7fzrU6uK
	jn6tM/PumqY+JKdgGZftoiT+/6J1HmtqpPku3vwJ25blkO9HxjjeXjUiD4T2GeOq
	4MnAwQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy3jn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Sep 2025 12:22:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-718cb6230afso28256156d6.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Sep 2025 05:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815719; x=1757420519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdDcm1pPA+690g+TUeCkBcNloEFTwRmM8eHgs04Vf+E=;
        b=fRUiJWa9brCcqnWCEEHhnqt0culDJ1deH0VwherN8+u3sSnuNhwWyerDVISodVJYWo
         AvJO51zaAZubwRZES2bX1IGROyMfFbgo9n9xb66WGlM49jexE5vBsuWf6Ir70E9X5efd
         KuDxOfgbhBFVna5oZZ2uVedHKSzbK/eSD414/6s2kDXt6692L0hbfI3sPM0CnSVbu51W
         KRque7Sp3GFGC5Ox69CElNeDJ2C/ZSfaM3C08xx8rnEqY+hBlYSsF55YM5GuuLGBAs+b
         RKJ0Q65kN6UgLe5JImu2pOgZYXTfBwb4xaf+gPwV0/z7XY0G9uvASyPwOf35iKGg+G/r
         JGxA==
X-Forwarded-Encrypted: i=1; AJvYcCXsB5EDONTRujGQRtiyWIxuGopSk/KHx1+Wa6bK5sSVlbHcRz8wd2Mwj12GVc24nbIIsHGZZZg1TF54j6nz@lists.linux.dev
X-Gm-Message-State: AOJu0YyBY9+5sSi5+dodh/JBgt+P0tfpfWifMx77mJT8Xy7cYVg58JlL
	CYCVvpC7k+Q3yyHIq4o1+mq28aInvkg+weueCsbPzDssakcamLpLoK/SG+lu8LFshEEJp1dIVAi
	3Cll347aukDuNV0vT/Binc5zLhn78rpUIiKs1Z6BZKK1q0Et/Lq7RA9VqZCO28l4k8QSd
X-Gm-Gg: ASbGncuPnqX6C9//rVzYiIo2UGmWHo/JvDzW77Xt0TtBV14eop6N41N4b6AKIL/SpcB
	hwOQR8HE0xFLuWKchCFPzh7GQctZKn3CXViz437RtUibXEGs+Mf/nYZuXLUFkL4uiy/42OvRDQ4
	X/mG1vQzx3J/bTYIniCBCQVsPjvzKQnPjpoALfsMlFSrO1Q4Epqn900vDrdgBoA9thV8ZWqaQ0l
	4TG8EsWfJBmQcHi0fiuYcOXVSCIQoe8uB1zFKdzvrMQfD2wSE5AO0F4fSe7LrPjHy/b41pxouYs
	ICaMbv+18v6ZrLt5gJkOLZJsmI31MEQptv/xwjhVTsv1ZS7Gx17Zv2KDXJHx17Hb1II=
X-Received: by 2002:a05:6214:2b0a:b0:715:b3b4:3dca with SMTP id 6a1803df08f44-715b4008c59mr89663546d6.61.1756815719028;
        Tue, 02 Sep 2025 05:21:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9wa99YxWc0KmCjnw35EiTSnM8Lj2uAWvqOXuvGUw99Z2V2CZAizJnqDpJXZko+cJCA5uqgA==
X-Received: by 2002:a05:6214:2b0a:b0:715:b3b4:3dca with SMTP id 6a1803df08f44-715b4008c59mr89662976d6.61.1756815718141;
        Tue, 02 Sep 2025 05:21:58 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b85090262sm146498895e9.17.2025.09.02.05.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:21:57 -0700 (PDT)
Message-ID: <a5343bae-af16-48ed-b113-aa8a76986691@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 13:21:56 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] of: base: Add of_property_read_u8_index
To: kernel test robot <lkp@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, conor+dt@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250901195037.47156-2-srinivas.kandagatla@oss.qualcomm.com>
 <202509021915.6WBFuf9m-lkp@intel.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <202509021915.6WBFuf9m-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b6e168 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=CoiT50wjLESuYxH19fwA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: RC45C9m-SLn4HORHhIbKIwbpBhhmRFV8
X-Proofpoint-ORIG-GUID: RC45C9m-SLn4HORHhIbKIwbpBhhmRFV8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX2m+Slgrjd5Ln
 itQWfsA8awPMKCY7KtdfP+XGkTK9uQowJzWFLdYRqKuXk85QIX3lszPKhzUUspwQC//Ut/yeeDF
 dra7b4R0ILizIh+rkyno2TZbT7nJDOLmIbPHahihexJ3dYL+0alDfxDpmw3Tx3no2J4f8PyCXJz
 2qyAnggfW1czhV1Wf2MFX2cARWYb6TtWrjfiIcb2B0o0AaTO5JVbFBxstBebBSKClo95iYvQ0Lh
 AuJkT2R9gaOk78PohH2E756xfNeZ3UsjzCpFMfRjU0y28/N3+th+w0o24qQ2G6zjhZ1C2fu0b/w
 GfDI7MrW/DpAzxycuwfDlVJNsM/IZdmL0O3PurWEb/d9ytq8db6Q4UXbpdR5trpP0Fwi1VFXWSh
 ZCudAEec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101



On 9/2/25 12:34 PM, kernel test robot wrote:
> Hi Srinivas,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on linus/master v6.17-rc4 next-20250902]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/of-base-Add-of_property_read_u8_index/20250902-035407
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/20250901195037.47156-2-srinivas.kandagatla%40oss.qualcomm.com
> patch subject: [PATCH 1/7] of: base: Add of_property_read_u8_index
> config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20250902/202509021915.6WBFuf9m-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021915.6WBFuf9m-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509021915.6WBFuf9m-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from init/main.c:56:
>    In file included from include/linux/tick.h:8:
>    In file included from include/linux/clockchips.h:14:
>    In file included from include/linux/clocksource.h:19:
>>> include/linux/of.h:645:8: error: unknown type name 'inlinen'; did you mean 'inline'?
>      645 | static inlinen int of_property_read_u8_index(const struct device_node *np,
>          |        ^~~~~~~
>          |        inline
>    1 error generated.
Opps sorry, not sure how it ended up this way,.. will fix this in v2.

--srini
> 
> 
> vim +645 include/linux/of.h
> 
>    644	
>  > 645	static inlinen int of_property_read_u8_index(const struct device_node *np,
>    646				const char *propname, u32 index, u8 *out_value)
>    647	{
>    648		return -ENOSYS;
>    649	}
>    650	
> 


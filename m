Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224A73CF691
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 11:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439121; cv=none; b=pSfYYhTT7EeHSSI6kr3lojfNW7zRcV/59+UVc/FA48sVU4iM3h+Uh2gI+YiWaE0OXJI7RwKgilPiTbRZ8P8pmOENxCuc0lwZF9Zu7vUKlUm58zsPDIFKJoTX/va7GQbXg3h5egHIY3gPM4OTSTjXyGK/yqGGFcxelZ/7sXHp5aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439121; c=relaxed/simple;
	bh=VeDpg5H3Mu1ymhqFJARxM/ReOhJ8aSS48B4t1KpwAfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRFnoh/ntbQJseuCAmZAsJA+j5d5Qr9JS/cFKnsmwvStRVBuGMbwYAD+Nbrmbzc/u79YSWbEBXfc2oOpzA4qKljLbMBKcX927HVjv2cXeeaf47/5djaEvTyVLYy5SO5L++4eJrGGrbGlV5nIdJYqo/MlZ1mot0wq6VyLgRinreY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqDb8+pg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkCrsfl9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqDb8+pg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkCrsfl9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGVuf1895896
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 11:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNU90VtVCZvNVrVMZ9CCy3RANpzV2GHcpjLzCXdmjpQ=; b=LqDb8+pgRIqCCE4N
	DmDsucvK/TYExS/xoduEj8FVcv5XkNAj8IfdmqbLZ4SquUd007a3IGYl0HtEuv89
	6r5YUJ5r3JjWZ0H9fv3TwTa0qbeIwUlfDmzms26b+8gq8NMkc2cz1NG/ZkAofiQu
	WP+9lzQsOJohWqFBlyTmHFQ8ppjNuRUx5FM0NnXaRRBjP3crHOAZZnCwUwEzWk3b
	B13hSt7E1X9jHQGg0Gp9vAJtSh+4zHWm0gyiZyY6oiPVzW8JkVetdZAk+Xpy/Q9w
	GOEBBlzOkPf0PBhsSgfh4oJoTL+jX9gcUSuiHc/yRHZnXozO8CoYtaubKVdkKy56
	i8ZK/g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mhm9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 11:45:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090bc4823cso31700531cf.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 04:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774439118; x=1775043918; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iNU90VtVCZvNVrVMZ9CCy3RANpzV2GHcpjLzCXdmjpQ=;
        b=hkCrsfl9/2cko1y/ehfZQpAJ1ugz9IdrIJ9oe4uVwS34C+KBM06/HNrkx8wC3AhT6k
         0qr/fjk1XQ7ELLNw3WmVejzlwEPqGtpYR73B6u2DI0HmDBSo1vZS5u4ikQC6fnStBGS8
         D3SGZXvHzb9LJ8BLEzDsfKtIf0VbW7Vcwp4WNDImkfCqtNoWEM8USlpuwsaBmjrTTfEH
         2U6o9rx1tQUJuOuiPLfqxiKbmSg4FR8mQGWlNC3M1w5/9wW8gna8Bsec/ay1ZFv0ZBeI
         NZ3SXN6kIQXst6KC+k160faeKvydqJen2MZZ4EnMEc0Fa8fy6w/silkvwuBNqQDc7NwZ
         5Lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439118; x=1775043918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNU90VtVCZvNVrVMZ9CCy3RANpzV2GHcpjLzCXdmjpQ=;
        b=micoxihDC+B1WumQFcz7yyqWOSp0tyc8juu62SaU+L9VttgVdPM93WgTNdVjjSIkrS
         vXaX65fyQRs1l0Jq8lZwza7ZQZz442KxrWy0X7jBd17FvTb1ZM+fH990s8pZ1IF3Vy0y
         12Ks12oAF1ImCYZT9Nx756fsqAY2EdPLWQZXOo14Gm/gAjG402HjQgkmrxMbRiiTYFHB
         eKPlpcaXLubd1kdKDa2BTUxUTOSOW9V+0EeyFtS3IiTYP99yxaM9Vwyhlkp7K77ElDcv
         UxtOEz3n2b5ZYuimFLScKQQJCxQGy4OwnjlQN145e3Qd8+wdrBEaN5kYuEF1eP9pxF0s
         lvaQ==
X-Gm-Message-State: AOJu0YyBaxhNg7DChUFlf6dSEBCbfY3xkigIk7ukKTWA4h0DkApNRbad
	ESf0TrFDWxRbIPOqYbdAKdPfKMWwWHIsjPQGF2Tb4mqq2QbJKm5CxAtWyFLE6M/JJnq8FO8M27i
	r8rffd22GVjsCukle3ZXGe72NaSeFwpjS8S1Oka2dobXuH791dJpEri0QiqFU6VeKV/uL
X-Gm-Gg: ATEYQzwnRe5AVUH3mlkjgNJza9ttp6fjg2DQm+GTwG9uNrIw322gJDPSU1I5L45NzUa
	bLSlh4gqcw7J6+vKsFugiUsqOWjOQ+szNm6h6EffTtxLvP0eAmQaU5whi1hseMe++TWS8ezlW+D
	LZtARfadN6T6LCKt3xnqzwYrdD0AyOI9Qu9tgOJgifF9WzB9WRvngX+jk8uo9jDh20CKU160GXz
	ztrnLoRdUyB3w3p4vrdB4QA3FNOmyGQg2saImx31Za4Y27kgd+ogubBhVolOy6xzOY2FQ9VMlFN
	0rgSYhcqC5qR2zflF8DnvUOhraglXezNsZ6XiHBECOMt/CxOujCN8SuwZkNyEJWK+oJRQW/bdaK
	7WPKqtUQgfXke1YJFDcan8xmZzug9/KnpxDG8CMV9GIL7GyPo
X-Received: by 2002:a05:622a:a6c2:b0:50b:3e05:5ed1 with SMTP id d75a77b69052e-50b80e445e5mr37759571cf.53.1774439118322;
        Wed, 25 Mar 2026 04:45:18 -0700 (PDT)
X-Received: by 2002:a05:622a:a6c2:b0:50b:3e05:5ed1 with SMTP id d75a77b69052e-50b80e445e5mr37758651cf.53.1774439117600;
        Wed, 25 Mar 2026 04:45:17 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4871a937bdfsm78325945e9.9.2026.03.25.04.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:45:16 -0700 (PDT)
Message-ID: <0f5de4aa-ea9a-4e5a-bbf0-58a18e644b55@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:45:15 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: kernel test robot <lkp@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mohammad.rafi.shaik@oss.qualcomm.com,
        linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org, val@packett.cool, mailingradian@gmail.com
References: <20260323223845.2126142-14-srinivas.kandagatla@oss.qualcomm.com>
 <202603250417.fEMbsde2-lkp@intel.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <202603250417.fEMbsde2-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NCBTYWx0ZWRfX6hWyfY5Vd9sm
 pG7JrEYXAK63GzHZHxmZ3lUc7mSP88Pk3IAKOjGgc9vFp5zm60Zx/G3LN5i/sodPQKnGELmMW1v
 ifI5Lgv0Q8EjpaAnPwGBmp5npWX2P+ao0poUX4NPjFR+YxBY0aaXjETFCs8m3PyZQBWnMoUo4Jf
 7KyC8yit8wyOZF9Y5tTWbjpbkOLJmNpUlpXg2ZrzfClPQrjmJTO9RMeyrZxba11u9u71fSTpeeC
 VE8qwn/QBTHcVR7HlEBcsEK4/RDy40QG/BlBtefaAPMtD9C9w+fZAVSoWy7I+2PcWY+QYf7LzMW
 ++UgVjMn6K+AahAdjAyivvB6qtaiUmRvP3fLzJexXyLmVxknv0qADdqbwBBbAVBRgK0vFx6L38/
 da8TyRFwkScJ61CRwggiIQZiTTAfvwz4lYYOAgFqAyLzgAps5bmyvGzBuw8zoEDdguEoOUPnfcX
 4x8+cSugVYFQoD/zQOQ==
X-Proofpoint-GUID: TOiqXVmw4If7ec_X0n4zfsNL5pEmOX-W
X-Proofpoint-ORIG-GUID: TOiqXVmw4If7ec_X0n4zfsNL5pEmOX-W
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c3cacf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=5X_j558OWs3QqKC_3BEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250084



On 3/24/26 8:25 PM, kernel test robot wrote:
> Hi Srinivas,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on broonie-sound/for-next]
> [also build test WARNING on next-20260324]
> [cannot apply to robh/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v7.0-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-qcom-q6apm-move-component-registration-to-unmanaged-version/20260324-160527
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link:    https://lore.kernel.org/r/20260323223845.2126142-14-srinivas.kandagatla%40oss.qualcomm.com
> patch subject: [PATCH v7 13/13] ASoC: qcom: q6apm: Add support for early buffer mapping on DSP
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260325/202603250417.fEMbsde2-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250417.fEMbsde2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603250417.fEMbsde2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    sound/soc/qcom/qdsp6/q6apm.c: In function 'q6apm_free_fragments':
>>> sound/soc/qcom/qdsp6/q6apm.c:321:39: warning: variable 'data' set but not used [-Wunused-but-set-variable]

Looks like some last minute cleanup added this warning, will fix this in
next spin, thanks for reporting this.

--srini
>      321 |         struct audioreach_graph_data *data;
>          |                                       ^~~~
> 
> 
> vim +/data +321 sound/soc/qcom/qdsp6/q6apm.c
> 
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  318  
> ab4c5c6ed2ed1e Srinivas Kandagatla 2026-03-23  319  int q6apm_free_fragments(struct q6apm_graph *graph, unsigned int dir)
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  320  {
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26 @321  	struct audioreach_graph_data *data;
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  322  
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  323  	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  324  		data = &graph->rx_data;
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  325  	else
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  326  		data = &graph->tx_data;
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  327  
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  328  	audioreach_graph_free_buf(graph);
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  329  
> ab4c5c6ed2ed1e Srinivas Kandagatla 2026-03-23  330  	return 0;
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  331  }
> ab4c5c6ed2ed1e Srinivas Kandagatla 2026-03-23  332  EXPORT_SYMBOL_GPL(q6apm_free_fragments);
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  333  
> 


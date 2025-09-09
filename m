Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E882E1EE7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 04:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757391727; cv=none; b=ok4plicohYxdt9srrODtDancCwmi8V5ijExqaICTbEqnfjXwReT17MGuoJcfvt+vs5e9XSkmtoz0wtxrGAK6I946t6vQmCDv7PDmwyyn+g6m0SKh4AkA6xTNiz7BF37+p3qSQrkMdi8LoXNjqk+dXPcaIICtVa2wpZHW+mPRVUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757391727; c=relaxed/simple;
	bh=j6v90dYYiet2HvZxdeUO27siJR1XjbCkPbyzxTjgQV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTbzAihGXQh5TstWC7Pzw5Xi8N7L3rmboiBMkO/l7SQzLV2eHv2laHnm4vgZEJAwh36uq9ihqszloumcF6AEraLRW3UNDA9FI21s+TVQU7W2aysWi/liPFOHqxilbHRNa1q119VQSzpvpv+bQT5gOb7lqaky7SLUz9cZ/l6J79c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgPKZvhZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fgPKZvhZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5894JGsG004445
	for <oe-kbuild-all@lists.linux.dev>; Tue, 9 Sep 2025 04:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2RNlYujfUAP11t9Hv/ZiOCiQwfDezWbTlUXZc80dTq4=; b=fgPKZvhZhRZBjyZ7
	7Vbq2I3hMwCNZyN/8VbLNdJRhVWQCcCuC960Wz7Vb8IIJsrJ9F+ALL0aMQBzTCYk
	4YRvVm1p060W+7X1sk5xbO3RDFEwCGrNRzsiyPs4vuMJ2hTs1WBX95RjVDQBs9wg
	chzZAOe75oxBhkEWkJ390Wbf6aruVokZtnTBY1P5vs+zpVGwVAoiFAOKwtE2CIH1
	4oq3KO5fzZX8aAgfClM4g4fCI/ZfMuHoFxqg+EQPcG/yUOCx5JyBfDPoNW4z6gDD
	DMqLSksEHkADblPTr0PhG9W88GfOsi2jcXstb2Ctrs0aqnYC6NDJ7eJCzPfhI2Kh
	tM6OvA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapf4tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Tue, 09 Sep 2025 04:22:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77288e1ce43so5306511b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 08 Sep 2025 21:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757391722; x=1757996522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RNlYujfUAP11t9Hv/ZiOCiQwfDezWbTlUXZc80dTq4=;
        b=s6rkR3o2YahecfI5bWrvRUeyZ1kY/LuIbGbubFdcc1Htrzk2ZH1/sgEszKirtR05c2
         q7TN8I3UkSXP/ZdcW7ad7IA32pfZ97RcsFosu1frfWEsfv1KId0d8i5YldWUP1UYDr3V
         Y/WfmPTb3ScAYxdZLkAXa7pUBMezwBafSoB689C796oYpX+2SrK017HyK4IinyUZxuF2
         CvNji1RqAVdpfDgR74a/zR4cBMNrSFd+yQzkkf5EIsRwSR0tkmOJjF3VCMQGNZ+mc9rb
         jLoCfbfI2DCL9E/vYIR60fpPivrEQbMJXcvru13odoJrtbgg8kH2KuRj13q2UvO2j5kH
         sE7g==
X-Gm-Message-State: AOJu0Yz8KlIVsZ7bQ/RhaXWDXL4oR2ZQ8vA1OGz084GvHTlIKeZAcnaX
	amcq/ltxjP5uem6HvGPpdSZxZvkXP1KqR2Gl0+naWG3BadH+Ag7s12qyCL+esWf07OZUrUM5pst
	CUk1eOpRAk98WVRvaL7ijiCcL6pIHZSIeqg5R3hCazjMGhY/DAnc3bmxFrjjHKQ2uqcoVXV4RAo
	cj
X-Gm-Gg: ASbGncsYDHnO2zF/4DlbrEOgrWPJAVp/ieJmyk+R9njlxsHurrVN/d7BbbpydH4zPsK
	kkz2qca8+7bXExpUUIW4rmsjyNu8OfCQId1nw8bChbMja2rSdlcjockCKxIEp4bDTdJy0TBhSW2
	T+lXBi2/TFmVAjkorSB86nPmQmkXepN4UpOzdNWH5dSPWXPOp90C8MzFi8J+mu2CShKbfk5cQeW
	0vfX1Y3s6cTxW4CAgg+Ff1Y6pJuwGO9drt1tcVSkuy9bk5w+E5UFRjjrf5ik4HxaJeh48Q8ksXr
	vfC+hUOHls1yoyn/ysgRoAl+6Q+4EVmwug0pRgdxCinrxpidZZ9Rgfjlmd20rVJ3YYITdzqrvg=
	=
X-Received: by 2002:a05:6a00:2d05:b0:772:6493:7e67 with SMTP id d2e1a72fcca58-7742dc9d3f9mr11891625b3a.3.1757391722075;
        Mon, 08 Sep 2025 21:22:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKNi7lH3vplxeGbCsFdMO6FWGGFqXVVmUPa3BBSL8XFQGpLBRslXI40zUkoJ5rmhaumi2dvA==
X-Received: by 2002:a05:6a00:2d05:b0:772:6493:7e67 with SMTP id d2e1a72fcca58-7742dc9d3f9mr11891598b3a.3.1757391721567;
        Mon, 08 Sep 2025 21:22:01 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774668f302bsm482513b3a.35.2025.09.08.21.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 21:22:01 -0700 (PDT)
Message-ID: <8d8fe2c8-6b56-43a6-8a28-5150514da691@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 09:51:56 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: kernel test robot <lkp@intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
References: <20250907181412.2174616-3-krishna.kurapati@oss.qualcomm.com>
 <202509090115.dVhd78BE-lkp@intel.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <202509090115.dVhd78BE-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68bfab6b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=X9NUYyb3VNRp4TtMdKMA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: BS19QYgS7zrCIadUEJHQor_u54kMVj6V
X-Proofpoint-ORIG-GUID: BS19QYgS7zrCIadUEJHQor_u54kMVj6V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX0AEa/fJZxE0v
 0USSsTJ9LvMVH+ZKkbcDZMeQ4lVa6ht1/AxS49WB8N0H+ehSJeXMLmE8+zP9bGT8Fk+Qa2JYW0H
 uPNF7g0cidYf1LVbIuGpfo3grgvymp6pjlj+vLEM83RKyHGSE3WcIayAK1Ln/sH85CafMNX2Wlf
 51RxEEDEVvcB2wJgR7jtQQSPfksUBzYJRa7sHPA1h/81tyimw7eLJfM9N3w0AlIGxltUZzXDFko
 JIhlEJo7X8tgVGD3xArCUaEyhWdRCzbf3UzWlUk2bVd7F8oN4zyyc5ahp4KFp5HMCysYtUM4ZEW
 OuEojhukQISly/T5iqJbzn7LZsG1QtIuLrVjqHl9qwVc3lBU5Foy9PJzOlU3dYA1zLHultAxLL7
 YrQEcF6t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1011 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000



On 9/8/2025 11:55 PM, kernel test robot wrote:
> Hi Krishna,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on usb/usb-testing]
> [also build test WARNING on usb/usb-next next-20250908]
> [cannot apply to usb/usb-linus linus/master v6.17-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Kurapati/usb-dwc3-core-Introduce-glue-callbacks-for-flattened-implementations/20250908-021710
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> patch link:    https://lore.kernel.org/r/20250907181412.2174616-3-krishna.kurapati%40oss.qualcomm.com
> patch subject: [PATCH v5 2/2] usb: dwc3: qcom: Implement glue callbacks to facilitate runtime suspend
> config: hexagon-randconfig-r132-20250908 (https://download.01.org/0day-ci/archive/20250909/202509090115.dVhd78BE-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce: (https://download.01.org/0day-ci/archive/20250909/202509090115.dVhd78BE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509090115.dVhd78BE-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> drivers/usb/dwc3/dwc3-qcom.c:605:22: sparse: sparse: symbol 'dwc3_qcom_glue_ops' was not declared. Should it be static?
> 
> vim +/dwc3_qcom_glue_ops +605 drivers/usb/dwc3/dwc3-qcom.c
> 
>     604	
>   > 605	struct dwc3_glue_ops dwc3_qcom_glue_ops = {
>     606		.pre_set_role	= dwc3_qcom_set_role_notifier,
>     607		.pre_run_stop	= dwc3_qcom_run_stop_notifier,
>     608	};
>     609	
> 

I see that the usb-linus is missing the following patch:

https://lore.kernel.org/all/20250729092708.3628187-1-krishna.kurapati@oss.qualcomm.com/

Regards,
Krishna,

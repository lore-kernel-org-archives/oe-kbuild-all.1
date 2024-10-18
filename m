Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE88513AA2A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729259453; cv=none; b=ag8N2JhsAzEzgr2+LqfTaHc7cnv+meNhuxjFNaUCAZOdolhiYPep44S3PdtaRs2s3BxWiYfC+WTGnCqZEmjQ5UQLWUdT5ymVZ4qoICDvnebhQoVYFvkDUaSCeXU/irGmJ6xhivov4AWzt0FF/ZFKymiXTRv2roz+8BzKyYMAuWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729259453; c=relaxed/simple;
	bh=r7i+yYgh7J1zYo9HdoMsruXa6izNMb62AKlLsvsxGzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXH7RACoajOPTAnFFJo4hHaUMCHLIirbxbJxnCBLOKf2dwD6eOVbjHFw8QRkKoptC73Wic57KBZebxFq6kVg+yxt+fIZKzXH3oRsFf2zAv/BIWsei7Z+m7rNdlTt5/3UqQYZyt1fHrMa466jJfcz1iRLxUyNedoN+StHr1DTjoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eJIW98YF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eJIW98YF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IAMiqk019890
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 13:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6NgMGuZXRsPH9xMGYYqG0hvxucFcWaBvJ1BOrsQvcAA=; b=eJIW98YFeZf9gJcs
	JrcuQ82PBDq7OqPUHlBKqZay+S4Up/qRGY4E5Bt/xfiEE3MFyjz5Ge3oLV9IL407
	H7tXtwW+q1jzjdG0UHVmgboNh3sNRZWsqvrXMqA7DGO2R1bjIGVR0u9jNFklmr+2
	phrjeBeNfG34jJPrGu4IhL34A5Um57JnfoxqLq79vNC1DlYETIM+O5qM2emMicNK
	TZcudqADLOb3GTdoALZv1UlyFHtSfadjENfd+tbbCEIYAijNXD832lLAUfbUtsag
	CmvlU/4sZ6rVOIXPvACIXlw9GOyySM4RoDqoognVwhvo6aO75TzU045KL7RNsRsm
	snuW1g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b0rx480d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 13:50:50 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-4a487bd8d04so79392137.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 06:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729259449; x=1729864249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6NgMGuZXRsPH9xMGYYqG0hvxucFcWaBvJ1BOrsQvcAA=;
        b=dKSnW8B0tES+triuHdCv4MvlG7fTudE04IttdzkvMfKMev0fYpZI0Hw3Tg0k6TtjjZ
         xd/UcDh9bX17wL+KDfTSvhEDmEitLuWdH9DZXdn0FrAycYVfESZi7jQ/thTk1koNzHhO
         XnhHLAaAVFzUUx0Q88qq/N0T/NRxYwlo1IMF3b0bnlKoluxRR6nOhX+hmirUwJbdy03p
         W8XCe8cD2KTHrs+dtTUCwikOJFxvECpHE81QRpQ4UvZDHn7qaImPX41d32Jc1xyE8QlH
         RDolxkz3E1TM6ToHC3mTfYDjIQ5jtQ/uMKxgr0p8oXcmlug0pHGt+xQ4ym3eL5HG8gD4
         rnqA==
X-Gm-Message-State: AOJu0YzmFudt0E89LPvwJ9Z7YPX9siRZxnntPKBVBm5fdTr9SNnfS9iy
	TG7zUIlfbWyT4eNozfDOAWA3dBh3ICccPQDI1pGZ4lFgHqCcdxlJ5Bkt0tJ6gfpfRijm8gzxTO8
	LDF1J7r0ezqr0cubsQM+ct7EPD/kHq6UAkXUUQjCmh4ECLyEk0YT/soa7+lE0JG03
X-Received: by 2002:a05:6102:440e:b0:4a5:b29f:35d with SMTP id ada2fe7eead31-4a5d6bf09efmr817553137.6.1729259449444;
        Fri, 18 Oct 2024 06:50:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsmRKVWXbpg5d/Qq1amzcV3+v6IHTO2N1zHba4f4sx/cAwvo//ZGORdI/FABMizW1nhMDShQ==
X-Received: by 2002:a05:6102:440e:b0:4a5:b29f:35d with SMTP id ada2fe7eead31-4a5d6bf09efmr817542137.6.1729259449007;
        Fri, 18 Oct 2024 06:50:49 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c2837dsm98336566b.208.2024.10.18.06.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 06:50:47 -0700 (PDT)
Message-ID: <d4557e40-d078-4833-bfb6-30ac6a310788@oss.qualcomm.com>
Date: Fri, 18 Oct 2024 15:50:46 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 4931/5686]
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1bfc000:
 resets: [[52, 37], [52, 36]] is too long
To: kernel test robot <lkp@intel.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
References: <202410182029.n2zPkuGx-lkp@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <202410182029.n2zPkuGx-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BfXRAu41suL67i5OA9QOO8D1LAm2Yinj
X-Proofpoint-ORIG-GUID: BfXRAu41suL67i5OA9QOO8D1LAm2Yinj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180088

On 18.10.2024 2:54 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
> commit: 837c333f46df8ce6755ba82c53acb91948ec0072 [4931/5686] arm64: dts: qcom: x1e80100: Fix PCIe 6a lanes description
> config: arm64-randconfig-051-20241017 (https://download.01.org/0day-ci/archive/20241018/202410182029.n2zPkuGx-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
> dtschema version: 2024.10.dev6+g12c3cd5
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410182029.n2zPkuGx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410182029.n2zPkuGx-lkp@intel.com/

FWIW:

> 
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/qcom/x1e80100.dtsi:4150.11-4160.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>    arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>    arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'

Addressed by Rob H's recent revert

>    	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1bfc000: resets: [[52, 37], [52, 36]] is too long
>    	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1bfc000: reset-names: ['phy', 'phy_nocsr'] is too long

Fixed in:
<20241018-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v1-1-f543267a2dd8@linaro.org>

>    	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>    arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1c06000: clocks: [[52, 107], [52, 109], [139, 1], [52, 111], [52, 113], [52, 115]] is too long
>    	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>    arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1c06000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
>    	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>    arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [139, 0], [52, 100], [52, 102], [52, 104]] is too long
>    	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>    arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
>    	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>    arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short

Fixed with the next -next, phy dt bindings changes were pulled in

Others are duplicates

Konrad

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1CC54BC6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 07:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059281; cv=none; b=e69YJcsuXbz/8GRQ2Wah0DTxnl9Be0yviyu7+4tEDXHVwOhQxyzMjUMg22eM/l+npZltxcxInwc2E45+1SLnLu80jkcTuSmPFq8pNp01oD4p7497d0VAgJiTl20+4v1lI+rZPTTz7aycSzW4w0l7VacGPO/YFSbK2WJ3bIzmSqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059281; c=relaxed/simple;
	bh=djzcma3tCsbyWM3OBsA76GyXgCeHr0XEhbO9sqlvzVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HOpo5rThrIfyAZz73LhvaQOvGl5HyaF/DIZS2qkXO4nYvM9r+4xEbGRxHCHQkoxZKrYw56MifiIsTDE5aOoTratFeRpByiefz04MSi6kKCWdHsu9RecJu80h9KE5uP8Pi7lg4cZSh2D1xgE4gMYghMRcR2XjZe6uGkY8KLGaKXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYbc2GW3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYbc2GW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C16EC4CEEA;
	Mon, 16 Jun 2025 07:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750059280;
	bh=djzcma3tCsbyWM3OBsA76GyXgCeHr0XEhbO9sqlvzVo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KYbc2GW3XlB1TrpLFUsar80G4R9zhuOYkHnSmq1tCOriF6bEmjtudDa666lp+GYqN
	 rQ3hE3jGjzPiduXTmfkbYdU9PPCl2SpgWCKSKCgy+7UkW8EffEhUdoq405TmadMGsq
	 1A2px+Y/ylyRd4GiVSPAjKqEAslziQvbjGeS7a+9QKzsUIo56EFaIevOpst7cvom//
	 OxLsGAKIPviM3geeTuIDR7EUd9cvDRTYqezfY4QKsRqq0QT+vQ7TCmz9fw2/tgmGRR
	 93gANWrll6D+8tYq/6pSCN1NwwhugYBJaPsDevKU6sFvbEoxyNWvoI1KrR7tqpVQVm
	 E1u8eP2Ips0mw==
Message-ID: <dd18b287-0c01-480e-86f2-1723a545e845@kernel.org>
Date: Mon, 16 Jun 2025 09:34:36 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1625/2468]
 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@ade0000
 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
To: Jagadeesh Kona <quic_jkona@quicinc.com>, kernel test robot
 <lkp@intel.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>
References: <202506151907.LcLf1RIB-lkp@intel.com>
 <a13c8ffd-87ed-4821-8647-710c792f3466@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <a13c8ffd-87ed-4821-8647-710c792f3466@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2025 09:27, Jagadeesh Kona wrote:
>>    arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
>>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>    arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
>>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> --
>>    arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>    arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
>>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>    arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
>>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> --
>>    arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
>>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>    arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>>>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
>>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
>>    	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>>
> 
> Hi Bjorn,
> 
> This and the below kernel test robot warning[1] is due to dt-bindings changes (patches 1-3) being applied to linux-next tree and
> the corresponding DTS changes(patches 13-18) are not yet applied to linux-next in the PLL multi PD voting series[2].
> 
> I apologise for not mentioning this dependency detail in cover letter. Can you please help to pick DTS patches also from below series[2]?


DTS is independent and goes to different tree/different branch, thus
bisectability is anyway affected.

Your DT bindings patch just documents breaking the ABI, and that's the
another issue here. Broken DTS check is just upstream visible issue.

Best regards,
Krzysztof

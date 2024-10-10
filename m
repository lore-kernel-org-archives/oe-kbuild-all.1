Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635F21B5337
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 09:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553394; cv=none; b=moi67P5qJuO+D8ehkMmqdN11d8H6NNGQrAdQKOvyy8gF44XTd6zo5c3wOEs9lmtqT9bav6leM+IwbnIHuytGkrWQIPztbTp/kv+R4Bx5pRKX0K9cR4IUTWDM2AeRFbOv9e/58XTu1sOfKJsh2bY30Pzd4j/wjOufeHgMM5Ua/WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553394; c=relaxed/simple;
	bh=Ceod205RGaWZZL2tKQZudP9/EkvEoSx/NSRG5h7wONo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5dAIFshul0x2JejuKibhwiWIo9n0bP7s9ko81l+SMU/krCJ7W0viqY2KuXWjYLawBLBZ6ZAAgrrcpFhIwqJ6T/7yEGj8M4QELtkm2/DFJ37lW0z6thKtnYn8FJm+Aikj9PdjoqPaMGXM8k1lHrOJpPKHuTsd/1oEclkIfpEF6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=lT3qiZTZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="lT3qiZTZ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d4612da0fso726413f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 02:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1728553389; x=1729158189; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWOrOEk3SLnsqNkrDU98WrfDoO3I5NIki/8PRshr+fw=;
        b=lT3qiZTZ8ilmfzJ4L2/rBSMFkGbiGZK+Qr+x1+bWvloLTkFI5n6bytD32p6E2Y+WBE
         cwUjeHzBoMsDrEr9XbL33zXbjFok6mYUSh0B55+ybx4iItT8LrQ5IoenVFihI+0TSZEa
         +suF5k2hwH18q8ZsDP5a2+VDi8Mv/zr/DqApN2MkjhT5Nv/17+oAFOLtapt/9t5uG7zJ
         OHpg4N1b0yHz1NQn6Ww1xJ/niOLaNIUFe3sL/W66PXLmaMmavAmzQIh0ZyJWZbNmkQt/
         xCyV7384hJ/B148tGIF2aSQOVp1oJ9MknDHPtLqovGSZAwvis9ujYo3aSFsvcj5CVKmN
         CYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728553389; x=1729158189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWOrOEk3SLnsqNkrDU98WrfDoO3I5NIki/8PRshr+fw=;
        b=PAuGQWjiiQrUFdXtBEOTvCEq4QC0mwxFxqZPOICrqPrZluah/FiHil4A1qsHqbb02r
         sRs+66/yDFMgsAXe5JlVl/U2k4UCWeD9khCEQvpiEMFDMvQKXiHJf1+xEqtI5sM8yo+u
         NNBo/erz/FJqITjfra3LDzjsDZX7SB9ObYn2GZ34TYHp8PIFX0Ln9xK5M/+VFTEU+/+S
         O5ZVrHVybksQwDnoms7shGi5N8tGm1it2StDZqgnyhgDU8QvJ8UCqXhTwDf4GxLuqFfI
         IyuRYWQ5i7yuHXfgQWaCQUEQh4773YJ6L2uT/BkWji4GjPTRBfnbw7zyyVDeLk1SCz9j
         Aq8A==
X-Gm-Message-State: AOJu0Yyxr3Yff1RPdwnsq7NZSMNX5vnuPc2m1mTJXNsk04Yp03BT2fUA
	EirR3ZpG5MPwg0v1SiBX7m1cQieXYxBWd8imQo47yj3lFfS2jJDQFWYU326IATk=
X-Google-Smtp-Source: AGHT+IF2zg3ae4gBPfnpiwhpARZsTBQg/yA9UF0eCPGWcABZPBsn+9pxpHa2qV7EohYA6OGAkGjOWQ==
X-Received: by 2002:a5d:4143:0:b0:37d:3141:5b6 with SMTP id ffacd0b85a97d-37d4816e4c2mr2343604f8f.12.1728553389485;
        Thu, 10 Oct 2024 02:43:09 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79faa8sm1034748f8f.66.2024.10.10.02.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 02:43:09 -0700 (PDT)
Message-ID: <bcf56fde-9f5d-4266-8249-d6489bd95c35@freebox.fr>
Date: Thu, 10 Oct 2024 11:43:08 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 2288/2853]
 arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb:
 clock-controller@c8c0000: clocks: [[31, 0], [34, 178], [144, 1], [144, 0],
 [145, 1], [145, 0], [146], [0], [0], [0], [34, 184]] is too long
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Arnaud Vrac <avrac@freebox.fr>
References: <202410090230.1TqAdril-lkp@intel.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <202410090230.1TqAdril-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hey bot,

At this stage, this is just pointless spam.

Also, not sure WTF linux-mm has to do with this DTS mess?

Cut it out.

On 08/10/2024 20:58, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   33ce24234fca4c083e6685a18b460a18ebb5d5c1
> commit: 2150c87db80cf7eed3939f32cbb18393055c58ce [2288/2853] arm64: dts: qcom: msm8998: add HDMI nodes
> config: arm64-randconfig-051-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090230.1TqAdril-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.1.0
> dtschema version: 2024.10.dev4+g577c1ab
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090230.1TqAdril-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410090230.1TqAdril-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: clock-controller@c8c0000: clocks: [[31, 0], [34, 178], [144, 1], [144, 0], [145, 1], [145, 0], [146], [0], [0], [0], [34, 184]] is too long
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: phy@c012000: 'vdd-supply' is a required property
>    	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>>> arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: clock-controller@c8c0000: clocks: [[34, 0], [37, 178], [155, 1], [155, 0], [156, 1], [156, 0], [157], [0], [0], [0], [37, 184]] is too long
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: clock-controller@c8c0000: clocks: [[31, 0], [34, 178], [144, 1], [144, 0], [145, 1], [145, 0], [146], [0], [0], [0], [34, 184]] is too long
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: clock-controller@c8c0000: clocks: [[31, 0], [34, 178], [144, 1], [144, 0], [145, 1], [145, 0], [146], [0], [0], [0], [34, 184]] is too long
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: phy@c012000: 'vdd-supply' is a required property
>    	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>>> arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: clock-controller@c8c0000: clocks: [[34, 0], [37, 178], [150, 1], [150, 0], [151, 1], [151, 0], [152], [0], [0], [0], [37, 184]] is too long
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: clock-controller@c8c0000: clocks: [[35, 0], [38, 178], [151, 1], [151, 0], [152, 1], [152, 0], [153], [0], [0], [0], [38, 184]] is too long
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: clock-controller@c8c0000: clocks: [[35, 0], [38, 178], [151, 1], [151, 0], [152, 1], [152, 0], [153], [0], [0], [0], [38, 184]] is too long
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: phy@c012000: 'vdd-supply' is a required property
>    	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: clock-controller@c8c0000: clocks: [[3, 0], [39, 178], [156, 1], [156, 0], [157, 1], [157, 0], [158], [0], [0], [0], [39, 184]] is too long
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: phy@c012000: 'vdd-supply' is a required property
>    	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: clock-controller@c8c0000: clocks: [[3, 0], [39, 178], [156, 1], [156, 0], [157, 1], [157, 0], [158], [0], [0], [0], [39, 184]] is too long
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: phy@c012000: 'vdd-supply' is a required property
>    	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: clock-controller@c8c0000: clocks: [[3, 0], [39, 178], [156, 1], [156, 0], [157, 1], [157, 0], [158], [0], [0], [0], [39, 184]] is too long
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> --
>    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>>> arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: clock-controller@c8c0000: clocks: [[34, 0], [37, 178], [149, 1], [149, 0], [150, 1], [150, 0], [151], [0], [0], [0], [37, 184]] is too long
>    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> 


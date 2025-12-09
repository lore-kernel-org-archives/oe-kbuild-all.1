Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6220D2D47F1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765270126; cv=none; b=rEBgrvGmRNKhMaTVDw3QCf38YuS3n9bbOBZBJgXj9QBN2Q2COp9v4Pci9k0ADtok+ACnKbIMMU5lHsIX7SoN0UfYLSgtHvX9g1FC9spWpTxI1+CANirTqC3Jumsn/A+ypR9j8Z3Iy7RJp+IcCR86mlheR0qkL4EDVR1LdD4olfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765270126; c=relaxed/simple;
	bh=xxXWsfhWpFA1GJp9c27igTe9TDJA5SsjtabW2SCAI7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SB8OPtNR0Mcdg4CPAjHtzXzksaUVO7THtjFnjTmCo/BoG1Y65MiJ9IzXXU2X1R9XPPE9kbi40KSk4K9HyxZhZE7nCrtbQZX713anAuSCdQ3JjqpZL1NGBW9lY1/re1Lmoqsot9zvsz/4weQGH+QvxYjOdgWSi8KLr7F5rGrTPq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VcYWlWFh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VcYWlWFh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47774d3536dso50361105e9.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 09 Dec 2025 00:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765270122; x=1765874922; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l/9hlXudcKRpY6hrJvKE8N2TDVYcPTRVJwW6FEeBPqA=;
        b=VcYWlWFhBqLl1dUpJPUi1XtoCC2PlKm2aenyI1uAu19DVhXEXtaB+0/rW27HqRIa9p
         D+ph4MEFBPiyxyyUHAxtDv/t0vtB6NFUMzxsXTHz/mXxec4AUWSUeXiGQcq51Pxvedu9
         JDGcNYxmWBK8zPvq35u5FiJXPSHearLw1zDqcw/qjWPb+j76LRv7jiYesQqVI2pTNXYl
         UJPXRMJf2fpoQgG4TYNTg3KspfGQBOjXLT1kuWqEPLKA1HfEBA6o8Hyrd/rZzxRyB6ye
         ZcTb2QL5b1vb/3M//8XxwYatcnFbwS0D3osuWMWQDKRk9ltDRpBvT/WQ0bcuP37TIsIB
         mMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765270122; x=1765874922;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/9hlXudcKRpY6hrJvKE8N2TDVYcPTRVJwW6FEeBPqA=;
        b=hwQi+0yVt5vSmGjJ9VAKU+UItXX3WAPMqjW0SWzi6JDm83aiPcrFB5cwZPBt8OWayP
         jWlHY4IOZwpPJQ/QjQ6VjykN12jY3IGXZso2JGRnI9y/rmpM2o1FLoD2ae2agPn37Kg0
         uot78ZlyTj63eTFlo0id/NmtyIx4c7T6SvlUw26iLFZz7DSNpYCKxeVEQvkatmkVyYNV
         FnzZbX5yUdigKAnYsgUggaKXI6uIlDshapv/tkO0ha7Nq7oh+IKMklThzuUrvHfuq19p
         +pidiLczNU9zi8rbeXu7RdfuuKTJ4ZwwnArSGxfsaJWPG8ZQpGLjPXhmLGhndBqZ7uwN
         /pQg==
X-Forwarded-Encrypted: i=1; AJvYcCUIIcatZNB3QT7fk1piz0IQ2TqkXsNaF2MFhZof38RScoHjinOQWa//0rW5XFxrvJ8k1J/R9mNyfK2TP0pK@lists.linux.dev
X-Gm-Message-State: AOJu0Yx65uAX8DfL4kirihVy6u/2mdAcKEHW/Nx230aCRddUfo2GvpZi
	J8OUgdgRXKXw680DpQFViWDfy4TP40u+kOXVgVrIcxYq5BiejzylTiC2ASDq5q9bgKc=
X-Gm-Gg: ASbGnct2YTkQ2xhsOkagZpZh0XpUm9MyltgUXmKxJEP+qR6uYf/PpYl5OsS5FgB46LO
	4Bbl0MDPTuTyLUChsvQbTDnJa1O3gefSHRr21UGBdmn4n7D8c3QllhJtwoUn67AaJHF1n/xyWoR
	ATDR5XSfKvUzUZcnNWdwg6xRbfK0gWZUiuA1gJRvASnwTPHzH1dzyusUuem4bFcJXi2rDLI8kIO
	nwADK2sI1cInTCGPVBi0sOfiImHLdaTGWAOTphD+sKcpHSzDJGppGbcLpFPGEywXHAy80ii6wka
	uBNrOIZU/fDX4E4m9JHHrTd+RqVhbbLUbJaoZhHq168N+vDVVeduxBkogs8ODhud7rZnJKhrbhw
	qLUksvcV9dUeT/xqtAHG3yF/SGxce0vHSOs1HfG1ullhDb1Re64tygTJEnpx0cbOnG+ZijYbzCi
	Z+BRuFOUWdz6BzabNF
X-Google-Smtp-Source: AGHT+IEyUdXVoGKJ6G1vggWr7AbmYX2zJ5dyUaV8iLG3jzVKrJy/wBKa5LULXZdnqeSVsi3fwgMy3w==
X-Received: by 2002:a05:600c:4fcd:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-47a7fa4d3a5mr7260845e9.16.1765270121392;
        Tue, 09 Dec 2025 00:48:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d222478sm29846951f8f.20.2025.12.09.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 00:48:40 -0800 (PST)
Date: Tue, 9 Dec 2025 11:48:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sriram Dash <sriram.dash@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	jack.pham@oss.qualcomm.com, faisal.hassan@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com, andersson@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sriram Dash <sriram.dash@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] usb: dwc3: qcom: Support firmware-managed resource
 states for power management
Message-ID: <202512060556.pgIgFNxx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127-controller_scmi_upstream-v1-2-38bcca513c28@oss.qualcomm.com>

Hi Sriram,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Sriram-Dash/dt-bindings-usb-qcom-snps-dwc3-Add-support-for-firmware-managed-resources/20251127-183548
base:   c77a6544d8a2364e4bee1b52890f577be27b7296
patch link:    https://lore.kernel.org/r/20251127-controller_scmi_upstream-v1-2-38bcca513c28%40oss.qualcomm.com
patch subject: [PATCH 2/2] usb: dwc3: qcom: Support firmware-managed resource states for power management
config: nios2-randconfig-r071-20251204 (https://download.01.org/0day-ci/archive/20251206/202512060556.pgIgFNxx-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512060556.pgIgFNxx-lkp@intel.com/

smatch warnings:
drivers/usb/dwc3/dwc3-qcom.c:801 dwc3_qcom_probe() error: uninitialized symbol 'ret'.

vim +/ret +801 drivers/usb/dwc3/dwc3-qcom.c

21188e8d6d7590 Krishna Kurapati   2025-09-07  668  
2bc02355f8ba2c Lee Jones          2019-06-17  669  static int dwc3_qcom_probe(struct platform_device *pdev)
2bc02355f8ba2c Lee Jones          2019-06-17  670  {
1881a32fe14df8 Bjorn Andersson    2025-04-14  671  	struct dwc3_probe_data	probe_data = {};
2bc02355f8ba2c Lee Jones          2019-06-17  672  	struct device		*dev = &pdev->dev;
a4333c3a6ba9ca Manu Gautam        2018-05-09  673  	struct dwc3_qcom	*qcom;
1881a32fe14df8 Bjorn Andersson    2025-04-14  674  	struct resource		res;
1881a32fe14df8 Bjorn Andersson    2025-04-14  675  	struct resource		*r;
e33ebb133a245a Bjorn Andersson    2025-05-08  676  	int			ret;
a4333c3a6ba9ca Manu Gautam        2018-05-09  677  	bool			ignore_pipe_clk;
e3fafbd8e36530 Johan Hovold       2022-08-04  678  	bool			wakeup_source;
a4333c3a6ba9ca Manu Gautam        2018-05-09  679  
a4333c3a6ba9ca Manu Gautam        2018-05-09  680  	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
a4333c3a6ba9ca Manu Gautam        2018-05-09  681  	if (!qcom)
a4333c3a6ba9ca Manu Gautam        2018-05-09  682  		return -ENOMEM;
a4333c3a6ba9ca Manu Gautam        2018-05-09  683  
a4333c3a6ba9ca Manu Gautam        2018-05-09  684  	qcom->dev = &pdev->dev;
a4333c3a6ba9ca Manu Gautam        2018-05-09  685  
79456073227880 Sriram Dash        2025-11-27  686  	qcom->fw_managed = device_get_match_data(dev);
79456073227880 Sriram Dash        2025-11-27  687  	if (qcom->fw_managed) {
79456073227880 Sriram Dash        2025-11-27  688  		ret = dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_INIT);
79456073227880 Sriram Dash        2025-11-27  689  		if (ret < 0)
79456073227880 Sriram Dash        2025-11-27  690  			return ret;
79456073227880 Sriram Dash        2025-11-27  691  	}
79456073227880 Sriram Dash        2025-11-27  692  
a4333c3a6ba9ca Manu Gautam        2018-05-09  693  	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
a4333c3a6ba9ca Manu Gautam        2018-05-09  694  	if (IS_ERR(qcom->resets)) {
79456073227880 Sriram Dash        2025-11-27  695  		dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
60d5b71933c4f1 Andrew Halaney     2023-06-05  696  			      "failed to get resets\n");

ret = dev_err_probe()

79456073227880 Sriram Dash        2025-11-27  697  		goto resources_off;
a4333c3a6ba9ca Manu Gautam        2018-05-09  698  	}
a4333c3a6ba9ca Manu Gautam        2018-05-09  699  
e33ebb133a245a Bjorn Andersson    2025-05-08  700  	ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
e33ebb133a245a Bjorn Andersson    2025-05-08  701  	if (ret < 0)
e33ebb133a245a Bjorn Andersson    2025-05-08  702  		return dev_err_probe(dev, ret, "failed to get clocks\n");
e33ebb133a245a Bjorn Andersson    2025-05-08  703  	qcom->num_clocks = ret;
e33ebb133a245a Bjorn Andersson    2025-05-08  704  
a4333c3a6ba9ca Manu Gautam        2018-05-09  705  	ret = reset_control_assert(qcom->resets);
a4333c3a6ba9ca Manu Gautam        2018-05-09  706  	if (ret) {
a4333c3a6ba9ca Manu Gautam        2018-05-09  707  		dev_err(&pdev->dev, "failed to assert resets, err=%d\n", ret);
79456073227880 Sriram Dash        2025-11-27  708  		goto resources_off;
a4333c3a6ba9ca Manu Gautam        2018-05-09  709  	}
a4333c3a6ba9ca Manu Gautam        2018-05-09  710  
a4333c3a6ba9ca Manu Gautam        2018-05-09  711  	usleep_range(10, 1000);
a4333c3a6ba9ca Manu Gautam        2018-05-09  712  
a4333c3a6ba9ca Manu Gautam        2018-05-09  713  	ret = reset_control_deassert(qcom->resets);
a4333c3a6ba9ca Manu Gautam        2018-05-09  714  	if (ret) {
a4333c3a6ba9ca Manu Gautam        2018-05-09  715  		dev_err(&pdev->dev, "failed to deassert resets, err=%d\n", ret);
ef8abc0ba49ce7 Krishna Kurapati   2025-07-09  716  		return ret;
a4333c3a6ba9ca Manu Gautam        2018-05-09  717  	}
a4333c3a6ba9ca Manu Gautam        2018-05-09  718  
e33ebb133a245a Bjorn Andersson    2025-05-08  719  	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
e33ebb133a245a Bjorn Andersson    2025-05-08  720  	if (ret < 0)
ef8abc0ba49ce7 Krishna Kurapati   2025-07-09  721  		return ret;
a4333c3a6ba9ca Manu Gautam        2018-05-09  722  
1881a32fe14df8 Bjorn Andersson    2025-04-14  723  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
4c0fca65d10548 Dan Carpenter      2025-04-23  724  	if (!r) {
4c0fca65d10548 Dan Carpenter      2025-04-23  725  		ret = -EINVAL;
1881a32fe14df8 Bjorn Andersson    2025-04-14  726  		goto clk_disable;
4c0fca65d10548 Dan Carpenter      2025-04-23  727  	}
1881a32fe14df8 Bjorn Andersson    2025-04-14  728  	res = *r;
1881a32fe14df8 Bjorn Andersson    2025-04-14  729  	res.end = res.start + SDM845_QSCRATCH_BASE_OFFSET;
1881a32fe14df8 Bjorn Andersson    2025-04-14  730  
1881a32fe14df8 Bjorn Andersson    2025-04-14  731  	qcom->qscratch_base = devm_ioremap(dev, res.end, SDM845_QSCRATCH_SIZE);
4c0fca65d10548 Dan Carpenter      2025-04-23  732  	if (!qcom->qscratch_base) {
4c0fca65d10548 Dan Carpenter      2025-04-23  733  		dev_err(dev, "failed to map qscratch region\n");
4c0fca65d10548 Dan Carpenter      2025-04-23  734  		ret = -ENOMEM;
41717b88abf1ca Krishna Kurapati   2024-03-05  735  		goto clk_disable;
a4333c3a6ba9ca Manu Gautam        2018-05-09  736  	}
a4333c3a6ba9ca Manu Gautam        2018-05-09  737  
2dc9f137e19426 Bjorn Andersson    2025-04-14  738  	ret = dwc3_qcom_setup_irq(qcom, pdev);
2bc02355f8ba2c Lee Jones          2019-06-17  739  	if (ret) {
2bc02355f8ba2c Lee Jones          2019-06-17  740  		dev_err(dev, "failed to setup IRQs, err=%d\n", ret);
41717b88abf1ca Krishna Kurapati   2024-03-05  741  		goto clk_disable;
a4333c3a6ba9ca Manu Gautam        2018-05-09  742  	}
a4333c3a6ba9ca Manu Gautam        2018-05-09  743  
a4333c3a6ba9ca Manu Gautam        2018-05-09  744  	/*
a4333c3a6ba9ca Manu Gautam        2018-05-09  745  	 * Disable pipe_clk requirement if specified. Used when dwc3
a4333c3a6ba9ca Manu Gautam        2018-05-09  746  	 * operates without SSPHY and only HS/FS/LS modes are supported.
a4333c3a6ba9ca Manu Gautam        2018-05-09  747  	 */
a4333c3a6ba9ca Manu Gautam        2018-05-09  748  	ignore_pipe_clk = device_property_read_bool(dev,
a4333c3a6ba9ca Manu Gautam        2018-05-09  749  				"qcom,select-utmi-as-pipe-clk");
a4333c3a6ba9ca Manu Gautam        2018-05-09  750  	if (ignore_pipe_clk)
a4333c3a6ba9ca Manu Gautam        2018-05-09  751  		dwc3_qcom_select_utmi_clk(qcom);
a4333c3a6ba9ca Manu Gautam        2018-05-09  752  
21188e8d6d7590 Krishna Kurapati   2025-09-07  753  	qcom->mode = usb_get_dr_mode(dev);
21188e8d6d7590 Krishna Kurapati   2025-09-07  754  
21188e8d6d7590 Krishna Kurapati   2025-09-07  755  	if (qcom->mode == USB_DR_MODE_HOST) {
21188e8d6d7590 Krishna Kurapati   2025-09-07  756  		qcom->current_role = USB_ROLE_HOST;
21188e8d6d7590 Krishna Kurapati   2025-09-07  757  	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
21188e8d6d7590 Krishna Kurapati   2025-09-07  758  		qcom->current_role = USB_ROLE_DEVICE;
21188e8d6d7590 Krishna Kurapati   2025-09-07  759  		dwc3_qcom_vbus_override_enable(qcom, true);
21188e8d6d7590 Krishna Kurapati   2025-09-07  760  	} else {
21188e8d6d7590 Krishna Kurapati   2025-09-07  761  		if ((device_property_read_bool(dev, "usb-role-switch")) &&
21188e8d6d7590 Krishna Kurapati   2025-09-07  762  		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
21188e8d6d7590 Krishna Kurapati   2025-09-07  763  			qcom->current_role = USB_ROLE_HOST;
21188e8d6d7590 Krishna Kurapati   2025-09-07  764  		else
21188e8d6d7590 Krishna Kurapati   2025-09-07  765  			qcom->current_role = USB_ROLE_DEVICE;
21188e8d6d7590 Krishna Kurapati   2025-09-07  766  	}
21188e8d6d7590 Krishna Kurapati   2025-09-07  767  
21188e8d6d7590 Krishna Kurapati   2025-09-07  768  	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
21188e8d6d7590 Krishna Kurapati   2025-09-07  769  
1881a32fe14df8 Bjorn Andersson    2025-04-14  770  	qcom->dwc.dev = dev;
1881a32fe14df8 Bjorn Andersson    2025-04-14  771  	probe_data.dwc = &qcom->dwc;
1881a32fe14df8 Bjorn Andersson    2025-04-14  772  	probe_data.res = &res;
1881a32fe14df8 Bjorn Andersson    2025-04-14  773  	probe_data.ignore_clocks_and_resets = true;
7298c06d58e23c Frank Li           2025-09-29  774  	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
1881a32fe14df8 Bjorn Andersson    2025-04-14  775  	ret = dwc3_core_probe(&probe_data);
2bc02355f8ba2c Lee Jones          2019-06-17  776  	if (ret)  {
1881a32fe14df8 Bjorn Andersson    2025-04-14  777  		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
41717b88abf1ca Krishna Kurapati   2024-03-05  778  		goto clk_disable;
a4333c3a6ba9ca Manu Gautam        2018-05-09  779  	}
a4333c3a6ba9ca Manu Gautam        2018-05-09  780  
bea46b9815154a Sandeep Maheswaram 2020-07-27  781  	ret = dwc3_qcom_interconnect_init(qcom);
bea46b9815154a Sandeep Maheswaram 2020-07-27  782  	if (ret)
1881a32fe14df8 Bjorn Andersson    2025-04-14  783  		goto remove_core;
bea46b9815154a Sandeep Maheswaram 2020-07-27  784  
e3fafbd8e36530 Johan Hovold       2022-08-04  785  	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
e3fafbd8e36530 Johan Hovold       2022-08-04  786  	device_init_wakeup(&pdev->dev, wakeup_source);
d9be8d5c5b032e Sandeep Maheswaram 2022-06-13  787  
a4333c3a6ba9ca Manu Gautam        2018-05-09  788  	qcom->is_suspended = false;
a4333c3a6ba9ca Manu Gautam        2018-05-09  789  
a4333c3a6ba9ca Manu Gautam        2018-05-09  790  	return 0;
a4333c3a6ba9ca Manu Gautam        2018-05-09  791  
1881a32fe14df8 Bjorn Andersson    2025-04-14  792  remove_core:
1881a32fe14df8 Bjorn Andersson    2025-04-14  793  	dwc3_core_remove(&qcom->dwc);
a4333c3a6ba9ca Manu Gautam        2018-05-09  794  clk_disable:
e33ebb133a245a Bjorn Andersson    2025-05-08  795  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
a4333c3a6ba9ca Manu Gautam        2018-05-09  796  
79456073227880 Sriram Dash        2025-11-27  797  resources_off:
79456073227880 Sriram Dash        2025-11-27  798  	if (qcom->fw_managed)
79456073227880 Sriram Dash        2025-11-27  799  		dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_EXIT);
79456073227880 Sriram Dash        2025-11-27  800  
a4333c3a6ba9ca Manu Gautam        2018-05-09 @801  	return ret;
a4333c3a6ba9ca Manu Gautam        2018-05-09  802  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


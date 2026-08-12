Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D733141D104
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528114; cv=none; b=UUC3WofT6qQoOV6rWeTlxGesewePiGo87tpz/gLHd98me9KxJiqNMqNr9N23n+LggHM/THXj+rb5ngvnGzVQ5mss4WpEPcgzqwz6ZgmiCUZU0ILvRiFIGGR6/sm7e0/V2hTIq/t32cgwV2H31i/lfbOMcS0xIhvNcFdUStpYD1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528114; c=relaxed/simple;
	bh=iaJUI/0XDvAWP+CA81WLf+ts9AvhQ1y2O/VPirV2m+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GfDb8tEinkViChpRcuCEpiuTgsapXS3rIrBCYskTbNkslUGHXowXQoqdoBGPh3/bmKJl9+oebn36UE3fEgjdiLRa9zLLXResU4fkYXmr4E4xYBhbeRDnXGZE0ujJyCP5Q1iyzPjMEyjOiE3GJdeJPVeYt3TWFfvGSHsSlQGWyVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLN+1N8N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMrP3c3w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLN+1N8N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMrP3c3w"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9gE1T2211945
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 09:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IM6yXMq39DX30NkVLM6SooXzKXIisePn7EGQ2VUuLjw=; b=PLN+1N8NUVDYJ3Ob
	AkzQiKCeVrtP8N+qV6WANuf/Y3cCi56hjsEQ3WyZHDyb7hmD9/h9SDQtsbTpNjk8
	PW8ZJTa4A0h4tNi82OoGZvW+x2b2vUAdX/XoaHHZ+giOnEu9M5/m0DNbrG2VCS8f
	BsOucgS3EczX/X2cRRmgHf9O2P6m4Gr014qAUEZklKbbNzVoyarlPGjVsRdQScq3
	Yg1We0jlcFepIiQCV+tFu3Zxe+U4lw9JrTSYt794klvz4veLZAGvRNO+utPsGdsm
	VKM3kGWKUYJM1hWYrIOVspsYnM7h2lPvVHfqAU/o8+YX/j8/h5ck/VfFkg7hZXZL
	4RKh5A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hfw17da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 09:48:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84885a4fcabso867447b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786528111; x=1787132911; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IM6yXMq39DX30NkVLM6SooXzKXIisePn7EGQ2VUuLjw=;
        b=IMrP3c3w0k9W0xmwgb9sO9pPNB0FRBleMLGiohyCUL7IdgUXWnkT0Vd+jAI+Cx8RqX
         SXNAROsCXDKjooNocNFD2Px2jwygzPBUN4LdF7KeVwql96tUmca/NKcfVuTCZkI0Ozgx
         qx3eJMQ6Ux0yljZb+rKWbJm1JOTGLZLiwu6mb+voDaJseXY5QjWQYZuHtlCJL5NXgUxx
         s3D/MsFSyJ+rY6l3ny3SFGEX3btMhQ36GgSYDkJoNwxJ/FGerfxwSNlIIm3ewJ5qsvdr
         q/1CwwrCg9p40PbiQfjFQ31aC5A5GzxK8gG35Yo0JphNa17hGIa8KGOSgJWcCfwYAsPL
         sv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528111; x=1787132911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IM6yXMq39DX30NkVLM6SooXzKXIisePn7EGQ2VUuLjw=;
        b=KgxfeuudW1dCM3Rdkswew6iOak1QPd0kJHXvCoD6iQDNBa+MEiVDSKyMu83dNU+Edz
         CTBJn4fBi4IZfxB9d7+FQcU4LL/3Bzp6WIwBbsKRoiBrTM/GBfPPauXRTvJDwaXr1hgX
         zcaymv7oXpPTwpCCRCTSst94PbeV0GlH4HGITjROXhfN50N+yDqbtPGtza5PQwlejbgs
         b8/efR7RsOBl1rzE/i+buRbQVaJQ5cwQd9yuKi6FxX4pIGEg+MlGy2i47Ly3dM1aRaOn
         CXAFrfqezRPQ+alLyIF7Djc29WBi/qk+wIk4pGladeLrnQrq8puNYDI6Eab2UzCMuSTO
         fAbQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHiK1+LnYI6n1QzRWo2GGQTSTbo97ULM1L8XnblZdic14TdEnfjjJl40/twHTSiksAbpEPYkAYYwWlhctL@lists.linux.dev
X-Gm-Message-State: AOJu0YysEhXE7Z9M/UGjS1sEsvOaq+vsxvIYBEBz7NIyjhWtg845MlNI
	R4SG9ad8+39SqQlHJRIpJ5oakLGxxswlheTMwoLpJReTQYXoqqH3jz74aNTOoqZBaqf5TiVlBiv
	M6BaRWPFYCQLKp4PiOz3xkgr1m9oc7uNKSR78RjP69LtXS0mTJkaRYf6WFSePrk5pSJe7
X-Gm-Gg: AR+sD12ufD4HW3ilWMd83iLuzBGOeErcKG9Gv7E8NZHPBTgVg2vLuTdpF+3QSUyf4Y5
	hJqMVa98Tyc1SafF5r+kubxbQq40RbNypkZIq0HExTafO/1tcfvlXkgInqftTlZXzT0EhiChC3K
	8OdZLAGZgELuTPsYFAXFNtBsi8vjy7InL+qcDofsPQGd6VV5RjLQdAUnnH0sUAWYi8Bno/rUA+i
	NMQm8wWX9ot0CWNTz67+Jfdqj1CJKjdE9eiI0q7i1YYIdKEurcCkPpKfMUf5Nx0dZhy73+7OTmo
	sFI+Br/eA9P5bSKYuI48caP5qOEjZA4eSAcTv5++m6wuHTR/q28sX9EcHDU6OhhoKa4/zktnPHG
	UiuMTN182yhcZJqdcF3ZiI3DgDSSB1m31cLLraYjrQwKWpcif4zWFcBB7RX+HpSdvWL7i
X-Received: by 2002:a05:6a00:2386:b0:848:4ff5:5316 with SMTP id d2e1a72fcca58-84fb54dcf49mr3751741b3a.19.1786528110517;
        Wed, 12 Aug 2026 02:48:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2386:b0:848:4ff5:5316 with SMTP id d2e1a72fcca58-84fb54dcf49mr3751698b3a.19.1786528110077;
        Wed, 12 Aug 2026 02:48:30 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1f2645bsm731052b3a.50.2026.08.12.02.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:48:28 -0700 (PDT)
Message-ID: <0802e0ee-499d-4f47-a8d9-1a6eae635ff3@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 15:18:24 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] usb: dwc3: gadget: fix IRQ storm on invalid event
 buffer count
To: Jiazi Liu <jiazi.liu1984@gmail.com>, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        Jiazi Liu <liujiazi@amazon.com>
References: <20260727092258.1121-1-liujiazi@amazon.com>
 <20260812082127.79610-1-liujiazi@amazon.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260812082127.79610-1-liujiazi@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3NyBTYWx0ZWRfX3CXxKdH1QjLn
 yWGVLL8NV3sjAyfqQY94/86ENA/NBQywlQgrIDSjOMAGygdFo984zSpsENxv6KMfxKNAzlOfrqy
 sJuCUfm43MlpB/dher6h7NBSqRc9vQY=
X-Proofpoint-GUID: YgUCm6yKV-gy2BFKyFzAHSMLC4oVT5WC
X-Authority-Analysis: v=2.4 cv=fpDsol4f c=1 sm=1 tr=0 ts=6a7c416f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=fsXfUb1GuYEfvJEzrroA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: YgUCm6yKV-gy2BFKyFzAHSMLC4oVT5WC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3NyBTYWx0ZWRfX+O8KxgftUmFL
 zps5xcScDBnwqFBM4WLcOyA5GkneJ2uWxx9iLbCyoxAFjumaPwyzigziwTHh11HWks40SadyK5k
 Gyp5MmtobEojqY4NHhF5qdvXsiV74MKN/FJVOfr7mz7NHq2PC8QTbh2mTB7bRxYfapTIljWLvhW
 cqdtWbqBAhTE5AtT67HeEq0mTwoXPsjjMe8vrZTWeJVIU9BnAcC1Q4CrIAB3aMIQ2jeyYEPgMAG
 tzEjPpZZex5JCiOHcYhma2U5OoK84dPtbO0iimp9mep2gfmlCy7zVEAS8aK/ihl6No8NWGjozmf
 5OSf4pbR2N+DiwsOApnTqmmDfJWWO4pSGK0bMJbGDM5pqNQjHeZ7XFmxS7C12w8qkY5idBfcqev
 R/ZT/1bRssq2QfaK9iRr/mfbLmw/lE5O1NAvCxtixqSwJ2qkrYv9smF+AUo9rj1BhFb1wZKeo7A
 KKcjSyniVZR6iQqGX3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120077



On 8/12/2026 1:51 PM, Jiazi Liu wrote:
> From: Jiazi Liu <jiazi.liu1984@gmail.com>
> 

[...]

> ---
>   drivers/usb/dwc3/core.h   |  7 +++++++
>   drivers/usb/dwc3/gadget.c | 41 +++++++++++++++++++++++++++++++++++++--
>   2 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 608daeb7ef10..b1cd888eca77 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -49,6 +49,7 @@
>   #define DWC3_ENDPOINTS_NUM	32
>   #define DWC3_XHCI_RESOURCES_NUM	2
>   #define DWC3_ISOC_MAX_RETRIES	5
> +#define DWC3_ERR_RECOVERY_MAX	3
>   
>   #define DWC3_SCRATCHBUF_SIZE	4096	/* each buffer is assumed to be 4KiB */
>   #define DWC3_EVENT_BUFFERS_SIZE	4096
> @@ -1004,6 +1005,7 @@ struct dwc3_glue_ops {
>   /**
>    * struct dwc3 - representation of our controller
>    * @drd_work: workqueue used for role swapping
> + * @err_recovery_work: workqueue used for controller error recovery
>    * @ep0_trb: trb which is used for the ctrl_req
>    * @bounce: address of bounce buffer
>    * @setup_buf: used while precessing STD USB requests
> @@ -1171,6 +1173,7 @@ struct dwc3_glue_ops {
>    * @wakeup_configured: set if the device is configured for remote wakeup.
>    * @suspended: set to track suspend event due to U3/L2.
>    * @susphy_state: state of DWC3_GUSB2PHYCFG_SUSPHY + DWC3_GUSB3PIPECTL_SUSPHY
> + * @err_dying: true when controller is in error recovery, reject all requests
>    *		  before PM suspend.

How about gadget_dying or gadget_died (similar to hc_died in xhci). The 
variable "err_dyring"is misleading.

>    * @imod_interval: set the interrupt moderation interval in 250ns
>    *			increments or 0 to disable.
> @@ -1186,9 +1189,11 @@ struct dwc3_glue_ops {
>    * @wakeup_pending_funcs: Indicates whether any interface has requested for
>    *			 function wakeup in bitmap format where bit position
>    *			 represents interface_id.
> + * @err_recovery_count: number of consecutive error recovery attempts
>    */
>   struct dwc3 {
>   	struct work_struct	drd_work;
> +	struct work_struct	err_recovery_work;
>   	struct dwc3_trb		*ep0_trb;
>   	void			*bounce;
>   	u8			*setup_buf;
> @@ -1420,6 +1425,7 @@ struct dwc3 {
>   	unsigned		wakeup_configured:1;
>   	unsigned		suspended:1;
>   	unsigned		susphy_state:1;
> +	unsigned		err_dying:1;
>   
>   	u16			imod_interval;
>   
> @@ -1429,6 +1435,7 @@ struct dwc3 {
>   	struct dentry		*debug_root;
>   	u32			gsbuscfg0_reqinfo;
>   	u32			wakeup_pending_funcs;
> +	u32			err_recovery_count;
>   };
>   
>   #define INCRX_BURST_MODE 0
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index fa0f16ffafef..05f3ffab6e47 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2054,6 +2054,9 @@ static int dwc3_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
>   
>   	int				ret;
>   
> +	if (dwc->err_dying)
> +		return -ESHUTDOWN;
> +

Not sure but should this check be added for all gadget_ops ?

Regards,
Krishna,

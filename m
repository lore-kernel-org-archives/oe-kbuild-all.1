Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54E92F4A14
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 14:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908267; cv=none; b=LcNiGWfzhnTuEa/c3ezEfNaIbtP8bWEZzzeW4bNTWhU3gWO2x8uPdTaViySrXrdG5IKmlHBQDx78AOPO35NB0rPUBNwYf9BAqWuiAmDhhKnRI7pEAgv8+jRyLA6T6+1aJ/aaGtCk8Ee50GoJZaPDGzvCo2XSMAdpmYyM7uvkV+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908267; c=relaxed/simple;
	bh=HgKKOGM2p63WpTkYbbwVnU+fdtUN9eIMh2AP+3aa/Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dT0lZyawfdfamf8sXTffJ0sOgvetrwSOiLKkOUYVg0t0uzY3plzXS4V9bv4JKeho51LmajOzolQdXeVdJtsUU176P927kV80nRZ1EbA4znNKA44KF4v94mG/uNNJoBx+gVHJGD2tzsI0lTyIMWe/sHaVOgzszZSCFxmd5Xapwoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=Ne8vXWOQ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="Ne8vXWOQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7722c8d2694so4397265b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 03 Sep 2025 07:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1756908264; x=1757513064; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DF7NNzOTfeAplUyiGrcXUnjULOlHRrGxxOTtvokNWdo=;
        b=Ne8vXWOQzuTGF/jyoBXwlA+l8PKlIy+7suNCaiM7+tgQQFqlePT3eFGsOr6ynEFulX
         VjuVayhjeDj3RdHfo9gR0La2XpXBsOmWsgcZ4Pc9AKed872Af8AvOzkMtTgwVONZeNtT
         Ql2sUH6gtFipCX4etb4mbdeve4EuW4mEpqR1xhlRylxHAq9PcxmQEeIMlzICFTVf41HV
         4KSnZdxdT/CmOmcdhOcj4aDYsJ7drshEJ0fYBkJYGBmiuhgrh78qZFvk3NtIue6bs0PR
         5VLn/6M9P1w8olwIm1PBounoytiFAAWqeUrrNybLWzLUfGjaDsdK6ARkMfFGGSD5tDyP
         5gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756908264; x=1757513064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DF7NNzOTfeAplUyiGrcXUnjULOlHRrGxxOTtvokNWdo=;
        b=td1CrypM70EKfvh+972a8P3Wxm2Nhp2Lxebb6hVttBn9CBbl7FRlNzP1F/EgQI1Zd2
         gCecSgK/jTlmkE/Vo7blGjBebLScV4jAtAO8mwK9QKm0MtAdW7jfLkNNaIhi3hOKhoSN
         jSkdEhtk0FAl+MXf5miODuUlhXlSnjBE7tmcRO12GDBYJt3/YwxKdeMJfH2XYtgXnBvk
         wenwaPOOp9rusHtJmG8+V4voz/jufuANa7z2itki5fspEcmW+AMMVPA7WVMxG3D0wbbA
         gfcS79HloBtcrhM3oy/EkdlVOO9CH93/qdw5U7QNmdRI5PwwPuTIhlRNGHMIzibLZaYf
         04Uw==
X-Forwarded-Encrypted: i=1; AJvYcCW+x5g4znyRf4NIeQNJQPc224kpaBZOMCjX5WTkQS25ciuHmCtR8rEANVQedIBc6at6SteHb3SY32zb7kJR@lists.linux.dev
X-Gm-Message-State: AOJu0YytL3bJy4FjEZA6zEP90QbhbihkgeLXpZeP5ym53hBsUgn5Hp8v
	cvR5QpiyQ3Ugv/D5nYjdsDA8+c2Y1rnJ8+lFQg1vwAp9/0CFX13d8rrfQ8Bo71O81Ck=
X-Gm-Gg: ASbGncs3t+9kkPCpZeCMDer3KyhZkw78jL95d790hE6NCXUNHF2BHLFFgMx3kUXhQSK
	rGfCxg/1kkjmeVPWbpltXPmVqDxC0ad3yiUcbKUhh99BwVoYb4wo44V46wacbFTJDz86/0nxkYF
	YdMr9bzxsEYupZ6n9GcHWEJfijn9Jl2t7Hro00CCC0FBMdWIvUlADGhGQJ5Xqwfnk/WWTsTl5MD
	WcEXwT6Wgt82MBhkgfNKjXyR0CUNeLD5AiLo2t3i9UxPeffxXYblCYaTXWF73BJXEIwznbtWhyI
	MtnRl3GM49tJMy2cGVnVdhINsgm66ch5GjYPUv4m0eTNk5lh3sh3vdgtcyIaus5csi8o91YjRTO
	KBjG7N+hzgvWax/IERb9wrcW8
X-Google-Smtp-Source: AGHT+IFBlpLNtgdmmoa5SdWAbPJh9KJ+b6IiZlofc2uxPPTjS7ICUieyCle+dJztVNFLBP++9ETglw==
X-Received: by 2002:a05:6a00:1a8f:b0:772:4759:e433 with SMTP id d2e1a72fcca58-7724759e59emr18474843b3a.2.1756908263633;
        Wed, 03 Sep 2025 07:04:23 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b65a2sm16961841b3a.34.2025.09.03.07.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:04:23 -0700 (PDT)
Date: Wed, 3 Sep 2025 07:04:23 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Marcel Holtmann <marcel@holtmann.org>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org, naresh.kamboju@linaro.org
Subject: Re: [PATCH v2] Bluetooth: Fix build after header cleanup
Message-ID: <aLhK5wEHgxc3BIgb@mozart.vkv.me>
References: <202508300413.OnIedvRh-lkp@intel.com>
 <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
 <84fd4012-966b-4983-b015-ffce06509b5e@molgen.mpg.de>
 <aLNRvzXE4O9dKZoN@mozart.vkv.me>
 <CABBYNZJBDgQHwmx82H2XJ-LCeOsxc77PPo6NA4zzT0dt7Uxddw@mail.gmail.com>
 <aLcQsE3x9o4BzXxp@mozart.vkv.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLcQsE3x9o4BzXxp@mozart.vkv.me>

On Tuesday 09/02 at 08:43 -0700, Calvin Owens wrote:
> Some Kconfig dependencies are needed after my recent cleanup, since
> the core code has its own option.
> 
> Since btmtksdio does not actually call h4_recv_buf(), move the
> definitions it uses outside the BT_HCIUART_H4 gate in hci_uart.h to
> avoid adding a dependency for btmtksdio.
> 
> The rest I touched (bpa10x, btmtkuart, and btnxpuart) do really call
> h4_recv_buf(), so the dependency is required, add it for them.
> 
> Fixes: 74bcec450eea ("Bluetooth: remove duplicate h4_recv_buf() in header")

Hi all,

My fixes tag was wrong and Stephen's automation caught it in linux-next.
I'll send a v3 in response to this with a correct tag, it should be:

Fixes: 0e272fc7e17d ("Bluetooth: remove duplicate h4_recv_buf() in header")

Thanks,
Calvin

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508300413.OnIedvRh-lkp@intel.com/
> Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> ---
>  drivers/bluetooth/Kconfig    | 6 ++++++
>  drivers/bluetooth/hci_uart.h | 8 ++++----
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
> index 4ab32abf0f48..7df69ccb6600 100644
> --- a/drivers/bluetooth/Kconfig
> +++ b/drivers/bluetooth/Kconfig
> @@ -312,7 +312,9 @@ config BT_HCIBCM4377
>  
>  config BT_HCIBPA10X
>  	tristate "HCI BPA10x USB driver"
> +	depends on BT_HCIUART
>  	depends on USB
> +	select BT_HCIUART_H4
>  	help
>  	  Bluetooth HCI BPA10x USB driver.
>  	  This driver provides support for the Digianswer BPA 100/105 Bluetooth
> @@ -437,8 +439,10 @@ config BT_MTKSDIO
>  
>  config BT_MTKUART
>  	tristate "MediaTek HCI UART driver"
> +	depends on BT_HCIUART
>  	depends on SERIAL_DEV_BUS
>  	depends on USB || !BT_HCIBTUSB_MTK
> +	select BT_HCIUART_H4
>  	select BT_MTK
>  	help
>  	  MediaTek Bluetooth HCI UART driver.
> @@ -483,7 +487,9 @@ config BT_VIRTIO
>  
>  config BT_NXPUART
>  	tristate "NXP protocol support"
> +	depends on BT_HCIUART
>  	depends on SERIAL_DEV_BUS
> +	select BT_HCIUART_H4
>  	select CRC32
>  	select CRC8
>  	help
> diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
> index 5ea5dd80e297..cbbe79b241ce 100644
> --- a/drivers/bluetooth/hci_uart.h
> +++ b/drivers/bluetooth/hci_uart.h
> @@ -121,10 +121,6 @@ void hci_uart_set_flow_control(struct hci_uart *hu, bool enable);
>  void hci_uart_set_speeds(struct hci_uart *hu, unsigned int init_speed,
>  			 unsigned int oper_speed);
>  
> -#ifdef CONFIG_BT_HCIUART_H4
> -int h4_init(void);
> -int h4_deinit(void);
> -
>  struct h4_recv_pkt {
>  	u8  type;	/* Packet type */
>  	u8  hlen;	/* Header length */
> @@ -162,6 +158,10 @@ struct h4_recv_pkt {
>  	.lsize = 2, \
>  	.maxlen = HCI_MAX_FRAME_SIZE \
>  
> +#ifdef CONFIG_BT_HCIUART_H4
> +int h4_init(void);
> +int h4_deinit(void);
> +
>  struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
>  			    const unsigned char *buffer, int count,
>  			    const struct h4_recv_pkt *pkts, int pkts_count);
> -- 
> 2.47.2
> 

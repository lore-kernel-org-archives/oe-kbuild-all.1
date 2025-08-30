Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C2B2773FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 05:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756530698; cv=none; b=KoSMvWEthvS8IC5RHS0A/C7siflltN0KxS9g9fnOH7pTibuv7TZ4r2Ur9bwNLLRorXtsw3iPiceZxxKTH7g6kejOW0ysvNqB5zC2I2lfb92xvsLfIY9D5lmYE60gy/DxoGywZdJeeHSr5D6IrkMZXPg+QN3PaVEeKeBBmY4RrMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756530698; c=relaxed/simple;
	bh=FA+LaNAtSrDw22JkgVZ/MEEYs9lp2qPOgwnL7mosRHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d31ZOE2eRwwXW1KDQbJ8NFWts93NYNA3QZhly7eO2B32dUijAapwB+joFvQj22vqrzqqPCt9uNvIQ7fXna3o3ZQVKPRvIWZi5uW479rYdbYEucfItOfHau30xvJDvX5TcoNRAdOCakGf5hoonnPOKm2hQuXgCVFsb+iAaGlDvK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.192] (ip5f5af7fb.dynamic.kabel-deutschland.de [95.90.247.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id AED366004C2C9;
	Sat, 30 Aug 2025 07:11:10 +0200 (CEST)
Message-ID: <84fd4012-966b-4983-b015-ffce06509b5e@molgen.mpg.de>
Date: Sat, 30 Aug 2025 07:11:10 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btmtksdio: Fix build after header cleanup
To: Calvin Owens <calvin@wbinvd.org>
Cc: linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 oe-kbuild-all@lists.linux.dev, Marcel Holtmann <marcel@holtmann.org>,
 Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org
References: <202508300413.OnIedvRh-lkp@intel.com>
 <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Calvin,


Thank you for your patch, and addressing the regression right away.

Am 30.08.25 um 02:50 schrieb Calvin Owens:
> Syzbot found a randconfig which fails after my recent patch:
> 
>      drivers/bluetooth/btmtksdio.c:442:33: error: array type has incomplete element type ‘struct h4_recv_pkt’
>        442 | static const struct h4_recv_pkt mtk_recv_pkts[] = {
>            |                                 ^~~~~~~~~~~~~
>      drivers/bluetooth/btmtksdio.c:443:11: error: ‘H4_RECV_ACL’ undeclared here (not in a function)
>        443 |         { H4_RECV_ACL,      .recv = btmtksdio_recv_acl },
>            |           ^~~~~~~~~~~
>      drivers/bluetooth/btmtksdio.c:444:11: error: ‘H4_RECV_SCO’ undeclared here (not in a function)
>        444 |         { H4_RECV_SCO,      .recv = hci_recv_frame },
>            |           ^~~~~~~~~~~
>      drivers/bluetooth/btmtksdio.c:445:11: error: ‘H4_RECV_EVENT’ undeclared here (not in a function)
>        445 |         { H4_RECV_EVENT,    .recv = btmtksdio_recv_event },
> 
> ...because we can have BT_MTKSDIO=y with BT_HCIUART_H4=n, and the
> definitions used here are gated on BT_HCIUART_H4 in hci_uart.h.

The drivers below seem to be affected:

     drivers/bluetooth/bpa10x.c:     { H4_RECV_EVENT,   .recv = 
hci_recv_frame },
     drivers/bluetooth/btmtksdio.c:  { H4_RECV_EVENT,    .recv = 
btmtksdio_recv_event },
     drivers/bluetooth/btmtkuart.c:  { H4_RECV_EVENT,    .recv = 
btmtkuart_recv_event },
     drivers/bluetooth/btnxpuart.c:  { H4_RECV_EVENT,        .recv = 
hci_recv_frame },

> I think the simplest way to fix this is to remove the gate on the
> definitions in hci_uart.h. Since the constants are macros, there's no
> runtime cost to doing so, and nothing seems to rely on their absence in
> the BT_HCIUART_H4=n case.

Looking at the implementation, it looks like they only work with the H4 
protocol? So maybe, that should be denoted in the Kconfig files?

> I let randconfig builds run for awhile in drivers/bluetooth/ and didn't
> hit anything else, so hopefully this was the only fallout.
> 
> Fixes: 74bcec450eea ("Bluetooth: remove duplicate h4_recv_buf() in header")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508300413.OnIedvRh-lkp@intel.com/
> Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> ---
>   drivers/bluetooth/hci_uart.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
> index 5ea5dd80e297..fd0624988aba 100644
> --- a/drivers/bluetooth/hci_uart.h
> +++ b/drivers/bluetooth/hci_uart.h
> @@ -121,7 +121,6 @@ void hci_uart_set_flow_control(struct hci_uart *hu, bool enable);
>   void hci_uart_set_speeds(struct hci_uart *hu, unsigned int init_speed,
>   			 unsigned int oper_speed);
>   
> -#ifdef CONFIG_BT_HCIUART_H4
>   int h4_init(void);
>   int h4_deinit(void);
>   
> @@ -165,7 +164,6 @@ struct h4_recv_pkt {
>   struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
>   			    const unsigned char *buffer, int count,
>   			    const struct h4_recv_pkt *pkts, int pkts_count);
> -#endif
>   
>   #ifdef CONFIG_BT_HCIUART_BCSP
>   int bcsp_init(void);

It’s a valid fix.

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

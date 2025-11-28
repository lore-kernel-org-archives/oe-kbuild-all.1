Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C492C264F81
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 16:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764347802; cv=pass; b=SaUHN8naKdCo1s57ttCdgJIi9umZx61VtYQZh7hoFIVdJ4mmfrJXjTWwHsjCsSVyV2os6qYiwzolnCtB49puXX1V6KrgUWrirUUUrLdY4U8vYv8GILrGeWvXWcq6L4c/b3lVIkPgX2lv6coHJP+Sfp/dmCktuAKl0YY1/7dpKg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764347802; c=relaxed/simple;
	bh=isq5LGsq2qltaCe0MOQw0rghRj7ayxC3sUd1Kl45RHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwcseepXHCeaKw8/ajjUt7vY4sQaBY2tWHh+tOm+LdPRQT5VBplpsZZSky/Z8YAeca6zzq2lT+VeY7Id1SvZZ3ySwX/1/M1IrEiikMZH2xZVAemBoFbMnbQSIlV2KuaoytaQq+v3qFkh2nLAVWVHTzIdGvdpfasIr//UKPqt+tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hartkopp.net; spf=pass smtp.mailfrom=hartkopp.net; dkim=pass (2048-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b=FcP96tqV; dkim=permerror (0-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b=aPIEyEmI; arc=pass smtp.client-ip=81.169.146.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hartkopp.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hartkopp.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b="FcP96tqV";
	dkim=permerror (0-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b="aPIEyEmI"
ARC-Seal: i=1; a=rsa-sha256; t=1764347790; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=IgWJGEzxs7mY2sQRWSZpQddL8dCAWtgTgb23VLYDjiKwU/osONhVqbZ/4iG51fYEso
    BoeaQwSzT7WJkOx2JU85Ax5eDzgANjxsuTJ6XwVHuoPIzZt1vVavPS3Yonlbtj2MY3xn
    KZTtS09zUjCLvVzlZtqBcGmS5CJtx9w9mPwTiUNYZLW1mCEULpkdiQkSuFk8Mp8gfJor
    ZM4D2AtO4pGa7JMPpACT8LtftcN5vTokETx8oQJE/uizU4CDp3fL5JrUt0u0aZ639f2E
    oKzFV34fsTqxGfHxwRiOKLp25gm3NL6c2/IX/Fwxvj/NBMC/P3ge3na8M7VsSEC6LLh5
    9KIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1764347790;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=2cYmJ+EHjEZxdWdxX0k2iPK0L7O3kfK9lXAGjiI0rz4=;
    b=SxTSGLtM+pMPcM9xCpS7ILgTKJFw7i+aKqu2IHgQ9IX8M5lmEAPwkgqNxhYBKjiU4z
    dZwTPBo4LuAJRp3FsTJ7FN52uDaiale3yvYOREGEkXycuw3um4CI71cVWwg2d1mgPCWr
    4DiTjeBL1dZiMZjkfKKtr1mi1CUtVrGbyTdOS5rO5UJDzwcbtJ8g7ZhNQ7+r/3Ipla3j
    0pvvEvjEYa1C5BMZz0Xc0taYw/SrhUzkjHFjUoJ38tgOEgxTgVOYzj2mDNvh936WVpQ+
    7kivh8XPE2uMzpJtYX41KaJg+exXmuiFLCA07Wrr4DXgDmq588WSBoJ2hrKlAR97w2ud
    1z+w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1764347790;
    s=strato-dkim-0002; d=hartkopp.net;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=2cYmJ+EHjEZxdWdxX0k2iPK0L7O3kfK9lXAGjiI0rz4=;
    b=FcP96tqVrLR6gUE246DmAGad3TvkLghgfEnwKQCidc2b+/Ac2LbgkYpVkCsAR8r9F+
    Giu/nvOKFTU/ZTT0HwgDKxj/cQB82Oex1Z9bqQv0/D1nKEzw4vCk0VHZoy+Fi+CSe7J/
    pMXjhl25zNxmHWfBr2TZ3rqXUk7xSlwnQljHOwWhfaJRGvTOLsJNSOePeAAkofOQT89X
    +IEa8C+mzWRnjSfO3vtMdqVSVsTymZjGsk5F9EKJhKtpnRbmVlHMLVmJqsCRo2uORnUj
    DJk/+zIqpPHPfkGGswRIUMn9oRlJZlY9G95B//+tMVE2/RxK5D0SWge3DML7TkjP8eIM
    9c8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1764347790;
    s=strato-dkim-0003; d=hartkopp.net;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=2cYmJ+EHjEZxdWdxX0k2iPK0L7O3kfK9lXAGjiI0rz4=;
    b=aPIEyEmIibyU/iv/8FNqX89Sca9rzi4elO1B+tcf+9UJhvKGTC9f66myDt0VkvpB0J
    o1vcJpvoUuQrELFy+wAw==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjH4JKvMdQv2tTUsMrZpkO3Mw3lZ/t54cFxeEQ7s8bGWj0Q=="
Received: from [IPV6:2a00:6020:4a38:6810::9f3]
    by smtp.strato.de (RZmta 54.0.0 AUTH)
    with ESMTPSA id Ke2b461ASGaTgSr
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 28 Nov 2025 17:36:29 +0100 (CET)
Message-ID: <c994913f-d747-4bdc-bf7c-ef4341495b73@hartkopp.net>
Date: Fri, 28 Nov 2025 17:36:29 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 11759/12740] net/can/raw.c:933: undefined
 reference to `safe_candev_priv'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Marc Kleine-Budde <mkl@pengutronix.de>
References: <202511282325.uVQFRTkA-lkp@intel.com>
Content-Language: en-US
From: Oliver Hartkopp <socketcan@hartkopp.net>
In-Reply-To: <202511282325.uVQFRTkA-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

the issue already has been reported.

And this patch is on its way:

https://lore.kernel.org/linux-can/20251128100803.65707-1-socketcan@hartkopp.net/

Many thanks,
Oliver


On 28.11.25 16:49, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7d31f578f3230f3b7b33b0930b08f9afd8429817
> commit: 1a620a723853a0f49703c317d52dc6b9602cbaa8 [11759/12740] can: raw: instantly reject unsupported CAN frames
> config: nios2-randconfig-002-20251128 (https://download.01.org/0day-ci/archive/20251128/202511282325.uVQFRTkA-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511282325.uVQFRTkA-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511282325.uVQFRTkA-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     nios2-linux-ld: net/can/raw.o: in function `raw_check_txframe':
>>> net/can/raw.c:933: undefined reference to `safe_candev_priv'
>>> net/can/raw.c:933:(.text+0x284): relocation truncated to fit: R_NIOS2_CALL26 against `safe_candev_priv'
> 
> 
> vim +933 net/can/raw.c
> 
>     929	
>     930	static unsigned int raw_check_txframe(struct raw_sock *ro, struct sk_buff *skb,
>     931					      struct net_device *dev)
>     932	{
>   > 933		struct can_priv *priv = safe_candev_priv(dev);
>     934	
>     935		/* Classical CAN */
>     936		if (can_is_can_skb(skb) && raw_dev_cc_enabled(dev, priv))
>     937			return CAN_MTU;
>     938	
>     939		/* CAN FD */
>     940		if (ro->fd_frames && can_is_canfd_skb(skb) &&
>     941		    raw_dev_fd_enabled(dev, priv))
>     942			return CANFD_MTU;
>     943	
>     944		/* CAN XL */
>     945		if (ro->xl_frames && can_is_canxl_skb(skb) &&
>     946		    raw_dev_xl_enabled(dev, priv))
>     947			return CANXL_MTU;
>     948	
>     949		return 0;
>     950	}
>     951	
> 


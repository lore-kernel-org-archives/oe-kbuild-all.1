Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182D4111AB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 12:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFpmEhcB"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3333a3a599fso2119367f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 09 Dec 2023 04:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702125989; x=1702730789; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xjdryzYl36inEQGef/Je4h5B071Ib3F2VDmAwmitwYo=;
        b=gFpmEhcBLLEirRyaNmUg0YskGxshrHwcIsBPNkbh55M2Z21u7hmpflBtApLA/jIq2F
         jVUTwQvHJjBDkmClAgYxZlI+20P5ffQty6/tkda8QP0F8iHqf2kZRdYbjuG0m3nnUtyI
         Sk8mAzaae7o/RXU7FzOPS7wt8wmmcRzN/hq/yFCqHJqa4nS6maG1dpd9m1C5ZuFbZ0SK
         HZE9gYJrApDKUlhmkrRKR303MBwLEWm89yG0LGaybxAc7bynk41eoxDIiE1szXXpXRBl
         XqjXrhtN3zaHjqi3hDczzP/mnlOmUbwbxwnaHwuVL0f3gZCd9MPNnPQ1cNVnXOc77PSe
         wrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702125989; x=1702730789;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjdryzYl36inEQGef/Je4h5B071Ib3F2VDmAwmitwYo=;
        b=SbyMys/YPgeARJTqjUszhgvrF6tmmYDIwlPv/rutjsymzkyuTAS6NUWz+69ifJeUwr
         SCAI4zhABgpJapHp8LoAue0qOpnG0ig1r9YBksefM3Sxyt2IFhS76zdGvNPXIdkNV7OY
         J5QlgS5va5/1rCxS1iFo9dmlrW59HFeuij3SikwRznt4nMEnwSgnQMeDK1HShnhj2Ty7
         ArLHHJ30RwYO5ov5f+BnnEn7Vhlth06oqUnUUDCDZkO5+lHwijtf2O3Bq3/YiX0sbjuL
         Vwg55URfiE7wr+7Sz11NY0bUxbnuj7CAGp2MFlO6BZ1dFXfgiagPwVAf4/bk375i9fdf
         RlCg==
X-Gm-Message-State: AOJu0YzeTWKneGsIl3yzTFrhnv6iVvSgApNt7HEh6yPo0JrD2EgWQTep
	/VBsVkwRbayDP+G36Z9RpMQ=
X-Google-Smtp-Source: AGHT+IEieSRwwhaURIRh7mltRByGXy6JtzTWhxnklcvsWAvsOtWxPKnn7gd0SkjyFZfvU3/s3j4Auw==
X-Received: by 2002:a05:600c:748:b0:40c:281a:25ff with SMTP id j8-20020a05600c074800b0040c281a25ffmr783705wmn.101.1702125988658;
        Sat, 09 Dec 2023 04:46:28 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d414b000000b0033342f72bf8sm4334859wrq.9.2023.12.09.04.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 04:46:28 -0800 (PST)
Message-ID: <657461a4.5d0a0220.42455.0c13@mx.google.com>
X-Google-Original-Message-ID: <ZXRhLMemQgponswE@Ansuel-xps.>
Date: Sat, 9 Dec 2023 13:44:28 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org
Subject: Re: [net-next PATCH 2/2] net: phy: at803x: add LED support for
 qca808x
References: <20231209014828.28194-2-ansuelsmth@gmail.com>
 <202312092051.FcBofskz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202312092051.FcBofskz-lkp@intel.com>

On Sat, Dec 09, 2023 at 08:38:38PM +0800, kernel test robot wrote:
> Hi Christian,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phy-at803x-add-LED-support-for-qca808x/20231209-095014
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20231209014828.28194-2-ansuelsmth%40gmail.com
> patch subject: [net-next PATCH 2/2] net: phy: at803x: add LED support for qca808x
> config: arm-randconfig-003-20231209 (https://download.01.org/0day-ci/archive/20231209/202312092051.FcBofskz-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312092051.FcBofskz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312092051.FcBofskz-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/bitops.h:68,
>                     from include/linux/log2.h:12,
>                     from include/asm-generic/div64.h:55,
>                     from arch/arm/include/asm/div64.h:107,
>                     from include/linux/math.h:6,
>                     from include/linux/math64.h:6,
>                     from include/linux/time64.h:5,
>                     from include/linux/restart_block.h:10,
>                     from include/linux/thread_info.h:14,
>                     from include/asm-generic/preempt.h:5,
>                     from ./arch/arm/include/generated/asm/preempt.h:1,
>                     from include/linux/preempt.h:79,
>                     from include/linux/spinlock.h:56,
>                     from include/linux/phy.h:15,
>                     from drivers/net/phy/at803x.c:10:
>    drivers/net/phy/at803x.c: In function 'qca808x_led_hw_control_get':
> >> drivers/net/phy/at803x.c:2270:25: error: 'TRIGGER_NETDEV_LINK_2500' undeclared (first use in this function); did you mean 'TRIGGER_NETDEV_LINK_1000'?
>     2270 |                 set_bit(TRIGGER_NETDEV_LINK_2500, rules);
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~
>    arch/arm/include/asm/bitops.h:183:31: note: in definition of macro 'ATOMIC_BITOP'
>      183 |         (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
>          |                               ^~
>    drivers/net/phy/at803x.c:2270:17: note: in expansion of macro 'set_bit'
>     2270 |                 set_bit(TRIGGER_NETDEV_LINK_2500, rules);
>          |                 ^~~~~~~
>    drivers/net/phy/at803x.c:2270:25: note: each undeclared identifier is reported only once for each function it appears in
>     2270 |                 set_bit(TRIGGER_NETDEV_LINK_2500, rules);
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~
>    arch/arm/include/asm/bitops.h:183:31: note: in definition of macro 'ATOMIC_BITOP'
>      183 |         (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
>          |                               ^~
>    drivers/net/phy/at803x.c:2270:17: note: in expansion of macro 'set_bit'
>     2270 |                 set_bit(TRIGGER_NETDEV_LINK_2500, rules);
>          |                 ^~~~~~~
> 
> 
> vim +2270 drivers/net/phy/at803x.c

Hi,
this error is caused by the lack of the commits for the recently added
support for additional link speed in the netdev LED trigger.

These additional modes has been merged in Lee tree but I guess we need
an immutable branch for net-next to actually use them?

> 
>   2242	
>   2243	static int qca808x_led_hw_control_get(struct phy_device *phydev, u8 index,
>   2244					      unsigned long *rules)
>   2245	{
>   2246		u16 reg;
>   2247		int val;
>   2248	
>   2249		if (index > 2)
>   2250			return -EINVAL;
>   2251	
>   2252		/* Check if we have hw control enabled */
>   2253		if (qca808x_led_hw_control_status(phydev, index))
>   2254			return -EINVAL;
>   2255	
>   2256		reg = QCA808X_MMD7_LED_CTRL(index);
>   2257	
>   2258		val = phy_read_mmd(phydev, MDIO_MMD_AN, reg);
>   2259		if (val & QCA808X_LED_TX_BLINK)
>   2260			set_bit(TRIGGER_NETDEV_TX, rules);
>   2261		if (val & QCA808X_LED_RX_BLINK)
>   2262			set_bit(TRIGGER_NETDEV_RX, rules);
>   2263		if (val & QCA808X_LED_SPEED10_ON)
>   2264			set_bit(TRIGGER_NETDEV_LINK_10, rules);
>   2265		if (val & QCA808X_LED_SPEED100_ON)
>   2266			set_bit(TRIGGER_NETDEV_LINK_100, rules);
>   2267		if (val & QCA808X_LED_SPEED1000_ON)
>   2268			set_bit(TRIGGER_NETDEV_LINK_1000, rules);
>   2269		if (val & QCA808X_LED_SPEED2500_ON)
> > 2270			set_bit(TRIGGER_NETDEV_LINK_2500, rules);
>   2271		if (val & QCA808X_LED_HALF_DUPLEX_ON)
>   2272			set_bit(TRIGGER_NETDEV_HALF_DUPLEX, rules);
>   2273		if (val & QCA808X_LED_FULL_DUPLEX_ON)
>   2274			set_bit(TRIGGER_NETDEV_FULL_DUPLEX, rules);
>   2275	
>   2276		return 0;
>   2277	}
>   2278	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
	Ansuel

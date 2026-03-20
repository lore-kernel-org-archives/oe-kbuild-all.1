Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7547E2DB7B7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 03:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773976019; cv=pass; b=o2zCk1ZdIVNBCjfoxzB5uz/AZ/94oMYIMZpHm9FR9S1P/Gyl2fsRG+9+dtr+tdPhkHkvdrTXZawSDrRUcsPiCfXFgRmd7BPhPnUAy/uneL2Axa0GZVfmQPDTbRGbBIIJcZDfORRc6Aih9H+xGJEGt8LvNLcHpQfg+F9uFs1+aHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773976019; c=relaxed/simple;
	bh=RM61q1uWCHCZRwTddCQGqRStiqTB47nu5R9QT11eXPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTNNjYFltF1Edkoyn2x5AzsdLEESKzBeCamVOrZZ144M4eYnX6hlBbEkAXn/u4VUimHppDQ5SUmJP51VSHtcFgU9JSS/uFGEJqFiDt83sOOIuornUbQqftrlVV6dl5ovAKoje39TlQblzr73BSEeb+rLdLE66uKN80FV7UB11Os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXKWsLEF; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXKWsLEF"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b98133bdc4bso176485566b.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 20:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773976017; cv=none;
        d=google.com; s=arc-20240605;
        b=i5h9GbEv/zH97mfCF9DQZ5vOSw+b7vHn/2o+uakV41kSAvS90V0mdUnw1sReZpvL9u
         RyD7sjqBXp47ZWrAJoLmXpcaR07I0RodrHyrUkV9Kwy3G9WsKTKorcxl9LqrJKVxy8gw
         aX0pinjJD701OpHXi1ePtUxKog7t33Hk1ii0FNQ3Km6wx0g5PYy2FUrloI5YZFNC3HAL
         3Yx+h6i+407seO/hAuhqt9d1Jmg3RyIOomKluEsiZK1wm4rBng7+kBxbs6KKJS+jlHV5
         qZNV88pfR924ax6/UfwWjQMSfamiK097lkWETijh7NJqjK37Ouxu0y3InW+dy7Q0QA7a
         HGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Uh2XnjWm7w7sL+W4dFrZCyFtW9ll5NN+pKsvTMlZQ8Y=;
        fh=zGQZucSzrljKBHbSD1k6tNxTP6ihZ69NNjNJvI8wYEc=;
        b=ksD6KBlBMThDqjc4fbbMc43pbayP56aQ56oVFfQh4YrC7F2e857PO1b9yb+HNcefnn
         vS8rC0nOso590GESpIbZACrL7ADMB3GoQKg1wPPYYuc2bBKFhi9tDXncbgfVvvT3E3IB
         M2U0FUCDisydt1zjeVde1yK8saQK8nRsL7CKT60gOviWRMH3x3ARFV7aVzGzKt3IbkPW
         P/z2Yj68OP4NYpQirjTq//DDPInZSyTegSREq2VyPtj26CLZle47yHfO3evPeK/Ryocu
         vGUSr3LTKdz7vYqmVg52fUkSXo6OkGWOOrm5FdsEcvq5l11ABQKi+dpvRkIxrFzhx9EP
         rdzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773976017; x=1774580817; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uh2XnjWm7w7sL+W4dFrZCyFtW9ll5NN+pKsvTMlZQ8Y=;
        b=nXKWsLEFSs6BBFQtj/TnQJt6kbYlSCYHULR1QwinmBD3dWKNa5q5vxiBqHf6Elj2+k
         5gSKxL7b2IsTatmve0EYFrktBVBRAv1FQCowc2br5bphbwT07+qiHSd8vCP/oC2lG2e9
         cr3YdKmKoyI/90I3Z9i+2ytJkTIYpFq/lhHX56Es/23I5PtGH1bbraikwmR/JdtoBHiO
         2zMK/yc9isH03EL6M1s+2jsLvGpPQj1sfxS1tYWuuK8P/h4FLKOCrP/I7OKu4B5X4RMM
         QVfZUdIWmzN1NuXj4zTSGBcnMnTwP/L/zxHly3Ju2hNpKWi4uaaNp8Z2qAkZPC+Sx0NN
         9mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773976017; x=1774580817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh2XnjWm7w7sL+W4dFrZCyFtW9ll5NN+pKsvTMlZQ8Y=;
        b=fY0i3BJxb9V/zqqLRLKmX5RS9pgy0LQ2jOgtyvcPKPPVZCvru8yhWmpkPjX7FL/CV5
         XuprUGwpyZypixit/cx8LpRHnO2At49UpoGiEZs9smFaNAGwZH6kmCF1YKwYxMGw0yWA
         JKJzTr9GqMYqHRxm6PWLJzY61AT7kFxLSZQCCr1Ded+i2U8XQfH9R/lOcrtewx2cT0Ed
         W1BtOQRcOebb3S2rN4GeNsEZe8oXUtGDqgtZRmrSpqf281GXefrU9/eEnHYRfFNcqIL6
         YCXCjyQA4iaVDg3rdDNLHiDSMrKuY9QlYiWSOhnH4eungHje6jXHvbjYoOA6xxm/0l4c
         FaSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBChzb5iRvrX7qrCEOyYLxhhTjoFNrgcoa2mxPmHAFerNqxxQ4YYyn4d+Z06raNjUV+typKVyCK3v3OVTm@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7fKyETu3CvGCx1KLF/zSwSMkFEiokWkhi46+OrREx4R6dnVj8
	t7nrG6YEBhlOhh7garyblbI3v6CCcjkFVxzDvfrZhyj0RA8ouDk3TFiodaOgNSz6vDLX1jiVj0E
	7gT8tEVvQIcndXe32YUNsIXIamkCWuzA=
X-Gm-Gg: ATEYQzwqRnMeCiewqZO0SuAHhdpJ7luTsS31IP3zN4KyL31EjAxVR+vKrYr2m60XkyY
	XtfLlYOnZTHWAycjlrgO5PU5/mRBhAaY9KFe11SmFJx26DvfH1fn+dcknFfqM0F6QLK/3gCOWXh
	DED56rcKnJjuRMzAHNugrowq2HpIk6uJl8II/pwDnwvQUL6JkhmVpef5/Jn0J/hTx/PhcO8Qoyg
	ZXKlEEb8BwNs3GalbmFy6sXW38Ev0DSdXMEgQ5o/h980XUR0JZpUFMmOmEaDmtdH4Y4/4N+5v19
	OFhw9w==
X-Received: by 2002:a17:906:240e:b0:b97:f12a:3f8c with SMTP id
 a640c23a62f3a-b982f1ffa96mr69781266b.20.1773976016363; Thu, 19 Mar 2026
 20:06:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317061700.7734-1-linux.amoon@gmail.com> <202603200758.vueafhDW-lkp@intel.com>
In-Reply-To: <202603200758.vueafhDW-lkp@intel.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 20 Mar 2026 08:36:40 +0530
X-Gm-Features: AaiRm5341vISAh2YMw8-vBK1a-KteoqiImPAmam6qIBBOzrX-3-bGM_THq4e-Z8
Message-ID: <CANAwSgS=TzC=QVs2Mw1qJxDffj5H6gU7Ak=Kdd_pCf_1sgY74Q@mail.gmail.com>
Subject: Re: [PATCH next v1] r8169: Fix PHY lookup for mdiobus_get_phy() and
 improve error reporting during probe
To: kernel test robot <lkp@intel.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Niklas Cassel <cassel@kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, 
	Robin Murphy <robin.murphy@arm.com>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Kernel test robot,

On Fri, 20 Mar 2026 at 05:25, kernel test robot <lkp@intel.com> wrote:
>
> Hi Anand,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 95c541ddfb0815a0ea8477af778bb13bb075079a]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/r8169-Fix-PHY-lookup-for-mdiobus_get_phy-and-improve-error-reporting-during-probe/20260317-183327
> base:   95c541ddfb0815a0ea8477af778bb13bb075079a
> patch link:    https://lore.kernel.org/r/20260317061700.7734-1-linux.amoon%40gmail.com
> patch subject: [PATCH next v1] r8169: Fix PHY lookup for mdiobus_get_phy() and improve error reporting during probe
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260320/202603200758.vueafhDW-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200758.vueafhDW-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603200758.vueafhDW-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):

Please discard this patch.

Thanks
-Anand

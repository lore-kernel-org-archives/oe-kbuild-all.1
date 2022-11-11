Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142142C9D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Nov 2022 11:58:22 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id y16so6161030wrt.12
        for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Nov 2022 03:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/csNnrpZeXCi5vMl5qsZxENLkUINTx9IKmYNiJ+tUIA=;
        b=UUJu52P5HuYM8ugQsMg8HNqMPfHzRkub/EVUP5s/n0O661g/FgFh1cagza2gYI0jr+
         RUW4lXAH+8r6faME61TpLYuQLJ3LbRUKd2BKx5oBIIRJ7jNrgV/HgfYKloJPL5opmmIR
         4aPUCRQkia/lAn5X/kfz+QTJ9vOPHxbGqSdMRWJ9FVqfEDhQSw6u6WIhOnuzTaDaVoXb
         7EiKD5D9L5cbuB/Oa4dKBAAYDl/Pp5X0TSCOAzSVnxXy5qc+m7nIRGkkXut9Nc+oeNUg
         Ggz8hn0nTBnV/YEJsKJepbVZVILE5SPuMygoZO66/AFoNv+evwbzk4yTxMUpKU9bl0wh
         NeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/csNnrpZeXCi5vMl5qsZxENLkUINTx9IKmYNiJ+tUIA=;
        b=QGLrxmIkfXqxCpMGI38F4xHt/4K/2LTt1zhUb1ogl/HQwJeYDIE2ERGMm8cey28phT
         ILpYZJEKkiTyiyMLbkhi4YnNxIkHn9zB8o9wjTYXl1sXbGQ4BRF98+Pm3e+xeLwNvpJJ
         gWx2lMkOBFvzMxvfP74wessb5Kue84lfXTrsmUo0Rfmwgs+4qvNAdv7l8J1ma6cAxZLU
         7Ltlzmi0EkpIkO+EfSQwrwNqylVACh+LU02l2vuq6dAIO/WYRPlWPSrsBUs0Y8Nc/v0h
         1Rny0XHGVDerhyoLF36B5GEB5LcfK1Y4X8BFnqJd0KrDo55/fYWw5utAaUHZdD7E42Up
         ti+Q==
X-Gm-Message-State: ANoB5plU73mCLioaT0gwbqAimbvEPsi4Lr3SDkfFh7fwQOjwguWkRdPz
	8rd1VOJ84/GHIlgpPYpNRgh3DIZZFSQ=
X-Google-Smtp-Source: AA0mqf49o/IU5tpwN27nWJI3SMvjsVWssc8ElUD58Q+VE6AoZXHrsACHFSItEkGopKssFSwn4TYofg==
X-Received: by 2002:a5d:458c:0:b0:236:7005:7e4f with SMTP id p12-20020a5d458c000000b0023670057e4fmr1084469wrq.337.1668167900211;
        Fri, 11 Nov 2022 03:58:20 -0800 (PST)
Received: from [192.168.1.50] ([81.196.40.23])
        by smtp.gmail.com with ESMTPSA id o7-20020a05600c4fc700b003a6125562e1sm3015676wmq.46.2022.11.11.03.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 03:58:19 -0800 (PST)
Message-ID: <5f9bafcd-7c4b-be03-6b4e-f2179140e82e@gmail.com>
Date: Fri, 11 Nov 2022 13:58:19 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [linux-next:master 446/7046]
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:1624:23: sparse:
 sparse: restricted __le16 degrades to integer
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Kalle Valo <kvalo@kernel.org>
References: <202211111210.n5ieTFXH-lkp@intel.com>
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <202211111210.n5ieTFXH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2022 06:25, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   382d2f9e739bc6f151c718b38537ae522ff848cd
> commit: c888183b21f36a247bb166ca9365705611bea847 [446/7046] wifi: rtl8xxxu: Support new chip RTL8188FU
> config: m68k-randconfig-s033-20221111
> compiler: m68k-linux-gcc (GCC) 12.1.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c888183b21f36a247bb166ca9365705611bea847
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout c888183b21f36a247bb166ca9365705611bea847
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash drivers/net/wireless/realtek/rtl8xxxu/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> sparse warnings: (new ones prefixed by >>)
>>> drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:1624:23: sparse: sparse: restricted __le16 degrades to integer
>    drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:1625:23: sparse: sparse: restricted __le16 degrades to integer
> 
> vim +1624 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
> 
>   1607	
>   1608	static int rtl8xxxu_identify_chip(struct rtl8xxxu_priv *priv)
>   1609	{
>   1610		const struct usb_device_descriptor *descriptor = &priv->udev->descriptor;
>   1611		struct device *dev = &priv->udev->dev;
>   1612		struct ieee80211_hw *hw = priv->hw;
>   1613		u32 val32, bonding;
>   1614		u16 val16;
>   1615	
>   1616		val32 = rtl8xxxu_read32(priv, REG_SYS_CFG);
>   1617		priv->chip_cut = (val32 & SYS_CFG_CHIP_VERSION_MASK) >>
>   1618			SYS_CFG_CHIP_VERSION_SHIFT;
>   1619		if (val32 & SYS_CFG_TRP_VAUX_EN) {
>   1620			dev_info(dev, "Unsupported test chip\n");
>   1621			return -ENOTSUPP;
>   1622		}
>   1623	
>> 1624		if (descriptor->idVendor == USB_VENDOR_ID_REALTEK &&
>   1625		    descriptor->idProduct == 0xf179) {
>   1626			sprintf(priv->chip_name, "8188FU");
>   1627	

Ah. I guess this is broken on big endian systems then.

There is already a patch which fixes this by getting rid of these comparisons:
"[PATCH v2 2/3] wifi: rtl8xxxu: Split up rtl8xxxu_identify_chip"

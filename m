Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72521140E5F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755094642; cv=none; b=fnZe6ykwj2EHo0VzH115ohbmDSKVMVDofn28lAY+eX/vugyCe6e9Fq8jsz/dMlmhIdp3t31OFFMOZfpr4sfosz8+QbfcXJL99fpvlMKvVFHXZSuikdOBuWGMfCU42yPNxur3zLnmZvuLVvuT8eNp6aQQ47XEMQ6RVJ9iMKE0o6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755094642; c=relaxed/simple;
	bh=1mSZldsWdWCxke6BuMqVOJ3P1vSpvBSc28O3RhuVlno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=C1zXlbclfzZYWFFJci3uZubQ25sbtSSg7TeMKVhBS84/6N1ybANN9Tb2C+Hp1D/SbknoqMgdSotfNEQFVu9wWhdhLAtIi7vLWSK4Gkk3b3WeqeS1+pz7YkdByoVH54Jd01e3EThx8lcCL6DljBuOb4G3IF9lJ6PZAR05rBHp8oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T9u0KzD0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T9u0KzD0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-459ddf8acf1so56334005e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755094636; x=1755699436; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xFS6u4c/Ebcc668GacdL60NXtwjSwFQiJomUL8MmBtI=;
        b=T9u0KzD0ciz1M7pmajrUP8LnjjujtP0stgNCQCN9aQ6Zidzf+ofWuVarlsWwDliNiV
         4fvAhzHDYA7Y1vGtFjK7GYYHcQl4RXet30U+QNzqf/hYNPAecaRTuzkS6QJ3tpbiX4EB
         +XPWop4cj+qgsDgj2Bww3sSLgBcFVMrwrzGgClIXbxfRGXEWNaPJVYwiy2UaCdcGeXQa
         0VqU+HvQFJSOV5tkPMRrvSHs61+IQL+MX24XFPeqRY7VDORwASt+YY2WqobZqjC2xSlu
         Iv9tl+wZ0amxNKz7MacyfgyEUJO/Wryk8SpLS/2OOX9Qr1YXyL2VuBsNsKzDBsSNFDGU
         T7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755094636; x=1755699436;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFS6u4c/Ebcc668GacdL60NXtwjSwFQiJomUL8MmBtI=;
        b=mVBCrATScei87o2ymkKEua3lyAr/6DxaE5J97vWptZ74A4BftwjM6rEuJgLz9tHlUa
         lgsusEdSmIgtfJx4/qpivbtDjcpmppWXbKfWivTqIrCm5hJCgRRYzdAT5TpMKMQpmr8x
         Y1baDYUyjgUnFGQiKrdSy4duwcJivEZq00/V1jUcaq8cZ+6mypCe3ne6bdD2zZHnoSZp
         mC63INSjJbMeFrdXPOZDBZoZRY0sNT/xufiYeSxvz6cOjJ52iRQel1ZWMM9ZOwRw9G3t
         CCwh/L9ONYCdTMgFUJcxzK8eOiBcTSvoZp5QwnXvBOI5QCXppJWOicK8sCIHa4L++5pk
         GBwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO6xWDAVSkLC9yoySifMZ2dfR0y0fQNWkNzhEmMSWZyoULkqf0A5UUkzJEmrTrgTyzFQmX2sNeYTqETj3x@lists.linux.dev
X-Gm-Message-State: AOJu0YwABZ8dQm9QcjUqQ/ovbH1S4BbnfSRC+8caddu0rGSmCdglyJaS
	V53EoYHOGfBJp+bx7a24zCCD8HKPNG48FCYJFnaoHkw0nFjzrzMLH+rkXOGov3bGU18=
X-Gm-Gg: ASbGncsVl1dOHSDuRqhZxcO5fbe0v6/7nbXRIKAHbG1B7T+gpmBifuHLjjFOr2+2lx+
	EnOkOBpruanpa+8AVUuHsuLvz9xveOOh+yxmH0UQTE/dwdYt2dRltEKBxGdZnSGpAQtFJ9YlTVZ
	2fHADV+nwxUnm6idEdtdsIzs/Uuymt6Jni+z1pawmih+VQqTe3vkmNZNX93KHcnSccfXaUgofqE
	sxtC5rHrv7EQnrKYGeoS2caxZrb/Pa7sNc7uyxuKEymZP/jfZP43C5pAZS9Oa6FAtum8GFqPGvJ
	3WP+ejZIeFy235R9/t7HSCkU+6ohB4ddRN+8d72dKeObRFegA+HnZI5Ax4vZ7WurmbOvd4sU98K
	kFkFRz4zpKBR8Xo0HIBxHuxlBERV5rdXMsKriRohAbrA=
X-Google-Smtp-Source: AGHT+IFQVKMSuayh/HxTBQ1FEx8ZnIBjMw+kNTZelmm0ds2gq+mUAt7QOMh3QsWj7BFZNdcmdXCzEw==
X-Received: by 2002:a05:600c:19cf:b0:458:bfe1:4a91 with SMTP id 5b1f17b1804b1-45a166350a2mr26900635e9.20.1755094636463;
        Wed, 13 Aug 2025 07:17:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4534b3sm47750500f8f.47.2025.08.13.07.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 07:17:16 -0700 (PDT)
Date: Wed, 13 Aug 2025 17:17:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v4 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
Message-ID: <202508132044.XYcvSpm4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-12-bb3906c55e64@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/devres-provide-devm_kmemdup_const/20250812-170336
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250812-pinctrl-gpio-pinfuncs-v4-12-bb3906c55e64%40linaro.org
patch subject: [PATCH v4 12/15] pinctrl: allow to mark pin functions as requestable GPIOs
config: um-randconfig-r072-20250813 (https://download.01.org/0day-ci/archive/20250813/202508132044.XYcvSpm4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508132044.XYcvSpm4-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinmux.c:96 pinmux_can_be_used_for_gpio() warn: variable dereferenced before check 'desc' (see line 92)

vim +/desc +96 drivers/pinctrl/pinmux.c

7cc4e6b0e4ddf6 Andy Shevchenko     2023-11-29   88  bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
472a61e777fe78 Stefan Wahren       2019-08-14   89  {
472a61e777fe78 Stefan Wahren       2019-08-14   90  	struct pin_desc *desc = pin_desc_get(pctldev, pin);
472a61e777fe78 Stefan Wahren       2019-08-14   91  	const struct pinmux_ops *ops = pctldev->desc->pmxops;
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  @92  	const struct pinctrl_setting_mux *mux_setting = desc->mux_setting;
                                                                                                        ^^^^^^^^^^^^^^^^^
Patch adds a new dereference.

6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12   93  	bool func_is_gpio = false;
472a61e777fe78 Stefan Wahren       2019-08-14   94  
472a61e777fe78 Stefan Wahren       2019-08-14   95  	/* Can't inspect pin, assume it can be used */
6ba2fd391ac58c Alexandre Torgue    2019-12-04  @96  	if (!desc || !ops)
                                                            ^^^^^
The old code assumed desc could be NULL.

472a61e777fe78 Stefan Wahren       2019-08-14   97  		return true;
472a61e777fe78 Stefan Wahren       2019-08-14   98  
5a3e85c3c397c7 Mukesh Ojha         2024-10-15   99  	guard(mutex)(&desc->mux_lock);
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  100  	if (mux_setting && ops->function_is_gpio)
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  101  		func_is_gpio = ops->function_is_gpio(pctldev, mux_setting->func);
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  102  
6dd5ffb25d7e35 Bartosz Golaszewski 2025-08-12  103  	if (ops->strict && desc->mux_usecount && !func_is_gpio)
472a61e777fe78 Stefan Wahren       2019-08-14  104  		return false;
472a61e777fe78 Stefan Wahren       2019-08-14  105  
472a61e777fe78 Stefan Wahren       2019-08-14  106  	return !(ops->strict && !!desc->gpio_owner);
472a61e777fe78 Stefan Wahren       2019-08-14  107  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


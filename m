Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651EF125AB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 09:28:27 +0000 (UTC)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 77eae969-044c-11ee-b972-005056bdfda7;
	Tue, 06 Jun 2023 12:28:18 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Tue, 6 Jun 2023 12:28:17 +0300
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: andy.shevchenko@gmail.com, oe-kbuild-all@lists.linux.dev,
	linus.walleij@linaro.org, brgl@bgdev.pl, palmer@dabbelt.com,
	paul.walmsley@sifive.com, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] gpio: ath79: Add missing check for platform_get_irq
Message-ID: <ZH78McKA5nKU1Wg8@surfacebook>
References: <20230606031841.38665-1-jiasheng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606031841.38665-1-jiasheng@iscas.ac.cn>

Tue, Jun 06, 2023 at 11:18:41AM +0800, Jiasheng Jiang kirjoitti:

Is this v4?

> Add the missing check for platform_get_irq() and return error
> if it fails.
> The returned error code will be dealed with in
> module_platform_driver(ath79_gpio_driver) and the driver will not
> be registered.

No, this functional change and has not to be for the fixes unless _this_ is the
regression you are fixing. Did the driver work before at some point as after
this change?

Otherwise you have to _justify_ that this functional change won't break
existing setups (with broked IRQ in Device Tree, for example).

-- 
With Best Regards,
Andy Shevchenko



Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAE813D51D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 06:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720766565; cv=none; b=qGKgGIK7rClqOw8CFEp1u5mqJUjFIqziWAGVwZT2uFSgr45O87bp4cf+Wj2StpiidvicWCGEfLl24aYI26HxgEXIhmexSfEqFbB73Tvp/L6wDPwkROfQDR6U6SOLfaxhdE4ypMpA2UfCbE9C9a2ab2f5EOPeoGB5Uf1+ewHAyAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720766565; c=relaxed/simple;
	bh=JzByVkDjvgfsS2aCnmnQPCTpnHRUNJlKoNXnsiVkpdI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=EASjjnd/etx3Ruo31MVYr6LicO+jXIzwACafrCHmeLwKRhTe5EYlBhu5O+qcIzEO8rAPn0g7mD4a1DxuYQO6RNrPLxAj8SMrF3jBfyMgYnjp9GrKSMhnTA6hNAZnsEf+zOX9PLruRmJbjW2/X8nvTcShhJS58xsY1XmEakpKgIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=QJN29OHp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=v54ihLbQ; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="QJN29OHp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="v54ihLbQ"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 442EB13810FB;
	Fri, 12 Jul 2024 02:42:41 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 12 Jul 2024 02:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1720766561; x=1720852961; bh=kA+mlMK4ns
	lRzk/Foy9FPc6aVy+bUIWN+/xIUkmQGXg=; b=QJN29OHpS3sm6iIxfH0pgLcosh
	8mMDeWYOusxLy4n6rltHCSFGTVCIf8CWbEGRGObHZIbDBQ28/2WHczNz4cr5n+yy
	Zmg16PdxBsGYypr8m9GHHeJVi8VY+fE01u+klgyseHfw0EAQv60zSYjp8aEV8v2y
	qpex+p+ig9YalVxjWLoS1DJQlQ4MDyt/62O3TStlBtWUZlWl2PkHNLKEngICBK0W
	6a/aqlhbJaFSnsiuW22pYQEKcXZPS5hORBDHnc6TiUmLDOSyfHyfU2IiqwBcjrGW
	LIZx9COBFH1Nqk8Ab0AzaPWXi0uDC6u6P66dNyuJu0th26m6743TtEAJyQ8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720766561; x=1720852961; bh=kA+mlMK4nslRzk/Foy9FPc6aVy+b
	UIWN+/xIUkmQGXg=; b=v54ihLbQWUXMplZOwkzaFGguiKpnEW1CvUvN7Zjmh0Lx
	ZqceloeGTKr7g2zeQoVinwq98CZhl79jWEeUmUFmx8mSzJ56MITWC67PTRT5KD5S
	yUmg+TO9TaIQOKEXFreoOwpTlg0gqYVZptb3kSf9le9KOUvuYMSf/dpl3qHj6DnM
	W7tLcLPPy1gNuBlV6KJ4HhLQJK6SuWF8yo5be2krP6m2F7xWdBNySCPkgZmT71nA
	2HuKC4JdAnTVn1ZkC4DSiCuxLH2KWW4AIK3E643vhMKa+4NFtSlMclGhQJHjcWr9
	jfFPuOV9PuZJiHMkNUxONxX9Z43AkmlgmJRl97OD8g==
X-ME-Sender: <xms:YNCQZo7xoNalbgk7zwVEv_6qjCXqVRNNBpbcbSha7gTzDOusbDutWg>
    <xme:YNCQZp6JahYSStSPyUJKvddmm5QqRs4PKplHeNg6YxvrNf2zDMQiFJTA9gaeejYIg
    e6NeNhKhWu_h33RVcU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeehgdduuddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:YNCQZnfkCBw6FDqLGemTgjpGC_tv5je_yvlWM5_sZ7AnBo32hp5Ucw>
    <xmx:YNCQZtKcowHELiiVqFbdLZubNrd0BwaekLfiK4mlyeASRlfHehHASQ>
    <xmx:YNCQZsI1apt8ZnGdb7VKUH0SaM4QfguhhjHsgKJ-2pMHG-FDOAayTA>
    <xmx:YNCQZuzLQ-T1JJ0__7kR4w5H3-lgT4qsXX_2zMP7SLdB7Jd1bEoUPw>
    <xmx:YdCQZhHaXnEaQ3NkUqclrNAdW6JYJCCfUxKdpy-NA2syFBL17AY0gF5G>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DCCC0B6008D; Fri, 12 Jul 2024 02:42:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <0de0aeba-da02-4fa6-a1f8-a468dcbfac58@app.fastmail.com>
In-Reply-To: <ZpC_xsx0t9KFgCCh@google.com>
References: <202407112039.cyyIQ3Js-lkp@intel.com>
 <ZpC_xsx0t9KFgCCh@google.com>
Date: Fri, 12 Jul 2024 08:41:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Linux Memory Management List" <linux-mm@kvack.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "kernel test robot" <lkp@intel.com>
Subject: Re: [linux-next:master 11606/12643] arm-linux-gnueabi-ld:
 arch/arm/mach-pxa/devices.o:undefined reference to `gpio_set_wake'
Content-Type: text/plain

On Fri, Jul 12, 2024, at 07:31, Dmitry Torokhov wrote:
> @@ -684,6 +685,7 @@ struct platform_device pxa27x_device_gpio = {
>  		.platform_data	= &pxa2xx_gpio_info,
>  	},
>  };
> +#endif /* CONFIG_PXA25x || CONFIG_PXA27x */
> 
>  static struct resource pxa_dma_resource[] = {
>  	[0] = {
>
> If you are OK with this I'll submit proper patch.

Right, that's probably the easiest way. I was trying a more
elaborate change (see below), but there is a good chance I
introduce another regression in that, so let's go with
your patch. Please send it directly to soc@kernel.org
Cc:linux-arm-kernel and I'll pick it up.

One more thing I noticed: if you are doing more patches
to convert devices in board files to use software nodes,
we should probably try to move them away from static
platform_device definitions towards a dynamic
platform_device_register_simple() or similar interface
at the same time.

    Arnd


diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
index d050a4c78f97..8813a5d179ed 100644
--- a/arch/arm/mach-pxa/devices.c
+++ b/arch/arm/mach-pxa/devices.c
@@ -633,58 +633,6 @@ struct platform_device pxa27x_device_pwm1 = {
 };
 #endif /* CONFIG_PXA27x || CONFIG_PXA3xx */
 
-const struct software_node pxa2xx_gpiochip_node = {
-	.name	= "gpio-pxa",
-};
-
-struct resource pxa_resource_gpio[] = {
-	{
-		.start	= 0x40e00000,
-		.end	= 0x40e0ffff,
-		.flags	= IORESOURCE_MEM,
-	}, {
-		.start	= IRQ_GPIO0,
-		.end	= IRQ_GPIO0,
-		.name	= "gpio0",
-		.flags	= IORESOURCE_IRQ,
-	}, {
-		.start	= IRQ_GPIO1,
-		.end	= IRQ_GPIO1,
-		.name	= "gpio1",
-		.flags	= IORESOURCE_IRQ,
-	}, {
-		.start	= IRQ_GPIO_2_x,
-		.end	= IRQ_GPIO_2_x,
-		.name	= "gpio_mux",
-		.flags	= IORESOURCE_IRQ,
-	},
-};
-
-static struct pxa_gpio_platform_data pxa2xx_gpio_info = {
-	.irq_base	= PXA_GPIO_TO_IRQ(0),
-	.gpio_set_wake	= gpio_set_wake,
-};
-
-struct platform_device pxa25x_device_gpio = {
-	.name		= "pxa25x-gpio",
-	.id		= -1,
-	.num_resources	= ARRAY_SIZE(pxa_resource_gpio),
-	.resource	= pxa_resource_gpio,
-	.dev		= {
-		.platform_data	= &pxa2xx_gpio_info,
-	},
-};
-
-struct platform_device pxa27x_device_gpio = {
-	.name		= "pxa27x-gpio",
-	.id		= -1,
-	.num_resources	= ARRAY_SIZE(pxa_resource_gpio),
-	.resource	= pxa_resource_gpio,
-	.dev		= {
-		.platform_data	= &pxa2xx_gpio_info,
-	},
-};
-
 static struct resource pxa_dma_resource[] = {
 	[0] = {
 		.start	= 0x40000000,
diff --git a/arch/arm/mach-pxa/mfp-pxa2xx.c b/arch/arm/mach-pxa/mfp-pxa2xx.c
index f5a3d890f682..e0ac1f525f77 100644
--- a/arch/arm/mach-pxa/mfp-pxa2xx.c
+++ b/arch/arm/mach-pxa/mfp-pxa2xx.c
@@ -15,12 +15,16 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/property.h>
+#include <linux/platform_device.h>
 #include <linux/syscore_ops.h>
 #include <linux/soc/pxa/cpu.h>
 
 #include "pxa2xx-regs.h"
 #include "mfp-pxa2xx.h"
 #include "mfp-pxa27x.h"
+#include "irqs.h"
 
 #include "generic.h"
 
@@ -151,24 +155,6 @@ void pxa2xx_mfp_config(unsigned long *mfp_cfgs, int num)
 	}
 }
 
-void pxa2xx_mfp_set_lpm(int mfp, unsigned long lpm)
-{
-	unsigned long flags, c;
-	int gpio;
-
-	gpio = __mfp_validate(mfp);
-	if (gpio < 0)
-		return;
-
-	local_irq_save(flags);
-
-	c = gpio_desc[gpio].config;
-	c = (c & ~MFP_LPM_STATE_MASK) | lpm;
-	__mfp_config_gpio(gpio, c);
-
-	local_irq_restore(flags);
-}
-
 int gpio_set_wake(unsigned int gpio, unsigned int on)
 {
 	struct gpio_desc *d;
@@ -221,7 +207,49 @@ int gpio_set_wake(unsigned int gpio, unsigned int on)
 	return 0;
 }
 
+const struct software_node pxa2xx_gpiochip_node = {
+	.name	= "gpio-pxa",
+};
+
+struct resource pxa_resource_gpio[] = {
+	{
+		.start	= 0x40e00000,
+		.end	= 0x40e0ffff,
+		.flags	= IORESOURCE_MEM,
+	}, {
+		.start	= IRQ_GPIO0,
+		.end	= IRQ_GPIO0,
+		.name	= "gpio0",
+		.flags	= IORESOURCE_IRQ,
+	}, {
+		.start	= IRQ_GPIO1,
+		.end	= IRQ_GPIO1,
+		.name	= "gpio1",
+		.flags	= IORESOURCE_IRQ,
+	}, {
+		.start	= IRQ_GPIO_2_x,
+		.end	= IRQ_GPIO_2_x,
+		.name	= "gpio_mux",
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static struct pxa_gpio_platform_data pxa2xx_gpio_info = {
+	.irq_base	= PXA_GPIO_TO_IRQ(0),
+	.gpio_set_wake	= gpio_set_wake,
+};
+
 #ifdef CONFIG_PXA25x
+struct platform_device pxa25x_device_gpio = {
+	.name		= "pxa25x-gpio",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(pxa_resource_gpio),
+	.resource	= pxa_resource_gpio,
+	.dev		= {
+		.platform_data	= &pxa2xx_gpio_info,
+	},
+};
+
 static void __init pxa25x_mfp_init(void)
 {
 	int i;
@@ -247,6 +275,16 @@ static inline void pxa25x_mfp_init(void) {}
 #endif /* CONFIG_PXA25x */
 
 #ifdef CONFIG_PXA27x
+struct platform_device pxa27x_device_gpio = {
+	.name		= "pxa27x-gpio",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(pxa_resource_gpio),
+	.resource	= pxa_resource_gpio,
+	.dev		= {
+		.platform_data	= &pxa2xx_gpio_info,
+	},
+};
+
 static int pxa27x_pkwr_gpio[] = {
 	13, 16, 17, 34, 36, 37, 38, 39, 90, 91, 93, 94,
 	95, 96, 97, 98, 99, 100, 101, 102

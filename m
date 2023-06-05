Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C42523C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 06:39:57 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6af6fe73f11so4353044a34.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 04 Jun 2023 23:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685947196; x=1688539196;
        h=content-transfer-encoding:fcc:content-language:user-agent
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fgk/wo8630xp173Yx/ga5X9dVpaMMR3Xhkzs0PEQb1k=;
        b=lsySmb8N+DZ0W9o0Spv9KiXGgapqHhHzS0ZxhMs8GYsEoGn6ghoeoM+yqtgCxt7Ben
         HjYnE5dNzaYTf9t+FzZMa6YhgNItWgSun17Jjpy19oxFpWG6vumumpxbua1/pY5gh37e
         NHwYE70CaKjhI8ydi2W5CEeY9oIyK5dpZFtyx0fWNlQCufeOtAQjJOGsnIybFA0bBKCp
         KHIAnawiihck0jeAq9ZFq7dQh36llQUvB/+Mo6GCeYOqSefgPQCn8iQ4NJdW4s/usRBL
         zEGHEk5t8yWShsQ7Rv0tsUGhVfq+4B5SF3i+bj4ie7neaF31E8/Zmc17/SYuraZ/vOVm
         xDDw==
X-Gm-Message-State: AC+VfDwponRrG1NAnDjxy7VWWih47q/FKfFbquHKWS5+QewzkN7f5scv
	OMkv0bVtGdRJvqSsNV6VSug=
X-Google-Smtp-Source: ACHHUZ4s23R/futR+Ducx9yXokwFZsIwRmmVKf8nibPhM9Yz0MHic7lfCgeLoXhjU1dz31gRN8i6rQ==
X-Received: by 2002:a9d:73d6:0:b0:6af:887d:a517 with SMTP id m22-20020a9d73d6000000b006af887da517mr10588570otk.15.1685947196094;
        Sun, 04 Jun 2023 23:39:56 -0700 (PDT)
Received: from localhost ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b0064fe06fe712sm4496529pfm.129.2023.06.04.23.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 23:39:55 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: linux@armlinux.org.uk,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	corbet@lwn.net,
	Bagas Sanjaya <bagasdotme@gmail.com>
Cc: rdunlap@infradead.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xy521521@gmail.com,
	oe-kbuild-all@lists.linux.dev,
	lkp@intel.com,
	Hongyu Xie <xiehongyu1@kylinos.cn>,
	Linux Documentation <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 -next] tty: serial: add panic serial helper
Date: Mon,  5 Jun 2023 14:39:52 +0800
Message-Id: <806cc2f2-485a-d79e-4fec-f5124d5ccbae@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZH1e3tuuie3bGhPj@debian.me>
References: <20230605015957.730085-1-xiehongyu1@kylinos.cn> <ZH1e3tuuie3bGhPj@debian.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Thunderbird/102.11.0
Content-Language: en-US
X-Mozilla-Draft-Info: internal/draft; vcard=0; receipt=0; DSN=0; uuencode=0; attachmentreminder=0; deliveryformat=1
X-Identity-Key: id1
Fcc: imap://xiehongyu1%40kylinos.cn@imap.kylinos.cn/Sent
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,=0D
=0D
=E5=9C=A8 2023/6/5 12:04, Bagas Sanjaya =E5=86=99=E9=81=93:=0D
> On Mon, Jun 05, 2023 at 09:59:57AM +0800, Hongyu Xie wrote:=0D
>> Tested on an arm64 device.=0D
> =0D
> Tested on what device?=0D
An arm64 PC that has 3 pin slot on the motherborad and a RS232 port on =0D
its back panel. This module should works on any PC that has UART port =0D
and the UART driver has implemented two callbacks that I've mentioned in =0D
the Doc.=0D
>=0D
>> diff --git a/Documentation/dev-tools/panic_serial_helper.rst b/Documenta=
tion/dev-tools/panic_serial_helper.rst=0D
>> new file mode 100644=0D
>> index 000000000000..fc5b6e9103bc=0D
>> --- /dev/null=0D
>> +++ b/Documentation/dev-tools/panic_serial_helper.rst=0D
> =0D
> The file name convention is using hyphens (like=0D
> panic-serial-helper.rst).=0D
> =0D
> The wording below really confuses me, but I try my best reviewing here.=0D
> =0D
>> @@ -0,0 +1,148 @@=0D
>> +.. SPDX-License-Identifier: GPL-2.0=0D
>> +=0D
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=0D
>> +Using panic serial helper to get kernel logs after panic=0D
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=0D
>> +=0D
>> +:Author: Hongyu Xie <xiehongyu1@kylinos.cn>=0D
>> +=0D
>> +What is this?=0D
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
>> +=0D
>> +A debug module inspired by kgdboc that allows you to get all kernel log=
s=0D
>> +after panic.=0D
>> +=0D
>> +When do you need it and why?=0D
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0D
>> +=0D
>> +When=0D
>> +--------------=0D
>> +=0D
>> +Didn't enable debugging tool like Kdump and didn't connect a USB-to-UAR=
T=0D
>> +tool to the debug UART port on your PC before panic.=0D
> =0D
> This section is unnecessary.=0D
> =0D
>> +=0D
>> +Why=0D
>> +--------------=0D
>> +=0D
>> +There are many debugging methods to know what was going on before panic=
.=0D
>> +=0D
>> +Kdump, for example. If Kdump is enabled, you can get a core image after=
=0D
> "The first is Kdump. When it is enabled, ... . Then you can use GDB ..."=
=0D
>> +panic. Then use GDB or Crash to debug that core image to know what happ=
ened=0D
>> +before panic (see ``Documentation/admin-guide/kdump/kdump.rst`` for mor=
e=0D
>> +information about Kdump).=0D
> "(see ``Documentation/admin-guide/kdump/kdump.rst for Kdump=0D
> documentation)."=0D
>> +=0D
>> +Another way is to connect the UART side of a USB-to-UART tool to the=0D
>> +debugging UART port (normally a 3 pin slot on the motherborad or a RS23=
2=0D
>> +port on the back panel of your PC) before panic happens. Then connect t=
he=0D
>> +USB side of a USB-to-UART tool to another PC. You can read all the kern=
el=0D
>> +logs coming from that UART port through apps like minicom on another PC=
.=0D
>> +So when panic happens you'll know what was going on.=0D
>> +=0D
>> +What if Kdump hasn't been enabled? And in production environment you do=
n't=0D
>> +always connect a USB-to-UART tool before panic happens.=0D
> =0D
> "... And yet the panic happens in production where you don't have access=
=0D
> to USB-to-UART device?"=0D
People don't always connect an USB-to-UART device while he/she is using =0D
the PC. When panic occurs, it's too late to connect the USB-to-UART =0D
device. With this module, it's never too late.=0D
> =0D
>> +=0D
>> +So if Kdump is not enabled, you can use this module to get all the kern=
el=0D
>> +logs if this module is loaded prior to the panic.=0D
> =0D
> "For both situations, you can use panic_serial_helper module to get all n=
eccessary kernel logs once it is loaded."=0D
> =0D
>> +=0D
>> +How to use it?=0D
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
>> +=0D
>> +Prerequisites=0D
>> +--------------=0D
>> +=0D
>> +1. Same as kgdboc, the UART driver must implement two callbacks in the=
=0D
>> +struct uart_ops. See ``Documentation/dev-tools/kgdb.rst`` section=0D
>> +``kgdboc and uart_ops``=0D
>> +=0D
>> +2. Your PC has an UART port and it's working.=0D
>> +=0D
>> +How=0D
>> +--------------=0D
>> +=0D
>> +First you need to enable ``CONFIG_PANIC_SERIAL_HELPER`` in your=0D
>> +config. To enable ``CONFIG_PANIC_SERIAL_HELPER`` you should look under=
=0D
> "To enable it, go to ..."=0D
>> +:menuselection:`Device Drivers-->Character devices-->Enable TTY (TTY [=
=3Dy])-->Serial drivers`=0D
>> +and select :menuselection:`debug through UART after panic`.=0D
>> +=0D
>> +Second, build and update the kernel image. Then wait for panic.=0D
> "Then build and deploy the kernel as usual."=0D
>> +=0D
>> +After panic, you need to do the following,=0D
> "When the panic occurs, you need to do the following:"=0D
>> +1. connect the UART side of an USB-to-UART tool to any UART=0D
>> +port on your device (PC, server, Laptop, etc...).=0D
>> +Connect the USB side of that tool to another PC. Open=0D
>> +minicom (or other app) on that PC, and set "/dev/ttyUSB0"(or=0D
>> +"/dev/ttyUSB1 if there is already another USB-to-UART tool=0D
>> +connected to your device) with "115200 8N1".=0D
>> +=0D
>> +It automatically selects the port where you first press the=0D
>> +"Enter" key (some keyboard labeled this with "Return").=0D
>> +=0D
>> +2. press "Enter" (or "Return") in that=0D
>> +minicom window; you'll get a help menu:=0D
> "Press Enter and the help menu will appear."=0D
>> +help:::=0D
>> +=0D
>> +    -a      show all kernel msg=0D
>> +=0D
>> +    -3      show S3 msg=0D
>> +=0D
>> +    -4      show S4 msg=0D
>> +=0D
>> +    -filter-[string]        show msg containing [string]=0D
>> +=0D
>> +    -q-     quit=0D
>> +=0D
>> +see ``Help menu options`` for details.=0D
>> +=0D
>> +3. finally, type 'a', '3', '4', 'q' or "filter-xxx" then press=0D
>> +"Enter" to get what you want.=0D
> =0D
> Do I have to pass ``-a`` or ``a``? Or is it command-line program or TUI=0D
> interface?=0D
a=0D
> =0D
> Anyway,=0D
> =0D
> "3. Select one of above options and happy hacking!"=0D
> =0D
>> +=0D
>> +Help menu options=0D
>> +-----------------=0D
>> +Available options:=0D
>> +=0D
>> + - a=0D
>> +=0D
>> +   Show all the messages starting from ``Booting Linux on ...``=0D
>> +=0D
>> + - 3=0D
>> +=0D
>> +   If STR happened before panic, this will show messages starting from=
=0D
>> +   ``PM: suspend entry...``=0D
>> +=0D
>> + - 4=0D
>> +=0D
>> +   If STD happened before panic, this will show messages starting from=
=0D
>> +   ``PM: hibernation entry...``=0D
>> +=0D
>> + - filter-[string]=0D
>> +=0D
>> +   Provide case-ignored filter matching. Only show messages that contai=
ning=0D
>> +   ``string``. For example, if you're only interesting in message lines=
=0D
>> +   that containing ``CPU`` or ``cpu``, you just input=0D
>> +   ``filter-CPU`` or ``filter-cpu``.=0D
>> +   Here is an output example for filtering ``CPU``::=0D
> "For example, if you'd like to see message lines that contain ``CPU`` or=
=0D
> ``cpu``, you can pass either ``filter-CPU`` or ``filter-cpu``. The=0D
> corresponding output would be like::"=0D
>> +=0D
>> +   <6>[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x701f=
6633=0D
>> +   <6>[    0.000000] Detected PIPT I-cache on CPU0=0D
>> +   <6>[    0.000000] CPU features: detected: Kernel page table isolatio=
n (K=0D
>> +=0D
>> +   ...=0D
>> +=0D
>> +   <6>[    0.000000] GICv3: CPU0: using allocated LPI pending table @0x=
0000=0D
>> +   <6>[    0.002411] smp: Bringing up secondary CPUs ...=0D
>> +   <6>[    0.039105] Detected PIPT I-cache on CPU1=0D
>> +=0D
>> +   ...=0D
>> +=0D
>> +   <4>[    6.432129] CPU: 3 PID: 392 Comm: (crub_all) Tainted: G       =
 W=0D
>> +   <4>[    6.560279] CPU: 2 PID: 478 Comm: (ostnamed) Tainted: G       =
 W=0D
>> +=0D
>> +   ...=0D
>> +=0D
>> +   <4>[  225.297828] CPU: 4 PID: 0 Comm: swapper/4 Tainted: G        W=
=0D
>> +   <2>[  225.297909] SMP: stopping secondary CPUs=0D
>> +   <0>[  225.297919] CPU features: 0x000000,02000800,0400421b=0D
>> +=0D
>> + - q=0D
>> +=0D
>> +  Return to help menu.=0D
> =0D
> The doc syntax looks messy, so I have to fix it up:=0D
> =0D
> ---- >8 ----=0D
> diff --git a/Documentation/dev-tools/panic_serial_helper.rst b/Documentat=
ion/dev-tools/panic_serial_helper.rst=0D
> index fc5b6e9103bc2d..1ed841d03ab1c2 100644=0D
> --- a/Documentation/dev-tools/panic_serial_helper.rst=0D
> +++ b/Documentation/dev-tools/panic_serial_helper.rst=0D
> @@ -28,7 +28,7 @@ There are many debugging methods to know what was going=
 on before panic.=0D
>   =0D
>   Kdump, for example. If Kdump is enabled, you can get a core image after=
=0D
>   panic. Then use GDB or Crash to debug that core image to know what happ=
ened=0D
> -before panic (see ``Documentation/admin-guide/kdump/kdump.rst`` for more=
=0D
> +before panic (see Documentation/admin-guide/kdump/kdump.rst for more=0D
>   information about Kdump).=0D
>   =0D
>   Another way is to connect the UART side of a USB-to-UART tool to the=0D
> @@ -51,8 +51,7 @@ Prerequisites=0D
>   --------------=0D
>   =0D
>   1. Same as kgdboc, the UART driver must implement two callbacks in the=
=0D
> -struct uart_ops. See ``Documentation/dev-tools/kgdb.rst`` section=0D
> -``kgdboc and uart_ops``=0D
> +   struct uart_ops. See Documentation/dev-tools/kgdb.rst for details.=0D
>   =0D
>   2. Your PC has an UART port and it's working.=0D
>   =0D
> @@ -66,20 +65,20 @@ and select :menuselection:`debug through UART after p=
anic`.=0D
>   =0D
>   Second, build and update the kernel image. Then wait for panic.=0D
>   =0D
> -After panic, you need to do the following,=0D
> +After panic, you need to do the following:=0D
> +=0D
>   1. connect the UART side of an USB-to-UART tool to any UART=0D
> -port on your device (PC, server, Laptop, etc...).=0D
> -Connect the USB side of that tool to another PC. Open=0D
> -minicom (or other app) on that PC, and set "/dev/ttyUSB0"(or=0D
> -"/dev/ttyUSB1 if there is already another USB-to-UART tool=0D
> -connected to your device) with "115200 8N1".=0D
> +   port on your device (PC, server, Laptop, etc...).=0D
> +   Connect the USB side of that tool to another PC. Open=0D
> +   minicom (or other app) on that PC, and set "/dev/ttyUSB0"(or=0D
> +   "/dev/ttyUSB1 if there is already another USB-to-UART tool=0D
> +   connected to your device) with "115200 8N1".=0D
>   =0D
> -It automatically selects the port where you first press the=0D
> -"Enter" key (some keyboard labeled this with "Return").=0D
> +   It automatically selects the port where you first press the=0D
> +   "Enter" key (some keyboard labeled this with "Return").=0D
>   =0D
> -2. press "Enter" (or "Return") in that=0D
> -minicom window; you'll get a help menu:=0D
> -help:::=0D
> +2. press "Enter" (or "Return") in that minicom window; you'll get a help=
 menu=0D
> +   like::=0D
>   =0D
>       -a      show all kernel msg=0D
>   =0D
> @@ -94,7 +93,7 @@ help:::=0D
>   see ``Help menu options`` for details.=0D
>   =0D
>   3. finally, type 'a', '3', '4', 'q' or "filter-xxx" then press=0D
> -"Enter" to get what you want.=0D
> +   "Enter" to get what you want.=0D
>   =0D
>   Help menu options=0D
>   -----------------=0D
> @@ -122,27 +121,27 @@ Available options:=0D
>      ``filter-CPU`` or ``filter-cpu``.=0D
>      Here is an output example for filtering ``CPU``::=0D
>   =0D
> -   <6>[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x701f6=
633=0D
> -   <6>[    0.000000] Detected PIPT I-cache on CPU0=0D
> -   <6>[    0.000000] CPU features: detected: Kernel page table isolation=
 (K=0D
> +     <6>[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x701=
f6633=0D
> +     <6>[    0.000000] Detected PIPT I-cache on CPU0=0D
> +     <6>[    0.000000] CPU features: detected: Kernel page table isolati=
on (K=0D
>   =0D
> -   ...=0D
> +     ...=0D
>   =0D
> -   <6>[    0.000000] GICv3: CPU0: using allocated LPI pending table @0x0=
000=0D
> -   <6>[    0.002411] smp: Bringing up secondary CPUs ...=0D
> -   <6>[    0.039105] Detected PIPT I-cache on CPU1=0D
> +     <6>[    0.000000] GICv3: CPU0: using allocated LPI pending table @0=
x0000=0D
> +     <6>[    0.002411] smp: Bringing up secondary CPUs ...=0D
> +     <6>[    0.039105] Detected PIPT I-cache on CPU1=0D
>   =0D
> -   ...=0D
> +     ...=0D
>   =0D
> -   <4>[    6.432129] CPU: 3 PID: 392 Comm: (crub_all) Tainted: G        =
W=0D
> -   <4>[    6.560279] CPU: 2 PID: 478 Comm: (ostnamed) Tainted: G        =
W=0D
> +     <4>[    6.432129] CPU: 3 PID: 392 Comm: (crub_all) Tainted: G      =
  W=0D
> +     <4>[    6.560279] CPU: 2 PID: 478 Comm: (ostnamed) Tainted: G      =
  W=0D
>   =0D
> -   ...=0D
> +     ...=0D
>   =0D
> -   <4>[  225.297828] CPU: 4 PID: 0 Comm: swapper/4 Tainted: G        W=0D
> -   <2>[  225.297909] SMP: stopping secondary CPUs=0D
> -   <0>[  225.297919] CPU features: 0x000000,02000800,0400421b=0D
> +     <4>[  225.297828] CPU: 4 PID: 0 Comm: swapper/4 Tainted: G        W=
=0D
> +     <2>[  225.297909] SMP: stopping secondary CPUs=0D
> +     <0>[  225.297919] CPU features: 0x000000,02000800,0400421b=0D
>   =0D
>    - q=0D
>   =0D
> -  Return to help menu.=0D
> +   Return to help menu.=0D
> =0D
> Then apply my wording improves on top of above diff.=0D
> =0D
>> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig=0D
>> index 3e3fb377d90d..86a2c1884b04 100644=0D
>> --- a/drivers/tty/serial/Kconfig=0D
>> +++ b/drivers/tty/serial/Kconfig=0D
>> @@ -198,6 +198,31 @@ config SERIAL_KGDB_NMI=0D
>>   =0D
>>   	  If unsure, say N.=0D
>>   =0D
>> +config PANIC_SERIAL_HELPER=0D
>> +	tristate "debug through UART after panic"=0D
>> +	depends on PANIC_TIMEOUT=3D0=0D
>> +	select CONSOLE_POLL=0D
>> +	help=0D
>> +	  This is a debug module that allows you to get all kernel logs=0D
>> +	  after panic.=0D
>> +=0D
>> +	  Normally you need to attach a USB-to-UART tool or enable kdump=0D
>> +	  before panic happens to get log from kernel after panic. If you=0D
>> +	  didn't do that and kdump is not working, you can't get any log to=0D
>> +	  know what happened before panic. If you have a USB-to-UART tool=0D
>> +	  and the UART port on your computer is working, this module helps=0D
>> +	  you to get all kernel log after panic() is called.=0D
>> +=0D
>> +	  This module uses serial port in poll mode, so it's more stable=0D
>> +	  than other debugging methods.=0D
>> +=0D
>> +	  Read <file:Documentation/dev-tools/panic_serial_helper.rst> for=0D
>> +	  usage.=0D
>> +=0D
>> +	  Say Y if you have an UART port that is working. If unsure, say N.=0D
>> +	  Say M if you want add this as a module driver.=0D
> "Say Y if you have a working UART port and you want to gather kernel=0D
> logs. To compile this as module (which will be called panic_serial_helper=
),=0D
> say M. If unsure, say N."=0D
> =0D
> Thanks.=0D
> =0D
=0D
Thanks.=0D

Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85907C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 05:54:39 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b4f95833c7so2448925ad.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 22:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686894879; x=1689486879;
        h=content-transfer-encoding:fcc:content-language:user-agent
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIMo/fLw73fsOD8BQxcb2psKOzd8OUTA6Kfipb8yO6c=;
        b=V2dlxnRWkLm4uYRFxWhOBfCflhKZ31bTDO0/Kt1hITo76RQ9+djHNj/7h4deYH5jt2
         jcNEexCl4aHSNGEr5aiaw3bqQG9mdpBzotTaZcmnCP9noz9XRXKB9ruOCsBfXlZ7bJHG
         GfsnBo341l7/K4SNGzdHal0WTTv25UmcG2VwYb9uAP341BXWW5QN2OrEHEAAFp10fA6c
         oyba7tEGO6WftNmF6TVrfpbpNYwLgloacurCePh81IcDlWvEixKeVmtY2/igf9EpMDkW
         fsu6sdmnFLVURvna1lCXIyIocVNj+i6tW+S5zWJyh2TyP5PWyE1WkS2VLm3rIOhlYPkb
         xqBQ==
X-Gm-Message-State: AC+VfDz39satUiqYXGTpAM+1Md/Zd6Lxc4RajI04MwZ7dJIwAq7gKYpf
	/dV9FxnJ1XNMyuofFC/vjgY=
X-Google-Smtp-Source: ACHHUZ5c92bjTx35/rMUS2/H4Ga8GvbUYTxaqDUTRbBlLAk5hWTtBjqswtmI9AjOOeVxbEwzgAiugw==
X-Received: by 2002:a17:902:ec8d:b0:1b3:8aea:cac8 with SMTP id x13-20020a170902ec8d00b001b38aeacac8mr868750plg.49.1686894878786;
        Thu, 15 Jun 2023 22:54:38 -0700 (PDT)
Received: from localhost ([2408:8453:744:15bc:516a:db79:5a16:2946])
        by smtp.gmail.com with ESMTPSA id jo23-20020a170903055700b001993a1fce7bsm14908514plb.196.2023.06.15.22.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 22:54:38 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: linux@armlinux.org.uk,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	corbet@lwn.net
Cc: rdunlap@infradead.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xy521521@gmail.com,
	oe-kbuild-all@lists.linux.dev,
	lkp@intel.com,
	bagasdotme@gmail.com,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: Re: [RESEND PATCH v4 -next] tty: serial: add panic serial helper
Date: Fri, 16 Jun 2023 13:54:33 +0800
Message-Id: <cb984493-5353-db4b-a46b-37e6cb6e0ee9@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2023061502-submerge-preachy-4413@gregkh>
References: <20230614025512.27746-1-xiehongyu1@kylinos.cn> <2023061502-submerge-preachy-4413@gregkh>
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

=E5=9C=A8 2023/6/15 18:17, Greg KH =E5=86=99=E9=81=93:=0D
> On Wed, Jun 14, 2023 at 10:55:12AM +0800, Hongyu Xie wrote:=0D
>> It was inspired by kgdboc.=0D
>>=0D
>> This is a debug module that allows you to get all kernel logs=0D
>> after panic.=0D
>>=0D
>> Normally you need to attach a USB-to-UART tool or enable kdump=0D
>> before panic happens to get log from kernel after panic. If you=0D
>> didn't do that and kdump is not working, you can't get any log to=0D
>> know what happened before panic. If you have a USB-to-UART tool=0D
>> and the UART port on your computer is working. This module helps=0D
>> you to get all kernel log after panic() is called.=0D
>>=0D
>> To use this, see Documentation/dev-tools/panic_serial_helper.rst.=0D
>>=0D
>> Tested on an arm64 device.=0D
>>=0D
>> Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>=0D
>> ---=0D
> =0D
> Why  is this a RESEND?  What's wrong with the previous version?=0D
> =0D
> =0D
> =0D
>>=0D
>> v4: fix some syntax problems in Documentation.=0D
>>=0D
>> v3: fix problems in Documentation reported by=0D
>> kernel test robot <lkp@intel.com>.=0D
>>=0D
>> v2: replace uart with UART for consistency.=0D
>>=0D
>>   Documentation/dev-tools/index.rst             |   1 +=0D
>>   .../dev-tools/panic_serial_helper.rst         | 138 ++++=0D
>>   MAINTAINERS                                   |   5 +=0D
>>   drivers/tty/serial/Kconfig                    |  25 +=0D
>>   drivers/tty/serial/Makefile                   |   1 +=0D
>>   drivers/tty/serial/panic_serial_helper.c      | 619 ++++++++++++++++++=
=0D
>>   include/linux/panic.h                         |   1 +=0D
>>   kernel/panic.c                                |  12 +=0D
>>   8 files changed, 802 insertions(+)=0D
>>   create mode 100644 Documentation/dev-tools/panic_serial_helper.rst=0D
>>   create mode 100644 drivers/tty/serial/panic_serial_helper.c=0D
>>=0D
>> diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools=
/index.rst=0D
>> index 6b0663075dc0..0655528e5a83 100644=0D
>> --- a/Documentation/dev-tools/index.rst=0D
>> +++ b/Documentation/dev-tools/index.rst=0D
>> @@ -34,6 +34,7 @@ Documentation/dev-tools/testing-overview.rst=0D
>>      kselftest=0D
>>      kunit/index=0D
>>      ktap=0D
>> +   panic_serial_helper=0D
>>   =0D
>>   =0D
>>   .. only::  subproject and html=0D
>> diff --git a/Documentation/dev-tools/panic_serial_helper.rst b/Documenta=
tion/dev-tools/panic_serial_helper.rst=0D
>> new file mode 100644=0D
>> index 000000000000..d3c177f56bc4=0D
>> --- /dev/null=0D
>> +++ b/Documentation/dev-tools/panic_serial_helper.rst=0D
>> @@ -0,0 +1,138 @@=0D
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
>> +Why do you need it?=0D
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
>> +=0D
>> +There are many debugging methods to know what was going on before panic=
.=0D
>> +=0D
>> +The firs is Kdump. When it is enabled, you can get a core image after=0D
>> +panic. Then use GDB or Crash to debug that core image to know what happ=
ened=0D
>> +before panic (see ``Documentation/admin-guide/kdump/kdump.rst`` for Kdu=
mp=0D
>> +documentation).=0D
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
>> +What if Kdump hasn't been enabled? And people don't always connect an=0D
>> +USB-to-UART device while he/she is using the PC. When panic occurs, it'=
s=0D
>> +too late to connect the USB-to-UART device.=0D
>> +=0D
>> +For both situations, you can use panic_serial_helper module to get all=
=0D
>> +necessary kernel logs once it is loaded.=0D
>> +=0D
>> +How to use it?=0D
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
>> +=0D
>> +Prerequisites=0D
>> +--------------=0D
>> +=0D
>> +1. Same as kgdboc, the UART driver must implement two callbacks in the=
=0D
>> +   struct uart_ops. See Documentation/dev-tools/kgdb.rst for details.=0D
>> +=0D
>> +2. Your PC has an UART port and it's working.=0D
>> +=0D
>> +How=0D
>> +--------------=0D
>> +=0D
>> +First you need to enable ``CONFIG_PANIC_SERIAL_HELPER`` in your=0D
>> +config. To enable it go to=0D
>> +:menuselection:`Device Drivers-->Character devices-->Enable TTY (TTY [=
=3Dy])-->Serial drivers`=0D
>> +and select :menuselection:`debug through UART after panic`.=0D
>> +=0D
>> +Then build and deploy the kernel as usual.=0D
>> +=0D
>> +When the panic occurs, you need to do the following:=0D
>> +=0D
>> +1. connect the UART side of an USB-to-UART tool to any UART=0D
>> +   port on your device (PC, server, Laptop, etc...).=0D
>> +   Connect the USB side of that tool to another PC. Open=0D
>> +   minicom (or other app) on that PC, and set "/dev/ttyUSB0"(or=0D
>> +   "/dev/ttyUSB1 if there is already another USB-to-UART tool=0D
>> +   connected to your device) with "115200 8N1".=0D
>> +=0D
>> +   It automatically selects the port where you first press the=0D
>> +   "Enter" key (some keyboard labeled this with "Return").=0D
>> +=0D
>> +2. Press Enter and the help menu will appear::=0D
>> +=0D
>> +    help:=0D
>> +=0D
>> +        -a      show all kernel msg=0D
>> +=0D
>> +        -3      show S3 msg=0D
>> +=0D
>> +        -4      show S4 msg=0D
>> +=0D
>> +        -filter-[string]        show msg containing [string]=0D
>> +=0D
>> +        -q-     quit=0D
>> +=0D
>> +see ``Help menu options`` for details.=0D
>> +=0D
>> +3. Select one of above options and happy hacking!=0D
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
>> +   Provide case-ignored filter matching. For example, if you'd like to =
see=0D
>> +   message lines that contain ``CPU`` or ``cpu``, you can pass either=0D
>> +   ``filter-CPU`` or ``filter-cpu``. The corresponding output would be=
=0D
>> +   like::=0D
>> +=0D
>> +     <6>[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x70=
1f6633=0D
>> +     <6>[    0.000000] Detected PIPT I-cache on CPU0=0D
>> +     <6>[    0.000000] CPU features: detected: Kernel page table isolat=
ion (K=0D
>> +=0D
>> +     ...=0D
>> +=0D
>> +     <6>[    0.000000] GICv3: CPU0: using allocated LPI pending table @=
0x0000=0D
>> +     <6>[    0.002411] smp: Bringing up secondary CPUs ...=0D
>> +     <6>[    0.039105] Detected PIPT I-cache on CPU1=0D
>> +=0D
>> +     ...=0D
>> +=0D
>> +     <4>[    6.432129] CPU: 3 PID: 392 Comm: (crub_all) Tainted: G     =
   W=0D
>> +     <4>[    6.560279] CPU: 2 PID: 478 Comm: (ostnamed) Tainted: G     =
   W=0D
>> +=0D
>> +     ...=0D
>> +=0D
>> +     <4>[  225.297828] CPU: 4 PID: 0 Comm: swapper/4 Tainted: G        =
W=0D
>> +     <2>[  225.297909] SMP: stopping secondary CPUs=0D
>> +     <0>[  225.297919] CPU features: 0x000000,02000800,0400421b=0D
>> +=0D
>> + - q=0D
>> +=0D
>> +   Return to help menu.=0D
>> diff --git a/MAINTAINERS b/MAINTAINERS=0D
>> index 74aeae10a151..73fcae8c2f39 100644=0D
>> --- a/MAINTAINERS=0D
>> +++ b/MAINTAINERS=0D
>> @@ -15972,6 +15972,11 @@ L:	platform-driver-x86@vger.kernel.org=0D
>>   S:	Maintained=0D
>>   F:	drivers/platform/x86/panasonic-laptop.c=0D
>>   =0D
>> +PANIC SERIAL CONSOLE=0D
>> +M:	Hongyu Xie <xiehongyu1@kylinos.cn>=0D
>> +F:	drivers/tty/serial/panic_serial_helper.c=0D
>> +F:	drivers/tty/serial/panic_serial_helper.h=0D
>> +=0D
>>   PARALLAX PING IIO SENSOR DRIVER=0D
>>   M:	Andreas Klinger <ak@it-klinger.de>=0D
>>   L:	linux-iio@vger.kernel.org=0D
>> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig=0D
>> index 3e3fb377d90d..796441b58498 100644=0D
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
>> +	  Say Y if you have a working UART port and you want to gather=0D
>> +	  kernel logs. To compile this as module (which will be called=0D
>> +	  panic_serial_helper), say M. If unsure, say N.=0D
>> +=0D
>>   config SERIAL_MESON=0D
>>   	tristate "Meson serial port support"=0D
>>   	depends on ARCH_MESON || COMPILE_TEST=0D
>> diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile=0D
>> index 531ec3a19dae..d7f6fdc8913c 100644=0D
>> --- a/drivers/tty/serial/Makefile=0D
>> +++ b/drivers/tty/serial/Makefile=0D
>> @@ -93,3 +93,4 @@ obj-$(CONFIG_SERIAL_MCTRL_GPIO)	+=3D serial_mctrl_gpio=
.o=0D
>>   =0D
>>   obj-$(CONFIG_SERIAL_KGDB_NMI) +=3D kgdb_nmi.o=0D
>>   obj-$(CONFIG_KGDB_SERIAL_CONSOLE) +=3D kgdboc.o=0D
>> +obj-$(CONFIG_PANIC_SERIAL_HELPER) +=3D panic_serial_helper.o=0D
>> diff --git a/drivers/tty/serial/panic_serial_helper.c b/drivers/tty/seri=
al/panic_serial_helper.c=0D
>> new file mode 100644=0D
>> index 000000000000..1d3d57bc6340=0D
>> --- /dev/null=0D
>> +++ b/drivers/tty/serial/panic_serial_helper.c=0D
>> @@ -0,0 +1,619 @@=0D
>> +// SPDX-License-Identifier: GPL-2.0=0D
>> +/*=0D
>> + * panic_serial_helper.c Debug through UART when panic.=0D
>> + *=0D
>> + * Copyright (C) 2023 Xie Hongyu <xiehongyu1@kylinos.cn>=0D
>> + *=0D
>> + * Inspired by kgdboc.=0D
>> + *=0D
>> + */=0D
>> +=0D
>> +#define MODULE_NAME "panic_serial_helper"=0D
>> +#define pr_fmt(fmt) MODULE_NAME ": " fmt=0D
> =0D
> KBUILD_NAME is all you need, right?=0D
> =0D
>> +=0D
>> +#include <linux/kmsg_dump.h>=0D
>> +#include <linux/bsearch.h>=0D
>> +#include <linux/slab.h>=0D
>> +#include <linux/delay.h>=0D
>> +#include <linux/module.h>=0D
>> +#include <linux/tty_driver.h>=0D
>> +#include <linux/serial_core.h>=0D
>> +#include <linux/string.h>=0D
>> +=0D
>> +#define S3_ENTRY "PM: suspend entry"=0D
>> +#define S3_EXIT "PM: suspend exit"=0D
>> +#define S4_ENTRY "PM: hibernation entry"=0D
>> +#define S4_EXIT "PM: hibernation exit"=0D
> =0D
> Why are these needed?  Why not just use strings where they are used as=0D
> you are only using these once.=0D
> =0D
>> +=0D
>> +/* list to store msg lines */=0D
>> +static LIST_HEAD(psh_list);=0D
> =0D
> That's going to get HUGE, right?  How much memory does this module take=0D
> up?=0D
> =0D
>> +=0D
>> +/* msg line prototype */=0D
>> +struct dmesg_lines {=0D
>> +	struct list_head entry;=0D
>> +	char *buf;=0D
>> +	int size;=0D
> =0D
> size of what?=0D
> =0D
>> +};=0D
>> +=0D
>> +/* panic serial helper status*/=0D
> =0D
> Odd formatting :(=0D
> =0D
>> +enum PSHS {=0D
>> +	PSHS_INIT,=0D
>> +	PSHS_WAIT_HELP_INPUT,=0D
>> +};=0D
> =0D
> What do these mean?=0D
> =0D
>> +=0D
>> +/* panic serial helper msg type */=0D
>> +enum PSHM_TYPE {=0D
>> +	PSHM_TYPE_ALL,=0D
>> +	PSHM_TYPE_S3,=0D
>> +	PSHM_TYPE_S4,=0D
>> +	PSHM_TYPE_STRINGS,=0D
>> +	PSHM_TYPE_QUIT,=0D
> =0D
> Why do you have message types?=0D
> =0D
> But most importantly, why all of this at all?  Why not just tie into the=
=0D
> pstore infrastructure?  Wouldn't that handle the majority of this for=0D
> you?=0D
> =0D
>> +};=0D
>> +=0D
>> +/* whether UART is dumping msg */=0D
>> +static bool dumping_msg;=0D
>> +=0D
>> +/* to filter msg */=0D
>> +static char filter[256] =3D {0};=0D
>> +=0D
>> +struct psh_buf {=0D
>> +#define PSH_BUF_SIZE 256=0D
>> +	char buf[PSH_BUF_SIZE];=0D
>> +	int cur;=0D
>> +};=0D
>> +=0D
>> +static const char psh_tty_types[][32] =3D {=0D
>> +	{"ttyAMA"},=0D
>> +	{"ttyS"},=0D
>> +	{"ttyPS"},=0D
>> +	{"ttyLP"},=0D
>> +	{"ttyARC"},=0D
>> +	{"ttyAL"},=0D
>> +	{"ttyUL"},=0D
> =0D
> Sorry, but hard-coded tty port names are not going to go well.  Why did=0D
> you pick this tiny subset of valid tty names?=0D
Because these are the ones that implement poll_get_char and =0D
poll_put_char, not all tty drivers implement these two callback.=0D
So, if there is a new tty driver with these two callback, all I have to =0D
do is adding the name of the new tty driver in this array.=0D
> =0D
> =0D
>> +};=0D
>> +=0D
>> +#define TTY_OPS "115200n8n"=0D
> =0D
> Why this default?=0D
> =0D
> =0D
>> +=0D
>> +struct psh_serial_dev {=0D
>> +	struct list_head entry;=0D
>> +	struct tty_driver *drv;=0D
>> +	struct psh_buf buf;=0D
>> +	enum PSHS psh_status;=0D
>> +	enum PSHM_TYPE psh_msg_type;=0D
>> +	int line;=0D
>> +};=0D
>> +=0D
>> +struct psh_serial_dev *psh_dev;=0D
>> +=0D
>> +/* char handler prototype */=0D
>> +struct c_handler {=0D
>> +	char c;=0D
>> +	int (*handler)(struct psh_serial_dev *dev, void *d);=0D
> =0D
> Why do you need a handler when you only have one handler?=0D
> =0D
> Anyway, please look at pstore and tie into that if you really want=0D
> something like this.=0D
> =0D
> thanks,=0D
> =0D
> greg k-h=0D
thanks,=0D
=0D
Hongyu Xie=0D

Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270B519B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Nov 2022 08:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668760255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4uHzRcZmkS7rz+pwwHQCORG+34UQVE4jly/0LrPFBF0=;
	b=MHM3dm3gPBg0H0F+T3Dh6CbbOL4xEWBZOePJF4R8ugRM8Ls8eoERXyhmb3sNS19DkERRz0
	+NFFfeNk7pw9lR9eOoEGYpPRJ+wSMqGXc6LISU4GGlrRTNqer2uVh9g+zYioZaCDmw7Nd7
	0JDaSN5FUvQHTz9xpHehAz6D9RZ66WU=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-uNoKYR4QMnSngu6n0wfBFQ-1; Fri, 18 Nov 2022 03:30:53 -0500
X-MC-Unique: uNoKYR4QMnSngu6n0wfBFQ-1
Received: by mail-io1-f70.google.com with SMTP id n23-20020a056602341700b00689fc6dbfd6so2260344ioz.8
        for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Nov 2022 00:30:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uHzRcZmkS7rz+pwwHQCORG+34UQVE4jly/0LrPFBF0=;
        b=CsE2HS5PmX4c5r9Bh7usrpoYhrK3O8aUzPbr3JisCOtsUvdEw2pZYLHHocwZWA0Bhl
         mq7tE9kvAObEg2TsCdyRI94nb/0qf1re6t3QD9chvlRMkDUUAGcGbPiwXjadOSkKLcXY
         wj2B1Ug507lq98ur2tAN9AUTuCB3MnWl5Ko/q5YnuQWU7Bn7ATxherzL/CoMR8Qi72k9
         SZ8ac9nH8NKalSBkjSNljpClT6MGUyIn7ecACuy/XJDb2+qpAEI4o3m9VsAM7ZABfyI4
         6ixUY49fDe3zXgSviSTFvUpJz85tLQi36nZfc8FvojoymMfSthCR1KKH4CLKR95zSavX
         wHHQ==
X-Gm-Message-State: ANoB5pnhj653NVCexPB6cj0HvPnsL1eTEv0k9j3RYi+8Cq74aptKGOlf
	i5hFqtZbvDGdPkLyi8UHROST8tYypFnHnfWnrB4cVWtH+hY7cFdqr+PNkWFDotcBUguoD7YPr+B
	IgciDpyTRoIAxKEw/BoYbFH8aAKGKwCkQc6cYO0Mvyg==
X-Received: by 2002:a05:6602:418b:b0:6dd:813a:bfaa with SMTP id bx11-20020a056602418b00b006dd813abfaamr3086898iob.146.1668760253051;
        Fri, 18 Nov 2022 00:30:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6V390BwXLVaF5eXbX6R7bYi7FTxz7tAOA8uHE1ApHua/zRPwIy6UsHRWnPktZ5hbHj+lbhkgjMoEbsjE7XQAY=
X-Received: by 2002:a05:6602:418b:b0:6dd:813a:bfaa with SMTP id
 bx11-20020a056602418b00b006dd813abfaamr3086895iob.146.1668760252756; Fri, 18
 Nov 2022 00:30:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202211181514.fLhaiS7o-lkp@intel.com>
In-Reply-To: <202211181514.fLhaiS7o-lkp@intel.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 18 Nov 2022 09:30:41 +0100
Message-ID: <CAO-hwJLKBHQHP1ivCrbP2tFq5XKydhLZDmxX3vKH-A3-xzN6mA@mail.gmail.com>
Subject: Re: [linux-next:master 7551/8605] corsair-cpro.c:undefined reference
 to `hid_hw_close'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Jiri Kosina <jkosina@suse.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 18, 2022 at 8:47 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   147307c69ba4441ee90c1f8ce8edf5df4ea60f67
> commit: 25621bcc89762fe1329ae9c9dab75bc70ef1aee0 [7551/8605] HID: Kconfig: split HID support and hid-core compilation
> config: csky-randconfig-c003-20221118
> compiler: csky-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=25621bcc89762fe1329ae9c9dab75bc70ef1aee0
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 25621bcc89762fe1329ae9c9dab75bc70ef1aee0
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    csky-linux-ld: drivers/hwmon/corsair-cpro.o: in function `ccp_remove':
> >> corsair-cpro.c:(.text+0x84): undefined reference to `hid_hw_close'
> >> csky-linux-ld: corsair-cpro.c:(.text+0x8a): undefined reference to `hid_hw_stop'
>    csky-linux-ld: drivers/hwmon/corsair-cpro.o: in function `ccp_is_visible':
>    corsair-cpro.c:(.text+0x17c): undefined reference to `hid_hw_close'
>    csky-linux-ld: corsair-cpro.c:(.text+0x180): undefined reference to `hid_hw_stop'
>    csky-linux-ld: drivers/hwmon/corsair-cpro.o: in function `send_usb_cmd':
> >> corsair-cpro.c:(.text+0x1b8): undefined reference to `hid_hw_output_report'
>    csky-linux-ld: drivers/hwmon/corsair-cpro.o: in function `ccp_write':
>    corsair-cpro.c:(.text+0x2bc): undefined reference to `hid_hw_output_report'
>    csky-linux-ld: drivers/hwmon/corsair-cpro.o: in function `ccp_probe':
> >> corsair-cpro.c:(.text+0x382): undefined reference to `hid_open_report'
> >> csky-linux-ld: corsair-cpro.c:(.text+0x39e): undefined reference to `hid_hw_start'
> >> csky-linux-ld: corsair-cpro.c:(.text+0x3aa): undefined reference to `hid_hw_open'
>    csky-linux-ld: corsair-cpro.c:(.text+0x3b6): undefined reference to `hid_hw_stop'
> >> csky-linux-ld: corsair-cpro.c:(.text+0x4c4): undefined reference to `hid_open_report'
>    csky-linux-ld: corsair-cpro.c:(.text+0x4c8): undefined reference to `hid_hw_start'
>    csky-linux-ld: corsair-cpro.c:(.text+0x4cc): undefined reference to `hid_hw_open'
>    csky-linux-ld: corsair-cpro.c:(.text+0x4d0): undefined reference to `hid_hw_stop'
> >> csky-linux-ld: corsair-cpro.c:(.text+0x51c): undefined reference to `hid_hw_close'
>    csky-linux-ld: drivers/hwmon/corsair-cpro.o: in function `ccp_read':
>    corsair-cpro.c:(.text+0x60c): undefined reference to `hid_hw_close'
>    csky-linux-ld: drivers/hwmon/corsair-cpro.o: in function `ccp_init':
> >> corsair-cpro.c:(.init.text+0x8): undefined reference to `__hid_register_driver'
> >> csky-linux-ld: corsair-cpro.c:(.init.text+0x1c): undefined reference to `__hid_register_driver'
>    csky-linux-ld: drivers/hwmon/corsair-psu.o: in function `corsairpsu_remove':
> >> corsair-psu.c:(.text+0x1e8): undefined reference to `hid_hw_close'
> >> csky-linux-ld: corsair-psu.c:(.text+0x1ee): undefined reference to `hid_hw_stop'
>    csky-linux-ld: drivers/hwmon/corsair-psu.o: in function `corsairpsu_usb_cmd':
> >> corsair-psu.c:(.text+0x228): undefined reference to `hid_hw_output_report'
>    csky-linux-ld: drivers/hwmon/corsair-psu.o: in function `corsairpsu_get_value':
>    corsair-psu.c:(.text+0x2fc): undefined reference to `hid_hw_close'
>    csky-linux-ld: corsair-psu.c:(.text+0x300): undefined reference to `hid_hw_stop'
> >> csky-linux-ld: corsair-psu.c:(.text+0x308): undefined reference to `hid_hw_output_report'
>    csky-linux-ld: drivers/hwmon/corsair-psu.o: in function `corsairpsu_probe':
> >> corsair-psu.c:(.text+0x5f2): undefined reference to `hid_open_report'
> >> csky-linux-ld: corsair-psu.c:(.text+0x60e): undefined reference to `hid_hw_start'
> >> csky-linux-ld: corsair-psu.c:(.text+0x61a): undefined reference to `hid_hw_open'
>    csky-linux-ld: corsair-psu.c:(.text+0x626): undefined reference to `hid_hw_stop'
> >> csky-linux-ld: corsair-psu.c:(.text+0x7c0): undefined reference to `hid_hw_close'
> >> csky-linux-ld: corsair-psu.c:(.text+0x7cc): undefined reference to `hid_open_report'
>    csky-linux-ld: corsair-psu.c:(.text+0x7d0): undefined reference to `hid_hw_start'
>    csky-linux-ld: corsair-psu.c:(.text+0x7d4): undefined reference to `hid_hw_open'
>    csky-linux-ld: corsair-psu.c:(.text+0x7d8): undefined reference to `hid_hw_stop'
>    csky-linux-ld: corsair-psu.c:(.text+0x808): undefined reference to `hid_hw_close'
>    csky-linux-ld: drivers/hwmon/corsair-psu.o: in function `corsairpsu_driver_init':
> >> corsair-psu.c:(.init.text+0x8): undefined reference to `__hid_register_driver'
>    csky-linux-ld: corsair-psu.c:(.init.text+0x1c): undefined reference to `__hid_register_driver'
>    csky-linux-ld: drivers/staging/greybus/hid.o: in function `gb_hid_disconnect':
>    hid.c:(.text+0x6): undefined reference to `hid_destroy_device'
>    csky-linux-ld: drivers/staging/greybus/hid.o: in function `gb_hid_stop':
>    hid.c:(.text+0x38): undefined reference to `hid_destroy_device'
>    csky-linux-ld: drivers/staging/greybus/hid.o: in function `gb_hid_request_handler':
>    hid.c:(.text+0x84): undefined reference to `hid_input_report'
>    csky-linux-ld: hid.c:(.text+0x98): undefined reference to `hid_input_report'
>    csky-linux-ld: drivers/staging/greybus/hid.o: in function `gb_hid_parse':
>    hid.c:(.text+0xf6): undefined reference to `hid_parse_report'
>    csky-linux-ld: drivers/staging/greybus/hid.o: in function `gb_hid_init_report':
>    hid.c:(.text+0x1a8): undefined reference to `hid_report_raw_event'
>    csky-linux-ld: hid.c:(.text+0x1c0): undefined reference to `hid_parse_report'
>    csky-linux-ld: hid.c:(.text+0x1c8): undefined reference to `hid_debug'
>    csky-linux-ld: hid.c:(.text+0x1e4): undefined reference to `hid_report_raw_event'
>    csky-linux-ld: drivers/staging/greybus/hid.o: in function `gb_hid_probe':
>    hid.c:(.text+0x32c): undefined reference to `hid_allocate_device'
>    csky-linux-ld: hid.c:(.text+0x34a): undefined reference to `hid_destroy_device'
>    csky-linux-ld: hid.c:(.text+0x3ea): undefined reference to `hid_add_device'
>    csky-linux-ld: hid.c:(.text+0x41a): undefined reference to `hid_add_device'
>    csky-linux-ld: drivers/staging/greybus/hid.o: in function `gb_hid_open':
>    hid.c:(.text+0x490): undefined reference to `hid_allocate_device'
>    csky-linux-ld: hid.c:(.text+0x498): undefined reference to `hid_destroy_device'
>    csky-linux-ld: hid.c:(.text+0x4b4): undefined reference to `hid_add_device'
>    csky-linux-ld: net/bluetooth/hidp/core.o: in function `hidp_parse':
>    core.c:(.text+0x32): undefined reference to `hid_parse_report'
>    csky-linux-ld: net/bluetooth/hidp/core.o: in function `hidp_set_timer':
>    core.c:(.text+0x9c): undefined reference to `hid_parse_report'
>    csky-linux-ld: net/bluetooth/hidp/core.o: in function `hidp_session_new':
>    core.c:(.text+0x490): undefined reference to `hid_allocate_device'
>    csky-linux-ld: core.c:(.text+0x504): undefined reference to `hid_ignore'
>    csky-linux-ld: core.c:(.text+0x510): undefined reference to `hid_destroy_device'
>    csky-linux-ld: core.c:(.text+0x560): undefined reference to `hid_allocate_device'
>    csky-linux-ld: core.c:(.text+0x574): undefined reference to `hid_ignore'
>    csky-linux-ld: core.c:(.text+0x578): undefined reference to `hid_destroy_device'
>    csky-linux-ld: net/bluetooth/hidp/core.o: in function `hidp_session_dev_add':
>    core.c:(.text+0xea4): undefined reference to `hid_add_device'
>    csky-linux-ld: net/bluetooth/hidp/core.o: in function `hidp_start':
>    core.c:(.text+0xef4): undefined reference to `hid_add_device'
>    csky-linux-ld: net/bluetooth/hidp/core.o: in function `hidp_session_probe':
>    core.c:(.text+0x123e): undefined reference to `hid_destroy_device'
>    csky-linux-ld: core.c:(.text+0x1290): undefined reference to `hid_destroy_device'
>    csky-linux-ld: net/bluetooth/hidp/core.o: in function `hidp_process_data':
>    core.c:(.text+0x1394): undefined reference to `hid_input_report'
>    csky-linux-ld: net/bluetooth/hidp/core.o: in function `hidp_idle_timeout':
>    core.c:(.text+0x1478): undefined reference to `hid_input_report'
>    csky-linux-ld: net/bluetooth/hidp/core.o: in function `hidp_session_remove':
>    core.c:(.text+0x14da): undefined reference to `hid_destroy_device'
>    csky-linux-ld: net/bluetooth/hidp/core.o: in function `hidp_session_dev_work':
>    core.c:(.text+0x15c8): undefined reference to `hid_destroy_device'
>    csky-linux-ld: net/bluetooth/hidp/core.o: in function `hidp_session_run':
>    core.c:(.text+0x1852): undefined reference to `hid_input_report'
>    csky-linux-ld: core.c:(.text+0x1928): undefined reference to `hid_input_report'
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for HID
>    Depends on [n]: HID_SUPPORT [=n]
>    Selected by [y]:
>    - BT_HIDP [=y] && NET [=y] && BT_BREDR [=y] && INPUT [=y]

The problem comes from this warning. Basically, HID should not be
selected if HID_SUPPORT is not, which is what BT_HIDP allows in
linux-next ATM. Fix on its way.

Cheers,
Benjamin

>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp


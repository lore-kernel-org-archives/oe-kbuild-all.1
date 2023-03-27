Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55583233
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679926490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJ/po6BBKEsAugQfsikQ6JqotaK4SMzuVc4bsMgZRSI=;
	b=E/zEBknZNZ3cgl/4tqshMFUt5cHi3I5+drwD2/JtrQpNP/F69K94EnUauhCb67Fm1nLoj+
	q6IKbKB/28kCSSaIyir8MhsPtUjph8kjkHjHGqX+tSL7nMjLkIXC8LUz8GoQ8cWuI+Zybq
	gjRX1ow9ZWjyfxYpWAW4EOcQyJp32k4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-XHiSRdZCO8ChkqPGflnhdQ-1; Mon, 27 Mar 2023 10:14:49 -0400
X-MC-Unique: XHiSRdZCO8ChkqPGflnhdQ-1
Received: by mail-ed1-f70.google.com with SMTP id m18-20020a50d7d2000000b00501dfd867a4so12955426edj.20
        for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 07:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679926488;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJ/po6BBKEsAugQfsikQ6JqotaK4SMzuVc4bsMgZRSI=;
        b=KSnpBr6D91zcjKuQ6jAhXptitmlmE5i0oCRVMklqMQYsBpkgnxPr8P8V9Ik/HlIhjd
         xPCfVvx7++HFJebXXer+VRQ9hd8yelqAyH1fei7xKl1q85uc9Kdx4G75YlnwXnGCUKuD
         LmTdyyomHqhARe6VWmht1V9QIDmOvzs6dSu+3jnEuFDiTLe2obTJrt51XuZ/20OkuF3d
         L/830qCOP+lANYYKF25c9Jnd//BKcjIFs7AS6XJTE4+BRTyxbJiE/kcRTZc8e3mhd9b7
         X29ixLG8PWvRWsT18bmBRMsVvIgtNOOeTfXz0lAbbHpZ+Ixw7sMuql45e5o9Sca9dpT4
         QjWw==
X-Gm-Message-State: AAQBX9dNwlQCGA+V9pJzF9RQreRhqcvcYveBe7iZIGL4htPFmmje3Xl5
	lR7GDKVW4ziAfNr7A0ynaSr0CZDf/TwS7HLt13ddRkwSHGUASHS6necaW+GUSFEPzQrTgrxSiLD
	W8VxySVxNtO1IPUGjQCMfS0BnkA==
X-Received: by 2002:aa7:d052:0:b0:4fb:999:e052 with SMTP id n18-20020aa7d052000000b004fb0999e052mr11325537edo.33.1679926487778;
        Mon, 27 Mar 2023 07:14:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350bpcS/zPeeKJdjTpJqH7xy08iKy2xaY+3MEXqSKm/Krikx+I8OL/HY+WvxSL8iDqop6uRB9cg==
X-Received: by 2002:aa7:d052:0:b0:4fb:999:e052 with SMTP id n18-20020aa7d052000000b004fb0999e052mr11325526edo.33.1679926487534;
        Mon, 27 Mar 2023 07:14:47 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id q5-20020a50cc85000000b005024aff3bb5sm210133edi.80.2023.03.27.07.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 07:14:47 -0700 (PDT)
Message-ID: <3df20b19-c231-3dfd-6be0-9b32df2c63f8@redhat.com>
Date: Mon, 27 Mar 2023 16:14:46 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [pdx86-platform-drivers-x86:review-hans 82/82]
 drivers/platform/x86/msi-ec.c:825:35: warning: 'msi_dmi_table' defined but
 not used
To: kernel test robot <lkp@intel.com>, Nikita Kravets <teackot@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <202303272159.NYvmInyO-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202303272159.NYvmInyO-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/27/23 15:35, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
> head:   9a62a9be30c2caab402c66105171cd96bbfd077d
> commit: 9a62a9be30c2caab402c66105171cd96bbfd077d [82/82] platform/x86: Add new msi-ec driver
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230327/202303272159.NYvmInyO-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?id=9a62a9be30c2caab402c66105171cd96bbfd077d
>         git remote add pdx86-platform-drivers-x86 https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
>         git fetch --no-tags pdx86-platform-drivers-x86 review-hans
>         git checkout 9a62a9be30c2caab402c66105171cd96bbfd077d
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303272159.NYvmInyO-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/platform/x86/msi-ec.c:825:35: warning: 'msi_dmi_table' defined but not used [-Wunused-const-variable=]
>      825 | static const struct dmi_system_id msi_dmi_table[] __initconst = {
>          |                                   ^~~~~~~~~~~~~
> 
> 
> vim +/msi_dmi_table +825 drivers/platform/x86/msi-ec.c

Ah yes, since this is only used for module-autoloading and not used otherwise
in the driver, it is unused when the driver gets builtin, so it should be marked
__maybe_unused.

Nikita, while fixing this I also noticed that you match on e.g. both
"MICRO-STAR INT" and "MICRO-STAR INTERNATIONAL CO., LTD" but
DMI_MATCH does substring matching so since "MICRO-STAR INT" is
a substring of "MICRO-STAR INTERNATIONAL CO., LTD" there is no
need to check for the latter since "MICRO-STAR INT" will
already match this.

So to fix both issues I have squashed the following fix into
the original commit:

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index e6f09f259fd1..ff93986e3d35 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -822,7 +822,7 @@ static struct acpi_battery_hook battery_hook = {
  * Module load/unload
  */
 
-static const struct dmi_system_id msi_dmi_table[] __initconst = {
+static const struct dmi_system_id msi_dmi_table[] __initconst __maybe_unused = {
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "MICRO-STAR INT"),
@@ -833,18 +833,6 @@ static const struct dmi_system_id msi_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International"),
 		},
 	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR,
-				  "Micro-Star International Co., Ltd."),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR,
-				  "MICRO-STAR INTERNATIONAL CO., LTD"),
-		},
-	},
 	{}
 };
 MODULE_DEVICE_TABLE(dmi, msi_dmi_table);

Regards,

Hans




> 
>    820	
>    821	/*
>    822	 * Module load/unload
>    823	 */
>    824	
>  > 825	static const struct dmi_system_id msi_dmi_table[] __initconst = {
>    826		{
>    827			.matches = {
>    828				DMI_MATCH(DMI_SYS_VENDOR, "MICRO-STAR INT"),
>    829			},
>    830		},
>    831		{
>    832			.matches = {
>    833				DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International"),
>    834			},
>    835		},
>    836		{
>    837			.matches = {
>    838				DMI_MATCH(DMI_SYS_VENDOR,
>    839					  "Micro-Star International Co., Ltd."),
>    840			},
>    841		},
>    842		{
>    843			.matches = {
>    844				DMI_MATCH(DMI_SYS_VENDOR,
>    845					  "MICRO-STAR INTERNATIONAL CO., LTD"),
>    846			},
>    847		},
>    848		{}
>    849	};
>    850	MODULE_DEVICE_TABLE(dmi, msi_dmi_table);
>    851	
> 


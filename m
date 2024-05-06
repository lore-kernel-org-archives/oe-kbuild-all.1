Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2EB1422A2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 10:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714990695; cv=none; b=DzJgrgd1zT4Gx+7C6WUI8KYWs8fthgffNnn7jCxzqYd2Ji20xhdbvoeKxA+3uTrbpRxVWL4Fhqzs3O1NpjayKMnDW9/2G5LlRwAlo82/WllME5pcHtulvfIyO7/7XQSnYglLK9txqgQnhYRA/IXzd8qIjqaUFJq0IA4NfNtYL5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714990695; c=relaxed/simple;
	bh=aW8K4LlF8r1t0fqsYZXyZZaeJhZfLCbRlWDBMVNk598=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3nkXNDamBd/cE3i0hmHadNpBwoVRosxImF6RxGjDtyRMeQ9MaA1ru+GHAqPmWaNhRIzaKljsJXPkJ12efXoUQwKZdheSwoIfkZq9GqJyB0rnuKfWeUjYHR7D+YK3/Gq1hJ43A4PyXdxUdZjBlCP51Y54ObBF3q7JA7JxWNucWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bYJEqUri; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bYJEqUri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714990692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdxmZuI5jTokyLLfusHKdtKb4By7NqPY0RrHHYpB960=;
	b=bYJEqUriOJvQbTBVNHu5ex+JUpbpfXGsKqkZ5alpAMfHnnS7kYSuJ2fZxRqDsYsQyV6vWK
	f0UEgqe1te8lJagzNeZ8ajgmwqY4yYdaKITDHzkjn6DPach/KHGLLRyJfjkzIqTzD1SVct
	ol8+5lirqQDYdnhjDENFRahM3ZKqs/o=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-OWYUuTzJNAGSpGUlDmMOfA-1; Mon, 06 May 2024 06:18:11 -0400
X-MC-Unique: OWYUuTzJNAGSpGUlDmMOfA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a59caea8836so57566666b.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 May 2024 03:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990690; x=1715595490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdxmZuI5jTokyLLfusHKdtKb4By7NqPY0RrHHYpB960=;
        b=EJNPUA1H8x9uwTjVYBLfOv7wjJRJetO3lG1HBRtyKH+H7icH2KLbinUyGUvAA/kfib
         XCglTOkjdU4WTFcQcQD2Bzf3qIHfGI8EpMStRCyLS6SgdeWpSaWzzdeZYJyQqwdkT1lx
         9b85tzpk0FoV3d1VSXysxHuo4AOJjELrdvV85w65uZBilKq5wETgaTkGjaedB9llVDx0
         o+/bdeKbTMeR3s26oNfsVAIQY4kEc8NSUtJVSF9HMIEU4fv78FmRNApr2bWiM8vd1bYn
         Ga7Xu51EPvEfj1zaR+LnZ/rNeJSa2pa0pl6nSuxHDzdV1+xYKdLkEFJ5KRoGH0K2w68r
         JkYg==
X-Forwarded-Encrypted: i=1; AJvYcCVizs1BNFGAjkz4qB1W0sGpJtDXbJ9+7w3fgGR0lyN4G0lZPVAYwLiJi5bCP5GQYIfLCQSOcUshAPl/UOVVVwDG1dy3ziyAonsbnsYnnw==
X-Gm-Message-State: AOJu0YxG8IkwQUYrbjSQQ4vBSHu+qd75alPSeeJtz+bLpGJBrALZ9JVA
	yDk/TU/jgW/ubHWJifF+3mufw9JhR0gxnfijBoE6mKyq5Urq4rm5jKyl2kBwOPBN0Q0rj60lqyX
	eTQHb74C7B5aRmk9jJ4GA5BWWHihvoTxJgsCJqHLovcYflHqngEbhF9K3Lm1/Kog=
X-Received: by 2002:a17:906:7f05:b0:a59:cdc9:6fdf with SMTP id d5-20020a1709067f0500b00a59cdc96fdfmr1471838ejr.4.1714990690016;
        Mon, 06 May 2024 03:18:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6Rmg46pqkEubaB8A+NPfk6o3LAM0etZx1imlpQDm/pH8WR39XAlpHmox9waYYu8s7aR0XBw==
X-Received: by 2002:a17:906:7f05:b0:a59:cdc9:6fdf with SMTP id d5-20020a1709067f0500b00a59cdc96fdfmr1471814ejr.4.1714990689552;
        Mon, 06 May 2024 03:18:09 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id uz14-20020a170907118e00b00a599adfd49dsm3711634ejb.64.2024.05.06.03.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 03:18:09 -0700 (PDT)
Message-ID: <4bb43e89-c387-4219-9051-421d700f332e@redhat.com>
Date: Mon, 6 May 2024 12:18:05 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] platform/x86: dell-laptop: Implement platform_profile
To: Lyndon Sanche <lsanche@lyndeno.ca>, kernel test robot <lkp@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, mario.limonciello@amd.com, pali@kernel.org,
 W_Armin@gmx.de, srinivas.pandruvada@linux.intel.com,
 ilpo.jarvinen@linux.intel.com, Matthew Garrett <mjg59@srcf.ucam.org>,
 Jonathan Corbet <corbet@lwn.net>, Heiner Kallweit <hkallweit1@gmail.com>,
 Vegard Nossum <vegard.nossum@oracle.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20240501215829.4991-2-lsanche@lyndeno.ca>
 <202405031851.NYy0ZB02-lkp@intel.com> <A9SXCS.IUN31UTTT9GM2@lyndeno.ca>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <A9SXCS.IUN31UTTT9GM2@lyndeno.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Lyndon,

Thank you for your patch!

On 5/4/24 3:03 AM, Lyndon Sanche wrote:
> 
> 
> On Fri, May 3 2024 at 06:19:18 PM +08:00:00, kernel test robot <lkp@intel.com> wrote:
>> Hi Lyndon,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on linus/master]
>> [also build test WARNING on v6.9-rc6 next-20240503]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Lyndon-Sanche/platform-x86-dell-laptop-Implement-platform_profile/20240502-060146
>> base:   linus/master
>> patch link:    https://lore.kernel.org/r/20240501215829.4991-2-lsanche%40lyndeno.ca
>> patch subject: [PATCH v5] platform/x86: dell-laptop: Implement platform_profile
>> config: i386-kismet-CONFIG_ACPI_PLATFORM_PROFILE-CONFIG_DELL_LAPTOP-0-0 (https://download.01.org/0day-ci/archive/20240503/202405031851.NYy0ZB02-lkp@intel.com/config)
>> reproduce: (https://download.01.org/0day-ci/archive/20240503/202405031851.NYy0ZB02-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202405031851.NYy0ZB02-lkp@intel.com/
>>
>> kismet warnings: (new ones prefixed by >>)
>>>>  kismet: WARNING: unmet direct dependencies detected for ACPI_PLATFORM_PROFILE when selected by DELL_LAPTOP
>>    WARNING: unmet direct dependencies detected for ACPI_PLATFORM_PROFILE
>>      Depends on [n]: ACPI [=n]
>>      Selected by [y]:
>>      - DELL_LAPTOP [=y] && X86_PLATFORM_DEVICES [=y] && X86_PLATFORM_DRIVERS_DELL [=y] && DMI [=y] && BACKLIGHT_CLASS_DEVICE [=y] && (ACPI_VIDEO [=n] || ACPI_VIDEO [=n]=n) && (RFKILL [=n] || RFKILL [=n]=n) && (DELL_WMI [=n] || DELL_WMI [=n]=n) && SERIO_I8042 [=y] && DELL_SMBIOS [=y]
>>
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
> 
> I will try reproducing this test on my machine, to avoid spamming the mailing list with the same error over and over.

No need to reproduce this. When you select something in Kconfig you must ensure
that the item doing the selecting depends on all the dependencies of what you
are selecting.

IOW if you add this change to your next version then that should fix this:

diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index bd9f445974cc..d18fbc6a5fbf 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -47,6 +47,7 @@ config DCDBAS
 config DELL_LAPTOP
 	tristate "Dell Laptop Extras"
 	default m
+	depends on ACPI
 	depends on DMI
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on ACPI_VIDEO || ACPI_VIDEO = n

And please also address Armin's remark about making sure that failure
to initialize platform_profile support should not cause the entire driver
to fail to probe.

I see that Armin suggests to check da_supported_commands for this,
this is a good idea but atm this is private to dell-smbios-base. So
you will first need to do a small preparation patch adding a small:

bool dell_laptop_check_supported_cmds(struct calling_interface_buffer *buffer)
{
	return da_supported_commands & (1 << buffer->cmd_class);
}
EXPORT_SYMBOL_GPL(dell_laptop_check_supported_cmds):

helper for this.

If this check fails (returns false) make the code not register
the platform_profile() while allowing probe() to continue / succeed,
please do not log anything in this case (or use dev_dbg())

If this check succeeds but subsequent dell_smbios_call()'s
fail during probe, then it is ok to log an error but please
still let probe() continue / succeed (without registering
a platform_profile handler).

Regards,

Hans



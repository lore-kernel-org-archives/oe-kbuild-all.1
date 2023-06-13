Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4C5DDBC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686651968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rZcEQjdnUPfgnpDLwolPkeA4s5uTdek4kX0pKcQkY8Y=;
	b=M94Y/7lh9SAuQiNyBpReA2xcK7XM8wnpO4OfcHWM5YRyEZpCpLAYxaSoadApe90j90HKIW
	5/TQA1qmGNkjFdI6a29R6av6iy1KGLpPLWK0GUZVgq1YfleezJGjKfhbFbU4KLp5kBt38s
	z58HRwSbFnZH6FsGc/WuO5UCxw67rk8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-h15dsHIeNeunMJmaUSatXw-1; Tue, 13 Jun 2023 06:26:05 -0400
X-MC-Unique: h15dsHIeNeunMJmaUSatXw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-50bf847b267so4742618a12.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 03:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686651964; x=1689243964;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZcEQjdnUPfgnpDLwolPkeA4s5uTdek4kX0pKcQkY8Y=;
        b=h2DWrt9B4AiEpgqA+wkB6VJqtFPjoCNIPngq/oNKQMxFqT65mUo2V30LhkBZjNSCmm
         Z7+str573+cd9jeeT2EKamGQIYaqit325ykclxnKplYhB9uOZW9IlriwFY/+irxESpZS
         xIhfmhMjB+n+xAJ6KKQu7vd6jMuzGruxH2EuIgIquba+K+koV8CsgW6GKrrmSaXAB7d5
         a84tcAs7bqrJW+jI4WuFiqZ11iXA0IrnEU1xqwtO9U8PKj/ugdQdwYhPLyj92laFGWIp
         WcM2lyXc1S5rH2KQzTbZ4b56vXgj4EMp1SSH4W/FISN520FG96iTqLr/yUSoO5/AgO/L
         Vqnw==
X-Gm-Message-State: AC+VfDw8AIHkShBjsPW3KTR9r2kdqDRDprpj7C8l7wEhlxAzv/ClIkxn
	x7OLAWzAv8jky97t/F3SBy+ZC5yXxY1TB89c7ez4vrKrvT3MOGASMV7SmUiMv4X8CrYK5F03IQ+
	MwgU44TrcKsEd8wPDGagOBBTcWw==
X-Received: by 2002:aa7:d753:0:b0:516:af22:bccc with SMTP id a19-20020aa7d753000000b00516af22bcccmr6962275eds.21.1686651964348;
        Tue, 13 Jun 2023 03:26:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4tlMWLfp9k2VwaUsES5I5/qCebnVY4QmLrOb65dkTElszfGX1KeIZRlmbWTJ1Hg0MZYQv25g==
X-Received: by 2002:aa7:d753:0:b0:516:af22:bccc with SMTP id a19-20020aa7d753000000b00516af22bcccmr6962261eds.21.1686651964027;
        Tue, 13 Jun 2023 03:26:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o13-20020aa7d3cd000000b005083bc605f9sm6254625edr.72.2023.06.13.03.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 03:26:03 -0700 (PDT)
Message-ID: <89f6fe6b-c674-1ff6-dddb-06050ad5c97d@redhat.com>
Date: Tue, 13 Jun 2023 12:26:02 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix lkp-tests warnings for
 platform profiles
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 dan.carpenter@linaro.org, mario.limonciello@amd.com, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev, Dan Carpenter <error27@gmail.com>
References: <mpearson-lenovo@squebb.ca>
 <20230606151804.8819-1-mpearson-lenovo@squebb.ca>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230606151804.8819-1-mpearson-lenovo@squebb.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/6/23 17:18, Mark Pearson wrote:
> Fix issues identified in dytc_profile_refresh identified by lkp-tests.
> drivers/platform/x86/thinkpad_acpi.c:10538
> 	dytc_profile_refresh() error: uninitialized symbol 'funcmode'.
> drivers/platform/x86/thinkpad_acpi.c:10531
> 	dytc_profile_refresh() error: uninitialized symbol 'output'.
> drivers/platform/x86/thinkpad_acpi.c:10537
> 	dytc_profile_refresh() error: uninitialized symbol 'output'.
> 
> These issues should not lead to real problems in the field as the refresh
> function should only be called if MMC or PSC mode enabled. But good to fix.
> 
> Thanks to Dan Carpenter and the lkp-tests project for flagging these.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202306011202.1hbgLRD4-lkp@intel.com/
> Fixes: 1bc5d819f0b9 ("platform/x86: thinkpad_acpi: Fix profile modes on Intel platforms")
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
>  drivers/platform/x86/thinkpad_acpi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index b3808ad77278..4b89f42de723 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10524,7 +10524,7 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
>  static void dytc_profile_refresh(void)
>  {
>  	enum platform_profile_option profile;
> -	int output, err = 0;
> +	int output = 0, err = 0;
>  	int perfmode, funcmode;
>  
>  	mutex_lock(&dytc_mutex);
> @@ -10538,6 +10538,8 @@ static void dytc_profile_refresh(void)
>  		err = dytc_command(DYTC_CMD_GET, &output);
>  		/* Check if we are PSC mode, or have AMT enabled */
>  		funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
> +	} else { /* Unknown profile mode */
> +		err = -ENODEV;
>  	}
>  	mutex_unlock(&dytc_mutex);
>  	if (err)


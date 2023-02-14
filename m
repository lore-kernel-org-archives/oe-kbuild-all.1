Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741E97C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 02:16:56 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id b5so15577264plz.5
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 18:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbigrDxGll9VSVfP6VuZv/A2wMng7CjCUezyWsqQ0MY=;
        b=P7ojf9+jHPMBl8X2GLb+w6RrmrJrO3TCcMwHpeoYA4bGKP4CGM2j/o/Vz01LgLdpM2
         P+kY8LAWgT9+gu4cNx2JbhDVYPJBCCF5AaS88JXQ0zsQL/ly+HaSXG6X+MLJ72lDYwpy
         kQNMvrS4/URdeGTCM1reA2BgIDXI8b8q9TzWedweQghB+AONe2z5ebH2edO2+V64VytB
         VzRcv7t2Em1x1fKIrs7fsdYWeGZmsDdDV1qaqktszRMiEF19+UQZci4dUeyy1z0lWi5F
         aCDYF9A/Zq1A81h/bEQfERBJTB3u3AyoGCjyl2cCX04QcnI4LuRrQZNg5wAIPvMFK6um
         ErZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbigrDxGll9VSVfP6VuZv/A2wMng7CjCUezyWsqQ0MY=;
        b=EJyUV9n6LbGYHfnFZLM8464J8pjWoNgHqOLX97IfehwAskNSG4Zg7uUFADavqts0YV
         4kKHtgQUG7/qzAQhJNq0S3X/awANzNSKdgp79+iul83YH61Tty0gEwIQUoZ/oyxNvBQl
         ym1Gvpcn0W45+aw5ShlNAz1uDX6NmK01N5oIWpuMJdke5qtdl6v8xlUX+Ijr5Hz7SBmW
         YLyK+z1gUUzB3JQJVyCma3c3A4LsshYa6BliPNTbwnPMLj6z1TyyqcW2Pmrx9P4qcmYv
         /aQ+XcR2fT327hGZcpzA3EaOyYxBb0/PSh6ZCpWndeHeOqjEwlh7Ea1kZkNSKLywcdhk
         LrYA==
X-Gm-Message-State: AO0yUKWyOF3y17OuY86zu4vDkL9124fRTKYc5pHGZ2/vSCxrMBWap5Ub
	FpNNPQ+x/zClT1vrGDQ4I54=
X-Google-Smtp-Source: AK7set9Oc+MPdB112yVNp5k5KJwNdP6haZBEVYzKHPhsYHer+brcbAlhIPeodAVrkgboHWjANgBpBw==
X-Received: by 2002:a17:90b:1b52:b0:230:af67:b847 with SMTP id nv18-20020a17090b1b5200b00230af67b847mr599932pjb.31.1676341015985;
        Mon, 13 Feb 2023 18:16:55 -0800 (PST)
Received: from [192.168.43.80] (subs28-116-206-12-37.three.co.id. [116.206.12.37])
        by smtp.gmail.com with ESMTPSA id f63-20020a17090a704500b00233e8a83853sm3036567pjk.34.2023.02.13.18.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 18:16:55 -0800 (PST)
Message-ID: <7d1774f2-0548-88ef-039e-dc4026299a12@gmail.com>
Date: Tue, 14 Feb 2023 09:16:49 +0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/3] Documentation: powerclamp: Escape wildcard in cpumask
 description
Content-Language: en-US
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Power Management <linux-pm@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Arjan van de Ven <arjan@linux.intel.com>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, oe-kbuild-all@lists.linux.dev,
 kernel test robot <lkp@intel.com>
References: <20230213100800.28333-1-bagasdotme@gmail.com>
 <20230213100800.28333-3-bagasdotme@gmail.com>
 <8367d92de90afaaa7ec5fac1dbcc0337ab641cb6.camel@linux.intel.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <8367d92de90afaaa7ec5fac1dbcc0337ab641cb6.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/13/23 17:17, srinivas pandruvada wrote:
> Hi Sanjaya,
> 
> On Mon, 2023-02-13 at 17:08 +0700, Bagas Sanjaya wrote:
>> kernel test robot reported htmldocs warning:
>>
>> Documentation/admin-guide/thermal/intel_powerclamp.rst:328: WARNING:
>> Inline emphasis start-string without end-string.
>>
>> The mistaken asterisk in /proc/irq/*/smp_affinity is rendered as
>> hyperlink
>> as the result.
>>
> I submitted a patch 
> 	[thermal-bleeding-edge][PATCH] thermal: intel: powerclamp: Fix
> warnings.
> 
> Thanks,
> Srinivas
> 

OK, thanks for your parallel!

-- 
An old man doll... just what I always wanted! - Clara


Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1F27C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 02:16:10 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id rm7-20020a17090b3ec700b0022c05558d22so14069253pjb.5
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 18:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j0usO4jGkLQMVlzI7ZmYdbZ3TD6rNBgw6pqhHvh0Qr4=;
        b=OJoKSazIkUq4KN5GglUDQAbyKwGQlwiZBwiDverChDRsOMbR+YODRjEGi7IiHLUw96
         +zoUsJdKUo2ujThzYrYxOGpa7155m8XVXafKUSS3ZNVZ5KfOLcHHPBOXUaJ4O6HRz6SQ
         uQqcDwnDR1rMBRGnNhVKjmFZ7ErKudSvnuq7WnDZ5KPvJ4i5eoacpxXGI5KgQqSRydVA
         n9Cs64sViwuF/+a7acC3YDz9EuUgop3HWrcOatY28cYqNDT5eRuMxyp8Wk6LH/7ySfZf
         vAusdhXHui+JwENMRgaL0lMhZrZeeqCdSdguXPXSJnsS6QXcYoiw/6AFKSqEgJKZGkx3
         uVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0usO4jGkLQMVlzI7ZmYdbZ3TD6rNBgw6pqhHvh0Qr4=;
        b=2OM3CcWr0KkB1uuL0BpwEkHHENMAoBZnZwxU7UdRQ6JBEz9L2xxnhd4niCl9lMuCbw
         yEmUuJzJGJAXHg4wA4Tg6mKR5G720L3cZtEY4lVX/9Z6gdHKMoo023ACcj7CaXHX+8T9
         cehsE/zGQYqUoFLXcqVgvYotd6WJZ2HN4Mn83dweb37bMjK1bgUDanEOhfLwhFlXXKdx
         wSme5ZOnMPmMagW4vkihwufP1NjyTWFY5/A7lYFeOCAAqvFmhXeRwb+O+P8LuzSeOja9
         kIt7V+OKJ33zlnvAwmSwBpnPGaHKdBkVFPY5XjcZ0MgP0reV0z+y4zELplC+rhFNpSnm
         ZKzQ==
X-Gm-Message-State: AO0yUKVMexQnMwZc2wTj9sM4wjRNalYukrUssNsm0olO85ccsm7WxFHJ
	McnH9ziKHpQUNM5ERsBrdsM=
X-Google-Smtp-Source: AK7set/+u844rqTiRxHEMU+dAbarueYq4Py77iyNVGWt2KnQ5YNZHIRIOkUefCUn5atgHdRvvMeQhQ==
X-Received: by 2002:a17:90a:b304:b0:234:2807:55e3 with SMTP id d4-20020a17090ab30400b00234280755e3mr1107387pjr.7.1676340969726;
        Mon, 13 Feb 2023 18:16:09 -0800 (PST)
Received: from [192.168.43.80] (subs28-116-206-12-37.three.co.id. [116.206.12.37])
        by smtp.gmail.com with ESMTPSA id p10-20020a637f4a000000b004f22f5297bcsm7716739pgn.67.2023.02.13.18.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 18:16:09 -0800 (PST)
Message-ID: <848a6a77-9cc8-3cf7-98a6-8ca0bb0f329e@gmail.com>
Date: Tue, 14 Feb 2023 09:16:02 +0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/3] Documentation: admin-guide: Add toctree entry for
 thermal docs
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
 <20230213100800.28333-2-bagasdotme@gmail.com>
 <6cc45a32e92e6a261b7d497eb48ac59472c35508.camel@linux.intel.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <6cc45a32e92e6a261b7d497eb48ac59472c35508.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/13/23 17:15, srinivas pandruvada wrote:
> Hi Sanjaya,
> 
> On Mon, 2023-02-13 at 17:07 +0700, Bagas Sanjaya wrote:
>> kernel test robot reported htmldocs warnings:
>>
>> Documentation/admin-guide/index.rst:62: WARNING: toctree contains
>> reference to nonexisting document 'admin-guide/thermal'
>> Documentation/admin-guide/thermal/intel_powerclamp.rst: WARNING:
>> document isn't included in any toctree
>>
>> Add toctree entry for thermal/ docs to fix these warnings.
>>
> I submitted a patch 
> 	[thermal-bleeding-edge][PATCH] thermal: intel: powerclamp: Fix
> warnings
> 
> Thanks,
> Srinivas
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara


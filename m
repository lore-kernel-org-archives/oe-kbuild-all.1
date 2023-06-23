Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE1DA31
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 07:09:13 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3094910b150so372520f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 00:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687504151; x=1690096151;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uRk6i07k73vCbKJS9ub104ZDLhubK6Tz61hPhUbREBA=;
        b=sCBVpu9pubIl8T0zCD7xN0pxvm81R7wZZrp3cWfow7ubuae1dRVDfhW5oGLIHiSVKD
         USXglnKL8tXZD0PCPSdiUmMhCE7hf6gp8jmu2xZc/M/k7Hjz3xLW54EVkXq1qt59TVu6
         6psPXWSvDXb2+Vxk2UENrDmI4zh+nqpk8rPVMHtTw41q0yCNF6DP3W20EKIfjLEELny/
         TfBB187aNbHvYnt60RFEfBVdB3WrWDqP7BwBXi7JJljUTiL2Nfil0viT0pAVFkyT8ANM
         PTjTFim5/+akyB0sfufbk+33KwxsZVBzRKfl08iBwlP09NGGMXpUtGppSMOtF8kyCpX0
         bVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687504151; x=1690096151;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRk6i07k73vCbKJS9ub104ZDLhubK6Tz61hPhUbREBA=;
        b=h2C/VerfKruUbsJFZmpGRiBQx6OXPH4dFW/w8mXQqaRY/AbrCbIKyGJ73ME6+vq9MH
         Th2BMUIsqX/XpqNr27L4voGji3dXoyzalHwqx7FSFiPay4ggAuziVBSbEhFlezmsBFWM
         oJElv+CAxpvEhKSjttNTcSwCmbKxq3ttNuba0CE74Gj9AE3bNBRxhKy6unMqnz/3quLD
         /anW/lruDXkWyV85Yom4r6INedrpcrLeSChA28bmSrub5qlFX0+GqSOuW9flymGG9dvM
         0q+LoqJr/qjhUEz4SZKGAWHdurVZZMlYQYFgtEfKvKHLeQarjUGvBiw2iTg/Qs0Yo2lq
         HEWg==
X-Gm-Message-State: AC+VfDzbigNVKe7wlkD4YoBkkERrM1v19dcIznCZTeD0QAB8q5YMrP3u
	D3Tgwf89n6aTmW62XANnuV52T+q/IqVcxI5+ojU=
X-Google-Smtp-Source: ACHHUZ6FrnfqtH/Tbqe1arVijUMhZh/Cgti4HuwFwOcfhwaqVKYaI6WucypLG6dMW+gFQloHNi75KQ==
X-Received: by 2002:adf:ec43:0:b0:30f:aef1:2add with SMTP id w3-20020adfec43000000b0030faef12addmr17219530wrn.47.1687504151663;
        Fri, 23 Jun 2023 00:09:11 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id c9-20020a056000104900b0030631a599a0sm8642166wrx.24.2023.06.23.00.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 00:09:11 -0700 (PDT)
Message-ID: <2f246b9c-1df0-a6e0-9666-b59d7ade9194@linaro.org>
Date: Fri, 23 Jun 2023 09:09:10 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [daniel-lezcano:timers/drivers/next 6/9]
 drivers/clk/imx/clk-imx31.c:14:10: fatal error: soc/imx/timer.h: No such file
 or directory
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 kernel test robot <lkp@intel.com>, Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
References: <202306231333.gPkThiXk-lkp@intel.com>
 <20230623065329.mrjplb3vplfpuky4@pengutronix.de>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230623065329.mrjplb3vplfpuky4@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/06/2023 08:53, Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, Jun 23, 2023 at 01:45:45PM +0800, kernel test robot wrote:
>> tree:   http://git.linaro.org/people/daniel.lezcano/linux timers/drivers/next
>> head:   6d0eb9759ac71fb5d008c90c0810d142f5a3ce99
>> commit: 9e9d7570485d724838322714cd413eb90d9459f4 [6/9] clocksource/drivers/imx-gpt: Fold <soc/imx/timer.h> into its only user
>> config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230623/202306231333.gPkThiXk-lkp@intel.com/config)
>> compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
>> reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231333.gPkThiXk-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202306231333.gPkThiXk-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/clk/imx/clk-imx31.c:14:10: fatal error: soc/imx/timer.h: No such file or directory
>>        14 | #include <soc/imx/timer.h>
>>           |          ^~~~~~~~~~~~~~~~~
>>     compilation terminated.
>> --
>>>> drivers/clk/imx/clk-imx35.c:13:10: fatal error: soc/imx/timer.h: No such file or directory
>>        13 | #include <soc/imx/timer.h>
> 
> I think happens because
> https://lore.kernel.org/r/20230328100531.879485-3-u.kleine-koenig@pengutronix.de
> was applied, but its prerequisite patch https://lore.kernel.org/r/20230328100531.879485-2-u.kleine-koenig@pengutronix.de
> from the same series was not.


Ah, right. I skipped it because I thought there were no dependency.

Stephen, may I have your acked-by to pick the patch 2 which change a 
driver in the clk directory ?

Thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


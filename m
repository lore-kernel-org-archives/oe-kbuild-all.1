Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C058466
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 11:16:58 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 35DCA5FD1D;
	Fri,  2 Jun 2023 14:03:27 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685703807;
	bh=P21ZCO8cvJf6YwlmF8pYgOOnkYfHNy2KTyAlbb0APBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=kmylLnV7Csqk12Xvc0Kg+idFZT1QbN8IU3H1rnWJi24+VlEVvT6mFRIIVlprgmIqm
	 7fjR7BL/zgn0viCj8vWO7Vdw2Kjq66n6NME1f2zxetKrwqJrgWat4ClJGF6Myjw/wN
	 D49WKauAxcUcTUyWslpRrsM+6ZZ0O6TZVUI9A/ZtBA1J9k4cRNoQHnGomjAHLGva78
	 8/s7NJ+4dxuNiX3EeFhMewOPtzyXJ2K8gXCu55KAX5D64nS+7spOzdKA8x3XjE6BZs
	 D84N6D0D3f8NrrghoJv34G83VFDkU6zdKcwzb60Zre1iLn+wIkYxoN7Jygj5F+toX6
	 cEOqA7RhIlkXw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  2 Jun 2023 14:03:17 +0300 (MSK)
Message-ID: <e6302401-7a07-a2fa-621b-29f62ef60261@sberdevices.ru>
Date: Fri, 2 Jun 2023 14:03:14 +0300
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1] leds: trigger: pattern: add support for hrtimer
Content-Language: en-US
To: Lee Jones <lee@kernel.org>, kernel test robot <lkp@intel.com>
CC: Pavel Machek <pavel@ucw.cz>, ye xingchen <ye.xingchen@zte.com.cn>, Kalle
 Valo <kvalo@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steven Rostedt
	<rostedt@goodmis.org>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<kernel@sberdevices.ru>
References: <20230522190412.374474-1-mmkurbanov@sberdevices.ru>
 <202305230549.ekneaQ89-lkp@intel.com> <20230601185116.GL449117@google.com>
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
In-Reply-To: <20230601185116.GL449117@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/02 03:06:00 #21401484
X-KSMG-AntiVirus-Status: Clean, skipped

Hello Lee,

On 01.06.2023 21:51, Lee Jones wrote:
>>    drivers/leds/trigger/ledtrig-pattern.c: In function 'pattern_init':
>>>> drivers/leds/trigger/ledtrig-pattern.c:454:74: warning: implicit conversion from 'enum <anonymous>' to 'enum pattern_type' [-Wenum-conversion]
>>      454 |         err = pattern_trig_store_patterns(led_cdev, NULL, pattern, size, false);
>>          |                                                                          ^~~~~
>  
> Did you fix this already? 
> 
> I don't see a subsequent submission?

Sure, I intend to send the updated version very soon (hopefully today).

-- 
Best Regards,
Martin Kurbanov

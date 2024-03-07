Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F50525D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 02:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709777325; cv=none; b=RZn/GKZeRKuzyD/16uj1ttfreroBl8y3dlhWc/C6pusnDcXl55AcnhS2a75neIqmk1L/ElBWZECwAzPweyDaZJy60AQBqp958S6Jhk6NQbV4bc/nRPaKtEwUwDvoRuBvyCP6zVrpKFk3nu5YeUJPV/PwfafxILJs5+1moiqFBx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709777325; c=relaxed/simple;
	bh=DMZRK+vPtMrXU5t8FRdc78Z5Qx9jDUypmm/pMbUqEv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNyVYLRnX691Ll8ajgYFpYQN0QErNs7/UpFYcHaU3Qci1eS+ON0i6evsGfS6l3TnErHoWOeq2k5HyBVYgr2g8jbecxvv+hrmvpZArHZOEdE74WoDl46HeCA1ndFJYWfcypLmP+6l/K9nBW82eAYoi0o2oYgdSdGkHkhNKB4WLUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMXJAUxx; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMXJAUxx"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-609ed7ca444so2929437b3.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 06 Mar 2024 18:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709777323; x=1710382123; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+nNSbeSGBZEHsLejdhcAdLckTgr+rswacz9ss4mePz4=;
        b=cMXJAUxx6UQeqTONOc/MZXn/g0uXDROptK51xSRo7mOYdspK58u5R4jqPTBxfCGalN
         WHxu8pkzIyg1MW9fzbVZ7FdFT1AtrFzSbh/uo1N20Mxs6JBVOdnmBFOgU22EoaoMu8QD
         2aQ529O6iLXf2v1gwFI8VJCb0/j2UxOtV4ZcZ6duLOM+Y7CrikkCyvibYAMKFcSbNX0j
         MDrF6BzzNMgWlDohT/PTBgP/cVbLZNy9axkFFzlruna4gyezLPRDDV44cqrVDB7ws74m
         +c47uSq47fr3slHV/YbNW+6kOGI1YJCDYI3qB0REQiqMVv20pjY8H9amMQBTaCtVwZpt
         YyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709777323; x=1710382123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nNSbeSGBZEHsLejdhcAdLckTgr+rswacz9ss4mePz4=;
        b=nsauvjsNbkNzMX6kWS3Z17j9eKnWqLRAHg/Y6nr5MUX2g8+41fm5UcSReYk/+Z7EnO
         uKodjpDmK3WOK0xJSFeJF+b8ROdI+Zoh4STOGlvwL5gz6OhNwWDIzIk/cUod8nbh+rQZ
         /T/+5lgD+86rHwRe+om0lvj8YIpoO4JzS7Q/Z/1Mrl8PCIiyOUgbtfJ02b31OZTD2HrC
         VN5WAuoY+3xm22UJaVeDS7gz3ykjIjkucMaLbuTViFAgkeuNGjMxUY/RLSOjAUvq4oGp
         esJTCaukrCPI9rA9rjVzdw+DmF7/MP0UqxZK/h3LU1rtrv1vb8VYqPRtDlbnFLrMKE/A
         ejYA==
X-Forwarded-Encrypted: i=1; AJvYcCWEXZCgDAoL0fRLfe/8nCvAV/BjfPlijf7ENY9kZevc5t1W65qRol8CC6GFT9994WBLL0NuvwCDHxwCyIO8AI/4NK42u9wC6A7K+Jh3PQ==
X-Gm-Message-State: AOJu0YwU53111aUbEzmjQ93G88H8OFQLiXG1/Im4A74PkN07uRMBhzkW
	m7LbnvS4n5pADp5zf22k93206V+w8Ejqq1jcwQZI41ugyr9eTZ4E
X-Google-Smtp-Source: AGHT+IGMfe2Kz71T83WnCFVVMEvUhB5WopIeLOkyb50UuVsg+fX/cI0IRhiYI0MJWN2eQB/iwQq43g==
X-Received: by 2002:a0d:d908:0:b0:609:9333:5bc1 with SMTP id b8-20020a0dd908000000b0060993335bc1mr12178744ywe.40.1709777322986;
        Wed, 06 Mar 2024 18:08:42 -0800 (PST)
Received: from ?IPV6:2600:1700:6cf8:1240:1f54:11c2:e56f:9640? ([2600:1700:6cf8:1240:1f54:11c2:e56f:9640])
        by smtp.gmail.com with ESMTPSA id n39-20020a81af27000000b0060485f86449sm3938707ywh.69.2024.03.06.18.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 18:08:42 -0800 (PST)
Message-ID: <6bab3cb4-5c5b-4033-8bd5-e7be9250ff48@gmail.com>
Date: Wed, 6 Mar 2024 18:08:41 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 8264/11963] ERROR: modpost: "__fentry__"
 [tools/testing/selftests/bpf/bpf_test_no_cfi/bpf_test_no_cfi.ko] undefined!
To: Philip Li <philip.li@intel.com>, Thinker Li <thinker.li@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Martin KaFai Lau <martin.lau@kernel.org>
References: <202403061307.f7nX2Ma5-lkp@intel.com>
 <CAFVMQ6ThBWmoSEz==zVH_MvXq+=yvxO5XZJSLUUqJV+kVeULuw@mail.gmail.com>
 <ZekfaPDRU+ecVSXJ@rli9-mobl>
Content-Language: en-US
From: Kui-Feng Lee <sinquersw@gmail.com>
In-Reply-To: <ZekfaPDRU+ecVSXJ@rli9-mobl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 3/6/24 17:59, Philip Li wrote:
> On Wed, Mar 06, 2024 at 05:55:58PM -0800, Thinker Li wrote:
>> I am checking!
> 
> Sorry, kindly ignore this report, it is a false positive. And we are working
> on resolving the bug in the bot.

Ok! Thank you for the message.

> 
>>
>>
>>
>> On Tue, Mar 5, 2024 at 9:25 PM kernel test robot <lkp@intel.com> wrote:
>>>
>>> Hi Kui-Feng,
>>>
>>> First bad commit (maybe != root cause):
>>>
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   11afac187274a6177a7ac82997f8691c0f469e41
>>> commit: e9bbda13a7b876451285ab15fb600b809e5e2290 [8264/11963] selftests/bpf: Test case for lacking CFI stub functions.
>>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061307.f7nX2Ma5-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202403061307.f7nX2Ma5-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>
>>> WARNING: Module.symvers is missing.
>>> Modules may not have dependencies or modversions.
>>> You may get many unresolved symbol errors.
>>> You can set KBUILD_MODPOST_WARN=1 to turn errors into warning
>>> if you want to proceed at your own risk.
>>>>> ERROR: modpost: "__fentry__" [tools/testing/selftests/bpf/bpf_test_no_cfi/bpf_test_no_cfi.ko] undefined!
>>>>> ERROR: modpost: "__register_bpf_struct_ops" [tools/testing/selftests/bpf/bpf_test_no_cfi/bpf_test_no_cfi.ko] undefined!
>>>>> ERROR: modpost: "module_layout" [tools/testing/selftests/bpf/bpf_test_no_cfi/bpf_test_no_cfi.ko] undefined!
>>>
>>> --
>>> 0-DAY CI Kernel Test Service
>>> https://github.com/intel/lkp-tests/wiki
>>

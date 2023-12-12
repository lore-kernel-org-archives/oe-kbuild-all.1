Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5856D1D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 13:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jjX2XRm+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40c3ca9472dso36646295e9.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 05:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702389212; x=1702994012; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hTEAK+2LTcfnNQwEb+oSGpsXypsMob+S9kan2IS2dPs=;
        b=jjX2XRm+JCAisnDUWhe16Wjq2ECd/9f5VSy1llcqcnQ9UyH3zlKDb2JN/RB0HpZgfK
         TmTnQ94V4xm8+Zwfu4Kg7yWoXHFbt9VRnynM1TfbJCTAgd4MfYRlrwDPirRJqw6DUu+m
         YaaPLNBVWmcfzLcrL7ybALDo92dg48amCPL3PTsD9IXwUOX2arkwtdhKsXKziYz16dgx
         pytGiwYwOzAClOPzuN4qPQBVfEyMWiJCcOOxjaXn7oyo2jZJ4yT0QP1p8jWm6H9JHEY7
         JQh8yg5HhvwhUx0MLCdw9QVePb+AGePZD8JSSpJ1uJeGJhQ9ofQE9Yc56BcnxNSBvLji
         tuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702389212; x=1702994012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTEAK+2LTcfnNQwEb+oSGpsXypsMob+S9kan2IS2dPs=;
        b=rxPUcmqgfpeVapxK7Y6CArwkWsOX7odoZnkg8FsT4jD36mfpdG2rc7/+BcDxfzne11
         6JNQ8ewypkVsQ8VUBwIV4YFjJZH57Ew3wP3V6pJ1sgQqNV4Tokvf4dKXkYq3tbtk2VLX
         4fKBLP2r+D7T3i0mQyoEIlMC5jTuumbWcub3uA315aSsriYmSrv7owF/eGqx1N3eLd9/
         PEtaioi62PCzxFCBweR43oXslUSv5gDTVtkC+6/q58IPmL+EJmPf9uL0XqwFc8goNQ95
         VVwAreM+Z84S/H2bVwsT95tvr/AeKxDF7ydjLlxA2hfv7tGadeKZzb9CjQe6RCqvKS8x
         H1XQ==
X-Gm-Message-State: AOJu0YwvvCUCxlm6Q+hvzNJhW80lx/GSUwKHlibglf7Dcei6hDqa2qDy
	LORNILRvcgWs/z+EA5fJgu8=
X-Google-Smtp-Source: AGHT+IEpZfz+yZwZe/aWwF1eS+4t9ZZv7wkjVuBWPAa/XhT2Kga2jJddVn6m0LjFT6vLvynVW5FwQA==
X-Received: by 2002:a1c:7207:0:b0:40c:914:d2cf with SMTP id n7-20020a1c7207000000b0040c0914d2cfmr2151015wmc.134.1702389211550;
        Tue, 12 Dec 2023 05:53:31 -0800 (PST)
Received: from [192.168.8.100] ([85.255.234.100])
        by smtp.gmail.com with ESMTPSA id t14-20020a5d42ce000000b003333b0d603bsm10860669wrr.42.2023.12.12.05.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 05:53:31 -0800 (PST)
Message-ID: <46b061f4-1542-4b18-b65a-6b3b77fb2f25@gmail.com>
Date: Tue, 12 Dec 2023 13:52:08 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [isilence:zc/rx-pp-provider 5/31] net/core/dev.c:2065: undefined
 reference to `gen_pool_for_each_chunk'
To: Yujie Liu <yujie.liu@intel.com>
Cc: Mina Almasry <almasrymina@google.com>, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev, Willem de Bruijn <willemb@google.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>
References: <202312102313.zJHWVLAZ-lkp@intel.com>
 <182d28da-8822-4d2d-85fe-5a1843905eb1@gmail.com>
 <CAHS8izMn0JhRkmvF1yEvk1iUdYmHNbxbs8GgO=0GX6Qq5uR80w@mail.gmail.com>
 <18a68cf6-7738-40aa-869b-401bb08bc41a@gmail.com>
 <ZXZja1UjyhyHDNiu@yujie-X299>
 <7ad9d49a-d649-4f78-ae89-c592117d7665@gmail.com>
 <ZXfLBk8F4eoQmmZn@yujie-X299>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <ZXfLBk8F4eoQmmZn@yujie-X299>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/23 02:52, Yujie Liu wrote:
> On Mon, Dec 11, 2023 at 01:25:19PM +0000, Pavel Begunkov wrote:
>> On 12/11/23 01:18, Yujie Liu wrote:
>>> Hi Pavel,
>>>
>>> On Sun, Dec 10, 2023 at 11:15:50PM +0000, Pavel Begunkov wrote:
>>>> On 12/10/23 21:05, Mina Almasry wrote:
>>>>> On Sun, Dec 10, 2023 at 8:54 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>>>>>
>>>>>> On 12/10/23 15:45, kernel test robot wrote:
>>>>>>> tree:   https://github.com/isilence/linux zc/rx-pp-provider
>>>>>>> head:   4b8de8977565096e38b6da993c68da6f2ef9b89c
>>>>>>> commit: 161f99ad49ca48fa141161b409eac11a6b63c105 [5/31] netdev: support binding dma-buf to netdevice
>>>>>>> config: i386-randconfig-003-20231210 (https://download.01.org/0day-ci/archive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/config)
>>>>>>> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
>>>>>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/reproduce)
>>>>>>
>>>>>> Ergh, I have no clue, why lkp thinks that it's a good idea to spam
>>>>>> about someone's non-release repos, but just ignore it.
>>>>>>
>>>>>
>>>>> How do i enable this on my repos? I have branches on github I'd like
>>>>> reports for:
>>>>
>>>> That happened long time ago without my knowledge, but apparently
>>>> you can just ask them
>>>>
>>>> https://github.com/intel/lkp-tests/wiki/LKP-FAQ#how-to-request-testing-a-new-kernel-tree-on-lkp
>>>>
>>>> I'm not aware if they have filters for what branches to test
>>>
>>> We do have regex filters for this. Please check the "branch_allowlist"
>>> and "branch_denylist" entries at:
>>>
>>> https://github.com/intel/lkp-tests/wiki/Repo-Spec
>>>
>>> Sorry for any spam on non-release repos. Do you want us to stop the
>>> robot from testing this repo, or could you provide some info about what
>>> branches to be tested/ignored so we can set the configuration for you?
>>
>> Dear Yujie,
>>
>> To be fair, it's a pretty useful service, and I appreciate the effort.
>> The annoyance comes from CC'ing a bunch of people and lists who don't
>> care about the patches, and who will then be asking me what's that all
>> about.
>>
>> Ideally, I'd prefer to limit recipients for reports for that tree
>> to only myself. (and maybe some necessary technical lists like
>> lkp and oe-kbuild?). If it's not an option, can you help me to set up
>> a filter to only test "lkp-test/.*" branches?
> 
> Hi Pavel,
> 
> We've set the mail config for you and the reports for this tree will be
> sent to you privately.

That's very helpful, thank you

-- 
Pavel Begunkov

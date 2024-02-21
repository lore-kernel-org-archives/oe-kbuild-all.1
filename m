Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4798A47
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 00:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708474798; cv=none; b=o3KMNdpSMK4iZqszlFvLhwFyIiW8rjK95Oin6kxp8hGVDGp9S+BM0/mFxTmj8Uk82czBi6bK2HMNsNMGtlEaZXTiw1rNvt9fooKP1eqVXqK/VEpNt8+JqACLeeqFTLogcY5opJZRkMmp4ntggDsqXQSsV8/6F3NPZAxySDfdrKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708474798; c=relaxed/simple;
	bh=K7QkEMeFgCEOBDdteVUHDL15AVxzWVVyz5SmmokOZXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eOO9yoD0hFu1xXBzUZCydUNAB5NxUHNJjXhKx2cGt+PSnJQPeZcAlp/mA67QFXksycDco0dA5f9qiOrRQv/PKwZ57xsUfFMtFbXMICIOzO5hhuQwoUPRT7SasbsrO3/QSC0lYNu0kYHjhanD2zjyWDSj8u1wexEIhOats6GLkR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iCcTpdM1; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iCcTpdM1"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7c49c979b5dso99598039f.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 16:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708474796; x=1709079596; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1SSchokFBeolQFf43F1Ki91lkNWxa302wO4DNZKIww8=;
        b=iCcTpdM1Xf1kUgL3qmz4SWysTLWEa8RJlU/GJrsPT+Np8wb3ps3E2G9DcMaO4FGyxE
         gdzH51p+mFGGonMz1bubDHD8UAOv5DM76eLBz9kc3NP8Yn7zYkdDtLrXTwsSjZtod0KV
         xs9Zi9RRA8G0cLjMNK0uLuyhI78bHBR4qcbBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708474796; x=1709079596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1SSchokFBeolQFf43F1Ki91lkNWxa302wO4DNZKIww8=;
        b=T6zhFSxdjHaLRGmTA7wa4gXFBOadiKRVQbm7SPLpdXNwN13jI9CZVNgos8+qYZx8fF
         FBXeLc5xuYGZ30JCtyShhRmH1NYNFtXTvMck3EYEEc94CwgvgcxwhPZmdgT13DrWqFPa
         faw+BF/a3MtCEJvqmEUFtYDNT7aUTGnl7E1h8O+dpH97gYf+/ebSceig32Vc+CxnaxzE
         3so1L05v+E/+/P4TlRmtf7mnRHV960WN62VEATqEr9rjq/rwlhQ4eS11iSXkh9dUiQoc
         YWu7/Ws1sI15m2sSjEzseeqEChG7wkDopGFSrnDOZb+GENTG48sbtIxnkqwLEe3HpQpx
         LD9g==
X-Forwarded-Encrypted: i=1; AJvYcCWZJ6HiOrHzGFlkZfKByV3XVwsvcDDx50QBOqlU49iwUrROK4alTrtbMvnxLnKVRBukGx+hD2Uv7ykc5cbaImfunTeYtlVU2NKoV7ENew==
X-Gm-Message-State: AOJu0Yz48nS6sbaRe80oPtDkS2NJZuhx4UuJ5PiZLq+MUTbezyzRrgBE
	gPbQb3An5K5YyeHu78vi3QhXMnngrEw7cwSyV1Dm5172ULjAeodEEqY4ng/R+jc=
X-Google-Smtp-Source: AGHT+IHjKllnuZm8GTJktzvD7k1+Fmvk1+TpjJvDUR7WXcS/dDJj3/rdo98ETt9VO7T5uUrGvECeJg==
X-Received: by 2002:a05:6602:f15:b0:7c7:28f7:cc81 with SMTP id hl21-20020a0566020f1500b007c728f7cc81mr11052980iob.1.1708474795830;
        Tue, 20 Feb 2024 16:19:55 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id d5-20020a056602280500b007c73e9033fcsm1884269ioe.2.2024.02.20.16.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 16:19:55 -0800 (PST)
Message-ID: <c3ee4083-fca7-43cc-b955-3b7e4faed2b0@linuxfoundation.org>
Date: Tue, 20 Feb 2024 17:19:54 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] selftests: lib.mk: Do not process TEST_GEN_MODS_DIR
Content-Language: en-US
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: kernel test robot <lkp@intel.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 oe-kbuild-all@lists.linux.dev, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240219135325.2280-1-mpdesouza@suse.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240219135325.2280-1-mpdesouza@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/19/24 06:53, Marcos Paulo de Souza wrote:
> On Mon, 19 Feb 2024 09:15:15 -0300 Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
> 
>> On Mon, 19 Feb 2024 14:35:16 +0800 kernel test robot <lkp@intel.com> wrote:
>>
>>> Hi Marcos,
>>>
>>> kernel test robot noticed the following build errors:
>>>
>>> [auto build test ERROR on 345e8abe4c355bc24bab3f4a5634122e55be8665]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Marcos-Paulo-de-Souza/selftests-lib-mk-Do-not-process-TEST_GEN_MODS_DIR/20240216-021601
>>> base:   345e8abe4c355bc24bab3f4a5634122e55be8665
>>> patch link:    https://lore.kernel.org/r/20240215-lp-selftests-fixes-v1-1-89f4a6f5cddc%40suse.com
>>> patch subject: [PATCH 1/3] selftests: lib.mk: Do not process TEST_GEN_MODS_DIR
>>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402191417.XULH88Ct-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202402191417.XULH88Ct-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> make[3]: *** /lib/modules/5.9.0-2-amd64/build: No such file or directory.  Stop.
>>
>> We should ask the kernel test robot machine owners to install kernel-devel
>> package in order to have this fixed.
> 
> Or maybe ask them to change the reproducer to specify KDIR to the git tree,
> instead of /lib/modules/?
> 

This would be a regression to automated test rings. Do you have any other
solutions?

We could remove livepatch from default test until these changes are made
to test ring environments?

thanks,
-- Shuah


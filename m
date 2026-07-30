Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350ED296BD3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 07:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785395080; cv=none; b=sM9BZpfzHqtphdwPZRAPM67Bn+ScXWg43ykoZNhjm/EF8STyQ5q6/z4RceVfA7SXH0zLm8kUZo1Z5kw7rFqUZ4lAQJuHTv4XVXzr3OijjtIrPd27UQaRPVBH2AhgiDQLYsW6KgFRI2Mvn786VQmoP9hxrhfh+VxHSBvYdT18Hi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785395080; c=relaxed/simple;
	bh=eUub1WOBurKKQMdurADrgZ9S4PQ0v0mV3n9D7ObL4Mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwriRCLNsFn9eKed3zOZGYGm+6jzX0eqqsfIEaRvp3SNXBoBgl3/X+kD/2+PJTC37I3hXamVvfmYVl7lkjrYZmeC2IGzip1OmG3MAs5CEbezmih4GWKmqqxcQ8q/MJXv5R1qXGuK8bkIAPxOZLzLheALPfkEhbQmDnESvAIoAn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oBiPovu8; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oBiPovu8"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc97653887so20801045ad.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 00:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785395070; x=1785999870; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nBXwj4w+J4M7SdOCVORvHTOCgnxjV4DAZX2+4ULF/2w=;
        b=oBiPovu8kj+Oy8oJL8DUpnHA1EWhkCVCk91HDhzcgyEveMrdpOsLxaaXFw4UMd6cdu
         3BDkmoH+aSmh3po8xNrhitlGrQlYcGBo7otWPwCwgorihtFIHboj3l4CNjKyqsQaZHHW
         wKWaK78Ifg62pGxXLFY6IYB5NUepsUwuPClR3LJiRrfKj/+qFH+zzvm5DK8bcoEjBJ6c
         yKSPL0C/GywTatIHNl4ruNV+xLZASOHr/vgJUpxvt9zDaC56spIbuJHlVb61Hc5Lz9RI
         Rta86Wfj3E1gFXSXXzUe1qtgfHkg8ASA0cgqatbXKSBwxLwqDj4+CySLWNYkORNHfPTm
         t45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785395070; x=1785999870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBXwj4w+J4M7SdOCVORvHTOCgnxjV4DAZX2+4ULF/2w=;
        b=JXOEpCSapIbHFagxeEP8LpeO6ViF6rJUbc4OaBlOil5q6WnFHVbpux70WgPKmbYt9p
         TTNv0dbCJPWMfwNzHvPLVZMal6dOv6+/L1Uc9JMqWSgREvYVRDzbSftE3b6hFZuFTy8J
         Gxz3YHlO1P+bQ4eCEk+n1imRQVmGtb7lCCN6M0FqXMr06plaIEZx/4P9p9E5A6qGscuP
         DI8e46U16dOh7/K3Wk837rdBcSG+ALc3nRmrHrzssrMdsW3e8RDbcM4YcfnXR0iJKFLk
         M2SqB8IkZX/J6HOTthx3SWoesYatCsoam3lXKsfTmCUaNvq3CkyeT8VZRrDJv5y8xpl/
         6DEA==
X-Gm-Message-State: AOJu0YwSgcOUk6MLAqN9/BT0rP4STfBEgGUWaUSryAfEG3v7sUsWe1mR
	DE5Z7Lic3MeefylxN9coNngPyg+XjY88Al0WKIHEHsMN7ydXpzUz3Qu6EACG5A==
X-Gm-Gg: AR+sD12lBhAWcBiD8yglQRpF+it5rOkNowwi9xX4Z9uLQHUczbJKddqVXGRG7NwmBlO
	ICmLVm5aqDIcPG91nWEbohyCxXXrmT3RQ5H9LGOPzrbe2AgfV+E3Bb4yjKJ8tW+b8VMgAQjJb0w
	aQv1pyDbIWtUWZTa5GLeWmhiS7D3rMmNcupe9GTt1Yhxcjpbo6FepPwp0O7BYYmlNcpi7lq0fcp
	a71itEdppZUI87TF1S3OGa2aQB10flhFmKqBjpqxonmf04DrMzcdYNZSOC5k8hTiI+UA/LBhonK
	7gIpNc26ONByHEstN6UACQm6cUdHSYbixQNCkOzbczD/Ilx7pRBl0hPERrxxU5pdOvRkqoPqir2
	PezLYIFCPpy1YLlXuiayfvLvSwXCInbdn3FZVl+yMcHRwuUqJXR3nH8F0V1/Gz7fzCHmZL9MNob
	PCbNFLby/T09rpEIMPXsSXTvYPugZgsO/dBROv6+XcUHXNW3QUEXLViE2wG2wBPBMRzP268zKc5
	SJ18hIM4d25nCT93upny4SfxiYGwFx8nZlbyyVmdp7LRrm0XuCXYw0=
X-Received: by 2002:a17:902:ebc3:b0:2ce:9c48:22d3 with SMTP id d9443c01a7336-2d035bbb13cmr17251075ad.11.1785395069985;
        Thu, 30 Jul 2026 00:04:29 -0700 (PDT)
Received: from [192.168.1.34] (cm-171-100-253-168.revip10.asianet.co.th. [171.100.253.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c3721esm21968545ad.77.2026.07.30.00.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 00:04:29 -0700 (PDT)
Message-ID: <087e006b-d856-4307-8429-f8225273a785@gmail.com>
Date: Thu, 30 Jul 2026 14:04:20 +0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [trace:trace/core 16/16] WARNING: modpost: vmlinux: section
 mismatch in reference: trace_printk_init_buffers.part.0+0xc8 (section:
 .text.unlikely) -> initcall_level_names (section: .init.data)
To: Steven Rostedt <rostedt@goodmis.org>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202607291326.Dr0maCyu-lkp@intel.com>
 <20260729113613.7f6af519@gandalf.local.home>
Content-Language: en-US
From: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
In-Reply-To: <20260729113613.7f6af519@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/7/2569 BE 22:36, Steven Rostedt wrote:
> On Wed, 29 Jul 2026 13:14:23 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/core
>> head:   c33330b2ec170dd38b3284a72bc6a07a49cc9a65
>> commit: c33330b2ec170dd38b3284a72bc6a07a49cc9a65 [16/16] tracing: Use seq_buf for string concatenation
>> config: xtensa-randconfig-001-20260729 (https://download.01.org/0day-ci/archive/20260729/202607291326.Dr0maCyu-lkp@intel.com/config)
>> compiler: xtensa-linux-gcc (GCC) 12.5.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291326.Dr0maCyu-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202607291326.Dr0maCyu-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>>
>>>> WARNING: modpost: vmlinux: section mismatch in reference: trace_printk_init_buffers.part.0+0xc8 (section: .text.unlikely) -> initcall_level_names (section: .init.data)  
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
> 
> This looks to be a false positive. I have no idea how the above commit
> could cause that warning.
> 
> -- Steve

Hi Steven,

I reproduced this locally with commit
`c33330b2ec170dd38b3284a72bc6a07a49cc9a65`, and it also reports:

WARNING: modpost: vmlinux: section mismatch in reference:
trace_printk_init_buffers.part.0+0xc8 (section: .text.unlikely) ->
initcall_level_names (section: .init.data)

Then I tried the same configuration and reproduction steps with the parent
commit, `b6ccdca8d11c28338776811f0b9024d92c4bedb4`. It doesn't report anything
related to `modpost: vmlinux: section mismatch in reference:
trace_printk_init_buffers.part`.

So it looks like this commit introduced the warning. I'm not sure where to look
yet, but I'll dig into `modpost.c` to understand the root cause. If you have any 
suggestions on where I should start looking, I'd really appreciate them.

Also, I'd like to ask how urgent this issue is. It might take me some time to
find the root cause.

Thanks,
Woradorn

Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E830F18DF73
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 20:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741208140; cv=none; b=Pr1RV1s2n0ORRlwyh08grjBBvJbgm91bam9Z0nQh+Uy+QqkPveI58kVx6ZSOA4UWPsnep8g6LIankXeKhEifJHVPEVhpnb4XyDSUMxyeq9sy44tjpyMAa2aTzOLlVHe8Euk7MjrjOIk7WE70CkjUTWNPBCWz5pVrS1mupmeLMBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741208140; c=relaxed/simple;
	bh=bSmgTlvwLJjJS9L24cNfFPZSeRDSXYM8VhcAjGh++W8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jvxW1Eob54GgaMbOtyhisVh5EA5g/FydgygVye0sTYeObSlJuvKpw5OB7R8eQejtijUMOn5tSjQgS9rPoWE03e16eL7TVLKSDy2Hk1gNutnO8NaHI9khvOGLZStS2ri9ZEMK/MfthO/DRatWy3h9cJbWKZQK6SBPBl0vJ4BGQ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IWON9jd4; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IWON9jd4"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d0465a8d34so63733205ab.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 05 Mar 2025 12:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741208138; x=1741812938; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TN8E9XEAktH2/BlknMuwwP6SKex4SrVTEApM/n+g1SI=;
        b=IWON9jd4ss4asKb7dYYs2zAZOQBTXfjs/b/q+B77z5o/woPiS78E1fILg6mVO4jdc9
         CWacOKsZd5uhRsvUur2cN0xnTza0Xrhx8fZS+19NqXurhVHrALcMYegqmegwWJ/HfZzn
         XuRKx27ZxvFS4v3GN0ibAepKW5UVup/rVnbI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741208138; x=1741812938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TN8E9XEAktH2/BlknMuwwP6SKex4SrVTEApM/n+g1SI=;
        b=xCnIPI7zQPdSnSjo0tXqZqGbtjK/PSZza3PKIwdu+rTuPQUhLsrtzieGBx2H3+f1cy
         D6MCFOox5pCxz1mmC2xtMQkr7XAaPZNFc6qKuWlhWV7lPm/g+gr+bF4cIDO8XMMQYPaG
         s+Stxx6XeI+9UINC5CCWuVXo8b2F+1e+cf34WxTxYYV/1EP4UC/xol1Y8cofAntPjbLX
         lW/cDmCetwNOnieCrL21K5QDkgl+HIC+PnBI/F6xkatzkqZmNunwWeR0H6igPKHWLG0l
         zhan+kRPiegJlH2jr3t93QTkHGy0f7Zz+T62T2dafHrPsH2NmPJ4bCMSdfYBtQnMd0br
         A9Sw==
X-Forwarded-Encrypted: i=1; AJvYcCW5rb2pS2vZC2eJSoXLl45bl//Z/uHaXKKAl2oqZ6D8bU4jwahgsB6bWC7NkCAl/9vuA9b8TsVya1wSwcz9@lists.linux.dev
X-Gm-Message-State: AOJu0YyKfT1JYNkw6+RPrpea09uMzrfpFI7CA+oIThh7mMHXjC3ln0hI
	N37U7eIqBnjxoVM/fTt1vfZqB7B6+k47ZzviQm1dF1/7NEOde6akQ8Pt3vrBFfE=
X-Gm-Gg: ASbGncvhyqUgI/AHWN+/NLN2zjE8hEhBAloxJElT9/c500W+XDIQbyBgoiMFFd/cxWp
	tSpFsDx/F1lUnWpDGEzjD+QjyLXKpkQBQsZ2TVPYJR3TWVo4Oyjwa8nK+o/gqFh0i+MazKmgtrs
	RU12Dr018t3VXcB9bfDtMZYu0hnbLOQfZiADsiJy86EZZlXeysw94EK7rNqrPXHq8RebANzkC2T
	Nn5v6pLaeUwKdZBTuciV3W/4lEqqhnTj6qNaDquBmS+BOrEsUhCe807psA/eK9j/02VTSFsT0IJ
	O+3pSGkWVdtWeKjyxVEWi7/oshQOEuhmjohKDU5InhgTuc7ajF/dJmg=
X-Google-Smtp-Source: AGHT+IFrK0wfx0wuMhLxEg3F3kYX4kOQtUjrt8xsLzF6cSSoaI3+ZeJj3tJLZ7Y1D69zwAQp2NcUtA==
X-Received: by 2002:a05:6e02:1c25:b0:3d0:19c6:c9e1 with SMTP id e9e14a558f8ab-3d42b8bf084mr52134995ab.13.1741208137900;
        Wed, 05 Mar 2025 12:55:37 -0800 (PST)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f086a996fesm2503730173.33.2025.03.05.12.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 12:55:37 -0800 (PST)
Message-ID: <c82318cf-39f2-4b08-9eb9-7e7a89fbb34a@linuxfoundation.org>
Date: Wed, 5 Mar 2025 13:55:36 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [brauner-github:vfs.all 205/231] WARNING: modpost: vmlinux:
 section mismatch in reference: initramfs_test_cases+0x0 (section: .data) ->
 initramfs_test_extract (section: .init.text)
To: David Disseldorp <ddiss@suse.de>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <202503050109.t5Ab93hX-lkp@intel.com>
 <20250305114701.28c0ee0b.ddiss@suse.de>
 <20250305235601.464f6432.ddiss@suse.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250305235601.464f6432.ddiss@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/5/25 05:56, David Disseldorp wrote:
> On Wed, 5 Mar 2025 11:47:01 +1100, David Disseldorp wrote:
> 
>> [cc'ing linux-kselftest and kunit-dev]

+ Adding David and Brendan

David, Brendan, Any thoughts on how this can be fixed?

>>
>> Hi,
>>
>> On Wed, 5 Mar 2025 01:47:55 +0800, kernel test robot wrote:
>>
>>> tree:   https://github.com/brauner/linux.git vfs.all
>>> head:   ea47e99a3a234837d5fea0d1a20bb2ad1eaa6dd4
>>> commit: b6736cfccb582b7c016cba6cd484fbcf30d499af [205/231] initramfs_test: kunit tests for initramfs unpacking
>>> config: x86_64-buildonly-randconfig-002-20250304 (https://download.01.org/0day-ci/archive/20250305/202503050109.t5Ab93hX-lkp@intel.com/config)
>>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503050109.t5Ab93hX-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202503050109.t5Ab93hX-lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>>>    
>>>>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x0 (section: .data) -> initramfs_test_extract (section: .init.text)
>>>>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x30 (section: .data) -> initramfs_test_fname_overrun (section: .init.text)
>>>>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x60 (section: .data) -> initramfs_test_data (section: .init.text)
>>>>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x90 (section: .data) -> initramfs_test_csum (section: .init.text)
>>>>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0xc0 (section: .data) -> initramfs_test_hardlink (section: .init.text)
>>>>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0xf0 (section: .data) -> initramfs_test_many (section: .init.text)
>>
>> These new warnings are covered in the commit message. The
>> kunit_test_init_section_suites() registered tests aren't in the .init
>> section as debugfs entries are retained for results reporting (without
>> an ability to rerun them).
>> IIUC, the __kunit_init_test_suites->CONCATENATE(..., _probe) suffix is
>> intended to suppress the modpost warning - @kunit-dev: any ideas why
>> this isn't working as intended?
> 
> Stephen Rothwell (cc'ed) mentioned that we might be able to use
> __refdata for initramfs_test_cases. The __ref* description in init.h
> does indicate that it's suitable, and I now see that it's present in
> kunit-example-test.c . I'll propose a patch which can be squashed in
> with the existing commit.
> 
> Thanks, David
> 


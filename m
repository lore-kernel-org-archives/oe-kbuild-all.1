Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F9C9461
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 02:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754533153; cv=none; b=sRVij/FEPFR6rKhuBjHKREW3uyfFJvPk3EPEdnYvWRPZvZePRmH5jqEfjYyxKuaUM/wSL6/DLLPCgDkMYJVjliH0EcxbvQdk83LKxtnhBkH9r/P00KUdndrFc5GEIAUomxIV+zj4peKhbu2T7GU9tghBuyOUEma4uXEJNJsUG9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754533153; c=relaxed/simple;
	bh=FgZn0ARQQS7XwZ3K8kkGoyAKS/jcRfRt37uxZJLcqKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNYNffBAGHXpFbBlykl6Dwuy8k313sSwL2MaXW5DHZzyYKHcZg3ICXMZAW3LUaMjVaX2y4+YD2B8IZ0ZcFMWcSHbWdPwu2RsCbdeJHVCEjdVlZFQNY5uCKlzi3pUqimCplCFWVxZNXd2u4JHne+AYpkUwtBrTkv9wGHnOvWtcUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=PXx3ofOj; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="PXx3ofOj"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b42254ea4d5so271570a12.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 06 Aug 2025 19:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1754533151; x=1755137951; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83sd6PCmkNwpnDM6Yeh1ANcUc7ticTzZNGY/Dmbpuig=;
        b=PXx3ofOjmrVtJ8SyYrQLZ01F360jfJQs0b8ZHBhZKsFeqJqLyA/ClZWnBuLQpJFXxF
         cJdK74rmoJpvsIWTd3k4sompr88vtIVdFmPQv9cBhbHW7Ija7mQzp2OHAFNiC4lAQUGH
         hu0X+zXXhgJesYub2s3eZP+8CZb06b5PxR0kPjAxLWPXwMbvauf0XqE6PNvLoz0EiUIW
         6kKQ3kh31UFsKai21V+BfI490Dns3aLZqmG50x4UG0xTAmzDe3eJHsZQvSSYCQ5I6Bb8
         u47P69+baC5JMfyM5dftjs5FtJzFkoH7zpkl66JqDLpseiPKnExhEiMf/kVB2aa7TMha
         xMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754533151; x=1755137951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83sd6PCmkNwpnDM6Yeh1ANcUc7ticTzZNGY/Dmbpuig=;
        b=RRcs5L2RtaTiIMMraQkJD3rBALjE4Tn16f+zkUoxyx+c0Ms5d2HrsMROiIETRNwYpY
         Y3HuAMghQuHfAg5QVdFG2n+nAviZf+VqJPGNRpJuk5TU2A1z/yAXq75ND0nqTHARLW69
         4C2nyDZHimgPHDM5RtV5qlVvuNXMWT64aEcS3OsHvxjmYDH+4ZZYaenBoJeC7dsf2Vef
         QuKHWU9UsQFl26GgKDTZ6xe93uivW+37s3SVxrlaNqX12vRrAW4eX8PaIxxxYJ9w2zEq
         Tr7A/gF0/dumvii75/BN62tG9p8cKO0McFxV3E+Yf6VfsWYKM5B4GnSZpgcpasWJAvjx
         sD+w==
X-Gm-Message-State: AOJu0YzNrNtjx8sYe2oRylV5qo0P+dWsIEqASKLhs6xVh1rcaFvq8L5f
	nVFio10FzSt74biVY7f6iJl7iTCbJ2v1bkt1nq5K1UL70earP9VCwIwyugSuhBnqg7c=
X-Gm-Gg: ASbGnct99Gb8By+JvK++VfmMlRmxrG6vOlWmtXc86j3S32oHud9Ei+F7b0Z5NgHvbfO
	5OE99NJpTCVqFze2KGdn+UX4mVZKb6J3/0q53qENvxj1dt/dZBUpAiyjGBVl+BqfCrR68RK5but
	a5PXMlok/jCW8Z5uHrTpdcMeyVQ0zHl6J4r19ziZQOUz+ibrjJ1T7CK3QQsLPQIIG5KG3focKrm
	3DZZyZj3DEvMDmyB5fWi89175U+tCPiossMF/H1lNlpeXaji/vsl7XgEL/d7gzl8kvs7gUAT+t+
	t0NaVSD84ycrmJ+iMdZtpAu5UtafudAlulM1r2Jx/kJzSvKt1oizwUIRwVZCUI0aXsUIoFaiA2N
	iABVZfjAXalKfOTUFg/Y9iXH40sZF0jk=
X-Google-Smtp-Source: AGHT+IHJkCOHPE4vj/BlDybTg1YsT19M7uHIHqiHIRYNEuidJTNydsrIVz6RcyzzfBLtxZFvDlsLFA==
X-Received: by 2002:a17:903:1a68:b0:235:779:edfa with SMTP id d9443c01a7336-242a0b3e4c6mr94146195ad.32.1754533150912;
        Wed, 06 Aug 2025 19:19:10 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e89769absm171958365ad.80.2025.08.06.19.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 19:19:10 -0700 (PDT)
Message-ID: <98e3bdfc-41ed-40b6-92df-4aacab3d92c5@kernel.dk>
Date: Wed, 6 Aug 2025 20:19:09 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] lib/sbitmap: convert shallow_depth from one word
 to the whole sbitmap
To: Yu Kuai <yukuai1@huaweicloud.com>, kernel test robot <lkp@intel.com>,
 akpm@linux-foundation.org, ming.lei@redhat.com, dlemoal@kernel.org,
 jack@suse.cz
Cc: oe-kbuild-all@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 johnny.chenyi@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20250805073748.606294-2-yukuai1@huaweicloud.com>
 <202508061722.0vTVFHLe-lkp@intel.com>
 <7d2b0108-4d16-97fb-5de9-7438414d9ca4@huaweicloud.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <7d2b0108-4d16-97fb-5de9-7438414d9ca4@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/6/25 7:30 PM, Yu Kuai wrote:
> Hi,
> 
> ? 2025/08/06 17:41, kernel test robot ??:
>> All error/warnings (new ones prefixed by >>):
>>
>>     In file included from ./arch/sparc/include/generated/asm/div64.h:1,
>>                      from include/linux/math.h:6,
>>                      from include/linux/kernel.h:27,
>>                      from include/linux/cpumask.h:11,
>>                      from arch/sparc/include/asm/smp_32.h:15,
>>                      from arch/sparc/include/asm/smp.h:7,
>>                      from arch/sparc/include/asm/switch_to_32.h:5,
>>                      from arch/sparc/include/asm/switch_to.h:7,
>>                      from arch/sparc/include/asm/ptrace.h:120,
>>                      from arch/sparc/include/asm/thread_info_32.h:19,
>>                      from arch/sparc/include/asm/thread_info.h:7,
>>                      from include/linux/thread_info.h:60,
>>                      from arch/sparc/include/asm/current.h:15,
>>                      from include/linux/sched.h:12,
>>                      from lib/sbitmap.c:7:
>>     lib/sbitmap.c: In function '__map_depth_with_shallow':
>>     include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast
>>       183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
>>           |                                   ^~
>>     lib/sbitmap.c:222:20: note: in expansion of macro 'do_div'
>>       222 |         reminder = do_div(shallow_word_depth, sb->depth);
>>           |                    ^~~~~~
> 
> /* The unnecessary pointer compare is there
>  * to check for type safety (n must be 64bit)
>  */
> # define do_div(n,base) ({
> 
> I didn't notice that under specific arch, do_div() will require the fist
> paramater to be 64bit.
> 
> I'll wait a bit longer for people to review the solution before I send a
> new version.

I think it looks good, so please do spin a new version with that fixed
as that's the only thing holding up the inclusion right now.

-- 
Jens Axboe

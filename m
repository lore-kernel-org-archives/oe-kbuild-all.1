Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0A22D052
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 02:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747620023; cv=none; b=iz60kPCaeYOuB6S8sHqyoe1rG1DOheF/cYvoqnqc3ElEP7x8baafWgWRpW7b0+uY+NTxUZD51H78THq4bwXqqntBFhx6u2nvY3Q9ubvjKxKb4SAHCIF3e5//lIL8+slJUCufn40JDx3asAox2j9f+BBZwvgIkpFC24NM9lRdksU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747620023; c=relaxed/simple;
	bh=K0ctd6c6g+PPNxp8K1jl0gpZGgonaKe3tr+Fj81gXmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W1etYzHt8H/Jlq3hGJIDd6nBka+GVj8rdYf/r2gCQIgjdkgot6tQ4tcEkxiHkvouUu/gg+YJDTIQLA06juHGlJJNkeu/3E3sYE+Z12JL4W2STPD0LQE1ZX6qTzMNLzsPnKKl8V70QCYTx9Nmr/wGZ2hzUw6tRbcF633UnU548DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=mSHWN3lA; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="mSHWN3lA"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747620010; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=pJkyOTZGJEW6toYCemFMD2pr1SIOHrqibFGbfzweaQ0=;
	b=mSHWN3lAW5v3G5pBmQ10rZAhsKVDRFepLBBqz6+qwGLD03XLK48gtUYu2X2e1stFBp1q+l0ciHTxnx+eLxIx8YEvgJhvFPt3eso040Kd0UtUdgSf+pA5TtVcT95b2llAMXTAtRUP42UW4BT/BwofvqNlplYZGcU95emF8x+YVnw=
Received: from 30.221.130.250(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Wb3oP-G_1747620009 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 19 May 2025 10:00:10 +0800
Message-ID: <e24e146e-ad6c-4ffe-88cc-3ab5368331bd@linux.alibaba.com>
Date: Mon, 19 May 2025 10:00:09 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xiang-erofs:dev-test 5/5] fs/erofs/super.c:659:22: error: no
 member named 'off' in 'struct erofs_device_info'
To: Sheng Yong <shengyong2021@gmail.com>, kernel test robot <lkp@intel.com>,
 Sheng Yong <shengyong1@xiaomi.com>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org, Wang Shuai <wangshuai12@xiaomi.com>
References: <202505190150.4HUHevyn-lkp@intel.com>
 <2faff963-c96c-4576-8680-a3e9b432aba5@gmail.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <2faff963-c96c-4576-8680-a3e9b432aba5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Yong,

On 2025/5/19 09:58, Sheng Yong wrote:
> On 5/19/25 02:06, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
>> head:   7cd18799175c533c3f9b1c2b2cb6551e2a86c921
>> commit: 7cd18799175c533c3f9b1c2b2cb6551e2a86c921 [5/5] erofs: add 'fsoffset' mount option to specify filesystem offset
>> config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20250519/202505190150.4HUHevyn-lkp@intel.com/config)
>> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505190150.4HUHevyn-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202505190150.4HUHevyn-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> fs/erofs/super.c:659:22: error: no member named 'off' in 'struct erofs_device_info'
>>       659 |                                        sbi->dif0.off, 1 << sbi->blkszbits);
> 
> Hi, Xiang,
> 
> dif0.off has already been changed to dif0.fsoff, shall I resend the patch to fix that?

Nope, I improved some description. Will reply in the thread later..

Thanks,
Gao Xiang
> 
> thanks,
> shengyong

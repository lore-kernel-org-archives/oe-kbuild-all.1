Received: from sg-1-33.ptr.blmpb.com (sg-1-33.ptr.blmpb.com [118.26.132.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F64525771
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 06:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769581015; cv=none; b=gzpqVSEUQI7zxPYA5TKEqeS0QqAh9squ4h+/4FUxUJlByycs+BNNYMHZ/F9SZAypuajOivwZfUZnWsP+zaEPw0VGdqfjpT5/jfcE1HH3oA7jKLICjUwgibl6KPiuQUFvkg6vgUnBdDJuIgUpS7bz1wyTYT+xa2Ic1bjdhDt8ibM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769581015; c=relaxed/simple;
	bh=b4sk0lHED+Z+CeQXx03ZQ7LkvoaVOnXQlzwmUPoI3Gc=;
	h=Mime-Version:In-Reply-To:To:Cc:Date:References:From:Message-Id:
	 Content-Type:Subject; b=psbX9zwR7aKox8pnV3OIvsC7vqD2fMhBX9+vTl6zovn9fib5xJDO/pD83RWzApcIuxt+JhWwUSyLKRFkU0q/vUSuKoVsCMecxcUFKuIBA4Fi/V2xGI1sufESlX3mQTC+0qjr5q/Fd0saNIcKtEObWnV+u95Lx0zose8JhEg32sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=picoheart.com; spf=pass smtp.mailfrom=picoheart.com; dkim=pass (2048-bit key) header.d=picoheart-com.20200927.dkim.feishu.cn header.i=@picoheart-com.20200927.dkim.feishu.cn header.b=lJQ4IM70; arc=none smtp.client-ip=118.26.132.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=picoheart-com.20200927.dkim.feishu.cn header.i=@picoheart-com.20200927.dkim.feishu.cn header.b="lJQ4IM70"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=picoheart-com.20200927.dkim.feishu.cn; t=1769580995;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=KrlLiF37NqMYWRbLlh61dgbOUBXwzkmE3ZzbveHTWig=;
 b=lJQ4IM70Au4fEHk/a18Qv1gdblt6TKgNiu2XyS/gR1ukv7VLP1bfdQHlu1Q2FBcUuwhjxL
 9zMjIRQDSH2QHhlJ2SCJoQai8w2JfF3Y7s9gEr6AD4pifisfaOeAh9FWbjDVHMOTTQEz5o
 FoeRdagtB5FoOEKHu8WXAV+XXFe7WAmUWKpsCSe4WMyeMguOD4veCpUQoGegk02ePe1r5U
 dCNE6Y1oLWto3sUTpGzvZ1vL8KNiJjLPhqw9HmAdEGeSMm4G46ikCtULoYY5ynNBE5eG9B
 4G/mz0qaOCSvLXHFYbidwmaKHLBG7HPRs6YamDcn1KEpLZGWeCU9bzKbKcmhhw==
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
In-Reply-To: <202601280311.eNqAnc4P-lkp@intel.com>
User-Agent: Mozilla Thunderbird
To: "kernel test robot" <lkp@intel.com>
Cc: <yang.yicong@picoheart.com>, <oe-kbuild-all@lists.linux.dev>, 
	"Will Deacon" <will@kernel.org>, "Zhou Wang" <wangzhou1@hisilicon.com>
Date: Wed, 28 Jan 2026 14:16:31 +0800
Received: from [100.86.224.191] ([58.250.106.103]) by smtp.feishu.cn with ESMTPS; Wed, 28 Jan 2026 14:16:32 +0800
References: <202601280311.eNqAnc4P-lkp@intel.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Message-Id: <4c5df94a-bc2e-4295-9eb8-5ca89337abe1@picoheart.com>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26979a9c1+3ec39e+lists.linux.dev+yang.yicong@picoheart.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-next:master 7854/9906] hwcap.c:1181:16: error: use of undeclared identifier 'HWCAP3_LS64'

On 1/28/26 10:45 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4f938c7d3b25d87b356af4106c2682caf8c835a2
> commit: 57a96356bb6942e16283138d0a42baad29169ed8 [7854/9906] kselftest/arm64: Add HWCAP test for FEAT_LS64
> config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260128/202601280311.eNqAnc4P-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280311.eNqAnc4P-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601280311.eNqAnc4P-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 4f938c7d3b25d87b356af4106c2682caf8c835a2 builds fine.
>       It may have been fixed somewhere.
> 

this seems to be an order issue.

HWCAP3_LS64 is introduced by 58ce78667a64 ("arm64: Add support for FEAT_{LS64, LS64_V}")
which appears after 57a96356bb69 ("kselftest/arm64: Add HWCAP test for FEAT_LS64")
on linux-next/master, so the whole branch build okay but failed if checkout to the latter
commit. (seems due to the branch merging order, the order is correct by `git log --oneline`
but if checkout to the latter commit, 58ce78667a64 is not in the tree)

> All errors (new ones prefixed by >>):
> 
>>> hwcap.c:1181:16: error: use of undeclared identifier 'HWCAP3_LS64'
>     1181 |                 .hwcap_bit = HWCAP3_LS64,
>          |                              ^~~~~~~~~~~
>>> hwcap.c:1316:16: error: invalid application of 'sizeof' to an incomplete type 'const struct hwcap_data[]'
>     1316 |         ksft_set_plan(ARRAY_SIZE(hwcaps) * TESTS_PER_HWCAP);
>          |                       ^~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/kselftest.h:64:32: note: expanded from macro 'ARRAY_SIZE'
>       64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
>          |                                ^~~~~
>    hwcap.c:1318:18: error: invalid application of 'sizeof' to an incomplete type 'const struct hwcap_data[]'
>     1318 |         for (i = 0; i < ARRAY_SIZE(hwcaps); i++) {
>          |                         ^~~~~~~~~~~~~~~~~~
>    tools/testing/selftests/kselftest.h:64:32: note: expanded from macro 'ARRAY_SIZE'
>       64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
>          |                                ^~~~~
>    3 errors generated.

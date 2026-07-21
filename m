Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0492D7393
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 02:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784601706; cv=none; b=k0DtXYiRwEhXWiaaBxHYu2TCr/TF9ySHwZLS4rvNmPsskQ6EfdbKv5lrwe6Ub1QBIdOC5P43eUqO3ZZF0bKhvVf20OfGtjAwIb3CmE3XlPPtn9V1YZx6XzgShaFwVAgN72kG+KeVTL0RiCwe72gaNpYyoatiQQFLQMpvlVOQ/QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784601706; c=relaxed/simple;
	bh=Xc5xP3RMK7JGcwdoG57AziGF0CUZfmOEMgGquXMwzmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AAf1BSSeU2a/cAqCAnmYAQMwnjsyS+runHOOwOioqN5Te0ec1JFP68ksRZ60bb00kUW65PywV/YFVfCNmrCRIDWmcdcyPH+ot05VdEt+6rcZA1UIje4smNfV8ITTjB+iPFLFyCbUi2DGlzoCOvKlwuauKgtg+s2s1gZhpmpOTcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Jh2QhN7S; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Jh2QhN7S"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bzyAHzOZk4wTL0GhNyRIUMEUd3XIHWrH/GrEF8jOUXc=;
	b=Jh2QhN7SUc8z2g2EYtOl184ldApmVVO8byVWKr3zrvb6AtmbI3lLfiC/LGHrwTxyaeT8XXnjy
	8lozdhVZ1YvSls0Tdo+pc/9gM3+mPkhKyTdo/alKk67JzElaafbQImrvtmFw363qgizbXVjDVHZ
	XPgGipjVn/xK4vsOJuQHLZA=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4h41cW4lJQz1cyTS;
	Tue, 21 Jul 2026 10:32:11 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 215414055B;
	Tue, 21 Jul 2026 10:41:32 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jul 2026 10:41:31 +0800
Message-ID: <928b341f-0a79-4c11-9af7-06497d1ecfd2@huawei.com>
Date: Tue, 21 Jul 2026 10:41:30 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] entry: Provide stub for syscall_enter_audit() when
 auditing is disabled
To: Thomas Gleixner <tglx@kernel.org>, <peterz@infradead.org>,
	<luto@kernel.org>, <linux-kernel@vger.kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, Sven
 Schnelle <svens@linux.ibm.com>
References: <20260720094921.537716-1-ruanjinjie@huawei.com>
 <87cxwhn09i.ffs@fw13> <87a4rlmrx8.ffs@fw13>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87a4rlmrx8.ffs@fw13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 7/21/2026 2:34 AM, Thomas Gleixner wrote:
> On Mon, Jul 20 2026 at 17:34, Thomas Gleixner wrote:
>> On Mon, Jul 20 2026 at 17:49, Jinjie Ruan wrote:
>> The .config in the report builds without problems with s390-linux-gcc
>> 15.2.0 (I verified that before merging), but fails with the version used
>> by the robot:
>>
>>    compiler: s390-linux-gcc (GCC) 13.4.0
>>
>> So that's a broken compiler and without understanding the actual root
>> cause we are not going to paper over it.
> 
> What's even more amazing is that the same config modified for x86/64
> builds just fine with gcc 13.4.0, while one would assume that the
> decision to uninline a basically empty inline would happen before the
> architecture specific backend is invoked. But what do I know. :)

Yes, I also couldn't reproduce this compilation issue on x86, so it does
appear to be a compiler problem.

> 


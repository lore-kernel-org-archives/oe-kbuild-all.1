Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D525394492
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 06:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769149410; cv=none; b=QP4OhGTTPsKU/2F8CshFT8sMDCvyrI6TnSPCjtlB8TAatx2EThENr8qHygG/ZZnKXy8Zf572JYa4iLjySztKNcCSB/7x7c0A7NQo9ZSlLhgTTn+zhjv4u22+OX4vdICZ3nNCoWZrKVC7qjxWEjcCrGVsUjY9eqD5z25dHwDpaJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769149410; c=relaxed/simple;
	bh=vncd6SV3JneYJo0GfT9zJ7wBNb51LADCHNXwgFgfEWg=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=go4eaN3oe0NW+NCgAwUgMbqu3iV6NwUOYuXKCM/Kua74IdlDq+IJQAj1Yqk3K80l6mW1wkzLB3AhAMjX11MXIR4kCy1FUaB1mEYomu+dm14p3JZoKLz/lV8BifVZHHVy+aeDn/wLYwNoV2VrXPda7gXMDdxNlqDDeoaSzhVA3Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=1DVL4SOT; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="1DVL4SOT"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GdDjpMtJaMtxsfKMwwQ9MmZp9yI8mEkOk82DglbID1k=;
	b=1DVL4SOTZysZoiqqOd2j1fbIMeAQFMQp7rfaipuCtqClyp2raTuipRBVMgyzg9f2x7/TdcgOa
	6yy8SAQ89dQ5Leju/sCP8gcZCgZ+BYw+YF/cp7WHFUz+TlVpHXwcgEPVnofmXf8gX/GzJZKybL2
	7H8ZdHgzqlQy+6xWhrDCdKE=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dy7752rs5zcb1V;
	Fri, 23 Jan 2026 14:19:13 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 08B662016A;
	Fri, 23 Jan 2026 14:23:14 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 23 Jan 2026 14:23:13 +0800
Received: from [10.173.125.37] (10.173.125.37) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 23 Jan 2026 14:23:13 +0800
Subject: Re: [akpm-mm:mm-new 279/310] memory-failure.c:275:49: warning: format
 specifies type 'unsigned long' but the argument has type '__fsword_t' (aka
 'int')
To: Andrew Morton <akpm@linux-foundation.org>, kernel test robot
	<lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, David Hildenbrand <david@kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>
References: <202601221142.mDWA1ucw-lkp@intel.com>
 <20260122093240.ef007fed49c166ae5ff256c1@linux-foundation.org>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <3116e4e5-c1cd-27e2-69b4-6bf0fc0347c6@huawei.com>
Date: Fri, 23 Jan 2026 14:23:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260122093240.ef007fed49c166ae5ff256c1@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/1/23 1:32, Andrew Morton wrote:
> On Thu, 22 Jan 2026 12:00:08 +0100 kernel test robot <lkp@intel.com> wrote:
> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
>> head:   dc4fe40a11269aead253fa0beb098b00417b8694
>> commit: ce9b369feafe8c65aa134b0c8791bf7f19e463e2 [279/310] selftests/mm: add memory failure clean pagecache test
>> config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260122/202601221142.mDWA1ucw-lkp@intel.com/config)
>> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221142.mDWA1ucw-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202601221142.mDWA1ucw-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> memory-failure.c:275:49: warning: format specifies type 'unsigned long' but the argument has type '__fsword_t' (aka 'int') [-Wformat]
>>      275 |                 SKIP(return, "unsupported filesystem :%lx\n", fs_type);
>>          |                                                       ~~~     ^~~~~~~
>>          |                                                       %x
> 
> Thanks.
> 
> I don't think we can rely upon libc's __fsword_t being `int' in all
> situations for all time?
> 
> We could add the typecast but perhaps it's better to change
> get_fs_type() to return int?

Yes, changing get_fs_type() to return int looks good to me. Will do it in v3.

Thanks.
.

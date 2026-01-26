Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7821F1D9346
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 06:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769408296; cv=none; b=oFW54fO6LmgAvFrt7nUj4m3VI/ihYymtBFyP3XFj+2qgAQR3/eZQ52B3xnih/fJ+U07988NHGSJL22TEs0iYZurNJRazBogHD3xgcPhrLxqgSNbKSUISQQtNcMasOYOhDjHAkscjxBgh5vUTCJ/KZpwFXVVQF0K3s1Hd+pCrI+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769408296; c=relaxed/simple;
	bh=U9hPQuXHgRmK3VIkkGhj3inooD1z8/+C9ndRWtR8JeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RvrTu/TqBoS3fPZiM+SEnsE373z0EoRcnxzMbXyKhDloU8yi6FHlgtW9OfPq/5u4aWbYWC6UIN8hy6Uk3WnI2h/Faz9KAw2uZ3ERFy74nSeo5H0wAcfXUMmyoIMsM5UYk0VJauP4kapCx9Etpk0sFvw974ktP8Gp9hr/aohAUN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=o2ayOHvz; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="o2ayOHvz"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZlcYUz/+tRYSRZN0pTwXnjquzX2fD83MfNZ/oQF/VBM=;
	b=o2ayOHvzYk9txp5htnv40gEuuu0Z9YG1HTzqcjQ1LlFoQbeMA5HDPNJNXrptDTS4sYN9/wea9
	5RZI7Se1pXTimHY1l5nZanHEC5RQAmQhD5XI5C4+qctrEMDHFS+YLGMClpI4zA3e8/QjphSd6Tq
	n324Z3Xe9JyDiVE9grLy44Y=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4dzytN4wwdzmVWP;
	Mon, 26 Jan 2026 14:14:36 +0800 (CST)
Received: from kwepemr500015.china.huawei.com (unknown [7.202.195.162])
	by mail.maildlp.com (Postfix) with ESMTPS id 08E974055B;
	Mon, 26 Jan 2026 14:18:04 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemr500015.china.huawei.com (7.202.195.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Jan 2026 14:18:03 +0800
Message-ID: <fc0761ea-913d-40b5-9bdf-1d10f148d96f@huawei.com>
Date: Mon, 26 Jan 2026 14:18:03 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5773/9539] Warning: fs/iomap/buffered-io.c:624
 function parameter 'private' not described in 'iomap_readahead'
To: Gao Xiang <hsiangkao@linux.alibaba.com>
CC: <oe-kbuild-all@lists.linux.dev>, Christian Brauner <brauner@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>, kernel test robot <lkp@intel.com>
References: <202601261111.vIL9rhgD-lkp@intel.com>
 <413ac550-ae70-4e38-be1d-4bd5e3be2447@linux.alibaba.com>
Content-Language: en-US
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <413ac550-ae70-4e38-be1d-4bd5e3be2447@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemr500015.china.huawei.com (7.202.195.162)



On 2026/1/26 12:01, Gao Xiang wrote:
> Hi Hongbo,
> 
> On 2026/1/26 11:56, kernel test robot wrote:
>> tree:   
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
>> master
>> head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
>> commit: 8806f279244bf300dca2c99735d5a51cd24b86df [5773/9539] iomap: 
>> stash iomap read ctx in the private field of iomap_iter
>> config: x86_64-rhel-9.4 
>> (https://download.01.org/0day-ci/archive/20260126/202601261111.vIL9rhgD-lkp@intel.com/config)
>> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>> reproduce (this is a W=1 build): 
>> (https://download.01.org/0day-ci/archive/20260126/202601261111.vIL9rhgD-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202601261111.vIL9rhgD-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> Warning: fs/iomap/buffered-io.c:624 function parameter 'private' not 
>>>> described in 'iomap_readahead'
>>>> Warning: fs/iomap/buffered-io.c:624 function parameter 'private' not 
>>>> described in 'iomap_readahead'
> 
> It seems the kernel-doc isn't updated, could you
> submit another iomap patch to fix that?

Ok, thank you to point it out.

Thanks,
Hongbo
> 
>   608 /**
>   609  * iomap_readahead - Attempt to read pages from a file.
>   610  * @ops: The operations vector for the filesystem.
>   611  * @ctx: The ctx used for issuing readahead.
> 
> ^ here.
> 
>   612  *
>   613  * This function is for filesystems to call to implement their 
> readahead
>   614  * address_space operation.
>   615  *
>   616  * Context: The @ops callbacks may submit I/O (eg to read the 
> addresses of
>   617  * blocks from disc), and may wait for it.  The caller may be 
> trying to
>   618  * access a different page, and so sleeping excessively should be 
> avoided.
>   619  * It may allocate memory, but should avoid costly allocations.  This
>   620  * function is called with memalloc_nofs set, so allocations will 
> not cause
>   621  * the filesystem to be reentered.
>   622  */
>   623 void iomap_readahead(const struct iomap_ops *ops,
>   624                 struct iomap_read_folio_ctx *ctx, void *private)
> 
> Thanks,
> Gao Xiang
> 
> 
> 
>>
> 

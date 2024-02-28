Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3316CDB8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709123239; cv=none; b=pigwlN3wEfljREpcrwg0zZExvE8xOD/aWKN6hLz5UCxzqSxfhcaBvlWGHZtgDhrWuoSTAXAfZqGEV6Pt1JyfWQFeV/PGpYfvlMdCNCOqKrpBDx7oKgr+3vzJeAssQQIfL1pthn/gkm+pqHWQiCbp0/nNEKiH8knNphDReHDGX3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709123239; c=relaxed/simple;
	bh=auP4vBT/4yUWt0VMsprcnKPwRtEdW40l/OzqpZS2H9w=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Mf/rTFRALYOptT5PrcwZnzN2TsZy1bKLHW04vvgZ75qpdlSsF5qDZvt8hOrcjPRrpiQqeMJuUureIGxLYnhPtAG25d5TqEMt0PQ6nNUqutU/CBqBAC1P3XxS3bRSP2f5tvGWVpW0VzUubRYeta3o1R2r7p6HfMpcxMRNAjkDUVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TlD844LqhzXhQx
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 20:25:08 +0800 (CST)
Received: from canpemm500005.china.huawei.com (unknown [7.192.104.229])
	by mail.maildlp.com (Postfix) with ESMTPS id AD7C41400C8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 20:27:13 +0800 (CST)
Received: from [10.174.176.34] (10.174.176.34) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 20:27:13 +0800
Subject: Re: [riteshharjani:ext4-iomap-v3 32/40]
 fs/ext4/inode.c:3620:undefined reference to `__divdi3'
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, "Ritesh Harjani (IBM)"
	<ritesh.list@gmail.com>
References: <202402242032.Btcxzwbw-lkp@intel.com>
From: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <7eda2a5a-de8e-4c4b-53f1-285d8f60e5aa@huawei.com>
Date: Wed, 28 Feb 2024 20:27:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202402242032.Btcxzwbw-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500005.china.huawei.com (7.192.104.229)

On 2024/2/24 20:31, kernel test robot wrote:
> tree:   https://github.com/riteshharjani/linux ext4-iomap-v3
> head:   9e716d325090913e86881adce749ee351757232e
> commit: 1c02dbf66a9f0526f0f55e4230419ad652e6fbe5 [32/40] ext4: implement buffered write iomap path
> config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20240224/202402242032.Btcxzwbw-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402242032.Btcxzwbw-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402242032.Btcxzwbw-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    microblaze-linux-ld: fs/ext4/inode.o: in function `ext4_iomap_punch_delalloc':
>>> fs/ext4/inode.c:3620:(.text+0x864): undefined reference to `__divdi3'
> 
> 
> vim +3620 fs/ext4/inode.c
> 
>   3609	
>   3610	/*
>   3611	 * Drop the staled delayed allocation range from the write failure,
>   3612	 * including both start and end blocks. If not, we could leave a range
>   3613	 * of delayed extents covered by a clean folio, it could lead to
>   3614	 * inaccurate space reservation.
>   3615	 */
>   3616	static int ext4_iomap_punch_delalloc(struct inode *inode, loff_t offset,
>   3617					     loff_t length)
>   3618	{
>   3619		ext4_es_remove_extent(inode, offset >> inode->i_blkbits,
>> 3620				DIV_ROUND_UP(length, EXT4_BLOCK_SIZE(inode->i_sb)));

Thanks for the report, it should be DIV_ROUND_UP_ULL, will fix it.

Yi.

>   3621		return 0;
>   3622	}
>   3623	
> 

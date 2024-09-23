Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A70EAF6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 06:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727073498; cv=none; b=AlhSJtI6ol2qykjFziYM1kY4U4fOyhTkG+Wv0d03FELP5EpkXgza7PWrjZHx+AQ13vba1et5JTIMIqlBfbuv9+YysMpu83p26OwgtCKQKyF8Cf5CsBBdVeBt6Des2Z5tFPXuYbiG46uv3UsvAujBCmi7kHCCrSnbOuHUWTOKeOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727073498; c=relaxed/simple;
	bh=LE5Y70/D+IdyXH+CLIcB0nN7fGObMqsBbkUoeTItoqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QeIK/s6EupfUEcB+ndKVZz1orDNFhLVZbA1IKiL2A4MdI8LjjSZrjWUtYAKB9/ej/XyhlHooEMlBeMLEg9mdEMco+QNyXaopVQuFHDUY/7BFcDHTO9pcYSho15B+yAQuSzmwYGitCpgjunAe4dFbXjLAThJsjurqtiI/UozP27c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XBtbQ2CzDz4f3kvg
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 14:37:54 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 288051A08FC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 14:38:11 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgAnqMTPDPFmNC9uCA--.34217S2;
	Mon, 23 Sep 2024 14:38:09 +0800 (CST)
Message-ID: <2bd9fdba-d916-4453-a0d9-a1a5b827a454@huaweicloud.com>
Date: Mon, 23 Sep 2024 14:38:07 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.10] bpf: Fix mismatch memory accounting for devmap maps
To: kernel test robot <lkp@intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
References: <Zu1QdPBf_QnYCxbS@3bb1e60d1c37>
Content-Language: en-US
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <Zu1QdPBf_QnYCxbS@3bb1e60d1c37>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgAnqMTPDPFmNC9uCA--.34217S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw15GrWUGw1kAFyDAr1xuFg_yoWxZrb_tr
	4j9F98G3yUJr4rKF48trsavrWkKFWkZr9Yqr4xCrWxGwnrJFn8ZF4agFyfZas7Xas5ZFyY
	gFyqqwnF9w4SqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbO8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU1CPfJUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/



On 2024/9/20 18:37, kernel test robot wrote:
> Hi,
> 
> Thanks for your patch.
> 
> FYI: kernel test robot notices the stable kernel rule is not satisfied.
> 
> The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3
> 
> Rule: The upstream commit ID must be specified with a separate line above the commit text.
> Subject: [PATCH 5.10] bpf: Fix mismatch memory accounting for devmap maps
> Link: https://lore.kernel.org/stable/20240920103950.3931497-1-pulehui%40huaweicloud.com
> 
> Please ignore this mail if the patch is not relevant for upstream.
> 

This fix only involves 5.10, other versions are no problem.


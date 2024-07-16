Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAF8199EA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721131045; cv=none; b=e+Bt6F65wm/lf8MeGXh0m5/J80yAdTJIlJY6KsE8di+l1jdocgpnry8tklMZse249aftO0rjUDBQy/Pd5afm7aWlgHdLR5SHjkRSc2Jowr2HVFdC9c6BLTDvaxHekoWLKreE7QUlKxpwhpMhppAXDKtHYtZDsNtD/Uf2ZX5L+Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721131045; c=relaxed/simple;
	bh=Fzlp7BXlI2w/dkw4Cs708AeznDIB0k1NZJFN7x24Mx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=keWdDJYaYyAb1rU1a+tdIqM8x/zYQMjwUn5aHRwYrmZ93dSw1LESNgzgl6Pqq/yFuTT9O0tEuEgSoaungTgcGhmNoc50DHo8ZlE6jOGv2ityI2qSoVyPsLEp3z1jjZdskQClmK8YcLEMcHBCvuu65ER3UAvwdvcyiCZ2iuoyvw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4WNcxc1lg4z4f3jMs
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 19:57:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 38DBD1A0572
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 19:57:20 +0800 (CST)
Received: from [10.174.177.174] (unknown [10.174.177.174])
	by APP4 (Coremail) with SMTP id gCh0CgCHaTcbYJZmFcUsAQ--.57185S3;
	Tue, 16 Jul 2024 19:57:18 +0800 (CST)
Message-ID: <a449f888-38e8-4d9d-8a69-78ce8c839dbb@huaweicloud.com>
Date: Tue, 16 Jul 2024 19:57:15 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6/6.9] ext4: avoid ptr null pointer dereference
To: kernel test robot <lkp@intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
References: <ZpZHPWgCV-J8oKXR@6724a33121ae>
Content-Language: en-US
From: Baokun Li <libaokun@huaweicloud.com>
In-Reply-To: <ZpZHPWgCV-J8oKXR@6724a33121ae>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgCHaTcbYJZmFcUsAQ--.57185S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKF4rtrykKryxXFy8Kr1xKrg_yoWxtwb_Kr
	1UKa9xGrW8Jr4vka1jyrsavr1kKr98Xr95Xr4IyrW2kwnrtFy5ZF43WF9xZ3Z7Z39Y9F1Y
	9FyqgF1qgr1a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbO8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267
	AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80
	ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU1wL05UUUUU==
X-CM-SenderInfo: 5olet0hnxqqx5xdzvxpfor3voofrz/1tbiAQAGBWaWLvsVtQABsG

On 2024/7/16 18:11, kernel test robot wrote:
> Hi,
>
> Thanks for your patch.
>
> FYI: kernel test robot notices the stable kernel rule is not satisfied.
>
> The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3
>
> Rule: The upstream commit ID must be specified with a separate line above the commit text.
> Subject: [PATCH 6.6/6.9] ext4: avoid ptr null pointer dereference
> Link: https://lore.kernel.org/stable/20240716092929.864207-1-libaokun%40huaweicloud.com
>
> Please ignore this mail if the patch is not relevant for upstream.
>
This patch does have nothing to do with upstream, so please ignore it.

-- 
With Best Regards,
Baokun Li


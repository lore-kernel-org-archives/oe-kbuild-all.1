Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C1313777E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 01:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766452577; cv=none; b=PVVtF4a4EyqvsDAxcGRfcf72Hz/6jZHhe1pM1KsOf5ZvLbo9AONYcwaYX4zXVODVDYU8mSB8ycEW9HMMIVzzp1xLj/sAqNKXlSPulQi2cPmq9br2jzrQs67+i/izEEk/8RrM1ghFRqHnWa8reUbryFNE6stEcDR11j/6mEce5gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766452577; c=relaxed/simple;
	bh=/Y4CADJQ2/1H7FtDt9gGt2kugpPxJDUInPGbykEBk3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxhPUAAyUHkYdZnhPpNsuEdYzPGN+Kuno/E5S8iyabq9WKzfHbjpPeB0hXDhQwQ1tBZX5XZTRFVKaLOKE4h0Qt02o8V3nwmemrA/CakniPpBmhYStnurkQfo9YvJa06Qen6TCWXN9hoKMnMLJNow92yLiaHG7F2cU2cJJ3TMw4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=none smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dZxs31QVzzYQtH8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 09:15:35 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 5F1384056D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 09:16:11 +0800 (CST)
Received: from [10.34.206.51] (unknown [10.34.206.51])
	by APP4 (Coremail) with SMTP id gCh0CgAn1fVW7UlpyIyZBA--.24819S2;
	Tue, 23 Dec 2025 09:16:07 +0800 (CST)
Message-ID: <b010db20-d044-4ecf-bb87-af580e4c0f07@huaweicloud.com>
Date: Tue, 23 Dec 2025 09:16:06 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mm/hugetlb_cgroup.c:829:44: warning: '%s' directive output may be
 truncated writing up to 1623 bytes into a region of size between 32 and 63
To: kernel test robot <lkp@intel.com>, Xiu Jianfeng <xiujianfeng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202512212332.9lFRbgdS-lkp@intel.com>
From: Xiujianfeng <xiujianfeng@huaweicloud.com>
In-Reply-To: <202512212332.9lFRbgdS-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgAn1fVW7UlpyIyZBA--.24819S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKry5Zr4UZr17Xr13Jw4fKrg_yoWkZrgE9r
	13KrykCrWktFs09w4vgrnI9r9aka45tFyrKw18K3y3uwnxZw48uFZ3CF98uFn3t3WvgrZx
	C3ZxJ3sFqr1YkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jjVbkUUUUU=
X-CM-SenderInfo: x0lxyxpdqiv03j6k3tpzhluzxrxghudrp/



On 12/21/2025 11:23 PM, kernel test robot wrote:
> Hi Xiu,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9094662f6707d1d4b53d18baba459604e8bb0783
> commit: 47179fe03588caa13a9bae642b058901709ddc55 mm/hugetlb_cgroup: prepare cftypes based on template
> date:   1 year, 6 months ago
> config: s390-randconfig-001-20251220 (https://download.01.org/0day-ci/archive/20251221/202512212332.9lFRbgdS-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512212332.9lFRbgdS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512212332.9lFRbgdS-lkp@intel.com/

Thank you, the fix patch is on the way:

https://lore.kernel.org/all/20251222072359.3626182-1-xiujianfeng@huaweicloud.com/


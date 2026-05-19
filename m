Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027081DF751
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 01:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779154354; cv=none; b=rfwvfrAY0LInIidrIWXVVO3ufJ2F3gECiz/ZVk5lLkYemo/QlTUI5W1pkIQXo0Pisgnl+btQm2gkNsYFKc5rzoqv2YIywFvmV5aaak42Rz2yFF/eH0SdaYdArgUbp6OahJefs4X/92wnfVSwJZdh+V/73qrlSslCeJYg76kJFCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779154354; c=relaxed/simple;
	bh=iV1i0G0bppln8d4B8SKVPlyXtGIXA1Tr+ZyQwIfg0vk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CR+OZpTMZnEEdrv/mISURrXteeU7hYjShldnNNY/v0Dq6ZYkuFBqTOaxfKwHtmCdvoAjFmtojRqv7wOGZkE2Kczj/v8e3t6FBl4xcLaAjUzmTzW/Vypp7zas9odXoOHYg85VUWP6h28mFhQb9eMnnm+xt23z5z90PKgdKWBlYkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=N6PM9O4s; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="N6PM9O4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=OWpYAhW0JXdOUvR+Dvbc7KSNWg+4ZO2XM2Dk3cbW2Lo=;
	b=N6PM9O4sC+092kV1wZNsvPiwgdIfImNjBYh36JiHMs4nsH6DtqC4ZAIVIR5KV1
	BE7VWNc5LwmAZYRER6INFCzk4Tbcojf6NiXrzUYWAMKWUbb8q/VNhPaU4oaXUGaV
	utSFHlnapDT85NBjn/hmXfqkWhKJ1G+LirFcZd/fiQe2E=
Received: from [192.168.111.49] (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3n_+EvQtqIslhCA--.24207S2;
	Tue, 19 May 2026 09:31:50 +0800 (CST)
Message-ID: <5e8cba85-1dcb-42ab-9f2d-edbb6f0c92c0@163.com>
Date: Tue, 19 May 2026 09:31:48 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: =?UTF-8?B?TW96aWxsYSBUaHVuZGVyYmlyZCDmtYvor5XniYg=?=
Subject: Re: [PATCH v1] mm/shrinker: simplify shrinker_memcg_alloc() using
 guard()
To: Andrew Morton <akpm@linux-foundation.org>,
 kernel test robot <lkp@intel.com>
Cc: david@fromorbit.com, qi.zheng@linux.dev, roman.gushchin@linux.dev,
 muchun.song@linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260512085546.368911-1-18810879172@163.com>
 <202605151100.lH0pRo2I-lkp@intel.com>
 <20260518173607.c250f771be2baf92fa471b2d@linux-foundation.org>
From: wangxuewen <18810879172@163.com>
In-Reply-To: <20260518173607.c250f771be2baf92fa471b2d@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n_+EvQtqIslhCA--.24207S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWxKr4xAr1ruF15GF48Zwb_yoW8KF4kpa
	15ua9xKr45Xr1rWa1xCFsFv3Z8Kw4kW3sxWrs5Gr13ZFWavF17urs29r4Yvr9F93WvkFyx
	JryYqry0y34jy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRr-B_UUUUU=
X-CM-SenderInfo: rprymiyqyxmiixs6il2tof0z/xtbCzQnu5GoLvYnp9wAA3F

Hi all,

Thanks for the notice.
I have already removed the unused ret variable in my v2 patch to fix 
this compiler warning.This problem only exists in the old v1 version, 
and the v2 patch has fully resolved it.

v2 patch link:
https://lore.kernel.org/all/20260513075214.2655710-1-18810879172@163.com/

And this revised v2 has been merged into mm-new branch already.

Thanks,
Xuewen Wang

在 2026/5/19 8:36, Andrew Morton 写道:
> On Fri, 15 May 2026 11:15:40 +0800 kernel test robot <lkp@intel.com> wrote:
> 
>> Hi wangxuewen,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on v7.1-rc3]
>> [also build test WARNING on linus/master next-20260508]
>> [cannot apply to akpm-mm/mm-everything]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/wangxuewen/mm-shrinker-simplify-shrinker_memcg_alloc-using-guard/20260515-014803
>> base:   v7.1-rc3
>> patch link:    https://lore.kernel.org/r/20260512085546.368911-1-18810879172%40163.com
>> patch subject: [PATCH v1] mm/shrinker: simplify shrinker_memcg_alloc() using guard()
>> config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260515/202605151100.lH0pRo2I-lkp@intel.com/config)
>> compiler: sh4-linux-gcc (GCC) 15.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151100.lH0pRo2I-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202605151100.lH0pRo2I-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>     mm/shrinker.c: In function 'shrinker_memcg_alloc':
>>>> mm/shrinker.c:218:17: warning: unused variable 'ret' [-Wunused-variable]
>>       218 |         int id, ret = -ENOMEM;
>>           |                 ^~~
> 
> Something went wrong here - that patch *removes* this definition of
> `ret'.
> 
> https://lore.kernel.org/20260513075214.2655710-1-18810879172@163.com


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BCCB660;
	Mon,  5 Feb 2024 05:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707110608; cv=none; b=lIAD+CTe5A6ttUdW02nMHRbCi+3xbmQl8vPz1SLiQwoqjkaUDYvjq459E0Z0HxZ3DhRHNldyffeAv0+t13CC4Y1VqzskJwOgMacNwggGIHguId757zmysk6Jhb+QYSptfRTvQPfPR5LEBGuvdke0UMmZz7jQiz8SNpa20tlyOxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707110608; c=relaxed/simple;
	bh=prlwA5w2qf87u6rAD/ATz2oVyd+KOUEKb4OxVAzbS/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGWVzfzVbrT1FiU6KN0nvWozGVtAbVxdvMmXPCiOXtgvn9fKM3ezYneoB6SgAEF01xaNGyW2a1tT4ZZpNuH5FHZDZCP5RFw87VnPNlQNNz3W9sTDRY8mY1af4IJpjEe7n+OHlEBFZtoPVgrv/Jy/mrLcx7cFUM9qZI75KmyUows=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1PDd76ty; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1PDd76ty"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4tWv99uKGxmgMTlEFGV+P83mtbmflB+8E6FVcjsT02U=; b=1PDd76ty1V/eH7XfR1d6rGEVwD
	dYQmL34SFoJQS+05lcpVdk3/nF6gKoKZX2xiTIDgWaEa7qBNg45gjChAri1Wd25yLJu/NnkBEtM9I
	jxFefmoIqhrrmpjqLuG3ZRu7UdViz8TfRUbivdEQQjl39mFUY37TcdmdjHQxAI0TlK3sAA9QFH1b/
	fGf2q9noGgNq6cW3UwLyklrOmFOV821eToHxhh/boD9XW9NkRwgJiKFaokQy9A9Gzvhl2yI7uWjxt
	ikbIBjvXcOk/aNAlLANbTBgvDQuVu3B7jqxl0xzsAXuKkOKdIyq5wzDOS0zH+N+OOGPtjYs+KQsFp
	64PSgiQw==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWrS1-000000024LJ-0ZOz;
	Mon, 05 Feb 2024 05:23:25 +0000
Message-ID: <583ee3ad-6f58-496d-b67d-2ffb30529aa6@infradead.org>
Date: Sun, 4 Feb 2024 21:23:21 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 12610/12662] htmldocs: Warning: file
 Documentation/ABI/testing/sysfs-platform-silicom#20:
Content-Language: en-US
To: Yujie Liu <yujie.liu@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, linux-doc@vger.kernel.org
References: <202401070202.BQvPxgyp-lkp@intel.com>
 <97f7e278-725b-4453-aae9-6a80664920c7@infradead.org>
 <23509de3-beab-4afd-b76f-4d675797e7d7@redhat.com>
 <7531b72b-e44b-4135-85db-2c75c4805c2e@infradead.org>
 <ZcBuDHWVO1LghgER@yujie-X299>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZcBuDHWVO1LghgER@yujie-X299>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/4/24 21:11, Yujie Liu wrote:
> On Sun, Feb 04, 2024 at 07:40:12AM -0800, Randy Dunlap wrote:
>>
>>
>> On 2/3/24 23:21, Hans de Goede wrote:
>>> Hi Randy,
>>>
>>> On 2/4/24 02:26, Randy Dunlap wrote:
>>>> Hi ktr,
>>>>
>>>> Sorry for the late reply.
>>>>
>>>>
>>>> On 1/6/24 10:13, kernel test robot wrote:
>>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>>>> head:   e2425464bc87159274879ab30f9d4fe624b9fcd2
>>>>> commit: f24945c77ed4c57b602632b9e3cbf5752e202a6f [12610/12662] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
>>>>> reproduce: (https://download.01.org/0day-ci/archive/20240107/202401070202.BQvPxgyp-lkp@intel.com/reproduce)
>>>>>
>>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>>> the same patch/commit), kindly add following tags
>>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202401070202.BQvPxgyp-lkp@intel.com/
>>>>>
>>>>> All warnings (new ones prefixed by >>):
>>>>>
>>>>>>> Warning: file Documentation/ABI/testing/sysfs-platform-silicom#20:
>>>>>
>>>>
>>>> but what was the warning or problem here?
>>>> I don't see it.
>>>
>>> This has already been fixed by:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41237735ccde2cc3fe1d83ae0b776a085be6a22f
>>
>> Hi Hans,
>>
>> I was trying to understand the incomplete warning message...
> 
> Hi Randy,
> 
> The warning message is:
> 
> Warning: file ./Documentation/ABI/testing/sysfs-platform-silicom#20:
>         What '/sys/devices/platform/silicom-platform/power_cycle' doesn't have a description
> 
> Sorry for the incomplete info in the report. We will fix the bot ASAP to
> show full message.

Thanks for the explanation and fix.

-- 
#Randy

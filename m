Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF09E225AA;
	Sun,  4 Feb 2024 15:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707061224; cv=none; b=spn/U1dAKzAmZYXUitDwkP1mWohm+Tt2vwPJrqKAnh6fdGsYzgWNNqFg2VAyCpibPzEHhF8iUOHTqpUFRK9/tvobqBNbDVtXmmtnKYVjmTe4W9XhtT1uG85jzvkdfCquJsVS290cZgQ9JilytKmsTbJt8SrjvGaKvthY2ckoyvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707061224; c=relaxed/simple;
	bh=2EvkgALGcToD6260SXQurF+v/lAKqYPlYYhKIGObQAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p4mbJsE3k5N/mUrhrkiO3dJLEmtakZUIN+CZTjaYgevJ4rdb6Q8g3nNQRPHm34CB0wgEKrYj4Ogm6lwPh/1CQxi4bNO11qeEDsg+MCbVqlnpaVoHNx16MtBLX7KQswHq7XftBkxsp55xL0Xrv84rZuaBINT/kdAKyAwRLiBbsGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uPiwcQj0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uPiwcQj0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=W0msZcEJ+t9nTsjWnaj57/Vi4XqPL4hKO6bHA7TAcok=; b=uPiwcQj0YSXa3jlk7aT2ywFFJh
	X5Lw84Q6RQou+PYtmuh6xBAPmqghtcjkk9292TgVnTj4RhcEIwx9KaibyR21ZNJYr35vPxo4DghVE
	FHEIexZzXxXI0yCYTUW7xd8N8GEtVxR0f71c7tgvsv4iEJFZft84Cqmus1eNE3dSzgdVYB4seKvdC
	quPlAoMCKpwUfviTVDo7LmaxJbptFdQSLZ/inR8qFh0oM34o9Do+CcKgPZXzBXbJoSczGaD3NfG+H
	AujcV2z1hPKt4PfIkbawa0YXOSuq9q0b/PsRch83vw4Xl/JBBMYB+pQwvdurd5AE5H14NOWL4Nfly
	qOUcaL6Q==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWebM-000000014EQ-3Vb4;
	Sun, 04 Feb 2024 15:40:12 +0000
Message-ID: <7531b72b-e44b-4135-85db-2c75c4805c2e@infradead.org>
Date: Sun, 4 Feb 2024 07:40:12 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 12610/12662] htmldocs: Warning: file
 Documentation/ABI/testing/sysfs-platform-silicom#20:
To: Hans de Goede <hdegoede@redhat.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, linux-doc@vger.kernel.org
References: <202401070202.BQvPxgyp-lkp@intel.com>
 <97f7e278-725b-4453-aae9-6a80664920c7@infradead.org>
 <23509de3-beab-4afd-b76f-4d675797e7d7@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <23509de3-beab-4afd-b76f-4d675797e7d7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/3/24 23:21, Hans de Goede wrote:
> Hi Randy,
> 
> On 2/4/24 02:26, Randy Dunlap wrote:
>> Hi ktr,
>>
>> Sorry for the late reply.
>>
>>
>> On 1/6/24 10:13, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   e2425464bc87159274879ab30f9d4fe624b9fcd2
>>> commit: f24945c77ed4c57b602632b9e3cbf5752e202a6f [12610/12662] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
>>> reproduce: (https://download.01.org/0day-ci/archive/20240107/202401070202.BQvPxgyp-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202401070202.BQvPxgyp-lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>>> Warning: file Documentation/ABI/testing/sysfs-platform-silicom#20:
>>>
>>
>> but what was the warning or problem here?
>> I don't see it.
> 
> This has already been fixed by:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41237735ccde2cc3fe1d83ae0b776a085be6a22f

Hi Hans,

I was trying to understand the incomplete warning message...

Thanks.

-- 
#Randy

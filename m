Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0DB30BF70;
	Mon,  2 Feb 2026 21:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770069470; cv=none; b=pPACSSn2MJJoyF7pOpMVcx2IHxLgY1ARK3XQabVeUrjOSe1FWWbSduCWFvGP0wRU7cgeXW6JursvFUyAf/DVp9PwhuCVXPYBOCHnB5jKhi/leUJWaxwGfT89cb6EdE8CKRlLlFYQy+hBFtoJKlHFhk+K6J+uvekDbzyk6Lb6uBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770069470; c=relaxed/simple;
	bh=P56i96NRuYLl+79Mae849MLDf3tpfWekmMXgt9RJ3Mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwUd3YsoNcMYdBba2bC/qYNNov9WdDc/tbCiO3kkZEWDEemK6XWPktc2zyBgEO4Zz+GJ/cw6NnoWjQ0bYhdRK/BD2UUnsbY88HtJjJzYBf/7w3p1YW9Ps6E2Y5zOkjBLW4pdcL5PtTn3UwHCK+LLEv7mVxl8Pltn6XrUpbyDNlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=StVsix6b; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="StVsix6b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=OAFAKZ+dErA1HvBk9m+TneK1sY+noADf94ivapgmRWo=; b=StVsix6bfK9GPsxlABYwBkEIWA
	J3hNaUSzrxCOv8YfWalpwuA3eDxo+YehVRmRaoDwia7pEnmFcI40ld6we10c0UUIN5YRkhGsr2DbF
	YERRctAvOGtyET4nS/wjVD3j4AXWUniGW+qW0Rh3r1A2IK34+e/WJ8Fxa3//m05bJ+nMNqCUXmF9R
	xPGRMh9Sf+VwxqBRTe7BTe60eXhJkiHVaaBq2Bz996+rxQMzigN8Vc3NjSLAT3KkPKr54MLrjGEhW
	IfHVMNHetLjU2K1+uEcOdEabcLib3TOVYl6vkLvVlqMuOLsPvemCypDtX+NQZecF9iAgp1zKiUT1N
	zKYVVGDw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn1vW-00000005gDL-3kCW;
	Mon, 02 Feb 2026 21:57:46 +0000
Message-ID: <0d0b90c1-db32-4eab-98c2-9bb46cea7a8d@infradead.org>
Date: Mon, 2 Feb 2026 13:57:46 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: htmldocs: Documentation/driver-api/tty/tty_port.rst:65: WARNING:
 Document or section may not begin with a transition. [docutils]
To: kernel test robot <lkp@intel.com>, Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <202602022007.fALe9bGB-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202602022007.fALe9bGB-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi k.t.r.,

On 2/2/26 11:45 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   18f7fcd5e69a04df57b563360b88be72471d6b62
> commit: 00d95fcc4dee66dfb6980de6f2973b32f973a1eb docs: kdoc: handle the obsolescensce of docutils.ErrorString()
> date:   5 months ago
> reproduce: (https://download.01.org/0day-ci/archive/20260202/202602022007.fALe9bGB-lkp@intel.com/reproduce)

I cannot reproduce this warning.
What version of docutils do you use?

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602022007.fALe9bGB-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    WARNING: No kernel-doc for file ./include/linux/tty_port.h
>    ERROR: Cannot find file ./include/linux/tty_port.h
>    WARNING: No kernel-doc for file ./include/linux/tty_port.h
>    ERROR: Cannot find file ./include/linux/tty_port.h
>    WARNING: No kernel-doc for file ./include/linux/tty_port.h
>>> Documentation/driver-api/tty/tty_port.rst:65: WARNING: Document or section may not begin with a transition. [docutils]
>    ERROR: Cannot find file ./include/linux/tty.h
>    WARNING: No kernel-doc for file ./include/linux/tty.h
>    ERROR: Cannot find file ./include/linux/tty.h
>    WARNING: No kernel-doc for file ./include/linux/tty.h
>    ERROR: Cannot find file ./include/linux/tty.h
> 
> 
> vim +65 Documentation/driver-api/tty/tty_port.rst
> 
> 3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  61  
> 3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  62  .. kernel-doc:: include/linux/tty_port.h
> 3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  63     :identifiers: tty_port
> 3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  64  
> 3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26 @65  ----
> 3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  66  
> 
> :::::: The code at line 65 was first introduced by commit
> :::::: 3f19fed8d0daed6e0e04b130d203d4333b757901 Documentation: add TTY chapter
> 
> :::::: TO: Jiri Slaby <jslaby@suse.cz>
> :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 

thanks.
-- 
~Randy


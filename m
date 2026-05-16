Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5A52AD10;
	Sat, 16 May 2026 01:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778896016; cv=none; b=ZKgF3iNqTNmlif3fkiZgDEdOiwmISz8VUOKXJbTwrtGuebSB/Irzt+EbO6tSvNigtb0+MAGwnLQDHYIXXAejscclQOLYQ/i4YNa4X9syT3kn8Yr5AyifTCwB9k7yKNgjJ7QbdDdSygaO2RIK1wHgjsq0/sUrQL2sFZxdel+4rHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778896016; c=relaxed/simple;
	bh=Ky6IUlNMBLAy04K7RjIF1nK1tt4hr+KDuPI3+71Lwhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iciiRBL5oM8xvIUkCBdSU9eJF8ZmAb9HQBtL4c6WJwKUXAr0TxNqaYwuWjZHEc8XVuy15ljN1UZFIOkUjekXWW7NUVkPVe5FZIGrmH8HSqx3AkP5JLO5pmDdxpPCK1g3ztFb5f8NuEqWMQOpgZYiMjD01MeCMwcYpE2N5WWoo6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=zJKozhlW; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="zJKozhlW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ed8klWxLK7ZDNTr83IcZ6gNh9I//eWXUIAAE+5DNeH4=; b=zJKozhlW2w/ukfRtCz+h/Lq7HF
	sg3C7cm3hN+fYReEnXwL5gLIZNHqu+AGjtUC1OWvCCpKdsE8zXfy3ZnUqXhK0Al08senDKZ2diJUa
	Zl4Tb2sG3lWW/NtQNFCT1STFwBgaKbPTqGXv95U++yCmv7VWBNHZ+fx/qotiOezYmU+voEPpGaUEo
	AhJ3azY1lFGihfBS7W9V462Dk2MdzXm6M67WRtpCGnN/G7MR99ZwZ3HqbMPiy91rT//+dogHgLat/
	F2mbJ+jLy8gqlMWBc/RPQVNFjJESVfX0kTz+yCrd7K4vzyAXTiP7k3IK12Q/pPUvtz0YhvAGfRlRT
	NSt50Tkg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO47A-00000009uB9-1yAy;
	Sat, 16 May 2026 01:46:52 +0000
Message-ID: <933369dd-727c-462c-babc-16019365ec71@infradead.org>
Date: Fri, 15 May 2026 18:46:50 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3552/4394] htmldocs:
 Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst:1: WARNING: Title
 overline too short.
To: kernel test robot <lkp@intel.com>,
 Linlin Zhang <linlin.zhang@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Mikulas Patocka <mpatocka@redhat.com>,
 linux-doc@vger.kernel.org
References: <202605160214.wOV5aa0q-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202605160214.wOV5aa0q-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/15/26 5:44 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
> commit: b4a0774bd7fd859c1d243be0919c8df39eac20c0 [3552/4394] dm: add documentation for dm-inlinecrypt target
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260516/202605160214.wOV5aa0q-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605160214.wOV5aa0q-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 

>>> Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst:1: WARNING: Title overline too short.
> --

>>> Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst: WARNING: document isn't included in any toctree [toc.not_included]
> 
> 
> vim +1 Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst
> 
>    > 1	========
>      2	dm-inlinecrypt
>      3	========

Patch already available:
https://lore.kernel.org/linux-doc/20260512180409.1193504-1-rdunlap@infradead.org/


-- 
~Randy


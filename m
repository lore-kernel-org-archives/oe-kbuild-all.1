Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326CF8F4A;
	Wed, 27 May 2026 00:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779840990; cv=none; b=nOPFS8JXyB/ZVrO0vg7bSMOLGHH2+sct9gFV2zG5SIuDbYpCtcnZDsu0uY4Xp7n7iKOxON9HydJfD29ko76yo2Cs49nQWmvMfSaX5gpE4cBN73Ql8n7gxyGFHRcb1FRY787RSvK3q+wBu1CBc5fkyA8Kpg0bTP02F18pC758oHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779840990; c=relaxed/simple;
	bh=wnkKsU+u+788XORjEb0Dt7tHGir3ziOXFgN7E2/8xbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blgAtXW0D97IuX+WpcCCi9SPnVaNyufqBxjd1A++vscduwLY2ECr2apQqzFcpIuEuGcBYP2vGVriiYHbehdZmlLjkwfalHPT+GRxgEc4XW4ivA2lKAxhX5Z2m5SDQLYvGG4Cr2zKjDS7LfsEmhUFQtZLr9b3tkVwqV4N/GJUQ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vGKfW3nP; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vGKfW3nP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rGegtaSUwAxZyx7Dn39EFFabUoxoUYpovU8pmIaK834=; b=vGKfW3nP+Mh7edQDCNU+VruhZT
	67/iC07xVptkUYMHn8RWXIaxtbmEKGpMcvVtvvSsd8RxNEZ3j9v3q2VvO2WWKMSllUg+SUE6XqOe/
	Jhlj0zKeEvtdGEFO1AfN7lXFDPr4EKWR1av76trX3eB+/MHJd+WqAYgdETu6tLTbzjfMpkQ7kuGty
	UP7XhhD9Mn/MTOsjkbaBfZN8XXB4+tz63rvFxqhkmHitig5lu4+rFm4OX6+EQFSqepge6Z4NNXkiX
	O0f0niilD/pSOMldfrgMXESslAmVB03gbqkfp3W5lFNlJRioZD2icp6waHS8DvGjnuWId1Hp1vGSz
	5VOVsCuw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS1wW-0000000354z-2c4g;
	Wed, 27 May 2026 00:16:16 +0000
Message-ID: <3d1a68b0-93a4-408c-ad2d-a4556e2191f9@infradead.org>
Date: Tue, 26 May 2026 17:16:15 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mtd:spi-nor/next 20/28] htmldocs:
 Documentation/driver-api/mtd/spi-nor.rst:216: WARNING: Block quote ends
 without a blank line; unexpected unindent. [docutils]
To: kernel test robot <lkp@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, Pratyush Yadav <pratyush@kernel.org>,
 linux-doc@vger.kernel.org
References: <202605270105.CZQo8wSO-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202605270105.CZQo8wSO-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/26/26 4:24 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
> head:   113ff79be3bcf0262eb7860d3325dd951ff29499
> commit: ecbba8d91f4bd0fccd722a7e5a57cec385c11ca8 [20/28] mtd: spi-nor: Add steps for testing locking support
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260527/202605270105.CZQo8wSO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605270105.CZQo8wSO-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 

>    Documentation/driver-api/mtd/spi-nor.rst:215: ERROR: Unexpected indentation. [docutils]
>>> Documentation/driver-api/mtd/spi-nor.rst:216: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]


I've already sent a patch for this.
https://lore.kernel.org/linux-doc/20260526172341.773398-1-rdunlap@infradead.org/T/#u


-- 
~Randy


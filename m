Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B997D38D;
	Fri, 13 Mar 2026 04:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773376345; cv=none; b=BVxUDsMhZZ73FKXiYwutQWxq+4iD9/j/dgV4Jh01qUNYWewQaV6oWXEitJKDdj7Gri1HNWggiGx3zgqfUmpLJd1yhINn0fy0+4+mOErtrDt4eybd/wPgwoEXBqtukSYXUlcxEslc+kAzy+M8tekwoJB4zH2dPtc3IZ+qdZp/0Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773376345; c=relaxed/simple;
	bh=OsO43AEScf2SDzs3vCLiXxAix7CqATBgzLwPUSofLPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7aMG79sLWGj0qh85AK6vVyPhNFA+d5g/eECk/ofOBekT1nDtp6/dcqK11LKuVXchsg7AgHUH7pVksbuTw2CHluu9WNUIncsEU3IZYhgvaxd0pXA3g+7As/fq40J1T5O3VsznEEe1vRGFIkt62GNM2kJciDToTQ8ll3dO6EX+PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NfDDrueV; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NfDDrueV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4PWorIuVBtzdK1hCG3yXXkHLa5cHfJHYltPsR/+plI4=; b=NfDDrueVefetZKJanjVgnCq4zk
	UZIkbuQS2jeq093BU7Y0zaXJTOqerb5HzpMh3a8fmR0Ytu/IV/x9zPXXEThTo8H6On6BNYsngyt4k
	1IXAeQIKZFiWNiq4kbqFoAt/UOiSbi0HUhTkiNiHk1vOCd841OXtycuBMPUxnZDpgt9JXLqosw1WR
	Wba7Q7+Oal2nKOSpjaf2EZ6PWNwUXvwac+Ks+ST0joPrmnRBF1+4sAYnLpXg+oF4NEZAjoYI35i6d
	+gltQVHRKto2K4xWJAukJLzeEp8tX6wj40FSBwcU8DN2pg6oOr4KRjy938veusI9cpO6dT6IMk15T
	8lfr9rKA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uCE-0000000GVR2-1QIZ;
	Fri, 13 Mar 2026 04:32:22 +0000
Message-ID: <4843aecd-fe54-401e-9e30-237e1d9fa1ec@infradead.org>
Date: Thu, 12 Mar 2026 21:32:21 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-new 367/381] htmldocs:
 Documentation/filesystems/mmap_prepare.rst: WARNING: document isn't included
 in any toctree [toc.not_included]
To: kernel test robot <lkp@intel.com>,
 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>, linux-doc@vger.kernel.org
References: <202603130548.Eq61ZQ3W-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202603130548.Eq61ZQ3W-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/12/26 9:17 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   593fab843afbd6800243552aebcc61d02d3cdcb2
> commit: a6cdd3274e8a03e218fe6bf3ef711902adb76727 [367/381] mm: add documentation for the mmap_prepare file operation callback
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260313/202603130548.Eq61ZQ3W-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603130548.Eq61ZQ3W-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 


>>> Documentation/filesystems/mmap_prepare.rst:60: WARNING: Pygments lexer name 'Cw' is not known [misc.highlighting_failure]
>    Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]
> 

Patch for these 2 is here:
https://lore.kernel.org/linux-mtd/f0e33b51-d465-462d-b0f6-98a1db66bb15@infradead.org/T/#mf78dd33fe8fec8bb02379ab15eefd4d3eba23f78

(written before k.t.r. reported the warnings, so no Reported-by:)

-- 
~Randy


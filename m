Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1890136CDE2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 04:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768969629; cv=none; b=V6A39R6NreYIiR80GWONEKiq2Kru4r1TXffPRLyeQMv0zm1LcJlt6UU9G8icelZOVK9x0f4546wL7/o0+KuwQexvS7RmuuKiZNqJcFbBlKMuwdsCp5QlapHU4xfHk39dRPyL6Un+uOZfOet+gDTwYqHW9Rf5rYa2LbHNHE37THA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768969629; c=relaxed/simple;
	bh=elyKDgijRETIP2ugi6a2CluMK8wS0bgTluoNaL7ZRbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lj8QcGc/LiJxu76dgd0RU3ZTmAphpohTh4U+Yd43a/zqRf+hzn/EFYs5H9+6N0V+tAxJhCzN2nwHA1ZaGSxCtFWkPp//O39qulXJ6uGyy0pGA78xFCpsbXtFZZ5kEd/0SRCf1scNGibmhrioZGKYcjWsO4uccLalaz34pw2klxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WOjkKMb5; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WOjkKMb5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JagUjXaOINlQfMgaWAUJGllGtfm8R7LVzSvPWDfk+q8=; b=WOjkKMb5PyQMKXDLuLt0sIFgYi
	KbBQLnNsN9DY172pJKlwT6rZafrxGzn7vV7Vo7QFDaaIZDPw2BAjye+KweZu40hwlALFQvmagWBrs
	B78b/GpfJTZw9hhjq3FoTcJ9ry4ZhF5rEoH4DpdIXO1yXQZmCiaRkPYfIyQARYMHA7FCNITA6eSgY
	QW40MxqSMnS9+ac2F4w7VN0MD9QyjtJJJqvvjdMa03nwE2LfOgrAWFbBfnolXfjEVU+WIUOFruwpk
	7ed9r3MbTtc27J6QLH5PNqQ4SFSJvlWH0pvvEp4E1a0bXWg3DSM3W7xoOxwGn//V248dyS/pvctmW
	vGS9WDJQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viPo1-0000000FsKx-0KVs;
	Wed, 21 Jan 2026 04:26:57 +0000
Date: Wed, 21 Jan 2026 04:26:56 +0000
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 1093/7987] lib/xarray.c:2473:25: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <aXBVkLtSCxat0X5F@casper.infradead.org>
References: <202601202102.uotE2V9e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601202102.uotE2V9e-lkp@intel.com>

On Tue, Jan 20, 2026 at 09:37:12PM +0800, kernel test robot wrote:
> sparse warnings: (new ones prefixed by >>)
>    lib/xarray.c:2453:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu * @@
>    lib/xarray.c:2453:58: sparse:     expected void const *entry
>    lib/xarray.c:2453:58: sparse:     got void [noderef] __rcu *
> >> lib/xarray.c:2473:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *entry @@     got void [noderef] __rcu *const xa_head @@
>    lib/xarray.c:2473:25: sparse:     expected void *entry
>    lib/xarray.c:2473:25: sparse:     got void [noderef] __rcu *const xa_head

fixed locally; will push out soon.

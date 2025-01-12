Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BED7182
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 18:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736706117; cv=none; b=YSv9TJzXDOq/8pUN9+hf4zmjBKNkcHUuUa/455TaHL13T4qPgJRZ6RMUPMG8ISdgXRLySMs3FHTOVVdfm4KJF8PUIGQAy/Wl9TSfIe2Pf9mvMRmWMQ8CjgIRycClAApVawO4VwUFXSk+CidV+NKJyrNbOKars4YAjwXAM26vTw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736706117; c=relaxed/simple;
	bh=qW24WMccB9zigiQg0u5u43yc6yr+GlwS0YnJLQPA+BY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LT+QUrLkxGoQtRE8vxQZ5pAsH0L+OFo+jdbc74+RUaG5XiNzDcxE6k6DwATIL3ULec19NXdgvC88B9GKFmtsEYJxgnjqe+vTM4g4WhDaQJMZdF9g/olCKwSn5lxFGTqTA15fqPXtpMUHiiow/JnqU50l+OzLcGiTd4INDB33d5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QNQfzPcm; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QNQfzPcm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Y0GlpNGwESrOUIDqccJdoetIilt7yJuQvqEv1xDZHu8=; b=QNQfzPcmXZOlRnSBu8BB/Nf8qR
	ZyNarJA7b0Q0tUcOSTWqBfQV/Azv44zpmtyGe9ZdqRIoi8RqV3jkCdCOYPGw76K0FMiymHzE1b/BY
	KxusYGN7AifzxNGDHHejQnQ8RvNtwVIdYGY0i3RfNqJUj1XC5xzaiEzuCciUDD+Sj//qlLvu1x9jC
	90wxBKfQjYEdXXuO2LBm74Ip1xxoyfitNO0rQcK9aheJa6VS1suIel7g/hr7Fo87b9ToVwgmgpFzZ
	WkLlgHySvfwAnF6BP16Hr8zH6rgHbftaYC74z6atAirEJuP/etuaLwEDj+p0se+VM6MOQDAg3WUOV
	cM7q2YYw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tX2an-0000000Gv13-1eQr;
	Sun, 12 Jan 2025 18:21:45 +0000
Message-ID: <c883110c-6baf-410e-8a77-4c2501060375@infradead.org>
Date: Sun, 12 Jan 2025 10:21:40 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-nonmm-unstable 171/173] kernel/kthread.c:913:
 warning: expecting prototype for kthread_create_worker_on_node(). Prototype
 was for kthread_create_worker() instead
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202501122249.upmy4970-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202501122249.upmy4970-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi ktr, Andrew,

On 1/12/25 6:37 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   dfbe2aeb5ed491cb9f0a2de5a7ad9a9d4d477a8f
> commit: 1bc3c5db9becd0171108c2dcfaf7ef5ef10c1e03 [171/173] kthread: modify kernel-doc function name to match code
> config: i386-buildonly-randconfig-001-20250112 (https://download.01.org/0day-ci/archive/20250112/202501122249.upmy4970-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501122249.upmy4970-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501122249.upmy4970-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> kernel/kthread.c:913: warning: expecting prototype for kthread_create_worker_on_node(). Prototype was for kthread_create_worker() instead
> 
> 
> vim +913 kernel/kthread.c
> 
> fbae2d44aa1df7 Petr Mladek  2016-10-11  901  
> fbae2d44aa1df7 Petr Mladek  2016-10-11  902  /**
> 1bc3c5db9becd0 Randy Dunlap 2025-01-10  903   * kthread_create_worker_on_node - create a kthread worker
> dbf52682cb0286 Petr Mladek  2016-10-11  904   * @flags: flags modifying the default behavior of the worker
> fbae2d44aa1df7 Petr Mladek  2016-10-11  905   * @namefmt: printf-style name for the kthread worker (task).
> fbae2d44aa1df7 Petr Mladek  2016-10-11  906   *
> fbae2d44aa1df7 Petr Mladek  2016-10-11  907   * Returns a pointer to the allocated worker on success, ERR_PTR(-ENOMEM)
> fbae2d44aa1df7 Petr Mladek  2016-10-11  908   * when the needed structures could not get allocated, and ERR_PTR(-EINTR)
> d25c83c6606ffc Petr Mladek  2022-03-15  909   * when the caller was killed by a fatal signal.
> fbae2d44aa1df7 Petr Mladek  2016-10-11  910   */
> fbae2d44aa1df7 Petr Mladek  2016-10-11  911  struct kthread_worker *
> dbf52682cb0286 Petr Mladek  2016-10-11  912  kthread_create_worker(unsigned int flags, const char namefmt[], ...)
> fbae2d44aa1df7 Petr Mladek  2016-10-11 @913  {

@Andrew: I don't know how to handle this. My patch applies correctly to linux-next
where this function name has been changed. It looks like 0day is applying it
to mainline linux + your tree(s?) for testing.

-- 
~Randy


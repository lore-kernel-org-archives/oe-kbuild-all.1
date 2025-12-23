Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F69D2AD22;
	Tue, 23 Dec 2025 02:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766455781; cv=none; b=Rn49TRSjz8y8kZxU1b8VuIccDMpaZBa2BB3EWqmmsUtz3QOyBWCFdH/wzWUrsdLpUp/ddBLer3xQDSChKCbozTcmWenLklUaaF90FLbSRibnZa89X6jt4kCmElaYqZVay6p7jjiLCxkELwXQfyqdb1c4xtFNHL3xINB2h5b0rCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766455781; c=relaxed/simple;
	bh=AQLfanbb9dQEk3fOTNLXdF1OqxqK87zVLhLJu0c2XjY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IwuutLdJqHujvtc3AR7aNMUDzMf4jUBjhVX+mKSgMgxNstjdWcTPNg6HwLxlWsDyx3q6MGaqlXvTMBcmYPgwj9qAPZC9r357KRpcikTi3uHmEMdzG00uA4xNqXIzbaptNNYIV9YL5VXgceiRwVXjnWg9sKX6XLvawasg6W1CJeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zf+UFP9/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zf+UFP9/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E14C4CEF1;
	Tue, 23 Dec 2025 02:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1766455781;
	bh=AQLfanbb9dQEk3fOTNLXdF1OqxqK87zVLhLJu0c2XjY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zf+UFP9/Jahlxv6KaIZNZCZejhI0pnpghKxyZOksaJK5Ymp1yj4EZ3LFwIMQIvKkF
	 gq9Fam19sHL2Z6Ro1Z5Gpkn5RR2uSrPCgFHAmVQWDeGAR3RWK/zMDuBmv9a0iZFRrM
	 26jK1Y9vtz9qTTmT4Sb7VOxWuYtzKCgrTiqFR8jc=
Date: Mon, 22 Dec 2025 18:09:40 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, oe-kbuild-all@lists.linux.dev,
 David Hildenbrand <david@kernel.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 linux-doc@vger.kernel.org
Subject: Re: [akpm-mm:mm-new 98/101] htmldocs:
 Documentation/admin-guide/laptops/index.rst:7: WARNING: toctree contains
 reference to nonexisting document 'admin-guide/laptops/laptop-mode'
 [toc.not_readable]
Message-Id: <20251222180940.ba15b0280510ff101e8c67fc@linux-foundation.org>
In-Reply-To: <202512212211.GvfwAGPP-lkp@intel.com>
References: <202512212211.GvfwAGPP-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 21 Dec 2025 22:49:44 +0100 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   287373d0b6ee3872d95edfd1921fb2f18535d6cd
> commit: 7cc91bf52584387445d654cde466ba5cb1235757 [98/101] mm/block/fs: remove laptop_mode
> reproduce: (https://download.01.org/0day-ci/archive/20251221/202512212211.GvfwAGPP-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512212211.GvfwAGPP-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    WARNING: No kernel-doc for file ./include/linux/pci.h
>    ERROR: Cannot find file ./include/linux/mod_devicetable.h
>    WARNING: No kernel-doc for file ./include/linux/mod_devicetable.h
>    ERROR: Cannot find file ./include/linux/bootconfig.h
>    WARNING: No kernel-doc for file ./include/linux/bootconfig.h
> >> Documentation/admin-guide/laptops/index.rst:7: WARNING: toctree contains reference to nonexisting document 'admin-guide/laptops/laptop-mode' [toc.not_readable]
>    ERROR: Cannot find file ./include/linux/pstore_zone.h
>    ERROR: Cannot find file ./include/linux/pstore_zone.h
>    WARNING: No kernel-doc for file ./include/linux/pstore_zone.h
>    ERROR: Cannot find file ./include/linux/pstore_blk.h
>    ERROR: Cannot find file ./include/linux/pstore_blk.h

Seems solvable.

--- a/Documentation/admin-guide/laptops/index.rst~mm-block-fs-remove-laptop_mode-fix
+++ a/Documentation/admin-guide/laptops/index.rst
@@ -10,7 +10,6 @@ Laptop Drivers
    alienware-wmi
    asus-laptop
    disk-shock-protection
-   laptop-mode
    lg-laptop
    samsung-galaxybook
    sony-laptop
_


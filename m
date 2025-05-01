Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109B71946DA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 21:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746133986; cv=none; b=eeIZO8T4gT3dQyMiGWPjhr+lRbafMLjjmjNcgsXdM6vGJlLC9yeKmVkgjYg0cMCbufHmoNiNyBv1KnCo47TkCC5ZReX/1Udf/JLko2BRzU6QuJKTMQYpwTG+u/WVk5BR5khRoLAhAFfmJxE4Vd9DbYbWJT2JNXFaFFHNuOjUv/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746133986; c=relaxed/simple;
	bh=WP2hVp4AWk5pkrHEwaQmdFKqQTdmdd3WIdHhWj1dm40=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ADu8wrIAE8z9YkSIqVwmOSkb2Q1i+e9X76CK54l/CGfBLz1Gwy4eHn7+Zwzd58ehQ03zoMPe/eupfLN7sfpUb4w3d6LoN8IvXW3eeWROkxC91Mb59dnKidnh2SiV9+BcbqbzRDp8ztL2sjmtwqfgRPPt+F/XlrLWJii3Mo7uzhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=X8iqlq9C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="X8iqlq9C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5351EC4CEE3;
	Thu,  1 May 2025 21:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746133985;
	bh=WP2hVp4AWk5pkrHEwaQmdFKqQTdmdd3WIdHhWj1dm40=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X8iqlq9CC+DgAsyFx0E/uCWMHOGaxUyIR8IrHUGYjrFJQc5Yag8mHErJj06Lum3Jb
	 HfFjrUMQsVBz+MGlrOtExgx609NT7NFli9ykXLmjF07WW7f7bSkGwRJ6bbQqhSwPq4
	 9XbfNN9WLM0nHe+5MQ6ta7pU9MegncmcHpdu9qKE=
Date: Thu, 1 May 2025 14:13:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Shivank Garg <shivankg@amd.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Matthew Wilcox
 <willy@infradead.org>
Subject: Re: [akpm-mm:mm-unstable 272/272] include/linux/stddef.h:8:14:
 error: called object is not a function or function pointer
Message-Id: <20250501141304.beac3e9d892495eea7a4e9cb@linux-foundation.org>
In-Reply-To: <202505020405.YzD9aNCo-lkp@intel.com>
References: <202505020405.YzD9aNCo-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 2 May 2025 05:02:14 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   ea17e4fdc13cae144d90ce8561c2f50a49492037
> commit: ea17e4fdc13cae144d90ce8561c2f50a49492037 [272/272] jfs: implement migrate_folio for jfs_metapage_aops
> config: arm-randconfig-002-20250502 (https://download.01.org/0day-ci/archive/20250502/202505020405.YzD9aNCo-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020405.YzD9aNCo-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505020405.YzD9aNCo-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/uapi/linux/posix_types.h:5:0,
>                     from include/uapi/linux/types.h:14,
>                     from include/linux/types.h:6,
>                     from include/linux/blkdev.h:8,
>                     from fs/jfs/jfs_metapage.c:7:
>    fs/jfs/jfs_metapage.c: In function '__metapage_migrate_folio':
> >> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
>     #define NULL ((void *)0)
>                  ^
>    include/linux/pagemap.h:1234:31: note: in expansion of macro 'NULL'
>     #define filemap_migrate_folio NULL
>                                   ^~~~
>    fs/jfs/jfs_metapage.c:238:7: note: in expansion of macro 'filemap_migrate_folio'
>      rc = filemap_migrate_folio(mapping, dst, src, mode);
>           ^~~~~~~~~~~~~~~~~~~~~
>    fs/jfs/jfs_metapage.c: In function 'metapage_migrate_folio':
> >> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
>     #define NULL ((void *)0)
>                  ^
>    include/linux/pagemap.h:1234:31: note: in expansion of macro 'NULL'
>     #define filemap_migrate_folio NULL
>                                   ^~~~
>    fs/jfs/jfs_metapage.c:641:10: note: in expansion of macro 'filemap_migrate_folio'
>       return filemap_migrate_folio(mapping, dst, src, mode);

#ifdef CONFIG_MIGRATION
int filemap_migrate_folio(struct address_space *mapping, struct folio *dst,
		struct folio *src, enum migrate_mode mode);
#else
#define filemap_migrate_folio NULL
#endif

well that's odd.  I guess it was only anticipated that
filemap_migrate_folio would be used in a struct initializer.

Should this new JFS migration code be wrapped in #ifdef CONFIG_MIGRATION?

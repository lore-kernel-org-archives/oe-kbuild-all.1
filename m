Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5282571D9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 21:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750799418; cv=none; b=GRZnx/90kdtsLaSVlRHcfJJYSXRrz7WYNVbILeJx/ecFRtT8Wz583fpbo7Tl9lzNeStsmV5fr78KMSETGkH7rgR/NUnBayFrSHkM+h2ijEdJmRWtVjXg15jEY6tnAWTTL4edXMy3CzoTeJCLmNzvNUJXM+QDNQ6fM/YPOGSk+Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750799418; c=relaxed/simple;
	bh=tCpJopxRfveBHKsni2w2YybQAZVK875LEnvbkVzqoxc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=e5jzk0DG8FZ4VE/8qi4UuXGdPjqxoGLC26B7Vacaj3F3yIHzDBsdfF5tuQHLzNuYKx1beEZyPT6/OtJvkjz3NI9I4f9aecHLrgtGQ/E1uNbFkO2z6e5zg0XvSHveHf6MTP3/9XXw6k2pFpgto4iXEbxlfcl7xF4sEFqDtDFq8Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IvvS17NH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IvvS17NH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED117C4CEE3;
	Tue, 24 Jun 2025 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750799418;
	bh=tCpJopxRfveBHKsni2w2YybQAZVK875LEnvbkVzqoxc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IvvS17NHVjIghqXKML+vhLIWl9NcDc4tqkFt737VXv95o0dCIcO4+VC3GjQnl8Nhu
	 bN8ErG7hn/JG2gWm80Ubc8R+xx9Tf5WgkkH1/9++jQYfUEBqHpdbbbZ8tPn6SWRe/l
	 lStg/WCe3cttBLZWSiDXm+eVTpD4bBfneErTiivo=
Date: Tue, 24 Jun 2025 14:10:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 203/215] memcontrol.c:undefined reference to
 `user_proactive_reclaim'
Message-Id: <20250624141017.fbc3743d3bf83c387f3ec62b@linux-foundation.org>
In-Reply-To: <202506250208.ZOcoZLb6-lkp@intel.com>
References: <202506250208.ZOcoZLb6-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Jun 2025 02:57:13 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   d1c90ab3cf156e6dcfb3b74bbb1fc26d99cea303
> commit: 67cc9632fbf2d4095ced88c37130de79914140d6 [203/215] mm/memcg: make memory.reclaim interface generic
> config: i386-buildonly-randconfig-003-20250625 (https://download.01.org/0day-ci/archive/20250625/202506250208.ZOcoZLb6-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506250208.ZOcoZLb6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506250208.ZOcoZLb6-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld: mm/memcontrol.o: in function `memory_reclaim':
> >> memcontrol.c:(.text+0xa06): undefined reference to `user_proactive_reclaim'

Thanks, let's try this:

--- a/mm/internal.h~mm-memcg-make-memoryreclaim-interface-generic-fix
+++ a/mm/internal.h
@@ -517,8 +517,16 @@ extern unsigned long highest_memmap_pfn;
 bool folio_isolate_lru(struct folio *folio);
 void folio_putback_lru(struct folio *folio);
 extern void reclaim_throttle(pg_data_t *pgdat, enum vmscan_throttle_state reason);
+#ifdef CONFIG_NUMA
 int user_proactive_reclaim(char *buf,
 			   struct mem_cgroup *memcg, pg_data_t *pgdat);
+#else
+static inline int user_proactive_reclaim(char *buf,
+			   struct mem_cgroup *memcg, pg_data_t *pgdat)
+{
+	return 0;
+}
+#endif
 
 /*
  * in mm/rmap.c:
_


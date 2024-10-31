Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D026A19F430
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 23:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730415886; cv=none; b=K3d7jzMB5TzVQgf5U7Ojee2+cJApTG6lGkVPxmAmgEj1N4QOTsGdBT48FdZ/4TsPR26OAVlza1oDaovzEGVwNXiefLKszgv7Z6WjIXgc32pkbHC5ALYhMP6hqUCRz5JJPCrdlMTu1xLQVcpfxlbDl19B33/rvChiSoHqdUUDNII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730415886; c=relaxed/simple;
	bh=JIqDDCTYMgYP7ASLcbVszJF0zb5M/z+xn7geeYQJbN0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnfJr06cy8o70edH8ZMOpuz0jocMw5AzP+eWKbPimWu/bV4QWEohnWYifamcMdeCk3vxE0Y68MxfyRzpej/WlavS7oHd9/j0Qqc4U5p1A/nNQafPr65azzHFUtOUE5ChnAz71s1NKMvOpinWDhuc0XpDhfl2P80aV8koOW9x7Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWwiNkSA; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWwiNkSA"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cb6b2b7127so1939626a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 16:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730415878; x=1731020678; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtMvKgcLmtDgywPHUvKzUUppWYf3nYFWnoQ7FpAhK+E=;
        b=bWwiNkSAst1S1i+wIt4iJxqV+cwDOewLVFoPniVpuSWDUISTub9XaThTwGq6S6GPTY
         A/CWhnxPA639DxtJDCXFeRwTezytCzF1qkgbrSEk/k2bPHdbfowoMrX9EAJicuoVVeNV
         MGvNwpTzWj075Ujf4YCbAc2WJpspb7/ZW1yOlAhj8bnaUF1DF/2w+dk9E8ikrqwp7Jlm
         FB9QlW0LwNBmXkNgClHoiZeIg4Car3wBy9y9MO/js9Ann04ERrbaT1qey2ckzN5S9Vty
         xVOfaRI4v2oUCFX6TvaeYK0fAybSasyR1f5YuPV/IrliAehEWPPGyhmehhDN7m8kXUx0
         IVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730415878; x=1731020678;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EtMvKgcLmtDgywPHUvKzUUppWYf3nYFWnoQ7FpAhK+E=;
        b=rPcZwQnmxc6JhjYqbBOXirxoMUk3PPxfELQMcAFLRmfye433R6pbgcJkYh++ucPx9j
         a6Gw2kwmVLXLAJrx5SivGXq6hEGgFUvWJ0R3D7UahkX/nEySOBqSw6CNOQ9E8TCpMoy2
         fs9MaH5wGUBwPnZwe+HnbuEducSz0gn0fIQ/AYlpc+W8JSj/CShEtbZA+XPjNRd8S4Z4
         3WzO4Xf9cyu1HZs/9sVcb85SJpLqpcMPL0Aiubm0zXnaORtt6/h0TJ4Jre1LoXXbDebg
         pCivWb02LF6ESXHwzUuKUzYofERAXJ0s+ruvP3D++ZKoL2nTDsSAzvdVgv+XF0g1L0hi
         TKjA==
X-Forwarded-Encrypted: i=1; AJvYcCVGeIwBimwQbGNuHlOuJiGcHjn9jWshUttWTNWCxFQQQzJ3xJnGnLy4Cq+TnpVM+XGCgTMQx+ixpgIusLEA@lists.linux.dev
X-Gm-Message-State: AOJu0YyBqrnuVoKjBwjld/JbK1F58Xec1+Q5stgZlg5zPhmJi6IJqD7c
	EFkmBuZHHEfKSaHJkpv0EAe6pCjC0aceRS5ejS6JfWYolXqxgM+B
X-Google-Smtp-Source: AGHT+IEyghKprvLsxiAcZC+3o0cVoTuBuCOTFhpz0/CUPftpSUvEqr4DFrq8vUdyRqr5xRsR9gBQzg==
X-Received: by 2002:a17:907:6eaa:b0:a99:fb56:39cc with SMTP id a640c23a62f3a-a9e509787a5mr456889866b.38.1730415877805;
        Thu, 31 Oct 2024 16:04:37 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565ea53dsm113297766b.114.2024.10.31.16.04.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2024 16:04:36 -0700 (PDT)
Date: Thu, 31 Oct 2024 23:04:36 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	kernel test robot <lkp@intel.com>, akpm@linux-foundation.org,
	oe-kbuild-all@lists.linux.dev, maple-tree@lists.infradead.org,
	linux-mm@kvack.org, Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH v4 5/5] maple_tree: add a test checking storing null
Message-ID: <20241031230436.5lqih4wfrlshcq3v@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20241019023716.4516-6-richard.weiyang@gmail.com>
 <202410230105.UApdwd9S-lkp@intel.com>
 <20241022233247.htf7diduw2ojce2p@master>
 <jzmsbn7iabvfmsjzjowmmccv2ou54uyyiuxmb3jxdgcc2zpd4m@7olpq7oacxkj>
 <20241031080248.7bd5iy52wenptsp4@master>
 <fs2mmau42zex4dey4cjzp7vyaxyjprsdtkb52rmuyszzigptqb@ikrbpshdg7gb>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fs2mmau42zex4dey4cjzp7vyaxyjprsdtkb52rmuyszzigptqb@ikrbpshdg7gb>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Oct 31, 2024 at 07:17:28AM -0400, Liam R. Howlett wrote:
>* Wei Yang <richard.weiyang@gmail.com> [241031 04:02]:
>> On Tue, Oct 29, 2024 at 11:29:39AM -0400, Liam R. Howlett wrote:
>> >* Wei Yang <richard.weiyang@gmail.com> [241022 19:32]:
>> >> On Wed, Oct 23, 2024 at 01:37:50AM +0800, kernel test robot wrote:
>> >> >Hi Wei,
>> >> >
>> >> >kernel test robot noticed the following build warnings:
>> >> >
>> >> >[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
>> >> >[also build test WARNING on akpm-mm/mm-everything linus/master v6.12-rc4 next-20241022]
>> >> >[If your patch is applied to the wrong git tree, kindly drop us a note.
>> >> >And when submitting patch, we suggest to use '--base' as documented in
>> >> >https://git-scm.com/docs/git-format-patch#_base_tree_information]
>> >> >
>> >> >url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/maple_tree-print-empty-for-an-empty-tree-on-mt_dump/20241019-103832
>> >> >base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
>> >> >patch link:    https://lore.kernel.org/r/20241019023716.4516-6-richard.weiyang%40gmail.com
>> >> >patch subject: [PATCH v4 5/5] maple_tree: add a test checking storing null
>> >> >config: x86_64-randconfig-123-20241022 (https://download.01.org/0day-ci/archive/20241023/202410230105.UApdwd9S-lkp@intel.com/config)
>> >> >compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
>> >> >reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230105.UApdwd9S-lkp@intel.com/reproduce)
>> >> >
>> >> >If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> >> >the same patch/commit), kindly add following tags
>> >> >| Reported-by: kernel test robot <lkp@intel.com>
>> >> >| Closes: https://lore.kernel.org/oe-kbuild-all/202410230105.UApdwd9S-lkp@intel.com/
>> >> >
>> >> >sparse warnings: (new ones prefixed by >>)
>> >> >>> lib/test_maple_tree.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
>> >> >   lib/test_maple_tree.c:1456:9: sparse:     expected void const *entry
>> >> >   lib/test_maple_tree.c:1456:9: sparse:     got void [noderef] __rcu *ma_root
>> >> >>> lib/test_maple_tree.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
>> >> >   lib/test_maple_tree.c:1456:9: sparse:     expected void const *entry
>> >> >   lib/test_maple_tree.c:1456:9: sparse:     got void [noderef] __rcu *ma_root
>> >> >   lib/test_maple_tree.c:1468:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
>> >> >   lib/test_maple_tree.c:1468:9: sparse:     expected void const *entry
>> >> >   lib/test_maple_tree.c:1468:9: sparse:     got void [noderef] __rcu *ma_root
>> >> >   lib/test_maple_tree.c:1468:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
>> >> >   lib/test_maple_tree.c:1468:9: sparse:     expected void const *entry
>> >> >   lib/test_maple_tree.c:1468:9: sparse:     got void [noderef] __rcu *ma_root
>> >> >
>> >> >vim +1456 lib/test_maple_tree.c
>> >> >
>> >> >  1389	
>> >> >  1390	static noinline void __init check_store_null(struct maple_tree *mt)
>> >> >  1391	{
>> >> >  1392		MA_STATE(mas, mt, 0, ULONG_MAX);
>> >> >  1393	
>> >> >  1394		/*
>> >> >  1395		 * Store NULL at range [0, ULONG_MAX] to an empty tree should result
>> >> >  1396		 * in an empty tree
>> >> >  1397		 */
>> >> >  1398		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
>> >> >  1399		mas_lock(&mas);
>> >> >  1400		mas_store_gfp(&mas, NULL, GFP_KERNEL);
>> >> >  1401		MT_BUG_ON(mt, !mtree_empty(mt));
>> >> >  1402		mas_unlock(&mas);
>> >> >  1403		mtree_destroy(mt);
>> >> >  1404	
>> >> >  1405		/*
>> >> >  1406		 * Store NULL at any range to an empty tree should result in an empty
>> >> >  1407		 * tree
>> >> >  1408		 */
>> >> >  1409		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
>> >> >  1410		mas_lock(&mas);
>> >> >  1411		mas_set_range(&mas, 3, 10);
>> >> >  1412		mas_store_gfp(&mas, NULL, GFP_KERNEL);
>> >> >  1413		MT_BUG_ON(mt, !mtree_empty(mt));
>> >> >  1414		mas_unlock(&mas);
>> >> >  1415		mtree_destroy(mt);
>> >> >  1416	
>> >> >  1417		/*
>> >> >  1418		 * Store NULL at range [0, ULONG_MAX] to a single entry tree should
>> >> >  1419		 * result in an empty tree
>> >> >  1420		 */
>> >> >  1421		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
>> >> >  1422		mas_lock(&mas);
>> >> >  1423		mas_set(&mas, 0);
>> >> >  1424		mas_store_gfp(&mas, &mas, GFP_KERNEL);
>> >> >  1425		mas_set_range(&mas, 0, ULONG_MAX);
>> >> >  1426		mas_store_gfp(&mas, NULL, GFP_KERNEL);
>> >> >  1427		MT_BUG_ON(mt, !mtree_empty(mt));
>> >> >  1428		mas_unlock(&mas);
>> >> >  1429		mtree_destroy(mt);
>> >> >  1430	
>> >> >  1431		/*
>> >> >  1432		 * Store NULL at range [0, n] to a single entry tree should
>> >> >  1433		 * result in an empty tree
>> >> >  1434		 */
>> >> >  1435		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
>> >> >  1436		mas_lock(&mas);
>> >> >  1437		mas_set(&mas, 0);
>> >> >  1438		mas_store_gfp(&mas, &mas, GFP_KERNEL);
>> >> >  1439		mas_set_range(&mas, 0, 5);
>> >> >  1440		mas_store_gfp(&mas, NULL, GFP_KERNEL);
>> >> >  1441		MT_BUG_ON(mt, !mtree_empty(mt));
>> >> >  1442		mas_unlock(&mas);
>> >> >  1443		mtree_destroy(mt);
>> >> >  1444	
>> >> >  1445		/*
>> >> >  1446		 * Store NULL at range [m, n] where m > 0 to a single entry tree
>> >> >  1447		 * should still be a single entry tree
>> >> >  1448		 */
>> >> >  1449		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
>> >> >  1450		mas_lock(&mas);
>> >> >  1451		mas_set(&mas, 0);
>> >> >  1452		mas_store_gfp(&mas, &mas, GFP_KERNEL);
>> >> >  1453		mas_set_range(&mas, 2, 5);
>> >> >  1454		mas_store_gfp(&mas, NULL, GFP_KERNEL);
>> >> >  1455		MT_BUG_ON(mt, mtree_empty(mt));
>> >> >> 1456		MT_BUG_ON(mt, xa_is_node(mt->ma_root));
>> >> 
>> >> Thanks.
>> >> 
>> >> Will fix it to xa_is_node(mas_root(&mas)) in next version.
>> >
>> >By the looks of the bot output, there are quite a lot of existing cases
>> >of this in the test code.
>> >
>> 
>> Hi, Liam
>> 
>> Thanks for your review. I may not follow you.
>> 
>> I saw you add you RB. Do you prefer me to spin a new round with this adjusted
>> or the current version is fine?
>
>Please fix what you added.  The rest will need to eventually be fixed,
>but someone can do that later.
>

Got it, thanks.

>> 
>> >> 
>> >> 
>> >> >  1457		mas_unlock(&mas);
>> >> >  1458		mtree_destroy(mt);
>> >> >  1459	
>> >> >  1460		/*
>> >> >  1461		 * Store NULL at range [0, ULONG_MAX] to a tree with node should
>> >> >  1462		 * result in an empty tree
>> >> >  1463		 */
>> >> >  1464		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
>> >> >  1465		mas_lock(&mas);
>> >> >  1466		mas_set_range(&mas, 1, 3);
>> >> >  1467		mas_store_gfp(&mas, &mas, GFP_KERNEL);
>> >> >  1468		MT_BUG_ON(mt, !xa_is_node(mt->ma_root));
>> >> >  1469		mas_set_range(&mas, 0, ULONG_MAX);
>> >> >  1470		mas_store_gfp(&mas, NULL, GFP_KERNEL);
>> >> >  1471		MT_BUG_ON(mt, !mtree_empty(mt));
>> >> >  1472		mas_unlock(&mas);
>> >> >  1473		mtree_destroy(mt);
>> >> >  1474	}
>> >> >  1475	
>> >> >
>> >> >-- 
>> >> >0-DAY CI Kernel Test Service
>> >> >https://github.com/intel/lkp-tests/wiki
>> >> 
>> >> -- 
>> >> Wei Yang
>> >> Help you, Help me
>> 
>> -- 
>> Wei Yang
>> Help you, Help me

-- 
Wei Yang
Help you, Help me

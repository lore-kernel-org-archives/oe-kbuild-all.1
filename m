Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1352712B93
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 23:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729639974; cv=none; b=X0yc/QkUOALitoSWG+dcEUdzsUxmtvZY8MrbbwIm78r0TqgInqpOI1evwzdVb4Eet/j8+mJYMDwLq0DqwinP247lDqVZUcmsoMCM+DYXpCHOOjrS2wsTrZuwKT8MdNKv80klKbs4w98/nBMGwFZWsGERlD3L2ggZ27lx89uX2Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729639974; c=relaxed/simple;
	bh=5uzuxrizete7KuKe3cJymtnuDNUDRXq2ue1sCYvGx2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIxAUNE8mTcSEUkcTHhEFSe1JAG7A9fw9xxqmhyFUq1XG8NHoZ5Uq1ovn+FH0qX46P1wteVwzKqsLQGih/vFgsLbBMtpoL0gekenmIcZ5VJNeplix4x1crxJfi5wM9gLHMYP7fENxuhng5gAyxmBzMY6qbi09SiVhKz+HmgLfc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncsk1Fmh; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncsk1Fmh"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so4219795a12.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 16:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729639970; x=1730244770; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpX/ocuTdEo5Eaq0leSKyTZEd3VWOebJ/EGKirWte7U=;
        b=ncsk1Fmh1ksDDJMIvhIOh9jt5/GtbNgkU4/M84mOnz86nT7C0OO3WIXkugN5Zmxq2X
         7oVpHX5XFvrksvD7HEIjkJF6hX/WDBAGVn41+fLsFz0sygKETDvrlWL9GlmTdV3GcMcm
         J5KEs9YLFjmEH1qUsPyKmrozLxPEW/6rfCd6YqCwzIQ5dLJjPsJmaLWw+2A/eLBnNtiX
         Q5GY50VgCzFTZBSvBL1LIN2flCdp90wcUenwGg8RTFrndTSR1nBPch7ME5eePNKvjIal
         rfRIfvPMms4h+mFVTIoBR+Nuh/hqn6EvXWxlrIW4VCyEvY7PEBezSUi1zRcTfeaal7Lp
         jjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729639970; x=1730244770;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KpX/ocuTdEo5Eaq0leSKyTZEd3VWOebJ/EGKirWte7U=;
        b=rXwXBAxFuBXyxxUdkdUfVswcV0DKI7AMzwRy2b+Dw0thEubDaRGn/guXLjjqJYYIDa
         KuRdnyAkZ+6A/im+Ao4fHbv/lufCUhe7ae87PvrAZdsVfA0JLAuyoro5yti3OdDzgc+H
         /J/WVbAUro8VQ/1QeVAteVyUUDAAs/41eHlvvAjG7ZDRLIgbpKWGVT+gW8X7n4a3qaYt
         7XFegboAF77eVIlEfGqXXLk2A1nRr2YoG4Lo0IQpVcmFyAcmeddfN8zzX37IOsAR6puf
         GI18WjylhzddAuSa4zIvxILoPT+WLHpELt7tANll14wyAvqELLlLC5S86dN2RyfvFjeU
         sS3A==
X-Forwarded-Encrypted: i=1; AJvYcCUNsr4/yoS40cxgNSVx+EheAOjpvp7YmSiLlCZ2CLJMqq+R+wSqvbReQn1NY34hcb4cIZvvQwDqgBtVcktt@lists.linux.dev
X-Gm-Message-State: AOJu0YyDjY915bzqRMNASGuwZxpuk7kHH79UW+OWj8JJyGTPA+Cw15zL
	m9zIrnQozsjPSB56U/HIunLU7byI5fin7xffW08SleiXlr7JQul7
X-Google-Smtp-Source: AGHT+IFKc2vNZNcDHh9gckvXnoWBEe+VTCdjIpXRD2xVVWKZvX9jSS24NKWAmq0zXlsVRAqI+OWdBg==
X-Received: by 2002:a05:6402:d08:b0:5c9:85e8:e866 with SMTP id 4fb4d7f45d1cf-5cb8b264b60mr636267a12.22.1729639970122;
        Tue, 22 Oct 2024 16:32:50 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b63csm3632685a12.19.2024.10.22.16.32.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 16:32:49 -0700 (PDT)
Date: Tue, 22 Oct 2024 23:32:47 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, oe-kbuild-all@lists.linux.dev,
	maple-tree@lists.infradead.org, linux-mm@kvack.org,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH v4 5/5] maple_tree: add a test checking storing null
Message-ID: <20241022233247.htf7diduw2ojce2p@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20241019023716.4516-6-richard.weiyang@gmail.com>
 <202410230105.UApdwd9S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410230105.UApdwd9S-lkp@intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Oct 23, 2024 at 01:37:50AM +0800, kernel test robot wrote:
>Hi Wei,
>
>kernel test robot noticed the following build warnings:
>
>[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
>[also build test WARNING on akpm-mm/mm-everything linus/master v6.12-rc4 next-20241022]
>[If your patch is applied to the wrong git tree, kindly drop us a note.
>And when submitting patch, we suggest to use '--base' as documented in
>https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/maple_tree-print-empty-for-an-empty-tree-on-mt_dump/20241019-103832
>base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
>patch link:    https://lore.kernel.org/r/20241019023716.4516-6-richard.weiyang%40gmail.com
>patch subject: [PATCH v4 5/5] maple_tree: add a test checking storing null
>config: x86_64-randconfig-123-20241022 (https://download.01.org/0day-ci/archive/20241023/202410230105.UApdwd9S-lkp@intel.com/config)
>compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230105.UApdwd9S-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202410230105.UApdwd9S-lkp@intel.com/
>
>sparse warnings: (new ones prefixed by >>)
>>> lib/test_maple_tree.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
>   lib/test_maple_tree.c:1456:9: sparse:     expected void const *entry
>   lib/test_maple_tree.c:1456:9: sparse:     got void [noderef] __rcu *ma_root
>>> lib/test_maple_tree.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
>   lib/test_maple_tree.c:1456:9: sparse:     expected void const *entry
>   lib/test_maple_tree.c:1456:9: sparse:     got void [noderef] __rcu *ma_root
>   lib/test_maple_tree.c:1468:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
>   lib/test_maple_tree.c:1468:9: sparse:     expected void const *entry
>   lib/test_maple_tree.c:1468:9: sparse:     got void [noderef] __rcu *ma_root
>   lib/test_maple_tree.c:1468:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
>   lib/test_maple_tree.c:1468:9: sparse:     expected void const *entry
>   lib/test_maple_tree.c:1468:9: sparse:     got void [noderef] __rcu *ma_root
>
>vim +1456 lib/test_maple_tree.c
>
>  1389	
>  1390	static noinline void __init check_store_null(struct maple_tree *mt)
>  1391	{
>  1392		MA_STATE(mas, mt, 0, ULONG_MAX);
>  1393	
>  1394		/*
>  1395		 * Store NULL at range [0, ULONG_MAX] to an empty tree should result
>  1396		 * in an empty tree
>  1397		 */
>  1398		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
>  1399		mas_lock(&mas);
>  1400		mas_store_gfp(&mas, NULL, GFP_KERNEL);
>  1401		MT_BUG_ON(mt, !mtree_empty(mt));
>  1402		mas_unlock(&mas);
>  1403		mtree_destroy(mt);
>  1404	
>  1405		/*
>  1406		 * Store NULL at any range to an empty tree should result in an empty
>  1407		 * tree
>  1408		 */
>  1409		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
>  1410		mas_lock(&mas);
>  1411		mas_set_range(&mas, 3, 10);
>  1412		mas_store_gfp(&mas, NULL, GFP_KERNEL);
>  1413		MT_BUG_ON(mt, !mtree_empty(mt));
>  1414		mas_unlock(&mas);
>  1415		mtree_destroy(mt);
>  1416	
>  1417		/*
>  1418		 * Store NULL at range [0, ULONG_MAX] to a single entry tree should
>  1419		 * result in an empty tree
>  1420		 */
>  1421		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
>  1422		mas_lock(&mas);
>  1423		mas_set(&mas, 0);
>  1424		mas_store_gfp(&mas, &mas, GFP_KERNEL);
>  1425		mas_set_range(&mas, 0, ULONG_MAX);
>  1426		mas_store_gfp(&mas, NULL, GFP_KERNEL);
>  1427		MT_BUG_ON(mt, !mtree_empty(mt));
>  1428		mas_unlock(&mas);
>  1429		mtree_destroy(mt);
>  1430	
>  1431		/*
>  1432		 * Store NULL at range [0, n] to a single entry tree should
>  1433		 * result in an empty tree
>  1434		 */
>  1435		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
>  1436		mas_lock(&mas);
>  1437		mas_set(&mas, 0);
>  1438		mas_store_gfp(&mas, &mas, GFP_KERNEL);
>  1439		mas_set_range(&mas, 0, 5);
>  1440		mas_store_gfp(&mas, NULL, GFP_KERNEL);
>  1441		MT_BUG_ON(mt, !mtree_empty(mt));
>  1442		mas_unlock(&mas);
>  1443		mtree_destroy(mt);
>  1444	
>  1445		/*
>  1446		 * Store NULL at range [m, n] where m > 0 to a single entry tree
>  1447		 * should still be a single entry tree
>  1448		 */
>  1449		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
>  1450		mas_lock(&mas);
>  1451		mas_set(&mas, 0);
>  1452		mas_store_gfp(&mas, &mas, GFP_KERNEL);
>  1453		mas_set_range(&mas, 2, 5);
>  1454		mas_store_gfp(&mas, NULL, GFP_KERNEL);
>  1455		MT_BUG_ON(mt, mtree_empty(mt));
>> 1456		MT_BUG_ON(mt, xa_is_node(mt->ma_root));

Thanks.

Will fix it to xa_is_node(mas_root(&mas)) in next version.


>  1457		mas_unlock(&mas);
>  1458		mtree_destroy(mt);
>  1459	
>  1460		/*
>  1461		 * Store NULL at range [0, ULONG_MAX] to a tree with node should
>  1462		 * result in an empty tree
>  1463		 */
>  1464		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
>  1465		mas_lock(&mas);
>  1466		mas_set_range(&mas, 1, 3);
>  1467		mas_store_gfp(&mas, &mas, GFP_KERNEL);
>  1468		MT_BUG_ON(mt, !xa_is_node(mt->ma_root));
>  1469		mas_set_range(&mas, 0, ULONG_MAX);
>  1470		mas_store_gfp(&mas, NULL, GFP_KERNEL);
>  1471		MT_BUG_ON(mt, !mtree_empty(mt));
>  1472		mas_unlock(&mas);
>  1473		mtree_destroy(mt);
>  1474	}
>  1475	
>
>-- 
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki

-- 
Wei Yang
Help you, Help me

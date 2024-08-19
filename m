Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2839B1EB4A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 19:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724096767; cv=none; b=eAYhP29o1HRPGeNDsz/vcNBKpgHqQ7W5FmOfMh23R0/XFkLbAHpsRM22rSdjSTlTyn/OqTK+BOdQkfHUyYYrzYgh6A/Fvg4CbZ6DOtFwa+XQnRCM3biuAvKdZk/d332zKRrWPftIrS/dE1wWn/Ae9cU8kXB5NaJg3bMg2uUQNj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724096767; c=relaxed/simple;
	bh=LjKpfCzXWEes3zYCkfp0RZCdk5A0eJtOy5P3yyx+VPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGi8dUve/xF9590O9giMc90MX3DrDMyMZ6RZfrMiW26qVgzp3cOEj2SCCD7hBdAoybGfDUGplEzAKcacAR2VPtZcTi4UwK2B3X6cqnTDqJf8TWZe7QzuF+NAwnn9Izcg8ae5a4KKtMrbpo0n7VzFPCYiczV9TWs4odX0+Gjks+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1SHyjIw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1SHyjIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724096763; x=1755632763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LjKpfCzXWEes3zYCkfp0RZCdk5A0eJtOy5P3yyx+VPY=;
  b=n1SHyjIwNkhoSe7YDgivzsuup3phyhh9csNF1dmcUkiFXk+cVgB7Rpr5
   n80J5+X1Cm7mrKAp1HEp540y/QsHT52KFlaNuSCXbTSt7keo+3wpierhs
   fFiYp38ZfaVGlBpmRsUbqXIRaXJS/XbGjNIe+vA4jd35AzfTHsHBpREJh
   zJib17qRqc0JCKKqZSsQuVsgwW1qZ7ArswkulfnY9S+1QUWwGoxEVQqFa
   4NfO5P+qKCD9r2MALg/kADqnemt67WKifEPPHZ/3R8Q9oATaY9ZAaLJBH
   MBMYOCOB5ruaTcXBkiZaTBHRwabAfPZSgC4E0EGAExxFpQnjP+WiTBJ2t
   A==;
X-CSE-ConnectionGUID: aHH37XV2R3engo7+ckdkQw==
X-CSE-MsgGUID: gvBogRl8Q/OuTF4a6kec5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22509574"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="22509574"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 12:46:03 -0700
X-CSE-ConnectionGUID: mutvEJSYT92P1npg0id1Dw==
X-CSE-MsgGUID: EO5i08SORoOfmuHKY2qDvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="97949481"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Aug 2024 12:46:00 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg8KE-0009N4-24;
	Mon, 19 Aug 2024 19:45:58 +0000
Date: Tue, 20 Aug 2024 03:45:25 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Xu <lizhi.xu@windriver.com>,
	syzbot+47ecc948aadfb2ab3efc@syzkaller.appspotmail.com
Cc: oe-kbuild-all@lists.linux.dev, kent.overstreet@linux.dev,
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] bcachefs: Fix oob in bch2_dev_journal_init
Message-ID: <202408200353.I1MmR4S5-lkp@intel.com>
References: <20240819064754.35606-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819064754.35606-1-lizhi.xu@windriver.com>

Hi Lizhi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.11-rc4 next-20240819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lizhi-Xu/bcachefs-Fix-oob-in-bch2_dev_journal_init/20240819-145031
base:   linus/master
patch link:    https://lore.kernel.org/r/20240819064754.35606-1-lizhi.xu%40windriver.com
patch subject: [PATCH] bcachefs: Fix oob in bch2_dev_journal_init
config: arc-randconfig-001-20240819 (https://download.01.org/0day-ci/archive/20240820/202408200353.I1MmR4S5-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408200353.I1MmR4S5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408200353.I1MmR4S5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/vstructs.h:5,
                    from fs/bcachefs/bcachefs_format.h:80,
                    from fs/bcachefs/bcachefs.h:207,
                    from fs/bcachefs/journal.c:8:
   fs/bcachefs/journal.c: In function 'bch2_dev_journal_init':
>> fs/bcachefs/journal.c:1316:50: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'long long unsigned int' [-Wformat=]
    1316 |                                 prt_printf(&buf, "journal v2 entry d[%u].nr %lu overflow!\n", i,
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:78:63: note: in definition of macro 'prt_printf'
      78 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   fs/bcachefs/journal.c:1316:79: note: format string is defined here
    1316 |                                 prt_printf(&buf, "journal v2 entry d[%u].nr %lu overflow!\n", i,
         |                                                                             ~~^
         |                                                                               |
         |                                                                               long unsigned int
         |                                                                             %llu


vim +1316 fs/bcachefs/journal.c

  1297	
  1298	int bch2_dev_journal_init(struct bch_dev *ca, struct bch_sb *sb)
  1299	{
  1300		struct journal_device *ja = &ca->journal;
  1301		struct bch_sb_field_journal *journal_buckets =
  1302			bch2_sb_field_get(sb, journal);
  1303		struct bch_sb_field_journal_v2 *journal_buckets_v2 =
  1304			bch2_sb_field_get(sb, journal_v2);
  1305	
  1306		ja->nr = 0;
  1307	
  1308		if (journal_buckets_v2) {
  1309			unsigned nr = bch2_sb_field_journal_v2_nr_entries(journal_buckets_v2);
  1310	
  1311			for (unsigned i = 0; i < nr; i++) {
  1312				ja->nr += le64_to_cpu(journal_buckets_v2->d[i].nr);
  1313				if (le64_to_cpu(journal_buckets_v2->d[i].nr) > UINT_MAX) {
  1314					struct bch_fs *c = ca->fs;
  1315					struct printbuf buf = PRINTBUF;
> 1316					prt_printf(&buf, "journal v2 entry d[%u].nr %lu overflow!\n", i,
  1317						le64_to_cpu(journal_buckets_v2->d[i].nr));
  1318					bch_info(c, "%s", buf.buf);
  1319					printbuf_exit(&buf);
  1320					return -BCH_ERR_ENOMEM_dev_journal_init;
  1321				}
  1322			}
  1323		} else if (journal_buckets) {
  1324			ja->nr = bch2_nr_journal_buckets(journal_buckets);
  1325		}
  1326	
  1327		ja->bucket_seq = kcalloc(ja->nr, sizeof(u64), GFP_KERNEL);
  1328		if (!ja->bucket_seq)
  1329			return -BCH_ERR_ENOMEM_dev_journal_init;
  1330	
  1331		unsigned nr_bvecs = DIV_ROUND_UP(JOURNAL_ENTRY_SIZE_MAX, PAGE_SIZE);
  1332	
  1333		for (unsigned i = 0; i < ARRAY_SIZE(ja->bio); i++) {
  1334			ja->bio[i] = kmalloc(struct_size(ja->bio[i], bio.bi_inline_vecs,
  1335					     nr_bvecs), GFP_KERNEL);
  1336			if (!ja->bio[i])
  1337				return -BCH_ERR_ENOMEM_dev_journal_init;
  1338	
  1339			ja->bio[i]->ca = ca;
  1340			ja->bio[i]->buf_idx = i;
  1341			bio_init(&ja->bio[i]->bio, NULL, ja->bio[i]->bio.bi_inline_vecs, nr_bvecs, 0);
  1342		}
  1343	
  1344		ja->buckets = kcalloc(ja->nr, sizeof(u64), GFP_KERNEL);
  1345		if (!ja->buckets)
  1346			return -BCH_ERR_ENOMEM_dev_journal_init;
  1347	
  1348		if (journal_buckets_v2) {
  1349			unsigned nr = bch2_sb_field_journal_v2_nr_entries(journal_buckets_v2);
  1350			unsigned dst = 0;
  1351	
  1352			for (unsigned i = 0; i < nr; i++)
  1353				for (unsigned j = 0; j < le64_to_cpu(journal_buckets_v2->d[i].nr); j++)
  1354					ja->buckets[dst++] =
  1355						le64_to_cpu(journal_buckets_v2->d[i].start) + j;
  1356		} else if (journal_buckets) {
  1357			for (unsigned i = 0; i < ja->nr; i++)
  1358				ja->buckets[i] = le64_to_cpu(journal_buckets->buckets[i]);
  1359		}
  1360	
  1361		return 0;
  1362	}
  1363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

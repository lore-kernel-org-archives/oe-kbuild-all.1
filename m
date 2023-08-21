Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AD28F48
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 18:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BaIcCgLH/pobQ+iDhtF+5SpI8elN6sMt5OgugFWANkE=; b=KAuZA2YK/qBtPor/M+wCjho6xf
	dScWGVymuxdORbLZUW33Pp1TYGtuCUHvSiqA9h3oXTHdFgugkyeG68sZFi4qaaQmyVvFtXmEKonQi
	a13mhUEYYv4rbEewuZgehr1WH8BAZN059n1cPv3MKZzrHNZvy/rdZr5LG2GXbRqYHCf6+P9/DJlr9
	E1DLswltnP0u97s/wJ5dhXIasPdveP2bW8LKtSxjOn1To0lIsJ8NgtbJnGq1eH1f7/0yt5/MtrjOv
	txfkqWA8OK/byIldUMNgwBDa2s7yHVExzTpCXrOKYlDHxjwV+eDG7OfcqGTUfco0tvdPO2ORH9MyZ
	6nViNf8g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qY9T3-00BgLK-Ir; Mon, 21 Aug 2023 18:17:33 +0000
Date: Mon, 21 Aug 2023 19:17:33 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 10448/11214]
 arch/microblaze/include/asm/cacheflush.h:77:13: warning:
 'flush_dcache_folio' defined but not used
Message-ID: <ZOOqPZNvScEc+3aK@casper.infradead.org>
References: <202308220106.VDWkCsdG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308220106.VDWkCsdG-lkp@intel.com>

On Tue, Aug 22, 2023 at 01:21:43AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
> commit: 2fcc20defd8a07415f6b346d941c22c50bbdada5 [10448/11214] microblaze: implement the new page table range API
> config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20230822/202308220106.VDWkCsdG-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220106.VDWkCsdG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308220106.VDWkCsdG-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from kernel/signal.c:57:
> >> arch/microblaze/include/asm/cacheflush.h:77:13: warning: 'flush_dcache_folio' defined but not used [-Wunused-function]
>       77 | static void flush_dcache_folio(struct folio *folio)

The bug is real, but I'm a little concerned that I got an email from
the testbot a few weeks ago suggesting:

microblaze           randconfig-r002-20230731   gcc
microblaze           randconfig-r011-20230731   gcc
microblaze           randconfig-r014-20230731   gcc

all passed.  Perhaps you could do allnoconfig testing more frequently?
Those tests should be quick to run since they are allnoconfig ...

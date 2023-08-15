Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E2D1119D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 02:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BQmMu+A3IxDtgrB+Y4vwFuWVTmZP3id2ostgZjBQe0Y=; b=q5NTur+pZdxkCeFE+uRy1sj2M1
	1K5V4PLI3AmIYZ/kA+bl7sgYgF3DRnvDNUTggyetiZGyqa2HbTdkE0lhUxBvRZiGeZnXcobeAeRf1
	FRpfLXO+Z08HJ+UttWCAZN75bt3+JVukNTAZxa6SMqA6/5O8nYqwI4NkurtvgmnDX9YUJykUwXLAJ
	SoNghjAouiRDtr3rxQ39TbuQOLDQMZiMDn3pk3CW/fJRGDNCnUfdlSX8Rk0FVImVupQCgCeU08L8Z
	RD3gHvhSXcorWb7tYOI1wmuK0lQ3sqYhJqF4qhaavzW3nfqdH1/HaBFlus/b8pfrasswwFcldiUWl
	nNAa+m5g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qVjpG-005bFf-GC; Tue, 15 Aug 2023 02:30:30 +0000
Date: Tue, 15 Aug 2023 03:30:30 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 8002/8441]
 include/linux/compiler_types.h:397:45: error: call to
 '__compiletime_assert_324' declared with attribute error: BUILD_BUG_ON
 failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)
Message-ID: <ZNrjRmlEbseKFdIq@casper.infradead.org>
References: <202308150902.iqtQSoIb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308150902.iqtQSoIb-lkp@intel.com>

On Tue, Aug 15, 2023 at 09:44:02AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   21ef7b1e17d039053edaeaf41142423810572741
> commit: 8d670cfbf3be95bbf2cb7ecdd8f449aabde8c182 [8002/8441] mips: implement the new page table range API
> config: mips-randconfig-r002-20230815 (https://download.01.org/0day-ci/archive/20230815/202308150902.iqtQSoIb-lkp@intel.com/config)
> compiler: mipsel-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150902.iqtQSoIb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308150902.iqtQSoIb-lkp@intel.com/

How do I get you to stop reporting this?  As I've said twice before now,
I did not create this warning, I simply changed some things which caused
the warning to change.

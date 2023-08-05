Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFD710EA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 23:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gF8icqSopdwAYmA7BbPo4l8on5BiA2En8wuumid1SeE=; b=nJJu0m6ogB9Ecc+q/wU+/XEyJ4
	JtisL5twgqDniLucJ+qOSmogEgNojQdGIh9nUlMJfTyp2NyGLzLcq18kX0+UeRRoNNihyiZ1vhmGN
	OVCUUU4q6Xpr/jK4e/hiEm/oLEFVh0lz6kQ94JMAV3S9UoJmoxzG9nGXiHpYyZcy/kOkUqbUuvwc4
	7TGl/rr2bWuX1HRVhMIyhQaeOK03RZeoQnaygTEcaCfFAQ0Pu4qaBm4FIDU+DeBenwBLYvP4VuKcg
	TxCdwfjc9ygpNht7LzXMYBuFRtJhLmnkhobVCvtAW5HjqDbSxpvQax3NaKqTDuNlDE13sbMNr/fG+
	kzpVlZKw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qSQKq-000z48-Ms; Sat, 05 Aug 2023 23:05:25 +0000
Date: Sun, 6 Aug 2023 00:05:24 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 392/474]
 include/linux/compiler_types.h:397:45: error: call to
 '__compiletime_assert_294' declared with attribute error: BUILD_BUG_ON
 failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)
Message-ID: <ZM7VtEzNdvSUo9Ky@casper.infradead.org>
References: <202308060105.IP2Npoqr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308060105.IP2Npoqr-lkp@intel.com>

On Sun, Aug 06, 2023 at 01:36:41AM +0800, kernel test robot wrote:
> >> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_294' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)

Right; this isn't actually new.  It just changed name.  Will not fix.

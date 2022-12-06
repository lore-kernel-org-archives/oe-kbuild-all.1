Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17E215CBF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Dec 2022 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RX+gBtNPo0jox8vOogdECCX3Yny3klvQJhbz+8vpSmw=; b=UEDwqfA57XHr3+ZjFgxt5TmyJz
	N4q15ZvYDY266he684LdAuLiTjEytLSmqTEdPAduFW3l6WT9uWVWEXpbZotSMuOupZOaP16dEtDqa
	hLB47BWW0T6mWIMDiS51Us0womBC7SIBBJScbnYK/zaL2JeLiVyez52wcJFpcDuLPvvfD07sicNAt
	meS/eeZXf4v9sJVJ+VTja8MunYSKYUF28l01sXo8oaxtr0PLcN5fW3p0LGs9Do1o/On0Wj5fxnq8e
	CsBIB5m95Nj3fTfzxceX/Bi75d/oURKGhavnuMTqnY7tKnYAb8DbrUk3GuRJvO1Yf14dtNSeDzrOG
	jGMdMgIQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ZhH-004XwD-DE; Tue, 06 Dec 2022 15:17:27 +0000
Date: Tue, 6 Dec 2022 15:17:27 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: kernel test robot <lkp@intel.com>,
	"ira.weiny@intel.com" <ira.weiny@intel.com>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"bvanassche@acm.org" <bvanassche@acm.org>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"songmuchun@bytedance.com" <songmuchun@bytedance.com>,
	"slava@dubeyko.com" <slava@dubeyko.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v2] hfsplus: Add module parameter to enable force writes
Message-ID: <Y49dBzDtwy83+yRT@casper.infradead.org>
References: <79C58B25-8ECF-432B-AE90-2194921DB797@live.com>
 <202212040836.kykb1foO-lkp@intel.com>
 <E3567E25-C2EE-4DA3-AAFD-2833E15A98B9@live.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E3567E25-C2EE-4DA3-AAFD-2833E15A98B9@live.com>

On Sun, Dec 04, 2022 at 06:43:43AM +0000, Aditya Garg wrote:
> 
> 
> > On 04-Dec-2022, at 6:35 AM, kernel test robot <lkp@intel.com> wrote:
> > 
> > Hi Aditya,
> > 
> > Thank you for the patch! Perhaps something to improve:
> > 
> > [auto build test WARNING on akpm-mm/mm-everything]
> > [also build test WARNING on linus/master v6.1-rc7 next-20221202]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Aditya-Garg/hfsplus-Add-module-parameter-to-enable-force-writes/20221203-151143
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/79C58B25-8ECF-432B-AE90-2194921DB797%40live.com
> > patch subject: [PATCH v2] hfsplus: Add module parameter to enable force writes
> > reproduce:
> >        # https://github.com/intel-lab-lkp/linux/commit/dfb483e3c16e562d768f9bddc63252f1cccb0275
> >        git remote add linux-review https://github.com/intel-lab-lkp/linux
> >        git fetch --no-tags linux-review Aditya-Garg/hfsplus-Add-module-parameter-to-enable-force-writes/20221203-151143
> >        git checkout dfb483e3c16e562d768f9bddc63252f1cccb0275
> >        make menuconfig
> >        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
> >        make htmldocs
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >>> Documentation/filesystems/hfsplus.rst:65: WARNING: Unexpected indentation.
> > 
> 
> Do I need to fix this or should I consider it as a false positive?

Your patch creates the warning, so yes you need to fix it.

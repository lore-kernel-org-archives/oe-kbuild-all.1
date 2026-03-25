Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4892D3EE5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 03:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774409275; cv=none; b=l9wRN/lmuZVnn8MrBmr+64RCFS4Hbl6qi5uOG+a2TnfCTgkq4B9VVXO34ll/78Jqj9LFkM8l3lTnDBNCJpupeNtWSGCBlgZUwMWFNNZnU0oO3O9q+4HI5A7e98YPgBAlvgbfG5eGAeAQeF8Fzaenl57tVQ/zSQKLpXFB/gTPEB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774409275; c=relaxed/simple;
	bh=XQI3pacTwDOUH6lX17s48Hb/r1GQJZ4G3TPuumMTRyM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NxxbGqjVoCY4p5EP5gbPX4FdJW9g5PNbTFiPaZHsg4mGZM1rTRArVp1NRSwFxPqiXcZozBRfH2JuBsmfeNxoCKFPrlTJ3XzjKhuH6jb+AwWlld275YalrrPMSxyW+ufPBe8pfClkJ0IbiMLnMTN6u7nDd9VfROiRXLSoWlykJtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=qpqwWuBR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qpqwWuBR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20BC9C19424;
	Wed, 25 Mar 2026 03:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774409275;
	bh=XQI3pacTwDOUH6lX17s48Hb/r1GQJZ4G3TPuumMTRyM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qpqwWuBRgrwruqyXWeUn97gPCvrjWcjAahESuSpINPeyeq2CDtNpXwmhX6NHFaUwl
	 AzVf1ZxljVPoWSoJbVatbfJDUEq8ZWMdLb4Xk7Zp55tKadTu5iaEk0XG48h1D36fqm
	 nYV4h+kIM45nZUaxP+V+9Ax+XZQvVnwIWK0/uxv0=
Date: Tue, 24 Mar 2026 20:27:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Chengkaitao <chengkaitao@kylinos.cn>, oe-kbuild-all@lists.linux.dev,
 David Hildenbrand <david@kernel.org>, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-stable 72/140] arch/sparc/mm/init_64.c:2582:16:
 error: implicit declaration of function 'vmemmap_pgd_populate'; did you
 mean 'vmemmap_populate'?
Message-Id: <20260324202754.6f29c4f6530ec7ea9d1f753d@linux-foundation.org>
In-Reply-To: <202603251147.CtgepAeH-lkp@intel.com>
References: <202603251147.CtgepAeH-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Mar 2026 11:10:49 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
> head:   e393ce79b3cf63c2810be882eb6e531a54f520f4
> commit: e504282091c8e4dc4f945c89d9b44ac2e0bfe504 [72/140] mm: convert vmemmap_p?d_populate() to static functions
> config: sparc-randconfig-001-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251147.CtgepAeH-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251147.CtgepAeH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603251147.CtgepAeH-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    arch/sparc/mm/init_64.c: In function 'sun4v_linear_pte_xor_finalize':
>    arch/sparc/mm/init_64.c:2202:16: warning: variable 'pagecv_flag' set but not used [-Wunused-but-set-variable]
>      unsigned long pagecv_flag;
>                    ^~~~~~~~~~~
>    arch/sparc/mm/init_64.c: In function 'vmemmap_populate':
> >> arch/sparc/mm/init_64.c:2582:16: error: implicit declaration of function 'vmemmap_pgd_populate'; did you mean 'vmemmap_populate'? [-Werror=implicit-function-declaration]
>       pgd_t *pgd = vmemmap_pgd_populate(vstart, node);
>                    ^~~~~~~~~~~~~~~~~~~~

Oh fecal matter.  Seven weeks in mm.git and then seven milliseconds
after I move it into mm-stable, we get this.

The coincidence is too great.  I assume Kernel Test Robot is somehow
treating the mm-stable differently from other branches?  Can we please
not do that?

Thanks, I dropped the patch.  Chengkaitao, please redo and resend after
7.1-rc1.


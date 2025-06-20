Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD91F4171
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 04:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750394797; cv=none; b=LEQn+P/VrBa+GLOvu9ksyzDGvC/E3gD9u38Yf1rpWKbLa0nt1yQdZ/6SlKC+D2lqp1jlehgfAiYDYmso9R8U4E8KcAqsphTUz30MGm9y9dh6UI9NOmoly2pFM9yPKpwcwtOBAONJZIVyQbxfFREsg1Ak94COTwxtXsdYmayUkx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750394797; c=relaxed/simple;
	bh=toG1Q2Narrko8LTZAmJFoiKsCO7fEMP5Q44KkkthhCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMMz0h5czhSJlJhgEl0cAB8eewAQd72tb2+1W66ICkIrS3O+n7ZBLyYs652GYsrx4NC7xTj/ZfqoIgpjIVzSEEWbfRvdFjVEeQgJjcLTpK3F3x//P72pmlvzIjxNiIw7YGn/cBlT9Udzr1jZyndf/GwISzWcbQu+HhXzGNnGI9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSqDhaB+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSqDhaB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750394795; x=1781930795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=toG1Q2Narrko8LTZAmJFoiKsCO7fEMP5Q44KkkthhCQ=;
  b=FSqDhaB+VoPwYUy1An3deps4FAiACG89eZGlsvJJyomLxaVmL5jQ3aEK
   H0fzQVIscTVRC9hNhGtz6HGGCaR7ENoPJM29mU1dGR4eCItbRLG+c7xxQ
   e3rSbG/fwuV/yI0kelgWAZyWQJYg7gtzeCXmWoIUhqYur0hbuMqE+qm2i
   QEtwX9wRQqfwvPcW9FqoGS1MO8mjfkNU4m7nL8iNX7V5fnn1SG2iXyYhy
   Q8YH7LLxDbHEb4fAo1oGMiU3hHr9ZSk+6NhWO3ywI3by//5O5LW8AYftr
   JpjZCZmV9RJaWTRq8ZUNoNrJS3v2+Tw4IOyr7mLY5hB99B12IJjj4Ty0L
   Q==;
X-CSE-ConnectionGUID: AnzSKRbqSNizPyzdK0hHbA==
X-CSE-MsgGUID: RsLFJE+xSxaQK5taNhPvFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64002933"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="64002933"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 21:46:35 -0700
X-CSE-ConnectionGUID: ObChF8rsQbe/f/4QD3c3Qw==
X-CSE-MsgGUID: YkIYzht5TYu1U80zAMYEyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="188035731"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jun 2025 21:46:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSTdx-000LNC-1v;
	Fri, 20 Jun 2025 04:46:25 +0000
Date: Fri, 20 Jun 2025 12:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Lyude Paul <lyude@redhat.com>,
	rcu@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] refscale: Add tests for local_irq_disable() vs
 local_interrupt_disable()
Message-ID: <202506201210.X8F6SB7c-lkp@intel.com>
References: <20250619175335.2905836-1-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619175335.2905836-1-joelagnelf@nvidia.com>

Hi Joel,

kernel test robot noticed the following build errors:

[auto build test ERROR on rcu/rcu/dev]
[also build test ERROR on linus/master v6.16-rc2 next-20250619]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Fernandes/refscale-Add-tests-for-local_irq_disable-vs-local_interrupt_disable/20250620-015541
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git rcu/dev
patch link:    https://lore.kernel.org/r/20250619175335.2905836-1-joelagnelf%40nvidia.com
patch subject: [PATCH v2] refscale: Add tests for local_irq_disable() vs local_interrupt_disable()
config: x86_64-buildonly-randconfig-004-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201210.X8F6SB7c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201210.X8F6SB7c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201210.X8F6SB7c-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/refscale.c: In function 'ref_local_interrupt_section':
>> kernel/rcu/refscale.c:533:17: error: implicit declaration of function 'local_interrupt_disable'; did you mean 'local_irq_disable'? [-Werror=implicit-function-declaration]
     533 |                 local_interrupt_disable();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 local_irq_disable
>> kernel/rcu/refscale.c:534:17: error: implicit declaration of function 'local_interrupt_enable'; did you mean 'local_irq_enable'? [-Werror=implicit-function-declaration]
     534 |                 local_interrupt_enable();
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 local_irq_enable
   cc1: some warnings being treated as errors


vim +533 kernel/rcu/refscale.c

   526	
   527	// IRQ disable/enable tests using interrupt_disable/enable.
   528	static void ref_local_interrupt_section(const int nloops)
   529	{
   530		int i;
   531	
   532		for (i = nloops; i >= 0; i--) {
 > 533			local_interrupt_disable();
 > 534			local_interrupt_enable();
   535		}
   536	}
   537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

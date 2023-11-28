Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D686D7E9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 01:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1r7mRJ-0001uD-3Z; Tue, 28 Nov 2023 01:59:01 +0100
Date: Tue, 28 Nov 2023 01:59:01 +0100
From: Florian Westphal <fw@strlen.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nf-next] netfilter: nf_tables: mark newset as dead on
 transaction abort
Message-ID: <20231128005901.GC20086@breakpoint.cc>
References: <20231127100040.1944-1-fw@strlen.de>
 <202311280410.7aUI1BHd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202311280410.7aUI1BHd-lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

kernel test robot <lkp@intel.com> wrote:
> url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/netfilter-nf_tables-mark-newset-as-dead-on-transaction-abort/20231127-180311
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git master

This needs to be moved to
https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git

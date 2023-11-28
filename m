Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2136FEC5;
	Tue, 28 Nov 2023 03:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELzuE8B1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FD0C433C7;
	Tue, 28 Nov 2023 03:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701140772;
	bh=XgBPJKMGQtdj7j14UvwS1ktKjuguBqOXzWF/XUAm1Ts=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ELzuE8B1bf+CyfDalv648ZD4tAe9eNLnxDNm7AbuO1EgkI5SqsSSvXREbhXZAoocB
	 y5hMj7IwCGaf3BtiI2TVT1gIjM6t64m9IDpA9etNHi9DIh4uCHtsFrKad28jw/F5wH
	 CXvNt8Iksj92vHj4CdiiGcOlWJ8xArTfkvLDJEsmUBQlXM9qW+gMKqHnuwc8kSEtDT
	 AGH2jAVkmAe/McLLzjDMPwWotY4reJPjApY+uNfOvWc4qmt/PyI1q73fGBWkz2O01H
	 NB79m5PrfkX619myce6z8ajy9WmeRkYw8Tw5xPAMvUNNjB3p2uUQ2sbOltwcGfpRl7
	 s+silSiLFFA0w==
Date: Mon, 27 Nov 2023 19:06:11 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: davem@davemloft.net, oe-kbuild-all@lists.linux.dev,
 netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 corbet@lwn.net, leitao@debian.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: netlink: link to family documentations
 from spec info
Message-ID: <20231127190611.37a94d4c@kernel.org>
In-Reply-To: <202311280834.lYzXIFc4-lkp@intel.com>
References: <20231127205642.2293153-1-kuba@kernel.org>
	<202311280834.lYzXIFc4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 Nov 2023 11:01:55 +0800 kernel test robot wrote:
> Hi Jakub,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/docs-netlink-link-to-family-documentations-from-spec-info/20231128-050136
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20231127205642.2293153-1-kuba%40kernel.org
> patch subject: [PATCH net-next] docs: netlink: link to family documentations from spec info
> reproduce: (https://download.01.org/0day-ci/archive/20231128/202311280834.lYzXIFc4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311280834.lYzXIFc4-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst  

Is it possible that the build bot is missing python-yaml support and
the generation of Documentation/networking/netlink_spec/index.rst
fails?

Or is this an ordering issue?

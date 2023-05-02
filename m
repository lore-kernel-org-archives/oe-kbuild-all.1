Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA9064C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=xRd8948Rcur7p+AyV/ClewooI+HHz+axyJ/J+7e04cU=; b=dWYZLifTtQdNxW8QJ/u6b6l1tP
	OyFHnp69RP7UtLVU2KnRHM6NTKyPhKT5GFlI0FP1gRZ6Xfa5sepiExl0qjx/PJbE7Paz0mESUjuu2
	cze4qvY0ennY1Zytm7GpXjgh3uAq3afUiC+fQzlOQjpWtmKKUAzlwnXlDJgu5IM0Ps6+dpnpFriqj
	skZc/WJfVfQu1/2V+ZcJP6dpZpRBQ04cDkDS/VQbULFvf0hX9eSukLwz0b9h3fBkiy16jqZE3PTR8
	hTTHSrD2BVijs0fMNfyI/VoXRQYEHRwAzg2QnDAe//oLsAEiASNr7uGEeF8zU3QX43KNoRLzXqmNq
	I0fSz0BA==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1ptrLS-001rl5-2t;
	Tue, 02 May 2023 14:51:10 +0000
Message-ID: <749e60bd-b861-8766-93b0-b421bfeefd47@infradead.org>
Date: Tue, 2 May 2023 07:51:08 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] docs: consolidate human interface subsystems
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Costa Shulyupin
 <costa.shul@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, open list <linux-kernel@vger.kernel.org>
References: <20230501154258.277866-1-costa.shul@redhat.com>
 <202305021306.dKifEdb7-lkp@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202305021306.dKifEdb7-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi bot,

Already reported and fixed.
Thanks.

On 5/1/23 22:37, kernel test robot wrote:
> Hi Costa,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on lwn/docs-next]
> [also build test WARNING on linus/master v6.3 next-20230428]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Costa-Shulyupin/docs-consolidate-human-interface-subsystems/20230501-234438
> base:   git://git.lwn.net/linux.git docs-next
> patch link:    https://lore.kernel.org/r/20230501154258.277866-1-costa.shul%40redhat.com
> patch subject: [PATCH v2] docs: consolidate human interface subsystems
> reproduce:
>         # https://github.com/intel-lab-lkp/linux/commit/2df620e4b9e2c2827f8a5519f6c266e9e5ef85be
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Costa-Shulyupin/docs-consolidate-human-interface-subsystems/20230501-234438
>         git checkout 2df620e4b9e2c2827f8a5519f6c266e9e5ef85be
>         make menuconfig
>         # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
>         make htmldocs
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202305021306.dKifEdb7-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Documentation/subsystem-apis.rst:14: WARNING: Title underline too short.
> 
> vim +14 Documentation/subsystem-apis.rst
> 
>     12	
>     13	Human interfaces
>   > 14	---------------
>     15	
> 

-- 
~Randy

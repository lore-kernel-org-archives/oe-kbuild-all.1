Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B2395C1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jan 2023 19:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3B8C433EF;
	Fri,  6 Jan 2023 19:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673034756;
	bh=XT2SsianN+UwNw7fibj3lVfKiMxN2Psx8DYS/e1AzL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R+3EwM3jfD0hZPHhdsNPK+qZy9CRryZka2+F0i7eSt6dbx/XU4rHrphZ/MX2PtPRo
	 yBWLdboauqHNpQhBnY2XebDXbsBybBb2lN4swWzm2Qdy+oKbOxmYPUXK/dcnnj1Vhh
	 K1SV986DpdzEO2A+Y7tfgqenwcqS2vLhhzcuZXlXHZZwfyxzFHAeqsnzPS2OWOcWpm
	 7879NnqfVBDtFZgYpcOFmRjZop2xiXf4vWGK52qgbUrf9zidtxqZjgLoJX0huGTokD
	 mwDiKqyBcxJbmZM8e3h5sPp9T2GG18vuThF1P02Rz7zddw6zXTKgafqsDDX25oneNx
	 GyKrXN0UDxVHw==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-doc@vger.kernel.org
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 215/223] htmldocs: Documentation/admin-guide/mm/numaperf.rst:68: WARNING: duplicate label admin-guide/mm/numaperf:numa performance, other instance in Documentation/admin-guide/mm/numaperf.rst
Date: Fri,  6 Jan 2023 19:52:34 +0000
Message-Id: <20230106195234.152725-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202301070349.zrrzmYKM-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi kernel test robot,

On Sat, 7 Jan 2023 03:06:10 +0800 kernel test robot <lkp@intel.com> wrote:

> [-- Attachment #1: Type: text/plain, Size: 1645 bytes --]
> 
> tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
> head:   a2765ca8c916591ebc9af48b4e545922c0bd3c3b
> commit: 4fbeee6b758e6cb96047d94a514e082eafdb0ebb [215/223] Docs/admin-guide/mm/numaperf: increase depth of subsections
> reproduce:
>         # https://github.com/ammarfaizi2/linux-block/commit/4fbeee6b758e6cb96047d94a514e082eafdb0ebb
>         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>         git fetch --no-tags ammarfaizi2-block akpm/mm/mm-unstable
>         git checkout 4fbeee6b758e6cb96047d94a514e082eafdb0ebb
>         make menuconfig
>         # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
>         make htmldocs
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> Documentation/admin-guide/mm/numaperf.rst:68: WARNING: duplicate label admin-guide/mm/numaperf:numa performance, other instance in Documentation/admin-guide/mm/numaperf.rst
> 
> vim +68 Documentation/admin-guide/mm/numaperf.rst
> 
> dc9e7860df9162 Jonathan Cameron 2020-09-30  66  
> 13bac55ef7aef8 Keith Busch      2019-03-11  67  NUMA Performance
> 13bac55ef7aef8 Keith Busch      2019-03-11 @68  ================
> 13bac55ef7aef8 Keith Busch      2019-03-11  69  

Thank you for the report.  Just sent a fix:
https://lore.kernel.org/linux-mm/20230106194927.152663-1-sj@kernel.org/


Thanks,
SJ

[...]

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E35F136A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 19:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DECFC433F0;
	Tue, 13 Jun 2023 19:51:20 +0000 (UTC)
Date: Tue, 13 Jun 2023 20:51:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 9057/9385]
 arch/microblaze/include/asm/page.h:34: warning: "ARCH_DMA_MINALIGN"
 redefined
Message-ID: <ZIjItn2Bg3+u3ir0@arm.com>
References: <202306140347.S9nJS3Al-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306140347.S9nJS3Al-lkp@intel.com>

On Wed, Jun 14, 2023 at 03:31:16AM +0800, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/shm.h:6,
>                     from include/linux/sched.h:16,
>                     from arch/microblaze/kernel/asm-offsets.c:13:
> >> arch/microblaze/include/asm/page.h:34: warning: "ARCH_DMA_MINALIGN" redefined

It should be fixed by this series (picked up by Andrew a few minutes
ago):

https://lore.kernel.org/r/20230613155245.1228274-1-catalin.marinas@arm.com

Thanks for the report.

-- 
Catalin

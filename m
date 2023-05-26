Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF573A93B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 08:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A00C433EF;
	Fri, 26 May 2023 08:16:25 +0000 (UTC)
Date: Fri, 26 May 2023 09:16:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: kernel test robot <lkp@intel.com>, Robin Murphy <robin.murphy@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [arm64:devel/kmalloc-minalign 13/15]
 include/linux/scatterlist.h:257:18: error: 'struct scatterlist' has no
 member named 'dma_flags'
Message-ID: <ZHBq1iFAmZ7p8tae@arm.com>
References: <202305260427.aA5xG5kM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305260427.aA5xG5kM-lkp@intel.com>

On Fri, May 26, 2023 at 04:23:54AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git devel/kmalloc-minalign
> head:   d929a28c8da3f1bc095e4aa0d1b811972929351a
> commit: f0b92f544e6b440500c3823c7c47b542816cb4cd [13/15] iommu/dma: Force bouncing if the size is not cacheline-aligned
> config: x86_64-buildonly-randconfig-r002-20230524
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=f0b92f544e6b440500c3823c7c47b542816cb4cd
>         git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
>         git fetch --no-tags arm64 devel/kmalloc-minalign
>         git checkout f0b92f544e6b440500c3823c7c47b542816cb4cd
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/rapidio/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305260427.aA5xG5kM-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/dma-mapping.h:10,
>                     from drivers/rapidio/rio-scan.c:21:
>    include/linux/scatterlist.h: In function 'sg_is_dma_use_swiotlb':
> >> include/linux/scatterlist.h:257:18: error: 'struct scatterlist' has no member named 'dma_flags'
>      257 |         return sg->dma_flags & SG_DMA_USE_SWIOTLB;
>          |                  ^~

I fixed it as:

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 330a157c5501..3a1fd9e23a83 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -251,7 +251,7 @@ static inline void sg_unmark_end(struct scatterlist *sg)
 #define SG_DMA_BUS_ADDRESS	(1 << 0)
 #define SG_DMA_USE_SWIOTLB	(1 << 1)

-#ifdef CONFIG_SWIOTLB
+#if defined(CONFIG_IOMMU_DMA) && defined(CONFIG_SWIOTLB)
 static inline bool sg_is_dma_use_swiotlb(struct scatterlist *sg)
 {
 	return sg->dma_flags & SG_DMA_USE_SWIOTLB;

But I wonder whether we could move these functions in the dma-iommu.c
code as they get included in lots of unrelated places.

-- 
Catalin

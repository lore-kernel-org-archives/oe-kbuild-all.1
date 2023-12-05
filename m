Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E711C8BF1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 09:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85C88139F;
	Tue,  5 Dec 2023 01:11:52 -0800 (PST)
Received: from [192.168.1.3] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE68F3F6C4;
	Tue,  5 Dec 2023 01:11:03 -0800 (PST)
Message-ID: <4615fe3e-7f11-d8c6-596b-32833db458d2@arm.com>
Date: Tue, 5 Dec 2023 09:11:03 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] coresight: Make current W=1 warnings default
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, coresight@lists.linaro.org,
 suzuki.poulose@arm.com
Cc: oe-kbuild-all@lists.linux.dev, Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20231115162834.355598-1-james.clark@arm.com>
 <202312050158.FKpxuafP-lkp@intel.com>
From: James Clark <james.clark@arm.com>
In-Reply-To: <202312050158.FKpxuafP-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/12/2023 18:37, kernel test robot wrote:
> Hi James,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on atorgue-stm32/stm32-next]
> [also build test WARNING on linus/master v6.7-rc4 next-20231204]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/James-Clark/coresight-Make-current-W-1-warnings-default/20231116-004818
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
> patch link:    https://lore.kernel.org/r/20231115162834.355598-1-james.clark%40arm.com
> patch subject: [PATCH v2] coresight: Make current W=1 warnings default
> config: arm-randconfig-r131-20231117 (https://download.01.org/0day-ci/archive/20231205/202312050158.FKpxuafP-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231205/202312050158.FKpxuafP-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312050158.FKpxuafP-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> drivers/hwtracing/coresight/coresight-etb10.c:840:17: sparse: sparse: Using plain integer as NULL pointer
>    drivers/hwtracing/coresight/coresight-etb10.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
>    include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
> --
>>> drivers/hwtracing/coresight/coresight-funnel.c:395:17: sparse: sparse: Using plain integer as NULL pointer
>    drivers/hwtracing/coresight/coresight-funnel.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
>    include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
> --
>>> drivers/hwtracing/coresight/coresight-tpdm.c:242:17: sparse: sparse: Using plain integer as NULL pointer
>    drivers/hwtracing/coresight/coresight-tpdm.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
>    include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
> 
> vim +840 drivers/hwtracing/coresight/coresight-etb10.c
> 
>    834	
>    835	static const struct amba_id etb_ids[] = {
>    836		{
>    837			.id	= 0x000bb907,
>    838			.mask	= 0x000fffff,
>    839		},
>  > 840		{ 0, 0, 0 },
>    841	};
>    842	
> 

This should already be fixed in V3 here:

https://lore.kernel.org/linux-arm-kernel/20231123120459.287578-1-james.clark@arm.com/

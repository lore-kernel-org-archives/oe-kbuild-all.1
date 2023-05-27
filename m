Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B698C379
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 08:31:28 +0000 (UTC)
Received: from dggpeml500002.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QSw0q6Mc4zLpv8;
	Sat, 27 May 2023 16:28:27 +0800 (CST)
Received: from [10.67.103.44] (10.67.103.44) by dggpeml500002.china.huawei.com
 (7.185.36.158) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sat, 27 May
 2023 16:31:25 +0800
Subject: Re: [PATCH 1/3] drivers/perf: hisi: Add support for HiSilicon H60PA
 and PAv3 PMU driver
To: kernel test robot <lkp@intel.com>, <will@kernel.org>,
	<jonathan.cameron@huawei.com>, <linux-kernel@vger.kernel.org>,
	<mark.rutland@arm.com>
References: <20230523131825.6102-2-hejunhao3@huawei.com>
 <202305241109.DJKYvjGM-lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linuxarm@huawei.com>, <yangyicong@huawei.com>,
	<shenyang39@huawei.com>, <prime.zeng@hisilicon.com>
From: hejunhao <hejunhao3@huawei.com>
Message-ID: <6e7afde3-1358-ddcf-fca1-bd0056285cd8@huawei.com>
Date: Sat, 27 May 2023 16:31:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202305241109.DJKYvjGM-lkp@intel.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.103.44]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500002.china.huawei.com (7.185.36.158)
X-CFilter-Loop: Reflected


On 2023/5/24 12:28, kernel test robot wrote:
> Hi Junhao,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.4-rc3 next-20230523]
> [cannot apply to soc/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Junhao-He/drivers-perf-hisi-Add-support-for-HiSilicon-H60PA-and-PAv3-PMU-driver/20230523-215041
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20230523131825.6102-2-hejunhao3%40huawei.com
> patch subject: [PATCH 1/3] drivers/perf: hisi: Add support for HiSilicon H60PA and PAv3 PMU driver
> config: arm64-allyesconfig
> compiler: aarch64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/f89c838447a57f5b51474a6aea981acbe68f73b9
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Junhao-He/drivers-perf-hisi-Add-support-for-HiSilicon-H60PA-and-PAv3-PMU-driver/20230523-215041
>          git checkout f89c838447a57f5b51474a6aea981acbe68f73b9
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/perf/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305241109.DJKYvjGM-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>     In file included from drivers/perf/hisilicon/hisi_uncore_pmu.c:21:
>>> drivers/perf/hisilicon/hisi_uncore_pmu.h:140:5: warning: no previous prototype for 'hisi_uncore_pmu_ver2idx' [-Wmissing-prototypes]
>       140 | int hisi_uncore_pmu_ver2idx(struct hisi_pmu *pmu)
>           |     ^~~~~~~~~~~~~~~~~~~~~~~

Thanks, Will fix in next version.

>
> vim +/hisi_uncore_pmu_ver2idx +140 drivers/perf/hisilicon/hisi_uncore_pmu.h
>
>     139	
>   > 140	int hisi_uncore_pmu_ver2idx(struct hisi_pmu *pmu)
>


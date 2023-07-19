Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1921C2E9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 08:09:16 +0000 (UTC)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4R5T0N0Nwjz688JV;
	Wed, 19 Jul 2023 16:05:56 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 19 Jul
 2023 09:09:13 +0100
Date: Wed, 19 Jul 2023 09:09:12 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH v3 4/4] cxl/pci: Add support for stand alone CXL
 Switch mailbox CCI
Message-ID: <20230719090912.0000531f@Huawei.com>
In-Reply-To: <202307190326.roT6GWpa-lkp@intel.com>
References: <20230717162557.8625-5-Jonathan.Cameron@huawei.com>
	<202307190326.roT6GWpa-lkp@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected

On Wed, 19 Jul 2023 04:08:52 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Jonathan,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on cxl/next]
> [also build test ERROR on pci/next pci/for-linus linus/master v6.5-rc2 next-20230718]
> [cannot apply to cxl/pending]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/cxl-mbox-Preparatory-move-of-functions-to-core-mbox-c/20230718-181730
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
> patch link:    https://lore.kernel.org/r/20230717162557.8625-5-Jonathan.Cameron%40huawei.com
> patch subject: [RFC PATCH v3 4/4] cxl/pci: Add support for stand alone CXL Switch mailbox CCI
> config: parisc-randconfig-r003-20230718 (https://download.01.org/0day-ci/archive/20230719/202307190326.roT6GWpa-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190326.roT6GWpa-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307190326.roT6GWpa-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> make[5]: *** No rule to make target 'drivers/cxl/core/switch-cci.o', needed by 'drivers/cxl/core/built-in.a'.  
>    make[5]: *** [scripts/Makefile.build:252: drivers/cxl/core/mbox.o] Error 1 shuffle=4085622744
>    make[5]: Target 'drivers/cxl/core/' not remade because of errors.
> 
oops. Will resend with the missing file and the other issue fixed. 


Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F26D2C9C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 11:00:49 +0000 (UTC)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PxxMn5DKCz67N2W;
	Thu, 13 Apr 2023 18:56:21 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 13 Apr
 2023 12:00:45 +0100
Date: Thu, 13 Apr 2023 12:00:44 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [jic23-iio:testing 2/10]
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2690:21: error: expected ';'
 before '}' token
Message-ID: <20230413120044.000004a2@Huawei.com>
In-Reply-To: <202304130917.JK9wknvK-lkp@intel.com>
References: <202304130917.JK9wknvK-lkp@intel.com>
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
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected

On Thu, 13 Apr 2023 09:20:08 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> head:   32f442dba193b5682bd1e9784b0ea42893c6e966
> commit: 7a8fe04fbdc0cbb4da0fb6a5779a5f3959dc64c7 [2/10] iio: imu: lsm6dsx: Add ACPI mount matrix retrieval
> config: openrisc-randconfig-r003-20230409 (https://download.01.org/0day-ci/archive/20230413/202304130917.JK9wknvK-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=7a8fe04fbdc0cbb4da0fb6a5779a5f3959dc64c7
>         git remote add jic23-iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
>         git fetch --no-tags jic23-iio testing
>         git checkout 7a8fe04fbdc0cbb4da0fb6a5779a5f3959dc64c7
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/iio/imu/st_lsm6dsx/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304130917.JK9wknvK-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c: In function 'lsm6dsx_get_acpi_mount_matrix':
> >> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2690:21: error: expected ';' before '}' token  
>     2690 |         return false
Ouch.  Fixed

Thanks,

Jonathan

>          |                     ^
>          |                     ;
>     2691 | }
>          | ~                    
> 
> 
> vim +2690 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> 
>   2686	
>   2687	static int lsm6dsx_get_acpi_mount_matrix(struct device *dev,
>   2688						  struct iio_mount_matrix *orientation)
>   2689	{
> > 2690		return false  
>   2691	}
>   2692	
> 


Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12423205
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Apr 2023 20:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680554395; x=1712090395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P+ArDF7g3Q1BhXVAGymZodKOHspveJm8iKHbAkAMNUk=;
  b=bKH78VsrFbTwALy0EMUEZy3X8W+Y85kLxJ5FRN5WseTedsM3poYXsZE4
   /jG1kdteqAWV2T39Ujr8DMFcxOwnBWvUD6nkMWFXjD5ISArzFiqhFj/Qi
   GkowgqErNgyzrsdgElOZrHRPB2M4jibby/dMS+A9+LHHpOfIsgYQirzgp
   RTf0FqbzuMEF63XdimgWjGDyl7rMemotqqihFrCeUUyJxx9fPViYta1P8
   Uo+qAKiaF7FnPDX6fzX/NF3NAK7z8kz2HQEA8Ua48FE5rHO8VyCdWWSGb
   nnjPFcIrpjzWS/o03cf8p0iuWiwWgKJ/Rb9lqW0CCzgjleFKIOAv/RQqQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="428298766"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="428298766"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 13:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="809962379"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="809962379"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Apr 2023 13:39:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjQxn-000Onq-1o;
	Mon, 03 Apr 2023 20:39:39 +0000
Date: Tue, 4 Apr 2023 04:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: Orlando Chamberlain <orlandoch.dev@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [linux-next:master 3256/8744]
 drivers/platform/x86/apple-gmux.c:224:48: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202304040401.IMxt7Ubi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   31bd35b66249699343d2416658f57e97314a433a
commit: 0c18184de990e63f708b090bcb9fc6c0fbc427cd [3256/8744] platform/x86: apple-gmux: support MMIO gmux on T2 Macs
config: x86_64-randconfig-s023-20230403 (https://download.01.org/0day-ci/archive/20230404/202304040401.IMxt7Ubi-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0c18184de990e63f708b090bcb9fc6c0fbc427cd
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0c18184de990e63f708b090bcb9fc6c0fbc427cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304040401.IMxt7Ubi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/apple-gmux.c:224:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/platform/x86/apple-gmux.c:224:48: sparse:     expected void const [noderef] __iomem *
   drivers/platform/x86/apple-gmux.c:224:48: sparse:     got unsigned char [usertype] *
   drivers/platform/x86/apple-gmux.c:227:53: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/platform/x86/apple-gmux.c:227:53: sparse:     expected void const [noderef] __iomem *
   drivers/platform/x86/apple-gmux.c:227:53: sparse:     got unsigned char [usertype] *
>> drivers/platform/x86/apple-gmux.c:241:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/platform/x86/apple-gmux.c:241:55: sparse:     expected void [noderef] __iomem *
   drivers/platform/x86/apple-gmux.c:241:55: sparse:     got unsigned char [usertype] *
   drivers/platform/x86/apple-gmux.c:243:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/platform/x86/apple-gmux.c:243:39: sparse:     expected void [noderef] __iomem *
   drivers/platform/x86/apple-gmux.c:243:39: sparse:     got unsigned char [usertype] *
>> drivers/platform/x86/apple-gmux.c:245:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned char [usertype] *[noderef] iomem_base @@
   drivers/platform/x86/apple-gmux.c:245:32: sparse:     expected void const [noderef] __iomem *
   drivers/platform/x86/apple-gmux.c:245:32: sparse:     got unsigned char [usertype] *[noderef] iomem_base
>> drivers/platform/x86/apple-gmux.c:256:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] *[noderef] iomem_base @@
   drivers/platform/x86/apple-gmux.c:256:32: sparse:     expected void [noderef] __iomem *
   drivers/platform/x86/apple-gmux.c:256:32: sparse:     got unsigned char [usertype] *[noderef] iomem_base
   drivers/platform/x86/apple-gmux.c:258:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/platform/x86/apple-gmux.c:258:53: sparse:     expected void [noderef] __iomem *
   drivers/platform/x86/apple-gmux.c:258:53: sparse:     got unsigned char [usertype] *
   drivers/platform/x86/apple-gmux.c:260:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/platform/x86/apple-gmux.c:260:39: sparse:     expected void [noderef] __iomem *
   drivers/platform/x86/apple-gmux.c:260:39: sparse:     got unsigned char [usertype] *
   drivers/platform/x86/apple-gmux.c:272:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/platform/x86/apple-gmux.c:272:55: sparse:     expected void [noderef] __iomem *
   drivers/platform/x86/apple-gmux.c:272:55: sparse:     got unsigned char [usertype] *
   drivers/platform/x86/apple-gmux.c:274:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/platform/x86/apple-gmux.c:274:39: sparse:     expected void [noderef] __iomem *
   drivers/platform/x86/apple-gmux.c:274:39: sparse:     got unsigned char [usertype] *
   drivers/platform/x86/apple-gmux.c:276:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned char [usertype] *[noderef] iomem_base @@
   drivers/platform/x86/apple-gmux.c:276:15: sparse:     expected void const [noderef] __iomem *
   drivers/platform/x86/apple-gmux.c:276:15: sparse:     got unsigned char [usertype] *[noderef] iomem_base
>> drivers/platform/x86/apple-gmux.c:276:15: sparse: sparse: cast to restricted __be32
>> drivers/platform/x86/apple-gmux.c:286:19: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/platform/x86/apple-gmux.c:286:19: sparse:     expected unsigned int [usertype]
   drivers/platform/x86/apple-gmux.c:286:19: sparse:     got restricted __be32 [usertype]
   drivers/platform/x86/apple-gmux.c:286:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] *[noderef] iomem_base @@
   drivers/platform/x86/apple-gmux.c:286:46: sparse:     expected void [noderef] __iomem *
   drivers/platform/x86/apple-gmux.c:286:46: sparse:     got unsigned char [usertype] *[noderef] iomem_base
   drivers/platform/x86/apple-gmux.c:287:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/platform/x86/apple-gmux.c:287:53: sparse:     expected void [noderef] __iomem *
   drivers/platform/x86/apple-gmux.c:287:53: sparse:     got unsigned char [usertype] *
   drivers/platform/x86/apple-gmux.c:289:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/platform/x86/apple-gmux.c:289:39: sparse:     expected void [noderef] __iomem *
   drivers/platform/x86/apple-gmux.c:289:39: sparse:     got unsigned char [usertype] *
>> drivers/platform/x86/apple-gmux.c:739:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *[noderef] iomem_base @@     got void [noderef] __iomem * @@
   drivers/platform/x86/apple-gmux.c:739:39: sparse:     expected unsigned char [usertype] *[noderef] iomem_base
   drivers/platform/x86/apple-gmux.c:739:39: sparse:     got void [noderef] __iomem *
>> drivers/platform/x86/apple-gmux.c:889:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *[noderef] iomem_base @@
   drivers/platform/x86/apple-gmux.c:889:34: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/apple-gmux.c:889:34: sparse:     got unsigned char [usertype] *[noderef] iomem_base
   drivers/platform/x86/apple-gmux.c:916:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *[noderef] iomem_base @@
   drivers/platform/x86/apple-gmux.c:916:34: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/apple-gmux.c:916:34: sparse:     got unsigned char [usertype] *[noderef] iomem_base
>> drivers/platform/x86/apple-gmux.c:224:26: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:227:31: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:241:33: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:243:17: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:245:23: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:256:23: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:258:31: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:260:17: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:272:33: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:274:17: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:276:15: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:286:37: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:287:31: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:289:17: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c: note: in included file:
>> include/linux/apple-gmux.h:69:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *[noderef] __iomem iomem_base @@     got void [noderef] __iomem * @@
   include/linux/apple-gmux.h:69:41: sparse:     expected unsigned char [usertype] *[noderef] __iomem iomem_base
   include/linux/apple-gmux.h:69:41: sparse:     got void [noderef] __iomem *
>> include/linux/apple-gmux.h:80:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned char [usertype] * @@
   include/linux/apple-gmux.h:80:34: sparse:     expected void const [noderef] __iomem *
   include/linux/apple-gmux.h:80:34: sparse:     got unsigned char [usertype] *
>> include/linux/apple-gmux.h:81:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *[noderef] __iomem iomem_base @@
   include/linux/apple-gmux.h:81:17: sparse:     expected void volatile [noderef] __iomem *addr
   include/linux/apple-gmux.h:81:17: sparse:     got unsigned char [usertype] *[noderef] __iomem iomem_base
>> include/linux/apple-gmux.h:72:14: sparse: sparse: dereference of noderef expression
   include/linux/apple-gmux.h:80:23: sparse: sparse: dereference of noderef expression
   include/linux/apple-gmux.h:81:17: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:740:22: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:888:13: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:889:25: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:915:13: sparse: sparse: dereference of noderef expression
   drivers/platform/x86/apple-gmux.c:916:25: sparse: sparse: dereference of noderef expression

vim +224 drivers/platform/x86/apple-gmux.c

   220	
   221	static int gmux_mmio_wait(struct apple_gmux_data *gmux_data)
   222	{
   223		int i = 200;
 > 224		u8 gwr = ioread8(gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
   225	
   226		while (i && gwr) {
 > 227			gwr = ioread8(gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
   228			udelay(100);
   229			i--;
   230		}
   231	
   232		return !!i;
   233	}
   234	
   235	static u8 gmux_mmio_read8(struct apple_gmux_data *gmux_data, int port)
   236	{
   237		u8 val;
   238	
   239		mutex_lock(&gmux_data->index_lock);
   240		gmux_mmio_wait(gmux_data);
 > 241		iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
   242		iowrite8(GMUX_MMIO_READ | sizeof(val),
   243			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
   244		gmux_mmio_wait(gmux_data);
 > 245		val = ioread8(gmux_data->iomem_base);
   246		mutex_unlock(&gmux_data->index_lock);
   247	
   248		return val;
   249	}
   250	
   251	static void gmux_mmio_write8(struct apple_gmux_data *gmux_data, int port,
   252				      u8 val)
   253	{
   254		mutex_lock(&gmux_data->index_lock);
   255		gmux_mmio_wait(gmux_data);
 > 256		iowrite8(val, gmux_data->iomem_base);
   257	
   258		iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
   259		iowrite8(GMUX_MMIO_WRITE | sizeof(val),
   260			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
   261	
   262		gmux_mmio_wait(gmux_data);
   263		mutex_unlock(&gmux_data->index_lock);
   264	}
   265	
   266	static u32 gmux_mmio_read32(struct apple_gmux_data *gmux_data, int port)
   267	{
   268		u32 val;
   269	
   270		mutex_lock(&gmux_data->index_lock);
   271		gmux_mmio_wait(gmux_data);
 > 272		iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
   273		iowrite8(GMUX_MMIO_READ | sizeof(val),
   274			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
   275		gmux_mmio_wait(gmux_data);
 > 276		val = be32_to_cpu(ioread32(gmux_data->iomem_base));
   277		mutex_unlock(&gmux_data->index_lock);
   278	
   279		return val;
   280	}
   281	
   282	static void gmux_mmio_write32(struct apple_gmux_data *gmux_data, int port,
   283				       u32 val)
   284	{
   285		mutex_lock(&gmux_data->index_lock);
 > 286		iowrite32(cpu_to_be32(val), gmux_data->iomem_base);
 > 287		iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
   288		iowrite8(GMUX_MMIO_WRITE | sizeof(val),
   289			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
   290		gmux_mmio_wait(gmux_data);
   291		mutex_unlock(&gmux_data->index_lock);
   292	}
   293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

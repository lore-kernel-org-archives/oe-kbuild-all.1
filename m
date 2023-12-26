Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF5D23B9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Dec 2023 02:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4SzdbY1J6Fz1FFcJ;
	Tue, 26 Dec 2023 10:13:13 +0800 (CST)
Received: from kwepemd100002.china.huawei.com (unknown [7.221.188.184])
	by mail.maildlp.com (Postfix) with ESMTPS id F26AC14011F;
	Tue, 26 Dec 2023 10:17:02 +0800 (CST)
Received: from M910t (10.110.54.157) by kwepemd100002.china.huawei.com
 (7.221.188.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1258.28; Tue, 26 Dec
 2023 10:17:02 +0800
Date: Tue, 26 Dec 2023 10:16:51 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Yury Norov <yury.norov@gmail.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, Linux
 Memory Management List <linux-mm@kvack.org>, Stephen Rothwell
	<sfr@canb.auug.org.au>, <akpm@linux-foundation.org>, Changbin Du
	<changbin.du@huawei.com>
Subject: Re: [linux-next:master 9918/9925] powerpc64-linux-ld: warning:
 orphan section `.bss..Lubsan_data794' from `kernel/ptrace.o' being placed in
 section `.bss..Lubsan_data794'
Message-ID: <20231226021651.i6c7ar27xb7b2tb4@M910t>
References: <202312230642.EBF6kiYY-lkp@intel.com>
 <ZYm5l6AIMVMs69RC@yury-ThinkPad>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZYm5l6AIMVMs69RC@yury-ThinkPad>
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd100002.china.huawei.com (7.221.188.184)

On Mon, Dec 25, 2023 at 09:19:19AM -0800, Yury Norov wrote:
> On Sat, Dec 23, 2023 at 06:15:23AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   39676dfe52331dba909c617f213fdb21015c8d10
> > commit: c6aa10bc7b8bfcfaca4311ac5f39b4d6eb5b1ccf [9918/9925] Merge branch 'bitmap-for-next' of https://github.com/norov/linux.git
> > config: powerpc64-randconfig-r035-20211208 (https://download.01.org/0day-ci/archive/20231223/202312230642.EBF6kiYY-lkp@intel.com/config)
> > compiler: powerpc64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230642.EBF6kiYY-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202312230642.EBF6kiYY-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data794' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data794'
> >    powerpc64-linux-ld: warning: discarding dynamic section .glink
> >    powerpc64-linux-ld: warning: discarding dynamic section .plt
> >    powerpc64-linux-ld: linkage table error against `flush_module_init_free_work'
> >    powerpc64-linux-ld: stubs don't match calculated size
> >    powerpc64-linux-ld: can not build stubs: bad value
> >    powerpc64-linux-ld: init/main.o: in function `kernel_init':
> >    main.c:(.ref.text+0x224): undefined reference to `flush_module_init_free_work'
> 
> + Stephen Rothwell, Changbin Du
> 
> So, it looks misattributed, and already fixed in 9a63d5058dd3545?
>
This is introuced by my patch V1 and fixed in V2. The version 2 is here (which
adds dummy definition for no CONFIG_MODULES):
https://lore.kernel.org/all/20231225061513.2984575-1-changbin.du@huawei.com/

Sorry for the trouble.

+ Morton

--
Cheers,
Changbin Du

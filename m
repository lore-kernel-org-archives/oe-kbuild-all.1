Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030E42DF65
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 11:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500023.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Slb531M4hzShvp;
	Wed,  6 Dec 2023 19:38:31 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 kwepemi500023.china.huawei.com (7.221.188.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 19:42:52 +0800
Received: from dggpemm500006.china.huawei.com ([7.185.36.236]) by
 dggpemm500006.china.huawei.com ([7.185.36.236]) with mapi id 15.01.2507.035;
 Wed, 6 Dec 2023 19:42:52 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: drivers/crypto/virtio/virtio_crypto_common.h:116:13: warning:
 variable 'cpu' set but not used
Thread-Topic: drivers/crypto/virtio/virtio_crypto_common.h:116:13: warning:
 variable 'cpu' set but not used
Thread-Index: AQHaJiLRicCCC7Kd2kaW9jApNQwiILCXe7+AgASpWRA=
Date: Wed, 6 Dec 2023 11:42:52 +0000
Message-ID: <3befffb631604bc4bf7fcb67970736df@huawei.com>
References: <202312040315.kPrI1OCE-lkp@intel.com>
 <20231203152646-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231203152646-mutt-send-email-mst@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-CFilter-Loop: Reflected



> -----Original Message-----
> From: Michael S. Tsirkin [mailto:mst@redhat.com]
> Sent: Monday, December 4, 2023 4:27 AM
> To: kernel test robot <lkp@intel.com>
> Cc: Gonglei (Arei) <arei.gonglei@huawei.com>; oe-kbuild-all@lists.linux.d=
ev;
> linux-kernel@vger.kernel.org
> Subject: Re: drivers/crypto/virtio/virtio_crypto_common.h:116:13: warning=
:
> variable 'cpu' set but not used
>=20
> On Mon, Dec 04, 2023 at 03:55:43AM +0800, kernel test robot wrote:
> > Hi Gonglei,
> >
> > FYI, the error/warning still remains.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git
> master
> > head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
> > commit: dbaf0624ffa57ae6e7d87a823185ccd9a7852d3c crypto: add
> virtio-crypto driver
> > date:   7 years ago
> > config: x86_64-randconfig-015-20231011
> > (https://download.01.org/0day-ci/archive/20231204/202312040315.kPrI1OC
> > E-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0 reproduce (this is a W=3D1
> > build):
> > (https://download.01.org/0day-ci/archive/20231204/202312040315.kPrI1OC
> > E-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new
> > version of the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > | https://lore.kernel.org/oe-kbuild-all/202312040315.kPrI1OCE-lkp@inte
> > | l.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    In file included from drivers/crypto/virtio/virtio_crypto_algs.c:28:
> >    drivers/crypto/virtio/virtio_crypto_common.h: In function
> 'virtio_crypto_get_current_node':
> > >> drivers/crypto/virtio/virtio_crypto_common.h:116:13: warning:
> > >> variable 'cpu' set but not used [-Wunused-but-set-variable]
> >      116 |         int cpu, node;
> >          |             ^~~
> > --
> >    In file included from drivers/crypto/virtio/virtio_crypto_core.c:25:
> >    drivers/crypto/virtio/virtio_crypto_common.h: In function
> 'virtio_crypto_get_current_node':
> > >> drivers/crypto/virtio/virtio_crypto_common.h:116:13: warning:
> > >> variable 'cpu' set but not used [-Wunused-but-set-variable]
> >      116 |         int cpu, node;
> >          |             ^~~

The warning occurs when CONFIG_SMG is not set. Will fix it later.


> >    In file included from drivers/crypto/virtio/virtio_crypto_core.c:20:
> >    drivers/crypto/virtio/virtio_crypto_core.c: At top level:
> >    include/linux/module.h:132:13: warning: 'init_module' specifies less
> restrictive attribute than its target 'virtio_crypto_driver_init': 'cold'
> [-Wmissing-attributes]
> >      132 |         int init_module(void) __attribute__((alias(#initfn))=
);
> >          |             ^~~~~~~~~~~
> >    include/linux/device.h:1463:1: note: in expansion of macro 'module_i=
nit'
> >     1463 | module_init(__driver##_init); \
> >          | ^~~~~~~~~~~
> >    include/linux/virtio.h:190:9: note: in expansion of macro 'module_dr=
iver'
> >      190 |         module_driver(__virtio_driver, register_virtio_drive=
r, \
> >          |         ^~~~~~~~~~~~~
> >    drivers/crypto/virtio/virtio_crypto_core.c:471:1: note: in expansion=
 of
> macro 'module_virtio_driver'
> >      471 | module_virtio_driver(virtio_crypto_driver);
> >          | ^~~~~~~~~~~~~~~~~~~~
> >    In file included from include/linux/virtio.h:8,
> >                     from include/linux/virtio_config.h:6,
> >                     from drivers/crypto/virtio/virtio_crypto_core.c:21:
> >    drivers/crypto/virtio/virtio_crypto_core.c:471:22: note: 'init_modul=
e'
> target declared here
> >      471 | module_virtio_driver(virtio_crypto_driver);
> >          |                      ^~~~~~~~~~~~~~~~~~~~
> >    include/linux/device.h:1459:19: note: in definition of macro
> 'module_driver'
> >     1459 | static int __init __driver##_init(void) \
> >          |                   ^~~~~~~~
> >    drivers/crypto/virtio/virtio_crypto_core.c:471:1: note: in expansion=
 of
> macro 'module_virtio_driver'
> >      471 | module_virtio_driver(virtio_crypto_driver);
> >          | ^~~~~~~~~~~~~~~~~~~~
> >    include/linux/module.h:138:14: warning: 'cleanup_module' specifies l=
ess
> restrictive attribute than its target 'virtio_crypto_driver_exit': 'cold'
> [-Wmissing-attributes]
> >      138 |         void cleanup_module(void)
> __attribute__((alias(#exitfn)));
> >          |              ^~~~~~~~~~~~~~
> >    include/linux/device.h:1468:1: note: in expansion of macro 'module_e=
xit'
> >     1468 | module_exit(__driver##_exit);
> >          | ^~~~~~~~~~~
> >    include/linux/virtio.h:190:9: note: in expansion of macro 'module_dr=
iver'
> >      190 |         module_driver(__virtio_driver, register_virtio_drive=
r, \
> >          |         ^~~~~~~~~~~~~
> >    drivers/crypto/virtio/virtio_crypto_core.c:471:1: note: in expansion=
 of
> macro 'module_virtio_driver'
> >      471 | module_virtio_driver(virtio_crypto_driver);
> >          | ^~~~~~~~~~~~~~~~~~~~
> >    drivers/crypto/virtio/virtio_crypto_core.c:471:22: note:
> 'cleanup_module' target declared here
> >      471 | module_virtio_driver(virtio_crypto_driver);
> >          |                      ^~~~~~~~~~~~~~~~~~~~
> >    include/linux/device.h:1464:20: note: in definition of macro
> 'module_driver'
> >     1464 | static void __exit __driver##_exit(void) \
> >          |                    ^~~~~~~~
> >    drivers/crypto/virtio/virtio_crypto_core.c:471:1: note: in expansion=
 of
> macro 'module_virtio_driver'
> >      471 | module_virtio_driver(virtio_crypto_driver);
> >          | ^~~~~~~~~~~~~~~~~~~~
> >
Actually those warnings were fixed by upstream commit a6e60d84989.

> >
> > vim +/cpu +116 drivers/crypto/virtio/virtio_crypto_common.h
> >
> >    113
> >    114	static inline int virtio_crypto_get_current_node(void)
> >    115	{
> >  > 116		int cpu, node;
> >    117
> >    118		cpu =3D get_cpu();
> >    119		node =3D topology_physical_package_id(cpu);
> >    120		put_cpu();
> >    121
> >    122		return node;
> >    123	}
> >    124
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
>=20
> Seems easy to fix. Gonglei?
>=20

Regards,
-Gonglei


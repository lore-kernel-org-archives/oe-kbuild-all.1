Content-Type: multipart/mixed; boundary="===============1662829189661939867=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [xlnx:xlnx_rebase_v5.4 864/1760] drivers/fpga/fpga-mgr.c:828:2: error: implicit declaration of function 'set_dma_ops'
Date: Thu, 27 May 2021 21:20:11 +0800
Message-ID: <202105272103.2S8uMpGS-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1662829189661939867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Nava,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
head:   971e12809eee20685e4d8f6a4ecf466acac3e278
commit: 1a0c556193a3d81ff6bde4c571c38b2c19bbb443 [864/1760] fpga: support l=
oading from a pre-allocated buffer
config: um-randconfig-r025-20210526 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/1a0c556193a3d81ff6bde=
4c571c38b2c19bbb443
        git remote add xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xlnx xlnx_rebase_v5.4
        git checkout 1a0c556193a3d81ff6bde4c571c38b2c19bbb443
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Dum =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing=
-include-dirs]
   In file included from include/linux/file.h:9,
                    from include/linux/dma-buf.h:16,
                    from drivers/fpga/fpga-mgr.c:11:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:32:19: warning: comparison of unsigned expr=
ession >=3D 0 is always true [-Wtype-limits]
      32 |  BUILD_BUG_ON(idx >=3D __end_of_fixed_addresses);
         |                   ^~
   include/linux/compiler.h:330:9: note: in definition of macro '__compilet=
ime_assert'
     330 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletim=
e_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LI=
NE__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletim=
e_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_O=
N_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:32:2: note: in expansion of macro 'BUILD_BU=
G_ON'
      32 |  BUILD_BUG_ON(idx >=3D __end_of_fixed_addresses);
         |  ^~~~~~~~~~~~
   In file included from include/linux/uaccess.h:11,
                    from include/linux/highmem.h:9,
                    from drivers/fpga/fpga-mgr.c:21:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:29: warning: comparison of unsigned exp=
ression >=3D 0 is always true [-Wtype-limits]
      17 |    (((unsigned long) (addr) >=3D FIXADDR_USER_START) && \
         |                             ^~
   arch/um/include/asm/uaccess.h:45:3: note: in expansion of macro '__acces=
s_ok_vsyscall'
      45 |   __access_ok_vsyscall(addr, size) ||
         |   ^~~~~~~~~~~~~~~~~~~~
   drivers/fpga/fpga-mgr.c: In function 'fpga_mgr_create':
>> drivers/fpga/fpga-mgr.c:828:2: error: implicit declaration of function '=
set_dma_ops' [-Werror=3Dimplicit-function-declaration]
     828 |  set_dma_ops(&mgr->dev, get_dma_ops(dev));
         |  ^~~~~~~~~~~
>> drivers/fpga/fpga-mgr.c:828:25: error: implicit declaration of function =
'get_dma_ops'; did you mean 'get_dma_buf'? [-Werror=3Dimplicit-function-dec=
laration]
     828 |  set_dma_ops(&mgr->dev, get_dma_ops(dev));
         |                         ^~~~~~~~~~~
         |                         get_dma_buf
   cc1: some warnings being treated as errors


vim +/set_dma_ops +828 drivers/fpga/fpga-mgr.c

   773	=

   774	/**
   775	 * fpga_mgr_create - create and initialize a FPGA manager struct
   776	 * @dev:	fpga manager device from pdev
   777	 * @name:	fpga manager name
   778	 * @mops:	pointer to structure of fpga manager ops
   779	 * @priv:	fpga manager private data
   780	 *
   781	 * The caller of this function is responsible for freeing the struct=
 with
   782	 * fpga_mgr_free().  Using devm_fpga_mgr_create() instead is recomme=
nded.
   783	 *
   784	 * Return: pointer to struct fpga_manager or NULL
   785	 */
   786	struct fpga_manager *fpga_mgr_create(struct device *dev, const char =
*name,
   787					     const struct fpga_manager_ops *mops,
   788					     void *priv)
   789	{
   790		struct fpga_manager *mgr;
   791		int id, ret;
   792	=

   793		if (!mops || !mops->write_complete || !mops->state ||
   794		    !mops->write_init || (!mops->write && !mops->write_sg)) {
   795			dev_err(dev, "Attempt to register without fpga_manager_ops\n");
   796			return NULL;
   797		}
   798	=

   799		if (!name || !strlen(name)) {
   800			dev_err(dev, "Attempt to register with no name!\n");
   801			return NULL;
   802		}
   803	=

   804		mgr =3D kzalloc(sizeof(*mgr), GFP_KERNEL);
   805		if (!mgr)
   806			return NULL;
   807	=

   808		id =3D ida_simple_get(&fpga_mgr_ida, 0, 0, GFP_KERNEL);
   809		if (id < 0) {
   810			ret =3D id;
   811			goto error_kfree;
   812		}
   813	=

   814		mutex_init(&mgr->ref_mutex);
   815	=

   816		mgr->name =3D name;
   817		mgr->mops =3D mops;
   818		mgr->priv =3D priv;
   819	=

   820		device_initialize(&mgr->dev);
   821		mgr->dev.class =3D fpga_mgr_class;
   822		mgr->dev.groups =3D mops->groups;
   823		mgr->dev.parent =3D dev;
   824		mgr->dev.of_node =3D dev->of_node;
   825		mgr->dev.id =3D id;
   826	=

   827		/* Make device dma capable by inheriting from parent's */
 > 828		set_dma_ops(&mgr->dev, get_dma_ops(dev));
   829		ret =3D dma_coerce_mask_and_coherent(&mgr->dev, dma_get_mask(dev));
   830		if (ret) {
   831			dev_warn(dev,
   832			"Failed to set DMA mask %llx. Trying to continue... %x\n",
   833			dma_get_mask(dev), ret);
   834		}
   835	=

   836		ret =3D dev_set_name(&mgr->dev, "fpga%d", id);
   837		if (ret)
   838			goto error_device;
   839	=

   840		mgr->miscdev.minor =3D MISC_DYNAMIC_MINOR;
   841		mgr->miscdev.name =3D kobject_name(&mgr->dev.kobj);
   842		mgr->miscdev.fops =3D &fpga_fops;
   843		ret =3D misc_register(&mgr->miscdev);
   844		if (ret) {
   845			pr_err("fpga: failed to register misc device.\n");
   846			goto error_device;
   847		}
   848	=

   849		return mgr;
   850	=

   851	error_device:
   852		ida_simple_remove(&fpga_mgr_ida, id);
   853	error_kfree:
   854		kfree(mgr);
   855	=

   856		return NULL;
   857	}
   858	EXPORT_SYMBOL_GPL(fpga_mgr_create);
   859	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1662829189661939867==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1662829189661939867==--


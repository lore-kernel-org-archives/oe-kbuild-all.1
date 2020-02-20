Content-Type: multipart/mixed; boundary="===============3197196753029666647=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 4/7] nvmem: increase the reference count of a gpio passed over config
Date: Thu, 20 Feb 2020 11:03:57 +0800
Message-ID: <202002201042.dEPPA014%lkp@intel.com>
In-Reply-To: <20200218094234.23896-5-brgl@bgdev.pl>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3197196753029666647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

I love your patch! Perhaps something to improve:

[auto build test WARNING on gpio/for-next]
[also build test WARNING on linus/master v5.6-rc2]
[cannot apply to next-20200219]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Bartosz-Golaszewski/nvmem-=
gpio-fix-resource-management/20200220-045651
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.g=
it for-next
config: nios2-3c120_defconfig (attached as .config)
compiler: nios2-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dnios2 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/nvmem/core.c: In function 'nvmem_register':
   drivers/nvmem/core.c:349:20: error: implicit declaration of function 'gp=
iod_ref'; did you mean 'gpiod_get'? [-Werror=3Dimplicit-function-declaratio=
n]
      nvmem->wp_gpio =3D gpiod_ref(config->wp_gpio);
                       ^~~~~~~~~
                       gpiod_get
>> drivers/nvmem/core.c:349:18: warning: assignment makes pointer from inte=
ger without a cast [-Wint-conversion]
      nvmem->wp_gpio =3D gpiod_ref(config->wp_gpio);
                     ^
   cc1: some warnings being treated as errors

vim +349 drivers/nvmem/core.c

   322	=

   323	/**
   324	 * nvmem_register() - Register a nvmem device for given nvmem_config.
   325	 * Also creates an binary entry in /sys/bus/nvmem/devices/dev-name/n=
vmem
   326	 *
   327	 * @config: nvmem device configuration with which nvmem device is cr=
eated.
   328	 *
   329	 * Return: Will be an ERR_PTR() on error or a valid pointer to nvmem=
_device
   330	 * on success.
   331	 */
   332	=

   333	struct nvmem_device *nvmem_register(const struct nvmem_config *confi=
g)
   334	{
   335		struct nvmem_device *nvmem;
   336		int rval;
   337	=

   338		if (!config->dev)
   339			return ERR_PTR(-EINVAL);
   340	=

   341		nvmem =3D kzalloc(sizeof(*nvmem), GFP_KERNEL);
   342		if (!nvmem)
   343			return ERR_PTR(-ENOMEM);
   344	=

   345		rval  =3D ida_simple_get(&nvmem_ida, 0, 0, GFP_KERNEL);
   346		if (rval < 0)
   347			goto err_free_nvmem;
   348		if (config->wp_gpio)
 > 349			nvmem->wp_gpio =3D gpiod_ref(config->wp_gpio);
   350		else
   351			nvmem->wp_gpio =3D gpiod_get_optional(config->dev, "wp",
   352							    GPIOD_OUT_HIGH);
   353		if (IS_ERR(nvmem->wp_gpio))
   354			goto err_ida_remove;
   355	=

   356	=

   357		kref_init(&nvmem->refcnt);
   358		INIT_LIST_HEAD(&nvmem->cells);
   359	=

   360		nvmem->id =3D rval;
   361		nvmem->owner =3D config->owner;
   362		if (!nvmem->owner && config->dev->driver)
   363			nvmem->owner =3D config->dev->driver->owner;
   364		nvmem->stride =3D config->stride ?: 1;
   365		nvmem->word_size =3D config->word_size ?: 1;
   366		nvmem->size =3D config->size;
   367		nvmem->dev.type =3D &nvmem_provider_type;
   368		nvmem->dev.bus =3D &nvmem_bus_type;
   369		nvmem->dev.parent =3D config->dev;
   370		nvmem->priv =3D config->priv;
   371		nvmem->type =3D config->type;
   372		nvmem->reg_read =3D config->reg_read;
   373		nvmem->reg_write =3D config->reg_write;
   374		if (!config->no_of_node)
   375			nvmem->dev.of_node =3D config->dev->of_node;
   376	=

   377		if (config->id =3D=3D -1 && config->name) {
   378			dev_set_name(&nvmem->dev, "%s", config->name);
   379		} else {
   380			dev_set_name(&nvmem->dev, "%s%d",
   381				     config->name ? : "nvmem",
   382				     config->name ? config->id : nvmem->id);
   383		}
   384	=

   385		nvmem->read_only =3D device_property_present(config->dev, "read-onl=
y") ||
   386				   config->read_only || !nvmem->reg_write;
   387	=

   388		nvmem->dev.groups =3D nvmem_sysfs_get_groups(nvmem, config);
   389	=

   390		device_initialize(&nvmem->dev);
   391	=

   392		dev_dbg(&nvmem->dev, "Registering nvmem device %s\n", config->name);
   393	=

   394		rval =3D device_add(&nvmem->dev);
   395		if (rval)
   396			goto err_put_device;
   397	=

   398		if (config->compat) {
   399			rval =3D nvmem_sysfs_setup_compat(nvmem, config);
   400			if (rval)
   401				goto err_device_del;
   402		}
   403	=

   404		if (config->cells) {
   405			rval =3D nvmem_add_cells(nvmem, config->cells, config->ncells);
   406			if (rval)
   407				goto err_teardown_compat;
   408		}
   409	=

   410		rval =3D nvmem_add_cells_from_table(nvmem);
   411		if (rval)
   412			goto err_remove_cells;
   413	=

   414		rval =3D nvmem_add_cells_from_of(nvmem);
   415		if (rval)
   416			goto err_remove_cells;
   417	=

   418		blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
   419	=

   420		return nvmem;
   421	=

   422	err_remove_cells:
   423		nvmem_device_remove_all_cells(nvmem);
   424	err_teardown_compat:
   425		if (config->compat)
   426			nvmem_sysfs_remove_compat(nvmem, config);
   427	err_device_del:
   428		device_del(&nvmem->dev);
   429	err_put_device:
   430		put_device(&nvmem->dev);
   431	err_ida_remove:
   432		ida_simple_remove(&nvmem_ida, nvmem->id);
   433	err_free_nvmem:
   434		kfree(nvmem);
   435	=

   436		return ERR_PTR(rval);
   437	}
   438	EXPORT_SYMBOL_GPL(nvmem_register);
   439	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3197196753029666647==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3197196753029666647==--


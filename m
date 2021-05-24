Content-Type: multipart/mixed; boundary="===============8565315541924679569=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 1/1] regmap-irq: Introduce inverted status registers support
Date: Mon, 24 May 2021 19:31:26 +0800
Message-ID: <202105241903.cPlHYPIn-lkp@intel.com>
In-Reply-To: <20210524045837.8398-1-fido_max@inbox.ru>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8565315541924679569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Maxim,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on regmap/for-next]
[also build test ERROR on linux/master linus/master v5.13-rc3 next-20210524]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maxim-Kochetkov/regmap-irq=
-Introduce-inverted-status-registers-support/20210524-125907
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git =
for-next
config: microblaze-randconfig-r016-20210524 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0592cd096312150d005b37a78=
a5a1fa1763561b5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Maxim-Kochetkov/regmap-irq-Introdu=
ce-inverted-status-registers-support/20210524-125907
        git checkout 0592cd096312150d005b37a78a5a1fa1763561b5
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dmicroblaze =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/base/regmap/regmap-irq.c: In function 'regmap_add_irq_chip_fwnod=
e':
>> drivers/base/regmap/regmap-irq.c:808:8: error: '*data' is a pointer; did=
 you mean to use '->'?
     808 |    data->status_buf[i] =3D ~data->status_buf[i];
         |        ^~
         |        ->
   drivers/base/regmap/regmap-irq.c:808:31: error: '*data' is a pointer; di=
d you mean to use '->'?
     808 |    data->status_buf[i] =3D ~data->status_buf[i];
         |                               ^~
         |                               ->


vim +808 drivers/base/regmap/regmap-irq.c

   610	=

   611	/**
   612	 * regmap_add_irq_chip_fwnode() - Use standard regmap IRQ controller=
 handling
   613	 *
   614	 * @fwnode: The firmware node where the IRQ domain should be added t=
o.
   615	 * @map: The regmap for the device.
   616	 * @irq: The IRQ the device uses to signal interrupts.
   617	 * @irq_flags: The IRQF_ flags to use for the primary interrupt.
   618	 * @irq_base: Allocate at specific IRQ number if irq_base > 0.
   619	 * @chip: Configuration for the interrupt controller.
   620	 * @data: Runtime data structure for the controller, allocated on su=
ccess.
   621	 *
   622	 * Returns 0 on success or an errno on failure.
   623	 *
   624	 * In order for this to be efficient the chip really should use a
   625	 * register cache.  The chip driver is responsible for restoring the
   626	 * register values used by the IRQ controller over suspend and resum=
e.
   627	 */
   628	int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
   629				       struct regmap *map, int irq,
   630				       int irq_flags, int irq_base,
   631				       const struct regmap_irq_chip *chip,
   632				       struct regmap_irq_chip_data **data)
   633	{
   634		struct regmap_irq_chip_data *d;
   635		int i;
   636		int ret =3D -ENOMEM;
   637		int num_type_reg;
   638		u32 reg;
   639		u32 unmask_offset;
   640	=

   641		if (chip->num_regs <=3D 0)
   642			return -EINVAL;
   643	=

   644		if (chip->clear_on_unmask && (chip->ack_base || chip->use_ack))
   645			return -EINVAL;
   646	=

   647		for (i =3D 0; i < chip->num_irqs; i++) {
   648			if (chip->irqs[i].reg_offset % map->reg_stride)
   649				return -EINVAL;
   650			if (chip->irqs[i].reg_offset / map->reg_stride >=3D
   651			    chip->num_regs)
   652				return -EINVAL;
   653		}
   654	=

   655		if (chip->not_fixed_stride) {
   656			for (i =3D 0; i < chip->num_regs; i++)
   657				if (chip->sub_reg_offsets[i].num_regs !=3D 1)
   658					return -EINVAL;
   659		}
   660	=

   661		if (irq_base) {
   662			irq_base =3D irq_alloc_descs(irq_base, 0, chip->num_irqs, 0);
   663			if (irq_base < 0) {
   664				dev_warn(map->dev, "Failed to allocate IRQs: %d\n",
   665					 irq_base);
   666				return irq_base;
   667			}
   668		}
   669	=

   670		d =3D kzalloc(sizeof(*d), GFP_KERNEL);
   671		if (!d)
   672			return -ENOMEM;
   673	=

   674		if (chip->num_main_regs) {
   675			d->main_status_buf =3D kcalloc(chip->num_main_regs,
   676						     sizeof(unsigned int),
   677						     GFP_KERNEL);
   678	=

   679			if (!d->main_status_buf)
   680				goto err_alloc;
   681		}
   682	=

   683		d->status_buf =3D kcalloc(chip->num_regs, sizeof(unsigned int),
   684					GFP_KERNEL);
   685		if (!d->status_buf)
   686			goto err_alloc;
   687	=

   688		d->mask_buf =3D kcalloc(chip->num_regs, sizeof(unsigned int),
   689				      GFP_KERNEL);
   690		if (!d->mask_buf)
   691			goto err_alloc;
   692	=

   693		d->mask_buf_def =3D kcalloc(chip->num_regs, sizeof(unsigned int),
   694					  GFP_KERNEL);
   695		if (!d->mask_buf_def)
   696			goto err_alloc;
   697	=

   698		if (chip->wake_base) {
   699			d->wake_buf =3D kcalloc(chip->num_regs, sizeof(unsigned int),
   700					      GFP_KERNEL);
   701			if (!d->wake_buf)
   702				goto err_alloc;
   703		}
   704	=

   705		num_type_reg =3D chip->type_in_mask ? chip->num_regs : chip->num_ty=
pe_reg;
   706		if (num_type_reg) {
   707			d->type_buf_def =3D kcalloc(num_type_reg,
   708						  sizeof(unsigned int), GFP_KERNEL);
   709			if (!d->type_buf_def)
   710				goto err_alloc;
   711	=

   712			d->type_buf =3D kcalloc(num_type_reg, sizeof(unsigned int),
   713					      GFP_KERNEL);
   714			if (!d->type_buf)
   715				goto err_alloc;
   716		}
   717	=

   718		if (chip->num_virt_regs) {
   719			/*
   720			 * Create virt_buf[chip->num_extra_config_regs][chip->num_regs]
   721			 */
   722			d->virt_buf =3D kcalloc(chip->num_virt_regs, sizeof(*d->virt_buf),
   723					      GFP_KERNEL);
   724			if (!d->virt_buf)
   725				goto err_alloc;
   726	=

   727			for (i =3D 0; i < chip->num_virt_regs; i++) {
   728				d->virt_buf[i] =3D kcalloc(chip->num_regs,
   729							 sizeof(unsigned int),
   730							 GFP_KERNEL);
   731				if (!d->virt_buf[i])
   732					goto err_alloc;
   733			}
   734		}
   735	=

   736		d->irq_chip =3D regmap_irq_chip;
   737		d->irq_chip.name =3D chip->name;
   738		d->irq =3D irq;
   739		d->map =3D map;
   740		d->chip =3D chip;
   741		d->irq_base =3D irq_base;
   742	=

   743		if (chip->irq_reg_stride)
   744			d->irq_reg_stride =3D chip->irq_reg_stride;
   745		else
   746			d->irq_reg_stride =3D 1;
   747	=

   748		if (chip->type_reg_stride)
   749			d->type_reg_stride =3D chip->type_reg_stride;
   750		else
   751			d->type_reg_stride =3D 1;
   752	=

   753		if (!map->use_single_read && map->reg_stride =3D=3D 1 &&
   754		    d->irq_reg_stride =3D=3D 1) {
   755			d->status_reg_buf =3D kmalloc_array(chip->num_regs,
   756							  map->format.val_bytes,
   757							  GFP_KERNEL);
   758			if (!d->status_reg_buf)
   759				goto err_alloc;
   760		}
   761	=

   762		mutex_init(&d->lock);
   763	=

   764		for (i =3D 0; i < chip->num_irqs; i++)
   765			d->mask_buf_def[chip->irqs[i].reg_offset / map->reg_stride]
   766				|=3D chip->irqs[i].mask;
   767	=

   768		/* Mask all the interrupts by default */
   769		for (i =3D 0; i < chip->num_regs; i++) {
   770			d->mask_buf[i] =3D d->mask_buf_def[i];
   771			if (!chip->mask_base)
   772				continue;
   773	=

   774			reg =3D sub_irq_reg(d, d->chip->mask_base, i);
   775	=

   776			if (chip->mask_invert)
   777				ret =3D regmap_irq_update_bits(d, reg,
   778						 d->mask_buf[i], ~d->mask_buf[i]);
   779			else if (d->chip->unmask_base) {
   780				unmask_offset =3D d->chip->unmask_base -
   781						d->chip->mask_base;
   782				ret =3D regmap_irq_update_bits(d,
   783						reg + unmask_offset,
   784						d->mask_buf[i],
   785						d->mask_buf[i]);
   786			} else
   787				ret =3D regmap_irq_update_bits(d, reg,
   788						 d->mask_buf[i], d->mask_buf[i]);
   789			if (ret !=3D 0) {
   790				dev_err(map->dev, "Failed to set masks in 0x%x: %d\n",
   791					reg, ret);
   792				goto err_alloc;
   793			}
   794	=

   795			if (!chip->init_ack_masked)
   796				continue;
   797	=

   798			/* Ack masked but set interrupts */
   799			reg =3D sub_irq_reg(d, d->chip->status_base, i);
   800			ret =3D regmap_read(map, reg, &d->status_buf[i]);
   801			if (ret !=3D 0) {
   802				dev_err(map->dev, "Failed to read IRQ status: %d\n",
   803					ret);
   804				goto err_alloc;
   805			}
   806	=

   807			if (chip->status_invert)
 > 808				data->status_buf[i] =3D ~data->status_buf[i];
   809	=

   810			if (d->status_buf[i] && (chip->ack_base || chip->use_ack)) {
   811				reg =3D sub_irq_reg(d, d->chip->ack_base, i);
   812				if (chip->ack_invert)
   813					ret =3D regmap_write(map, reg,
   814						~(d->status_buf[i] & d->mask_buf[i]));
   815				else
   816					ret =3D regmap_write(map, reg,
   817						d->status_buf[i] & d->mask_buf[i]);
   818				if (chip->clear_ack) {
   819					if (chip->ack_invert && !ret)
   820						ret =3D regmap_write(map, reg,
   821							(d->status_buf[i] &
   822							 d->mask_buf[i]));
   823					else if (!ret)
   824						ret =3D regmap_write(map, reg,
   825							~(d->status_buf[i] &
   826							  d->mask_buf[i]));
   827				}
   828				if (ret !=3D 0) {
   829					dev_err(map->dev, "Failed to ack 0x%x: %d\n",
   830						reg, ret);
   831					goto err_alloc;
   832				}
   833			}
   834		}
   835	=

   836		/* Wake is disabled by default */
   837		if (d->wake_buf) {
   838			for (i =3D 0; i < chip->num_regs; i++) {
   839				d->wake_buf[i] =3D d->mask_buf_def[i];
   840				reg =3D sub_irq_reg(d, d->chip->wake_base, i);
   841	=

   842				if (chip->wake_invert)
   843					ret =3D regmap_irq_update_bits(d, reg,
   844								 d->mask_buf_def[i],
   845								 0);
   846				else
   847					ret =3D regmap_irq_update_bits(d, reg,
   848								 d->mask_buf_def[i],
   849								 d->wake_buf[i]);
   850				if (ret !=3D 0) {
   851					dev_err(map->dev, "Failed to set masks in 0x%x: %d\n",
   852						reg, ret);
   853					goto err_alloc;
   854				}
   855			}
   856		}
   857	=

   858		if (chip->num_type_reg && !chip->type_in_mask) {
   859			for (i =3D 0; i < chip->num_type_reg; ++i) {
   860				reg =3D sub_irq_reg(d, d->chip->type_base, i);
   861	=

   862				ret =3D regmap_read(map, reg, &d->type_buf_def[i]);
   863	=

   864				if (d->chip->type_invert)
   865					d->type_buf_def[i] =3D ~d->type_buf_def[i];
   866	=

   867				if (ret) {
   868					dev_err(map->dev, "Failed to get type defaults at 0x%x: %d\n",
   869						reg, ret);
   870					goto err_alloc;
   871				}
   872			}
   873		}
   874	=

   875		if (irq_base)
   876			d->domain =3D irq_domain_create_legacy(fwnode, chip->num_irqs,
   877							     irq_base, 0,
   878							     &regmap_domain_ops, d);
   879		else
   880			d->domain =3D irq_domain_create_linear(fwnode, chip->num_irqs,
   881							     &regmap_domain_ops, d);
   882		if (!d->domain) {
   883			dev_err(map->dev, "Failed to create IRQ domain\n");
   884			ret =3D -ENOMEM;
   885			goto err_alloc;
   886		}
   887	=

   888		ret =3D request_threaded_irq(irq, NULL, regmap_irq_thread,
   889					   irq_flags | IRQF_ONESHOT,
   890					   chip->name, d);
   891		if (ret !=3D 0) {
   892			dev_err(map->dev, "Failed to request IRQ %d for %s: %d\n",
   893				irq, chip->name, ret);
   894			goto err_domain;
   895		}
   896	=

   897		*data =3D d;
   898	=

   899		return 0;
   900	=

   901	err_domain:
   902		/* Should really dispose of the domain but... */
   903	err_alloc:
   904		kfree(d->type_buf);
   905		kfree(d->type_buf_def);
   906		kfree(d->wake_buf);
   907		kfree(d->mask_buf_def);
   908		kfree(d->mask_buf);
   909		kfree(d->status_buf);
   910		kfree(d->status_reg_buf);
   911		if (d->virt_buf) {
   912			for (i =3D 0; i < chip->num_virt_regs; i++)
   913				kfree(d->virt_buf[i]);
   914			kfree(d->virt_buf);
   915		}
   916		kfree(d);
   917		return ret;
   918	}
   919	EXPORT_SYMBOL_GPL(regmap_add_irq_chip_fwnode);
   920	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8565315541924679569==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8565315541924679569==--


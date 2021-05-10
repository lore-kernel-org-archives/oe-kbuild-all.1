Content-Type: multipart/mixed; boundary="===============0674502127339495102=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v6 15/15] of: Add plumbing for restricted DMA pool
Date: Mon, 10 May 2021 21:41:19 +0800
Message-ID: <202105102115.T5VSCweo-lkp@intel.com>
In-Reply-To: <20210510095026.3477496-16-tientzu@chromium.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0674502127339495102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Claire,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on linus/master v5.13-rc1 next-20210510]
[cannot apply to swiotlb/linux-next robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Claire-Chang/Restricted-DM=
A/20210510-175327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-n=
ext
config: um-randconfig-r005-20210510 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build):
        # https://github.com/0day-ci/linux/commit/b3ac99e512425b0aabc1cfeb9=
a4e993d2002c577
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Claire-Chang/Restricted-DMA/202105=
10-175327
        git checkout b3ac99e512425b0aabc1cfeb9a4e993d2002c577
        # save the attached .config to linux build tree
        make W=3D1 W=3D1 ARCH=3Dum =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/of/device.c: In function 'of_dma_configure_id':
>> drivers/of/device.c:169:10: error: implicit declaration of function 'of_=
dma_set_restricted_buffer'; did you mean 'of_dma_get_restricted_buffer'? [-=
Werror=3Dimplicit-function-declaration]
     169 |   return of_dma_set_restricted_buffer(dev);
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          of_dma_get_restricted_buffer
   cc1: some warnings being treated as errors
--
>> drivers/of/address.c:1116:5: warning: no previous prototype for 'of_dma_=
set_restricted_buffer' [-Wmissing-prototypes]
    1116 | int of_dma_set_restricted_buffer(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LOCKDEP
   Depends on DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT && (FRAME_POINTER || M=
IPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
   Selected by
   - LOCK_STAT && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
   - DEBUG_LOCK_ALLOC && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT


vim +169 drivers/of/device.c

    54	=

    55	/**
    56	 * of_dma_configure_id - Setup DMA configuration
    57	 * @dev:	Device to apply DMA configuration
    58	 * @np:		Pointer to OF node having DMA configuration
    59	 * @force_dma:  Whether device is to be set up by of_dma_configure()=
 even if
    60	 *		DMA capability is not explicitly described by firmware.
    61	 * @id:		Optional const pointer value input id
    62	 *
    63	 * Try to get devices's DMA configuration from DT and update it
    64	 * accordingly.
    65	 *
    66	 * If platform code needs to use its own special DMA configuration, =
it
    67	 * can use a platform bus notifier and handle BUS_NOTIFY_ADD_DEVICE =
events
    68	 * to fix up DMA configuration.
    69	 */
    70	int of_dma_configure_id(struct device *dev, struct device_node *np,
    71				bool force_dma, const u32 *id)
    72	{
    73		const struct iommu_ops *iommu;
    74		const struct bus_dma_region *map =3D NULL;
    75		u64 dma_start =3D 0;
    76		u64 mask, end, size =3D 0;
    77		bool coherent;
    78		int ret;
    79	=

    80		ret =3D of_dma_get_range(np, &map);
    81		if (ret < 0) {
    82			/*
    83			 * For legacy reasons, we have to assume some devices need
    84			 * DMA configuration regardless of whether "dma-ranges" is
    85			 * correctly specified or not.
    86			 */
    87			if (!force_dma)
    88				return ret =3D=3D -ENODEV ? 0 : ret;
    89		} else {
    90			const struct bus_dma_region *r =3D map;
    91			u64 dma_end =3D 0;
    92	=

    93			/* Determine the overall bounds of all DMA regions */
    94			for (dma_start =3D ~0; r->size; r++) {
    95				/* Take lower and upper limits */
    96				if (r->dma_start < dma_start)
    97					dma_start =3D r->dma_start;
    98				if (r->dma_start + r->size > dma_end)
    99					dma_end =3D r->dma_start + r->size;
   100			}
   101			size =3D dma_end - dma_start;
   102	=

   103			/*
   104			 * Add a work around to treat the size as mask + 1 in case
   105			 * it is defined in DT as a mask.
   106			 */
   107			if (size & 1) {
   108				dev_warn(dev, "Invalid size 0x%llx for dma-range(s)\n",
   109					 size);
   110				size =3D size + 1;
   111			}
   112	=

   113			if (!size) {
   114				dev_err(dev, "Adjusted size 0x%llx invalid\n", size);
   115				kfree(map);
   116				return -EINVAL;
   117			}
   118		}
   119	=

   120		/*
   121		 * If @dev is expected to be DMA-capable then the bus code that cre=
ated
   122		 * it should have initialised its dma_mask pointer by this point. F=
or
   123		 * now, we'll continue the legacy behaviour of coercing it to the
   124		 * coherent mask if not, but we'll no longer do so quietly.
   125		 */
   126		if (!dev->dma_mask) {
   127			dev_warn(dev, "DMA mask not set\n");
   128			dev->dma_mask =3D &dev->coherent_dma_mask;
   129		}
   130	=

   131		if (!size && dev->coherent_dma_mask)
   132			size =3D max(dev->coherent_dma_mask, dev->coherent_dma_mask + 1);
   133		else if (!size)
   134			size =3D 1ULL << 32;
   135	=

   136		/*
   137		 * Limit coherent and dma mask based on size and default mask
   138		 * set by the driver.
   139		 */
   140		end =3D dma_start + size - 1;
   141		mask =3D DMA_BIT_MASK(ilog2(end) + 1);
   142		dev->coherent_dma_mask &=3D mask;
   143		*dev->dma_mask &=3D mask;
   144		/* ...but only set bus limit and range map if we found valid dma-ra=
nges earlier */
   145		if (!ret) {
   146			dev->bus_dma_limit =3D end;
   147			dev->dma_range_map =3D map;
   148		}
   149	=

   150		coherent =3D of_dma_is_coherent(np);
   151		dev_dbg(dev, "device is%sdma coherent\n",
   152			coherent ? " " : " not ");
   153	=

   154		iommu =3D of_iommu_configure(dev, np, id);
   155		if (PTR_ERR(iommu) =3D=3D -EPROBE_DEFER) {
   156			/* Don't touch range map if it wasn't set from a valid dma-ranges =
*/
   157			if (!ret)
   158				dev->dma_range_map =3D NULL;
   159			kfree(map);
   160			return -EPROBE_DEFER;
   161		}
   162	=

   163		dev_dbg(dev, "device is%sbehind an iommu\n",
   164			iommu ? " " : " not ");
   165	=

   166		arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
   167	=

   168		if (!iommu)
 > 169			return of_dma_set_restricted_buffer(dev);
   170	=

   171		return 0;
   172	}
   173	EXPORT_SYMBOL_GPL(of_dma_configure_id);
   174	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0674502127339495102==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
hUGnQyyaPicRYM37+/8D9yjFg46+AAA=
--===============0674502127339495102==--


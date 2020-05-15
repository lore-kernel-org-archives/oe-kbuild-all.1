Content-Type: multipart/mixed; boundary="===============6873772906985446302=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 net-next 3/7] dpaa2-eth: Distribute ingress frames based on VLAN prio
Date: Sat, 16 May 2020 07:07:34 +0800
Message-ID: <202005160725.cW5HQjVY%lkp@intel.com>
In-Reply-To: <20200515184753.15080-4-ioana.ciornei@nxp.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6873772906985446302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ioana,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on sparc-next/master linus/master v5.7-rc5 next-20=
200515]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Ioana-Ciornei/dpaa2-eth-ad=
d-support-for-Rx-traffic-classes/20200516-024950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
d00f26b623333f2419f4c3b95ff11c8b1bb96f56
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:2728:15: sparse: sparse=
: incorrect type in assignment (different base types) @@    expected unsign=
ed short [usertype] @@    got resunsigned short [usertype] @@
>> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:2728:15: sparse:    exp=
ected unsigned short [usertype]
>> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:2728:15: sparse:    got=
 restricted __be16 [usertype]
   drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:2747:29: sparse: sparse=
: incorrect type in assignment (different base types) @@    expected unsign=
ed short [usertype] @@    got resunsigned short [usertype] @@
   drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:2747:29: sparse:    exp=
ected unsigned short [usertype]
   drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:2747:29: sparse:    got=
 restricted __be16 [usertype]

vim +2728 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c

  2664	=

  2665	/* Configure ingress classification based on VLAN PCP */
  2666	static int set_vlan_qos(struct dpaa2_eth_priv *priv)
  2667	{
  2668		struct device *dev =3D priv->net_dev->dev.parent;
  2669		struct dpkg_profile_cfg kg_cfg =3D {0};
  2670		struct dpni_qos_tbl_cfg qos_cfg =3D {0};
  2671		struct dpni_rule_cfg key_params;
  2672		void *dma_mem, *key;
  2673		u8 key_size =3D 2;	/* VLAN TCI field */
  2674		int i, pcp, err;
  2675		u16 *mask;
  2676	=

  2677		/* VLAN-based classification only makes sense if we have multiple
  2678		 * traffic classes.
  2679		 * Also, we need to extract just the 3-bit PCP field from the VLAN
  2680		 * header and we can only do that by using a mask
  2681		 */
  2682		if (dpaa2_eth_tc_count(priv) =3D=3D 1 || !dpaa2_eth_fs_mask_enabled=
(priv)) {
  2683			dev_dbg(dev, "VLAN-based QoS classification not supported\n");
  2684			return -EOPNOTSUPP;
  2685		}
  2686	=

  2687		dma_mem =3D kzalloc(DPAA2_CLASSIFIER_DMA_SIZE, GFP_KERNEL);
  2688		if (!dma_mem)
  2689			return -ENOMEM;
  2690	=

  2691		kg_cfg.num_extracts =3D 1;
  2692		kg_cfg.extracts[0].type =3D DPKG_EXTRACT_FROM_HDR;
  2693		kg_cfg.extracts[0].extract.from_hdr.prot =3D NET_PROT_VLAN;
  2694		kg_cfg.extracts[0].extract.from_hdr.type =3D DPKG_FULL_FIELD;
  2695		kg_cfg.extracts[0].extract.from_hdr.field =3D NH_FLD_VLAN_TCI;
  2696	=

  2697		err =3D  dpni_prepare_key_cfg(&kg_cfg, dma_mem);
  2698		if (err) {
  2699			dev_err(dev, "dpni_prepare_key_cfg failed\n");
  2700			goto out_free_tbl;
  2701		}
  2702	=

  2703		/* set QoS table */
  2704		qos_cfg.default_tc =3D 0;
  2705		qos_cfg.discard_on_miss =3D 0;
  2706		qos_cfg.key_cfg_iova =3D dma_map_single(dev, dma_mem,
  2707						      DPAA2_CLASSIFIER_DMA_SIZE,
  2708						      DMA_TO_DEVICE);
  2709		if (dma_mapping_error(dev, qos_cfg.key_cfg_iova)) {
  2710			dev_err(dev, "QoS table DMA mapping failed\n");
  2711			err =3D -ENOMEM;
  2712			goto out_free_tbl;
  2713		}
  2714	=

  2715		err =3D dpni_set_qos_table(priv->mc_io, 0, priv->mc_token, &qos_cfg=
);
  2716		if (err) {
  2717			dev_err(dev, "dpni_set_qos_table failed\n");
  2718			goto out_unmap_tbl;
  2719		}
  2720	=

  2721		/* Add QoS table entries */
  2722		key =3D kzalloc(key_size * 2, GFP_KERNEL);
  2723		if (!key) {
  2724			err =3D -ENOMEM;
  2725			goto out_unmap_tbl;
  2726		}
  2727		mask =3D key + key_size;
> 2728		*mask =3D cpu_to_be16(VLAN_PRIO_MASK);
  2729	=

  2730		key_params.key_iova =3D dma_map_single(dev, key, key_size * 2,
  2731						     DMA_TO_DEVICE);
  2732		if (dma_mapping_error(dev, key_params.key_iova)) {
  2733			dev_err(dev, "Qos table entry DMA mapping failed\n");
  2734			err =3D -ENOMEM;
  2735			goto out_free_key;
  2736		}
  2737	=

  2738		key_params.mask_iova =3D key_params.key_iova + key_size;
  2739		key_params.key_size =3D key_size;
  2740	=

  2741		/* We add rules for PCP-based distribution starting with highest
  2742		 * priority (VLAN PCP =3D 7). If this DPNI doesn't have enough traf=
fic
  2743		 * classes to accommodate all priority levels, the lowest ones end =
up
  2744		 * on TC 0 which was configured as default
  2745		 */
  2746		for (i =3D dpaa2_eth_tc_count(priv) - 1, pcp =3D 7; i >=3D 0; i--, =
pcp--) {
  2747			*(u16 *)key =3D cpu_to_be16(pcp << VLAN_PRIO_SHIFT);
  2748			dma_sync_single_for_device(dev, key_params.key_iova,
  2749						   key_size * 2, DMA_TO_DEVICE);
  2750	=

  2751			err =3D dpni_add_qos_entry(priv->mc_io, 0, priv->mc_token,
  2752						 &key_params, i, i);
  2753			if (err) {
  2754				dev_err(dev, "dpni_add_qos_entry failed\n");
  2755				dpni_clear_qos_table(priv->mc_io, 0, priv->mc_token);
  2756				goto out_unmap_key;
  2757			}
  2758		}
  2759	=

  2760		priv->vlan_cls_enabled =3D true;
  2761	=

  2762		/* Table and key memory is not persistent, clean everything up after
  2763		 * configuration is finished
  2764		 */
  2765	out_unmap_key:
  2766		dma_unmap_single(dev, key_params.key_iova, key_size * 2, DMA_TO_DEV=
ICE);
  2767	out_free_key:
  2768		kfree(key);
  2769	out_unmap_tbl:
  2770		dma_unmap_single(dev, qos_cfg.key_cfg_iova, DPAA2_CLASSIFIER_DMA_SI=
ZE,
  2771				 DMA_TO_DEVICE);
  2772	out_free_tbl:
  2773		kfree(dma_mem);
  2774	=

  2775		return err;
  2776	}
  2777	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6873772906985446302==--


Content-Type: multipart/mixed; boundary="===============2518998366238600013=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [plbossart-sound:fix/hda-log-error-status 5016/5023] sound/soc/soc-topology.c:1485:39: sparse: sparse: incorrect type in argument 2 (different base types)
Date: Fri, 07 May 2021 10:33:51 +0800
Message-ID: <202105071050.yGdfQ55j-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2518998366238600013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/plbossart/sound fix/hda-log-error-status
head:   c6d7954c7dcfd98dc56f320ac14b79db88ec43e9
commit: 434aeb3af2157013f49275256a3a06a01573e29f [5016/5023] ASoC: dapm: Ad=
d support for multiple kcontrol types to a widget
config: riscv-randconfig-s031-20210506 (attached as .config)
compiler: riscv32-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/plbossart/sound/commit/434aeb3af2157013f492752=
56a3a06a01573e29f
        git remote add plbossart-sound https://github.com/plbossart/sound
        git fetch --no-tags plbossart-sound fix/hda-log-error-status
        git checkout 434aeb3af2157013f49275256a3a06a01573e29f
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> sound/soc/soc-topology.c:1485:39: sparse: sparse: incorrect type in argu=
ment 2 (different base types) @@     expected unsigned int [usertype] n @@ =
    got restricted __le32 [usertype] num_kcontrols @@
   sound/soc/soc-topology.c:1485:39: sparse:     expected unsigned int [use=
rtype] n
   sound/soc/soc-topology.c:1485:39: sparse:     got restricted __le32 [use=
rtype] num_kcontrols
   sound/soc/soc-topology.c:1489:50: sparse: sparse: incorrect type in argu=
ment 2 (different base types) @@     expected unsigned int [usertype] n @@ =
    got restricted __le32 [usertype] num_kcontrols @@
   sound/soc/soc-topology.c:1489:50: sparse:     expected unsigned int [use=
rtype] n
   sound/soc/soc-topology.c:1489:50: sparse:     got restricted __le32 [use=
rtype] num_kcontrols
   sound/soc/soc-topology.c:1493:26: sparse: sparse: restricted __le32 degr=
ades to integer

vim +1485 sound/soc/soc-topology.c

  1419	=

  1420	static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
  1421		struct snd_soc_tplg_dapm_widget *w)
  1422	{
  1423		struct snd_soc_dapm_context *dapm =3D &tplg->comp->dapm;
  1424		struct snd_soc_dapm_widget template, *widget;
  1425		struct snd_soc_tplg_ctl_hdr *control_hdr;
  1426		struct snd_soc_card *card =3D tplg->comp->card;
  1427		unsigned int *kcontrol_type;
  1428		struct snd_kcontrol_new *kc;
  1429		int mixer_count =3D 0;
  1430		int bytes_count =3D 0;
  1431		int enum_count =3D 0;
  1432		int ret =3D 0;
  1433		int i;
  1434	=

  1435		if (strnlen(w->name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) =3D=3D
  1436			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
  1437			return -EINVAL;
  1438		if (strnlen(w->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) =3D=3D
  1439			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
  1440			return -EINVAL;
  1441	=

  1442		dev_dbg(tplg->dev, "ASoC: creating DAPM widget %s id %d\n",
  1443			w->name, w->id);
  1444	=

  1445		memset(&template, 0, sizeof(template));
  1446	=

  1447		/* map user to kernel widget ID */
  1448		template.id =3D get_widget_id(le32_to_cpu(w->id));
  1449		if ((int)template.id < 0)
  1450			return template.id;
  1451	=

  1452		/* strings are allocated here, but used and freed by the widget */
  1453		template.name =3D kstrdup(w->name, GFP_KERNEL);
  1454		if (!template.name)
  1455			return -ENOMEM;
  1456		template.sname =3D kstrdup(w->sname, GFP_KERNEL);
  1457		if (!template.sname) {
  1458			ret =3D -ENOMEM;
  1459			goto err;
  1460		}
  1461		template.reg =3D le32_to_cpu(w->reg);
  1462		template.shift =3D le32_to_cpu(w->shift);
  1463		template.mask =3D le32_to_cpu(w->mask);
  1464		template.subseq =3D le32_to_cpu(w->subseq);
  1465		template.on_val =3D w->invert ? 0 : 1;
  1466		template.off_val =3D w->invert ? 1 : 0;
  1467		template.ignore_suspend =3D le32_to_cpu(w->ignore_suspend);
  1468		template.event_flags =3D le16_to_cpu(w->event_flags);
  1469		template.dobj.index =3D tplg->index;
  1470	=

  1471		tplg->pos +=3D
  1472			(sizeof(struct snd_soc_tplg_dapm_widget) +
  1473			 le32_to_cpu(w->priv.size));
  1474	=

  1475		if (w->num_kcontrols =3D=3D 0) {
  1476			template.num_kcontrols =3D 0;
  1477			goto widget;
  1478		}
  1479	=

  1480		control_hdr =3D (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
  1481		dev_dbg(tplg->dev, "ASoC: template %s has %d controls of type %x\n",
  1482			w->name, w->num_kcontrols, control_hdr->type);
  1483	=

  1484		template.num_kcontrols =3D le32_to_cpu(w->num_kcontrols);
> 1485		kc =3D devm_kcalloc(tplg->dev, w->num_kcontrols, sizeof(*kc), GFP_K=
ERNEL);
  1486		if (!kc)
  1487			goto err;
  1488	=

  1489		kcontrol_type =3D devm_kcalloc(tplg->dev, w->num_kcontrols, sizeof(=
unsigned int), GFP_KERNEL);
  1490		if (!kcontrol_type)
  1491			goto err;
  1492	=

  1493		for (i =3D 0; i < w->num_kcontrols; i++) {
  1494			control_hdr =3D (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
  1495			switch (le32_to_cpu(control_hdr->ops.info)) {
  1496			case SND_SOC_TPLG_CTL_VOLSW:
  1497			case SND_SOC_TPLG_CTL_STROBE:
  1498			case SND_SOC_TPLG_CTL_VOLSW_SX:
  1499			case SND_SOC_TPLG_CTL_VOLSW_XR_SX:
  1500			case SND_SOC_TPLG_CTL_RANGE:
  1501			case SND_SOC_TPLG_DAPM_CTL_VOLSW:
  1502				/* volume mixer */
  1503				kc[i].index =3D mixer_count;
  1504				kcontrol_type[i] =3D SND_SOC_TPLG_TYPE_MIXER;
  1505				mixer_count++;
  1506				ret =3D soc_tplg_dapm_widget_dmixer_create(tplg, &kc[i]);
  1507				if (ret < 0)
  1508					goto hdr_err;
  1509				break;
  1510			case SND_SOC_TPLG_CTL_ENUM:
  1511			case SND_SOC_TPLG_CTL_ENUM_VALUE:
  1512			case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
  1513			case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
  1514			case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
  1515				/* enumerated mixer */
  1516				kc[i].index =3D enum_count;
  1517				kcontrol_type[i] =3D SND_SOC_TPLG_TYPE_ENUM;
  1518				enum_count++;
  1519				ret =3D soc_tplg_dapm_widget_denum_create(tplg, &kc[i]);
  1520				if (ret < 0)
  1521					goto hdr_err;
  1522				break;
  1523			case SND_SOC_TPLG_CTL_BYTES:
  1524				/* bytes control */
  1525				kc[i].index =3D bytes_count;
  1526				kcontrol_type[i] =3D SND_SOC_TPLG_TYPE_BYTES;
  1527				bytes_count++;
  1528				ret =3D soc_tplg_dapm_widget_dbytes_create(tplg, &kc[i]);
  1529				if (ret < 0)
  1530					goto hdr_err;
  1531				break;
  1532			default:
  1533				dev_err(tplg->dev, "ASoC: invalid widget control type %d:%d:%d\n",
  1534					control_hdr->ops.get, control_hdr->ops.put,
  1535					le32_to_cpu(control_hdr->ops.info));
  1536				ret =3D -EINVAL;
  1537				goto hdr_err;
  1538			}
  1539		}
  1540	=

  1541		template.kcontrol_news =3D kc;
  1542	=

  1543	widget:
  1544		ret =3D soc_tplg_widget_load(tplg, &template, w);
  1545		if (ret < 0)
  1546			goto hdr_err;
  1547	=

  1548		/* card dapm mutex is held by the core if we are loading topology
  1549		 * data during sound card init. */
  1550		if (card->instantiated)
  1551			widget =3D snd_soc_dapm_new_control(dapm, &template);
  1552		else
  1553			widget =3D snd_soc_dapm_new_control_unlocked(dapm, &template);
  1554		if (IS_ERR(widget)) {
  1555			ret =3D PTR_ERR(widget);
  1556			goto hdr_err;
  1557		}
  1558	=

  1559		widget->dobj.type =3D SND_SOC_DOBJ_WIDGET;
  1560		widget->dobj.widget.kcontrol_type =3D kcontrol_type;
  1561		widget->dobj.ops =3D tplg->ops;
  1562		widget->dobj.index =3D tplg->index;
  1563		list_add(&widget->dobj.list, &tplg->comp->dobj_list);
  1564	=

  1565		ret =3D soc_tplg_widget_ready(tplg, widget, w);
  1566		if (ret < 0)
  1567			goto ready_err;
  1568	=

  1569		kfree(template.sname);
  1570		kfree(template.name);
  1571	=

  1572		return 0;
  1573	=

  1574	ready_err:
  1575		remove_widget(widget->dapm->component, &widget->dobj, SOC_TPLG_PASS=
_WIDGET);
  1576		snd_soc_dapm_free_widget(widget);
  1577	hdr_err:
  1578		kfree(template.sname);
  1579		kfree(kc);
  1580	err:
  1581		kfree(template.name);
  1582		return ret;
  1583	}
  1584	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2518998366238600013==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2518998366238600013==--


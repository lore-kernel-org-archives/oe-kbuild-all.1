Content-Type: multipart/mixed; boundary="===============2294348632516107807=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 1/1] ASoC: dapm: Add support for multiple kcontrol types to a widget
Date: Tue, 04 May 2021 21:40:37 +0800
Message-ID: <202105042155.ZUxR028C-lkp@intel.com>
In-Reply-To: <20210504100713.4160008-2-jaska.uimonen@linux.intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2294348632516107807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jaska,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on asoc/for-next]
[also build test WARNING on v5.12 next-20210504]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jaska-Uimonen/Enable-using=
-multiple-different-type-kcontrols-for-widgets/20210504-182856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-next
config: h8300-randconfig-s031-20210504 (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/c3ae3eefaed49ea413b773616=
ed3fc309a8ade99
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jaska-Uimonen/Enable-using-multipl=
e-different-type-kcontrols-for-widgets/20210504-182856
        git checkout c3ae3eefaed49ea413b773616ed3fc309a8ade99
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Dh8300 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> sound/soc/soc-topology.c:1483:39: sparse: sparse: incorrect type in argu=
ment 2 (different base types) @@     expected unsigned long [usertype] n @@=
     got restricted __le32 [usertype] num_kcontrols @@
   sound/soc/soc-topology.c:1483:39: sparse:     expected unsigned long [us=
ertype] n
   sound/soc/soc-topology.c:1483:39: sparse:     got restricted __le32 [use=
rtype] num_kcontrols
   sound/soc/soc-topology.c:1487:50: sparse: sparse: incorrect type in argu=
ment 2 (different base types) @@     expected unsigned long [usertype] n @@=
     got restricted __le32 [usertype] num_kcontrols @@
   sound/soc/soc-topology.c:1487:50: sparse:     expected unsigned long [us=
ertype] n
   sound/soc/soc-topology.c:1487:50: sparse:     got restricted __le32 [use=
rtype] num_kcontrols
   sound/soc/soc-topology.c:1491:26: sparse: sparse: restricted __le32 degr=
ades to integer

vim +1483 sound/soc/soc-topology.c

  1417	=

  1418	static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
  1419		struct snd_soc_tplg_dapm_widget *w)
  1420	{
  1421		struct snd_soc_dapm_context *dapm =3D &tplg->comp->dapm;
  1422		struct snd_soc_dapm_widget template, *widget;
  1423		struct snd_soc_tplg_ctl_hdr *control_hdr;
  1424		struct snd_soc_card *card =3D tplg->comp->card;
  1425		unsigned int *kcontrol_type;
  1426		struct snd_kcontrol_new *kc;
  1427		int mixer_count =3D 0;
  1428		int bytes_count =3D 0;
  1429		int enum_count =3D 0;
  1430		int ret =3D 0;
  1431		int i;
  1432	=

  1433		if (strnlen(w->name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) =3D=3D
  1434			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
  1435			return -EINVAL;
  1436		if (strnlen(w->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) =3D=3D
  1437			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
  1438			return -EINVAL;
  1439	=

  1440		dev_dbg(tplg->dev, "ASoC: creating DAPM widget %s id %d\n",
  1441			w->name, w->id);
  1442	=

  1443		memset(&template, 0, sizeof(template));
  1444	=

  1445		/* map user to kernel widget ID */
  1446		template.id =3D get_widget_id(le32_to_cpu(w->id));
  1447		if ((int)template.id < 0)
  1448			return template.id;
  1449	=

  1450		/* strings are allocated here, but used and freed by the widget */
  1451		template.name =3D kstrdup(w->name, GFP_KERNEL);
  1452		if (!template.name)
  1453			return -ENOMEM;
  1454		template.sname =3D kstrdup(w->sname, GFP_KERNEL);
  1455		if (!template.sname) {
  1456			ret =3D -ENOMEM;
  1457			goto err;
  1458		}
  1459		template.reg =3D le32_to_cpu(w->reg);
  1460		template.shift =3D le32_to_cpu(w->shift);
  1461		template.mask =3D le32_to_cpu(w->mask);
  1462		template.subseq =3D le32_to_cpu(w->subseq);
  1463		template.on_val =3D w->invert ? 0 : 1;
  1464		template.off_val =3D w->invert ? 1 : 0;
  1465		template.ignore_suspend =3D le32_to_cpu(w->ignore_suspend);
  1466		template.event_flags =3D le16_to_cpu(w->event_flags);
  1467		template.dobj.index =3D tplg->index;
  1468	=

  1469		tplg->pos +=3D
  1470			(sizeof(struct snd_soc_tplg_dapm_widget) +
  1471			 le32_to_cpu(w->priv.size));
  1472	=

  1473		if (w->num_kcontrols =3D=3D 0) {
  1474			template.num_kcontrols =3D 0;
  1475			goto widget;
  1476		}
  1477	=

  1478		control_hdr =3D (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
  1479		dev_dbg(tplg->dev, "ASoC: template %s has %d controls of type %x\n",
  1480			w->name, w->num_kcontrols, control_hdr->type);
  1481	=

  1482		template.num_kcontrols =3D le32_to_cpu(w->num_kcontrols);
> 1483		kc =3D devm_kcalloc(tplg->dev, w->num_kcontrols, sizeof(*kc), GFP_K=
ERNEL);
  1484		if (!kc)
  1485			goto err;
  1486	=

  1487		kcontrol_type =3D devm_kcalloc(tplg->dev, w->num_kcontrols, sizeof(=
unsigned int), GFP_KERNEL);
  1488		if (!kcontrol_type)
  1489			goto err;
  1490	=

  1491		for (i =3D 0; i < w->num_kcontrols; i++) {
  1492			control_hdr =3D (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
  1493			switch (le32_to_cpu(control_hdr->ops.info)) {
  1494			case SND_SOC_TPLG_CTL_VOLSW:
  1495			case SND_SOC_TPLG_CTL_STROBE:
  1496			case SND_SOC_TPLG_CTL_VOLSW_SX:
  1497			case SND_SOC_TPLG_CTL_VOLSW_XR_SX:
  1498			case SND_SOC_TPLG_CTL_RANGE:
  1499			case SND_SOC_TPLG_DAPM_CTL_VOLSW:
  1500				/* volume mixer */
  1501				kc[i].index =3D mixer_count;
  1502				kcontrol_type[i] =3D SND_SOC_TPLG_TYPE_MIXER;
  1503				mixer_count++;
  1504				ret =3D soc_tplg_dapm_widget_dmixer_create(tplg, &kc[i]);
  1505				if (ret < 0)
  1506					goto hdr_err;
  1507				break;
  1508			case SND_SOC_TPLG_CTL_ENUM:
  1509			case SND_SOC_TPLG_CTL_ENUM_VALUE:
  1510			case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
  1511			case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
  1512			case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
  1513				/* enumerated mixer */
  1514				kc[i].index =3D enum_count;
  1515				kcontrol_type[i] =3D SND_SOC_TPLG_TYPE_ENUM;
  1516				enum_count++;
  1517				ret =3D soc_tplg_dapm_widget_denum_create(tplg, &kc[i]);
  1518				if (ret < 0)
  1519					goto hdr_err;
  1520				break;
  1521			case SND_SOC_TPLG_CTL_BYTES:
  1522				/* bytes control */
  1523				kc[i].index =3D bytes_count;
  1524				kcontrol_type[i] =3D SND_SOC_TPLG_TYPE_BYTES;
  1525				bytes_count++;
  1526				ret =3D soc_tplg_dapm_widget_dbytes_create(tplg, &kc[i]);
  1527				if (ret < 0)
  1528					goto hdr_err;
  1529				break;
  1530			default:
  1531				dev_err(tplg->dev, "ASoC: invalid widget control type %d:%d:%d\n",
  1532					control_hdr->ops.get, control_hdr->ops.put,
  1533					le32_to_cpu(control_hdr->ops.info));
  1534				ret =3D -EINVAL;
  1535				goto hdr_err;
  1536			}
  1537		}
  1538	=

  1539		template.kcontrol_news =3D kc;
  1540	=

  1541	widget:
  1542		ret =3D soc_tplg_widget_load(tplg, &template, w);
  1543		if (ret < 0)
  1544			goto hdr_err;
  1545	=

  1546		/* card dapm mutex is held by the core if we are loading topology
  1547		 * data during sound card init. */
  1548		if (card->instantiated)
  1549			widget =3D snd_soc_dapm_new_control(dapm, &template);
  1550		else
  1551			widget =3D snd_soc_dapm_new_control_unlocked(dapm, &template);
  1552		if (IS_ERR(widget)) {
  1553			ret =3D PTR_ERR(widget);
  1554			goto hdr_err;
  1555		}
  1556	=

  1557		widget->dobj.type =3D SND_SOC_DOBJ_WIDGET;
  1558		widget->dobj.widget.kcontrol_type =3D kcontrol_type;
  1559		widget->dobj.ops =3D tplg->ops;
  1560		widget->dobj.index =3D tplg->index;
  1561		list_add(&widget->dobj.list, &tplg->comp->dobj_list);
  1562	=

  1563		ret =3D soc_tplg_widget_ready(tplg, widget, w);
  1564		if (ret < 0)
  1565			goto ready_err;
  1566	=

  1567		kfree(template.sname);
  1568		kfree(template.name);
  1569	=

  1570		return 0;
  1571	=

  1572	ready_err:
  1573		remove_widget(widget->dapm->component, &widget->dobj, SOC_TPLG_PASS=
_WIDGET);
  1574		snd_soc_dapm_free_widget(widget);
  1575	hdr_err:
  1576		kfree(template.sname);
  1577		kfree(kc);
  1578	err:
  1579		kfree(template.name);
  1580		return ret;
  1581	}
  1582	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2294348632516107807==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
afiVELjbODv8P+QPFEqTlwEA
--===============2294348632516107807==--


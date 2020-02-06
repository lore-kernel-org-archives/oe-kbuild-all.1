Content-Type: multipart/mixed; boundary="===============5944456073410942121=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-arm:cex7 97/97] drivers/net/phy/qsfp.c:1094:41: sparse: sparse: incorrect type in argument 1 (different base types)
Date: Fri, 07 Feb 2020 02:31:12 +0800
Message-ID: <202002070207.qEjXfbzf%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5944456073410942121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.armlinux.org.uk/~rmk/linux-arm cex7
head:   2f8726526ed0fd189f8a945c06f8b9850777a5ca
commit: 2f8726526ed0fd189f8a945c06f8b9850777a5ca [97/97] net: add qsfp supp=
ort                              [*experimental*]
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-154-g1dc00f87-dirty
        git checkout 2f8726526ed0fd189f8a945c06f8b9850777a5ca
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/phy/qsfp.c:1094:41: sparse: sparse: incorrect type in argume=
nt 1 (different base types)
>> drivers/net/phy/qsfp.c:1094:41: sparse:    expected restricted __be16 co=
nst [usertype] *p
>> drivers/net/phy/qsfp.c:1094:41: sparse:    got restricted __le16 const *

vim +1094 drivers/net/phy/qsfp.c

  1022	=

  1023	static void qsfp_sm_mod_print(struct qsfp *qsfp)
  1024	{
  1025		const struct qsfp_sff8x36_id *id =3D &qsfp->id;
  1026		unsigned int br_nom, wavelen;
  1027		bool copper;
  1028		char length[16];
  1029		char date[9];
  1030	=

  1031		date[0] =3D id->ext.sff8436.datecode[4];
  1032		date[1] =3D id->ext.sff8436.datecode[5];
  1033		date[2] =3D '-';
  1034		date[3] =3D id->ext.sff8436.datecode[2];
  1035		date[4] =3D id->ext.sff8436.datecode[3];
  1036		date[5] =3D '-';
  1037		date[6] =3D id->ext.sff8436.datecode[0];
  1038		date[7] =3D id->ext.sff8436.datecode[1];
  1039		date[8] =3D '\0';
  1040	=

  1041		if (id->base.br_nominal =3D=3D 0) {
  1042			br_nom =3D 0;
  1043		} else if (id->base.br_nominal =3D=3D 255 &&
  1044			   qsfp->module_revision >=3D SFF8X36_REV_8636_1_3) {
  1045			br_nom =3D 250 * id->ext.sff8636.baud_rate_nominal;
  1046		} else {
  1047			br_nom =3D 100 * id->base.br_nominal;
  1048		}
  1049	=

  1050		dev_info(qsfp->dev, "module %.*s %.*s rev %.*s sn %.*s dc %s\n",
  1051			 (int)sizeof(id->base.vendor_name), id->base.vendor_name,
  1052			 (int)sizeof(id->base.vendor_pn), id->base.vendor_pn,
  1053			 (int)sizeof(id->base.vendor_rev), id->base.vendor_rev,
  1054			 (int)sizeof(id->ext.sff8436.vendor_sn), id->ext.sff8436.vendor_sn,
  1055			 date);
  1056	=

  1057		dev_info(qsfp->dev, "  0x%02x %s, 0x%02x %s\n",
  1058			 id->base.identifier,
  1059			 id->base.identifier =3D=3D 0x0c ? "QSFP (INF-8438)" :
  1060			 id->base.identifier =3D=3D 0x0d ? "QSFP+ (SFF-8636 or SFF-8436)" :
  1061			 id->base.identifier =3D=3D 0x11 ? "QSFP28 (SFF-8636)" : "unknown",
  1062			 qsfp->module_revision,
  1063			 qsfp->module_revision =3D=3D 0x00 ? "unspecified" :
  1064			 qsfp->module_revision =3D=3D 0x01 ? "SFF-8436 4.8 or earlier" :
  1065			 qsfp->module_revision =3D=3D 0x02 ? "SFF-8436 4.8 or earlier+" :
  1066			 qsfp->module_revision =3D=3D 0x03 ? "SFF-8636 1.3 or earlier" :
  1067			 qsfp->module_revision =3D=3D 0x04 ? "SFF-8636 1.4" :
  1068			 qsfp->module_revision =3D=3D 0x05 ? "SFF-8636 1.5" :
  1069			 qsfp->module_revision =3D=3D 0x06 ? "SFF-8636 2.0" :
  1070			 qsfp->module_revision =3D=3D 0x07 ? "SFF-8636 2.5..2.7" :
  1071			 qsfp->module_revision =3D=3D 0x08 ? "SFF-8636 2.8..2.10" : "unkno=
wn");
  1072	=

  1073		dev_info(qsfp->dev, "  %s connector, encoding %s, bitrate %u.%03u G=
Bd\n",
  1074			 sff_connector(id->base.connector),
  1075			 sff8436_encoding(id->base.encoding),
  1076			 br_nom / 1000, br_nom % 1000);
  1077	=

  1078		dev_info(qsfp->dev, "  Compliance bytes: %*ph  %02x\n",
  1079			 (int)sizeof(id->base.compliance), id->base.compliance,
  1080			 id->ext.sff8636.link_codes);
  1081	=

  1082		copper =3D id->base.compliance[0] & BIT(0) ||
  1083			 id->base.compliance[3] & (BIT(2) | BIT(3));
  1084	=

  1085		if (copper) {
  1086			dev_info(qsfp->dev, "  Copper Attenuation @ 2.5 GHz: %udB\n",
  1087				 id->base.copper_atten[0]);
  1088			dev_info(qsfp->dev, "  Copper Attenuation @ 5 GHz  : %udB\n",
  1089				 id->base.copper_atten[1]);
  1090			dev_info(qsfp->dev, "  Copper length               : %s\n",
  1091				 sff_link_len(length, sizeof(length),
  1092					      id->base.length[4], 1));
  1093		} else {
> 1094			wavelen =3D be16_to_cpup(&id->base.wavelength) * 5;
  1095			dev_info(qsfp->dev, "  Wavelength %u.%02unm, fiber lengths:\n",
  1096				 wavelen / 100, wavelen % 100);
  1097			dev_info(qsfp->dev, "     9=C2=B5m SM    : %s\n",
  1098				 sff_link_len(length, sizeof(length),
  1099					      id->base.length[0], 1));
  1100			dev_info(qsfp->dev, "  62.5=C2=B5m MM OM1: %s\n",
  1101				 sff_link_len(length, sizeof(length),
  1102					      id->base.length[3], 1));
  1103			dev_info(qsfp->dev, "    50=C2=B5m MM OM2: %s\n",
  1104				 sff_link_len(length, sizeof(length),
  1105					      id->base.length[2], 1));
  1106			dev_info(qsfp->dev, "    50=C2=B5m MM OM3: %s\n",
  1107				 sff_link_len(length, sizeof(length),
  1108					      id->base.length[1], 2));
  1109			dev_info(qsfp->dev, "    50=C2=B5m MM OM4: %s\n",
  1110				 sff_link_len(length, sizeof(length),
  1111					      id->base.length[4], 2));
  1112		}
  1113	}
  1114	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============5944456073410942121==--


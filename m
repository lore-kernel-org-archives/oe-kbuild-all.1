Content-Type: multipart/mixed; boundary="===============0598669377077615810=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/3] mfd: ahc1ec0: Add support for Advantech embedded controller
Date: Wed, 14 Oct 2020 23:23:43 +0800
Message-ID: <202010142309.oFBGfewK-lkp@intel.com>
In-Reply-To: <20201014083549.25465-1-shihlun.lin@advantech.com.tw>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0598669377077615810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Shihlun,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on linux/master v5.9]
[cannot apply to lee-mfd/for-mfd-next next-20201013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Shihlun-Lin/mfd-ahc1ec0-Ad=
d-support-for-Advantech-embedded-controller/20201014-164627
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
b5fc7a89e58bcc059a3d5e4db79c481fb437de59
config: parisc-randconfig-r003-20201014 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f939b81446bccbb73682a795e=
a5422386d6b15bb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Shihlun-Lin/mfd-ahc1ec0-Add-suppor=
t-for-Advantech-embedded-controller/20201014-164627
        git checkout f939b81446bccbb73682a795ea5422386d6b15bb
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dparisc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/mfd/ahc1ec0.c:71:5: warning: no previous prototype for 'wait_ibf=
' [-Wmissing-prototypes]
      71 | int wait_ibf(void)
         |     ^~~~~~~~
>> drivers/mfd/ahc1ec0.c:86:5: warning: no previous prototype for 'wait_obf=
' [-Wmissing-prototypes]
      86 | int wait_obf(void)
         |     ^~~~~~~~
>> drivers/mfd/ahc1ec0.c:101:5: warning: no previous prototype for 'read_hw=
_ram' [-Wmissing-prototypes]
     101 | int read_hw_ram(uchar addr, uchar *data)
         |     ^~~~~~~~~~~
>> drivers/mfd/ahc1ec0.c:182:5: warning: no previous prototype for 'wait_sm=
bus_protocol_finish' [-Wmissing-prototypes]
     182 | int wait_smbus_protocol_finish(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/ahc1ec0.c:203:5: warning: no previous prototype for 'adv_get=
_dynamic_tab' [-Wmissing-prototypes]
     203 | int adv_get_dynamic_tab(struct adv_ec_platform_data *pdata)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/mfd/ahc1ec0.c:409:5: warning: no previous prototype for 'write_a=
cpi_value' [-Wmissing-prototypes]
     409 | int write_acpi_value(uchar addr, uchar value)
         |     ^~~~~~~~~~~~~~~~
>> drivers/mfd/ahc1ec0.c:442:5: warning: no previous prototype for 'read_gp=
io_status' [-Wmissing-prototypes]
     442 | int read_gpio_status(uchar PinNumber, uchar *pvalue)
         |     ^~~~~~~~~~~~~~~~
>> drivers/mfd/ahc1ec0.c:493:5: warning: no previous prototype for 'write_g=
pio_status' [-Wmissing-prototypes]
     493 | int write_gpio_status(uchar PinNumber, uchar value)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/mfd/ahc1ec0.c:538:5: warning: no previous prototype for 'read_gp=
io_dir' [-Wmissing-prototypes]
     538 | int read_gpio_dir(uchar PinNumber, uchar *pvalue)
         |     ^~~~~~~~~~~~~
>> drivers/mfd/ahc1ec0.c:585:5: warning: no previous prototype for 'write_g=
pio_dir' [-Wmissing-prototypes]
     585 | int write_gpio_dir(uchar PinNumber, uchar value)
         |     ^~~~~~~~~~~~~~
>> drivers/mfd/ahc1ec0.c:631:5: warning: no previous prototype for 'write_h=
w_extend_ram' [-Wmissing-prototypes]
     631 | int write_hw_extend_ram(uchar addr, uchar data)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/mfd/ahc1ec0.c:866:5: warning: no previous prototype for 'smbus_w=
rite_byte' [-Wmissing-prototypes]
     866 | int smbus_write_byte(struct EC_SMBUS_WRITE_BYTE *ptr_ec_smbus_wr=
ite_byte)
         |     ^~~~~~~~~~~~~~~~
>> drivers/mfd/ahc1ec0.c:946:5: warning: no previous prototype for 'read_on=
ekey_status' [-Wmissing-prototypes]
     946 | int read_onekey_status(uchar addr, uchar *pdata)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/mfd/ahc1ec0.c:990:5: warning: no previous prototype for 'write_o=
nekey_status' [-Wmissing-prototypes]
     990 | int write_onekey_status(uchar addr)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/mfd/ahc1ec0.c:1024:5: warning: no previous prototype for 'ec_oem=
_get_status' [-Wmissing-prototypes]
    1024 | int ec_oem_get_status(uchar addr, uchar *pdata)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/mfd/ahc1ec0.c:1076:5: warning: no previous prototype for 'ec_oem=
_set_status' [-Wmissing-prototypes]
    1076 | int ec_oem_set_status(uchar addr, uchar pdata)
         |     ^~~~~~~~~~~~~~~~~
   drivers/mfd/ahc1ec0.c: In function 'adv_ec_get_productname':
>> drivers/mfd/ahc1ec0.c:1167:13: error: implicit declaration of function '=
ioremap_cache'; did you mean 'ioremap_uc'? [-Werror=3Dimplicit-function-dec=
laration]
    1167 |     (char *)ioremap_cache(((unsigned int *)&uc_ptaddr[index+0x18=
])[0],
         |             ^~~~~~~~~~~~~
         |             ioremap_uc
   At top level:
   drivers/mfd/ahc1ec0.c:1244:30: warning: 'adv_ec_util_cells' defined but =
not used [-Wunused-const-variable=3D]
    1244 | static const struct mfd_cell adv_ec_util_cells[] =3D {
         |                              ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +1167 drivers/mfd/ahc1ec0.c

   988	=

   989	/* Set One Key Recovery status */
 > 990	int write_onekey_status(uchar addr)
   991	{
   992		int ret;
   993	=

   994		mutex_lock(&lock);
   995	=

   996		/* Step 0. Wait IBF clear */
   997		ret =3D wait_ibf();
   998		if (ret)
   999			goto error;
  1000	=

  1001		/* Step 1. Send "One Key Recovery" command to EC Command port */
  1002		outb(EC_ONE_KEY_FLAG, EC_COMMAND_PORT);
  1003	=

  1004		/* Step 2. Wait IBF clear */
  1005		ret =3D wait_ibf();
  1006		if (ret)
  1007			goto error;
  1008	=

  1009		/* Step 3. Send "One Key Recovery function" address to EC Data port=
 */
  1010		outb(addr, EC_STATUS_PORT);
  1011	=

  1012		mutex_unlock(&lock);
  1013	=

  1014		pr_debug("%s: addr=3D %d, line: %d", __func__, addr, __LINE__);
  1015		return 0;
  1016	=

  1017	error:
  1018		mutex_unlock(&lock);
  1019		pr_debug("%s: Wait for IBF too long. line: %d", __func__, __LINE__);
  1020		return ret;
  1021	}
  1022	=

  1023	/* EC OEM get status */
> 1024	int ec_oem_get_status(uchar addr, uchar *pdata)
  1025	{
  1026		int ret;
  1027	=

  1028		mutex_lock(&lock);
  1029	=

  1030		/* Init return value */
  1031		*pdata =3D 0;
  1032	=

  1033		/* Step 0. Wait IBF clear */
  1034		ret =3D wait_ibf();
  1035		if (ret)
  1036			goto error;
  1037	=

  1038		/* Step 1. Send "ASG OEM" command to EC Command port */
  1039		outb(EC_ASG_OEM, EC_COMMAND_PORT);
  1040	=

  1041		/* Step 2. Wait IBF clear */
  1042		ret =3D wait_ibf();
  1043		if (ret)
  1044			goto error;
  1045	=

  1046		/* Step 3. Send "ASG OEM STATUS READ" address to EC Data port */
  1047		outb(EC_ASG_OEM_READ, EC_STATUS_PORT);
  1048	=

  1049		/* Step 4. Wait IBF clear */
  1050		ret =3D wait_ibf();
  1051		if (ret)
  1052			goto error;
  1053	=

  1054		/* Step 5. Send "OEM STATUS" address to EC Data port */
  1055		outb(addr, EC_STATUS_PORT);
  1056	=

  1057		/* Step 6. Wait OBF set */
  1058		ret =3D wait_obf();
  1059		if (ret)
  1060			goto error;
  1061	=

  1062		/* Step 7. Get "OEM STATUS" data from EC Data port */
  1063		*pdata =3D inb(EC_STATUS_PORT);
  1064	=

  1065		pr_debug("%s: data=3D %d, line: %d", __func__, *pdata, __LINE__);
  1066		mutex_unlock(&lock);
  1067		return 0;
  1068	=

  1069	error:
  1070		mutex_unlock(&lock);
  1071		pr_warn("%s: Wait for IBF or OBF too long. line: %d", __func__, __L=
INE__);
  1072		return ret;
  1073	}
  1074	=

  1075	/* EC OEM set status */
> 1076	int ec_oem_set_status(uchar addr, uchar pdata)
  1077	{
  1078		int ret;
  1079	=

  1080		mutex_lock(&lock);
  1081	=

  1082		/* Step 0. Wait IBF clear */
  1083		ret =3D wait_ibf();
  1084		if (ret)
  1085			goto error;
  1086	=

  1087		/* Step 1. Send "ASG OEM" command to EC Command port */
  1088		outb(EC_ASG_OEM, EC_COMMAND_PORT);
  1089	=

  1090		/* Step 2. Wait IBF clear */
  1091		ret =3D wait_ibf();
  1092		if (ret)
  1093			goto error;
  1094	=

  1095		/* Step 3. Send "ASG OEM STATUS WRITE" address to EC Data port */
  1096		outb(EC_ASG_OEM_WRITE, EC_STATUS_PORT);
  1097	=

  1098		/* Step 4. Wait IBF clear */
  1099		ret =3D wait_ibf();
  1100		if (ret)
  1101			goto error;
  1102	=

  1103		/* Step 5. Send "OEM STATUS" address to EC Data port */
  1104		outb(addr, EC_STATUS_PORT);
  1105	=

  1106		/* Step 6. Wait IBF clear */
  1107		ret =3D wait_ibf();
  1108		if (ret)
  1109			goto error;
  1110	=

  1111		/* Step 7. Send "OEM STATUS" status to EC Data port */
  1112		outb(pdata, EC_STATUS_PORT);
  1113	=

  1114		pr_debug("%s: data=3D %d, line: %d", __func__, pdata, __LINE__);
  1115		mutex_unlock(&lock);
  1116		return 0;
  1117	=

  1118	error:
  1119		mutex_unlock(&lock);
  1120		pr_warn("%s: Wait for IBF or OBF too long. line: %d", __func__, __L=
INE__);
  1121	=

  1122		return ret;
  1123	}
  1124	=

  1125	static int adv_ec_get_productname(char *product)
  1126	{
  1127		static unsigned char *uc_ptaddr;
  1128		static unsigned char *uc_epsaddr;
  1129		int index =3D 0, eps_table;
  1130		int i =3D 0;
  1131		int length =3D 0;
  1132		int type0_str =3D 0;
  1133		int type1_str =3D 0;
  1134		int is_advantech =3D 0;
  1135	=

  1136		uc_ptaddr =3D ioremap(AMI_UEFI_ADVANTECH_BOARD_NAME_ADDRESS,
  1137				AMI_UEFI_ADVANTECH_BOARD_NAME_LENGTH);
  1138		if (!uc_ptaddr) {
  1139			pr_err("Error: ioremap_nocache()");
  1140			return -ENXIO;
  1141		}
  1142	=

  1143		/* Try to Read the product name from UEFI BIOS(DMI) EPS table */
  1144		for (index =3D 0; index < AMI_UEFI_ADVANTECH_BOARD_NAME_LENGTH; ind=
ex++) {
  1145			if (uc_ptaddr[index] =3D=3D '_'
  1146					&& uc_ptaddr[index+0x1] =3D=3D 'S'
  1147					&& uc_ptaddr[index+0x2] =3D=3D 'M'
  1148					&& uc_ptaddr[index+0x3] =3D=3D '_'
  1149					&& uc_ptaddr[index+0x10] =3D=3D '_'
  1150					&& uc_ptaddr[index+0x11] =3D=3D 'D'
  1151					&& uc_ptaddr[index+0x12] =3D=3D 'M'
  1152					&& uc_ptaddr[index+0x13] =3D=3D 'I'
  1153					&& uc_ptaddr[index+0x14] =3D=3D '_'
  1154					) {
  1155				eps_table =3D 1;
  1156				break;
  1157			}
  1158		}
  1159	=

  1160		/* If EPS table exist, read type1(system information) */
  1161		if (eps_table) {
  1162			uc_epsaddr =3D
  1163				(char *)ioremap(((unsigned int *)&uc_ptaddr[index+0x18])[0],
  1164				((unsigned short *)&uc_ptaddr[index+0x16])[0]);
  1165			if (!uc_epsaddr) {
  1166				uc_epsaddr =3D
> 1167					(char *)ioremap_cache(((unsigned int *)&uc_ptaddr[index+0x18])[0=
],
  1168					((unsigned short *)&uc_ptaddr[index+0x16])[0]);
  1169				if (!uc_epsaddr) {
  1170					pr_err("Error: both ioremap() and ioremap_cache() exec failed!");
  1171					return -ENXIO;
  1172				}
  1173			}
  1174	=

  1175			type0_str =3D (int)uc_epsaddr[1];
  1176			for (i =3D type0_str; i < (type0_str+512); i++) {
  1177				if (uc_epsaddr[i] =3D=3D 0 && uc_epsaddr[i+1] =3D=3D 0 && uc_epsa=
ddr[i+2] =3D=3D 1) {
  1178					type1_str =3D i + uc_epsaddr[i+3];
  1179					break;
  1180				}
  1181			}
  1182			for (i =3D type1_str; i < (type1_str+512); i++) {
  1183				if (!strncmp(&uc_epsaddr[i], "Advantech", 9))
  1184					is_advantech =3D 1;
  1185	=

  1186				if (uc_epsaddr[i] =3D=3D 0) {
  1187					i++;
  1188					type1_str =3D i;
  1189					break;
  1190				}
  1191			}
  1192			length =3D 2;
  1193			while ((uc_epsaddr[type1_str + length] !=3D 0)
  1194					&& (length < AMI_UEFI_ADVANTECH_BOARD_NAME_LENGTH)) {
  1195				length +=3D 1;
  1196			}
  1197			memmove(product, &uc_epsaddr[type1_str], length);
  1198			iounmap((void *)uc_epsaddr);
  1199			if (is_advantech) {
  1200				iounmap((void *)uc_ptaddr);
  1201				return 0;
  1202			}
  1203		}
  1204	=

  1205		/* It is an old BIOS, read from 0x000F0000 */
  1206		for (index =3D 0; index < (AMI_UEFI_ADVANTECH_BOARD_NAME_LENGTH - 3=
); index++) {
  1207			if (!strncmp(&uc_ptaddr[index], "TPC", 3)
  1208					|| !strncmp(&uc_ptaddr[index], "UNO", 3)
  1209					|| !strncmp(&uc_ptaddr[index], "ITA", 3)
  1210					|| !strncmp(&uc_ptaddr[index], "MIO", 3)
  1211					|| !strncmp(&uc_ptaddr[index], "ECU", 3)
  1212					|| !strncmp(&uc_ptaddr[index], "APAX", 4))
  1213				break;
  1214		}
  1215	=

  1216		if (index =3D=3D (AMI_UEFI_ADVANTECH_BOARD_NAME_LENGTH - 3)) {
  1217			pr_err("%s: Can't find the product name, line: %d", __func__, __LI=
NE__);
  1218			product[0] =3D '\0';
  1219			iounmap((void *)uc_ptaddr);
  1220			return -ENODATA;
  1221		}
  1222	=

  1223		/* Use char "Space" (ASCII code: 32) to check the end of the Produc=
t Name. */
  1224		for (i =3D 0; (uc_ptaddr[index+i] !=3D 32) && (i < 31); i++)
  1225			product[i] =3D uc_ptaddr[index+i];
  1226	=

  1227		product[i] =3D '\0';
  1228		pr_info("%s: BIOS Product Name =3D %s, line: %d", __func__, product=
, __LINE__);
  1229	=

  1230		iounmap((void *)uc_ptaddr);
  1231	=

  1232		return 0;
  1233	}
  1234	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============0598669377077615810==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0598669377077615810==--


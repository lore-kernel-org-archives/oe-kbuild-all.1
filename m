Content-Type: multipart/mixed; boundary="===============3685899508582025517=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 2/2] power: supply: bq25790: Introduce the BQ25790 charger driver
Date: Fri, 09 Oct 2020 08:51:40 +0800
Message-ID: <202010090800.yCulmNLd-lkp@intel.com>
In-Reply-To: <20201008154356.19692-2-dmurphy@ti.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3685899508582025517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on power-supply/for-next]
[also build test WARNING on linus/master v5.9-rc8 next-20201008]
[cannot apply to linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dan-Murphy/dt-bindings-pow=
er-Add-the-bq25790-dt-bindings/20201008-234450
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-sup=
ply.git for-next
config: riscv-randconfig-r031-20201009 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 8da0df=
3d6dcc0dd42740be60b0da4ec201190904)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/bc435a97ea513a3f4baa45b16=
7b623a82187f9d3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dan-Murphy/dt-bindings-power-Add-t=
he-bq25790-dt-bindings/20201008-234450
        git checkout bc435a97ea513a3f4baa45b167b623a82187f9d3
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/power/supply/bq25790_charger.c:624:21: warning: use of logical '=
&&' with constant operand [-Wconstant-logical-operand]
                   if (state.fault_1 && (BQ25790_OTG_OVP | BQ25790_VSYS_OVP=
))
                                     ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq25790_charger.c:624:21: note: use '&' for a bitwi=
se operation
                   if (state.fault_1 && (BQ25790_OTG_OVP | BQ25790_VSYS_OVP=
))
                                     ^~
                                     &
   drivers/power/supply/bq25790_charger.c:624:21: note: remove constant to =
silence this warning
                   if (state.fault_1 && (BQ25790_OTG_OVP | BQ25790_VSYS_OVP=
))
                                    ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/power/supply/bq25790_charger.c:1102:36: warning: unused variable=
 'bq25790_acpi_match' [-Wunused-const-variable]
   static const struct acpi_device_id bq25790_acpi_match[] =3D {
                                      ^
   2 warnings generated.

vim +624 drivers/power/supply/bq25790_charger.c

   537	=

   538	static int bq25790_get_property(struct power_supply *psy,
   539					enum power_supply_property psp,
   540					union power_supply_propval *val)
   541	{
   542		struct bq25790_device *bq =3D power_supply_get_drvdata(psy);
   543		struct bq25790_state state;
   544		int ret =3D 0;
   545	=

   546		mutex_lock(&bq->lock);
   547		ret =3D bq25790_get_state(bq, &state);
   548		mutex_unlock(&bq->lock);
   549		if (ret)
   550			return ret;
   551	=

   552		switch (psp) {
   553		case POWER_SUPPLY_PROP_STATUS:
   554			if (!state.chrg_type || (state.chrg_type =3D=3D BQ25790_OTG_MODE))
   555				val->intval =3D POWER_SUPPLY_STATUS_DISCHARGING;
   556			else if (!state.chrg_status)
   557				val->intval =3D POWER_SUPPLY_STATUS_NOT_CHARGING;
   558			else if (state.chrg_status =3D=3D BQ25790_TERM_CHRG)
   559				val->intval =3D POWER_SUPPLY_STATUS_FULL;
   560			else
   561				val->intval =3D POWER_SUPPLY_STATUS_CHARGING;
   562			break;
   563		case POWER_SUPPLY_PROP_CHARGE_TYPE:
   564			switch (state.chrg_status) {
   565			case BQ25790_TRICKLE_CHRG:
   566				val->intval =3D POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
   567				break;
   568			case BQ25790_PRECHRG:
   569				val->intval =3D POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
   570				break;
   571			case BQ25790_FAST_CHRG:
   572				val->intval =3D POWER_SUPPLY_CHARGE_TYPE_FAST;
   573				break;
   574			case BQ25790_TAPER_CHRG:
   575				val->intval =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
   576				break;
   577			case BQ25790_TOP_OFF_CHRG:
   578				val->intval =3D POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
   579				break;
   580			case BQ25790_NOT_CHRGING:
   581				val->intval =3D POWER_SUPPLY_CHARGE_TYPE_NONE;
   582				break;
   583			default:
   584				val->intval =3D POWER_SUPPLY_CHARGE_TYPE_UNKNOWN;
   585			}
   586			break;
   587		case POWER_SUPPLY_PROP_MANUFACTURER:
   588			val->strval =3D BQ25790_MANUFACTURER;
   589			break;
   590	=

   591		case POWER_SUPPLY_PROP_MODEL_NAME:
   592			val->strval =3D BQ25790_NAME;
   593			break;
   594	=

   595		case POWER_SUPPLY_PROP_ONLINE:
   596			val->intval =3D state.online;
   597			break;
   598		case POWER_SUPPLY_PROP_USB_TYPE:
   599			if (!state.chrg_type) {
   600				val->intval =3D POWER_SUPPLY_USB_TYPE_UNKNOWN;
   601				break;
   602			}
   603			switch (state.chrg_type) {
   604			case BQ25790_USB_SDP:
   605				val->intval =3D POWER_SUPPLY_USB_TYPE_SDP;
   606				break;
   607			case BQ25790_USB_CDP:
   608				val->intval =3D POWER_SUPPLY_USB_TYPE_CDP;
   609				break;
   610			case BQ25790_USB_DCP:
   611				val->intval =3D POWER_SUPPLY_USB_TYPE_DCP;
   612				break;
   613			case BQ25790_OTG_MODE:
   614				val->intval =3D POWER_SUPPLY_USB_TYPE_PD_DRP;
   615				break;
   616	=

   617			default:
   618				val->intval =3D POWER_SUPPLY_USB_TYPE_UNKNOWN;
   619				break;
   620			}
   621			break;
   622	=

   623		case POWER_SUPPLY_PROP_HEALTH:
 > 624			if (state.fault_1 && (BQ25790_OTG_OVP | BQ25790_VSYS_OVP))
   625				val->intval =3D POWER_SUPPLY_HEALTH_OVERVOLTAGE;
   626			else
   627				val->intval =3D POWER_SUPPLY_HEALTH_GOOD;
   628	=

   629			switch (state.health) {
   630			case BQ25790_TEMP_HOT:
   631				val->intval =3D POWER_SUPPLY_HEALTH_HOT;
   632				break;
   633			case BQ25790_TEMP_WARM:
   634				val->intval =3D POWER_SUPPLY_HEALTH_WARM;
   635				break;
   636			case BQ25790_TEMP_COOL:
   637				val->intval =3D POWER_SUPPLY_HEALTH_COOL;
   638				break;
   639			case BQ25790_TEMP_COLD:
   640				val->intval =3D POWER_SUPPLY_HEALTH_COLD;
   641				break;
   642			}
   643			break;
   644		case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
   645			ret =3D bq25790_get_ichg_curr(bq);
   646			if (ret < 0)
   647				return ret;
   648	=

   649			val->intval =3D ret;
   650			break;
   651	=

   652		case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
   653			ret =3D bq25790_get_chrg_volt(bq);
   654			if (ret < 0)
   655				return ret;
   656	=

   657			val->intval =3D ret;
   658			break;
   659	=

   660		case POWER_SUPPLY_PROP_PRECHARGE_CURRENT:
   661			ret =3D bq25790_get_prechrg_curr(bq);
   662			if (ret < 0)
   663				return ret;
   664	=

   665			val->intval =3D ret;
   666			break;
   667		case POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT:
   668			ret =3D bq25790_get_term_curr(bq);
   669			if (ret < 0)
   670				return ret;
   671	=

   672			val->intval =3D ret;
   673			break;
   674		case POWER_SUPPLY_PROP_VOLTAGE_NOW:
   675			val->intval =3D state.vbus_adc;
   676			break;
   677		case POWER_SUPPLY_PROP_INPUT_VOLTAGE_LIMIT:
   678			ret =3D bq25790_get_input_volt_lim(bq);
   679			if (ret < 0)
   680				return ret;
   681	=

   682			val->intval =3D ret;
   683			break;
   684		case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
   685			ret =3D bq25790_get_input_curr_lim(bq);
   686			if (ret < 0)
   687				return ret;
   688	=

   689			val->intval =3D ret;
   690			break;
   691		default:
   692			return -EINVAL;
   693		}
   694	=

   695		return ret;
   696	}
   697	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3685899508582025517==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3685899508582025517==--


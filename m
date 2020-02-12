Content-Type: multipart/mixed; boundary="===============7424463048712653618=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [morimoto-linux:fw-cleanup-2020-02-12-v2 336/431] sound/soc/codecs/wcd934x.c:4203:22: sparse: sparse: incompatible types for 'case' statement
Date: Thu, 13 Feb 2020 01:41:57 +0800
Message-ID: <202002130152.77p2NmH6%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7424463048712653618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/morimoto/linux fw-cleanup-2020-02-12-v2
head:   538ef7e7474f6e712663f4994472aa5efa279619
commit: a23b375f723f6b6f2613214a2064355d3753ed8f [336/431] ASoC: remove snd=
_soc_component_read32()
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-166-g7e4a5b6f-dirty
        git checkout a23b375f723f6b6f2613214a2064355d3753ed8f
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   sound/soc/codecs/wcd934x.c:1471:32: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:1473:32: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:1520:31: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:1623:30: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:2353:18: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:2358:19: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:2363:19: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:2369:19: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:3542:23: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:3561:41: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:3565:41: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:3569:41: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:3573:41: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:3577:41: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:3598:33: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:3642:27: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:3693:27: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:3844:22: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:3896:33: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:3909:32: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:4111:22: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:4116:16: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:4200:26: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
>> sound/soc/codecs/wcd934x.c:4203:22: sparse: sparse: incompatible types f=
or 'case' statement
   sound/soc/codecs/wcd934x.c:4208:22: sparse: sparse: incompatible types f=
or 'case' statement
   sound/soc/codecs/wcd934x.c:4213:22: sparse: sparse: incompatible types f=
or 'case' statement
   sound/soc/codecs/wcd934x.c:4214:22: sparse: sparse: incompatible types f=
or 'case' statement
   sound/soc/codecs/wcd934x.c:4223:34: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:4243:41: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'
   sound/soc/codecs/wcd934x.c:4247:34: sparse: sparse: undefined identifier=
 'snd_soc_component_read32'

vim +/case +4203 sound/soc/codecs/wcd934x.c

a70d9245759a48 Srinivas Kandagatla 2019-12-19  4140  =

a70d9245759a48 Srinivas Kandagatla 2019-12-19  4141  static int wcd934x_cod=
ec_enable_dec(struct snd_soc_dapm_widget *w,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4142  				    struct snd_kco=
ntrol *kcontrol, int event)
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4143  {
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4144  	struct snd_soc_compon=
ent *comp =3D snd_soc_dapm_to_component(w->dapm);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4145  	unsigned int decimato=
r;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4146  	char *dec_adc_mux_nam=
e =3D NULL;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4147  	char *widget_name =3D=
 NULL;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4148  	char *wname;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4149  	int ret =3D 0, amic_n;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4150  	u16 tx_vol_ctl_reg, p=
wr_level_reg =3D 0, dec_cfg_reg, hpf_gate_reg;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4151  	u16 tx_gain_ctl_reg;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4152  	char *dec;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4153  	u8 hpf_coff_freq;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4154  =

a70d9245759a48 Srinivas Kandagatla 2019-12-19  4155  	widget_name =3D kstrn=
dup(w->name, 15, GFP_KERNEL);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4156  	if (!widget_name)
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4157  		return -ENOMEM;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4158  =

a70d9245759a48 Srinivas Kandagatla 2019-12-19  4159  	wname =3D widget_name;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4160  	dec_adc_mux_name =3D =
strsep(&widget_name, " ");
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4161  	if (!dec_adc_mux_name=
) {
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4162  		dev_err(comp->dev, "=
%s: Invalid decimator =3D %s\n",
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4163  			__func__, w->name);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4164  		ret =3D  -EINVAL;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4165  		goto out;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4166  	}
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4167  	dec_adc_mux_name =3D =
widget_name;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4168  =

a70d9245759a48 Srinivas Kandagatla 2019-12-19  4169  	dec =3D strpbrk(dec_a=
dc_mux_name, "012345678");
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4170  	if (!dec) {
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4171  		dev_err(comp->dev, "=
%s: decimator index not found\n",
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4172  			__func__);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4173  		ret =3D  -EINVAL;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4174  		goto out;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4175  	}
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4176  =

a70d9245759a48 Srinivas Kandagatla 2019-12-19  4177  	ret =3D kstrtouint(de=
c, 10, &decimator);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4178  	if (ret < 0) {
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4179  		dev_err(comp->dev, "=
%s: Invalid decimator =3D %s\n",
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4180  			__func__, wname);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4181  		ret =3D  -EINVAL;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4182  		goto out;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4183  	}
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4184  =

a70d9245759a48 Srinivas Kandagatla 2019-12-19  4185  	tx_vol_ctl_reg =3D WC=
D934X_CDC_TX0_TX_PATH_CTL + 16 * decimator;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4186  	hpf_gate_reg =3D WCD9=
34X_CDC_TX0_TX_PATH_SEC2 + 16 * decimator;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4187  	dec_cfg_reg =3D WCD93=
4X_CDC_TX0_TX_PATH_CFG0 + 16 * decimator;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4188  	tx_gain_ctl_reg =3D W=
CD934X_CDC_TX0_TX_VOL_CTL + 16 * decimator;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4189  =

a70d9245759a48 Srinivas Kandagatla 2019-12-19  4190  	switch (event) {
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4191  	case SND_SOC_DAPM_PRE=
_PMU:
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4192  		amic_n =3D wcd934x_c=
odec_find_amic_input(comp, decimator);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4193  		if (amic_n)
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4194  			pwr_level_reg =3D w=
cd934x_codec_get_amic_pwlvl_reg(comp,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4195  								 amic_n);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4196  =

a70d9245759a48 Srinivas Kandagatla 2019-12-19  4197  		if (!pwr_level_reg)
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4198  			break;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4199  =

a70d9245759a48 Srinivas Kandagatla 2019-12-19  4200  		switch ((snd_soc_com=
ponent_read32(comp, pwr_level_reg) &
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4201  				      WCD934X_AMIC=
_PWR_LVL_MASK) >>
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4202  				      WCD934X_AMIC=
_PWR_LVL_SHIFT) {
a70d9245759a48 Srinivas Kandagatla 2019-12-19 @4203  		case WCD934X_AMIC_PW=
R_LEVEL_LP:
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4204  			snd_soc_component_u=
pdate_bits(comp, dec_cfg_reg,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4205  					WCD934X_DEC_PWR_L=
VL_MASK,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4206  					WCD934X_DEC_PWR_L=
VL_LP);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4207  			break;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4208  		case WCD934X_AMIC_PW=
R_LEVEL_HP:
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4209  			snd_soc_component_u=
pdate_bits(comp, dec_cfg_reg,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4210  					WCD934X_DEC_PWR_L=
VL_MASK,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4211  					WCD934X_DEC_PWR_L=
VL_HP);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4212  			break;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4213  		case WCD934X_AMIC_PW=
R_LEVEL_DEFAULT:
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4214  		case WCD934X_AMIC_PW=
R_LEVEL_HYBRID:
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4215  		default:
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4216  			snd_soc_component_u=
pdate_bits(comp, dec_cfg_reg,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4217  					WCD934X_DEC_PWR_L=
VL_MASK,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4218  					WCD934X_DEC_PWR_L=
VL_DF);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4219  			break;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4220  		}
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4221  		break;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4222  	case SND_SOC_DAPM_POS=
T_PMU:
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4223  		hpf_coff_freq =3D (s=
nd_soc_component_read32(comp, dec_cfg_reg) &
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4224  				 TX_HPF_CUT_OFF_FR=
EQ_MASK) >> 5;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4225  		if (hpf_coff_freq !=
=3D CF_MIN_3DB_150HZ) {
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4226  			snd_soc_component_u=
pdate_bits(comp, dec_cfg_reg,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4227  						      TX_HPF_CUT=
_OFF_FREQ_MASK,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4228  						      CF_MIN_3DB=
_150HZ << 5);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4229  			snd_soc_component_u=
pdate_bits(comp, hpf_gate_reg,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4230  				      WCD934X_HPH_=
CUTOFF_FREQ_CHANGE_REQ_MASK,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4231  				      WCD934X_HPH_=
CUTOFF_FREQ_CHANGE_REQ);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4232  			/*
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4233  			 * Minimum 1 clk cy=
cle delay is required as per
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4234  			 * HW spec.
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4235  			 */
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4236  			usleep_range(1000, =
1010);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4237  			snd_soc_component_u=
pdate_bits(comp, hpf_gate_reg,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4238  				      WCD934X_HPH_=
CUTOFF_FREQ_CHANGE_REQ_MASK,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4239  				      0);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4240  		}
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4241  		/* apply gain after =
decimator is enabled */
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4242  		snd_soc_component_wr=
ite(comp, tx_gain_ctl_reg,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4243  					snd_soc_component=
_read32(comp,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4244  							 tx_gain_ctl_re=
g));
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4245  		break;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4246  	case SND_SOC_DAPM_PRE=
_PMD:
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4247  		hpf_coff_freq =3D (s=
nd_soc_component_read32(comp, dec_cfg_reg) &
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4248  				 TX_HPF_CUT_OFF_FR=
EQ_MASK) >> 5;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4249  =

a70d9245759a48 Srinivas Kandagatla 2019-12-19  4250  		if (hpf_coff_freq !=
=3D CF_MIN_3DB_150HZ) {
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4251  			snd_soc_component_u=
pdate_bits(comp, dec_cfg_reg,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4252  						      TX_HPF_CUT=
_OFF_FREQ_MASK,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4253  						      hpf_coff_f=
req << 5);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4254  			snd_soc_component_u=
pdate_bits(comp, hpf_gate_reg,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4255  				      WCD934X_HPH_=
CUTOFF_FREQ_CHANGE_REQ_MASK,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4256  				      WCD934X_HPH_=
CUTOFF_FREQ_CHANGE_REQ);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4257  				/*
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4258  				 * Minimum 1 clk c=
ycle delay is required as per
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4259  				 * HW spec.
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4260  				 */
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4261  			usleep_range(1000, =
1010);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4262  			snd_soc_component_u=
pdate_bits(comp, hpf_gate_reg,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4263  				      WCD934X_HPH_=
CUTOFF_FREQ_CHANGE_REQ_MASK,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4264  				      0);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4265  		}
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4266  		break;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4267  	case SND_SOC_DAPM_POS=
T_PMD:
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4268  		snd_soc_component_up=
date_bits(comp, tx_vol_ctl_reg,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4269  					      0x10, 0x00);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4270  		snd_soc_component_up=
date_bits(comp, dec_cfg_reg,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4271  					      WCD934X_DEC=
_PWR_LVL_MASK,
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4272  					      WCD934X_DEC=
_PWR_LVL_DF);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4273  		break;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4274  	};
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4275  out:
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4276  	kfree(wname);
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4277  	return ret;
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4278  }
a70d9245759a48 Srinivas Kandagatla 2019-12-19  4279  =


:::::: The code@line 4203 was first introduced by commit
:::::: a70d9245759a48e57bb1dc9f63213dcf3017db32 ASoC: wcd934x: add capture =
dapm widgets

:::::: TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7424463048712653618==--


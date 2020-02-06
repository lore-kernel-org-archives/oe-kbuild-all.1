Content-Type: multipart/mixed; boundary="===============1146940627650612906=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: sound/pci/hda/patch_hdmi.c:1086: undefined reference to `snd_hda_get_num_devices'
Date: Thu, 06 Feb 2020 18:43:15 +0800
Message-ID: <202002061809.r3UYBZGx%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1146940627650612906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4c7d00ccf40db99bfb7bd1857bcbf007275704d8
commit: aa2b4a59871a0528bccb91ad94768c9dc2b7bb3d ASoC: Intel: boards: fix i=
ncorrect HDMI Kconfig dependency
date:   7 weeks ago
config: i386-randconfig-e003-20200206 (attached as .config)
compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
reproduce:
        git checkout aa2b4a59871a0528bccb91ad94768c9dc2b7bb3d
        # save the attached .config to linux build tree
        make ARCH=3Di386 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: sound/pci/hda/patch_hdmi.o: in function `intel_not_share_assigned_cv=
t':
>> sound/pci/hda/patch_hdmi.c:1086: undefined reference to `snd_hda_get_num=
_devices'
>> ld: sound/pci/hda/patch_hdmi.c:1098: undefined reference to `snd_hda_get=
_dev_select'
>> ld: sound/pci/hda/patch_hdmi.c:1099: undefined reference to `snd_hda_set=
_dev_select'
   ld: sound/pci/hda/patch_hdmi.c:1123: undefined reference to `snd_hda_set=
_dev_select'
   ld: sound/pci/hda/patch_hdmi.o: in function `check_non_pcm_per_cvt':
>> sound/pci/hda/patch_hdmi.c:1894: undefined reference to `snd_hda_spdif_o=
ut_of_nid'
   ld: sound/pci/hda/patch_hdmi.o: in function `reprogram_jack_detect':
>> sound/pci/hda/patch_hdmi.c:2490: undefined reference to `snd_hda_jack_tb=
l_get_mst'
>> ld: sound/pci/hda/patch_hdmi.c:2503: undefined reference to `snd_hda_jac=
k_detect_enable'
   ld: sound/pci/hda/patch_hdmi.o: in function `generic_hdmi_build_pcms':
>> sound/pci/hda/patch_hdmi.c:2144: undefined reference to `snd_hda_codec_p=
cm_new'
   ld: sound/pci/hda/patch_hdmi.o: in function `generic_hdmi_playback_pcm_c=
leanup':
>> sound/pci/hda/patch_hdmi.c:1996: undefined reference to `__snd_hda_codec=
_cleanup_stream'
   ld: sound/pci/hda/patch_hdmi.o: in function `generic_hdmi_build_jack':
>> sound/pci/hda/patch_hdmi.c:2213: undefined reference to `is_jack_detecta=
ble'
>> ld: sound/pci/hda/patch_hdmi.c:2217: undefined reference to `snd_hda_jac=
k_add_kctl_mst'
>> ld: sound/pci/hda/patch_hdmi.c:2222: undefined reference to `snd_hda_jac=
k_tbl_get_mst'
   ld: sound/pci/hda/patch_hdmi.o: in function `hdmi_pin_get_eld':
>> sound/pci/hda/patch_hdmi.c:646: undefined reference to `snd_hda_set_dev_=
select'
   ld: sound/pci/hda/patch_hdmi.o: in function `intel_haswell_enable_all_pi=
ns':
>> sound/pci/hda/patch_hdmi.c:2640: undefined reference to `snd_hda_codec_u=
pdate_widgets'
   ld: sound/pci/hda/patch_hdmi.o: in function `simple_hdmi_unsol_event':
>> sound/pci/hda/patch_hdmi.c:2978: undefined reference to `snd_hda_jack_se=
t_dirty_all'
>> ld: sound/pci/hda/patch_hdmi.c:2979: undefined reference to `snd_hda_jac=
k_report_sync'
   ld: sound/pci/hda/patch_hdmi.o: in function `simple_playback_pcm_prepare=
':
>> sound/pci/hda/patch_hdmi.c:3159: undefined reference to `snd_hda_multi_o=
ut_dig_prepare'
   ld: sound/pci/hda/patch_hdmi.o: in function `simple_playback_pcm_close':
>> sound/pci/hda/patch_hdmi.c:3149: undefined reference to `snd_hda_multi_o=
ut_dig_close'
   ld: sound/pci/hda/patch_hdmi.o: in function `simple_playback_pcm_open':
>> sound/pci/hda/patch_hdmi.c:3141: undefined reference to `snd_hda_multi_o=
ut_dig_open'
   ld: sound/pci/hda/patch_hdmi.o: in function `nvhdmi_7x_init_8ch':
>> sound/pci/hda/patch_hdmi.c:3087: undefined reference to `snd_hda_sequenc=
e_write'
   ld: sound/pci/hda/patch_hdmi.o: in function `nvhdmi_7x_init_2ch':
   sound/pci/hda/patch_hdmi.c:3081: undefined reference to `snd_hda_sequenc=
e_write'
   ld: sound/pci/hda/patch_hdmi.o: in function `hdmi_pcm_open':
   sound/pci/hda/patch_hdmi.c:1257: undefined reference to `snd_hda_set_dev=
_select'
>> ld: sound/pci/hda/patch_hdmi.c:1265: undefined reference to `snd_hda_spd=
if_ctls_assign'

vim +1086 sound/pci/hda/patch_hdmi.c

307229d2ac5f604 Anssi Hannula     2013-10-24   921  =

307229d2ac5f604 Anssi Hannula     2013-10-24   922  static int hdmi_setup_s=
tream(struct hda_codec *codec, hda_nid_t cvt_nid,
9c32fea836928d7 Nikhil Mahale     2019-11-19   923  			      hda_nid_t pin_=
nid, int dev_id,
9c32fea836928d7 Nikhil Mahale     2019-11-19   924  			      u32 stream_tag=
, int format)
307229d2ac5f604 Anssi Hannula     2013-10-24   925  {
307229d2ac5f604 Anssi Hannula     2013-10-24   926  	struct hdmi_spec *spec=
 =3D codec->spec;
5a5d718f952b55e Sriram Periyasamy 2017-09-19   927  	unsigned int param;
307229d2ac5f604 Anssi Hannula     2013-10-24   928  	int err;
307229d2ac5f604 Anssi Hannula     2013-10-24   929  =

9c32fea836928d7 Nikhil Mahale     2019-11-19   930  	err =3D spec->ops.pin_=
hbr_setup(codec, pin_nid, dev_id,
9c32fea836928d7 Nikhil Mahale     2019-11-19   931  				      is_hbr_format=
(format));
307229d2ac5f604 Anssi Hannula     2013-10-24   932  =

307229d2ac5f604 Anssi Hannula     2013-10-24   933  	if (err) {
4e76a8833fac8dc Takashi Iwai      2014-02-25   934  		codec_dbg(codec, "hdm=
i_setup_stream: HBR is not supported\n");
307229d2ac5f604 Anssi Hannula     2013-10-24   935  		return err;
ea87d1c493aba9c Anssi Hannula     2010-08-03   936  	}
079d88ccc374d2c Wu Fengguang      2010-03-08   937  =

cb45722b289b544 Takashi Iwai      2019-11-11   938  	if (spec->intel_hsw_fi=
xup) {
5a5d718f952b55e Sriram Periyasamy 2017-09-19   939  =

5a5d718f952b55e Sriram Periyasamy 2017-09-19   940  		/*
5a5d718f952b55e Sriram Periyasamy 2017-09-19   941  		 * on recent platform=
s IEC Coding Type is required for HBR
5a5d718f952b55e Sriram Periyasamy 2017-09-19   942  		 * support, read curr=
ent Digital Converter settings and set
5a5d718f952b55e Sriram Periyasamy 2017-09-19   943  		 * ICT bitfield if ne=
eded.
5a5d718f952b55e Sriram Periyasamy 2017-09-19   944  		 */
5a5d718f952b55e Sriram Periyasamy 2017-09-19   945  		param =3D snd_hda_cod=
ec_read(codec, cvt_nid, 0,
5a5d718f952b55e Sriram Periyasamy 2017-09-19   946  					   AC_VERB_GET_DIG=
I_CONVERT_1, 0);
5a5d718f952b55e Sriram Periyasamy 2017-09-19   947  =

5a5d718f952b55e Sriram Periyasamy 2017-09-19   948  		param =3D (param >> 1=
6) & ~(AC_DIG3_ICT);
5a5d718f952b55e Sriram Periyasamy 2017-09-19   949  =

5a5d718f952b55e Sriram Periyasamy 2017-09-19   950  		/* on recent platform=
s ICT mode is required for HBR support */
5a5d718f952b55e Sriram Periyasamy 2017-09-19   951  		if (is_hbr_format(for=
mat))
5a5d718f952b55e Sriram Periyasamy 2017-09-19   952  			param |=3D 0x1;
5a5d718f952b55e Sriram Periyasamy 2017-09-19   953  =

5a5d718f952b55e Sriram Periyasamy 2017-09-19   954  		snd_hda_codec_write(c=
odec, cvt_nid, 0,
5a5d718f952b55e Sriram Periyasamy 2017-09-19   955  				    AC_VERB_SET_DIG=
I_CONVERT_3, param);
5a5d718f952b55e Sriram Periyasamy 2017-09-19   956  	}
5a5d718f952b55e Sriram Periyasamy 2017-09-19   957  =

384a48d71520ca5 Stephen Warren    2011-06-01  @958  	snd_hda_codec_setup_st=
ream(codec, cvt_nid, stream_tag, 0, format);
ea87d1c493aba9c Anssi Hannula     2010-08-03   959  	return 0;
079d88ccc374d2c Wu Fengguang      2010-03-08   960  }
079d88ccc374d2c Wu Fengguang      2010-03-08   961  =

42b2987079eca02 Libin Yang        2015-12-16   962  /* Try to find an avail=
able converter
42b2987079eca02 Libin Yang        2015-12-16   963   * If pin_idx is less t=
hen zero, just try to find an available converter.
42b2987079eca02 Libin Yang        2015-12-16   964   * Otherwise, try to fi=
nd an available converter and get the cvt mux index
42b2987079eca02 Libin Yang        2015-12-16   965   * of the pin.
42b2987079eca02 Libin Yang        2015-12-16   966   */
7ef166b831237e6 Wang Xingchao     2013-06-18   967  static int hdmi_choose_=
cvt(struct hda_codec *codec,
4846a67eb5a1d7c Takashi Iwai      2016-03-21   968  			   int pin_idx, int =
*cvt_id)
bbbe33900d1f3c4 Takashi Iwai      2010-08-13   969  {
bbbe33900d1f3c4 Takashi Iwai      2010-08-13   970  	struct hdmi_spec *spec=
 =3D codec->spec;
384a48d71520ca5 Stephen Warren    2011-06-01   971  	struct hdmi_spec_per_p=
in *per_pin;
384a48d71520ca5 Stephen Warren    2011-06-01   972  	struct hdmi_spec_per_c=
vt *per_cvt =3D NULL;
7ef166b831237e6 Wang Xingchao     2013-06-18   973  	int cvt_idx, mux_idx =
=3D 0;
bbbe33900d1f3c4 Takashi Iwai      2010-08-13   974  =

42b2987079eca02 Libin Yang        2015-12-16   975  	/* pin_idx < 0 means n=
o pin will be bound to the converter */
42b2987079eca02 Libin Yang        2015-12-16   976  	if (pin_idx < 0)
42b2987079eca02 Libin Yang        2015-12-16   977  		per_pin =3D NULL;
42b2987079eca02 Libin Yang        2015-12-16   978  	else
bce0d2a80e428aa Takashi Iwai      2013-03-13   979  		per_pin =3D get_pin(s=
pec, pin_idx);
384a48d71520ca5 Stephen Warren    2011-06-01   980  =

384a48d71520ca5 Stephen Warren    2011-06-01   981  	/* Dynamically assign =
converter to stream */
384a48d71520ca5 Stephen Warren    2011-06-01   982  	for (cvt_idx =3D 0; cv=
t_idx < spec->num_cvts; cvt_idx++) {
bce0d2a80e428aa Takashi Iwai      2013-03-13   983  		per_cvt =3D get_cvt(s=
pec, cvt_idx);
384a48d71520ca5 Stephen Warren    2011-06-01   984  =

384a48d71520ca5 Stephen Warren    2011-06-01   985  		/* Must not already b=
e assigned */
384a48d71520ca5 Stephen Warren    2011-06-01   986  		if (per_cvt->assigned)
384a48d71520ca5 Stephen Warren    2011-06-01   987  			continue;
42b2987079eca02 Libin Yang        2015-12-16   988  		if (per_pin =3D=3D NU=
LL)
42b2987079eca02 Libin Yang        2015-12-16   989  			break;
384a48d71520ca5 Stephen Warren    2011-06-01   990  		/* Must be in pin's m=
ux's list of converters */
384a48d71520ca5 Stephen Warren    2011-06-01   991  		for (mux_idx =3D 0; m=
ux_idx < per_pin->num_mux_nids; mux_idx++)
384a48d71520ca5 Stephen Warren    2011-06-01   992  			if (per_pin->mux_nid=
s[mux_idx] =3D=3D per_cvt->cvt_nid)
384a48d71520ca5 Stephen Warren    2011-06-01   993  				break;
384a48d71520ca5 Stephen Warren    2011-06-01   994  		/* Not in mux list */
384a48d71520ca5 Stephen Warren    2011-06-01   995  		if (mux_idx =3D=3D pe=
r_pin->num_mux_nids)
384a48d71520ca5 Stephen Warren    2011-06-01   996  			continue;
384a48d71520ca5 Stephen Warren    2011-06-01   997  		break;
384a48d71520ca5 Stephen Warren    2011-06-01   998  	}
7ef166b831237e6 Wang Xingchao     2013-06-18   999  =

384a48d71520ca5 Stephen Warren    2011-06-01  1000  	/* No free converters =
*/
384a48d71520ca5 Stephen Warren    2011-06-01  1001  	if (cvt_idx =3D=3D spe=
c->num_cvts)
42b2987079eca02 Libin Yang        2015-12-16  1002  		return -EBUSY;
bbbe33900d1f3c4 Takashi Iwai      2010-08-13  1003  =

42b2987079eca02 Libin Yang        2015-12-16  1004  	if (per_pin !=3D NULL)
2df6742f613840a Mengdong Lin      2014-03-20  1005  		per_pin->mux_idx =3D =
mux_idx;
2df6742f613840a Mengdong Lin      2014-03-20  1006  =

7ef166b831237e6 Wang Xingchao     2013-06-18  1007  	if (cvt_id)
7ef166b831237e6 Wang Xingchao     2013-06-18  1008  		*cvt_id =3D cvt_idx;
7ef166b831237e6 Wang Xingchao     2013-06-18  1009  =

7ef166b831237e6 Wang Xingchao     2013-06-18  1010  	return 0;
7ef166b831237e6 Wang Xingchao     2013-06-18  1011  }
7ef166b831237e6 Wang Xingchao     2013-06-18  1012  =

2df6742f613840a Mengdong Lin      2014-03-20  1013  /* Assure the pin selec=
t the right convetor */
2df6742f613840a Mengdong Lin      2014-03-20  1014  static void intel_verif=
y_pin_cvt_connect(struct hda_codec *codec,
2df6742f613840a Mengdong Lin      2014-03-20  1015  			struct hdmi_spec_per=
_pin *per_pin)
2df6742f613840a Mengdong Lin      2014-03-20  1016  {
2df6742f613840a Mengdong Lin      2014-03-20  1017  	hda_nid_t pin_nid =3D =
per_pin->pin_nid;
2df6742f613840a Mengdong Lin      2014-03-20  1018  	int mux_idx, curr;
2df6742f613840a Mengdong Lin      2014-03-20  1019  =

2df6742f613840a Mengdong Lin      2014-03-20  1020  	mux_idx =3D per_pin->m=
ux_idx;
2df6742f613840a Mengdong Lin      2014-03-20  1021  	curr =3D snd_hda_codec=
_read(codec, pin_nid, 0,
2df6742f613840a Mengdong Lin      2014-03-20  1022  					  AC_VERB_GET_CONN=
ECT_SEL, 0);
2df6742f613840a Mengdong Lin      2014-03-20  1023  	if (curr !=3D mux_idx)
2df6742f613840a Mengdong Lin      2014-03-20  1024  		snd_hda_codec_write_c=
ache(codec, pin_nid, 0,
2df6742f613840a Mengdong Lin      2014-03-20  1025  					    AC_VERB_SET_CO=
NNECT_SEL,
2df6742f613840a Mengdong Lin      2014-03-20  1026  					    mux_idx);
2df6742f613840a Mengdong Lin      2014-03-20  1027  }
2df6742f613840a Mengdong Lin      2014-03-20  1028  =

42b2987079eca02 Libin Yang        2015-12-16  1029  /* get the mux index fo=
r the converter of the pins
42b2987079eca02 Libin Yang        2015-12-16  1030   * converter's mux inde=
x is the same for all pins on Intel platform
42b2987079eca02 Libin Yang        2015-12-16  1031   */
42b2987079eca02 Libin Yang        2015-12-16  1032  static int intel_cvt_id=
_to_mux_idx(struct hdmi_spec *spec,
42b2987079eca02 Libin Yang        2015-12-16  1033  			hda_nid_t cvt_nid)
42b2987079eca02 Libin Yang        2015-12-16  1034  {
42b2987079eca02 Libin Yang        2015-12-16  1035  	int i;
42b2987079eca02 Libin Yang        2015-12-16  1036  =

42b2987079eca02 Libin Yang        2015-12-16  1037  	for (i =3D 0; i < spec=
->num_cvts; i++)
42b2987079eca02 Libin Yang        2015-12-16  1038  		if (spec->cvt_nids[i]=
 =3D=3D cvt_nid)
42b2987079eca02 Libin Yang        2015-12-16  1039  			return i;
42b2987079eca02 Libin Yang        2015-12-16  1040  	return -EINVAL;
42b2987079eca02 Libin Yang        2015-12-16  1041  }
42b2987079eca02 Libin Yang        2015-12-16  1042  =

300016b960661b4 Mengdong Lin      2013-11-04  1043  /* Intel HDMI workaroun=
d to fix audio routing issue:
300016b960661b4 Mengdong Lin      2013-11-04  1044   * For some Intel displ=
ay codecs, pins share the same connection list.
300016b960661b4 Mengdong Lin      2013-11-04  1045   * So a conveter can be=
 selected by multiple pins and playback on any of these
300016b960661b4 Mengdong Lin      2013-11-04  1046   * pins will generate s=
ound on the external display, because audio flows from
300016b960661b4 Mengdong Lin      2013-11-04  1047   * the same converter t=
o the display pipeline. Also muting one pin may make
300016b960661b4 Mengdong Lin      2013-11-04  1048   * other pins have no s=
ound output.
300016b960661b4 Mengdong Lin      2013-11-04  1049   * So this function ass=
ures that an assigned converter for a pin is not selected
300016b960661b4 Mengdong Lin      2013-11-04  1050   * by any other pins.
300016b960661b4 Mengdong Lin      2013-11-04  1051   */
300016b960661b4 Mengdong Lin      2013-11-04  1052  static void intel_not_s=
hare_assigned_cvt(struct hda_codec *codec,
9152085defb6426 Libin Yang        2017-01-12  1053  					 hda_nid_t pin_nid,
9152085defb6426 Libin Yang        2017-01-12  1054  					 int dev_id, int m=
ux_idx)
7ef166b831237e6 Wang Xingchao     2013-06-18  1055  {
7ef166b831237e6 Wang Xingchao     2013-06-18  1056  	struct hdmi_spec *spec=
 =3D codec->spec;
7639a06c23c7d4c Takashi Iwai      2015-03-03  1057  	hda_nid_t nid;
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1058  	int cvt_idx, curr;
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1059  	struct hdmi_spec_per_c=
vt *per_cvt;
9152085defb6426 Libin Yang        2017-01-12  1060  	struct hdmi_spec_per_p=
in *per_pin;
9152085defb6426 Libin Yang        2017-01-12  1061  	int pin_idx;
9152085defb6426 Libin Yang        2017-01-12  1062  =

9152085defb6426 Libin Yang        2017-01-12  1063  	/* configure the pins =
connections */
9152085defb6426 Libin Yang        2017-01-12  1064  	for (pin_idx =3D 0; pi=
n_idx < spec->num_pins; pin_idx++) {
9152085defb6426 Libin Yang        2017-01-12  1065  		int dev_id_saved;
9152085defb6426 Libin Yang        2017-01-12  1066  		int dev_num;
7ef166b831237e6 Wang Xingchao     2013-06-18  1067  =

9152085defb6426 Libin Yang        2017-01-12  1068  		per_pin =3D get_pin(s=
pec, pin_idx);
9152085defb6426 Libin Yang        2017-01-12  1069  		/*
9152085defb6426 Libin Yang        2017-01-12  1070  		 * pin not connected =
to monitor
9152085defb6426 Libin Yang        2017-01-12  1071  		 * no need to operate=
 on it
9152085defb6426 Libin Yang        2017-01-12  1072  		 */
9152085defb6426 Libin Yang        2017-01-12  1073  		if (!per_pin->pcm)
9152085defb6426 Libin Yang        2017-01-12  1074  			continue;
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1075  =

9152085defb6426 Libin Yang        2017-01-12  1076  		if ((per_pin->pin_nid=
 =3D=3D pin_nid) &&
9152085defb6426 Libin Yang        2017-01-12  1077  			(per_pin->dev_id =3D=
=3D dev_id))
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1078  			continue;
7ef166b831237e6 Wang Xingchao     2013-06-18  1079  =

9152085defb6426 Libin Yang        2017-01-12  1080  		/*
9152085defb6426 Libin Yang        2017-01-12  1081  		 * if per_pin->dev_id=
 >=3D dev_num,
9152085defb6426 Libin Yang        2017-01-12  1082  		 * snd_hda_get_dev_se=
lect() will fail,
9152085defb6426 Libin Yang        2017-01-12  1083  		 * and the following =
operation is unpredictable.
9152085defb6426 Libin Yang        2017-01-12  1084  		 * So skip this situa=
tion.
9152085defb6426 Libin Yang        2017-01-12  1085  		 */
9152085defb6426 Libin Yang        2017-01-12 @1086  		dev_num =3D snd_hda_g=
et_num_devices(codec, per_pin->pin_nid) + 1;
9152085defb6426 Libin Yang        2017-01-12  1087  		if (per_pin->dev_id >=
=3D dev_num)
7ef166b831237e6 Wang Xingchao     2013-06-18  1088  			continue;
7ef166b831237e6 Wang Xingchao     2013-06-18  1089  =

9152085defb6426 Libin Yang        2017-01-12  1090  		nid =3D per_pin->pin_=
nid;
9152085defb6426 Libin Yang        2017-01-12  1091  =

9152085defb6426 Libin Yang        2017-01-12  1092  		/*
9152085defb6426 Libin Yang        2017-01-12  1093  		 * Calling this funct=
ion should not impact
9152085defb6426 Libin Yang        2017-01-12  1094  		 * on the device entr=
y selection
9152085defb6426 Libin Yang        2017-01-12  1095  		 * So let's save the =
dev id for each pin,
9152085defb6426 Libin Yang        2017-01-12  1096  		 * and restore it whe=
n return
9152085defb6426 Libin Yang        2017-01-12  1097  		 */
9152085defb6426 Libin Yang        2017-01-12 @1098  		dev_id_saved =3D snd_=
hda_get_dev_select(codec, nid);
9152085defb6426 Libin Yang        2017-01-12 @1099  		snd_hda_set_dev_selec=
t(codec, nid, per_pin->dev_id);
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1100  		curr =3D snd_hda_code=
c_read(codec, nid, 0,
7ef166b831237e6 Wang Xingchao     2013-06-18  1101  					  AC_VERB_GET_CONN=
ECT_SEL, 0);
9152085defb6426 Libin Yang        2017-01-12  1102  		if (curr !=3D mux_idx=
) {
9152085defb6426 Libin Yang        2017-01-12  1103  			snd_hda_set_dev_sele=
ct(codec, nid, dev_id_saved);
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1104  			continue;
9152085defb6426 Libin Yang        2017-01-12  1105  		}
9152085defb6426 Libin Yang        2017-01-12  1106  =

7ef166b831237e6 Wang Xingchao     2013-06-18  1107  =

f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1108  		/* choose an unassign=
ed converter. The conveters in the
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1109  		 * connection list ar=
e in the same order as in the codec.
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1110  		 */
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1111  		for (cvt_idx =3D 0; c=
vt_idx < spec->num_cvts; cvt_idx++) {
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1112  			per_cvt =3D get_cvt(=
spec, cvt_idx);
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1113  			if (!per_cvt->assign=
ed) {
4e76a8833fac8dc Takashi Iwai      2014-02-25  1114  				codec_dbg(codec,
4e76a8833fac8dc Takashi Iwai      2014-02-25  1115  					  "choose cvt %d f=
or pin nid %d\n",
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1116  					cvt_idx, nid);
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1117  				snd_hda_codec_write=
_cache(codec, nid, 0,
7ef166b831237e6 Wang Xingchao     2013-06-18  1118  					    AC_VERB_SET_CO=
NNECT_SEL,
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1119  					    cvt_idx);
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1120  				break;
f82d7d16aee5eb4 Mengdong Lin      2013-09-21  1121  			}
7ef166b831237e6 Wang Xingchao     2013-06-18  1122  		}
9152085defb6426 Libin Yang        2017-01-12  1123  		snd_hda_set_dev_selec=
t(codec, nid, dev_id_saved);
7ef166b831237e6 Wang Xingchao     2013-06-18  1124  	}
7ef166b831237e6 Wang Xingchao     2013-06-18  1125  }
7ef166b831237e6 Wang Xingchao     2013-06-18  1126  =

42b2987079eca02 Libin Yang        2015-12-16  1127  /* A wrapper of intel_n=
ot_share_asigned_cvt() */
42b2987079eca02 Libin Yang        2015-12-16  1128  static void intel_not_s=
hare_assigned_cvt_nid(struct hda_codec *codec,
9152085defb6426 Libin Yang        2017-01-12  1129  			hda_nid_t pin_nid, i=
nt dev_id, hda_nid_t cvt_nid)
42b2987079eca02 Libin Yang        2015-12-16  1130  {
42b2987079eca02 Libin Yang        2015-12-16  1131  	int mux_idx;
42b2987079eca02 Libin Yang        2015-12-16  1132  	struct hdmi_spec *spec=
 =3D codec->spec;
42b2987079eca02 Libin Yang        2015-12-16  1133  =

42b2987079eca02 Libin Yang        2015-12-16  1134  	/* On Intel platform, =
the mapping of converter nid to
42b2987079eca02 Libin Yang        2015-12-16  1135  	 * mux index of the pi=
ns are always the same.
42b2987079eca02 Libin Yang        2015-12-16  1136  	 * The pin nid may be =
0, this means all pins will not
42b2987079eca02 Libin Yang        2015-12-16  1137  	 * share the converter.
42b2987079eca02 Libin Yang        2015-12-16  1138  	 */
42b2987079eca02 Libin Yang        2015-12-16  1139  	mux_idx =3D intel_cvt_=
id_to_mux_idx(spec, cvt_nid);
42b2987079eca02 Libin Yang        2015-12-16  1140  	if (mux_idx >=3D 0)
9152085defb6426 Libin Yang        2017-01-12  1141  		intel_not_share_assig=
ned_cvt(codec, pin_nid, dev_id, mux_idx);
42b2987079eca02 Libin Yang        2015-12-16  1142  }
42b2987079eca02 Libin Yang        2015-12-16  1143  =

4846a67eb5a1d7c Takashi Iwai      2016-03-21  1144  /* skeleton caller of p=
in_cvt_fixup ops */
4846a67eb5a1d7c Takashi Iwai      2016-03-21  1145  static void pin_cvt_fix=
up(struct hda_codec *codec,
4846a67eb5a1d7c Takashi Iwai      2016-03-21  1146  			  struct hdmi_spec_p=
er_pin *per_pin,
4846a67eb5a1d7c Takashi Iwai      2016-03-21  1147  			  hda_nid_t cvt_nid)
4846a67eb5a1d7c Takashi Iwai      2016-03-21  1148  {
4846a67eb5a1d7c Takashi Iwai      2016-03-21  1149  	struct hdmi_spec *spec=
 =3D codec->spec;
4846a67eb5a1d7c Takashi Iwai      2016-03-21  1150  =

4846a67eb5a1d7c Takashi Iwai      2016-03-21  1151  	if (spec->ops.pin_cvt_=
fixup)
4846a67eb5a1d7c Takashi Iwai      2016-03-21  1152  		spec->ops.pin_cvt_fix=
up(codec, per_pin, cvt_nid);
4846a67eb5a1d7c Takashi Iwai      2016-03-21  1153  }
4846a67eb5a1d7c Takashi Iwai      2016-03-21  1154  =

42b2987079eca02 Libin Yang        2015-12-16  1155  /* called in hdmi_pcm_o=
pen when no pin is assigned to the PCM
42b2987079eca02 Libin Yang        2015-12-16  1156   * in dyn_pcm_assign mo=
de.
42b2987079eca02 Libin Yang        2015-12-16  1157   */
42b2987079eca02 Libin Yang        2015-12-16  1158  static int hdmi_pcm_ope=
n_no_pin(struct hda_pcm_stream *hinfo,
42b2987079eca02 Libin Yang        2015-12-16  1159  			 struct hda_codec *c=
odec,
42b2987079eca02 Libin Yang        2015-12-16  1160  			 struct snd_pcm_subs=
tream *substream)
42b2987079eca02 Libin Yang        2015-12-16  1161  {
42b2987079eca02 Libin Yang        2015-12-16  1162  	struct hdmi_spec *spec=
 =3D codec->spec;
42b2987079eca02 Libin Yang        2015-12-16  1163  	struct snd_pcm_runtime=
 *runtime =3D substream->runtime;
ac98379a751e37b Libin Yang        2015-12-16  1164  	int cvt_idx, pcm_idx;
42b2987079eca02 Libin Yang        2015-12-16  1165  	struct hdmi_spec_per_c=
vt *per_cvt =3D NULL;
42b2987079eca02 Libin Yang        2015-12-16  1166  	int err;
42b2987079eca02 Libin Yang        2015-12-16  1167  =

ac98379a751e37b Libin Yang        2015-12-16  1168  	pcm_idx =3D hinfo_to_p=
cm_index(codec, hinfo);
ac98379a751e37b Libin Yang        2015-12-16  1169  	if (pcm_idx < 0)
ac98379a751e37b Libin Yang        2015-12-16  1170  		return -EINVAL;
ac98379a751e37b Libin Yang        2015-12-16  1171  =

4846a67eb5a1d7c Takashi Iwai      2016-03-21  1172  	err =3D hdmi_choose_cv=
t(codec, -1, &cvt_idx);
42b2987079eca02 Libin Yang        2015-12-16  1173  	if (err)
42b2987079eca02 Libin Yang        2015-12-16  1174  		return err;
42b2987079eca02 Libin Yang        2015-12-16  1175  =

42b2987079eca02 Libin Yang        2015-12-16  1176  	per_cvt =3D get_cvt(sp=
ec, cvt_idx);
42b2987079eca02 Libin Yang        2015-12-16  1177  	per_cvt->assigned =3D =
1;
42b2987079eca02 Libin Yang        2015-12-16  1178  	hinfo->nid =3D per_cvt=
->cvt_nid;
42b2987079eca02 Libin Yang        2015-12-16  1179  =

4846a67eb5a1d7c Takashi Iwai      2016-03-21  1180  	pin_cvt_fixup(codec, N=
ULL, per_cvt->cvt_nid);
42b2987079eca02 Libin Yang        2015-12-16  1181  =

ac98379a751e37b Libin Yang        2015-12-16  1182  	set_bit(pcm_idx, &spec=
->pcm_in_use);
42b2987079eca02 Libin Yang        2015-12-16  1183  	/* todo: setup spdif c=
tls assign */
42b2987079eca02 Libin Yang        2015-12-16  1184  =

42b2987079eca02 Libin Yang        2015-12-16  1185  	/* Initially set the c=
onverter's capabilities */
42b2987079eca02 Libin Yang        2015-12-16  1186  	hinfo->channels_min =
=3D per_cvt->channels_min;
42b2987079eca02 Libin Yang        2015-12-16  1187  	hinfo->channels_max =
=3D per_cvt->channels_max;
42b2987079eca02 Libin Yang        2015-12-16  1188  	hinfo->rates =3D per_c=
vt->rates;
42b2987079eca02 Libin Yang        2015-12-16  1189  	hinfo->formats =3D per=
_cvt->formats;
42b2987079eca02 Libin Yang        2015-12-16  1190  	hinfo->maxbps =3D per_=
cvt->maxbps;
42b2987079eca02 Libin Yang        2015-12-16  1191  =

42b2987079eca02 Libin Yang        2015-12-16  1192  	/* Store the updated p=
arameters */
42b2987079eca02 Libin Yang        2015-12-16  1193  	runtime->hw.channels_m=
in =3D hinfo->channels_min;
42b2987079eca02 Libin Yang        2015-12-16  1194  	runtime->hw.channels_m=
ax =3D hinfo->channels_max;
42b2987079eca02 Libin Yang        2015-12-16  1195  	runtime->hw.formats =
=3D hinfo->formats;
42b2987079eca02 Libin Yang        2015-12-16  1196  	runtime->hw.rates =3D =
hinfo->rates;
42b2987079eca02 Libin Yang        2015-12-16  1197  =

42b2987079eca02 Libin Yang        2015-12-16  1198  	snd_pcm_hw_constraint_=
step(substream->runtime, 0,
42b2987079eca02 Libin Yang        2015-12-16  1199  				   SNDRV_PCM_HW_PAR=
AM_CHANNELS, 2);
42b2987079eca02 Libin Yang        2015-12-16  1200  	return 0;
42b2987079eca02 Libin Yang        2015-12-16  1201  }
42b2987079eca02 Libin Yang        2015-12-16  1202  =

7ef166b831237e6 Wang Xingchao     2013-06-18  1203  /*
7ef166b831237e6 Wang Xingchao     2013-06-18  1204   * HDA PCM callbacks
7ef166b831237e6 Wang Xingchao     2013-06-18  1205   */
7ef166b831237e6 Wang Xingchao     2013-06-18  1206  static int hdmi_pcm_ope=
n(struct hda_pcm_stream *hinfo,
7ef166b831237e6 Wang Xingchao     2013-06-18  1207  			 struct hda_codec *c=
odec,
7ef166b831237e6 Wang Xingchao     2013-06-18  1208  			 struct snd_pcm_subs=
tream *substream)
7ef166b831237e6 Wang Xingchao     2013-06-18  1209  {
7ef166b831237e6 Wang Xingchao     2013-06-18  1210  	struct hdmi_spec *spec=
 =3D codec->spec;
7ef166b831237e6 Wang Xingchao     2013-06-18  1211  	struct snd_pcm_runtime=
 *runtime =3D substream->runtime;
4846a67eb5a1d7c Takashi Iwai      2016-03-21  1212  	int pin_idx, cvt_idx, =
pcm_idx;
7ef166b831237e6 Wang Xingchao     2013-06-18  1213  	struct hdmi_spec_per_p=
in *per_pin;
7ef166b831237e6 Wang Xingchao     2013-06-18  1214  	struct hdmi_eld *eld;
7ef166b831237e6 Wang Xingchao     2013-06-18  1215  	struct hdmi_spec_per_c=
vt *per_cvt =3D NULL;
7ef166b831237e6 Wang Xingchao     2013-06-18  1216  	int err;
7ef166b831237e6 Wang Xingchao     2013-06-18  1217  =

7ef166b831237e6 Wang Xingchao     2013-06-18  1218  	/* Validate hinfo */
2bf3c85a5b167a6 Libin Yang        2015-12-16  1219  	pcm_idx =3D hinfo_to_p=
cm_index(codec, hinfo);
2bf3c85a5b167a6 Libin Yang        2015-12-16  1220  	if (pcm_idx < 0)
2bf3c85a5b167a6 Libin Yang        2015-12-16  1221  		return -EINVAL;
2bf3c85a5b167a6 Libin Yang        2015-12-16  1222  =

42b2987079eca02 Libin Yang        2015-12-16  1223  	mutex_lock(&spec->pcm_=
lock);
4e76a8833fac8dc Takashi Iwai      2014-02-25  1224  	pin_idx =3D hinfo_to_p=
in_index(codec, hinfo);
42b2987079eca02 Libin Yang        2015-12-16  1225  	if (!spec->dyn_pcm_ass=
ign) {
42b2987079eca02 Libin Yang        2015-12-16  1226  		if (snd_BUG_ON(pin_id=
x < 0)) {
f69548ffafcc494 Takashi Iwai      2018-07-12  1227  			err =3D -EINVAL;
f69548ffafcc494 Takashi Iwai      2018-07-12  1228  			goto unlock;
42b2987079eca02 Libin Yang        2015-12-16  1229  		}
42b2987079eca02 Libin Yang        2015-12-16  1230  	} else {
42b2987079eca02 Libin Yang        2015-12-16  1231  		/* no pin is assigned=
 to the PCM
42b2987079eca02 Libin Yang        2015-12-16  1232  		 * PA need pcm open s=
uccessfully when probe
42b2987079eca02 Libin Yang        2015-12-16  1233  		 */
42b2987079eca02 Libin Yang        2015-12-16  1234  		if (pin_idx < 0) {
42b2987079eca02 Libin Yang        2015-12-16  1235  			err =3D hdmi_pcm_ope=
n_no_pin(hinfo, codec, substream);
f69548ffafcc494 Takashi Iwai      2018-07-12  1236  			goto unlock;
42b2987079eca02 Libin Yang        2015-12-16  1237  		}
42b2987079eca02 Libin Yang        2015-12-16  1238  	}
7ef166b831237e6 Wang Xingchao     2013-06-18  1239  =

4846a67eb5a1d7c Takashi Iwai      2016-03-21  1240  	err =3D hdmi_choose_cv=
t(codec, pin_idx, &cvt_idx);
f69548ffafcc494 Takashi Iwai      2018-07-12  1241  	if (err < 0)
f69548ffafcc494 Takashi Iwai      2018-07-12  1242  		goto unlock;
7ef166b831237e6 Wang Xingchao     2013-06-18  1243  =

7ef166b831237e6 Wang Xingchao     2013-06-18  1244  	per_cvt =3D get_cvt(sp=
ec, cvt_idx);
384a48d71520ca5 Stephen Warren    2011-06-01  1245  	/* Claim converter */
384a48d71520ca5 Stephen Warren    2011-06-01  1246  	per_cvt->assigned =3D =
1;
42b2987079eca02 Libin Yang        2015-12-16  1247  =

ac98379a751e37b Libin Yang        2015-12-16  1248  	set_bit(pcm_idx, &spec=
->pcm_in_use);
42b2987079eca02 Libin Yang        2015-12-16  1249  	per_pin =3D get_pin(sp=
ec, pin_idx);
1df5a06abbaa876 Anssi Hannula     2013-10-05  1250  	per_pin->cvt_nid =3D p=
er_cvt->cvt_nid;
384a48d71520ca5 Stephen Warren    2011-06-01  1251  	hinfo->nid =3D per_cvt=
->cvt_nid;
384a48d71520ca5 Stephen Warren    2011-06-01  1252  =

e38e486d66e2a3b Takashi Iwai      2019-12-02  1253  	/* flip stripe flag fo=
r the assigned stream if supported */
e38e486d66e2a3b Takashi Iwai      2019-12-02  1254  	if (get_wcaps(codec, p=
er_cvt->cvt_nid) & AC_WCAP_STRIPE)
e38e486d66e2a3b Takashi Iwai      2019-12-02  1255  		azx_stream(get_azx_de=
v(substream))->stripe =3D 1;
e38e486d66e2a3b Takashi Iwai      2019-12-02  1256  =

9152085defb6426 Libin Yang        2017-01-12  1257  	snd_hda_set_dev_select=
(codec, per_pin->pin_nid, per_pin->dev_id);
bddee96b5d0db86 Takashi Iwai      2013-06-18  1258  	snd_hda_codec_write_ca=
che(codec, per_pin->pin_nid, 0,
384a48d71520ca5 Stephen Warren    2011-06-01  1259  			    AC_VERB_SET_CONN=
ECT_SEL,
4846a67eb5a1d7c Takashi Iwai      2016-03-21  1260  			    per_pin->mux_idx=
);
7ef166b831237e6 Wang Xingchao     2013-06-18  1261  =

7ef166b831237e6 Wang Xingchao     2013-06-18  1262  	/* configure unused pi=
ns to choose other converters */
4846a67eb5a1d7c Takashi Iwai      2016-03-21  1263  	pin_cvt_fixup(codec, p=
er_pin, 0);
7ef166b831237e6 Wang Xingchao     2013-06-18  1264  =

2bf3c85a5b167a6 Libin Yang        2015-12-16 @1265  	snd_hda_spdif_ctls_ass=
ign(codec, pcm_idx, per_cvt->cvt_nid);
bbbe33900d1f3c4 Takashi Iwai      2010-08-13  1266  =

2def8172c6611f2 Stephen Warren    2011-06-01  1267  	/* Initially set the c=
onverter's capabilities */
384a48d71520ca5 Stephen Warren    2011-06-01  1268  	hinfo->channels_min =
=3D per_cvt->channels_min;
384a48d71520ca5 Stephen Warren    2011-06-01  1269  	hinfo->channels_max =
=3D per_cvt->channels_max;
384a48d71520ca5 Stephen Warren    2011-06-01  1270  	hinfo->rates =3D per_c=
vt->rates;
384a48d71520ca5 Stephen Warren    2011-06-01  1271  	hinfo->formats =3D per=
_cvt->formats;
384a48d71520ca5 Stephen Warren    2011-06-01  1272  	hinfo->maxbps =3D per_=
cvt->maxbps;
2def8172c6611f2 Stephen Warren    2011-06-01  1273  =

42b2987079eca02 Libin Yang        2015-12-16  1274  	eld =3D &per_pin->sink=
_eld;
384a48d71520ca5 Stephen Warren    2011-06-01  1275  	/* Restrict capabiliti=
es by ELD if this isn't disabled */
c3d52105753dafd Stephen Warren    2011-06-01  1276  	if (!static_hdmi_pcm &=
& eld->eld_valid) {
1613d6b46b433f0 David Henningsson 2013-02-19  1277  		snd_hdmi_eld_update_p=
cm_info(&eld->info, hinfo);
bbbe33900d1f3c4 Takashi Iwai      2010-08-13  1278  		if (hinfo->channels_m=
in > hinfo->channels_max ||
2ad779b7329d689 Takashi Iwai      2013-02-01  1279  		    !hinfo->rates || =
!hinfo->formats) {
2ad779b7329d689 Takashi Iwai      2013-02-01  1280  			per_cvt->assigned =
=3D 0;
2ad779b7329d689 Takashi Iwai      2013-02-01  1281  			hinfo->nid =3D 0;
2bf3c85a5b167a6 Libin Yang        2015-12-16 @1282  			snd_hda_spdif_ctls_u=
nassign(codec, pcm_idx);
f69548ffafcc494 Takashi Iwai      2018-07-12  1283  			err =3D -ENODEV;
f69548ffafcc494 Takashi Iwai      2018-07-12  1284  			goto unlock;
bbbe33900d1f3c4 Takashi Iwai      2010-08-13  1285  		}
2ad779b7329d689 Takashi Iwai      2013-02-01  1286  	}
2def8172c6611f2 Stephen Warren    2011-06-01  1287  =

2def8172c6611f2 Stephen Warren    2011-06-01  1288  	/* Store the updated p=
arameters */
639cef0eb6df05d Takashi Iwai      2011-01-14  1289  	runtime->hw.channels_m=
in =3D hinfo->channels_min;
639cef0eb6df05d Takashi Iwai      2011-01-14  1290  	runtime->hw.channels_m=
ax =3D hinfo->channels_max;
639cef0eb6df05d Takashi Iwai      2011-01-14  1291  	runtime->hw.formats =
=3D hinfo->formats;
639cef0eb6df05d Takashi Iwai      2011-01-14  1292  	runtime->hw.rates =3D =
hinfo->rates;
4fe2ca14678174d Takashi Iwai      2011-01-14  1293  =

4fe2ca14678174d Takashi Iwai      2011-01-14  1294  	snd_pcm_hw_constraint_=
step(substream->runtime, 0,
4fe2ca14678174d Takashi Iwai      2011-01-14  1295  				   SNDRV_PCM_HW_PAR=
AM_CHANNELS, 2);
f69548ffafcc494 Takashi Iwai      2018-07-12  1296   unlock:
f69548ffafcc494 Takashi Iwai      2018-07-12  1297  	mutex_unlock(&spec->pc=
m_lock);
f69548ffafcc494 Takashi Iwai      2018-07-12  1298  	return err;
bbbe33900d1f3c4 Takashi Iwai      2010-08-13  1299  }
bbbe33900d1f3c4 Takashi Iwai      2010-08-13  1300  =


:::::: The code at line 1086 was first introduced by commit
:::::: 9152085defb6426ce8f9989ca27e4450daefbd89 ALSA: hda - add DP MST audi=
o support

:::::: TO: Libin Yang <libin.yang@linux.intel.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============1146940627650612906==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
qCX+n58CAA==
--===============1146940627650612906==--


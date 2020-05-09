Content-Type: multipart/mixed; boundary="===============3898905348832382062=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] ASoC: rsnd: add interrupt support for SSI BUSIF buffer
Date: Sat, 09 May 2020 19:07:39 +0800
Message-ID: <202005091913.1eUIsqFr%lkp@intel.com>
In-Reply-To: <20200508074753.10362-1-giraffesnn123@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3898905348832382062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Yongbo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on asoc/for-next]
[also build test ERROR on v5.7-rc4 next-20200508]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Yongbo-Zhang/ASoC-rsnd-add=
-interrupt-support-for-SSI-BUSIF-buffer/20200509-035713
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-next
config: xtensa-allyesconfig (attached as .config)
compiler: xtensa-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dxtensa =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/soc/sh/rcar/ssi.c: In function 'rsnd_ssi_quit':
>> sound/soc/sh/rcar/ssi.c:596:12: error: invalid storage class for functio=
n 'rsnd_ssi_hw_params'
     596 | static int rsnd_ssi_hw_params(struct rsnd_mod *mod,
         |            ^~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:596:1: warning: ISO C90 forbids mixed declaratio=
ns and code [-Wdeclaration-after-statement]
     596 | static int rsnd_ssi_hw_params(struct rsnd_mod *mod,
         | ^~~~~~
>> sound/soc/sh/rcar/ssi.c:615:12: error: invalid storage class for functio=
n 'rsnd_ssi_start'
     615 | static int rsnd_ssi_start(struct rsnd_mod *mod,
         |            ^~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:648:12: error: invalid storage class for functio=
n 'rsnd_ssi_stop'
     648 | static int rsnd_ssi_stop(struct rsnd_mod *mod,
         |            ^~~~~~~~~~~~~
>> sound/soc/sh/rcar/ssi.c:692:12: error: invalid storage class for functio=
n 'rsnd_ssi_irq'
     692 | static int rsnd_ssi_irq(struct rsnd_mod *mod,
         |            ^~~~~~~~~~~~
>> sound/soc/sh/rcar/ssi.c:734:13: error: invalid storage class for functio=
n 'rsnd_ssi_pio_interrupt'
     734 | static bool rsnd_ssi_pio_interrupt(struct rsnd_mod *mod,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:736:13: error: invalid storage class for functio=
n '__rsnd_ssi_interrupt'
     736 | static void __rsnd_ssi_interrupt(struct rsnd_mod *mod,
         |             ^~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c: In function '__rsnd_ssi_interrupt':
   sound/soc/sh/rcar/ssi.c:760:13: error: implicit declaration of function =
'rsnd_ssi_pio_interrupt'; did you mean 'rsnd_mod_interrupt'? [-Werror=3Dimp=
licit-function-declaration]
     760 |   elapsed =3D rsnd_ssi_pio_interrupt(mod, io);
         |             ^~~~~~~~~~~~~~~~~~~~~~
         |             rsnd_mod_interrupt
   sound/soc/sh/rcar/ssi.c:798:14: error: too few arguments to function 'rs=
nd_mod_write'
     798 |     status =3D rsnd_mod_write(mod,
         |              ^~~~~~~~~~~~~~
   In file included from sound/soc/sh/rcar/ssi.c:21:
   sound/soc/sh/rcar/rsnd.h:260:6: note: declared here
     260 | void rsnd_mod_write(struct rsnd_mod *mod, enum rsnd_reg reg, u32=
 data);
         |      ^~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c: In function 'rsnd_ssi_quit':
   sound/soc/sh/rcar/ssi.c:829:20: error: invalid storage class for functio=
n 'rsnd_ssi_interrupt'
     829 | static irqreturn_t rsnd_ssi_interrupt(int irq, void *data)
         |                    ^~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:838:13: error: invalid storage class for functio=
n 'rsnd_ssi_get_status'
     838 | static u32 *rsnd_ssi_get_status(struct rsnd_mod *mod,
         |             ^~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:876:13: error: invalid storage class for functio=
n 'rsnd_ssi_parent_attach'
     876 | static void rsnd_ssi_parent_attach(struct rsnd_mod *mod,
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sh/rcar/ssi.c:906:12: error: invalid storage class for functio=
n 'rsnd_ssi_pcm_new'
     906 | static int rsnd_ssi_pcm_new(struct rsnd_mod *mod,
         |            ^~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:920:12: error: invalid storage class for functio=
n 'rsnd_ssi_common_probe'
     920 | static int rsnd_ssi_common_probe(struct rsnd_mod *mod,
         |            ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:963:12: error: invalid storage class for functio=
n 'rsnd_ssi_common_remove'
     963 | static int rsnd_ssi_common_remove(struct rsnd_mod *mod,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:987:13: error: invalid storage class for functio=
n 'rsnd_ssi_pio_interrupt'
     987 | static bool rsnd_ssi_pio_interrupt(struct rsnd_mod *mod,
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sh/rcar/ssi.c:1030:12: error: invalid storage class for functi=
on 'rsnd_ssi_pio_init'
    1030 | static int rsnd_ssi_pio_init(struct rsnd_mod *mod,
         |            ^~~~~~~~~~~~~~~~~
>> sound/soc/sh/rcar/ssi.c:1048:12: error: invalid storage class for functi=
on 'rsnd_ssi_pio_pointer'
    1048 | static int rsnd_ssi_pio_pointer(struct rsnd_mod *mod,
         |            ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/sh/rcar/ssi.c:1060:12: error: invalid storage class for functi=
on 'rsnd_ssi_prepare'
    1060 | static int rsnd_ssi_prepare(struct rsnd_mod *mod,
         |            ^~~~~~~~~~~~~~~~
>> sound/soc/sh/rcar/ssi.c:1069:12: error: initializer element is not const=
ant
    1069 |  .probe  =3D rsnd_ssi_common_probe,
         |            ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1069:12: note: (near initialization for 'rsnd_ss=
i_pio_ops.probe')
   sound/soc/sh/rcar/ssi.c:1070:13: error: initializer element is not const=
ant
    1070 |  .remove  =3D rsnd_ssi_common_remove,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1070:13: note: (near initialization for 'rsnd_ss=
i_pio_ops.remove')
   sound/soc/sh/rcar/ssi.c:1071:11: error: initializer element is not const=
ant
    1071 |  .init  =3D rsnd_ssi_pio_init,
         |           ^~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1071:11: note: (near initialization for 'rsnd_ss=
i_pio_ops.init')
   sound/soc/sh/rcar/ssi.c:1073:12: error: initializer element is not const=
ant
    1073 |  .start  =3D rsnd_ssi_start,
         |            ^~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1073:12: note: (near initialization for 'rsnd_ss=
i_pio_ops.start')
   sound/soc/sh/rcar/ssi.c:1074:11: error: initializer element is not const=
ant
    1074 |  .stop  =3D rsnd_ssi_stop,
         |           ^~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1074:11: note: (near initialization for 'rsnd_ss=
i_pio_ops.stop')
   sound/soc/sh/rcar/ssi.c:1075:10: error: initializer element is not const=
ant
    1075 |  .irq  =3D rsnd_ssi_irq,
         |          ^~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1075:10: note: (near initialization for 'rsnd_ss=
i_pio_ops.irq')
   sound/soc/sh/rcar/ssi.c:1076:13: error: initializer element is not const=
ant
    1076 |  .pointer =3D rsnd_ssi_pio_pointer,
         |             ^~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1076:13: note: (near initialization for 'rsnd_ss=
i_pio_ops.pointer')
   sound/soc/sh/rcar/ssi.c:1077:13: error: initializer element is not const=
ant
    1077 |  .pcm_new =3D rsnd_ssi_pcm_new,
         |             ^~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1077:13: note: (near initialization for 'rsnd_ss=
i_pio_ops.pcm_new')
   sound/soc/sh/rcar/ssi.c:1078:15: error: initializer element is not const=
ant
    1078 |  .hw_params =3D rsnd_ssi_hw_params,
         |               ^~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1078:15: note: (near initialization for 'rsnd_ss=
i_pio_ops.hw_params')
   sound/soc/sh/rcar/ssi.c:1079:13: error: initializer element is not const=
ant
    1079 |  .prepare =3D rsnd_ssi_prepare,
         |             ^~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1079:13: note: (near initialization for 'rsnd_ss=
i_pio_ops.prepare')
   sound/soc/sh/rcar/ssi.c:1080:16: error: initializer element is not const=
ant
    1080 |  .get_status =3D rsnd_ssi_get_status,
         |                ^~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1080:16: note: (near initialization for 'rsnd_ss=
i_pio_ops.get_status')
>> sound/soc/sh/rcar/ssi.c:1083:12: error: invalid storage class for functi=
on 'rsnd_ssi_dma_probe'
    1083 | static int rsnd_ssi_dma_probe(struct rsnd_mod *mod,
         |            ^~~~~~~~~~~~~~~~~~
>> sound/soc/sh/rcar/ssi.c:1106:12: error: invalid storage class for functi=
on 'rsnd_ssi_fallback'
    1106 | static int rsnd_ssi_fallback(struct rsnd_mod *mod,
         |            ^~~~~~~~~~~~~~~~~
>> sound/soc/sh/rcar/ssi.c:1126:25: error: invalid storage class for functi=
on 'rsnd_ssi_dma_req'
    1126 | static struct dma_chan *rsnd_ssi_dma_req(struct rsnd_dai_stream =
*io,
         |                         ^~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1155:13: error: initializer element is not const=
ant
    1155 |  .dma_req =3D rsnd_ssi_dma_req,
         |             ^~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1155:13: note: (near initialization for 'rsnd_ss=
i_dma_ops.dma_req')
   sound/soc/sh/rcar/ssi.c:1156:12: error: initializer element is not const=
ant
    1156 |  .probe  =3D rsnd_ssi_dma_probe,
         |            ^~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1156:12: note: (near initialization for 'rsnd_ss=
i_dma_ops.probe')
   sound/soc/sh/rcar/ssi.c:1157:13: error: initializer element is not const=
ant
    1157 |  .remove  =3D rsnd_ssi_common_remove,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1157:13: note: (near initialization for 'rsnd_ss=
i_dma_ops.remove')
   sound/soc/sh/rcar/ssi.c:1160:12: error: initializer element is not const=
ant
    1160 |  .start  =3D rsnd_ssi_start,
         |            ^~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1160:12: note: (near initialization for 'rsnd_ss=
i_dma_ops.start')
   sound/soc/sh/rcar/ssi.c:1161:11: error: initializer element is not const=
ant
    1161 |  .stop  =3D rsnd_ssi_stop,
         |           ^~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1161:11: note: (near initialization for 'rsnd_ss=
i_dma_ops.stop')
   sound/soc/sh/rcar/ssi.c:1162:10: error: initializer element is not const=
ant
    1162 |  .irq  =3D rsnd_ssi_irq,
         |          ^~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1162:10: note: (near initialization for 'rsnd_ss=
i_dma_ops.irq')
   sound/soc/sh/rcar/ssi.c:1163:13: error: initializer element is not const=
ant
    1163 |  .pcm_new =3D rsnd_ssi_pcm_new,
         |             ^~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1163:13: note: (near initialization for 'rsnd_ss=
i_dma_ops.pcm_new')
   sound/soc/sh/rcar/ssi.c:1164:14: error: initializer element is not const=
ant
    1164 |  .fallback =3D rsnd_ssi_fallback,
         |              ^~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1164:14: note: (near initialization for 'rsnd_ss=
i_dma_ops.fallback')
   sound/soc/sh/rcar/ssi.c:1165:15: error: initializer element is not const=
ant
    1165 |  .hw_params =3D rsnd_ssi_hw_params,
         |               ^~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1165:15: note: (near initialization for 'rsnd_ss=
i_dma_ops.hw_params')
   sound/soc/sh/rcar/ssi.c:1166:13: error: initializer element is not const=
ant
    1166 |  .prepare =3D rsnd_ssi_prepare,
         |             ^~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1166:13: note: (near initialization for 'rsnd_ss=
i_dma_ops.prepare')
   sound/soc/sh/rcar/ssi.c:1167:16: error: initializer element is not const=
ant
    1167 |  .get_status =3D rsnd_ssi_get_status,
         |                ^~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1167:16: note: (near initialization for 'rsnd_ss=
i_dma_ops.get_status')
   sound/soc/sh/rcar/ssi.c:1170:12: error: invalid storage class for functi=
on 'rsnd_ssi_is_dma_mode'
    1170 | static int rsnd_ssi_is_dma_mode(struct rsnd_mod *mod)
         |            ^~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1178:13: error: invalid storage class for functi=
on 'rsnd_ssi_connect'
    1178 | static void rsnd_ssi_connect(struct rsnd_mod *mod,
         |             ^~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1337:1: error: expected declaration or statement=
 at end of input
    1337 | }
         | ^
   sound/soc/sh/rcar/ssi.c: At top level:
   sound/soc/sh/rcar/ssi.c:120:12: warning: 'rsnd_ssi_is_dma_mode' used but=
 never defined
     120 | static int rsnd_ssi_is_dma_mode(struct rsnd_mod *mod);
         |            ^~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1329:6: warning: 'rsnd_ssi_remove' defined but n=
ot used [-Wunused-function]
    1329 | void rsnd_ssi_remove(struct rsnd_priv *priv)
         |      ^~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1246:5: warning: 'rsnd_ssi_probe' defined but no=
t used [-Wunused-function]
    1246 | int rsnd_ssi_probe(struct rsnd_priv *priv)
         |     ^~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1238:5: warning: '__rsnd_ssi_is_pin_sharing' def=
ined but not used [-Wunused-function]
    1238 | int __rsnd_ssi_is_pin_sharing(struct rsnd_mod *mod)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1230:18: warning: 'rsnd_ssi_mod_get' defined but=
 not used [-Wunused-function]
    1230 | struct rsnd_mod *rsnd_ssi_mod_get(struct rsnd_priv *priv, int id)
         |                  ^~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1203:6: warning: 'rsnd_parse_connect_ssi' define=
d but not used [-Wunused-function]
    1203 | void rsnd_parse_connect_ssi(struct rsnd_dai *rdai,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:1170:12: warning: 'rsnd_ssi_is_dma_mode' defined=
 but not used [-Wunused-function]
    1170 | static int rsnd_ssi_is_dma_mode(struct rsnd_mod *mod)
         |            ^~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:987:13: warning: 'rsnd_ssi_pio_interrupt' define=
d but not used [-Wunused-function]
     987 | static bool rsnd_ssi_pio_interrupt(struct rsnd_mod *mod,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:528:12: warning: 'rsnd_ssi_quit' defined but not=
 used [-Wunused-function]
     528 | static int rsnd_ssi_quit(struct rsnd_mod *mod,
         |            ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/rsnd_ssi_hw_params +596 sound/soc/sh/rcar/ssi.c

ae5c322303fff5 Kuninori Morimoto  2013-07-21  595  =

919567d914b3c1 Kuninori Morimoto  2015-04-10 @596  static int rsnd_ssi_hw_p=
arams(struct rsnd_mod *mod,
2c0fac19de2cd7 Kuninori Morimoto  2015-06-15  597  			      struct rsnd_dai=
_stream *io,
919567d914b3c1 Kuninori Morimoto  2015-04-10  598  			      struct snd_pcm_=
substream *substream,
919567d914b3c1 Kuninori Morimoto  2015-04-10  599  			      struct snd_pcm_=
hw_params *params)
919567d914b3c1 Kuninori Morimoto  2015-04-10  600  {
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  601  	struct rsnd_dai *rdai =
=3D rsnd_io_to_rdai(io);
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  602  	unsigned int fmt_width =
=3D snd_pcm_format_width(params_format(params));
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  603  =

fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  604  	if (fmt_width > rdai->c=
han_width) {
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  605  		struct rsnd_priv *priv=
 =3D rsnd_io_to_priv(io);
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  606  		struct device *dev =3D=
 rsnd_priv_to_dev(priv);
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  607  =

fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  608  		dev_err(dev, "invalid =
combination of slot-width and format-data-width\n");
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  609  		return -EINVAL;
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  610  	}
919567d914b3c1 Kuninori Morimoto  2015-04-10  611  =

919567d914b3c1 Kuninori Morimoto  2015-04-10  612  	return 0;
919567d914b3c1 Kuninori Morimoto  2015-04-10  613  }
919567d914b3c1 Kuninori Morimoto  2015-04-10  614  =

6a25c8da00284f Kuninori Morimoto  2016-01-26 @615  static int rsnd_ssi_star=
t(struct rsnd_mod *mod,
2c0fac19de2cd7 Kuninori Morimoto  2015-06-15  616  			  struct rsnd_dai_str=
eam *io,
690602fcd85385 Kuninori Morimoto  2015-01-15  617  			  struct rsnd_priv *p=
riv)
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  618  {
597b046f0d99b0 Kuninori Morimoto  2017-08-08  619  	struct rsnd_ssi *ssi =
=3D rsnd_mod_to_ssi(mod);
597b046f0d99b0 Kuninori Morimoto  2017-08-08  620  =

fd9adcfdc1434f Kuninori Morimoto  2016-02-18  621  	if (!rsnd_ssi_is_run_mo=
ds(mod, io))
fd9adcfdc1434f Kuninori Morimoto  2016-02-18  622  		return 0;
fd9adcfdc1434f Kuninori Morimoto  2016-02-18  623  =

b4c83b17155781 Kuninori Morimoto  2015-12-17  624  	/*
b4c83b17155781 Kuninori Morimoto  2015-12-17  625  	 * EN will be set via S=
SIU :: SSI_CONTROL
b4c83b17155781 Kuninori Morimoto  2015-12-17  626  	 * if Multi channel mode
b4c83b17155781 Kuninori Morimoto  2015-12-17  627  	 */
4f5c634d58e719 Kuninori Morimoto  2016-02-18  628  	if (rsnd_ssi_multi_slav=
es_runtime(io))
0dc6bf75023a42 Kuninori Morimoto  2016-02-18  629  		return 0;
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  630  =

597b046f0d99b0 Kuninori Morimoto  2017-08-08  631  	/*
597b046f0d99b0 Kuninori Morimoto  2017-08-08  632  	 * EN is for data outpu=
t.
597b046f0d99b0 Kuninori Morimoto  2017-08-08  633  	 * SSI parent EN is not=
 needed.
597b046f0d99b0 Kuninori Morimoto  2017-08-08  634  	 */
0c258657ddfe81 Matthias Blankertz 2020-04-17  635  	if (rsnd_ssi_is_parent(=
mod, io))
597b046f0d99b0 Kuninori Morimoto  2017-08-08  636  		return 0;
597b046f0d99b0 Kuninori Morimoto  2017-08-08  637  =

597b046f0d99b0 Kuninori Morimoto  2017-08-08  638  	ssi->cr_en =3D EN;
597b046f0d99b0 Kuninori Morimoto  2017-08-08  639  =

597b046f0d99b0 Kuninori Morimoto  2017-08-08  640  	rsnd_mod_write(mod, SSI=
CR,	ssi->cr_own	|
597b046f0d99b0 Kuninori Morimoto  2017-08-08  641  					ssi->cr_clk	|
597b046f0d99b0 Kuninori Morimoto  2017-08-08  642  					ssi->cr_mode	|
597b046f0d99b0 Kuninori Morimoto  2017-08-08  643  					ssi->cr_en);
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  644  =

4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  645  	return 0;
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  646  }
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  647  =

6a25c8da00284f Kuninori Morimoto  2016-01-26  648  static int rsnd_ssi_stop=
(struct rsnd_mod *mod,
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  649  			 struct rsnd_dai_stre=
am *io,
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  650  			 struct rsnd_priv *pr=
iv)
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  651  {
6a25c8da00284f Kuninori Morimoto  2016-01-26  652  	struct rsnd_ssi *ssi =
=3D rsnd_mod_to_ssi(mod);
6a25c8da00284f Kuninori Morimoto  2016-01-26  653  	u32 cr;
6a25c8da00284f Kuninori Morimoto  2016-01-26  654  =

fd9adcfdc1434f Kuninori Morimoto  2016-02-18  655  	if (!rsnd_ssi_is_run_mo=
ds(mod, io))
fd9adcfdc1434f Kuninori Morimoto  2016-02-18  656  		return 0;
fd9adcfdc1434f Kuninori Morimoto  2016-02-18  657  =

0c258657ddfe81 Matthias Blankertz 2020-04-17  658  	if (rsnd_ssi_is_parent(=
mod, io))
6a25c8da00284f Kuninori Morimoto  2016-01-26  659  		return 0;
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  660  =

e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  661  	cr  =3D	ssi->cr_own	|
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  662  		ssi->cr_clk;
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  663  =

ce548931207c0d Kuninori Morimoto  2017-10-31  664  	/*
ce548931207c0d Kuninori Morimoto  2017-10-31  665  	 * disable all IRQ,
ce548931207c0d Kuninori Morimoto  2017-10-31  666  	 * Playback: Wait all d=
ata was sent
ce548931207c0d Kuninori Morimoto  2017-10-31  667  	 * Capture:  It might n=
ot receave data. Do nothing
ce548931207c0d Kuninori Morimoto  2017-10-31  668  	 */
ce548931207c0d Kuninori Morimoto  2017-10-31  669  	if (rsnd_io_is_play(io)=
) {
54cb6221688660 Matthias Blankertz 2020-04-17  670  		rsnd_mod_write(mod, SS=
ICR, cr | ssi->cr_en);
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  671  		rsnd_ssi_status_check(=
mod, DIRQ);
ce548931207c0d Kuninori Morimoto  2017-10-31  672  	}
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  673  =

54cb6221688660 Matthias Blankertz 2020-04-17  674  	/* In multi-SSI mode, s=
top is performed by setting ssi0129 in
54cb6221688660 Matthias Blankertz 2020-04-17  675  	 * SSI_CONTROL to 0 (in=
 rsnd_ssio_stop_gen2). Do nothing here.
54cb6221688660 Matthias Blankertz 2020-04-17  676  	 */
54cb6221688660 Matthias Blankertz 2020-04-17  677  	if (rsnd_ssi_multi_slav=
es_runtime(io))
54cb6221688660 Matthias Blankertz 2020-04-17  678  		return 0;
54cb6221688660 Matthias Blankertz 2020-04-17  679  =

e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  680  	/*
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  681  	 * disable SSI,
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  682  	 * and, wait idle state
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  683  	 */
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  684  	rsnd_mod_write(mod, SSI=
CR, cr);	/* disabled all */
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  685  	rsnd_ssi_status_check(m=
od, IIRQ);
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  686  =

597b046f0d99b0 Kuninori Morimoto  2017-08-08  687  	ssi->cr_en =3D 0;
597b046f0d99b0 Kuninori Morimoto  2017-08-08  688  =

e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  689  	return 0;
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  690  }
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  691  =

615fb6c7b13b7f Kuninori Morimoto  2016-02-18 @692  static int rsnd_ssi_irq(=
struct rsnd_mod *mod,
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  693  			struct rsnd_dai_strea=
m *io,
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  694  			struct rsnd_priv *pri=
v,
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  695  			int enable)
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  696  {
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  697  	u32 val =3D 0;
391d452251464b Yongbo Zhang       2020-05-08  698  	int is_tdm, is_tdm_spli=
t;
391d452251464b Yongbo Zhang       2020-05-08  699  	int id =3D rsnd_mod_id(=
mod);
391d452251464b Yongbo Zhang       2020-05-08  700  =

391d452251464b Yongbo Zhang       2020-05-08  701  	is_tdm		=3D rsnd_runtim=
e_is_tdm(io);
391d452251464b Yongbo Zhang       2020-05-08  702  	is_tdm_split	=3D rsnd_r=
untime_is_tdm_split(io);
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  703  =

615fb6c7b13b7f Kuninori Morimoto  2016-02-18  704  	if (rsnd_is_gen1(priv))
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  705  		return 0;
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  706  =

0c258657ddfe81 Matthias Blankertz 2020-04-17  707  	if (rsnd_ssi_is_parent(=
mod, io))
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  708  		return 0;
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  709  =

fd9adcfdc1434f Kuninori Morimoto  2016-02-18  710  	if (!rsnd_ssi_is_run_mo=
ds(mod, io))
fd9adcfdc1434f Kuninori Morimoto  2016-02-18  711  		return 0;
fd9adcfdc1434f Kuninori Morimoto  2016-02-18  712  =

615fb6c7b13b7f Kuninori Morimoto  2016-02-18  713  	if (enable)
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  714  		val =3D rsnd_ssi_is_dm=
a_mode(mod) ? 0x0e000000 : 0x0f000000;
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  715  =

391d452251464b Yongbo Zhang       2020-05-08  716  	if (is_tdm || is_tdm_sp=
lit) {
391d452251464b Yongbo Zhang       2020-05-08  717  		switch (id) {
391d452251464b Yongbo Zhang       2020-05-08  718  		case 0:
391d452251464b Yongbo Zhang       2020-05-08  719  		case 1:
391d452251464b Yongbo Zhang       2020-05-08  720  		case 2:
391d452251464b Yongbo Zhang       2020-05-08  721  		case 3:
391d452251464b Yongbo Zhang       2020-05-08  722  		case 4:
391d452251464b Yongbo Zhang       2020-05-08  723  		case 9:
391d452251464b Yongbo Zhang       2020-05-08  724  			val |=3D 0xff00;
391d452251464b Yongbo Zhang       2020-05-08  725  			break;
391d452251464b Yongbo Zhang       2020-05-08  726  		}
391d452251464b Yongbo Zhang       2020-05-08  727  	}
391d452251464b Yongbo Zhang       2020-05-08  728  =

615fb6c7b13b7f Kuninori Morimoto  2016-02-18  729  	rsnd_mod_write(mod, SSI=
_INT_ENABLE, val);
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  730  =

615fb6c7b13b7f Kuninori Morimoto  2016-02-18  731  	return 0;
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  732  }
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  733  =

d8d9b9730cd62c Kuninori Morimoto  2017-12-11 @734  static bool rsnd_ssi_pio=
_interrupt(struct rsnd_mod *mod,
d8d9b9730cd62c Kuninori Morimoto  2017-12-11  735  				   struct rsnd_dai_s=
tream *io);
bfc0cfe6b7acb1 Kuninori Morimoto  2015-06-15  736  static void __rsnd_ssi_i=
nterrupt(struct rsnd_mod *mod,
bfc0cfe6b7acb1 Kuninori Morimoto  2015-06-15  737  				 struct rsnd_dai_str=
eam *io)
ae5c322303fff5 Kuninori Morimoto  2013-07-21  738  {
690602fcd85385 Kuninori Morimoto  2015-01-15  739  	struct rsnd_priv *priv =
=3D rsnd_mod_to_priv(mod);
2b62786951ca38 Kuninori Morimoto  2018-02-13  740  	struct device *dev =3D =
rsnd_priv_to_dev(priv);
765ae7c8dda7d0 Kuninori Morimoto  2015-01-15  741  	int is_dma =3D rsnd_ssi=
_is_dma_mode(mod);
02299d9875bab5 Kuninori Morimoto  2015-05-21  742  	u32 status;
75defee0f1b3fc Kuninori Morimoto  2015-06-15  743  	bool elapsed =3D false;
6a25c8da00284f Kuninori Morimoto  2016-01-26  744  	bool stop =3D false;
391d452251464b Yongbo Zhang       2020-05-08  745  	int is_tdm, is_tdm_spli=
t;
391d452251464b Yongbo Zhang       2020-05-08  746  =

391d452251464b Yongbo Zhang       2020-05-08  747  	is_tdm		=3D rsnd_runtim=
e_is_tdm(io);
391d452251464b Yongbo Zhang       2020-05-08  748  	is_tdm_split	=3D rsnd_r=
untime_is_tdm_split(io);
02299d9875bab5 Kuninori Morimoto  2015-05-21  749  =

02299d9875bab5 Kuninori Morimoto  2015-05-21  750  	spin_lock(&priv->lock);
ae5c322303fff5 Kuninori Morimoto  2013-07-21  751  =

02299d9875bab5 Kuninori Morimoto  2015-05-21  752  	/* ignore all cases if =
not working */
d5bbe7de563ccc Kuninori Morimoto  2015-06-15  753  	if (!rsnd_io_is_working=
(io))
02299d9875bab5 Kuninori Morimoto  2015-05-21  754  		goto rsnd_ssi_interrup=
t_out;
02299d9875bab5 Kuninori Morimoto  2015-05-21  755  =

6a25c8da00284f Kuninori Morimoto  2016-01-26  756  	status =3D rsnd_ssi_sta=
tus_get(mod);
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  757  =

4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  758  	/* PIO only */
d8d9b9730cd62c Kuninori Morimoto  2017-12-11  759  	if (!is_dma && (status =
& DIRQ))
d8d9b9730cd62c Kuninori Morimoto  2017-12-11  760  		elapsed =3D rsnd_ssi_p=
io_interrupt(mod, io);
ae5c322303fff5 Kuninori Morimoto  2013-07-21  761  =

12927a8f802642 Kuninori Morimoto  2015-06-15  762  	/* DMA only */
2b62786951ca38 Kuninori Morimoto  2018-02-13  763  	if (is_dma && (status &=
 (UIRQ | OIRQ))) {
c0ea089dbad47a Kuninori Morimoto  2018-10-30  764  		rsnd_dbg_irq_status(de=
v, "%s err status : 0x%08x\n",
c0ea089dbad47a Kuninori Morimoto  2018-10-30  765  			rsnd_mod_name(mod), s=
tatus);
2b62786951ca38 Kuninori Morimoto  2018-02-13  766  =

6a25c8da00284f Kuninori Morimoto  2016-01-26  767  		stop =3D true;
2b62786951ca38 Kuninori Morimoto  2018-02-13  768  	}
69e32a58bde674 Kuninori Morimoto  2015-10-26  769  =

391d452251464b Yongbo Zhang       2020-05-08  770  	status =3D 0;
391d452251464b Yongbo Zhang       2020-05-08  771  =

391d452251464b Yongbo Zhang       2020-05-08  772  	if (is_tdm || is_tdm_sp=
lit) {
391d452251464b Yongbo Zhang       2020-05-08  773  		switch (id) {
391d452251464b Yongbo Zhang       2020-05-08  774  		case 0:
391d452251464b Yongbo Zhang       2020-05-08  775  		case 1:
391d452251464b Yongbo Zhang       2020-05-08  776  		case 2:
391d452251464b Yongbo Zhang       2020-05-08  777  		case 3:
391d452251464b Yongbo Zhang       2020-05-08  778  		case 4:
391d452251464b Yongbo Zhang       2020-05-08  779  			for (i =3D 0; i < 4; =
i++) {
391d452251464b Yongbo Zhang       2020-05-08  780  				status =3D rsnd_mod_=
read(mod,
391d452251464b Yongbo Zhang       2020-05-08  781  						       SSI_SYS_STA=
TUS(i * 2));
391d452251464b Yongbo Zhang       2020-05-08  782  				status &=3D 0xf << (=
id * 4);
391d452251464b Yongbo Zhang       2020-05-08  783  =

391d452251464b Yongbo Zhang       2020-05-08  784  				if (status) {
391d452251464b Yongbo Zhang       2020-05-08  785  					rsnd_dbg_irq_status=
(dev,
391d452251464b Yongbo Zhang       2020-05-08  786  						"%s err status : 0=
x%08x\n",
391d452251464b Yongbo Zhang       2020-05-08  787  						rsnd_mod_name(mod)=
, status);
391d452251464b Yongbo Zhang       2020-05-08  788  					rsnd_mod_write(mod,
391d452251464b Yongbo Zhang       2020-05-08  789  						       SSI_SYS_STA=
TUS(i * 2),
391d452251464b Yongbo Zhang       2020-05-08  790  						       0xf << (id =
* 4));
391d452251464b Yongbo Zhang       2020-05-08  791  					stop =3D true;
391d452251464b Yongbo Zhang       2020-05-08  792  					break;
391d452251464b Yongbo Zhang       2020-05-08  793  				}
391d452251464b Yongbo Zhang       2020-05-08  794  			}
391d452251464b Yongbo Zhang       2020-05-08  795  			break;
391d452251464b Yongbo Zhang       2020-05-08  796  		case 9:
391d452251464b Yongbo Zhang       2020-05-08  797  			for (i =3D 0; i < 4; =
i++) {
391d452251464b Yongbo Zhang       2020-05-08  798  				status =3D rsnd_mod_=
write(mod,
391d452251464b Yongbo Zhang       2020-05-08  799  						SSI_SYS_STATUS((i =
* 2) + 1));
391d452251464b Yongbo Zhang       2020-05-08  800  				status &=3D 0xf << 4;
391d452251464b Yongbo Zhang       2020-05-08  801  =

391d452251464b Yongbo Zhang       2020-05-08  802  				if (status) {
391d452251464b Yongbo Zhang       2020-05-08  803  					rsnd_dbg_irq_status=
(dev,
391d452251464b Yongbo Zhang       2020-05-08  804  						"%s err status : 0=
x%08x\n",
391d452251464b Yongbo Zhang       2020-05-08  805  						rsnd_mod_name(mod)=
, status);
391d452251464b Yongbo Zhang       2020-05-08  806  					rsnd_mod_write(mod,
391d452251464b Yongbo Zhang       2020-05-08  807  						SSI_SYS_STATUS((i =
* 2) + 1),
391d452251464b Yongbo Zhang       2020-05-08  808  						0xf << 4);
391d452251464b Yongbo Zhang       2020-05-08  809  					stop =3D true;
391d452251464b Yongbo Zhang       2020-05-08  810  					break;
391d452251464b Yongbo Zhang       2020-05-08  811  				}
391d452251464b Yongbo Zhang       2020-05-08  812  			}
391d452251464b Yongbo Zhang       2020-05-08  813  			break;
391d452251464b Yongbo Zhang       2020-05-08  814  		}
391d452251464b Yongbo Zhang       2020-05-08  815  	}
391d452251464b Yongbo Zhang       2020-05-08  816  =

5342dff2326393 Kuninori Morimoto  2015-11-26  817  	rsnd_ssi_status_clear(m=
od);
02299d9875bab5 Kuninori Morimoto  2015-05-21  818  rsnd_ssi_interrupt_out:
02299d9875bab5 Kuninori Morimoto  2015-05-21  819  	spin_unlock(&priv->lock=
);
02299d9875bab5 Kuninori Morimoto  2015-05-21  820  =

75defee0f1b3fc Kuninori Morimoto  2015-06-15  821  	if (elapsed)
75defee0f1b3fc Kuninori Morimoto  2015-06-15  822  		rsnd_dai_period_elapse=
d(io);
6a25c8da00284f Kuninori Morimoto  2016-01-26  823  =

6a25c8da00284f Kuninori Morimoto  2016-01-26  824  	if (stop)
6a25c8da00284f Kuninori Morimoto  2016-01-26  825  		snd_pcm_stop_xrun(io->=
substream);
6a25c8da00284f Kuninori Morimoto  2016-01-26  826  =


:::::: The code at line 596 was first introduced by commit
:::::: 919567d914b3c134e60c01db72a03a0adc5f41b9 ASoC: rsnd: make sure SSI p=
arent/child uses same number of sound channel.

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3898905348832382062==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3898905348832382062==--


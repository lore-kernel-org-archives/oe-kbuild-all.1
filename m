Content-Type: multipart/mixed; boundary="===============2599213553971492842=="
MIME-Version: 1.0
From: Nathan Chancellor <nathan@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [broonie-misc:asoc-5.14 5/23] sound/soc/qcom/qdsp6/q6afe.c:1213:18: warning: variable 'port_id' is uninitialized when used here
Date: Tue, 11 May 2021 11:23:27 -0700
Message-ID: <ae8f5ec6-889b-8b42-fc05-96021af5918d@kernel.org>
In-Reply-To: <202105120137.4D1sa7ck-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2599213553971492842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/11/2021 10:59 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git =
asoc-5.14
> head:   ae062a711aa2485fc4f6fe48cdb7229c849f2568
> commit: 5f1b95d08de712327e452d082a50fded435ec884 [5/23] ASoC: q6dsp: q6af=
e: remove unneeded dead-store initialization

Mark, if it is not too late, please drop this commit. Nick pointed out =

on the review of this commit that commit 12900bacb4f3 ("ASoC: qcom: =

q6afe: remove useless assignments") in your tree already resolved this:

https://lore.kernel.org/r/CAKwvOdkXxyyLSTAaMsyeJ3jxCeAGY=3D9DxLZNX4DcvF=3Df=
mkx7mg(a)mail.gmail.com/

Having both commits in the tree causes port_id to be uninitialized. If =

it is too late, I can send a revert.

Cheers,
Nathan

> config: x86_64-randconfig-r006-20210511 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a0fe=
d635fe1701470062495a6ffee1c608f3f1bc)
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install x86_64 cross compiling tool for clang build
>          # apt-get install binutils-x86-64-linux-gnu
>          # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.g=
it/commit/?id=3D5f1b95d08de712327e452d082a50fded435ec884
>          git remote add broonie-misc https://git.kernel.org/pub/scm/linux=
/kernel/git/broonie/misc.git
>          git fetch --no-tags broonie-misc asoc-5.14
>          git checkout 5f1b95d08de712327e452d082a50fded435ec884
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 ARCH=3Dx86_64
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>>> sound/soc/qcom/qdsp6/q6afe.c:1213:18: warning: variable 'port_id' is un=
initialized when used here [-Wuninitialized]
>             stop->port_id =3D port_id;
>                             ^~~~~~~
>     sound/soc/qcom/qdsp6/q6afe.c:1186:13: note: initialize the variable '=
port_id' to silence this warning
>             int port_id;
>                        ^
>                         =3D 0
>     1 warning generated.
> =

> =

> vim +/port_id +1213 sound/soc/qcom/qdsp6/q6afe.c
> =

> a4ae3af59bd585 Srinivas Kandagatla 2018-05-18  1173
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1174  /**
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1175   * q6afe_port_stop()=
 - Stop a afe port
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1176   *
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1177   * @port: Instance o=
f port to stop
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1178   *
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1179   * Return: Will be a=
n negative on packet size on success.
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1180   */
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1181  int q6afe_port_stop(=
struct q6afe_port *port)
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1182  {
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1183  	struct afe_port_cmd=
_device_stop *stop;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1184  	struct q6afe *afe =
=3D port->afe;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1185  	struct apr_pkt *pkt;
> 5f1b95d08de712 Yang Li             2021-04-25  1186  	int port_id;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1187  	int ret =3D 0;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1188  	int index, pkt_size;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1189  	void *p;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1190
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1191  	index =3D port->tok=
en;
> c54c1c5ee8e73b Dan Carpenter       2018-06-27  1192  	if (index < 0 || in=
dex >=3D AFE_PORT_MAX) {
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1193  		dev_err(afe->dev, =
"AFE port index[%d] invalid!\n", index);
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1194  		return -EINVAL;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1195  	}
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1196
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1197  	pkt_size =3D APR_HD=
R_SIZE + sizeof(*stop);
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1198  	p =3D kzalloc(pkt_s=
ize, GFP_KERNEL);
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1199  	if (!p)
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1200  		return -ENOMEM;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1201
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1202  	pkt =3D p;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1203  	stop =3D p + APR_HD=
R_SIZE;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1204
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1205  	pkt->hdr.hdr_field =
=3D APR_HDR_FIELD(APR_MSG_TYPE_SEQ_CMD,
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1206  					   APR_HDR_LEN(=
APR_HDR_SIZE),
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1207  					   APR_PKT_VER);
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1208  	pkt->hdr.pkt_size =
=3D pkt_size;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1209  	pkt->hdr.src_port =
=3D 0;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1210  	pkt->hdr.dest_port =
=3D 0;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1211  	pkt->hdr.token =3D =
index;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1212  	pkt->hdr.opcode =3D=
 AFE_PORT_CMD_DEVICE_STOP;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18 @1213  	stop->port_id =3D p=
ort_id;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1214  	stop->reserved =3D =
0;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1215
> 342a4f8ca12b1c Srinivas Kandagatla 2020-09-10  1216  	ret =3D afe_apr_sen=
d_pkt(afe, pkt, port, AFE_PORT_CMD_DEVICE_STOP);
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1217  	if (ret)
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1218  		dev_err(afe->dev, =
"AFE close failed %d\n", ret);
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1219
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1220  	kfree(pkt);
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1221  	return ret;
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1222  }
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1223  EXPORT_SYMBOL_GPL(q6=
afe_port_stop);
> 7fa2d70f976657 Srinivas Kandagatla 2018-05-18  1224
> =

> :::::: The code at line 1213 was first introduced by commit
> :::::: 7fa2d70f976657111a5ea4f3d16a738ddaa10c4f ASoC: qdsp6: q6afe: Add q=
6afe driver
> =

> :::::: TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> :::::: CC: Mark Brown <broonie@kernel.org>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20
--===============2599213553971492842==--


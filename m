Content-Type: multipart/mixed; boundary="===============7605723323106553643=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC, WIP, v5 04/10] media: vidtv: add a bridge driver
Date: Sat, 16 May 2020 08:12:50 +0800
Message-ID: <202005160800.H0IJCLmJ%lkp@intel.com>
In-Reply-To: <20200515214815.15514-5-dwlsalmeida@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7605723323106553643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi "Daniel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on next-20200515]
[cannot apply to v5.7-rc5]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Daniel-W-S-Almeida/media-v=
idtv-implement-a-virtual-DVB-driver/20200516-055059
base:   git://linuxtv.org/media_tree.git master
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/media/test-drivers/vidtv/vidtv_bridg.c:199:42: sparse: sparse: U=
sing plain integer as NULL pointer
   drivers/media/test-drivers/vidtv/vidtv_bridg.c:218:42: sparse: sparse: U=
sing plain integer as NULL pointer

vim +199 drivers/media/test-drivers/vidtv/vidtv_bridg.c

   196	=

   197	static void vidtv_bridge_probe_demod(struct vidtv_dvb *dvb, u32 n)
   198	{
 > 199		struct vidtv_demod_config cfg =3D {0};
   200		struct dvb_frontend *fe       =3D NULL;
   201	=

   202		cfg.frontend =3D &fe;
   203		cfg.drop_tslock_prob_on_low_snr     =3D drop_tslock_prob_on_low_snr;
   204		cfg.recover_tslock_prob_on_good_snr =3D recover_tslock_prob_on_good=
_snr;
   205	=

   206		dvb->i2c_client_demod[n] =3D dvb_module_probe("vidtv_demod",
   207							    NULL,
   208							    dvb->i2c_adapter,
   209							    DEMOD_DEFAULT_ADDR,
   210							    &cfg);
   211	=

   212		/* retrieve a pointer to struct dvb_frontend */
   213		dvb->fe[n] =3D *cfg.frontend;
   214	}
   215	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7605723323106553643==--


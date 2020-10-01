Content-Type: multipart/mixed; boundary="===============6273819040828676024=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] iio: adc: ad7887: invert/rework external ref logic
Date: Fri, 02 Oct 2020 06:46:18 +0800
Message-ID: <202010020651.AJIzQmxM-lkp@intel.com>
In-Reply-To: <20201001141143.925-1-alexandru.ardelean@analog.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6273819040828676024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexandru,

I love your patch! Yet something to improve:

[auto build test ERROR on iio/togreg]
[also build test ERROR on linux/master linus/master v5.9-rc7 next-20201001]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexandru-Ardelean/iio-adc=
-ad7887-invert-rework-external-ref-logic/20201001-220829
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
config: c6x-randconfig-r034-20200930 (attached as .config)
compiler: c6x-elf-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/98dbf5fa747aac2e245826d8c=
6cd34b087aeaa27
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alexandru-Ardelean/iio-adc-ad7887-=
invert-rework-external-ref-logic/20201001-220829
        git checkout 98dbf5fa747aac2e245826d8c6cd34b087aeaa27
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dc6x =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/iio/adc/ad7887.c: In function 'ad7887_probe':
>> drivers/iio/adc/ad7887.c:276:22: error: 'struct ad7887_platform_data' ha=
s no member named 'use_onchip_ref'
     276 |  if (!pdata || !pdata->use_onchip_ref)
         |                      ^~

vim +276 drivers/iio/adc/ad7887.c

6fe8135fccd66ae drivers/staging/iio/adc/ad7887_core.c Jonathan Cameron   20=
11-05-18  234  =

fc52692c49969ec drivers/iio/adc/ad7887.c              Greg Kroah-Hartman 20=
12-12-21  235  static int ad7887_probe(struct spi_device *spi)
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  236  {
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  237  	struct ad7887_platform_data *pdata =3D spi->dev.platform_da=
ta;
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  238  	struct ad7887_state *st;
82429e0d33ece55 drivers/iio/adc/ad7887.c              Sachin Kamat       20=
13-07-23  239  	struct iio_dev *indio_dev;
fce7c3eac7d4ca7 drivers/staging/iio/adc/ad7887.c      Lars-Peter Clausen 20=
12-11-05  240  	uint8_t mode;
bf5d2613c9083b8 drivers/staging/iio/adc/ad7887_core.c Lars-Peter Clausen 20=
12-11-05  241  	int ret;
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  242  =

82429e0d33ece55 drivers/iio/adc/ad7887.c              Sachin Kamat       20=
13-07-23  243  	indio_dev =3D devm_iio_device_alloc(&spi->dev, sizeof(*st));
f39e086adcbdb95 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
11-05-18  244  	if (indio_dev =3D=3D NULL)
f39e086adcbdb95 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
11-05-18  245  		return -ENOMEM;
f39e086adcbdb95 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
11-05-18  246  =

f39e086adcbdb95 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
11-05-18  247  	st =3D iio_priv(indio_dev);
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  248  =

98dbf5fa747aac2 drivers/iio/adc/ad7887.c              Alexandru Ardelean 20=
20-10-01  249  	st->reg =3D devm_regulator_get_optional(&spi->dev, "vref");
98dbf5fa747aac2 drivers/iio/adc/ad7887.c              Alexandru Ardelean 20=
20-10-01  250  	if (IS_ERR(st->reg)) {
98dbf5fa747aac2 drivers/iio/adc/ad7887.c              Alexandru Ardelean 20=
20-10-01  251  		if (PTR_ERR(st->reg) !=3D -ENODEV)
82429e0d33ece55 drivers/iio/adc/ad7887.c              Sachin Kamat       20=
13-07-23  252  			return PTR_ERR(st->reg);
bf5d2613c9083b8 drivers/staging/iio/adc/ad7887_core.c Lars-Peter Clausen 20=
12-11-05  253  =

98dbf5fa747aac2 drivers/iio/adc/ad7887.c              Alexandru Ardelean 20=
20-10-01  254  		st->reg =3D NULL;
98dbf5fa747aac2 drivers/iio/adc/ad7887.c              Alexandru Ardelean 20=
20-10-01  255  	}
98dbf5fa747aac2 drivers/iio/adc/ad7887.c              Alexandru Ardelean 20=
20-10-01  256  =

98dbf5fa747aac2 drivers/iio/adc/ad7887.c              Alexandru Ardelean 20=
20-10-01  257  	if (st->reg) {
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  258  		ret =3D regulator_enable(st->reg);
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  259  		if (ret)
82429e0d33ece55 drivers/iio/adc/ad7887.c              Sachin Kamat       20=
13-07-23  260  			return ret;
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  261  	}
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  262  =

2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  263  	st->chip_info =3D
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  264  		&ad7887_chip_info_tbl[spi_get_device_id(spi)->driver_data];
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  265  =

f39e086adcbdb95 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
11-05-18  266  	spi_set_drvdata(spi, indio_dev);
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  267  	st->spi =3D spi;
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  268  =

f39e086adcbdb95 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
11-05-18  269  	indio_dev->name =3D spi_get_device_id(spi)->name;
6fe8135fccd66ae drivers/staging/iio/adc/ad7887_core.c Jonathan Cameron   20=
11-05-18  270  	indio_dev->info =3D &ad7887_info;
f39e086adcbdb95 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
11-05-18  271  	indio_dev->modes =3D INDIO_DIRECT_MODE;
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  272  =

2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  273  	/* Setup default message */
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  274  =

fce7c3eac7d4ca7 drivers/staging/iio/adc/ad7887.c      Lars-Peter Clausen 20=
12-11-05  275  	mode =3D AD7887_PM_MODE4;
fce7c3eac7d4ca7 drivers/staging/iio/adc/ad7887.c      Lars-Peter Clausen 20=
12-11-05 @276  	if (!pdata || !pdata->use_onchip_ref)
fce7c3eac7d4ca7 drivers/staging/iio/adc/ad7887.c      Lars-Peter Clausen 20=
12-11-05  277  		mode |=3D AD7887_REF_DIS;
fce7c3eac7d4ca7 drivers/staging/iio/adc/ad7887.c      Lars-Peter Clausen 20=
12-11-05  278  	if (pdata && pdata->en_dual)
fce7c3eac7d4ca7 drivers/staging/iio/adc/ad7887.c      Lars-Peter Clausen 20=
12-11-05  279  		mode |=3D AD7887_DUAL;
fce7c3eac7d4ca7 drivers/staging/iio/adc/ad7887.c      Lars-Peter Clausen 20=
12-11-05  280  =

fce7c3eac7d4ca7 drivers/staging/iio/adc/ad7887.c      Lars-Peter Clausen 20=
12-11-05  281  	st->tx_cmd_buf[0] =3D AD7887_CH_AIN0 | mode;
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  282  =

2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  283  	st->xfer[0].rx_buf =3D &st->data[0];
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  284  	st->xfer[0].tx_buf =3D &st->tx_cmd_buf[0];
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  285  	st->xfer[0].len =3D 2;
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  286  =

2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  287  	spi_message_init(&st->msg[AD7887_CH0]);
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  288  	spi_message_add_tail(&st->xfer[0], &st->msg[AD7887_CH0]);
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  289  =

2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  290  	if (pdata && pdata->en_dual) {
fce7c3eac7d4ca7 drivers/staging/iio/adc/ad7887.c      Lars-Peter Clausen 20=
12-11-05  291  		st->tx_cmd_buf[2] =3D AD7887_CH_AIN1 | mode;
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  292  =

2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  293  		st->xfer[1].rx_buf =3D &st->data[0];
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  294  		st->xfer[1].tx_buf =3D &st->tx_cmd_buf[2];
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  295  		st->xfer[1].len =3D 2;
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  296  =

2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  297  		st->xfer[2].rx_buf =3D &st->data[2];
fce7c3eac7d4ca7 drivers/staging/iio/adc/ad7887.c      Lars-Peter Clausen 20=
12-11-05  298  		st->xfer[2].tx_buf =3D &st->tx_cmd_buf[0];
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  299  		st->xfer[2].len =3D 2;
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  300  =

2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  301  		spi_message_init(&st->msg[AD7887_CH0_CH1]);
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  302  		spi_message_add_tail(&st->xfer[1], &st->msg[AD7887_CH0_CH1=
]);
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  303  		spi_message_add_tail(&st->xfer[2], &st->msg[AD7887_CH0_CH1=
]);
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  304  =

fce7c3eac7d4ca7 drivers/staging/iio/adc/ad7887.c      Lars-Peter Clausen 20=
12-11-05  305  		st->xfer[3].rx_buf =3D &st->data[2];
fce7c3eac7d4ca7 drivers/staging/iio/adc/ad7887.c      Lars-Peter Clausen 20=
12-11-05  306  		st->xfer[3].tx_buf =3D &st->tx_cmd_buf[2];
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  307  		st->xfer[3].len =3D 2;
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  308  =

2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  309  		spi_message_init(&st->msg[AD7887_CH1]);
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  310  		spi_message_add_tail(&st->xfer[3], &st->msg[AD7887_CH1]);
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  311  =

b0ec7a44393e0d7 drivers/iio/adc/ad7887.c              Beniamin Bia       20=
19-11-25  312  		indio_dev->channels =3D st->chip_info->dual_channels;
b0ec7a44393e0d7 drivers/iio/adc/ad7887.c              Beniamin Bia       20=
19-11-25  313  		indio_dev->num_channels =3D st->chip_info->num_dual_channe=
ls;
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  314  	} else {
b0ec7a44393e0d7 drivers/iio/adc/ad7887.c              Beniamin Bia       20=
19-11-25  315  		indio_dev->channels =3D st->chip_info->channels;
b0ec7a44393e0d7 drivers/iio/adc/ad7887.c              Beniamin Bia       20=
19-11-25  316  		indio_dev->num_channels =3D st->chip_info->num_channels;
596d06097f7843e drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
11-05-18  317  	}
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  318  =

65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c      Lars-Peter Clausen 20=
12-11-05  319  	ret =3D iio_triggered_buffer_setup(indio_dev, &iio_pollfunc=
_store_time,
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c      Lars-Peter Clausen 20=
12-11-05  320  			&ad7887_trigger_handler, &ad7887_ring_setup_ops);
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  321  	if (ret)
f39e086adcbdb95 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
11-05-18  322  		goto error_disable_reg;
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  323  =

26d25ae3f0d8ffe drivers/staging/iio/adc/ad7887_core.c Jonathan Cameron   20=
11-09-02  324  	ret =3D iio_device_register(indio_dev);
26d25ae3f0d8ffe drivers/staging/iio/adc/ad7887_core.c Jonathan Cameron   20=
11-09-02  325  	if (ret)
26d25ae3f0d8ffe drivers/staging/iio/adc/ad7887_core.c Jonathan Cameron   20=
11-09-02  326  		goto error_unregister_ring;
26d25ae3f0d8ffe drivers/staging/iio/adc/ad7887_core.c Jonathan Cameron   20=
11-09-02  327  =

26d25ae3f0d8ffe drivers/staging/iio/adc/ad7887_core.c Jonathan Cameron   20=
11-09-02  328  	return 0;
26d25ae3f0d8ffe drivers/staging/iio/adc/ad7887_core.c Jonathan Cameron   20=
11-09-02  329  error_unregister_ring:
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c      Lars-Peter Clausen 20=
12-11-05  330  	iio_triggered_buffer_cleanup(indio_dev);
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  331  error_disable_reg:
bf5d2613c9083b8 drivers/staging/iio/adc/ad7887_core.c Lars-Peter Clausen 20=
12-11-05  332  	if (st->reg)
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  333  		regulator_disable(st->reg);
f39e086adcbdb95 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
11-05-18  334  =

2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  335  	return ret;
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  336  }
2b4756aa36909a9 drivers/staging/iio/adc/ad7887_core.c Michael Hennerich  20=
10-11-22  337  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6273819040828676024==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6273819040828676024==--


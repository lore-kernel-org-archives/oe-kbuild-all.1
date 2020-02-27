Content-Type: multipart/mixed; boundary="===============5790048659233353227=="
MIME-Version: 1.0
From: Ardelean, Alexandru <alexandru.Ardelean@analog.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 4/7] iio: adc: adi-axi-adc: add support for AXI ADC IP core
Date: Thu, 27 Feb 2020 07:01:54 +0000
Message-ID: <f2709033d98c34a92631d767fa116951a1390df1.camel@analog.com>
In-Reply-To: <202002270620.mqsOhj9F%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5790048659233353227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-02-27 at 07:02 +0800, kbuild test robot wrote:
> [External]
> =

> Hi Alexandru,
> =

> I love your patch! Perhaps something to improve:
> =

> [auto build test WARNING on iio/togreg]
> [also build test WARNING on linus/master v5.6-rc3 next-20200226]
> [cannot apply to linux/master]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982
> ]
> =

> url:    =

> https://github.com/0day-ci/linux/commits/Alexandru-Ardelean/iio-adi-axi-a=
dc-ad9647-Add-support-for-AD9467-ADC/20200227-030546
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git tog=
reg
> config: riscv-allyesconfig (attached as .config)
> compiler: riscv64-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget =

> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross =
-O
> ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Driscv =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    drivers/iio/buffer/industrialio-buffer-dmaengine.c: In function
> 'iio_dmaengine_buffer_get_length_align':
> > > drivers/iio/buffer/industrialio-buffer-dmaengine.c:137:24: warning: f=
ormat
> > > '%u' expects argument of type 'unsigned int', but argument 3 has type
> > > 'size_t {aka long unsigned int}' [-Wformat=3D]
>      return sprintf(buf, "%u\n", dmaengine_buffer->align);
>                           ~^     ~~~~~~~~~~~~~~~~~~~~~~~
>                           %lu

Though the warning may be valid, I am bit puzzled as to why it's complainin=
g for
this patch specifically.
This patch does not touch the file directly.

I'll send a fix for this.

> =

> vim +137 drivers/iio/buffer/industrialio-buffer-dmaengine.c
> =

> 2d6ca60f328450 Lars-Peter Clausen 2015-10-13  129  =

> 4538c185680996 Lars-Peter Clausen 2019-12-11  130  static ssize_t
> iio_dmaengine_buffer_get_length_align(struct device *dev,
> 4538c185680996 Lars-Peter Clausen 2019-12-11  131  	struct device_attribu=
te
> *attr, char *buf)
> 4538c185680996 Lars-Peter Clausen 2019-12-11  132  {
> 4538c185680996 Lars-Peter Clausen 2019-12-11  133  	struct iio_dev
> *indio_dev =3D dev_to_iio_dev(dev);
> 4538c185680996 Lars-Peter Clausen 2019-12-11  134  	struct dmaengine_buff=
er
> *dmaengine_buffer =3D
> 4538c185680996 Lars-Peter Clausen 2019-12-11  135  		iio_buffer_to_dm
> aengine_buffer(indio_dev->buffer);
> 4538c185680996 Lars-Peter Clausen 2019-12-11  136  =

> 4538c185680996 Lars-Peter Clausen 2019-12-11 @137  	return sprintf(buf,
> "%u\n", dmaengine_buffer->align);
> 4538c185680996 Lars-Peter Clausen 2019-12-11  138  }
> 4538c185680996 Lars-Peter Clausen 2019-12-11  139  =

> =

> :::::: The code at line 137 was first introduced by commit
> :::::: 4538c185680996d7328beac629dbdb7dd3f8f34e iio: buffer-dmaengine: Re=
port
> buffer length requirements
> =

> :::::: TO: Lars-Peter Clausen <lars@metafoo.de>
> :::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5790048659233353227==--


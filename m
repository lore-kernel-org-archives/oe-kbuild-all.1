Content-Type: multipart/mixed; boundary="===============3399056904114558744=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 22/89] clk: bcm: rpi: Discover the firmware clocks
Date: Tue, 25 Feb 2020 04:24:16 +0800
Message-ID: <202002250442.Rqp31Tng%lkp@intel.com>
In-Reply-To: <d197ab836d84b89b94ff1927872126767d921e94.1582533919.git-series.maxime@cerno.tech>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3399056904114558744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next anholt/for-next v5.6-rc3 next-202=
00224]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Maxime-Ripard/drm-vc4-Supp=
ort-BCM2711-Display-Pipeline/20200224-172730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/clk/bcm/clk-raspberrypi.c:365:56: sparse: sparse: incorrect type=
 in argument 2 (different base types)
>> drivers/clk/bcm/clk-raspberrypi.c:365:56: sparse:    expected unsigned i=
nt parent
>> drivers/clk/bcm/clk-raspberrypi.c:365:56: sparse:    got restricted __le=
32 [usertype] parent
   drivers/clk/bcm/clk-raspberrypi.c:365:70: sparse: sparse: incorrect type=
 in argument 3 (different base types)
>> drivers/clk/bcm/clk-raspberrypi.c:365:70: sparse:    expected unsigned i=
nt id
>> drivers/clk/bcm/clk-raspberrypi.c:365:70: sparse:    got restricted __le=
32 [usertype] id
>> drivers/clk/bcm/clk-raspberrypi.c:369:31: sparse: sparse: restricted __l=
e32 degrades to integer
   drivers/clk/bcm/clk-raspberrypi.c:370:33: sparse: sparse: restricted __l=
e32 degrades to integer

vim +365 drivers/clk/bcm/clk-raspberrypi.c

   345	=

   346	static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
   347					       struct clk_hw_onecell_data *data)
   348	{
   349		struct rpi_firmware_get_clocks_response *clks;
   350		size_t clks_size =3D NUM_FW_CLKS * sizeof(*clks);
   351		int ret;
   352	=

   353		clks =3D devm_kzalloc(rpi->dev, clks_size, GFP_KERNEL);
   354		if (!clks)
   355			return -ENOMEM;
   356	=

   357		ret =3D rpi_firmware_property(rpi->firmware, RPI_FIRMWARE_GET_CLOCK=
S,
   358					    clks, clks_size);
   359		if (ret)
   360			return ret;
   361	=

   362		while (clks->id) {
   363			struct clk_hw *hw;
   364	=

 > 365			hw =3D raspberrypi_clk_register(rpi, clks->parent, clks->id);
   366			if (IS_ERR(hw))
   367				return PTR_ERR(hw);
   368	=

 > 369			data->hws[clks->id] =3D hw;
   370			data->num =3D clks->id + 1;
   371			clks++;
   372		}
   373	=

   374		return 0;
   375	}
   376	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3399056904114558744==--


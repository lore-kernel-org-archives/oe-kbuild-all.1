Content-Type: multipart/mixed; boundary="===============4239961554582136834=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/power/supply/mp2629_charger.c:522:9: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'.
Date: Fri, 09 Oct 2020 21:37:34 +0800
Message-ID: <20201009133734.GE8133@xsang-OptiPlex-9020>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4239961554582136834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   549738f15da0e5a00275977623be199fbbf7df50
commit: 3bc6d790c39dfc4539c36525e6bcb617abbae467 power: supply: Add support=
 for mps mp2629 battery charger
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
compiler: sh4-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +522 drivers/power/supply/mp2629_charger.c

3bc6d790c39dfc Saravanan Sekar 2020-05-26  508  =

3bc6d790c39dfc Saravanan Sekar 2020-05-26  509  static ssize_t batt_impedan=
ce_compensation_show(struct device *dev,
3bc6d790c39dfc Saravanan Sekar 2020-05-26  510  					   struct device_attri=
bute *attr,
3bc6d790c39dfc Saravanan Sekar 2020-05-26  511  					   char *buf)
3bc6d790c39dfc Saravanan Sekar 2020-05-26  512  {
3bc6d790c39dfc Saravanan Sekar 2020-05-26  513  	struct mp2629_charger *cha=
rger =3D dev_get_drvdata(dev->parent);
3bc6d790c39dfc Saravanan Sekar 2020-05-26  514  	unsigned int rval;
3bc6d790c39dfc Saravanan Sekar 2020-05-26  515  	int ret;
3bc6d790c39dfc Saravanan Sekar 2020-05-26  516  =

3bc6d790c39dfc Saravanan Sekar 2020-05-26  517  	ret =3D regmap_read(charge=
r->regmap, MP2629_REG_IMPEDANCE_COMP, &rval);
3bc6d790c39dfc Saravanan Sekar 2020-05-26  518  	if (ret)
3bc6d790c39dfc Saravanan Sekar 2020-05-26  519  		return ret;
3bc6d790c39dfc Saravanan Sekar 2020-05-26  520  =

3bc6d790c39dfc Saravanan Sekar 2020-05-26  521  	rval =3D (rval >> 4) * 10;
3bc6d790c39dfc Saravanan Sekar 2020-05-26 @522  	return sprintf(buf, "%d mo=
hm\n", rval);
3bc6d790c39dfc Saravanan Sekar 2020-05-26  523  }
3bc6d790c39dfc Saravanan Sekar 2020-05-26  524  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4239961554582136834==--


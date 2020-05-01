Content-Type: multipart/mixed; boundary="===============8094365036627510847=="
MIME-Version: 1.0
From: Julia Lawall <julia.lawall@inria.fr>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/4] counter: Internalize sysfs interface code (fwd)
Date: Fri, 01 May 2020 18:27:07 +0200
Message-ID: <alpine.DEB.2.21.2005011825030.2504@hadrien>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8094365036627510847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

Normally, the argument of kfree should not start with &.

julia

---------- Forwarded message ----------
Date: Fri, 1 May 2020 06:07:26 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild(a)lists.01.org
Cc: lkp(a)intel.com, Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 1/4] counter: Internalize sysfs interface code

CC: kbuild-all(a)lists.01.org
In-Reply-To: <d84f0bb3258d1664e90da64d75f787829c50a9bd.1588176662.git.vilhe=
lm.gray@gmail.com>
References: <d84f0bb3258d1664e90da64d75f787829c50a9bd.1588176662.git.vilhel=
m.gray@gmail.com>
TO: William Breathitt Gray <vilhelm.gray@gmail.com>
TO: jic23(a)kernel.org
CC: kamel.bouhara(a)bootlin.com
CC: gwendal(a)chromium.org
CC: alexandre.belloni(a)bootlin.com
CC: david(a)lechnology.com
CC: felipe.balbi(a)linux.intel.com
CC: fabien.lahoudere(a)collabora.com
CC: linux-iio(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-stm32(a)st-md-mailman.stormreply.com

Hi William,

I love your patch! Perhaps something to improve:

[auto build test WARNING on stm32/stm32-next]
[cannot apply to linus/master linux/master v5.7-rc3 next-20200430]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/William-Breathitt-Gray/Int=
roduce-the-Counter-character-device-interface/20200430-051734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git s=
tm32-next
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/counter/counter-core.c:26:1-6: ERROR: invalid free of structure =
field

# https://github.com/0day-ci/linux/commit/bdd9a6aa70c61f16dacaf057f0ce70fc2=
10b5ec9
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout bdd9a6aa70c61f16dacaf057f0ce70fc210b5ec9
vim +26 drivers/counter/counter-core.c

bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  20
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  21  static void counter_=
device_release(struct device *dev)
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  22  {
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  23  	struct counter_devi=
ce *const counter =3D dev_get_drvdata(dev);
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  24
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  25  	counter_sysfs_free(=
counter);
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29 @26  	kfree(&counter->dev=
);
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  27  	ida_simple_remove(&=
counter_ida, counter->id);
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  28  }
bdd9a6aa70c61f1 William Breathitt Gray 2020-04-29  29

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8094365036627510847==--


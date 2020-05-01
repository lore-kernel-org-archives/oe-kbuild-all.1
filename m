Content-Type: multipart/mixed; boundary="===============2840814790089993190=="
MIME-Version: 1.0
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 07/11] power: supply: core: tabularize HWMON temperature labels
Date: Fri, 01 May 2020 14:47:32 +0200
Message-ID: <20200501124732.vxnybog3k7smj7ms@earth.universe>
In-Reply-To: <20200420092209.GA25831@qmqm.qmqm.pl>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2840814790089993190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 20, 2020 at 11:22:09AM +0200, Micha=C5=82 Miros=C5=82aw wrote:
> On Tue, Apr 07, 2020 at 11:13:50AM -0700, Nick Desaulniers wrote:
> > On Sat, Apr 4, 2020 at 6:53 PM kbuild test robot <lkp@intel.com> wrot=
e:
> > >
> > > Hi "Micha=C5=82,
> > >
> > > I love your patch! Perhaps something to improve:
> > >
> > > [auto build test WARNING on power-supply/for-next]
> > > [also build test WARNING on hwmon/hwmon-next linus/master v5.6 next-2=
0200404]
> > > [if your patch is applied to the wrong git tree, please drop us a not=
e to help
> > > improve the system. BTW, we also suggest to use '--base' option to sp=
ecify the
> > > base tree in git format-patch, please see https://stackoverflow.com/a=
/37406982]
> > >
> > > url:    https://github.com/0day-ci/linux/commits/Micha-Miros-aw/exten=
sions-and-fixes/20200405-044024
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-pow=
er-supply.git for-next
> > > config: x86_64-randconfig-b002-20200405 (attached as .config)
> > > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project =
62f3a9650a9f289a07a5f480764fb655178c2334)
> > > reproduce:
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # save the attached .config to linux build tree
> > >         COMPILER=3Dclang make.cross ARCH=3Dx86_64
> > >
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> drivers/power/supply/power_supply_hwmon.o: warning: objtool: power=
_supply_hwmon_read_string() falls through to next function power_supply_hwm=
on_write()
> > =

> > I'm guessing this is from the unreachable:
> > https://github.com/0day-ci/linux/commit/b8b2d14ca46ca54257f55c9af58ea25=
695b9ee36
> > I'll need to play with this some more as I couldn't reproduce with a
> > simplified test case, but looks like a compiler bug.  Filed
> > https://github.com/ClangBuiltLinux/linux/issues/978 for me to track.
> =

> Hi,
> =

> For gcc this is bug 51513 [1]. This does not affect correctness of the
> code, so I wonder if we should/need be trying to work around it.
> =

> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D51513

Yes, we need to work around it for now. If I understand the situation
correctly, a simple workaround would be:

default:
    /*
     * unreachable, but not explicitly marked because this triggers
     * a compiler bug in gcc and llvm:
     *
     *  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D51513
     *  https://github.com/ClangBuiltLinux/linux/issues/978
     */
    break;

-- Sebastian

--===============2840814790089993190==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ2dBZEZpRUU3MllOQjBZL2kz
SnFlVlFUMk83WDg4ZzcrcG9GQWw2c0dtUUFDZ2tRMk83WDg4ZzcKK3BvKzRBLy9TNERtR3RFRVE3
OVh2WUN5OFU4VWJGRnZ0Qk9CRmQxNVArVTlucWxqcHZ2WjJib1JpN0lmMW92SgpIZmg5SDUyTmhz
THhUajhOZUVRb0NRTjJkOEpCZTVXeXc0SVNTSElDRG8vb1JMeVVRN2pUd1VhTzdLUmtPU0R0CkJn
M1kzWnJ5dksyL2MrcjJmaGxRdVZZYmczQURBTzdvdWZZTVhIUGpiZThBMkQyZFUzczdRODdkUFJJ
MGY1Tm4KTjNlU1d1WDVTUlRpeU1Cem9PR0s5OGZSajZTci9oV0R6bnU5WE1IZmFvcFlPQnVsRG5R
S1VHYTJFSWc0bnRTKwowYVlaMFp2U3lWOWlwbFR0dlNJUjBNTDhibDFZcVUraWlpY0hlWkN3Nmxm
UVc0QVg5RmJlMkh3MEhmaS9paHMvCkF1VTlDcHhobER1QnN5QzdkcUZ3eHZtODFXamhXejNwZndx
bDVzK2phaTFpYTJDQklydkpKdmUrQTZPNElTUEQKeXNuNlY1Z0ZXVndIQkdVTldWT0pMZzF1QXFW
M1RjdWpyVEZCZ1dscnVJRmxjRXdRZWVKUVNOMDFNQ211S0tSVgo5ZGZtcnBEbTNCSzZUVmhja2Qx
ZXp4TS9TamR5dFdRMjFBUzNCMGIyQlFWWlJtRlliVUJLNEwxczJNMm1lQWpVCkw2NEhJRWlSWWgr
dDVrQ1hybnJxYWlMdDd0VlJ0b2xGMVErd1RHVk94akdGd0VLQXpVNGc1cHBpMHp4Zml6SFkKOWlL
UkxnZEFOM2FnT1BhS0JIeERidXNhY0x1L1ZrNHFjMmI2WnNvNDZXM1hwMU4yQjdmVEkySk1LNW8y
ODN1SwpUY2l0bmY1d2FOazZZRlcrL1NOa1p3TmxMN1VETThKaGlzYzZsaTA2cDlwRHRYUi8xSFE9
Cj1mZFlOCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============2840814790089993190==--


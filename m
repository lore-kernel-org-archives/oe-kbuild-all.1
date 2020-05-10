Content-Type: multipart/mixed; boundary="===============2193144138982461437=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [jpirko-mlxsw:petrm_wip 32/35] net/sched/sch_api.c:2261:25: sparse: sparse: symbol 'rtm_tca_qevent_policy' was not declared. Should it be static?
Date: Mon, 11 May 2020 06:41:09 +0800
Message-ID: <202005110619.NnQdBArm%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2193144138982461437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/jpirko/linux_mlxsw petrm_wip
head:   db0a26918a58afafeae818f805209958ae3fd543
commit: 1ae7b8315f99699717ac512be7e6c4300539f44f [32/35] qevent wip
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 1ae7b8315f99699717ac512be7e6c4300539f44f
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> net/sched/sch_api.c:2261:25: sparse: sparse: symbol 'rtm_tca_qevent_poli=
cy' was not declared. Should it be static?
>> net/sched/sch_api.c:2270:25: sparse: sparse: symbol 'sch_qevent_opts_pol=
icy' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2193144138982461437==--


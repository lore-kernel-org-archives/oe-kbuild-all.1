Content-Type: multipart/mixed; boundary="===============1748802354209887494=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [habanaai:dev/ogabbay/gaudi 23/23] drivers/misc/habanalabs/gaudi/gaudi.c:440:20: sparse: sparse: symbol 'gaudi_queue_type' was not declared. Should it be static?
Date: Wed, 06 May 2020 00:23:39 +0800
Message-ID: <202005060022.IrYMjnU9%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1748802354209887494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/HabanaAI/linux.git dev/ogabbay/gaudi
head:   01f551e8186dbf88db2379f0476ce4aae0e3a291
commit: 01f551e8186dbf88db2379f0476ce4aae0e3a291 [23/23] add gaudi files
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 01f551e8186dbf88db2379f0476ce4aae0e3a291
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/misc/habanalabs/gaudi/gaudi.c:440:20: sparse: sparse: symbol 'ga=
udi_queue_type' was not declared. Should it be static?
>> drivers/misc/habanalabs/gaudi/gaudi.c:4493:6: sparse: sparse: symbol 'ga=
udi_add_end_of_cb_packets' was not declared. Should it be static?
>> drivers/misc/habanalabs/gaudi/gaudi.c:4527:6: sparse: sparse: symbol 'ga=
udi_update_eq_ci' was not declared. Should it be static?
>> drivers/misc/habanalabs/gaudi/gaudi.c:675:33: sparse: sparse: cast trunc=
ates bits from constant value (7ff8000000 becomes f8000000)
>> drivers/misc/habanalabs/gaudi/gaudi.c:2061:26: sparse: sparse: cast trun=
cates bits from constant value (7ffc4f4000 becomes fc4f4000)
>> drivers/misc/habanalabs/gaudi/gaudi.c:2065:25: sparse: sparse: cast trun=
cates bits from constant value (7ffc4f2000 becomes fc4f2000)
>> drivers/misc/habanalabs/gaudi/gaudi.c:2069:26: sparse: sparse: cast trun=
cates bits from constant value (7ffc494000 becomes fc494000)
>> drivers/misc/habanalabs/gaudi/gaudi.c:2073:25: sparse: sparse: cast trun=
cates bits from constant value (7ffc492000 becomes fc492000)
>> drivers/misc/habanalabs/gaudi/gaudi.c:2105:17: sparse: sparse: cast trun=
cates bits from constant value (7ffc800040 becomes fc800040)
   drivers/misc/habanalabs/gaudi/gaudi.c:2138:9: sparse: sparse: cast trunc=
ates bits from constant value (7ffc800040 becomes fc800040)
   drivers/misc/habanalabs/gaudi/gaudi.c:2212:23: sparse: sparse: cast trun=
cates bits from constant value (7ffc4f4000 becomes fc4f4000)
   drivers/misc/habanalabs/gaudi/gaudi.c:2216:22: sparse: sparse: cast trun=
cates bits from constant value (7ffc4f2000 becomes fc4f2000)
   drivers/misc/habanalabs/gaudi/gaudi.c:2244:17: sparse: sparse: cast trun=
cates bits from constant value (7ffc800040 becomes fc800040)
   drivers/misc/habanalabs/gaudi/gaudi.c:2313:23: sparse: sparse: cast trun=
cates bits from constant value (7ffc4f4000 becomes fc4f4000)
   drivers/misc/habanalabs/gaudi/gaudi.c:2317:22: sparse: sparse: cast trun=
cates bits from constant value (7ffc4f2000 becomes fc4f2000)
   drivers/misc/habanalabs/gaudi/gaudi.c:2347:17: sparse: sparse: cast trun=
cates bits from constant value (7ffc800040 becomes fc800040)
   drivers/misc/habanalabs/gaudi/gaudi.c:2418:23: sparse: sparse: cast trun=
cates bits from constant value (7ffc4f4000 becomes fc4f4000)
   drivers/misc/habanalabs/gaudi/gaudi.c:2422:22: sparse: sparse: cast trun=
cates bits from constant value (7ffc4f2000 becomes fc4f2000)
   drivers/misc/habanalabs/gaudi/gaudi.c:2452:17: sparse: sparse: cast trun=
cates bits from constant value (7ffc800040 becomes fc800040)
>> drivers/misc/habanalabs/gaudi/gaudi.c:2955:27: sparse: sparse: cast trun=
cates bits from constant value (7ff0000000 becomes f0000000)
   drivers/misc/habanalabs/gaudi/gaudi.c:6884:9: sparse: sparse: cast trunc=
ates bits from constant value (7ffc4f2000 becomes fc4f2000)

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1748802354209887494==--

